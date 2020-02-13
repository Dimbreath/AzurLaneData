slot0 = class("PropertyPanel")
slot1 = 24.5
slot2 = {
	"cannon",
	"torpedo",
	"air",
	"dodge",
	"antiaircraft",
	"durability"
}
slot3 = {
	E = 1,
	C = 3,
	A = 5,
	D = 2,
	S = 6,
	B = 4
}
slot4 = {
	{
		0,
		70.8
	},
	{
		-169.6,
		37.7
	},
	{
		-210.4,
		-49.8
	},
	{
		-0.9,
		-111.1
	},
	{
		210.1,
		-49.6
	},
	{
		169.9,
		38.4
	}
}
slot5 = 1
slot6 = 3
slot7 = 4
slot8 = 2
slot9 = 5
slot0.TypeRotation = 1
slot0.TypeFlat = 2

function slot0.Ctor(slot0, slot1, slot2)
	if not slot2 then
		slot3 = slot0
	end

	slot3 = slot2 or slot0
	slot2 or slot0.tf = slot1
	slot2 or slot0.propertyTFs = findTF(slot2 or slot0.tf, "property")
	slot2 or slot0.drawTF = findTF(slot2 or slot0.tf, "property/draw")
	slot3.drawPolygon = slot2 or slot0.drawTF:GetComponent("DrawPolygon")
	slot3.drawTF2 = findTF(slot3.tf, "property/draw_2")

	if slot3.drawTF2 then
		slot0.drawPolygon2 = slot0.drawTF2:GetComponent("DrawPolygon")
	end
end

function slot0.initProperty(slot0, slot1, slot2)
	if not slot2 then
		slot3 = slot0.TypeRotation
	end

	slot0.type = slot3

	slot0:initRadar(ShipGroup.GetGroupConfig(slot3).property_hexagon)
end

function slot0.initRadar(slot0, slot1)
	slot3 = {}

	table.insert(slot2, Vector3(0, 0, 0))

	for slot7, slot8 in ipairs(slot0) do
		slot0:setSpriteTo("resources/" .. slot10, slot0.propertyTFs:Find(slot8 .. "_grade").Find(slot9, "grade"), true)

		if slot0.type == slot1.TypeRotation then
			table.insert(slot2, slot0:getGradeCoordinate(slot10, slot7))
		elseif slot0.type == slot1.TypeFlat then
			table.insert(slot2, slot0:getGradeCoordinate1(slot10, slot7))
		end

		table.insert(slot3, 0)
		table.insert(slot3, slot7)

		if slot7 + 1 > #slot0 then
			table.insert(slot3, 1)
		else
			table.insert(slot3, slot7 + 1)
		end
	end

	slot0.drawPolygon:draw(slot2, slot3)

	if slot0.drawPolygon2 then
		slot0.drawPolygon2:draw(slot2, slot3)
	end
end

function slot0.getGradeCoordinate(slot0, slot1, slot2)
	return Vector3(0.163 * slot0[slot1] * slot1[slot2][1], 0.163 * slot0[slot1] * slot1[slot2][2], 0)
end

function slot0.getGradeCoordinate1(slot0, slot1, slot2)
	slot3 = 0.66 * slot0[slot1]

	if slot2 == slot1 then
		return Vector3(-slot3 * slot2, 0, 0)
	elseif slot2 == slot3 then
		return Vector3(slot3 * slot2, 0, 0)
	else
		slot6 = math.sin(math.rad(slot4)) * slot3 * slot2
		slot7 = math.cos(math.rad(60)) * slot3 * slot2

		if slot2 == 60 then
			slot7 = -slot7
		elseif slot2 == slot5 then
			slot7 = -slot7
			slot6 = -slot6
		elseif slot2 == slot6 then
			slot6 = -slot6
		end

		return Vector3(slot7, slot6, 0)
	end
end

function slot0.setSpriteTo(slot0, slot1, slot2, slot3)
	slot2:GetComponent(typeof(Image)).sprite = findTF(slot0.tf, slot1):GetComponent(typeof(Image)).sprite

	if slot3 then
		slot4:SetNativeSize()
	end
end

return slot0
