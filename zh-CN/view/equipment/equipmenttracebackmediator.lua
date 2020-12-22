slot0 = class("EquipmentTraceBackMediator", import("view.base.ContextMediator"))
slot0.TRANSFORM_EQUIP = "transform equip"

function slot0.register(slot0)
	slot0:BindEvent()

	slot0.env = {}

	slot0:getViewComponent():SetEnv(slot0.env)

	slot1 = EquipmentTraceBackLayer.GetTracebackResultFuncCreator()
	slot0.env.GetEquipTraceBack = slot1.traceback
	slot0.env.GetSameTypeInEquips = slot1.getSameEquipTypeInDict

	slot0:getViewComponent():UpdatePlayer(getProxy(PlayerProxy):getData())

	slot0.stopUpdateView = false
end

function slot0.BindEvent(slot0)
	slot0:bind(uv0.TRANSFORM_EQUIP, function (slot0, slot1, slot2)
		uv0.stopUpdateView = true

		uv0:sendNotification(GAME.TRANSFORM_EQUIPMENT, {
			shipId = slot1.shipId,
			pos = slot1.shipPos,
			equipmentId = slot1.id,
			formulaIds = slot2
		})
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		PlayerProxy.UPDATED,
		BagProxy.ITEM_ADDED,
		BagProxy.ITEM_UPDATED,
		EquipmentProxy.EQUIPMENT_ADDED,
		EquipmentProxy.EQUIPMENT_UPDATED,
		EquipmentProxy.EQUIPMENT_REMOVED,
		BayProxy.SHIP_UPDATED,
		GAME.UNEQUIP_FROM_SHIP_DONE,
		GAME.TRANSFORM_EQUIPMENT_DONE,
		GAME.TRANSFORM_EQUIPMENT_FAIL
	}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == PlayerProxy.UPDATED then
		slot0:getViewComponent():UpdatePlayer(slot1:getBody())
	elseif slot2 == BagProxy.ITEM_ADDED or slot2 == BagProxy.ITEM_UPDATED then
		if slot0.stopUpdateView then
			return
		end

		slot4:UpdateSort()
		slot4:UpdateSourceList()
		slot4:UpdateFormula()
	elseif slot2 == EquipmentProxy.EQUIPMENT_ADDED or slot2 == EquipmentProxy.EQUIPMENT_UPDATED or slot2 == EquipmentProxy.EQUIPMENT_REMOVED or slot2 == BayProxy.SHIP_UPDATED then
		if slot0.stopUpdateView then
			return
		end

		slot5 = EquipmentTraceBackLayer.GetTracebackResultFuncCreator()
		slot0.env.GetEquipTraceBack = slot5.traceback
		slot0.env.GetSameTypeInEquips = slot5.getSameEquipTypeInDict

		slot4:UpdateSourceEquipmentPaths()
		slot4:UpdateSort()
		slot4:UpdateSourceList()
		slot4:UpdateFormula()
	elseif slot2 == GAME.UNEQUIP_FROM_SHIP_DONE then
		if slot0.stopUpdateView then
			return
		end

		if not slot0.contextData.sourceEquipmentInstance then
			return
		end

		if slot0.contextData.sourceEquipmentInstance.shipId ~= slot3.id then
			return
		end

		if slot3:getEquip(slot5.shipPos) ~= slot5.id then
			slot0.contextData.sourceEquipmentInstance = nil
		end

		slot4:UpdateFormula()
	elseif slot2 == GAME.TRANSFORM_EQUIPMENT_DONE or slot2 == GAME.TRANSFORM_EQUIPMENT_FAIL then
		slot0.stopUpdateView = false
		slot5 = EquipmentTraceBackLayer.GetTracebackResultFuncCreator()
		slot0.env.GetEquipTraceBack = slot5.traceback
		slot0.env.GetSameTypeInEquips = slot5.getSameEquipTypeInDict

		slot4:UpdateSourceEquipmentPaths()
		slot4:UpdateSort()
		slot4:UpdateSourceList()
		slot4:UpdateFormula()
	end
end

return slot0
