slot0 = class("ReturnAwardOPCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
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
			for slot5, slot6 in ipairs(slot0.award_list) do
				slot7 = {
					type = slot6.type,
					id = slot6.id,
					count = slot6.number
				}

				table.insert({}, slot7)
				uv0:sendNotification(GAME.ADD_ITEM, Item.New(slot7))
			end

			if uv1.cmd == ActivityConst.RETURN_AWARD_OP_ACTIVTION then
				uv2.data1 = 1
			elseif uv1.cmd == ActivityConst.RETURN_AWARD_OP_GET_RETRUNERS then
				slot2 = {}

				for slot6, slot7 in ipairs(slot0.return_user_list) do
					table.insert(slot2, Returner.New(slot7))
				end

				uv2:setClientList(slot2)
			elseif uv1.cmd == ActivityConst.RETURN_AWARD_OP_GET_AWARD then
				table.insert(uv2.data1_list, uv1.arg1)
			elseif uv1.cmd == ActivityConst.RETURN_AWARD_OP_PUSH_UID then
				uv2.data2_list[1] = 1

				pg.TipsMgr.GetInstance():ShowTips(i18n("returner_push_success"))
			elseif uv1.cmd == ActivityConst.RETURN_AWARD_OP_ACCEPT_TASK then
				-- Nothing
			elseif uv1.cmd == ActivityConst.RETURN_AWARD_OP_SET_RETRUNER then
				uv2.data2 = uv1.arg1

				pg.TipsMgr.GetInstance():ShowTips(i18n("return_award_bind_success"))
			elseif uv1.cmd == ActivityConst.RETURN_AWARD_OP_RETURNER_GET_AWARD then
				uv2.data4 = math.min(uv2.data4 + 1, #pg.activity_template_returnner[uv2.id].task_list)
			elseif uv1.cmd == ActivityConst.RETURN_AWARD_OP_MATCH then
				uv2.data2 = slot0.number[1]

				pg.TipsMgr.GetInstance():ShowTips(i18n("return_award_bind_success"))
			end

			uv3:updateActivity(uv2)
			uv0:sendNotification(GAME.RETURN_AWARD_OP_DONE, {
				awards = slot1,
				id = uv2.id,
				cmd = uv1.cmd
			})
		elseif ERROR_MESSAGE[slot0.result] then
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result])
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[9999] .. slot0.result)
		end
	end)
end

return slot0
