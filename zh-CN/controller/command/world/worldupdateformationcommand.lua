class("WorldUpdateFormationCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot5 = getProxy(WorldProxy).GetWorld(slot3).GetActiveMap(slot4)

	pg.ConnectionMgr.GetInstance():Send(33405, {
		fleet_list = _.map(slot1:getBody().list, function (slot0)
			print(slot1)

			return {
				group_id = slot0.fleetId,
				ship_id = _.map(slot0.ships, function (slot0)
					return slot0.id
				end)
			}
		end)
	}, 33406, function (slot0)
		if slot0.result == 0 then
			_.each(slot0.list, function (slot0)
				slot1 = slot0:GetFleet(slot0.fleetId)
				slot5 = {}

				_.each(slot2, function (slot0)
					slot0[slot0.id] = true
				end)
				_.each(slot1:GetShips(true), function (slot0)
					if not slot0[slot0.id] then
						slot1:AddShip(slot0)
					end
				end)
				_.each(slot0:GetPort().GetShips(slot3), function (slot0)
					if slot0[slot0.id] then
						slot0[slot0.id] = slot1:RemoveShip(slot0.id)
					end
				end)
				_.each(slot4, function (slot0)
					if slot0.id ~= slot0.id then
						_.each(slot0:GetShips(true), function (slot0)
							if slot0[slot0.id] then
								slot0[slot0.id] = slot1:RemoveShip(slot0.id)
							end
						end)
					end
				end)
				slot1:UpdateShips(slot2)
				slot1:VerifyFormation()
				slot1:AddLog(WorldLog.TypeEditFleet, {
					fleet = slot1.id
				})
			end)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("world_update_formation_err", slot0.result))
		end

		if slot0.callback then
			slot0.callback()
		end
	end)
end

return class("WorldUpdateFormationCommand", pm.SimpleCommand)
