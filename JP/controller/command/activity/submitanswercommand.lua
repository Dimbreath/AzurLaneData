class("SubmitAnswerCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(26014, {
		act_id = slot2.activityId,
		id = slot2.id,
		answers = slot2.answers,
		score = slot2.score
	}, 26015, function (slot0)
		if slot0.result == 0 then
			slot2 = getProxy(AnswerProxy)

			slot2:setScore(_.map(slot0.drop_list, function (slot0)
				if ({
					type = slot0.type,
					id = slot0.id,
					count = slot0.number
				})["type"] ~= DROP_TYPE_SHIP then
					slot0:sendNotification(GAME.ADD_ITEM, Item.New(slot1))
				end

				return slot1
			end), math.max(slot2, slot2:getScore(slot1) or 0))
			slot0:sendNotification(GAME.ANSWER_SUBMIT_DONE, {
				success = true,
				subject = slot1,
				score = slot2,
				drops = slot1,
				virgin = not slot2.getScore(slot1)
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("submit_answer", slot0.result))
			slot0:sendNotification(GAME.ANSWER_SUBMIT_DONE, {
				success = false
			})
		end
	end)
end

return class("SubmitAnswerCommand", pm.SimpleCommand)
