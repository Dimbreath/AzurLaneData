function AddCfgBaseInfo(slot0)
	for slot4, slot5 in ipairs(slot0.all) do
		if rawget(slot0[slot5], "base") ~= nil then
			rawset(slot6, "base", nil)

			slot11.__index = slot0[slot7]

			setmetatable(slot6, {})
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
slot2.hash = ys.EquipDataStatisticVertify
slot2.hashCheck = ys.EquipDataStatisticVertify
slot2.data = pg.equip_data_statistics
slot1[1] = {}
slot2.hash = ys.WeaponPropertyVertify
slot2.hashCheck = ys.WeaponPropertyVertify
slot2.data = pg.weapon_property
slot1[2] = {}
slot2.hash = ys.ShipStatisticsVertify
slot2.hashCheck = ys.ShipStatisticsVertify
slot2.data = pg.ship_data_statistics
slot1[3] = {}
slot2.hash = ys.EnemyStatisticsVertify
slot2.hashCheck = ys.EnemyStatisticsVertify
slot2.data = pg.enemy_data_statistics
slot1[4] = {}
slot2.hash = ys.ExpeditionDataVertify
slot2.hashCheck = ys.ExpeditionDataVertify
slot2.data = pg.expedition_data_template
slot1[5] = {}
ys.BattleVertifyTable = {}

function GetBattleCheck()
	return math.floor(ys.EquipDataStatisticVertify + ys.WeaponPropertyVertify + ys.ShipStatisticsVertify + ys.EnemyStatisticsVertify + ys.ExpeditionDataVertify + GetSpeNum(pg.skillCfg, 0) + GetSpeNum(pg.buffCfg, 0))
end

ys.BattleConfigVertify = GetSpeNum(ys.Battle.BattleConfig, 0)
ys.BattleConstVertify = GetSpeNum(pg.bfConsts, 0)
ys.BattleShipLevelVertify = {}
