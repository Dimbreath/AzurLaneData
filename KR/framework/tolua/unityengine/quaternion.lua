slot1 = math.sin
slot2 = math.cos
slot3 = math.acos
slot4 = math.asin
slot5 = math.sqrt
slot6 = math.min
slot7 = math.max
slot8 = math.sign
slot9 = math.atan2
slot10 = Mathf.Clamp
slot11 = math.abs
slot13 = getmetatable
slot14 = rawget
slot15 = rawset
slot17 = Mathf.Rad2Deg
slot18 = 0.5 * Mathf.Deg2Rad
slot19 = Vector3.forward
slot20 = Vector3.up
slot21 = {
	2,
	3,
	1
}
slot24 = ({
	__index = function (slot0, slot1)
		if slot0(slot1, slot1) == nil and slot0(slot2, slot1) ~= nil then
			return slot2(slot0)
		end

		return slot2
	end,
	__newindex = function (slot0, slot1, slot2)
		if slot1 == "eulerAngles" then
			slot0:SetEuler(slot2)
		else
			slot0(slot0, slot1, slot2)
		end
	end,
	New = function (slot0, slot1, slot2, slot3)
		slot0({
			x = slot0 or 0,
			y = slot1 or 0,
			z = slot2 or 0,
			w = slot3 or 0
		}, slot1)

		return 
	end,
	__call = function (slot0, slot1, slot2, slot3, slot4)
		slot0({
			x = slot1 or 0,
			y = slot2 or 0,
			z = slot3 or 0,
			w = slot4 or 0
		}, slot1)

		return 
	end,
	Set = function (slot0, slot1, slot2, slot3, slot4)
		slot0.x = slot1 or 0
		slot0.y = slot2 or 0
		slot0.z = slot3 or 0
		slot0.w = slot4 or 0
	end,
	Clone = function (slot0)
		return slot0(slot0.x, slot0.y, slot0.z, slot0.w)
	end,
	Get = function (slot0)
		return slot0.x, slot0.y, slot0.z, slot0.w
	end,
	Dot = function (slot0, slot1)
		return slot0.x * slot1.x + slot0.y * slot1.y + slot0.z * slot1.z + slot0.w * slot1.w
	end,
	Angle = function (slot0, slot1)
		if slot0:Dot(slot1) < 0 then
			slot2 = -slot2
		end

		return slot1(slot2(slot2, 1)) * 2 * 57.29578
	end,
	AngleAxis = function (slot0, slot1)
		slot2 = slot1:Normalize()
		slot3 = slot1(slot0)

		return slot3(slot2.x * slot3, slot2.y * slot3, slot2.z * slot3, slot2(slot0))
	end,
	Equals = function (slot0, slot1)
		return slot0.x == slot1.x and slot0.y == slot1.y and slot0.z == slot1.z and slot0.w == slot1.w
	end,
	Euler = function (slot0, slot1, slot2)
		slot3 = slot0(slot0)
		slot4 = slot0(slot1)
		slot5 = slot0(slot2)

		slot1(slot2 * 0.0087266462599716)({
			x = slot1(slot1 * 0.0087266462599716) * slot3 * slot1(slot2 * 0.0087266462599716) + slot4 * slot1(slot0 * 0.0087266462599716) * slot5,
			y = slot4 * slot1(slot0 * 0.0087266462599716) * slot1(slot2 * 0.0087266462599716) - slot1(slot1 * 0.0087266462599716) * slot3 * slot5,
			z = slot1(slot1 * 0.0087266462599716) * slot1(slot0 * 0.0087266462599716) * slot5 - slot4 * slot3 * slot1(slot2 * 0.0087266462599716),
			w = slot1(slot1 * 0.0087266462599716) * slot1(slot0 * 0.0087266462599716) * slot1(slot2 * 0.0087266462599716) + slot4 * slot3 * slot5
		}, slot3)

		return 
	end,
	SetEuler = function (slot0, slot1, slot2, slot3)
		if slot2 == nil and slot3 == nil then
			slot2 = slot1.y
			slot3 = slot1.z
			slot1 = slot1.x
		end

		slot4 = slot0(slot1)
		slot5 = slot1(slot1)
		slot6 = slot0(slot2)
		slot7 = slot1(slot2)
		slot8 = slot0(slot3)
		slot9 = slot1(slot3)
		slot0.w = slot7 * slot5 * slot9 + slot6 * slot4 * slot8
		slot0.x = slot7 * slot4 * slot9 + slot6 * slot5 * slot8
		slot0.y = slot6 * slot5 * slot9 - slot7 * slot4 * slot8
		slot0.z = slot7 * slot5 * slot8 - slot6 * slot4 * slot9

		return slot0
	end,
	Normalize = function (slot0)
		slot1 = slot0:Clone()

		slot1:SetNormalize()

		return slot1
	end,
	SetNormalize = function (slot0)
		if slot0.x * slot0.x + slot0.y * slot0.y + slot0.z * slot0.z + slot0.w * slot0.w ~= 1 and slot1 > 0 then
			slot0.x = slot0.x * 1 / slot0(slot1)
			slot0.y = slot0.y * 1 / slot0(slot1)
			slot0.z = slot0.z * 1 / slot0(slot1)
			slot0.w = slot0.w * 1 / slot0(slot1)
		end
	end,
	FromToRotation = function (slot0, slot1)
		slot2 = slot0.New()

		slot2:SetFromToRotation(slot0, slot1)

		return slot2
	end,
	SetFromToRotation1 = function (slot0, slot1, slot2)
		if slot0.Dot(slot3, slot2:Normalize()) > -0.999999 then
			slot0:Set(slot0.Cross(slot3, slot4) * 1 / slot1((1 + slot5) * 2).x, slot0.Cross(slot3, slot4) * 1 / slot1((1 + slot5) * 2).y, slot0.Cross(slot3, slot4) * 1 / slot1((1 + slot5) * 2).z, slot1((1 + slot5) * 2) * 0.5)
		elseif slot5 > 0.999999 then
			return slot2(0, 0, 0, 1)
		else
			if slot0.Cross(slot0.right, slot3).SqrMagnitude(slot6) < 1e-06 then
				slot6 = slot0.Cross(slot0.forward, slot3)
			end

			slot0:Set(slot6.x, slot6.y, slot6.z, 0)

			return slot0
		end

		return slot0
	end,
	SetFromToRotation = function (slot0, slot1, slot2)
		if slot0.Dot(slot1, slot2:Normalize()) > 0.999999 then
			slot0:Set(0, 0, 0, 1)
		elseif slot3 < -0.999999 then
			if ({
				0,
				slot1.z,
				slot1.y
			})[2] * ()[2] + ()[3] * ()[3] < 1e-06 then
				slot4[1] = -slot1.z
				slot4[2] = 0
				slot4[3] = slot1.x
				slot5 = slot4[1] * slot4[1] + slot4[3] * slot4[3]
			end

			slot4[1] = slot4[1] * 1 / slot1(slot5)
			slot4[2] = slot4[2] * 1 / slot1(slot5)
			slot4[3] = slot4[3] * 1 / slot1(slot5)

			slot2({
				{
					-slot1.x * slot1.x + ({
						slot4[2] * slot1.z - slot4[3] * slot1.y,
						slot4[3] * slot1.x - slot4[1] * slot1.z,
						slot4[1] * slot1.y - slot4[2] * slot1.x
					})[1] * ()[1] + -slot4[1] * slot4[1],
					-slot1.x * slot1.y + ()[1] * ()[2] + -slot4[1] * slot4[2],
					-slot1.x * slot1.z + ()[1] * ()[3] + -slot4[1] * slot4[3]
				},
				{
					-slot1.x * slot1.y + ()[1] * ()[2] + -slot4[1] * slot4[2],
					-slot1.y * slot1.y + ()[2] * ()[2] + -slot4[2] * slot4[2],
					-slot1.y * slot1.z + ()[2] * ()[3] + -slot4[2] * slot4[3]
				},
				{
					-slot1.x * slot1.z + ()[1] * ()[3] + -slot4[1] * slot4[3],
					-slot1.y * slot1.z + ()[2] * ()[3] + -slot4[2] * slot4[3],
					-slot1.z * slot1.z + ()[3] * ()[3] + -slot4[3] * slot4[3]
				}
			}, slot0)
		else
			slot4 = slot0.Cross(slot1, slot2)

			slot2({
				{
					slot3 + (1 - slot3) / slot0.Dot(slot4, slot4) * slot4.x * slot4.x,
					(1 - slot3) / slot0.Dot(slot4, slot4) * slot4.x * slot4.y - slot4.z,
					(1 - slot3) / slot0.Dot(slot4, slot4) * slot4.x * slot4.z + slot4.y
				},
				{
					(1 - slot3) / slot0.Dot(slot4, slot4) * slot4.x * slot4.y + slot4.z,
					slot3 + (1 - slot3) / slot0.Dot(slot4, slot4) * slot4.y * slot4.y,
					(1 - slot3) / slot0.Dot(slot4, slot4) * slot4.z * slot4.y - slot4.x
				},
				{
					(1 - slot3) / slot0.Dot(slot4, slot4) * slot4.x * slot4.z - slot4.y,
					(1 - slot3) / slot0.Dot(slot4, slot4) * slot4.z * slot4.y + slot4.x,
					slot3 + (1 - slot3) / slot0.Dot(slot4, slot4) * slot4.z * slot4.z
				}
			}, slot0)
		end
	end,
	Inverse = function (slot0)
		slot1 = slot0.New()
		slot1.x = -slot0.x
		slot1.y = -slot0.y
		slot1.z = -slot0.z
		slot1.w = slot0.w

		return slot1
	end,
	Lerp = function (slot0, slot1, slot2)
		slot2 = slot0(slot2, 0, 1)
		slot3 = {
			w = 1,
			z = 0,
			x = 0,
			y = 0
		}

		if slot1.Dot(slot0, slot1) < 0 then
			slot3.x = slot0.x + slot2 * (-slot1.x - slot0.x)
			slot3.y = slot0.y + slot2 * (-slot1.y - slot0.y)
			slot3.z = slot0.z + slot2 * (-slot1.z - slot0.z)
			slot3.w = slot0.w + slot2 * (-slot1.w - slot0.w)
		else
			slot3.x = slot0.x + (slot1.x - slot0.x) * slot2
			slot3.y = slot0.y + (slot1.y - slot0.y) * slot2
			slot3.z = slot0.z + (slot1.z - slot0.z) * slot2
			slot3.w = slot0.w + (slot1.w - slot0.w) * slot2
		end

		slot1.SetNormalize(slot3)
		slot2(slot3, slot1)

		return slot3
	end,
	LookRotation = function (slot0, slot1)
		if slot0:Magnitude() < 1e-06 then
			error("error input forward to Quaternion.LookRotation" .. tostring(slot0))

			return nil
		end

		slot3 = slot1 or slot0 / slot2:Cross(slot0 / slot2)

		slot3:SetNormalize()

		if slot1 or slot0 / slot2:Cross(slot0 / slot2).x + slot1 or slot0 / slot2.Cross(slot0 / slot2, slot3).y + slot0 / slot2.z > 0 then
			slot5, slot6, slot7, slot8 = nil
			slot10 = slot3(slot5, slot6, (slot3.y - slot1.x) * 0.5 / slot2(slot4), 0.5 / slot2(slot4) * (slot4 + 1))

			slot10:SetNormalize()

			return slot10
		else
			slot5 = {
				{
					slot3.x,
					slot1.x,
					slot0.x
				},
				{
					slot3.y,
					slot1.y,
					slot0.y
				},
				{
					slot3.z,
					slot1.z,
					slot0.z
				}
			}
			slot6 = {
				0,
				0,
				0
			}
			slot7 = 1

			if slot3.x < slot1.y then
				slot7 = 2
			end

			if slot5[slot7][slot7] < slot0.z then
				slot7 = 3
			end

			slot6[slot7] = 0.5 / slot2(slot10) * (slot5[slot7][slot7] - slot5[slot4[slot7]][slot4[slot7]] - slot5[slot4[slot4[slot7]]][slot4[slot4[slot7]]] + 1)
			slot6[slot4[slot7]] = (slot5[slot4[slot7]][slot7] + slot5[slot7][slot4[slot7]]) * 0.5 / slot2(slot10)
			slot6[slot4[slot4[slot7]]] = (slot5[slot4[slot4[slot7]]][slot7] + slot5[slot7][slot4[slot4[slot7]]]) * 0.5 / slot2(slot10)
			slot13 = slot3(slot6[1], slot6[2], slot6[3], (slot5[slot4[slot4[slot7]]][slot4[slot7]] - slot5[slot4[slot7]][slot4[slot4[slot7]]]) * 0.5 / slot2(slot10))

			slot13:SetNormalize()

			return slot13
		end
	end,
	SetIdentity = function (slot0)
		slot0.x = 0
		slot0.y = 0
		slot0.z = 0
		slot0.w = 1
	end,
	Slerp = function (slot0, slot1, slot2)
		if slot2 < 0 then
			slot2 = 0
		elseif slot2 > 1 then
			slot2 = 1
		end

		return slot0(slot0, slot1, slot2)
	end,
	RotateTowards = function (slot0, slot1, slot2)
		if slot0:Angle(slot1) == 0 then
			return slot1
		end

		return slot2(slot0, slot1, slot1(1, slot2 / slot3))
	end,
	ToAngleAxis = function (slot0)
		if slot1(2 * slot0(slot0.w), 0) then
			return slot1 * 57.29578, slot2.New(1, 0, 0)
		end

		return slot1 * 57.29578, slot2.New(slot0.x * 1 / slot3(1 - slot3(slot0.w)), slot0.y * 1 / slot3(1 - slot3(slot0.w)), slot0.z * 1 / slot3(1 - slot3(slot0.w)))
	end,
	ToEulerAngles = function (slot0)
		if 2 * (slot0.y * slot0.z - slot0.w * slot0.x) < 0.999 then
			if slot5 > -0.999 then
				slot6 = slot0.New(-slot1(slot5), slot2(2 * (slot1 * slot3 + slot4 * slot2), 1 - 2 * (slot1 * slot1 + slot2 * slot2)), slot2(2 * (slot1 * slot2 + slot4 * slot3), 1 - 2 * (slot1 * slot1 + slot3 * slot3)))

				slot3(slot6)
				slot6:Mul(slot4)

				return slot6
			else
				slot6 = slot0.New(slot5, slot2(2 * (slot1 * slot2 - slot4 * slot3), 1 - 2 * (slot2 * slot2 + slot3 * slot3)), 0)

				slot3(slot6)
				slot6:Mul(slot4)

				return slot6
			end
		else
			slot6 = slot0.New(-slot5, slot2(-2 * (slot1 * slot2 - slot4 * slot3), 1 - 2 * (slot2 * slot2 + slot3 * slot3)), 0)

			slot3(slot6)
			slot6:Mul(slot4)

			return slot6
		end
	end,
	Forward = function (slot0)
		return slot0:MulVec3(slot0)
	end,
	MulVec3 = function (slot0, slot1)
		slot2 = slot0.New()
		slot2.x = (1 - (slot0.y * slot0.y * 2 + slot0.z * slot0.z * 2)) * slot1.x + (slot0.x * slot0.y * 2 - slot0.w * slot0.z * 2) * slot1.y + (slot0.x * slot0.z * 2 + slot0.w * slot0.y * 2) * slot1.z
		slot2.y = (slot0.x * slot0.y * 2 + slot0.w * slot0.z * 2) * slot1.x + (1 - (slot0.x * slot0.x * 2 + slot0.z * slot0.z * 2)) * slot1.y + (slot0.y * slot0.z * 2 - slot0.w * slot0.x * 2) * slot1.z
		slot2.z = (slot0.x * slot0.z * 2 - slot0.w * slot0.y * 2) * slot1.x + (slot0.y * slot0.z * 2 + slot0.w * slot0.x * 2) * slot1.y + (1 - (slot0.x * slot0.x * 2 + slot0.y * slot0.y * 2)) * slot1.z

		return slot2
	end,
	__mul = function (slot0, slot1)
		if slot0 == slot1(slot1) then
			return slot0.New((slot0.w * slot1.x + slot0.x * slot1.w + slot0.y * slot1.z) - slot0.z * slot1.y, (slot0.w * slot1.y + slot0.y * slot1.w + slot0.z * slot1.x) - slot0.x * slot1.z, (slot0.w * slot1.z + slot0.z * slot1.w + slot0.x * slot1.y) - slot0.y * slot1.x, slot0.w * slot1.w - slot0.x * slot1.x - slot0.y * slot1.y - slot0.z * slot1.z)
		elseif slot2 == slot1(slot1) then
			return slot0:MulVec3(slot1)
		end
	end,
	__unm = function (slot0)
		return slot0.New(-slot0.x, -slot0.y, -slot0.z, -slot0.w)
	end,
	__eq = function (slot0, slot1)
		return slot0:Dot(slot1) > 0.999999
	end,
	__tostring = function (slot0)
		return "[" .. slot0.x .. "," .. slot0.y .. "," .. slot0.z .. "," .. slot0.w .. "]"
	end
})["New"]

