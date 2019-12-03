slot0 = class("BattleGateSimulation")
ys.Battle.BattleGateSimulation = slot0
slot0.__name = "BattleGateSimulation"

slot0.Entrance = function (slot0, slot1)
	slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {
		prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot3).fleet_prefab,
		stageId = slot0.stageId,
		system = SYSTEM_SIMULATION,
		exitCallback = slot0.exitCallback
	})
end

slot0.Exit = function (slot0, slot1)
	slot1:sendNotification(GAME.FINISH_STAGE_DONE, {
		system = SYSTEM_SIMULATION
	})
end

return slot0
