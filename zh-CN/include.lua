pg = pg or {}
ys = ys or {}

require("localConfig")
require("const")
require("config")
setmetatable(pg, {
	__index = function (slot0, slot1)
		if ShareCfg["ShareCfg." .. slot1] then
			require(slot2)

			return rawget(pg, slot1)
		end
	end
})

ERROR_MESSAGE = setmetatable({}, {
	__index = function (slot0, slot1)
		if pg.error_message[slot1] then
			return pg.error_message[slot1].desc
		else
			return "none"
		end
	end
})

function GetBattleCheck()
	return math.floor(ys.EquipDataStatisticVertify + ys.WeaponPropertyVertify + ys.ShipStatisticsVertify + ys.EnemyStatisticsVertify + ys.ExpeditionDataVertify + GetSpeNum(pg.skillCfg, 0) + GetSpeNum(pg.buffCfg, 0))
end

BVCurIndex = 1
BVLastIndex = 1

require("Framework/Include")
require("Support/Include")
require("Net/Include")
require("Mgr/Include")
require("GameCfg/Include")
require("Mod/Battle/Include")
require("skillCfg")
require("buffCfg")
require("genVertify")
require("buffFXPreloadList")
