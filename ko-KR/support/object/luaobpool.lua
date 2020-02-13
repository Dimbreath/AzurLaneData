pg = pg or {}
slot1 = require("Mgr/Pool/PoolUtil")
slot2 = class("LuaObPool")
pg.LuaObPool = slot2

function slot2.Ctor(slot0, slot1, slot2, slot3)
	slot0.baseClass = slot1
	slot0.info = slot2
	slot0.list = {}
	slot0.ob2index = {}

	for slot7 = 1, slot3, 1 do
		slot0.list[slot7] = slot1.New(slot0, slot2)
	end

	slot0.usedEnd = 0
end

function slot2.GetObject(slot0)
	slot3 = nil

	if slot0.usedEnd >= #slot0.list then
		slot1[#slot1 + 1] = slot0.baseClass.New(slot0, slot0.info)
	end

	slot0.ob2index[slot1[slot2 + 1]] = slot2 + 1
	slot0.usedEnd = slot2 + 1

	slot1[slot2 + 1]:Init()

	return slot1[slot2 + 1]
end

function slot2.Recycle(slot0, slot1)
	slot4 = slot0.list

	slot1:Recycle()

	if slot0.usedEnd ~= slot0.ob2index[slot1] then
		slot0.ob2index[slot4[slot3]] = slot2
		slot4[slot2] = slot4[slot3]
		slot4[slot3] = slot1
	end

	slot0.ob2index[slot1] = nil
	slot0.usedEnd = slot3 - 1
end

function slot2.UpdateInfo(slot0, slot1, slot2)
	slot0.info[slot1] = slot2
end

function slot2.Dispose(slot0)
	for slot4, slot5 in ipairs(slot0.list) do
		slot5:Dispose()
	end

	slot0.ob2index = nil
end

return
