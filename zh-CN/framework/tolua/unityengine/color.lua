slot0 = rawget
slot2 = type
slot3 = Mathf
slot5 = tolua.initget(slot4)

function slot6(slot0, slot1, slot2, slot3)
	if slot1 ~= 0 then
		slot5 = 0
		slot7 = 0
		slot8 = 0

		if slot4 - ((slot3 < slot2 and slot3) or slot2) ~= 0 then
			slot8 = slot6 / slot4
			slot7 = slot0 + (slot2 - slot3) / slot6
		else
			slot8 = 0
			slot7 = slot0 + slot2 - slot3
		end

		if slot7 / 6 < 0 then
			slot7 = slot7 + 1
		end

		return slot7, slot8, slot4
	end

	return 0, 0, slot4
end

function slot5.red()
	return slot0.New(1, 0, 0, 1)
end

function slot5.green()
	return slot0.New(0, 1, 0, 1)
end

function slot5.blue()
	return slot0.New(0, 0, 1, 1)
end

function slot5.white()
	return slot0.New(1, 1, 1, 1)
end

function slot5.black()
	return slot0.New(0, 0, 0, 1)
end

function slot5.yellow()
	return slot0.New(1, 0.9215686, 0.01568628, 1)
end

function slot5.cyan()
	return slot0.New(0, 1, 1, 1)
end

function slot5.magenta()
	return slot0.New(1, 0, 1, 1)
end

function slot5.gray()
	return slot0.New(0.5, 0.5, 0.5, 1)
end

function slot5.clear()
	return slot0.New(0, 0, 0, 0)
end

function slot5.gamma(slot0)
	return slot0.New(slot1.LinearToGammaSpace(slot0.r), slot1.LinearToGammaSpace(slot0.g), slot1.LinearToGammaSpace(slot0.b), slot0.a)
end

function slot5.linear(slot0)
	return slot0.New(slot1.GammaToLinearSpace(slot0.r), slot1.GammaToLinearSpace(slot0.g), slot1.GammaToLinearSpace(slot0.b), slot0.a)
end

function slot5.maxColorComponent(slot0)
	return slot0.Max(slot0.Max(slot0.r, slot0.g), slot0.b)
end

