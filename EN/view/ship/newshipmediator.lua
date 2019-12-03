slot0 = class("NewShipMediator", import("..base.ContextMediator"))
slot0.ON_LOCK = "NewShipMediator:ON_LOCK"
slot0.ON_EXIT = "NewShipMediator:ON_EXIT"
slot0.ON_SKILLINFO = "NewShipMediator:ON_SKILLINFO"
slot0.ON_EVALIATION = "NewShipMediator:ON_EVALIATION"
slot0.ON_SKIP_BATCH = "NewShipMediator:ON_SKIP_BATCH"
slot0.OPEN = "NewShipMediator:OPEN"

slot0.register = function (slot0)
	slot0.fromRemould = slot0.contextData.fromRemould
	slot0.showTrans = slot0.contextData.ship.isRemoulded(slot1)

	slot0.viewComponent:setShip(slot1)
	slot0:bind(slot0.ON_EXIT, function (slot0, slot1, slot2)
		slot0:sendNotification(slot0.contextData.onExit or GAME.REMOVE_LAYERS, {
			context = getProxy(ContextProxy).getCurrentContext(slot3).getContextByMediator(slot4, slot0.class)
		})
	end)
	slot0:bind(slot0.ON_SKIP_BATCH, function (slot0, slot1, slot2)
		getProxy(BuildShipProxy):setSkipBatchBuildFlag(true)
		slot0:sendNotification(slot0.contextData.onExit or GAME.REMOVE_LAYERS, {
			context = getProxy(ContextProxy).getCurrentContext(slot3).getContextByMediator(slot4, slot0.class)
		})
	end)
	slot0:bind(slot0.ON_LOCK, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.UPDATE_LOCK, {
			ship_id_list = slot1,
			is_locked = slot2
		})
	end)
	slot0:bind(slot0.ON_SKILLINFO, function (slot0, slot1, slot2, slot3)
		slot0:addSubLayers(Context.New({
			mediator = SkillInfoMediator,
			viewComponent = SkillInfoLayer,
			data = {
				fromNewShip = 1,
				skillOnShip = slot3,
				skillId = slot1,
				unlockTip = slot2
			}
		}))
	end)
	slot0:bind(slot0.ON_EVALIATION, function (slot0, slot1)
		slot0:sendNotification(GAME.FETCH_EVALUATION, slot1)
	end)
	slot0:sendNotification(slot0.OPEN, {})
end

slot0.listNotificationInterests = function (slot0)
	return {
		GAME.UPDATE_LOCK_DONE,
		GAME.FETCH_EVALUATION_DONE
	}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.UPDATE_LOCK_DONE then
		slot0.viewComponent:UpdateLockButton(slot3:GetLockState())
		slot0.viewComponent:updateShip(slot3)
	elseif slot2 == GAME.FETCH_EVALUATION_DONE then
		if slot0.fromRemould then
			return
		end

		slot0:addSubLayers(Context.New({
			mediator = ShipEvaluationMediator,
			viewComponent = ShipEvaluationLayer,
			data = {
				groupId = slot3,
				showTrans = slot0.showTrans
			}
		}))
	end
end

slot0.remove = function (slot0)
	if slot0.contextData.quitCallBack then
		slot0.contextData.quitCallBack(slot0.contextData.ship)
	end
end

return slot0
