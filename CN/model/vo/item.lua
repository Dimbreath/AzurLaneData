slot0 = class("Item", import(".BaseVO"))
slot0.REVERT_EQUIPMENT_ID = 15007
slot0.INVISIBLE_TYPE = {
	0,
	9
}
slot0.PUZZLA_TYPE = 0
slot0.EQUIPMENT_SKIN_BOX = 11
slot0.BLUEPRINT_TYPE = 12
slot0.ASSIGNED_TYPE = 13

function itemId2icon(slot0)
	return pg.item_data_statistics[slot0].icon
end

slot0.GetIcon = function (slot0, slot1)
	if slot0 == DROP_TYPE_RESOURCE then
		return itemId2icon(id2ItemId(slot1))
	elseif slot0 == DROP_TYPE_ITEM then
		return itemId2icon(slot1)
	elseif slot0 == DROP_TYPE_WORLD_RESOURCE then
	elseif slot0 == DROP_TYPE_WORLD_ITEM then
		return pg.world_item_data_template[slot1].icon
	end
end

slot0.Ctor = function (slot0, slot1)
	slot0.configId = slot1.id
	slot0.id = slot0.configId
	slot0.dropType = slot1.type or 0
	slot0.type = slot0.dropType
	slot0.count = slot1.num or slot1.number or slot1.count
	slot0.name = slot1.name
	slot2 = pg.item_data_template[slot0.configId]
	slot0.itemConfigData = setmetatable({}, {
		__index = function (slot0, slot1)
			if not slot0 then
				return nil
			end

			return slot0[slot1]
		end
	})
end

slot0.bindConfigTable = function (slot0)
	return pg.item_data_statistics
end

slot0.getTempCfgTable = function (slot0)
	return pg.item_data_template[slot0.id]
end

slot0.couldSell = function (slot0)
	return table.getCount(slot0:getConfig("price")) > 0
end

slot0.isDropItem = function (slot0)
	return slot0.dropType > 0
end

slot0.isEnough = function (slot0, slot1)
	return slot1 <= slot0.count
end

slot0.consume = function (slot0, slot1)
	slot0.count = slot0.count - slot1
end

slot0.isDesignDrawing = function (slot0)
	return slot0:getConfig("type") == 9
end

slot0.isVirtualItem = function (slot0)
	return slot0:getConfig("type") == 0
end

slot0.getTempConfig = function (slot0, slot1)
	return slot0.itemConfigData[slot1]
end

slot0.isEquipmentSkinBox = function (slot0)
	return slot0:getConfig("type") == slot0.EQUIPMENT_SKIN_BOX
end

slot0.isBluePrintType = function (slot0)
	return slot0:getConfig("type") == slot0.BLUEPRINT_TYPE
end

return slot0
