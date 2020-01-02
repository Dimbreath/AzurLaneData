slot1 = math.acos
slot2 = math.sqrt
slot3 = math.max
slot4 = math.min
slot5 = Mathf.Clamp
slot6 = math.cos
slot7 = math.sin
slot8 = math.abs
slot9 = Mathf.Sign
slot11 = rawset
slot12 = rawget
slot13 = type
slot14 = 57.295779513082
slot15 = 0.017453292519943
slot17 = tolua.initget(slot16)
slot18 = ({
	__index = function (slot0, slot1)
		if slot0(slot1, slot1) == nil and slot0(slot2, slot1) ~= nil then
			return slot2(slot0)
		end

		return slot2
	end,
	New = function (slot0, slot1, slot2)
		slot0({
			x = slot0 or 0,
			y = slot1 or 0,
			z = slot2 or 0
		}, slot1)

		return 
	end,
	__call = function (slot0, slot1, slot2, slot3)
		slot0({
			x = slot1 or 0,
			y = slot2 or 0,
			z = slot3 or 0
		}, slot1)

		return 
	end,
	Set = function (slot0, slot1, slot2, slot3)
		slot0.x = slot1 or 0
		slot0.y = slot2 or 0
		slot0.z = slot3 or 0
	end,
	Get = function (slot0)
		return slot0.x, slot0.y, slot0.z
	end,
	Clone = function (slot0)
		return slot0({
			x = slot0.x,
			y = slot0.y,
			z = slot0.z
		}, slot0)
	end,
	Copy = function (slot0, slot1)
		slot0.x = slot1.x
		slot0.y = slot1.y
		slot0.z = slot1.z

		return slot0
	end,
	Copy2 = function (slot0, slot1)
		if slot1 then
			slot1.x = slot0.x
			slot1.y = slot0.y
			slot1.z = slot0.z

			return slot1
		else
			return slot0(slot0.x, slot0.y, slot0.z)
		end
	end,
	Distance = function (slot0, slot1)
		return slot0((slot0.x - slot1.x)^2 + (slot0.y - slot1.y)^2 + (slot0.z - slot1.z)^2)
	end,
	SqrDistance = function (slot0, slot1)
		return (slot0.x - slot1.x)^2 + (slot0.y - slot1.y)^2 + (slot0.z - slot1.z)^2
	end,
	Dot = function (slot0, slot1)
		return slot0.x * slot1.x + slot0.y * slot1.y + slot0.z * slot1.z
	end,
	Lerp = function (slot0, slot1, slot2)
		return slot1(slot0.x + (slot1.x - slot0.x) * slot0(slot2, 0, 1), slot0.y + (slot1.y - slot0.y) * slot0(slot2, 0, 1), slot0.z + (slot1.z - slot0.z) * slot0(slot2, 0, 1))
	end,
	Magnitude = function (slot0)
		return slot0(slot0.x * slot0.x + slot0.y * slot0.y + slot0.z * slot0.z)
	end,
	Max = function (slot0, slot1)
		return slot0(slot1(slot0.x, slot1.x), slot1(slot0.y, slot1.y), slot1(slot0.z, slot1.z))
	end,
	Min = function (slot0, slot1)
		return slot0(slot1(slot0.x, slot1.x), slot1(slot0.y, slot1.y), slot1(slot0.z, slot1.z))
	end,
	Normalize = function (slot0)
		if slot0(slot0.x *  + slot0.y *  + slot0.z * ) > 1e-05 then
			return slot1({
				x = slot1 / slot4,
				y = slot2 / slot4,
				z = slot3 / slot4
			}, slot2)
		end

		return slot1({
			z = 0,
			x = 0,
			y = 0
		}, slot2)
	end,
	SetNormalize = function (slot0)
		if slot0(slot0.x * slot0.x + slot0.y * slot0.y + slot0.z * slot0.z) > 1e-05 then
			slot0.x = slot0.x / slot1
			slot0.y = slot0.y / slot1
			slot0.z = slot0.z / slot1
		else
			slot0.x = 0
			slot0.y = 0
			slot0.z = 0
		end

		return slot0
	end,
	SqrMagnitude = function (slot0)
		return slot0.x * slot0.x + slot0.y * slot0.y + slot0.z * slot0.z
	end,
	Angle = function (slot0, slot1)
		return slot0(slot1(slot2(slot0:Normalize(), slot1:Normalize()), -1, 1)) * slot1
	end,
	ClampMagnitude = function (slot0, slot1)
		if slot0:SqrMagnitude() > slot1 * slot1 then
			slot0:SetNormalize()
			slot0:Mul(slot1)
		end

		return slot0
	end,
	OrthoNormalize = function (slot0, slot1, slot2)
		slot0:SetNormalize()
		slot1:Sub(slot1:Project(slot0))
		slot1:SetNormalize()

		if slot2 == nil then
			return slot0, slot1
		end

		slot2:Sub(slot2:Project(slot0))
		slot2:Sub(slot2:Project(slot1))
		slot2:SetNormalize()

		return slot0, slot1, slot2
	end,
	MoveTowards = function (slot0, slot1, slot2)
		if slot1 - slot0.SqrMagnitude(slot3) > slot2 * slot2 then
			if slot0(slot4) > 1e-06 then
				slot3:Mul(slot2 / slot6)
				slot3:Add(slot0)

				return slot3
			else
				return slot0:Clone()
			end
		end

		return slot1:Clone()
	end,
	RotateTowards = function (slot0, slot1, slot2, slot3)
		slot5 = slot1:Magnitude()

		if slot0:Magnitude() > 1e-06 and slot5 > 1e-06 then
			if slot0(slot6, slot1 / slot5) > 0.999999 then
				return slot1.MoveTowards(slot0, slot1, slot3)
			elseif slot8 < -0.999999 then
				slot11 = Quaternion.AngleAxis(slot2 * slot3, slot9).MulVec3(slot10, slot6)

				slot11:Mul(ClampedMove(slot4, slot5, slot3))

				return slot11
			else
				slot10 = slot1.Cross(slot6, slot7)

				slot10:SetNormalize()

				slot12 = Quaternion.AngleAxis(slot5(slot2, slot9) * slot3, slot10).MulVec3(slot11, slot6)

				slot12:Mul(ClampedMove(slot4, slot5, slot3))

				return slot12
			end
		end

		return slot1.MoveTowards(slot0, slot1, slot3)
	end,
	SmoothDamp = function (slot0, slot1, slot2, slot3)
		slot0 - slot1.ClampMagnitude(slot11, slot10)

		slot2 = (slot2 - (slot2 + (slot0 - slot1) * 2 / slot0(0.0001, slot3)) * Time.deltaTime * 2 / slot0(0.0001, slot3)) * 1 / (1 + 2 / slot0(0.0001, slot3) * Time.deltaTime + 0.48 * 2 / slot0(0.0001, slot3) * Time.deltaTime * 2 / slot0(0.0001, slot3) * Time.deltaTime + 0.235 * 2 / slot0(0.0001, slot3) * Time.deltaTime * 2 / slot0(0.0001, slot3) * Time.deltaTime * 2 / slot0(0.0001, slot3) * Time.deltaTime)

		if slot1.Dot(slot1:Clone() - slot0, (slot0 - (slot0 - slot1) + (slot0 - slot1 + (slot2 + (slot0 - slot1) * 2 / slot0(0.0001, slot3)) * Time.deltaTime) * 1 / (1 + 2 / slot0(0.0001, slot3) * Time.deltaTime + 0.48 * 2 / slot0(0.0001, slot3) * Time.deltaTime * 2 / slot0(0.0001, slot3) * Time.deltaTime + 0.235 * 2 / slot0(0.0001, slot3) * Time.deltaTime * 2 / slot0(0.0001, slot3) * Time.deltaTime * 2 / slot0(0.0001, slot3) * Time.deltaTime)) - slot1.Clone()) > 0 then
			slot13 = slot9

			slot2:Set(0, 0, 0)
		end

		return slot13, slot2
	end,
	Scale = function (slot0, slot1)
		return slot0(slot0.x * slot1.x, slot0.y * slot1.y, slot0.z * slot1.z)
	end,
	Cross2 = function (slot0, slot1)
		slot0.z = slot0.x * slot1.y - slot0.y * slot1.x
		slot0.y = slot0.z * slot1.x - slot0.x * slot1.z
		slot0.x = slot0.y * slot1.z - slot0.z * slot1.y

		return slot0
	end,
	Cross = function (slot0, slot1)
		return slot0(slot0.y * slot1.z - slot0.z * slot1.y, slot0.z * slot1.x - slot0.x * slot1.z, slot0.x * slot1.y - slot0.y * slot1.x)
	end,
	Equals = function (slot0, slot1)
		return slot0.x == slot1.x and slot0.y == slot1.y and slot0.z == slot1.z
	end,
	EqualZero = function (slot0)
		return slot0.x * slot0.x + slot0.y * slot0.y + slot0.z * slot0.z < 1e-10
	end,
	Reflect = function (slot0, slot1)
		slot1 * -2 * slot0(slot1, slot0):Add(slot0)

		return slot1 * -2 * slot0(slot1, slot0)
	end,
	Project = function (slot0, slot1)
		if slot1:SqrMagnitude() < 1.175494e-38 then
			return slot0(0, 0, 0)
		end

		slot4 = slot1:Clone()

		slot4:Mul(slot1(slot0, slot1) / slot2)

		return slot4
	end,
	ProjectOnPlane = function (slot0, slot1)
		slot2 = slot0:Project(slot1)

		slot2:Mul(-1)
		slot2:Add(slot0)

		return slot2
	end,
	Slerp = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6 = nil

		if slot2 <= 0 then
			return slot0:Clone()
		elseif slot2 >= 1 then
			return slot1:Clone()
		end

		slot7 = slot1:Clone()
		slot8 = slot0:Clone()
		slot10 = slot0:Magnitude()

		slot7:Div(slot9)
		slot8:Div(slot10)

		slot11 = (slot1:Magnitude() - slot10) * slot2 + slot10

		if slot8.x * slot7.x + slot8.y * slot7.y + slot8.z * slot7.z > 0.999999 then
			slot5 = 1 - slot2
			slot6 = slot2
		elseif slot12 < -0.999999 then
			slot15 = Quaternion.AngleAxis(180 * slot2, slot13).MulVec3(slot14, slot0)

			slot15:Mul(slot11)

			return slot15
		else
			slot5 = slot2((1 - slot2) * slot1(slot12)) / slot2(slot3)
			slot6 = slot2(slot2 * slot1(slot12)) / slot2(slot3)
		end

		slot8:Mul(slot5)
		slot7:Mul(slot6)
		slot7:Add(slot8)
		slot7:Mul(slot11)

		return slot7
	end,
	Mul = function (slot0, slot1)
		if slot0(slot1) == "number" then
			slot0.x = slot0.x * slot1
			slot0.y = slot0.y * slot1
			slot0.z = slot0.z * slot1
		else
			slot0:MulQuat(slot1)
		end

		return slot0
	end,
	Div = function (slot0, slot1)
		slot0.x = slot0.x / slot1
		slot0.y = slot0.y / slot1
		slot0.z = slot0.z / slot1

		return slot0
	end,
	Add = function (slot0, slot1)
		slot0.x = slot0.x + slot1.x
		slot0.y = slot0.y + slot1.y
		slot0.z = slot0.z + slot1.z

		return slot0
	end,
	Sub = function (slot0, slot1)
		slot0.x = slot0.x - slot1.x
		slot0.y = slot0.y - slot1.y
		slot0.z = slot0.z - slot1.z

		return slot0
	end,
	MulQuat = function (slot0, slot1)
		slot0:Set((1 - (slot1.y * slot1.y * 2 + slot1.z * slot1.z * 2)) * slot0.x + (slot1.x * slot1.y * 2 - slot1.w * slot1.z * 2) * slot0.y + (slot1.x * slot1.z * 2 + slot1.w * slot1.y * 2) * slot0.z, (slot1.x * slot1.y * 2 + slot1.w * slot1.z * 2) * slot0.x + (1 - (slot1.x * slot1.x * 2 + slot1.z * slot1.z * 2)) * slot0.y + (slot1.y * slot1.z * 2 - slot1.w * slot1.x * 2) * slot0.z, (slot1.x * slot1.z * 2 - slot1.w * slot1.y * 2) * slot0.x + (slot1.y * slot1.z * 2 + slot1.w * slot1.x * 2) * slot0.y + (1 - (slot1.x * slot1.x * 2 + slot1.y * slot1.y * 2)) * slot0.z)

		return slot0
	end,
	AngleAroundAxis = function (slot0, slot1, slot2)
		return slot0:Angle(slot1) * ((slot0.Dot(slot2, slot0.Cross(slot0 - slot0:Project(slot2), slot1 - slot0.Project(slot1, slot2))) < 0 and -1) or 1)
	end,
	__tostring = function (slot0)
		return "[" .. slot0.x .. "," .. slot0.y .. "," .. slot0.z .. "]"
	end,
	__div = function (slot0, slot1)
		return slot0(slot0.x / slot1, slot0.y / slot1, slot0.z / slot1)
	end,
	__mul = function (slot0, slot1)
		if slot0(slot1) == "number" then
			return slot1(slot0.x * slot1, slot0.y * slot1, slot0.z * slot1)
		else
			slot2 = slot0:Clone()

			slot2:MulQuat(slot1)

			return slot2
		end
	end,
	__add = function (slot0, slot1)
		return slot0(slot0.x + slot1.x, slot0.y + slot1.y, slot0.z + slot1.z)
	end,
	__sub = function (slot0, slot1)
		return slot0(slot0.x - slot1.x, slot0.y - slot1.y, slot0.z - slot1.z)
	end,
	__unm = function (slot0)
		return slot0(-slot0.x, -slot0.y, -slot0.z)
	end,
	__eq = function (slot0, slot1)
		return (slot0.x - slot1.x) * (slot0.x - slot1.x) + (slot0.y - slot1.y) * (slot0.y - slot1.y) + (slot0.z - slot1.z) * (slot0.z - slot1.z) < 1e-10
	end
})["New"]
slot19 = ()["Dot"]

