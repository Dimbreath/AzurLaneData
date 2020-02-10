slot0 = class("BattleGateSubmarine")
ys.Battle.BattleGateSubmarine = slot0
slot0.__name = "BattleGateSubmarine"

function slot0.Entrance(slot0, slot1)
	slot2 = slot0.stageId
	slot5.prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(pg.expedition_data_template[slot2].dungeon_id).fleet_prefab
	slot5.stageId = slot2
	slot5.system = SYSTEM_SUBMARINE_RUN

	slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {})
end

function slot0.Exit(slot0, slot1)
	slot5.activity_id = ActivityConst.SUB_RED_POCKET
	slot5.statistics = slot0.statistics
	slot5.arg1 = slot0.statistics._battleScore
	slot5.arg2 = slot0.statistics.subRunResult.score

	slot1:sendNotification(GAME.ACTIVITY_OPERATION, {
		cmd = 1
	})
end

return slot0
