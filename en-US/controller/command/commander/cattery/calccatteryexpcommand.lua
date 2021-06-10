slot0 = class("CalcCatteryExpCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot5 = slot1:getBody().isPeriod

	if not getProxy(CommanderProxy):GetCommanderHome() then
		return
	end

	for slot11, slot12 in pairs(slot4:GetCatteries()) do
		if slot12:ExistCommander() then
			slot0:CalcExp(slot12, slot4:getConfig("exp_number"))
		end
	end

	slot0:sendNotification(GAME.CALC_CATTERY_EXP_DONE)
end

function slot0.CalcExp(slot0, slot1, slot2)
	slot5 = nil

	if (not isPeriod and pg.TimeMgr.GetInstance():GetServerTime() - slot1:GetCalcExpTime() or 3600) > 0 then
		slot0:AddCommanderExp(slot1:GetCommanderId(), slot2 / 3600 * slot5)
		slot1:UpdateCalcExpTime(slot4)
	end
end

function slot0.AddCommanderExp(slot0, slot1, slot2)
	slot3 = getProxy(CommanderProxy)
	slot4 = slot3:getCommanderById(slot1)

	slot4:addExp(math.floor(slot2))
	slot3:updateCommander(slot4)
end

return slot0
