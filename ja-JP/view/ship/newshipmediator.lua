slot0 = class("NewShipMediator", import("..base.ContextMediator"))
slot0.ON_LOCK = "NewShipMediator:ON_LOCK"
slot0.ON_EXIT = "NewShipMediator:ON_EXIT"
slot0.ON_SKILLINFO = "NewShipMediator:ON_SKILLINFO"
slot0.ON_EVALIATION = "NewShipMediator:ON_EVALIATION"
slot0.ON_SKIP_BATCH = "NewShipMediator:ON_SKIP_BATCH"
slot0.OPEN = "NewShipMediator:OPEN"

function slot0.register(slot0)
	slot1 = slot0.contextData.ship
	slot0.fromRemould = slot0.contextData.fromRemould
	slot0.showTrans = slot1:isRemoulded()

	slot0.viewComponent:setShip(slot1)
	slot0:bind(uv0.ON_EXIT, function (slot0, slot1, slot2)
		slot6 = uv0
		slot9.context = getProxy(ContextProxy):getCurrentContext():getContextByMediator(uv0.class)

		slot6.sendNotification(slot6, uv0.contextData.onExit or GAME.REMOVE_LAYERS, {})
	end)
	slot0:bind(uv0.ON_SKIP_BATCH, function (slot0, slot1, slot2)
		getProxy(BuildShipProxy):setSkipBatchBuildFlag(true)

		slot6 = uv0
		slot9.context = getProxy(ContextProxy):getCurrentContext():getContextByMediator(uv0.class)

		slot6.sendNotification(slot6, uv0.contextData.onExit or GAME.REMOVE_LAYERS, {})
	end)
	slot0:bind(uv0.ON_LOCK, function (slot0, slot1, slot2)
		slot6.ship_id_list = slot1
		slot6.is_locked = slot2

		uv0:sendNotification(GAME.UPDATE_LOCK, {})
	end)
	slot0:bind(uv0.ON_SKILLINFO, function (slot0, slot1, slot2, slot3)
		slot7.mediator = SkillInfoMediator
		slot7.viewComponent = SkillInfoLayer
		slot8.skillOnShip = slot3
		slot8.skillId = slot1
		slot8.unlockTip = slot2
		slot7.data = {
			fromNewShip = 1
		}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.ON_EVALIATION, function (slot0, slot1)
		uv0:sendNotification(GAME.FETCH_EVALUATION, slot1)
	end)
	slot0:sendNotification(uv0.OPEN, {})
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.UPDATE_LOCK_DONE
	slot1[2] = GAME.FETCH_EVALUATION_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.UPDATE_LOCK_DONE then
		slot0.viewComponent:UpdateLockButton(slot3:GetLockState())
		slot0.viewComponent:updateShip(slot3)
	elseif slot2 == GAME.FETCH_EVALUATION_DONE then
		if slot0.fromRemould then
			return
		end

		slot7.mediator = ShipEvaluationMediator
		slot7.viewComponent = ShipEvaluationLayer
		slot8.groupId = slot3
		slot8.showTrans = slot0.showTrans
		slot7.data = {}

		slot0:addSubLayers(Context.New({}))
	end
end

function slot0.remove(slot0)
	if slot0.contextData.quitCallBack then
		slot0.contextData.quitCallBack(slot0.contextData.ship)
	end
end

return slot0
