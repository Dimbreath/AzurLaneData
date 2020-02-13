slot1 = Mathf
slot2 = Vector3
UnityEngine.Plane = {
	__index = function (slot0, slot1)
		return rawget(slot0, slot1)
	end,
	__call = function (slot0, slot1)
		return slot0.New(slot1)
	end,
	New = function (slot0, slot1)
		return slot0({
			normal = slot0:Normalize(),
			distance = slot1
		}, slot1)
	end,
	Get = function (slot0)
		return slot0.normal, slot0.distance
	end,
	Raycast = function (slot0, slot1)
		slot3 = -slot0.Dot(slot1.origin, slot0.normal) - slot0.distance

		if slot1.Approximately(slot0.Dot(slot1.direction, slot0.normal), 0) then
			return false, 0
		end

		return slot3 / slot2 > 0, slot4
	end,
	SetNormalAndPosition = function (slot0, slot1, slot2)
		slot0.normal = slot1:Normalize()
		slot0.distance = -slot0.Dot(slot1, slot2)
	end,
	Set3Points = function (slot0, slot1, slot2, slot3)
		slot0.normal = slot0.Normalize(slot0.Cross(slot2 - slot1, slot3 - slot1))
		slot0.distance = -slot0.Dot(slot0.normal, slot1)
	end,
	GetDistanceToPoint = function (slot0, slot1)
		return slot0.Dot(slot0.normal, slot1) + slot0.distance
	end,
	GetSide = function (slot0, slot1)
		return slot0.Dot(slot0.normal, slot1) + slot0.distance > 0
	end,
	SameSide = function (slot0, slot1, slot2)
		return (slot0:GetDistanceToPoint(slot1) > 0 and slot0:GetDistanceToPoint(slot2) > 0) or (slot3 <= 0 and slot0.GetDistanceToPoint(slot2) <= 0)
	end
}

setmetatable(, )

return 
