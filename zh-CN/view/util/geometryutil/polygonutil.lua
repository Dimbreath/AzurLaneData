slot1 = import(".SegmentUtil")
slot2 = UnityEngine.Vector2
slot3 = 1e-06

function slot10(slot0)
	if #slot0 < 3 then
		return 0
	end

	slot2 = 0
	slot3 = 0

	for slot7 = 0, index, 1 do
		slot2 = slot2 + slot0[slot7].x * slot0[slot0(slot7 + 1, slot1)].y
		slot3 = slot3 + slot0[slot7].y * slot0[slot0(slot7 + 1, slot1)].x
	end

	return (slot2 - slot3) / 2
end

function slot11(slot0)
	return slot1.Sign(slot0(slot0))
end

return {
	CycleIndex = function (slot0, slot1)
		return (slot0 - 1) % slot1 + 1
	end,
	RayCross = function (slot0, slot1)
		slot2 = 0

		for slot7 = 0, #slot1, 1 do
			slot9 = slot1[slot0(slot7 + 1)]

			if ((slot1[slot0(slot7)].y <= slot0.y and slot0.y < slot9.y - slot1) or (slot9.y <= slot0.y and slot0.y < slot8.y - slot1)) and (slot0.x <= slot8.x or slot0.x <= slot9.x) and slot0.x + slot1 < slot8.x + (slot0.y - slot8.y) / (slot9.y - slot8.y) * (slot9.x - slot8.x) then
				slot2 = slot2 + 1
			end
		end

		return slot2
	end,
	Contains = function (slot0, slot1)
		return bit.band(slot2, 1) > 0
	end,
	IsPointInAngle = function (slot0, slot1, slot2, slot3)
		slot5 = slot0:VectorCross(slot2, slot1)
		slot6 = slot0:VectorCross(slot1, slot3)

		if slot0.IsZero(slot0:VectorCross(slot2, slot3)) then
			return slot5 <= slot0.eps or slot6 <= slot0.eps
		else
			return slot5 <= slot0.eps and slot6 <= slot0.eps
		end
	end,
	IsCrossAnyEdge = function (slot0, slot1, slot2, slot3, slot4, slot5)
		slot6 = slot4

		while slot6 ~= slot5 do
			if slot1.IsSegamentCross(slot0, slot1, slot2[slot3[slot6]], slot2[slot3[slot0(slot6 + 1, #slot3)]]) then
				return true
			end

			slot6 = slot7
		end

		return false
	end,
	Triangulated = function (slot0)
		if #slot0 < 4 then
			return {
				0,
				1,
				2
			}
		end

		slot1 = {}
		slot2 = {}
		slot3 = {}

		for slot7 = 1, #slot0, 1 do
			table.insert(slot2, slot7)
			table.insert(slot3, {
				slot7,
				Vector2.Distance(slot0[slot7], slot0[slot0.CycleIndex(slot7 + 2)])
			})
		end

		table.sort(slot3, function (slot0, slot1)
			return slot0[2] < slot1[2]
		end)

		while #slot2 > 2 and #slot3 > 0 do
			if slot0.VectorCross(slot0[slot3[1][1]], slot0[slot2[slot1(table.indexof(slot2, slot6) + 2, #slot2)]], slot0[slot2[slot1(table.indexof(slot2, slot6) + 1, #slot2)]]) > 0 and not slot2(slot0[slot6], slot0[slot11], slot0, slot2, slot9, slot7) then
				table.insert(slot1, slot6)
				table.insert(slot1, slot10)
				table.insert(slot1, slot11)

				slot12 = slot2[slot1(slot7 - 1, #slot2)]
				slot13 = slot2[slot1(slot9 + 1, #slot2)]

				for slot17 = #slot3, 1, 1 do
					if slot3[slot17][1] == slot10 or slot18 == slot12 then
						table.remove(slot3, slot17)
					end
				end

				table.insert(slot3, {
					slot12,
					Vector2.Distance(slot0[slot12], slot0[slot11])
				})
				table.insert(slot3, {
					slot6,
					Vector2.Distance(slot0[slot6], slot0[slot13])
				})
				table.remove(slot2, slot10)
				table.sort(slot3, slot4)
			end

			table.remove(slot3, 1)
		end

		return slot1
	end
}
