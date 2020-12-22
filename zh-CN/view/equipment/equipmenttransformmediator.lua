slot0 = class("EquipmentTransformMediator", import("view.base.ContextMediator"))
slot0.TRANSFORM_EQUIP = "transform equip"
slot0.UPDATE_NEW_FLAG = "UPDATE NEW FLAG"
slot0.OPEN_TRANSFORM_TREE = "OPEN TRANSFORM TREE"
slot0.SELECT_TRANSFORM_FROM_STOREHOUSE = "SELECT_TRANSFORM_FROM_STOREHOUSE"
slot0.OPEN_LAYER = "OPEN_LAYER"

function slot0.register(slot0)
	slot0:BindEvent()

	slot0.env = {}

	slot0:getViewComponent():SetEnv(slot0.env)

	slot1 = EquipmentTraceBackLayer.GetTracebackResultFuncCreator()
	slot0.env.GetEquipTraceBack = slot1.traceback
	slot0.env.GetSameTypeInEquips = slot1.getSameEquipTypeInDict

	slot0:getViewComponent():UpdatePlayer(getProxy(PlayerProxy):getData())
end

function slot0.BindEvent(slot0)
	slot0:bind(uv0.TRANSFORM_EQUIP, function (slot0, slot1, slot2)
		uv0:sendNotification(GAME.TRANSFORM_EQUIPMENT, {
			shipId = slot1 and slot1.shipId,
			pos = slot1 and slot1.shipPos,
			equipmentId = slot1 and slot1.id or 0,
			formulaIds = {
				slot2
			}
		})
	end)
	slot0:bind(uv0.UPDATE_NEW_FLAG, function (slot0, slot1)
		uv0:sendNotification(uv1.UPDATE_NEW_FLAG, slot1)
	end)
	slot0:bind(uv0.OPEN_TRANSFORM_TREE, function (slot0, slot1)
		uv0:getViewComponent():closeView()
		uv0:sendNotification(GAME.GO_SCENE, SCENE.EQUIPMENT_TRANSFORM, {
			targetEquipId = slot1,
			mode = EquipmentTransformTreeScene.MODE_HIDESIDE
		})
	end)
	slot0:bind(uv0.SELECT_TRANSFORM_FROM_STOREHOUSE, function (slot0, slot1)
		uv0:sendNotification(GAME.GO_SCENE, SCENE.SELECT_TRANSFORM_EQUIPMENT, {
			warp = StoreHouseConst.WARP_TO_WEAPON,
			equipmentVOs = uv0.env.GetSameTypeInEquips(slot1),
			onSelect = function (slot0)
				return true
			end,
			onConfirm = function (slot0)
				uv0.contextData.sourceEquipmentInstance = slot0[1] or uv0.contextData.sourceEquipmentInstance

				return true
			end
		})
	end)
	slot0:bind(uv0.OPEN_LAYER, function (slot0, ...)
		uv0:addSubLayers(...)
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.TRANSFORM_EQUIPMENT_DONE,
		GAME.TRANSFORM_EQUIPMENT_FAIL,
		PlayerProxy.UPDATED,
		BagProxy.ITEM_ADDED,
		BagProxy.ITEM_UPDATED,
		EquipmentProxy.EQUIPMENT_ADDED,
		EquipmentProxy.EQUIPMENT_UPDATED,
		EquipmentProxy.EQUIPMENT_REMOVED,
		BayProxy.SHIP_UPDATED,
		GAME.UNEQUIP_FROM_SHIP_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == PlayerProxy.UPDATED then
		slot0:getViewComponent():UpdatePlayer(slot1:getBody())
	elseif slot2 == BagProxy.ITEM_ADDED or slot2 == BagProxy.ITEM_UPDATED then
		slot0:getViewComponent():UpdatePage()
	elseif slot2 == EquipmentProxy.EQUIPMENT_ADDED or slot2 == EquipmentProxy.EQUIPMENT_UPDATED or slot2 == EquipmentProxy.EQUIPMENT_REMOVED or slot2 == BayProxy.SHIP_UPDATED then
		slot4 = EquipmentTraceBackLayer.GetTracebackResultFuncCreator()
		slot0.env.GetEquipTraceBack = slot4.traceback
		slot0.env.GetSameTypeInEquips = slot4.getSameEquipTypeInDict

		slot0:getViewComponent():UpdateSourceEquipmentPaths()

		if (slot2 == EquipmentProxy.EQUIPMENT_REMOVED or slot2 == EquipmentProxy.EQUIPMENT_UPDATED and slot3.count == 0) and slot0.contextData.sourceEquipmentInstance and slot0.contextData.sourceEquipmentInstance.id == slot3.id then
			slot0.contextData.sourceEquipmentInstance = nil
		end

		slot5:UpdateSourceInfo()
		slot5:UpdateTargetInfo()
	elseif slot2 == GAME.UNEQUIP_FROM_SHIP_DONE then
		if not slot0.contextData.sourceEquipmentInstance then
			return
		end

		if slot0.contextData.sourceEquipmentInstance.shipId ~= slot3.id then
			return
		end

		if slot3:getEquip(slot4.shipPos) ~= slot4.id then
			slot0.contextData.sourceEquipmentInstance = nil

			slot0:getViewComponent():UpdateSourceInfo()
		end
	elseif slot2 == GAME.TRANSFORM_EQUIPMENT_DONE then
		slot0.contextData.sourceEquipmentInstance = nil

		slot0:getViewComponent():UpdatePage()
	elseif slot2 == GAME.TRANSFORM_EQUIPMENT_FAIL then
		slot0:getViewComponent():UpdatePage()
	end
end

return slot0
