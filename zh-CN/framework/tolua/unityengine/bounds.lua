slot0 = rawget
slot2 = type
slot4 = Vector3.zero
slot6 = tolua.initget(slot5)
slot6.size = ({
	center = Vector3.zero,
	extents = Vector3.zero,
	__index = function (slot0, slot1)
		if slot0(slot1, slot1) == nil and slot0(slot2, slot1) ~= nil then
			return slot2(slot0)
		end

		return slot2
	end,
	__call = function (slot0, slot1, slot2)
		return slot0({
			center = slot1,
			extents = slot2 * 0.5
		}, slot1)
	end,
	New = function (slot0, slot1)
		return slot0({
			center = slot0,
			extents = slot1 * 0.5
		}, slot1)
	end,
	Get = function (slot0)
		return slot0.center, slot0:GetSize()
	end,
	GetSize = function (slot0)
		return slot0.extents * 2
	end,
	SetSize = function (slot0, slot1)
		slot0.extents = slot1 * 0.5
	end,
	GetMin = function (slot0)
		return slot0.center - slot0.extents
	end,
	SetMin = function (slot0, slot1)
		slot0:SetMinMax(slot1, slot0:GetMax())
	end,
	GetMax = function (slot0)
		return slot0.center + slot0.extents
	end,
	SetMax = function (slot0, slot1)
		slot0:SetMinMax(slot0:GetMin(), slot1)
	end,
	SetMinMax = function (slot0, slot1, slot2)
		slot0.extents = (slot2 - slot1) * 0.5
		slot0.center = slot1 + slot0.extents
	end,
	Encapsulate = function (slot0, slot1)
		slot0:SetMinMax(slot0.Min(slot0:GetMin(), slot1), slot0.Max(slot0:GetMax(), slot1))
	end,
	Expand = function (slot0, slot1)
		if slot0(slot1) == "number" then
			slot0.extents:Add(slot1.New(slot1 * 0.5, , ))
		else
			slot0.extents:Add(slot1 * 0.5)
		end
	end,
	Intersects = function (slot0, slot1)
		slot3 = slot0:GetMax()
		slot4 = slot1:GetMin()

		return slot0:GetMin().x <= slot1:GetMax().x and slot4.x <= slot3.x and slot2.y <= slot5.y and slot4.y <= slot3.y and slot2.z <= slot5.z and slot4.z <= slot3.z
	end,
	Contains = function (slot0, slot1)
		slot3 = slot0:GetMax()

		if slot1.x < slot0:GetMin().x or slot1.y < slot2.y or slot1.z < slot2.z or slot3.x < slot1.x or slot3.y < slot1.y or slot3.z < slot1.z then
			return false
		end

		return true
	end,
	IntersectRay = function (slot0, slot1)
		slot2 = -Mathf.Infinity
		slot3 = Mathf.Infinity
		slot4, slot5, slot6 = nil
		slot8 = {
			slot0:GetCenter() - slot1:GetOrigin().x,
			slot0.GetCenter() - slot1.GetOrigin().y,
			slot0.GetCenter() - slot1.GetOrigin().z
		}
		slot9 = {
			slot0.extents.x,
			slot0.extents.y,
			slot0.extents.z
		}
		slot10 = {
			slot1:GetDirection().x,
			slot1.GetDirection().y,
			slot1.GetDirection().z
		}

		for slot14 = 1, 3, 1 do
			if (slot8[slot14] + slot9[slot14]) * 1 / slot10[slot14] < (slot8[slot14] - slot9[slot14]) * 1 / slot10[slot14] then
				if slot2 < slot4 then
					slot2 = slot4
				end

				if slot5 < slot3 then
					slot3 = slot5
				end

				if slot3 < slot2 then
					return false
				end

				if slot3 < 0 then
					return false
				end
			else
				if slot2 < slot5 then
					slot2 = slot5
				end

				if slot4 < slot3 then
					slot3 = slot4
				end

				if slot3 < slot2 then
					return false
				end

				if slot3 < 0 then
					return false
				end
			end
		end

		return true, slot2
	end,
	ClosestPoint = function (slot0, slot1)
		slot3 = {
			slot1 - slot0:GetCenter().x,
			slot1 - slot0.GetCenter().y,
			slot1 - slot0.GetCenter().z
		}
		slot5 = {
			slot0.extents.x,
			slot0.extents.y,
			slot0.extents.z
		}
		slot6 = 0
		slot7 = nil

		for slot11 = 1, 3, 1 do
			if slot3[slot11] < -slot5[slot11] then
				slot6 = slot6 + (slot3[slot11] + slot5[slot11]) * ()
				slot3[slot11] = -slot5[slot11]
			elseif slot5[slot11] < slot3[slot11] then
				slot6 = slot6 + (slot3[slot11] - slot5[slot11]) * ()
				slot3[slot11] = slot5[slot11]
			end
		end

		if slot6 == 0 then
			return rkPoint, 0
		else
			outPoint = slot3 + slot0:GetCenter()

			return outPoint, slot6
		end
	end,
	Destroy = function (slot0)
		slot0.center = nil
		slot0.size = nil
	end,
	__tostring = function (slot0)
		return string.format("Center: %s, Extents %s", tostring(slot0.center), tostring(slot0.extents))
	end,
	__eq = function (slot0, slot1)
		return slot0.center == slot1.center and slot0.extents == slot1.extents
	end
})["GetSize"]
slot6.min = ()["GetMin"]
slot6.max = ()["GetMax"]
UnityEngine.Bounds = 

setmetatable(, )

return 