function ClampedMove(slot0, slot1, slot2)
	if slot1 - slot0 > 0 then
		return slot0 + slot0(slot3, slot2)
	else
		return slot0 - slot0(-slot3, slot2)
	end
end

slot20 = 0.7071067811865476

function slot21(slot0)
	if slot1(slot0.z) <  then
		slot1.x = 0
		slot1.y = -slot0.z * 1 / slot0.z * slot0.z(slot2)
		slot1.z = slot0.y * 1 / slot0.z * slot0.z(slot2)
	else
		slot1.x = -slot0.y * 1 / slot0.y * slot0.y(slot2)
		slot1.y = slot0.x * 1 / slot0.y * slot0.y(slot2)
		slot1.z = 0
	end

	return slot1
end

function slot17.up()
	return slot0(0, 1, 0)
end

function slot17.down()
	return slot0(0, -1, 0)
end

function slot17.right()
	return slot0(1, 0, 0)
end

function slot17.left()
	return slot0(-1, 0, 0)
end

function slot17.forward()
	return slot0(0, 0, 1)
end

function slot17.back()
	return slot0(0, 0, -1)
end

function slot17.zero()
	return slot0(0, 0, 0)
end

function slot17.one()
	return slot0(1, 1, 1)
end

slot17.magnitude = ()["Magnitude"]
slot17.normalized = ()["Normalize"]
slot17.sqrMagnitude = ()["SqrMagnitude"]
UnityEngine.Vector3 = 

setmetatable(, )

return 
