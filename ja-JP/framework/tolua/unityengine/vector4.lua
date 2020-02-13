slot0 = Mathf.Clamp
slot1 = Mathf.Sqrt
slot2 = Mathf.Min
slot3 = Mathf.Max
slot5 = rawget
slot7 = tolua.initget(slot6)

function slot7.zero()
	return slot0.New(0, 0, 0, 0)
end

function slot7.one()
	return slot0.New(1, 1, 1, 1)
end

slot7.magnitude = ({
	__index = function (slot0, slot1)
		if slot0(slot1, slot1) == nil and slot0(slot2, slot1) ~= nil then
			return slot2(slot0)
		end

		return slot2
	end,
	__call = function (slot0, slot1, slot2, slot3, slot4)
		return slot0({
			x = slot1 or 0,
			y = slot2 or 0,
			z = slot3 or 0,
			w = slot4 or 0
		}, slot1)
	end,
	New = function (slot0, slot1, slot2, slot3)
		return slot0({
			x = slot0 or 0,
			y = slot1 or 0,
			z = slot2 or 0,
			w = slot3 or 0
		}, slot1)
	end,
	Set = function (slot0, slot1, slot2, slot3, slot4)
		slot0.x = slot1 or 0
		slot0.y = slot2 or 0
		slot0.z = slot3 or 0
		slot0.w = slot4 or 0
	end,
	Get = function (slot0)
		return slot0.x, slot0.y, slot0.z, slot0.w
	end,
	Lerp = function (slot0, slot1, slot2)
		return slot1.New(slot0.x + (slot1.x - slot0.x) * slot0(slot2, 0, 1), slot0.y + (slot1.y - slot0.y) * slot0(slot2, 0, 1), slot0.z + (slot1.z - slot0.z) * slot0(slot2, 0, 1), slot0.w + (slot1.w - slot0.w) * slot0(slot2, 0, 1))
	end,
	MoveTowards = function (slot0, slot1, slot2)
		if slot2 < slot1 - slot0:Magnitude() and slot4 ~= 0 then
			slot3:Mul(slot2)
			slot3:Add(slot0)

			return slot3
		end

		return slot1
	end,
	Scale = function (slot0, slot1)
		return slot0.New(slot0.x * slot1.x, slot0.y * slot1.y, slot0.z * slot1.z, slot0.w * slot1.w)
	end,
	SetScale = function (slot0, slot1)
		slot0.x = slot0.x * slot1.x
		slot0.y = slot0.y * slot1.y
		slot0.z = slot0.z * slot1.z
		slot0.w = slot0.w * slot1.w
	end,
	Normalize = function (slot0)
		return vector4.New(slot0.x, slot0.y, slot0.z, slot0.w):SetNormalize()
	end,
	SetNormalize = function (slot0)
		if slot0:Magnitude() == 1 then
			return slot0
		elseif slot1 > 1e-05 then
			slot0:Div(slot1)
		else
			slot0:Set(0, 0, 0, 0)
		end

		return slot0
	end,
	Div = function (slot0, slot1)
		slot0.x = slot0.x / slot1
		slot0.y = slot0.y / slot1
		slot0.z = slot0.z / slot1
		slot0.w = slot0.w / slot1

		return slot0
	end,
	Mul = function (slot0, slot1)
		slot0.x = slot0.x * slot1
		slot0.y = slot0.y * slot1
		slot0.z = slot0.z * slot1
		slot0.w = slot0.w * slot1

		return slot0
	end,
	Add = function (slot0, slot1)
		slot0.x = slot0.x + slot1.x
		slot0.y = slot0.y + slot1.y
		slot0.z = slot0.z + slot1.z
		slot0.w = slot0.w + slot1.w

		return slot0
	end,
	Sub = function (slot0, slot1)
		slot0.x = slot0.x - slot1.x
		slot0.y = slot0.y - slot1.y
		slot0.z = slot0.z - slot1.z
		slot0.w = slot0.w - slot1.w

		return slot0
	end,
	Dot = function (slot0, slot1)
		return slot0.x * slot1.x + slot0.y * slot1.y + slot0.z * slot1.z + slot0.w * slot1.w
	end,
	Project = function (slot0, slot1)
		return slot1 * slot0:Dot(slot1) / slot0.Dot(slot1, slot1)
	end,
	Distance = function (slot0, slot1)
		return slot0.Magnitude(slot0 - slot1)
	end,
	Magnitude = function (slot0)
		return slot0(slot0.x * slot0.x + slot0.y * slot0.y + slot0.z * slot0.z + slot0.w * slot0.w)
	end,
	SqrMagnitude = function (slot0)
		return slot0.x * slot0.x + slot0.y * slot0.y + slot0.z * slot0.z + slot0.w * slot0.w
	end,
	Min = function (slot0, slot1)
		return slot0.New(slot1(slot0.x, slot1.x), slot1(slot0.y, slot1.y), slot1(slot0.z, slot1.z), slot1(slot0.w, slot1.w))
	end,
	Max = function (slot0, slot1)
		return slot0.New(slot1(slot0.x, slot1.x), slot1(slot0.y, slot1.y), slot1(slot0.z, slot1.z), slot1(slot0.w, slot1.w))
	end,
	__tostring = function (slot0)
		return string.format("[%f,%f,%f,%f]", slot0.x, slot0.y, slot0.z, slot0.w)
	end,
	__div = function (slot0, slot1)
		return slot0.New(slot0.x / slot1, slot0.y / slot1, slot0.z / slot1, slot0.w / slot1)
	end,
	__mul = function (slot0, slot1)
		return slot0.New(slot0.x * slot1, slot0.y * slot1, slot0.z * slot1, slot0.w * slot1)
	end,
	__add = function (slot0, slot1)
		return slot0.New(slot0.x + slot1.x, slot0.y + slot1.y, slot0.z + slot1.z, slot0.w + slot1.w)
	end,
	__sub = function (slot0, slot1)
		return slot0.New(slot0.x - slot1.x, slot0.y - slot1.y, slot0.z - slot1.z, slot0.w - slot1.w)
	end,
	__unm = function (slot0)
		return slot0.New(-slot0.x, -slot0.y, -slot0.z, -slot0.w)
	end,
	__eq = function (slot0, slot1)
		return slot0.SqrMagnitude(slot2) < 1e-10
	end
})["Magnitude"]
slot7.normalized = ()["Normalize"]
slot7.sqrMagnitude = ()["SqrMagnitude"]
UnityEngine.Vector4 = 

setmetatable(, )

return 
