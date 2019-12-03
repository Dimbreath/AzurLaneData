slot0 = class("Nation")
slot0.CM = 0
slot0.US = 1
slot0.EN = 2
slot0.JP = 3
slot0.DE = 4
slot0.CN = 5
slot0.ITA = 6
slot0.SN = 7
slot0.FF = 8
slot0.MNF = 9
slot0.LINK = 100

function slot0.IsLinkType(slot0)
	return slot0.LINK < slot0
end

function slot0.Nation2Print(slot0)
	if not slot0.prints then
		slot0.prints = {
			[0] = "cm",
			"us",
			"en",
			"jp",
			"de",
			"cn",
			"ita",
			"sn",
			"ff",
			"mnf",
			[101.0] = "np",
			[102.0] = "bili",
			[104.0] = "um",
			[103.0] = "um",
			[105.0] = "um"
		}
	end

	return slot0.prints[slot0]
end

function slot0.Nation2Side(slot0)
	if not slot0.side then
		slot0.side = {
			[0] = "West",
			"West",
			"West",
			"Jp",
			"West",
			"Cn",
			"West",
			"West",
			"West",
			"West",
			[101.0] = "Jp",
			[102.0] = "Cn",
			[104.0] = "West",
			[103.0] = "Jp",
			[105.0] = "Jp"
		}
	end

	return slot0.side[slot0]
end

function slot0.Nation2BG(slot0)
	if not slot0.bg then
		slot0.bg = {
			[0] = "bg/bg_church",
			"bg/bg_church",
			"bg/bg_church",
			"bg/bg_church_jp",
			"bg/bg_church",
			"bg/bg_church_cn",
			"bg/bg_church",
			"bg/bg_church",
			"bg/bg_church",
			"bg/bg_church",
			[101.0] = "bg/bg_church",
			[102.0] = "bg/bg_church",
			[104.0] = "bg/bg_church",
			[103.0] = "bg/bg_church",
			[105.0] = "bg/bg_church"
		}
	end

	return slot0.bg[slot0]
end

function slot0.Nation2Name(slot0)
	if not slot0.nationName then
		slot0.nationName = {
			[0] = i18n("word_shipNation_other"),
			i18n("word_shipNation_baiYing"),
			i18n("word_shipNation_huangJia"),
			i18n("word_shipNation_chongYing"),
			i18n("word_shipNation_tieXue"),
			i18n("word_shipNation_dongHuang"),
			i18n("word_shipNation_saDing"),
			i18n("word_shipNation_beiLian"),
			i18n("word_shipNation_ziyou"),
			i18n("word_shipNation_weixi"),
			[101] = i18n("word_shipNation_np"),
			[102] = i18n("word_shipNation_bili"),
			[103] = i18n("word_shipNation_um"),
			[104] = i18n("word_shipNation_ai"),
			[105] = i18n("word_shipNation_holo")
		}
	end

	return slot0.nationName[slot0]
end

function slot0.Nation2facionName(slot0)
	if not slot0.facionName then
		slot0.facionName = {
			[0] = i18n("guild_faction_unknown"),
			i18n("guild_faction_blhx"),
			i18n("guild_faction_blhx"),
			i18n("guild_faction_cszz"),
			i18n("guild_faction_cszz"),
			i18n("guild_faction_blhx"),
			i18n("guild_faction_cszz"),
			i18n("guild_faction_blhx"),
			i18n("guild_faction_blhx"),
			i18n("guild_faction_cszz"),
			[101] = i18n("guild_faction_unknown"),
			[102] = i18n("guild_faction_unknown"),
			[103] = i18n("guild_faction_unknown"),
			[104] = i18n("guild_faction_unknown"),
			[105] = i18n("guild_faction_unknown")
		}
	end

	return slot0.facionName[slot0]
end

return slot0
