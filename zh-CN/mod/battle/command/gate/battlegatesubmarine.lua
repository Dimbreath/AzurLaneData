slot0 = class("BattleGateSubmarine")
ys.Battle.BattleGateSubmarine = slot0
slot0.__name = "BattleGateSubmarine"

function slot0.Entrance(slot0, slot1)
	slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {
		prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot3).fleet_prefab,
		stageId = slot0.stageId,
		system = SYSTEM_SUBMARINE_RUN
	})
end

function slot0.Exit(slot0, slot1)
	slot1:sendNotification(GAME.ACTIVITY_OPERATION, {
		cmd = 1,
		activity_id = ActivityConst.SUB_RED_POCKET,
		statistics = slot0.statistics,
		arg1 = slot0.statistics._battleScore,
		arg2 = slot0.statistics.subRunResult.score
	})
end

return slot0
