function AddCfgBaseInfo(slot0)
	for slot4, slot5 in ipairs(slot0.all) do
		if rawget(slot0[slot5], "base") ~= nil then
			rawset(slot6, "base", nil)
			setmetatable(slot6, {
				__index = slot0[slot7]
			})
		end
	end
end

function GetSpeNum(slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		if type(slot6) == "number" then
			slot1 = slot1 + slot6
		elseif slot7 == "table" then
			slot1 = GetSpeNum(slot6, slot1)
		elseif slot7 == "string" then
			slot1 = slot1 + (tonumber(slot6) or 0)
		end
	end

	return slot1
end

function GetDataValue(slot0)
	for slot5, slot6 in ipairs(slot0.all) do
		slot1 = GetSpeNum(slot0[slot6], 0)
	end

	return slot1
end

function CheckTables(slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		if type(slot6) == "number" or slot7 == "string" then
			if slot6 ~= slot1[slot5] then
				return false
			end
		elseif slot7 == "table" and not CheckTables(slot6, slot1[slot5]) then
			return false
		end
	end

	return true
end

AddCfgBaseInfo(pg.equip_data_statistics)
AddCfgBaseInfo(pg.weapon_property)
AddCfgBaseInfo(pg.equip_data_template)
AddCfgBaseInfo(pg.aircraft_template)
AddCfgBaseInfo(pg.enemy_data_statistics)

ys.EquipDataStatisticVertify = GetDataValue(pg.equip_data_statistics)
ys.WeaponPropertyVertify = GetDataValue(pg.weapon_property)
ys.ShipStatisticsVertify = GetDataValue(pg.ship_data_statistics)
ys.EnemyStatisticsVertify = GetDataValue(pg.enemy_data_statistics)
ys.ExpeditionDataVertify = GetDataValue(pg.expedition_data_template)
ys.BattleVertifyTable = {
	{
		hash = ys.EquipDataStatisticVertify,
		hashCheck = ys.EquipDataStatisticVertify,
		data = pg.equip_data_statistics
	},
	{
		hash = ys.WeaponPropertyVertify,
		hashCheck = ys.WeaponPropertyVertify,
		data = pg.weapon_property
	},
	{
		hash = ys.ShipStatisticsVertify,
		hashCheck = ys.ShipStatisticsVertify,
		data = pg.ship_data_statistics
	},
	{
		hash = ys.EnemyStatisticsVertify,
		hashCheck = ys.EnemyStatisticsVertify,
		data = pg.enemy_data_statistics
	},
	{
		hash = ys.ExpeditionDataVertify,
		hashCheck = ys.ExpeditionDataVertify,
		data = pg.expedition_data_template
	}
}

function GetBattleCheck()
	return math.floor(ys.EquipDataStatisticVertify + ys.WeaponPropertyVertify + ys.ShipStatisticsVertify + ys.EnemyStatisticsVertify + ys.ExpeditionDataVertify + GetSpeNum(pg.skillCfg, 0) + GetSpeNum(pg.buffCfg, 0))
end

ys.BattleConfigVertify = GetSpeNum(ys.Battle.BattleConfig, 0)
ys.BattleConstVertify = GetSpeNum(pg.bfConsts, 0)
ys.BattleShipLevelVertify = {}
slot0 = _G
slot1 = _G
slot2 = pg
slot3 = ys
slot4 = string.len
slot5 = string.len
slot6 = string.byte
slot7 = string.byte
slot8 = string.char
slot9 = string.char
slot10 = bit.bxor
slot11 = bit.bxor
slot12 = bit.band
slot13 = bit.band
slot14 = bit.bor
slot15 = bit.bor
slot16 = bit.rshift
slot17 = bit.lshift
slot18 = table.concat
slot19 = table.concat
slot20 = ipairs
slot21 = ipairs
slot22 = pairs
slot23 = pairs
slot24 = xpcall
slot25 = pcall
slot26 = tonumber
slot27 = tonumber
slot28 = tostring
slot29 = tostring
slot30 = table.getn
slot31 = table.getn
slot32 = loadstring
slot33 = GetSpeNum
slot34 = GetDataValue
slot35 = GetBattleCheck
slot36 = 0
slot37 = 1
slot38 = 8
slot39 = 255
slot40 = 65535
slot41 = 59092
slot44 = 15300
slot46 = 47263
slot47 = 26932
slot48 = "XANA can make mistakes too!"
slot49 = ""
slot50, slot51, slot52, slot53, slot54 = nil
slot55 = ys.BattleVertifyTable

function slot56(slot0, slot1)
	slot2 = slot0
	slot3 = slot1

	return function (slot0)
		slot3 = nil

		for slot8, slot9 in uv8(slot0) do
			slot1 = uv0 .. function ()
				return uv0(uv1(uv2(uv3, uv1(uv4(uv5, uv6), uv7)), uv7))
			end()
			slot2 = uv3((slot9 + uv1) * uv9 + uv10, uv11)
		end

		return slot1
	end
end

slot57 = slot0[slot56(slot39, slot47)({
	229,
	60,
	135,
	242,
	48,
	174,
	31
})]
slot58 = slot56(slot38, slot37)({
	210,
	94,
	183,
	25,
	255,
	46,
	173,
	122,
	188,
	155,
	250,
	121
})
slot59 = slot56(slot44, slot41)({
	231,
	79,
	53,
	236,
	89,
	168,
	132,
	83,
	133,
	209,
	106,
	195
})
slot60 = slot0[slot56(slot46, slot47)({
	253,
	97,
	54,
	135,
	67,
	211,
	65,
	96
})]
slot61 = slot56(slot40, slot38)({
	246,
	208,
	146,
	24,
	167,
	68,
	78
})
slot62 = slot56(slot40, slot38)({
	237,
	210,
	126,
	84
})
slot63 = slot56(slot41, slot38)({
	246,
	222,
	240,
	153,
	154,
	236,
	97,
	200,
	131,
	20,
	131,
	104,
	215
})
slot64 = slot56(slot46, slot47)({
	242,
	112,
	132,
	176,
	44,
	139,
	34,
	111,
	197,
	157,
	240
})
slot65 = slot56(46550, slot41)({
	230,
	38,
	210,
	99
})
slot66 = slot56(2086, slot39)({
	193,
	158,
	144,
	50
})
slot67 = slot56(slot40, slot37)({
	195,
	209,
	105,
	162,
	249,
	208,
	237
})
slot68 = slot56(slot38, slot41)({
	211,
	75,
	45,
	230,
	183,
	40,
	169,
	185,
	11,
	213,
	38,
	212,
	172,
	179,
	149,
	185
})
slot69 = slot56(10100, slot44)({
	243,
	149,
	129,
	178,
	31,
	230,
	217,
	167,
	104,
	87
})

function ()
	uv0 = uv1[uv2](uv1[uv3]())
end()
function ()
	uv0 = uv1[uv2]
	uv3 = uv4[uv5][uv6]()
	uv7 = uv8 and uv9[uv10](uv9[uv11]())
	uv12 = {
		[uv13] = uv14,
		[uv15] = uv7 and uv16[uv17](uv7) or ""
	}
end()
function ()
	uv0[uv1] = function (slot0)
		pcall(function ()
			if not uv0[uv1] then
				uv2[uv3][uv4]()[uv5](uv6, uv7, uv8)

				uv0[uv9] = uv10
			end
		end)
	end
end()
