class("UpdateExerciseFleetCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().fleet.vanguardShips
	slot6 = slot1.getBody().callback
	slot9 = Clone(slot8)
	slot11 = getProxy(FleetProxy).getFleetById(slot10, 1)

	if table.getCount(slot1:getBody().fleet.mainShips) == 0 or table.getCount(slot4) == 0 then
		slot4 = slot11.vanguardShips
		slot5 = slot11.mainShips
		slot0.resetFleet = true
	end

	if table.getCount(slot4) > 3 or table.getCount(slot5) > 3 then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(18008, {
		vanguard_ship_id_list = slot4,
		main_ship_id_list = slot5
	}, 18009, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(MilitaryExerciseProxy)

			_.each(slot0, function (slot0)
				table.insert(slot0, slot0)
			end)
			_.each(slot1, function (slot0)
				table.insert(slot0, slot0)
			end)
			slot2:updateShips(slot2)
			slot1:updateExerciseFleet({})

			if slot1.updateExerciseFleet.resetFleet then
				slot3.resetFleet = nil

				slot3:sendNotification(GAME.EXERCISE_FLEET_RESET, slot2)
			end

			slot3:sendNotification(GAME.UPDATE_EXERCISE_FLEET_DONE, {
				oldFleet = slot4,
				newFleet = slot2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end

		if slot5 then
			slot5()
		end
	end)
end

return class("UpdateExerciseFleetCommand", pm.SimpleCommand)
