slot0 = class("WorldInventoryProxy", import("...BaseEntity"))
slot0.Fields = {
	data = "table"
}
slot0.EventUpdateItem = "WorldInventoryProxy.EventUpdateItem"

function slot0.Build(slot0)
	slot0.data = {}
end

function slot0.Setup(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		slot7 = WorldItem.New(slot6)
		slot0.data[slot7.id] = slot7

		slot0:DispatchEvent(uv0.EventUpdateItem, slot7:clone())
	end
end

function slot0.GetItem(slot0, slot1)
	return slot0.data[slot1]
end

function slot0.GetItemCount(slot0, slot1)
	return slot0:GetItem(slot1) and slot2.count or 0
end

function slot0.AddItem(slot0, slot1, slot2)
	if slot0:GetItem(slot1) then
		slot3.count = slot3.count + slot2
	else
		slot0.data[slot1] = WorldItem.New({
			id = slot1,
			count = slot2
		})
	end

	slot0:DispatchEvent(uv0.EventUpdateItem, slot3:clone())
end

function slot0.RemoveItem(slot0, slot1, slot2)
	if slot0:GetItem(slot1) then
		slot3.count = slot3.count - (slot2 or slot3.count)

		if slot3.count == 0 then
			slot0.data[slot1] = nil
		end

		slot0:DispatchEvent(uv0.EventUpdateItem, slot3:clone())
	end
end

function slot0.UpdateItem(slot0, slot1, slot2)
	if slot0:GetItem(slot1) then
		slot3.count = slot2

		slot0:DispatchEvent(uv0.EventUpdateItem, slot3:clone())
	end
end

function slot0.GetItemList(slot0)
	return _(slot0.data):chain():values():filter(function (slot0)
		return slot0.count > 0
	end):value()
end

function slot0.CalcResetExchangeResource(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		if slot6:getConfig("item_transform_resource") > 0 then
			slot1[slot7] = defaultValue(slot1[slot7], 0) + math.floor(slot6.count / slot6:getConfig("item_transform_num")) * slot6:getConfig("item_transform_resource_num")
		end
	end

	return slot1
end

return slot0
