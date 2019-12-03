slot0 = class("BattleGateSubmarine")
ys.Battle.BattleGateSubmarine = slot0
slot0.__name = "BattleGateSubmarine"

slot0.Entrance = function (slot0, slot1)
	slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {
		prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot3).fleet_prefab,
		stageId = slot0.stageId,
		system = SYSTEM_SUBMARINE_RUN
	})
end

slot0.Exit = function (slot0, slot1)
	slot1:sendNotification(GAME.ACTIVITY_OPERATION, {
		cmd = 1,
		activity_id = ActivityConst.SUB_RED_POCKET,
		statistics = slot0.statistics,
		arg1 = slot0.statistics._battleScore,
		arg2 = slot0.statistics.subRunResult.score
	})
end

return slot0