slot5.grayscale = ({
	__index = function (slot0, slot1)
		if slot0(slot1, slot1) == nil and slot0(slot2, slot1) ~= nil then
			return slot2(slot0)
		end

		return slot2
	end,
	__call = function (slot0, slot1, slot2, slot3, slot4)
		return slot0({
			r = slot1 or 0,
			g = slot2 or 0,
			b = slot3 or 0,
			a = slot4 or 1
		}, slot1)
	end,
	New = function (slot0, slot1, slot2, slot3)
		return slot0({
			r = slot0 or 0,
			g = slot1 or 0,
			b = slot2 or 0,
			a = slot3 or 1
		}, slot1)
	end,
	Set = function (slot0, slot1, slot2, slot3, slot4)
		slot0.r = slot1
		slot0.g = slot2
		slot0.b = slot3
		slot0.a = slot4 or 1
	end,
	Get = function (slot0)
		return slot0.r, slot0.g, slot0.b, slot0.a
	end,
	Equals = function (slot0, slot1)
		return slot0.r == slot1.r and slot0.g == slot1.g and slot0.b == slot1.b and slot0.a == slot1.a
	end,
	Lerp = function (slot0, slot1, slot2)
		return slot1.New(slot0.r + slot0.Clamp01(slot2) * (slot1.r - slot0.r), slot0.g + slot0.Clamp01(slot2) * (slot1.g - slot0.g), slot0.b + slot0.Clamp01(slot2) * (slot1.b - slot0.b), slot0.a + slot0.Clamp01(slot2) * (slot1.a - slot0.a))
	end,
	LerpUnclamped = function (slot0, slot1, slot2)
		return slot0.New(slot0.r + slot2 * (slot1.r - slot0.r), slot0.g + slot2 * (slot1.g - slot0.g), slot0.b + slot2 * (slot1.b - slot0.b), slot0.a + slot2 * (slot1.a - slot0.a))
	end,
	HSVToRGB = function (slot0, slot1, slot2, slot3)
		if slot3 then
		end

		slot3 = true
		slot4 = slot0.New(1, 1, 1, 1)

		if slot1 == 0 then
			slot4.r = slot2
			slot4.g = slot2
			slot4.b = slot2

			return slot4
		end

		if slot2 == 0 then
			slot4.r = 0
			slot4.g = 0
			slot4.b = 0

			return slot4
		end

		slot4.r = 0
		slot4.g = 0
		slot4.b = 0
		slot10 = slot2 * (1 - slot1)
		slot11 = slot2 * (1 - slot1 * (slot0 * 6 - slot1.Floor(slot7)))
		slot12 = slot2 * (1 - slot1 * (1 - (slot0 * 6 - slot1.Floor(slot7))))

		if slot1.Floor(slot7) + 1 == 0 then
			slot4.r = slot6
			slot4.g = slot10
			slot4.b = slot11
		elseif slot14 == 1 then
			slot4.r = slot6
			slot4.g = slot12
			slot4.b = slot10
		elseif slot14 == 2 then
			slot4.r = slot11
			slot4.g = slot6
			slot4.b = slot10
		elseif slot14 == 3 then
			slot4.r = slot10
			slot4.g = slot6
			slot4.b = slot12
		elseif slot14 == 4 then
			slot4.r = slot10
			slot4.g = slot11
			slot4.b = slot6
		elseif slot14 == 5 then
			slot4.r = slot12
			slot4.g = slot10
			slot4.b = slot6
		elseif slot14 == 6 then
			slot4.r = slot6
			slot4.g = slot10
			slot4.b = slot11
		elseif slot14 == 7 then
			slot4.r = slot6
			slot4.g = slot12
			slot4.b = slot10
		end

		if not slot3 then
			slot4.r = slot1.Clamp(slot4.r, 0, 1)
			slot4.g = slot1.Clamp(slot4.g, 0, 1)
			slot4.b = slot1.Clamp(slot4.b, 0, 1)
		end

		return slot4
	end,
	RGBToHSV = function (slot0)
		if slot0.g < slot0.b and slot0.r < slot0.b then
			return slot0(4, slot0.b, slot0.r, slot0.g)
		elseif slot0.r < slot0.g then
			return slot0(2, slot0.g, slot0.b, slot0.r)
		else
			return slot0(0, slot0.r, slot0.g, slot0.b)
		end
	end,
	GrayScale = function (slot0)
		return 0.299 * slot0.r + 0.587 * slot0.g + 0.114 * slot0.b
	end,
	__tostring = function (slot0)
		return string.format("RGBA(%f,%f,%f,%f)", slot0.r, slot0.g, slot0.b, slot0.a)
	end,
	__add = function (slot0, slot1)
		return slot0.New(slot0.r + slot1.r, slot0.g + slot1.g, slot0.b + slot1.b, slot0.a + slot1.a)
	end,
	__sub = function (slot0, slot1)
		return slot0.New(slot0.r - slot1.r, slot0.g - slot1.g, slot0.b - slot1.b, slot0.a - slot1.a)
	end,
	__mul = function (slot0, slot1)
		if slot0(slot1) == "number" then
			return slot1.New(slot0.r * slot1, slot0.g * slot1, slot0.b * slot1, slot0.a * slot1)
		elseif getmetatable(slot1) == slot1 then
			return slot1.New(slot0.r * slot1.r, slot0.g * slot1.g, slot0.b * slot1.b, slot0.a * slot1.a)
		end
	end,
	__div = function (slot0, slot1)
		return slot0.New(slot0.r / slot1, slot0.g / slot1, slot0.b / slot1, slot0.a / slot1)
	end,
	__eq = function (slot0, slot1)
		return slot0.r == slot1.r and slot0.g == slot1.g and slot0.b == slot1.b and slot0.a == slot1.a
	end
})["GrayScale"]
UnityEngine.Color = 

setmetatable(, )

return 
