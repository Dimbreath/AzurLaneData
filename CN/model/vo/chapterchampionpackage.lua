slot0 = class("ChapterChampionPackage")
slot1 = {
	[ChapterConst.AttachOni] = ChapterChampionOni,
	[ChapterConst.AttachChampion] = ChapterChampionNormal
}

slot0.Ctor = function (slot0, slot1)
	slot0.package = slot0:RebuildData(slot1)
	slot0.idList = {}

	if slot1.extra_id then
		for slot5, slot6 in ipairs(slot1.extra_id) do
			slot0.idList[slot5] = slot6
		end
	end

	slot0.currentChampion = slot0[slot1.item_type].New(Clone(slot0.package))
	slot0.trait = ChapterConst.TraitNone
	slot0.rotation = Quaternion.identity
end

slot0.RebuildData = function (slot0, slot1)
	({
		pos = {},
		id = slot1.item_id,
		attachment = slot1.item_type,
		flag = slot1.item_flag,
		data = slot1.item_data
	})["pos"].row = slot1.pos.row
	()["pos"].column = slot1.pos.column

	return 
end

slot0.__index = function (slot0, slot1)
	value = slot0[slot1]

	if not value and rawget(slot0, "currentChampion") then
		value = slot2[slot1]
	end

	return value
end

slot0.Iter = function (slot0)
	if #slot0.idList <= 0 then
		slot0.flag = 1

		return
	end

	slot0.package.id = table.remove(slot0.idList, 1)
	slot0.currentChampion = slot0[slot0.attachment].New(Clone(slot0.package))
end

slot0.GetLastID = function (slot0)
	if #slot0.idList > 0 then
		return slot0.idList[#slot0.idList]
	else
		return slot0.id
	end
end

return slot0
