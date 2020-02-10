slot0 = class("ArmorType")
slot0.Light = 1
slot0.Medium = 2
slot0.Heavy = 3

function slot0.Type2Name(slot0)
	if not uv0.names then
		slot2[1] = i18n("word_lightArmor")
		slot2[2] = i18n("word_mediumArmor")
		slot2[MULTRES] = i18n("word_heavyarmor")
		uv0.names = {}
	end

	return uv0.names[slot0]
end

return slot0
