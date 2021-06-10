slot0 = class("PutCommanderInCatteryCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.id
	slot6 = getProxy(CommanderProxy)

	if not (slot2.commanderId == 0) and not slot6:getCommanderById(slot4) then
		return
	end

	if not slot6:GetCommanderHome() then
		return
	end

	if not slot7:GetCatteryById(slot3) or not slot8:CanUse() then
		return
	end

	if not slot5 and slot8:ExistCommander() and slot8:GetCommanderId() == slot4 then
		return
	end

	if slot5 and not slot8:ExistCommander() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(25030, {
		slotidx = slot3,
		commander_id = slot4
	}, 25031, function (slot0)
		if slot0.result == 0 then
			if uv0 then
				uv2:UpdateCommanderLevelAndExp(uv1:GetCommanderId(), slot0)
				uv1:RemoveCommander()
				pg.TipsMgr.GetInstance():ShowTips(i18n("cattery_remove_commander_success"))
			else
				slot1 = false

				if uv1.id == 1 and not uv1:ExistCommander() and uv1:GetCalcExpTime() == 0 and uv3.level == 1 then
					slot1 = true
				end

				if uv1:ExistCommander() then
					uv2:UpdateCommanderLevelAndExp(uv1:GetCommanderId(), slot0)
				end

				uv1:AddCommander(uv4, slot0.time)

				if slot1 then
					uv3:ResetCatteryOP()
				end

				pg.TipsMgr.GetInstance():ShowTips(i18n("cattery_add_commander_success"))
			end

			uv2:sendNotification(GAME.PUT_COMMANDER_IN_CATTERY_DONE, {
				id = uv1.id
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
		end
	end)
end

function slot0.UpdateCommanderLevelAndExp(slot0, slot1, slot2)
	if slot2.commander_level > 0 then
		slot5 = getProxy(CommanderProxy)
		slot6 = slot5:getCommanderById(slot1)

		slot6:UpdateLevelAndExp(slot3, slot2.commander_exp)
		slot5:updateCommander(slot6)
	end
end

return slot0
