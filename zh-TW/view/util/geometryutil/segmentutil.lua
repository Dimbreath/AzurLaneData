slot1 = 1e-06

function slot6(slot0, slot1)
	return slot0.x * slot1.y - slot0.y * slot1.x
end

function slot7(slot0, slot1)
	return slot0.x * slot1.x + slot0.y * slot1.y
end

return {
	IsZero = function (slot0)
		return slot0 >= -slot0 and slot0 <= slot0
	end,
	DistinguishZero = function (slot0)
		if slot0:IsZero() then
			return 0
		else
			return slot0
		end
	end,
	Sign = function (slot0)
		if slot0 < -slot0 then
			return -1
		elseif slot0 <= slot0 then
			return 0
		else
			return 1
		end
	end,
	GetRect = function (slot0, slot1)
		return Vector2.Min(slot0, slot1), Vector2.Max(slot0, slot1)
	end,
	VectorCross = function (slot0, slot1, slot2, slot3)
		return slot0(slot1(slot1 - slot0, (slot3 and slot3 - slot2) or slot2 - slot0))
	end,
	VectorDot = function (slot0, slot1, slot2, slot3)
		return slot0(slot1(slot1 - slot0, (slot3 and slot3 - slot2) or slot2 - slot0))
	end,
	IsRectCross = function (slot0, slot1, slot2, slot3)
		return math.min(slot0.x, slot1.x) <= math.max(slot2.x, slot3.x) and math.min(slot2.x, slot3.x) <= math.max(slot0.x, slot1.x) and math.min(slot0.y, slot1.y) <= math.max(slot2.y, slot3.y) and math.min(slot2.y, slot3.y) <= math.max(slot0.y, slot1.y)
	end,
	GetCrossPoint = function (slot0, slot1, slot2, slot3)
		slot4, slot5 = IsSegamentTouch(slot0, slot1, slot2, slot3)

		if not slot4 then
			return false
		end

		if slot0((slot1.x - slot0.x) * (slot3.y - slot2.y) - (slot1.y - slot0.y) * (slot3.x - slot2.x)) then
			return false
		end

		return true, Vector2((-slot8 * (slot0.x * slot1.y - slot0.y * slot1.x) - -slot6 * (slot2.x * slot3.y - slot2.y * slot3.x)) / slot10, (-slot9 * (slot0.x * slot1.y - slot0.y * slot1.x) - -slot7 * (slot2.x * slot3.y - slot2.y * slot3.x)) / slot10)
	end,
	IntersectLineandSegament = function (slot0, slot1, slot2, slot3)
		if slot0(slot1.x - slot0.x) then
			return slot1(slot2.x - slot0.x) * slot1(slot0.x - slot3.x) >= 0
		end

		return slot1(((slot1.y - slot0.y) / slot4 * slot2.x + slot1.y - (slot1.y - slot0.y) / slot4 * slot1.x) - slot2.y) * slot1(((slot1.y - slot0.y) / slot4 * slot3.x + slot1.y - (slot1.y - slot0.y) / slot4 * slot1.x) - slot3.y) <= 0
	end,
	IsSegamentTouch = function (slot0, slot1, slot2, slot3)
		slot6 = slot0(slot0, slot2, slot1) * slot0(slot0, slot1, slot3)
		slot7 = slot1(slot0(slot0, slot2, slot1)) == 0 and slot1(slot5)

		if slot6 < -slot2 then
			return false
		end

		return slot0(slot2, slot3, slot0) * slot0(slot2, slot1, slot3) >= -slot2, slot7
	end,
	IsSegamentCross = function (slot0, slot1, slot2, slot3)
		if slot0(slot0, slot2, slot1) * slot0(slot0, slot1, slot3) <= slot1 then
			return false
		end

		return slot1 < slot0(slot2, slot3, slot0) * slot0(slot2, slot1, slot3), slot2(slot4)
	end,
	IsSegamentParallel = function (slot0, slot1, slot2, slot3)
		return slot2(slot3(slot0, slot1, slot2, slot3)), slot0(slot1, slot0, slot2, slot3) <= slot1
	end
}
