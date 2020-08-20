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
slot4 = math
slot5 = math
slot6 = string.len
slot7 = string.len
slot8 = string.byte
slot9 = string.byte
slot10 = string.char
slot11 = string.char
slot12 = bit.bxor
slot13 = bit.bxor
slot14 = bit.band
slot15 = bit.band
slot16 = bit.bor
slot17 = bit.bor
slot18 = bit.rshift
slot19 = bit.lshift
slot20 = table.concat
slot21 = table.concat
slot22 = ipairs
slot23 = ipairs
slot24 = pairs
slot25 = pairs
slot26 = xpcall
slot27 = pcall
slot28 = tonumber
slot29 = tonumber
slot30 = tostring
slot31 = tostring
slot32 = table.getn
slot33 = table.getn
slot34 = loadstring
slot35 = GetSpeNum
slot36 = GetDataValue
slot37 = GetBattleCheck
slot38 = 0
slot39 = 1
slot40 = 8
slot41 = 255
slot42 = 65535
slot43 = 59092
slot44 = 2086
slot45 = 46550
slot46 = 15300
slot48 = 47263
slot49 = 26932
slot50 = "XANA can make mistakes too!"
slot51 = "I'll never make it.XANA is a flawless programme and I'm only human"
slot52 = ""
slot53, slot54, slot55, slot56, slot57, slot58 = nil
slot59 = ys.BattleVertifyTable

function slot60(slot0, slot1)
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

slot61 = slot0[slot60(slot41, slot49)({
	229,
	60,
	135,
	242,
	48,
	174,
	31
})]
slot62 = slot60(slot40, slot39)({
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
slot63 = slot60(slot46, slot43)({
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
slot64 = slot0[slot60(slot48, slot49)({
	253,
	97,
	54,
	135,
	67,
	211,
	65,
	96
})]
slot65 = slot60(slot42, slot40)({
	246,
	208,
	146,
	24,
	167,
	68,
	78
})
slot66 = slot60(slot42, slot40)({
	237,
	210,
	126,
	84
})
slot67 = slot60(slot45, slot42)({
	225,
	168,
	187,
	164,
	95
})
slot68 = slot60(slot45, slot42)({
	251,
	86,
	108
})
slot69 = slot60(slot45, slot42)({
	230,
	55,
	113,
	91,
	53
})
slot70 = slot60(slot45, slot42)({
	230,
	55,
	127,
	185
})
slot71 = slot60(slot43, slot40)({
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
slot72 = slot60(slot48, slot49)({
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
slot73 = slot60(slot45, slot43)({
	230,
	38,
	210,
	99
})
slot74 = slot60(slot44, slot41)({
	193,
	158,
	144,
	50
})
slot75 = slot60(slot42, slot39)({
	195,
	209,
	105,
	162,
	249,
	208,
	237
})
slot76 = slot60(slot40, slot43)({
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
slot77 = slot60(10100, slot46)({
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
slot78 = slot60(slot40, slot45)({
	244,
	147,
	206,
	229,
	22,
	148,
	14,
	3,
	84,
	181,
	197
})
slot79 = slot60(slot45, slot42)({
	228,
	3,
	135,
	251
})
slot80 = slot60(slot44, slot43)({
	243,
	157,
	87,
	148,
	86,
	162,
	153,
	8,
	248,
	24,
	118,
	148,
	219,
	208,
	248,
	56,
	100
})
slot81 = slot60(slot45, slot42)({
	225,
	168,
	166,
	162,
	4,
	231,
	242
})
slot82 = slot60(slot45, slot42)({
	230,
	43,
	81,
	163,
	71,
	133,
	192,
	164
})
slot83 = slot60(slot45, slot43)({
	199,
	49,
	59,
	178,
	103,
	127
})

function slot84()
	uv0[uv1][uv2]()
end

function slot85(slot0, slot1)
	slot2 = nil

	function slot3()
		uv0()

		if uv1 then
			uv1[uv2](uv1)
		end
	end

	slot2 = uv1[uv2][uv3](slot0, slot1, uv4)

	slot2[uv5](slot2)
end

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
	uv18 = uv19[uv20](354, 683)
end()
function ()
	slot1 = uv0[uv1][uv2]()

	function slot2()
		if not uv0[uv1] then
			uv2[uv3](uv4, uv5)
			uv6(uv7, uv8)
		end
	end

	function slot3()
		if not uv0[uv1] then
			uv2[uv3][uv4]()[uv5](uv6, uv7, uv8)

			uv0[uv9] = uv10

			uv11(uv12, uv13)
		end
	end

	uv3[uv15] = function (slot0)
		uv0(uv1)
	end
end()
