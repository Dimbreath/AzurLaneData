slot0 = class("BattleGateSimulation")
ys.Battle.BattleGateSimulation = slot0
slot0.__name = "BattleGateSimulation"

function slot0.Entrance(slot0, slot1)
	slot2 = slot0.stageId
	slot5.prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(pg.expedition_data_template[slot2].dungeon_id).fleet_prefab
	slot5.stageId = slot2
	slot5.system = SYSTEM_SIMULATION
	slot5.exitCallback = slot0.exitCallback

	slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {})
end

function slot0.Exit(slot0, slot1)
	slot5.system = SYSTEM_SIMULATION

	slot1:sendNotification(GAME.FINISH_STAGE_DONE, {})
end

return slot0
