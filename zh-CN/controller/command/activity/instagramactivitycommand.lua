class("InstagramActivityCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	print("cmd:", slot2.cmd, "arg1:", slot2.arg1, "arg2:", slot2.arg2, "activity_id:", slot2.activity_id)

	slot3 = getProxy(InstagramProxy)

	if ActivityConst.INSTAGRAM_OP_ACTIVE == slot2.cmd then
		slot5 = getProxy(ActivityProxy).getActivityById(slot4, slot2.activity_id)

		pg.ConnectionMgr.GetInstance():Send(11202, {
			cmd = 1,
			activity_id = slot2.activity_id,
			arg1 = slot2.arg1 or 0,
			arg2 = slot2.arg2 or 0,
			arg3 = slot2.arg3 or 0
		}, 11203, function (slot0)
			if slot0.result == 0 then
				slot1 = Instagram.New(slot0.ins_message)

				slot0:UpdateMessage(slot1)
				slot1:UpdateActiveCnt()
				slot1.UpdateActiveCnt:updateActivity(slot1)
				slot1.UpdateActiveCnt:sendNotification(GAME.ACTIVITY_BE_UPDATED, {
					activity = slot1
				})
				slot1.UpdateActiveCnt:sendNotification(GAME.ACT_INSTAGRAM_OP_DONE, {
					cmd = slot4.cmd,
					id = slot4.arg1
				})

				if slot4.callback then
					slot4.callback()
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
			end
		end)

		return
	end

	if ActivityConst.INSTAGRAM_OP_LIKE == slot2.cmd or ActivityConst.INSTAGRAM_OP_MARK_READ == slot2.cmd or ActivityConst.INSTAGRAM_OP_UPDATE == slot2.cmd or ActivityConst.INSTAGRAM_OP_SHARE == slot2.cmd then
		pg.ConnectionMgr.GetInstance():Send(11701, {
			id = slot2.arg1,
			cmd = slot2.cmd
		}, 11702, function (slot0)
			if slot0.result == 0 then
				if ActivityConst.INSTAGRAM_OP_MARK_READ == slot0.cmd then
					slot1 = slot1:GetMessageById(slot0.arg1)
					slot1.isRead = true

					slot1:UpdateMessage(slot1)
				elseif ActivityConst.INSTAGRAM_OP_SHARE ~= slot0.cmd then
					slot1:UpdateMessage(Instagram.New(slot0.data))
				end

				slot2:sendNotification(GAME.ACT_INSTAGRAM_OP_DONE, {
					cmd = slot0.cmd,
					id = slot0.arg1
				})

				if slot0.callback then
					slot0.callback()
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
			end
		end)
	elseif ActivityConst.INSTAGRAM_OP_COMMENT == slot2.cmd then
		pg.ConnectionMgr.GetInstance():Send(11703, {
			id = slot2.arg1,
			discuss = slot2.arg2,
			index = slot2.arg3
		}, 11704, function (slot0)
			if slot0.result == 0 then
				slot0:UpdateMessage(slot1)
				slot1:sendNotification(GAME.ACT_INSTAGRAM_OP_DONE, {
					cmd = slot2.cmd,
					id = slot2.arg1
				})

				if slot1.sendNotification.callback then
					slot2.callback()
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
			end
		end)
	end
end

return class("InstagramActivityCommand", pm.SimpleCommand)
