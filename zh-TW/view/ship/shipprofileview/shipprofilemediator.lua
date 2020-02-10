slot0 = class("ShipProfileMediator", import("...base.ContextMediator"))

function slot0.register(slot0)
	slot0.showTrans = slot0.contextData.showTrans
	slot0.groupId = slot0.contextData.groupId

	slot0.viewComponent:setShipGroup(getProxy(CollectionProxy):getShipGroup(slot0.groupId))
	slot0.viewComponent:setShowTrans(slot0.showTrans)
	slot0.viewComponent:setOwnedSkinList(getProxy(ShipSkinProxy):getSkinList())
	slot0:bind(ShipProfileScene.SHOW_SKILL_INFO, function (slot0, slot1, slot2)
		slot6.mediator = SkillInfoMediator
		slot6.viewComponent = SkillInfoLayer
		slot7.skillOnShip = slot2
		slot7.skillId = slot1
		slot6.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(ShipProfileScene.SHOW_EVALUATION, function (slot0)
		uv0:sendNotification(GAME.FETCH_EVALUATION, uv0.groupId)
	end)
	slot0:bind(ShipProfileScene.WEDDING_REVIEW, function (slot0, slot1)
		slot5.mediator = ProposeMediator
		slot5.viewComponent = ProposeUI
		slot6.group = slot1.group
		slot6.skinID = slot1.skinID
		slot5.data = {
			review = true
		}

		uv0:addSubLayers(Context.New({}))
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.FETCH_EVALUATION_DONE
	slot1[2] = CollectionProxy.GROUP_INFO_UPDATE
	slot1[3] = ShipSkinProxy.SHIP_SKINS_UPDATE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.FETCH_EVALUATION_DONE then
		slot7.mediator = ShipEvaluationMediator
		slot7.viewComponent = ShipEvaluationLayer
		slot8.groupId = slot1:getBody()
		slot8.showTrans = slot0.showTrans
		slot7.data = {}

		slot0:addSubLayers(Context.New({}))
	elseif slot2 == CollectionProxy.GROUP_INFO_UPDATE then
		if slot0.groupId == slot3 then
			slot0.viewComponent:setShipGroup(getProxy(CollectionProxy):getShipGroup(slot4))
			slot0.viewComponent:FlushHearts()
		end
	elseif slot2 == ShipSkinProxy.SHIP_SKINS_UPDATE then
		slot0.viewComponent:setOwnedSkinList(getProxy(ShipSkinProxy):getSkinList())
	end
end

return slot0
