slot0 = class("EquipmentRarity")
slot0.Gray = 2
slot0.Blue = 3
slot0.Purple = 4
slot0.Gold = 5
slot0.SSR = 6

function slot0.Rarity2Print(slot0)
	if not slot0.prints then
		slot0.prints = {
			"1",
			"1",
			"2",
			"3",
			"4",
			"5",
			nil,
			"7"
		}
	end

	return slot0.prints[slot0]
end

return slot0
