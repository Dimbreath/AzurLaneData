slot0 = class("SubmitAnswerCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(26014, {
		act_id = slot2.activityId,
		id = slot2.id,
		answers = slot2.answers,
		score = slot2.score
	}, 26015, function (slot0)
		if slot0.result == 0 then
			slot2 = getProxy(AnswerProxy)
			slot3 = slot2:getScore(uv1)

			slot2:setScore(uv1, math.max(uv2, slot3 or 0))
			uv0:sendNotification(GAME.ANSWER_SUBMIT_DONE, {
				success = true,
				subject = uv1,
				score = uv2,
				drops = _.map(slot0.drop_list, function (slot0)
					if ({
						type = slot0.type,
						id = slot0.id,
						count = slot0.number
					}).type ~= DROP_TYPE_SHIP then
						uv0:sendNotification(GAME.ADD_ITEM, Item.New(slot1))
					end

					return slot1
				end),
				virgin = not slot3
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("submit_answer", slot0.result))
			uv0:sendNotification(GAME.ANSWER_SUBMIT_DONE, {
				success = false
			})
		end
	end)
end

return slot0
