slot0 = class("StartAnswerCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(26012, {
		act_id = slot2.activityId,
		id = slot2.id
	}, 26012, function (slot0)
		if slot0.result == 0 then
			_.each(slot0.question_list, function (slot0)
				table.insert(uv0, Answer.New(slot0.id, slot0.answer))
			end)
			uv0:sendNotification(GAME.ANSWER_START_DONE, {
				subject = uv1,
				answers = {}
			})

			return
		end

		pg.TipsMgr.GetInstance():ShowTips(errorTip("start_answer", slot0.result))
	end)
end

return slot0
