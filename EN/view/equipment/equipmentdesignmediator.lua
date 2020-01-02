slot0 = class("EquipmentDesignMediator", import("..base.ContextMediator"))
slot0.MAKE_EQUIPMENT = "EquipmentDesignMediator:MAKE_EQUIPMENT"

function slot0.register(slot0)
	slot0.bagProxy = getProxy(BagProxy)

	slot0.viewComponent:setItems(slot0.bagProxy:getData())

	slot0.equipmentProxy = getProxy(EquipmentProxy)

	slot0.viewComponent:setCapacity(slot1)

	slot0.playerProxy = getProxy(PlayerProxy)

	slot0.viewComponent:setPlayer(slot2)
	slot0:bind(slot0.MAKE_EQUIPMENT, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.COMPOSITE_EQUIPMENT, {
			id = slot1,
			count = slot2
		})
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.COMPOSITE_EQUIPMENT_DONE,
		BagProxy.ITEM_UPDATED,
		PlayerProxy.UPDATED,
		EquipmentProxy.EQUIPMENT_ADDED,
		EquipmentProxy.EQUIPMENT_UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.COMPOSITE_EQUIPMENT_DONE then
		slot4 = slot3.equipment

		slot0.viewComponent:filter(slot0.contextData.index or 1)
		pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_newEquipLayer_getNewEquip", slot0.viewComponent.filter .. " X" .. slot3.count))
	elseif slot2 == BagProxy.ITEM_UPDATED then
		slot0.viewComponent:setItems(slot0.bagProxy:getData())
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot0.playerProxy:getData())
	elseif slot2 == EquipmentProxy.EQUIPMENT_ADDED or slot2 == EquipmentProxy.EQUIPMENT_UPDATED then
		slot0.viewComponent:setCapacity(slot0.equipmentProxy:getCapacity())
	end
end

return slot0
