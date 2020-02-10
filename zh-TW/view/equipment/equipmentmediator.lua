slot0 = class("EquipmentMediator", import("..base.ContextMediator"))
slot0.ON_DESTROY = "EquipmentMediator:ON_DESTROY"
slot0.ON_UNEQUIP_EQUIPMENT = "EquipmentMediator:ON_UNEQUIP_EQUIPMENT"
slot0.OPEN_DESIGN = "EquipmentMediator:OPEN_DESIGN"
slot0.CLOSE_DESIGN_LAYER = "EquipmentMediator:CLOSE_DESIGN_LAYER"
slot0.BATCHDESTROY_MODE = "EquipmentMediator:BATCHDESTROY_MODE"
slot0.ON_EQUIPMENT_SKIN_INFO = "EquipmentMediator:ON_EQUIPMENT_SKIN_INFO"
slot0.ON_UNEQUIP_EQUIPMENT_SKIN = "EquipmentMediator:ON_UNEQUIP_EQUIPMENT_SKIN"
slot0.ON_USE_ITEM = "EquipmentMediator:ON_USE_ITEM"
slot0.NO_UPDATE = "EquipmentMediator:NO_UPDATE"
slot0.ITEM_GO_SCENE = "item go scene"
slot0.OPEN_EQUIPSKIN_INDEX_LAYER = "EquipmentMediator:OPEN_EQUIPSKIN_INDEX_LAYER"

