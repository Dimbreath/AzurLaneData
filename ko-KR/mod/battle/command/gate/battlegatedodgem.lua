slot0 = class("BattleGateDodgem")
ys.Battle.BattleGateDodgem = slot0
slot0.__name = "BattleGateDodgem"

function slot0.Entrance(slot0, slot1)
	slot2 = slot0.stageId
	slot5.prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(pg.expedition_data_template[slot2].dungeon_id).fleet_prefab
	slot5.stageId = slot2
	slot5.system = SYSTEM_DODGEM

	slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {})
end

function slot0.Exit(slot0, slot1)
	slot2 = slot0
	slot6.activity_id = ActivityConst.PIG_YEAR_RED_POCKET_SHIP_ID_RETRO
	slot6.statistics = slot2.statistics
	slot6.arg1 = slot2.statistics._battleScore
	slot6.arg2 = slot2.statistics.dodgemResult.score

	slot1:sendNotification(GAME.ACTIVITY_OPERATION, {
		cmd = 1
	})
end

return slot0
