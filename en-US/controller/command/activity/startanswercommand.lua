class("StartAnswerCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(26012, {
		act_id = slot1:getBody().activityId,
		id = slot1.getBody().id
	}, 26012, function (slot0)
		if slot0.result == 0 then
			_.each(slot0.question_list, function (slot0)
				table.insert(slot0, Answer.New(slot0.id, slot0.answer))
			end)
			slot0:sendNotification(GAME.ANSWER_START_DONE, {
				subject = {},
				answers = 
			})

			return
		end

		pg.TipsMgr.GetInstance():ShowTips(errorTip("start_answer", slot0.result))
	end)
end

return class("StartAnswerCommand", pm.SimpleCommand)