function slot0.register(slot0)
	if not slot0.contextData.warp then
		slot0.contextData.warp = getProxy(SettingsProxy):getEquipSceneIndex()
	end

	slot0:bind(uv0.ITEM_GO_SCENE, function (slot0, slot1, slot2)
		uv0:sendNotification(GAME.GO_SCENE, slot1, slot2)
	end)
	slot0:bind(uv0.ON_USE_ITEM, function (slot0, slot1, slot2, slot3)
		slot7.id = slot1
		slot7.count = slot2
		slot7.arg = slot3

		uv0:sendNotification(GAME.USE_ITEM, {})
	end)
	slot0:bind(uv0.ON_DESTROY, function (slot0, slot1)
		slot5.equipments = slot1

		uv0:sendNotification(GAME.DESTROY_EQUIPMENTS, {})
	end)
	slot0:bind(uv0.ON_UNEQUIP_EQUIPMENT, function (slot0)
		slot4.shipId = uv0.contextData.shipId
		slot4.pos = uv0.contextData.pos

		uv0:sendNotification(GAME.UNEQUIP_FROM_SHIP, {})
	end)
	slot0:bind(uv0.OPEN_DESIGN, function (slot0)
		if getProxy(ContextProxy):getContextByMediator(EquipmentMediator):getContextByMediator(EquipmentDesignMediator) then
			return
		end

		slot7.viewComponent = EquipmentDesignLayer
		slot7.mediator = EquipmentDesignMediator
		slot8.LayerWeightMgr_groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
		slot7.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.CLOSE_DESIGN_LAYER, function (slot0)
		if getProxy(ContextProxy):getContextByMediator(EquipmentMediator):getContextByMediator(EquipmentDesignMediator) then
			slot7.context = slot3

			uv0:sendNotification(GAME.REMOVE_LAYERS, {})
		end
	end)
	slot0:bind(uv0.ON_EQUIPMENT_SKIN_INFO, function (slot0, slot1, slot2, slot3)
		slot4 = uv0
		slot7.mediator = EquipmentSkinMediator
		slot7.viewComponent = EquipmentSkinLayer
		slot8.skinId = slot1
		slot8.shipId = uv0.contextData.shipId
		slot8.mode = uv0.contextData.shipId and EquipmentSkinLayer.REPLACE or EquipmentSkinLayer.DISPLAY
		slot8.oldShipInfo = slot3
		slot8.pos = slot2
		slot7.data = {}

		slot4.addSubLayers(slot4, Context.New({}))
	end)
	slot0:bind(uv0.ON_UNEQUIP_EQUIPMENT_SKIN, function (slot0)
		slot4.shipId = uv0.contextData.shipId
		slot4.pos = uv0.contextData.pos

		uv0:sendNotification(GAME.EQUIP_EQUIPMENTSKIN_TO_SHIP, {
			equipmentSkinId = 0
		})
	end)
	slot0:bind(uv0.OPEN_EQUIPSKIN_INDEX_LAYER, function (slot0, slot1)
		slot5.mediator = IndexMediator
		slot5.viewComponent = IndexLayer
		slot5.data = slot1

		uv0:addSubLayers(Context.New({}))
	end)

	slot0.canUpdate = true

	slot0.viewComponent:setShip(getProxy(BayProxy):getShipById(slot0.contextData.shipId))

	slot0.equipmentProxy = getProxy(EquipmentProxy)
	slot3 = {}

	if slot0.contextData.equipmentVOs then
		slot3 = slot0.contextData.equipmentVOs
	else
		for slot7, slot8 in pairs(slot1:getEquipsInShips()) do
			table.insert(slot0.equipmentProxy:getEquipments(true), slot8)
		end

		for slot7, slot8 in pairs(slot0.equipmentProxy:getEquipmentSkins()) do
			slot11.id = slot8.id
			slot11.count = slot8.count

			table.insert(slot3, {
				isSkin = true
			})
		end

		for slot7, slot8 in pairs(slot1:getEquipmentSkinInShips()) do
			slot11.id = slot8.id
			slot11.shipId = slot8.shipId
			slot11.shipPos = slot8.shipPos

			table.insert(slot3, {
				isSkin = true,
				count = 1
			})
		end
	end

	slot0.viewComponent:setEquipments(slot3)
	slot0.viewComponent:setCapacity(slot0.equipmentProxy:getCapacity())
	slot0.viewComponent:setItems(getProxy(BagProxy):getItemsByExclude())
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = EquipmentProxy.EQUIPMENT_ADDED
	slot1[2] = EquipmentProxy.EQUIPMENT_UPDATED
	slot1[3] = EquipmentProxy.EQUIPMENT_REMOVED
	slot1[4] = BayProxy.SHIP_UPDATED
	slot1[5] = PlayerProxy.UPDATED
	slot1[6] = GAME.USE_ITEM_DONE
	slot1[7] = GAME.DESTROY_EQUIPMENTS_DONE
	slot1[8] = BagProxy.ITEM_ADDED
	slot1[9] = BagProxy.ITEM_UPDATED
	slot1[10] = uv0.BATCHDESTROY_MODE
	slot1[11] = GAME.EQUIP_TO_SHIP_DONE
	slot1[12] = GAME.REVERT_EQUIPMENT_DONE
	slot1[13] = EquipmentProxy.EQUIPMENT_SKIN_UPDATED
	slot1[14] = GAME.EQUIP_EQUIPMENTSKIN_TO_SHIP_DONE
	slot1[15] = GAME.EQUIP_EQUIPMENTSKIN_FROM_SHIP_DONE
	slot1[16] = uv0.NO_UPDATE
	slot1[17] = GAME.FRAG_SELL_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == EquipmentProxy.EQUIPMENT_ADDED or slot2 == EquipmentProxy.EQUIPMENT_UPDATED then
		if slot0.canUpdate then
			slot0.viewComponent:setCapacity(slot0.equipmentProxy:getCapacity())
			slot0.viewComponent:setEquipment(slot1:getBody())
		end
	elseif slot2 == EquipmentProxy.EQUIPMENT_REMOVED then
		slot0.viewComponent:setCapacity(slot0.equipmentProxy:getCapacity())
		slot0.viewComponent:removeEquipment(slot3)
	elseif slot2 == EquipmentProxy.EQUIPMENT_SKIN_UPDATED then
		if slot0.canUpdate then
			slot0.viewComponent:setCapacity(slot0.equipmentProxy:getCapacity())
			slot0.viewComponent:setEquipmentSkin(slot3)
		end
	elseif slot2 == BayProxy.SHIP_UPDATED then
		if slot3.id == slot0.contextData.shipId then
			slot0.viewComponent:setShip(slot3)
		end
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == GAME.USE_ITEM_DONE then
		if table.getCount(slot3) ~= 0 then
			slot7.items = slot3

			slot0.viewComponent:emit(BaseUI.ON_AWARD, {
				animation = true
			})
		end
	elseif slot2 == GAME.FRAG_SELL_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards)
	elseif slot2 == GAME.DESTROY_EQUIPMENTS_DONE then
		if table.getCount(slot3) ~= 0 then
			slot7.items = slot3

			slot0.viewComponent:emit(BaseUI.ON_AWARD, {})
		end
	elseif slot2 == BagProxy.ITEM_ADDED or slot2 == BagProxy.ITEM_UPDATED then
		if slot0.canUpdate then
			slot0.viewComponent:setItems(getProxy(BagProxy):getItemsByExclude())
		end
	elseif slot2 == uv0.BATCHDESTROY_MODE then
		slot0.viewComponent:SwitchToDestroy()
	elseif slot2 == GAME.REVERT_EQUIPMENT_DONE then
		if table.getCount(slot3.awards) > 0 then
			slot7.items = slot3.awards

			slot0.viewComponent:emit(BaseUI.ON_AWARD, {})
		end
	elseif slot2 == GAME.EQUIP_TO_SHIP_DONE then
		slot0.viewComponent:emit(BaseUI.ON_BACK)
	elseif slot2 == GAME.EQUIP_EQUIPMENTSKIN_TO_SHIP_DONE or slot2 == GAME.EQUIP_EQUIPMENTSKIN_FROM_SHIP_DONE then
		slot0.viewComponent:emit(BaseUI.ON_BACK)
	elseif slot2 == uv0.NO_UPDATE then
		slot0.canUpdate = false
	end
end

function slot0.remove(slot0)
	getProxy(SettingsProxy):setEquipSceneIndex(slot0.contextData.warp)
end

return slot0
