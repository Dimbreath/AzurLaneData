slot0 = class("SubmitAnswerCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot10.act_id = slot2.activityId
	slot10.id = slot2.id
	slot10.answers = slot2.answers
	slot10.score = slot2.score

	pg.ConnectionMgr.GetInstance():Send(26014, {}, 26015, function (slot0)
		if slot0.result == 0 then
			slot2 = getProxy(AnswerProxy)
			slot3 = slot2:getScore(uv1)
			slot8 = math.max

			slot2.setScore(slot2, uv1, slot8(uv2, slot3 or 0))

			slot8.subject = uv1
			slot8.score = uv2
			slot8.drops = _.map(slot0.drop_list, function (slot0)
				slot1.type = slot0.type
				slot1.id = slot0.id
				slot1.count = slot0.number

				if ({})["type"] ~= DROP_TYPE_SHIP then
					uv0:sendNotification(GAME.ADD_ITEM, Item.New(slot1))
				end

				return slot1
			end)
			slot8.virgin = not slot3

			uv0:sendNotification(GAME.ANSWER_SUBMIT_DONE, {
				success = true
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
