slot0 = class("BattleGateDodgem")
ys.Battle.BattleGateDodgem = slot0
slot0.__name = "BattleGateDodgem"

function slot0.Entrance(slot0, slot1)
	slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {
		prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot3).fleet_prefab,
		stageId = slot0.stageId,
		system = SYSTEM_DODGEM
	})
end

function slot0.Exit(slot0, slot1)
	slot1:sendNotification(GAME.ACTIVITY_OPERATION, {
		cmd = 1,
		activity_id = ActivityConst.PIG_YEAR_RED_POCKET_SHIP_ID_RETRO,
		statistics = slot0.statistics,
		arg1 = slot0.statistics._battleScore,
		arg2 = slot0.statistics.dodgemResult.score
	})
end

return slot0
