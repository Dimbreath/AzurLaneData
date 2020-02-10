slot0 = class("AnswerMediator", import("..base.ContextMediator"))
slot0.ANSWER_START = "event answer start"
slot0.ANSWER_SUBMIT = "event answer submit"

function slot0.register(slot0)
	slot0:bind(uv0.ANSWER_START, function (slot0, slot1, slot2)
		slot6.activityId = slot1
		slot6.id = slot2

		uv0:sendNotification(GAME.ANSWER_START, {})
	end)
	slot0:bind(uv0.ANSWER_SUBMIT, function (slot0, slot1, slot2, slot3, slot4)
		slot8.activityId = slot1
		slot8.id = slot2
		slot8.answers = slot3
		slot8.score = slot4

		uv0:sendNotification(GAME.ANSWER_SUBMIT, {})
	end)
	slot0.viewComponent:setActivity(getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ANSWER))
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.ANSWER_START_DONE
	slot1[2] = GAME.ANSWER_SUBMIT_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.ANSWER_START_DONE then
		slot0.viewComponent:startProcess(slot3.subject, slot3.answers)
	elseif slot2 == GAME.ANSWER_SUBMIT_DONE then
		if slot3.success then
			slot4 = nil
			slot4 = coroutine.create(function ()
				uv0.viewComponent:displayResult(uv1.subject, uv1.score, uv2)
				coroutine.yield()

				if #uv1.drops > 0 then
					uv0.viewComponent:emit(BaseUI.ON_ACHIEVE, uv1.drops, uv2)
					coroutine.yield()
				end

				if uv1.virgin then
					if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ANSWER):getConfig("config_client").plot[table.getCount(getProxy(AnswerProxy).scores) + 1] then
						pg.StoryMgr.GetInstance():Play(slot4)
					end
				end
			end)

			function ()
				slot0, slot1 = coroutine.resume(uv0)
			end()

			return
		end

		slot0.viewComponent:emit(BaseUI.ON_BACK)
	end
end

return slot0
