slot0 = class("HitMonsterNianMediator", import("..base.ContextMediator"))
slot0.ON_HIT = "HitMonsterNianMediator:ON_HIT"
slot0.ON_FAKE_HIT = "HitMonsterNianMediator:ON_FAKE_HIT"

function slot0.register(slot0)
	slot0.viewComponent:setActivity(slot2)
	slot0:bind(slot0.ON_HIT, function (slot0)
		if not slot0 or slot0:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips("common_activity_end")

			return
		end

		slot1:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = slot0.id
		})
	end)
	slot0:bind(slot0.ON_FAKE_HIT, function ()
		slot0 = math.random(1, 2)
		slot0.viewComponent.activityVO.data3 = slot0.viewComponent.activityVO.data3 + slot0
		slot0.viewComponent.activityVO.data2 = slot0.viewComponent.activityVO.data2 - 1

		slot0.viewComponent:setActivity(slot0.viewComponent.activityVO)
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		ActivityProxy.ACTIVITY_UPDATED,
		ActivityProxy.ACTIVITY_HITMONSTER_SHOW_AWARDS,
		ActivityProxy.ACTIVITY_OPERATION_ERRO
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == ActivityProxy.ACTIVITY_UPDATED then
		if slot3 and slot3:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN then
			slot0.viewComponent:setActivity(slot3)
		end
	elseif slot2 == ActivityProxy.ACTIVITY_HITMONSTER_SHOW_AWARDS then
		function slot0.contextData.onAaward()
			slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot1.awards)
		end

		if slot3.callback then
			onNextTick(slot3.callback)
		end
	elseif slot2 == ActivityProxy.ACTIVITY_OPERATION_ERRO and getProxy(ActivityProxy):getActivityById(slot3.actId).getConfig(slot4, "type") == ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN then
		pg.TipsMgr.GetInstance():ShowTips(i18n("activity_hit_monster_erro", slot3.code))
	end
end

return slot0
