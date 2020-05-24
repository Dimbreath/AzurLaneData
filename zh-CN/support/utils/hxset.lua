HXSet = {}
slot0 = HXSet
slot0.codeModeKey = "hx_code_mode"
slot0.codeMode = false
slot0.nameCodeMap = {}
slot0.codeNameMap = {}
slot0.nameCodeMap_EN = {
	IJN = "IRN"
}
slot0.codeNameMap_EN = {}

function slot0.init()
	for slot3, slot4 in pairs(pg.name_code) do
		uv0.nameCodeMap[slot4.name] = slot4.code
		uv0.codeNameMap[slot4.code] = slot4.name
	end

	for slot3, slot4 in pairs(uv0.codeNameMap_EN) do
		uv0.codeNameMap_EN[slot4] = slot3
	end

	if pg.gameset.code_switch.key_value == 1 and PlayerPrefs.HasKey(uv0.codeModeKey) then
		uv0.codeMode = PlayerPrefs.GetInt(uv0.codeModeKey) == 1
	end

	uv0.update()
end

function slot0.switchCodeMode()
	if pg.gameset.code_switch.key_value == 1 or uv0.codeMode then
		uv0.codeMode = not uv0.codeMode

		PlayerPrefs.SetInt(uv0.codeModeKey, uv0.codeMode and 1 or 0)
		PlayerPrefs.Save()
		uv0.update()
		print("anti hx mode: " .. (uv0.codeMode and "on" or "off"))
	end
end

function slot0.update()
	slot0 = uv0.codeMode and uv0.codeNameMap or uv0.nameCodeMap
	slot1 = uv0.codeMode and uv0.codeNameMap_EN or uv0.nameCodeMap_EN

	for slot5, slot6 in pairs(pg.ship_data_statistics) do
		if slot6.nationality == Nation.JP and slot0[slot6.name] then
			slot6.name = slot0[slot6.name]
		end

		for slot10, slot11 in pairs(slot1) do
			slot6.english_name = string.gsub(slot6.english_name or "", slot10, slot11)
		end
	end

	for slot5, slot6 in pairs(pg.enemy_data_statistics) do
		if slot6.nationality == Nation.JP and slot0[slot6.name] then
			slot6.name = slot0[slot6.name]
		end
	end

	for slot5, slot6 in pairs(pg.fleet_tech_ship_class) do
		if slot6.name then
			slot7, slot8 = string.gsub(slot6.name, "级", "")

			if slot6.nation == Nation.JP and slot0[slot7] then
				slot6.name = slot0[slot7] .. (slot8 > 0 and "级" or "")
			end
		end
	end
end

function slot0.hxLan(slot0, slot1)
	return string.gsub(slot0 or "", "{namecode:(%d+)}", function (slot0)
		return pg.name_code[tonumber(slot0)] and ((uv0.codeMode or uv1) and slot1.name or slot1.code)
	end)
end

function slot0.isHx()
	if uv0.codeMode then
		-- Nothing
	end

	return true
end

slot0.init()
