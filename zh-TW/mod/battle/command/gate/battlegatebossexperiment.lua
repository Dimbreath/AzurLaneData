slot0 = class("BattleGateBossExperiment")
ys.Battle.BattleGateBossExperiment = slot0
slot0.__name = "BattleGateBossExperiment"

function slot0.Entrance(slot0, slot1)
	slot4 = slot0.stageId
	slot7.mainFleetId = slot0.mainFleetId
	slot7.actId = slot0.actID
	slot7.prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(pg.expedition_data_template[slot4].dungeon_id).fleet_prefab
	slot7.stageId = slot4
	slot7.system = SYSTEM_BOSS_EXPERIMENT

	slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {})
end

function slot0.Exit(slot0, slot1)
	slot3.system = SYSTEM_BOSS_EXPERIMENT
	slot3.statistics = slot0.statistics
	slot3.score = ys.Battle.BattleConst.BattleScore.S
	slot3.drops = drops
	slot3.commanderExps = {}
	slot3.extraDrops = extraDrops

	slot1:sendNotification(GAME.FINISH_STAGE_DONE, {})
end

return slot0
