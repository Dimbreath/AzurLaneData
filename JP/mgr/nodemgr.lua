pg = pg or {}
slot0 = singletonClass("NodeMgr")
pg.NodeMgr = slot0

function slot0.Ctor(slot0)
	return
end

slot0.NodeBase = {}

function slot0.RigisterNode(slot0, slot1)
	slot0.NodeBase[slot0] = slot1
end

function slot0.Ctor(slot0)
	return
end

function slot1(slot0, slot1, slot2, slot3)
	if slot0.NodeBase[slot2[1]] == nil then
		return
	end

	slot3:Add(slot4.New(slot1, slot2))
end

function slot2(slot0, slot1, slot2, slot3)
	if slot2._parallel == nil then
		slot0(slot0, slot1, slot2, slot3)

		return
	end

	if slot4 == true then
		slot3:Add(slot5)

		for slot9, slot10 in ipairs(slot2) do
			slot11 = slot3.Center:NewSeq(slot9)

			slot1:AddSeq(slot11)
			slot5:AddFollow(slot11, slot12)
			slot2(slot0, ys.Battle.NodeData.New(slot1:GetUnit(), {}, slot11), slot10, slot11)
		end
	else
		for slot8, slot9 in ipairs(slot2) do
			slot2(slot0, slot1, slot9, slot3)
		end
	end
end

function slot0.GenNode(slot0, slot1, slot2, slot3)
	slot0(slot0, slot1, slot2, slot3)

	for slot7, slot8 in ipairs(slot1:GetAllSeq()) do
		slot8:Update()
	end
end

return
