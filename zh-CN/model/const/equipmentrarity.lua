slot0 = class("EquipmentRarity")
slot0.Gray = 2
slot0.Blue = 3
slot0.Purple = 4
slot0.Gold = 5
slot0.SSR = 6

function slot0.Rarity2Print(slot0)
	if not uv0.prints then
		uv0.prints = {
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

	return uv0.prints[slot0]
end

return slot0
