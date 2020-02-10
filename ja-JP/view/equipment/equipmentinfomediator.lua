slot0 = class("EquipmentInfoMediator", import("..base.ContextMediator"))
slot0.TYPE_DEFAULT = 1
slot0.TYPE_SHIP = 2
slot0.TYPE_REPLACE = 3
slot0.TYPE_DISPLAY = 4
slot0.SHOW_UNIQUE = {
	1,
	2,
	3,
	4
}
slot0.ON_DESTROY = "EquipmentInfoMediator:ON_DESTROY"
slot0.ON_EQUIP = "EquipmentInfoMediator:ON_EQUIP"
slot0.ON_INTENSIFY = "EquipmentInfoMediator.ON_INTENSIFY"
slot0.ON_CHANGE = "EquipmentInfoMediator.ON_CHANGE"
slot0.ON_UNEQUIP = "EquipmentInfoMediator:ON_UNEQUIP"
slot0.ON_REVERT = "EquipmentInfoMediator:ON_REVERT"
slot0.ON_MOVE = "EquipmentInfoMediator:ON_MOVE"

function slot0.register(slot0)
	if getProxy(ContextProxy):getCurrentContext().scene == SCENE.EQUIPSCENE then
		slot0.viewComponent.fromEquipmentView = true
	end

	slot0.viewComponent:setRevertItem(getProxy(BagProxy):getItemById(Item.REVERT_EQUIPMENT_ID))
	slot0:bind(uv0.ON_DESTROY, function (slot0, slot1)
		slot7[1] = uv0.contextData.equipmentId
		slot7[2] = slot1
		slot6[1] = {}
		slot5.equipments = {}

		uv0:sendNotification(GAME.DESTROY_EQUIPMENTS, {})
	end)
	slot0:bind(uv0.ON_EQUIP, function (slot0)
		if uv0.contextData.oldShipId then
			slot3, slot4 = Ship.canModifyShip(getProxy(BayProxy):getShipById(uv0.contextData.oldShipId))

			if not slot3 then
				pg.TipsMgr.GetInstance():ShowTips(slot4)
			else
				if uv0.viewComponent.fromEquipmentView then
					uv0:sendNotification(EquipmentMediator.NO_UPDATE)
				end

				slot8.equipmentId = uv0.contextData.equipmentId
				slot8.shipId = uv0.contextData.shipId
				slot8.pos = uv0.contextData.pos
				slot8.oldShipId = uv0.contextData.oldShipId
				slot8.oldPos = uv0.contextData.oldPos

				uv0:sendNotification(GAME.EQUIP_FROM_SHIP, {})
			end
		else
			if uv0.viewComponent.fromEquipmentView then
				uv0:sendNotification(EquipmentMediator.NO_UPDATE)
			end

			slot4.equipmentId = uv0.contextData.equipmentId
			slot4.shipId = uv0.contextData.shipId
			slot4.pos = uv0.contextData.pos

			uv0:sendNotification(GAME.EQUIP_TO_SHIP, {})
		end
	end)
	slot0:bind(uv0.ON_UNEQUIP, function (slot0)
		slot4.shipId = uv0.contextData.shipId
		slot4.pos = uv0.contextData.pos

		uv0:sendNotification(GAME.UNEQUIP_FROM_SHIP, {})
		uv0.viewComponent:emit(BaseUI.ON_CLOSE)
	end)
	slot0:bind(uv0.ON_INTENSIFY, function (slot0)
		slot4.mediator = EquipUpgradeMediator
		slot4.viewComponent = EquipUpgradeLayer
		slot5.equipmentId = uv0.contextData.equipmentId
		slot5.shipId = uv0.contextData.shipId
		slot5.pos = uv0.contextData.pos
		slot4.data = {}

		uv0:addSubLayers(Context.New({}), true, function ()
			uv0.viewComponent:emit(BaseUI.ON_CLOSE)
		end)
	end)
	slot0:bind(uv0.ON_CHANGE, function (slot0)
		slot1 = getProxy(BayProxy)

		for slot9, slot10 in ipairs(getProxy(EquipmentProxy):getEquipments(true)) do
			if not slot2:isForbiddenAtPos(slot10, uv0.contextData.pos) then
				table.insert(slot1:getEquipsInShips(slot1:getShipById(uv0.contextData.shipId), uv0.contextData.pos), slot10)
			end
		end

		_.each(slot5, function (slot0)
			if not uv0:canEquipAtPos(slot0, uv1.contextData.pos) then
				slot0.mask = true
			end
		end)
		uv0.viewComponent:emit(BaseUI.ON_CLOSE)

		slot10.equipmentVOs = slot5
		slot10.shipId = uv0.contextData.shipId
		slot10.pos = uv0.contextData.pos
		slot10.warp = StoreHouseConst.WARP_TO_WEAPON
		slot10.mode = StoreHouseConst.EQUIPMENT

		uv0:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
			lock = true
		})
	end)
	slot0:bind(uv0.ON_REVERT, function (slot0, slot1)
		slot5.id = slot1

		uv0:sendNotification(GAME.REVERT_EQUIPMENT, {})
	end)
	slot0:bind(uv0.ON_MOVE, function (slot0, slot1)
		uv0.viewComponent:emit(BaseUI.ON_CLOSE)

		slot6.shipId = slot1

		uv0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			page = 2
		})
	end)

	if not getProxy(EquipmentProxy):getEquipmentById(slot0.contextData.equipmentId) then
		slot8.id = slot5
		slot6 = Equipment.New({}) or nil
	end

	slot0.viewComponent:setEquipment(slot6)

	slot7 = getProxy(BayProxy)

	slot0.viewComponent:setShip(slot7:getShipById(slot0.contextData.shipId), slot0.contextData.oldShipId and slot7:getShipById(slot0.contextData.oldShipId) or nil)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.DESTROY_EQUIPMENTS_DONE
	slot1[2] = GAME.EQUIP_TO_SHIP_DONE
	slot1[3] = GAME.REVERT_EQUIPMENT_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.DESTROY_EQUIPMENTS_DONE or slot2 == GAME.EQUIP_TO_SHIP_DONE or slot2 == GAME.REVERT_EQUIPMENT_DONE then
		slot0.viewComponent:emit(BaseUI.ON_CLOSE)
	end
end

return slot0
