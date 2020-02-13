class("ReturnAwardOPCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if not getProxy(ActivityProxy):getActivityById(slot1:getBody().activity_id) or slot4:isEnd() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		activity_id = slot2.activity_id,
		cmd = slot2.cmd or 0,
		arg1 = slot2.arg1 or 0,
		arg2 = slot2.arg2 or 0
	}, 11203, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			for slot5, slot6 in ipairs(slot0.award_list) do
				table.insert(slot1, slot7)
				slot0:sendNotification(GAME.ADD_ITEM, Item.New({
					type = slot6.type,
					id = slot6.id,
					count = slot6.number
				}))
			end

			if slot1.cmd == ActivityConst.RETURN_AWARD_OP_ACTIVTION then
				slot2.data1 = 1
			elseif slot1.cmd == ActivityConst.RETURN_AWARD_OP_GET_RETRUNERS then
				slot2 = {}

				for slot6, slot7 in ipairs(slot0.return_user_list) do
					table.insert(slot2, Returner.New(slot7))
				end

				slot2:setClientList(slot2)
			elseif slot1.cmd == ActivityConst.RETURN_AWARD_OP_GET_AWARD then
				table.insert(slot2.data1_list, slot1.arg1)
			elseif slot1.cmd == ActivityConst.RETURN_AWARD_OP_PUSH_UID then
				slot2.data2_list[1] = 1

				pg.TipsMgr.GetInstance():ShowTips(i18n("returner_push_success"))
			elseif slot1.cmd == ActivityConst.RETURN_AWARD_OP_ACCEPT_TASK then
			elseif slot1.cmd == ActivityConst.RETURN_AWARD_OP_SET_RETRUNER then
				slot2.data2 = slot1.arg1

				pg.TipsMgr.GetInstance():ShowTips(i18n("return_award_bind_success"))
			elseif slot1.cmd == ActivityConst.RETURN_AWARD_OP_RETURNER_GET_AWARD then
				pg.activity_template_returnner[slot2.id].task_list.data4 = math.min(slot2.data4 + 1, #pg.activity_template_returnner[slot2.id].task_list)
			elseif slot1.cmd == ActivityConst.RETURN_AWARD_OP_MATCH then
				slot2.data2 = slot0.number[1]

				pg.TipsMgr.GetInstance():ShowTips(i18n("return_award_bind_success"))
			end

			slot3:updateActivity(slot3.updateActivity)
			slot0:sendNotification(GAME.RETURN_AWARD_OP_DONE, {
				awards = slot1,
				id = slot2.id,
				cmd = slot1.cmd
			})
		elseif ERROR_MESSAGE[slot0.result] then
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result])
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[9999] .. slot0.result)
		end
	end)
end

return class("ReturnAwardOPCommand", pm.SimpleCommand)
