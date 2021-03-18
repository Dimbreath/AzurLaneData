slot0 = class("EquipmentsDict")

function slot0.Ctor(slot0)
	slot1 = {}

	for slot6, slot7 in pairs(getProxy(EquipmentProxy):GetEquipmentsRaw()) do
		slot1[slot7.id] = slot1[slot7.id] or {}

		table.insert(slot1[slot7.id], CreateShell(slot7))
	end

	for slot6, slot7 in pairs(getProxy(BayProxy):GetEquipsInShipsRaw()) do
		slot1[slot7.id] = slot1[slot7.id] or {}

		table.insert(slot1[slot7.id], slot7)
	end

	slot0.data = slot1
end

function slot0.GetSameTypeInEquips(slot0, slot1)
	slot2 = {}
	slot3 = slot0.data

	while slot1 ~= nil do
		if slot3[slot1] then
			table.insertto(slot2, slot3[slot1])
		end

		slot1 = pg.equip_data_template[slot1] and pg.equip_data_template[slot1].next
	end

	return slot2
end

function slot0.GetEquipTraceBack(slot0, slot1, slot2, slot3)
	slot4 = slot0.data

	if #EquipmentProxy.GetTransformSources(slot1) == 0 then
		table.insert(slot3 or {}, slot2 or {
			slot1
		})
	end

	for slot9, slot10 in ipairs(slot5) do
		slot11 = pg.equip_upgrade_data[slot10].upgrade_from
		slot12 = slot9 == #slot5 and slot2 or Clone(slot2)

		table.insert(slot12, slot11)

		slot12.formulas = slot12.formulas or {}

		table.insert(slot12.formulas, 1, slot10)

		if #slot0:GetSameTypeInEquips(slot11) > 0 then
			slot12.candicates = slot13

			table.insert(slot3, slot12)
		elseif slot11 == 0 then
			slot12.candicates = {
				setmetatable({
					id = 0
				}, Equipment)
			}

			table.insert(slot3, slot12)
		else
			slot0:GetEquipTraceBack(slot11, slot12, slot3)
		end
	end

	return slot3
end

function slot0.GetSortedEquipTraceBack(slot0, ...)
	slot1 = slot0:GetEquipTraceBack(...)

	table.sort(slot1, function (slot0, slot1)
		if #slot0 ~= #slot1 then
			return #slot0 < #slot1
		else
			for slot5 = 1, #slot0 do
				if slot0[slot5] ~= slot1[1] then
					return slot0[slot5] < slot1[slot5]
				end
			end

			return false
		end
	end)

	return slot1
end

function slot0.FindTheEquip(slot0, slot1)
	slot2 = slot0.data

	if not slot1 or not slot2[slot1.id] then
		return
	end

	for slot6, slot7 in ipairs(slot2[slot1.id]) do
		if EquipmentProxy.SameEquip(slot1, slot7) then
			return slot6, slot7
		end
	end
end

function slot0.AddEquipment(slot0, slot1)
	slot2[slot1.id] = slot0.data[slot1.id] or {}
	slot2[slot1.id][slot0:FindTheEquip(slot1) or #slot2[slot1.id] + 1] = slot1
end

function slot0.RemoveEquipment(slot0, slot1)
	if not slot1 or not slot0.data[slot1.id] then
		return
	end

	if not slot0:FindTheEquip(slot1) then
		return
	end

	table.remove(slot2[slot1.id], slot3)
end

function slot0.UpdateEquipment(slot0, slot1)
	slot2 = slot0.data

	if slot1.count == 0 then
		slot0:RemoveEquipment(slot1)
	else
		slot0:AddEquipment(slot1)
	end
end

return slot0
