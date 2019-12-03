slot0 = class("SelectTechnologyMediator", import("..base.ContextMediator"))
slot0.ON_BLUEPRINT = "SelectTechnologyMediator:ON_BLUEPRINT"
slot0.ON_TECHNOLOGY = "SelectTechnologyMediator:ON_TECHNOLOGY"

slot0.register = function (slot0)
	slot0:bind(slot0.ON_TECHNOLOGY, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.TECHNOLOGY)
	end)
	slot0:bind(slot0.ON_BLUEPRINT, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPBLUEPRINT)
	end)
	slot0:bind(TechnologyConst.OPEN_TECHNOLOGY_TREE_SCENE, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.TECHNOLOGY_TREE_SCENE)
	end)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy).getData(slot1))
	slot0.viewComponent:notifyTechnology(slot2)
	slot0.viewComponent:notifyBlueprint(slot3)
	slot0.viewComponent:notifyFleet(getProxy(TechnologyNationProxy):getShowRedPointTag())
end

slot0.onTechnologyNotify = function ()
	slot2 = true

	if getProxy(TechnologyProxy).getActiveTechnology(slot0) then
		slot2 = slot1:isFinished()
	end

	return slot2
end

slot0.onBlueprintNotify = function ()
	slot0 = getProxy(TechnologyProxy)
	slot1 = slot0:getBluePrints()

	if not slot0:getBuildingBluePrint() then
		return _.any(_.values(slot1), function (slot0)
			return slot0:getState() == ShipBluePrint.STATE_LOCK and slot0:isFinishPrevTask()
		end)
	else
		if slot2:getState() == ShipBluePrint.STATE_DEV_FINISHED then
			return true
		end

		slot3 = false

		return _.any(slot2:getTaskIds(), function (slot0)
			return slot0:getTaskStateById(slot0) == (ShipBluePrint.TASK_STATE_OPENING and getProxy(TaskProxy):isFinishPrevTasks(slot0)) or slot0:getTaskStateById() == ShipBluePrint.TASK_STATE_ACHIEVED
		end)
	end

	return false
end

slot0.listNotificationInterests = function (slot0)
	return {
		PlayerProxy.UPDATED
	}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	end
end

return slot0
