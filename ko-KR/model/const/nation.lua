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
	return uv0.LINK < slot0
end

function slot0.Nation2Print(slot0)
	if not uv0.prints then
		uv0.prints = {
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

	return uv0.prints[slot0]
end

function slot0.Nation2Side(slot0)
	if not uv0.side then
		uv0.side = {
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

	return uv0.side[slot0]
end

function slot0.Nation2BG(slot0)
	if not uv0.bg then
		uv0.bg = {
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

	return uv0.bg[slot0]
end

function slot0.Nation2Name(slot0)
	if not uv0.nationName then
		slot2[0] = i18n("word_shipNation_other")
		slot2[1] = i18n("word_shipNation_baiYing")
		slot2[2] = i18n("word_shipNation_huangJia")
		slot2[3] = i18n("word_shipNation_chongYing")
		slot2[4] = i18n("word_shipNation_tieXue")
		slot2[5] = i18n("word_shipNation_dongHuang")
		slot2[6] = i18n("word_shipNation_saDing")
		slot2[7] = i18n("word_shipNation_beiLian")
		slot2[8] = i18n("word_shipNation_ziyou")
		slot2[9] = i18n("word_shipNation_weixi")
		slot2[101] = i18n("word_shipNation_np")
		slot2[102] = i18n("word_shipNation_bili")
		slot2[103] = i18n("word_shipNation_um")
		slot2[104] = i18n("word_shipNation_ai")
		slot2[105] = i18n("word_shipNation_holo")
		uv0.nationName = {}
	end

	return uv0.nationName[slot0]
end

function slot0.Nation2facionName(slot0)
	if not uv0.facionName then
		slot2[0] = i18n("guild_faction_unknown")
		slot2[1] = i18n("guild_faction_blhx")
		slot2[2] = i18n("guild_faction_blhx")
		slot2[3] = i18n("guild_faction_cszz")
		slot2[4] = i18n("guild_faction_cszz")
		slot2[5] = i18n("guild_faction_blhx")
		slot2[6] = i18n("guild_faction_cszz")
		slot2[7] = i18n("guild_faction_blhx")
		slot2[8] = i18n("guild_faction_blhx")
		slot2[9] = i18n("guild_faction_cszz")
		slot2[101] = i18n("guild_faction_unknown")
		slot2[102] = i18n("guild_faction_unknown")
		slot2[103] = i18n("guild_faction_unknown")
		slot2[104] = i18n("guild_faction_unknown")
		slot2[105] = i18n("guild_faction_unknown")
		uv0.facionName = {}
	end

	return uv0.facionName[slot0]
end

return slot0
