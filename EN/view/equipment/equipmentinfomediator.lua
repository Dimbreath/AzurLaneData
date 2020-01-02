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
	if getProxy(ContextProxy).getCurrentContext(slot1).scene == SCENE.EQUIPSCENE then
		slot0.viewComponent.fromEquipmentView = true
	end

	slot0.viewComponent:setRevertItem(slot3)
	slot0:bind(slot0.ON_DESTROY, function (slot0, slot1)
		slot0:sendNotification(GAME.DESTROY_EQUIPMENTS, {
			equipments = {
				{
					slot0.contextData.equipmentId,
					slot1
				}
			}
		})
	end)
	slot0:bind(slot0.ON_EQUIP, function (slot0)
		if slot0.contextData.oldShipId then
			slot3, slot4 = Ship.canModifyShip(slot2)

			if not slot3 then
				pg.TipsMgr.GetInstance():ShowTips(slot4)
			else
				if slot0.viewComponent.fromEquipmentView then
					slot0:sendNotification(EquipmentMediator.NO_UPDATE)
				end

				slot0:sendNotification(GAME.EQUIP_FROM_SHIP, {
					equipmentId = slot0.contextData.equipmentId,
					shipId = slot0.contextData.shipId,
					pos = slot0.contextData.pos,
					oldShipId = slot0.contextData.oldShipId,
					oldPos = slot0.contextData.oldPos
				})
			end
		else
			if slot0.viewComponent.fromEquipmentView then
				slot0:sendNotification(EquipmentMediator.NO_UPDATE)
			end

			slot0:sendNotification(GAME.EQUIP_TO_SHIP, {
				equipmentId = slot0.contextData.equipmentId,
				shipId = slot0.contextData.shipId,
				pos = slot0.contextData.pos
			})
		end
	end)
	slot0:bind(slot0.ON_UNEQUIP, function (slot0)
		slot0:sendNotification(GAME.UNEQUIP_FROM_SHIP, {
			shipId = slot0.contextData.shipId,
			pos = slot0.contextData.pos
		})
		slot0.viewComponent:emit(BaseUI.ON_CLOSE)
	end)
	slot0:bind(slot0.ON_INTENSIFY, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = EquipUpgradeMediator,
			viewComponent = EquipUpgradeLayer,
			data = {
				equipmentId = slot0.contextData.equipmentId,
				shipId = slot0.contextData.shipId,
				pos = slot0.contextData.pos
			}
		}), true, function ()
			slot0.viewComponent:emit(BaseUI.ON_CLOSE)
		end)
	end)
	slot0:bind(slot0.ON_CHANGE, function (slot0)
		slot5 = getProxy(BayProxy):getEquipsInShips(slot2, slot0.contextData.pos)

		for slot9, slot10 in ipairs(slot4) do
			if not slot2:isForbiddenAtPos(slot10, slot0.contextData.pos) then
				table.insert(slot5, slot10)
			end
		end

		_.each(slot5, function (slot0)
			if not slot0:canEquipAtPos(slot0, slot1.contextData.pos) then
				slot0.mask = true
			end
		end)
		slot0.viewComponent:emit(BaseUI.ON_CLOSE)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
			lock = true,
			equipmentVOs = slot5,
			shipId = slot0.contextData.shipId,
			pos = slot0.contextData.pos,
			warp = StoreHouseConst.WARP_TO_WEAPON,
			mode = StoreHouseConst.EQUIPMENT
		})
	end)
	slot0:bind(slot0.ON_REVERT, function (slot0, slot1)
		slot0:sendNotification(GAME.REVERT_EQUIPMENT, {
			id = slot1
		})
	end)
	slot0:bind(slot0.ON_MOVE, function (slot0, slot1)
		slot0.viewComponent:emit(BaseUI.ON_CLOSE)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			page = 2,
			shipId = slot1
		})
	end)
	slot0.viewComponent:setEquipment(getProxy(EquipmentProxy):getEquipmentById(slot0.contextData.equipmentId) or (slot5 and slot5 > 0 and Equipment.New({
		id = slot5
	})) or nil)
	slot0.viewComponent:setShip(getProxy(BayProxy).getShipById(slot7, slot0.contextData.shipId), (slot0.contextData.oldShipId and slot7:getShipById(slot0.contextData.oldShipId)) or nil)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy).getData(slot10))
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.DESTROY_EQUIPMENTS_DONE,
		GAME.EQUIP_TO_SHIP_DONE,
		GAME.REVERT_EQUIPMENT_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.DESTROY_EQUIPMENTS_DONE or slot2 == GAME.EQUIP_TO_SHIP_DONE or slot2 == GAME.REVERT_EQUIPMENT_DONE then
		slot0.viewComponent:emit(BaseUI.ON_CLOSE)
	end
end

return slot0
