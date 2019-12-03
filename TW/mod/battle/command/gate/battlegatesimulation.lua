slot0 = class("BattleGateSimulation")
ys.Battle.BattleGateSimulation = slot0
slot0.__name = "BattleGateSimulation"

function slot0.Entrance(slot0, slot1)
	slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {
		prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot3).fleet_prefab,
		stageId = slot0.stageId,
		system = SYSTEM_SIMULATION,
		exitCallback = slot0.exitCallback
	})
end

function slot0.Exit(slot0, slot1)
	slot1:sendNotification(GAME.FINISH_STAGE_DONE, {
		system = SYSTEM_SIMULATION
	})
end

return slot0
