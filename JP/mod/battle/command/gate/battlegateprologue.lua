slot0 = class("BattleGatePrologue")
ys.Battle.BattleGatePrologue = slot0
slot0.__name = "BattleGatePrologue"

slot0.Entrance = function (slot0, slot1)
	slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {
		prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot3).fleet_prefab,
		stageId = PROLOGUE_DUNGEON,
		system = SYSTEM_PROLOGUE
	})
end

slot0.Exit = function (slot0, slot1)
	slot1:sendNotification(GAME.FINISH_STAGE_DONE, {
		system = SYSTEM_PROLOGUE
	})
end

return slot0
