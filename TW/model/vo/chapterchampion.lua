slot0 = class("ChapterChampion", import(".BaseVO"))

slot0.Ctor = function (slot0, slot1)
	slot0.row = slot1.pos.row
	slot0.column = slot1.pos.column
	slot0.id = slot1.item_id
	slot0.configId = slot0.id
	slot0.attachmentId = slot0.id
	slot0.attachment = slot1.item_type
	slot0.flag = slot1.item_flag
	slot0.data = slot1.item_data
	slot0.trait = ChapterConst.TraitNone
	slot0.rotation = Quaternion.identity
end

slot0.bindConfigTable = function (slot0)
	if slot0.attachment == ChapterConst.AttachOni then
		return pg.specialunit_template
	else
		return pg.expedition_data_template
	end
end

slot0.getPrefab = function (slot0)
	if slot0.attachment == ChapterConst.AttachOni then
		return slot0:getConfig("prefab")
	else
		return slot0:getConfig("icon")
	end
end

slot0.getFleetType = function (slot0)
	if slot0.attachment == ChapterConst.AttachOni then
		return FleetType.Normal
	else
		return (slot0:getConfig("type") == 13 and FleetType.Submarine) or FleetType.Normal
	end
end

slot0.getPoolType = function (slot0)
	return (slot0.attachment == ChapterConst.AttachOni and "oni") or "common"
end

slot0.getScale = function (slot0)
	if slot0.attachment == ChapterConst.AttachOni then
		return 200
	else
		return slot0:getConfig("scale")
	end
end

slot0.inAlertRange = function (slot0, slot1, slot2)
	return _.any(slot0:getConfig("alert_range"), function (slot0)
		return slot0[1] + slot0.row ==  and slot0[2] + slot0.column == slot0.column
	end)
end

return slot0
