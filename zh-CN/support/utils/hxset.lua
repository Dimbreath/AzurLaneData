HXSet = {
	codeModeKey = "hx_code_mode"
}

if PLATFORM_CODE == PLATFORM_CH then
	slot0.codeMode = false
else
	slot0.codeMode = true
end

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

	if PLATFORM_CODE == PLATFORM_CH then
		slot0 = nil

		if PathMgr.FileExists((not Application.isEditor or PathMgr.getAssetBundle("../localization.txt")) and Application.persistentDataPath .. "/localization.txt") then
			if string.gsub(PathMgr.ReadAllText(slot0), "%w+%s*=%s*", "") == "true" then
				uv0.codeMode = true
			end
		else
			System.IO.File.WriteAllText(slot0, "Localization = false")
		end
	end
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
		if PLATFORM_CODE == PLATFORM_CH then
			return pg.name_code[tonumber(slot0)].code
		else
			return slot1 and ((uv0.codeMode or uv1) and slot1.name or slot1.code)
		end
	end)
end

function slot0.isHx()
	return not uv0.codeMode
end

slot0.hxPathList = {
	"live2d",
	"painting",
	"shipYardIcon"
}

function slot0.needShift(slot0)
	for slot4, slot5 in ipairs(uv0.hxPathList) do
		if string.find(slot0, slot5) then
			return true
		end
	end

	return false
end

function slot0.autoHxShift(slot0, slot1)
	if uv0.isHx() then
		if string.find(slot0, "live2d") and pg.l2dhx[slot1] then
			return slot0, slot1 .. "_hx"
		end

		if uv0.needShift(slot0) and PathMgr.FileExists(PathMgr.getAssetBundle(slot0 .. slot1 .. "_hx")) then
			return slot0, slot1 .. "_hx"
		end
	end

	return slot0, slot1
end

function slot0.autoHxShiftPath(slot0, slot1)
	if uv0.isHx() then
		if string.find(slot0, "live2d") and pg.l2dhx[string.gsub(slot0, "live2d/", "")] then
			return slot0 .. "_hx"
		end

		if uv0.needShift(slot0) and PathMgr.FileExists(PathMgr.getAssetBundle(slot0 .. "_hx")) then
			if slot1 then
				return slot0 .. "_hx", slot1 .. "_hx"
			else
				return slot0 .. "_hx", slot1
			end
		end
	end

	return slot0, slot1
end

slot0.init()