function slot25(slot0, slot1)
	if slot0[1][1] + slot0[2][2] + slot0[3][3] > 0 then
		slot1.w = 0.5 * slot0(slot2 + 1)
		slot1.x = (slot0[3][2] - slot0[2][3]) * 0.5 / slot0(slot2 + 1)
		slot1.y = (slot0[1][3] - slot0[3][1]) * 0.5 / slot0(slot2 + 1)
		slot1.z = (slot0[2][1] - slot0[1][2]) * 0.5 / slot0(slot2 + 1)

		slot1:SetNormalize()
	else
		slot3 = 1
		slot4 = {
			0,
			0,
			0
		}

		if slot0[1][1] < slot0[2][2] then
			slot3 = 2
		end

		if slot0[slot3][slot3] < slot0[3][3] then
			slot3 = 3
		end

		slot4[slot3] = 0.5 / slot0(slot7) * (slot0[slot3][slot3] - slot0[slot1[slot3]][slot1[slot3]] - slot0[slot1[slot1[slot3]]][slot1[slot1[slot3]]] + 1)
		slot4[slot1[slot3]] = (slot0[slot1[slot3]][slot3] + slot0[slot3][slot1[slot3]]) * 0.5 / slot0(slot7)
		slot4[slot1[slot1[slot3]]] = (slot0[slot1[slot1[slot3]]][slot3] + slot0[slot3][slot1[slot1[slot3]]]) * 0.5 / slot0(slot7)

		slot1:Set(slot4[1], slot4[2], slot4[3], (slot0[slot1[slot1[slot3]]][slot1[slot3]] - slot0[slot1[slot3]][slot1[slot1[slot3]]]) * 0.5 / slot0(slot7))
		slot1:SetNormalize()
	end
