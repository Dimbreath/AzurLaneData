slot0 = class("EquipmentDesignMediator", import("..base.ContextMediator"))
slot0.MAKE_EQUIPMENT = "EquipmentDesignMediator:MAKE_EQUIPMENT"

function slot0.register(slot0)
	slot0.bagProxy = getProxy(BagProxy)

	slot0.viewComponent:setItems(slot0.bagProxy:getData())

	slot0.equipmentProxy = getProxy(EquipmentProxy)

	slot0.viewComponent:setCapacity(slot0.equipmentProxy:getCapacity())

	slot0.playerProxy = getProxy(PlayerProxy)

	slot0.viewComponent:setPlayer(slot0.playerProxy:getData())
	slot0:bind(uv0.MAKE_EQUIPMENT, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.count = slot2

		uv0:sendNotification(GAME.COMPOSITE_EQUIPMENT, {})
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.COMPOSITE_EQUIPMENT_DONE
	slot1[2] = BagProxy.ITEM_UPDATED
	slot1[3] = PlayerProxy.UPDATED
	slot1[4] = EquipmentProxy.EQUIPMENT_ADDED
	slot1[5] = EquipmentProxy.EQUIPMENT_UPDATED

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.COMPOSITE_EQUIPMENT_DONE then
		slot6 = slot0.viewComponent

		slot6.filter(slot6, slot0.contextData.index or 1)
		pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_newEquipLayer_getNewEquip", slot3.equipment.config.name .. " X" .. slot3.count))
	elseif slot2 == BagProxy.ITEM_UPDATED then
		slot0.viewComponent:setItems(slot0.bagProxy:getData())
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot0.playerProxy:getData())
	elseif slot2 == EquipmentProxy.EQUIPMENT_ADDED or slot2 == EquipmentProxy.EQUIPMENT_UPDATED then
		slot0.viewComponent:setCapacity(slot0.equipmentProxy:getCapacity())
	end
end

return slot0
