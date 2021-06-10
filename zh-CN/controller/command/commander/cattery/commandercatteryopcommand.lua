slot0 = class("CommanderCatteryOPCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot4 = getProxy(CommanderProxy):GetCommanderHome()

	pg.ConnectionMgr.GetInstance():Send(25028, {
		type = slot1:getBody().op
	}, 25029, function (slot0)
		if slot0.result == 0 then
			for slot5, slot6 in ipairs(slot0.awards) do
				slot7 = Item.New({
					type = slot6.type,
					id = slot6.id,
					count = slot6.number
				})

				table.insert({}, slot7)
				uv0:sendNotification(GAME.ADD_ITEM, slot7)
			end

			for slot6, slot7 in pairs(uv1:GetCatteries()) do
				slot7:ClearOP(uv2)
			end

			slot3 = 0
			slot4 = 0

			if uv2 == 1 then
				uv1:IncCleanValue()
			elseif uv2 == 2 then
				slot3 = uv1:GetFeedCommanderExp()

				uv1:AddCommanderExpByFeed()
			elseif uv2 == 3 then
				-- Nothing
			end

			uv1:UpdateExpAndLevel(slot0.level, slot0.exp)
			uv0:sendNotification(GAME.COMMANDER_CATTERY_OP_DONE, {
				awards = slot1,
				cmd = uv2,
				commanderExp = slot3,
				homeExp = Clone(uv1).level < uv1.level and slot5:GetNextLevelExp() - slot5.exp + uv1.exp or uv1.exp - slot5.exp
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
		end
	end)
end

return slot0