end

function slot26(slot0, slot1, slot2)
	if slot0.x * slot1.x + slot0.y * slot1.y + slot0.z * slot1.z + slot0.w * slot1.w < 0 then
		slot3 = -slot3
		slot1 = slot0({
			x = -slot1.x,
			y = -slot1.y,
			z = -slot1.z,
			w = -slot1.w
		}, slot1)
	end

	if slot3 < 0.95 then
		slot4 = slot2(slot3)

		{
			x = slot0.x * slot3((1 - slot2) * slot4) * 1 / slot3(slot4) + slot1.x * slot3(slot2 * slot4) * 1 / slot3(slot4),
			y = slot0.y * slot3((1 - slot2) * slot4) * 1 / slot3(slot4) + slot1.y * slot3(slot2 * slot4) * 1 / slot3(slot4),
			z = slot0.z * slot3((1 - slot2) * slot4) * 1 / slot3(slot4) + slot1.z * slot3(slot2 * slot4) * 1 / slot3(slot4),
			w = slot0.w * slot3((1 - slot2) * slot4) * 1 / slot3(slot4) + slot1.w * slot3(slot2 * slot4) * 1 / slot3(slot4)
		}(, slot1)

		return 
	else
		slot1.SetNormalize(slot0)
		{
			x = slot0.x + slot2 * (slot1.x - slot0.x),
			y = slot0.y + slot2 * (slot1.y - slot0.y),
			z = slot0.z + slot2 * (slot1.z - slot0.z),
			w = slot0.w + slot2 * (slot1.w - slot0.w)
		}(, slot1)

		return 
	end
end

function slot27(slot0, slot1)
	return slot0(slot0 - slot1) < 1e-06
end

slot29 = Mathf.PI * 0.5
slot31 = -0.0001
slot32 = 2 * Mathf.PI - 0.0001

function slot33(slot0)
	if slot0.x < slot0 then
		slot0.x = slot0.x + 
	elseif slot2 < slot0.x then
		slot0.x = slot0.x - 
	end

	if slot0.y < slot0 then
		slot0.y = slot0.y + 
	elseif slot2 < slot0.y then
		slot0.y = slot0.y - 
	end

	if slot0.z < slot0 then
		slot0.z = slot0.z + 
	elseif slot2 < slot0.z then
		slot0.z = slot0.z + 
	end
end

tolua.initget(slot22).identity = function ()
	return slot0(0, 0, 0, 1)
end

tolua.initget(slot22).eulerAngles = ()["ToEulerAngles"]
UnityEngine.Quaternion = 

setmetatable(, )

return 
