function slot0.CalcMoves(slot0, slot1, slot2, slot3, slot4)
	slot5 = {}
	slot6 = {}
	slot8 = 0
	slot9 = math.abs(slot1 - slot3) + math.abs(slot2 - slot4)
	slot10 = 0
	slot11.x = slot1
	slot11.y = slot2
	slot11.h = slot9
	slot11.f = 0 + slot9
	slot5[1] = {
		g = 0,
		par = 1
	}
	slot11 = table.getn(slot0[1])
	slot12 = table.getn(slot0)
	slot13 = {}
	slot14 = 1

	while 1 > 0 do
		slot14 = slot7

		for slot19 = slot7, 1, -1 do
			if slot5[slot19].f < slot5[slot7].f then
				slot15 = slot5[slot19].f
				slot14 = slot19
			end
		end

		slot8 = slot8 + 1

		table.insert(slot6, slot8, slot5[slot14])

		slot13 = slot6[slot8]
		slot16 = true
		slot17 = true
		slot18 = true
		slot19 = true

		if slot8 > 0 then
			for slot23 = 1, slot8, 1 do
				if slot6[slot23].x == slot13.x + 1 and slot6[slot23].y == slot13.y then
					slot16 = false
				end

				if slot6[slot23].x == slot13.x - 1 and slot6[slot23].y == slot13.y then
					slot17 = false
				end

				if slot6[slot23].x == slot13.x and slot6[slot23].y == slot13.y + 1 then
					slot18 = false
				end

				if slot6[slot23].x == slot13.x and slot6[slot23].y == slot13.y - 1 then
					slot19 = false
				end
			end
		end

		if slot11 < slot13.x + 1 then
			slot16 = false
		end

		if slot13.x - 1 < 1 then
			slot17 = false
		end

		if slot12 < slot13.y + 1 then
			slot18 = false
		end

		if slot13.y - 1 < 1 then
			slot19 = false
		end

		if slot11 >= slot13.x + 1 and slot0[slot13.y][slot13.x + 1] ~= 0 then
			slot16 = false
		end

		if slot13.x - 1 >= 1 and slot0[slot13.y][slot13.x - 1] ~= 0 then
			slot17 = false
		end

		if slot12 >= slot13.y + 1 and slot0[slot13.y + 1][slot13.x] ~= 0 then
			slot18 = false
		end

		if slot13.y - 1 >= 1 and slot0[slot13.y - 1][slot13.x] ~= 0 then
			slot19 = false
		end

		slot10 = slot13.g + 1

		for slot23 = 1, slot7, 1 do
			if slot16 and slot5[slot23].x == slot13.x + 1 and slot5[slot23].y == slot13.y and slot10 < slot5[slot23].g then
				slot9 = math.abs(slot13.x + 1 - slot3) + math.abs(slot13.y - slot4)
				slot27.x = slot13.x + 1
				slot27.y = slot13.y
				slot27.g = slot10
				slot27.h = slot9
				slot27.f = slot10 + slot9
				slot27.par = slot8

				table.insert(slot5, slot23, {})

				slot16 = false
			end

			if slot17 and slot5[slot23].x == slot13.x - 1 and slot5[slot23].y == slot13.y and slot10 < slot5[slot23].g then
				slot9 = math.abs(slot13.x - 1 - slot3) + math.abs(slot13.y - slot4)
				slot27.x = slot13.x - 1
				slot27.y = slot13.y
				slot27.g = slot10
				slot27.h = slot9
				slot27.f = slot10 + slot9
				slot27.par = slot8

				table.insert(slot5, slot23, {})

				slot17 = false
			end

			if slot18 and slot5[slot23].x == slot13.x and slot5[slot23].y == slot13.y + 1 and slot10 < slot5[slot23].g then
				slot9 = math.abs(slot13.x - slot3) + math.abs(slot13.y + 1 - slot4)
				slot27.x = slot13.x
				slot27.y = slot13.y + 1
				slot27.g = slot10
				slot27.h = slot9
				slot27.f = slot10 + slot9
				slot27.par = slot8

				table.insert(slot5, slot23, {})

				slot18 = false
			end

			if slot19 and slot5[slot23].x == slot13.x and slot5[slot23].y == slot13.y - 1 and slot10 < slot5[slot23].g then
				slot9 = math.abs(slot13.x - slot3) + math.abs(slot13.y - 1 - slot4)
				slot27.x = slot13.x
				slot27.y = slot13.y - 1
				slot27.g = slot10
				slot27.h = slot9
				slot27.f = slot10 + slot9
				slot27.par = slot8

				table.insert(slot5, slot23, {})

				slot19 = false
			end
		end

		if slot16 then
			slot9 = math.abs(slot13.x + 1 - slot3) + math.abs(slot13.y - slot4)
			slot23.x = slot13.x + 1
			slot23.y = slot13.y
			slot23.g = slot10
			slot23.h = slot9
			slot23.f = slot10 + slot9
			slot23.par = slot8

			table.insert(slot5, slot7 + 1, {})
		end

		if slot17 then
			slot9 = math.abs(slot13.x - 1 - slot3) + math.abs(slot13.y - slot4)
			slot23.x = slot13.x - 1
			slot23.y = slot13.y
			slot23.g = slot10
			slot23.h = slot9
			slot23.f = slot10 + slot9
			slot23.par = slot8

			table.insert(slot5, slot7 + 1, {})
		end

		if slot18 then
			slot9 = math.abs(slot13.x - slot3) + math.abs(slot13.y + 1 - slot4)
			slot23.x = slot13.x
			slot23.y = slot13.y + 1
			slot23.g = slot10
			slot23.h = slot9
			slot23.f = slot10 + slot9
			slot23.par = slot8

			table.insert(slot5, slot7 + 1, {})
		end

		if slot19 then
			slot9 = math.abs(slot13.x - slot3) + math.abs(slot13.y - 1 - slot4)
			slot23.x = slot13.x
			slot23.y = slot13.y - 1
			slot23.g = slot10
			slot23.h = slot9
			slot23.f = slot10 + slot9
			slot23.par = slot8

			table.insert(slot5, slot7 + 1, {})
		end

		table.remove(slot5, slot14)

		slot7 = slot7 - 1

		if slot6[slot8].x == slot3 and slot6[slot8].y == slot4 then
			return slot6
		end
	end

	return nil
end

function slot0.CalcPath(slot0)
	if slot0 == nil then
		return nil
	end

	slot1 = {}

	table.insert({}, 1, table.getn(slot0))

	while slot2[1] > 1 do
		slot4 = slot4 + 1

		table.insert(slot2, slot4, slot0[slot2[slot4 - 1]].par)
	end

	for slot8 = table.getn(slot2), 1, -1 do
		slot11.x = slot0[slot2[slot8]].x
		slot11.y = slot0[slot2[slot8]].y

		table.insert(slot1, {})
	end

	slot0 = nil

	return slot1
end

return {}
