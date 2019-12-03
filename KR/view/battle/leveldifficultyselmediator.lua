slot0 = class("LevelDifficultySelMediator", import("..base.ContextMediator"))
slot0.GO_LEVEL_SENCE = "LevelDifficultySelMediator:GO_LEVEL_SENCE"

slot0.register = function (slot0)
	slot0.viewComponent:setMaps(getProxy(ChapterProxy).getMaps(slot1))
	slot0.viewComponent:setPlayerVO(slot3)

	slot0.activityProxy = getProxy(ActivityProxy)

	slot0:bind(slot0.GO_LEVEL_SENCE, function (slot0, slot1)
		if not slot0.activityProxy:getActivityById(slot0.contextData.activityId) or slot2:isEnd() then
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			arg2 = 0,
			activity_id = slot2.id,
			arg1 = slot1
		})
	end)
end

slot0.removeContext = function (slot0)
	if getProxy(ContextProxy):getContextByMediator(ActivityMediator) or slot1:getContextByMediator(MainUIMediator) then
		slot2:removeChild(slot1:getContextByMediator(LevelDifficultySelMediator))
	end
end

slot0.listNotificationInterests = function (slot0)
	return {
		ActivityProxy.ACTIVITY_OPERATION_DONE
	}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == ActivityProxy.ACTIVITY_OPERATION_DONE then
		slot6 = getProxy(ChapterProxy).getUnlockActMapBytype(slot4, slot0.activityProxy:getActivityById(slot3).data1, slot0.activityProxy.getActivityById(slot3).id)

		if getProxy(ContextProxy):getContextByMediator(LevelMediator2) then
			slot0.viewComponent:emit(BaseUI.ON_CLOSE)
		else
			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				mapIdx = slot6.id
			})
			slot0:removeContext()
		end
	end
end

return slot0
