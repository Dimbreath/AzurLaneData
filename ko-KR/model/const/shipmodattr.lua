slot0 = class("ShipModAttr")
slot1[2] = AttributeType.Cannon
slot1[3] = AttributeType.Torpedo
slot1[4] = AttributeType.AntiAircraft
slot1[5] = AttributeType.Air
slot1[6] = AttributeType.Reload
slot0.ID_TO_ATTR = {}
slot1[AttributeType.Cannon] = 1
slot1[AttributeType.Torpedo] = 2
slot1[AttributeType.AntiAircraft] = 3
slot1[AttributeType.Air] = 4
slot1[AttributeType.Reload] = 5
slot0.ATTR_TO_INDEX = {}
slot1[1] = AttributeType.Cannon
slot1[2] = AttributeType.Torpedo
slot1[3] = AttributeType.AntiAircraft
slot1[4] = AttributeType.Air
slot1[5] = AttributeType.Reload
slot0.BLUEPRINT_ATTRS = {}

function slot0.id2Name(slot0)
	return AttributeType.Type2Name(uv0.ID_TO_ATTR[slot0])
end

return slot0
