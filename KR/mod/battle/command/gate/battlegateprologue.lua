slot0 = class("BattleGatePrologue")
ys.Battle.BattleGatePrologue = slot0
slot0.__name = "BattleGatePrologue"

function slot0.Entrance(slot0, slot1)
	slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {
		prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot3).fleet_prefab,
		stageId = PROLOGUE_DUNGEON,
		system = SYSTEM_PROLOGUE
	})
end

function slot0.Exit(slot0, slot1)
	slot1:sendNotification(GAME.FINISH_STAGE_DONE, {
		system = SYSTEM_PROLOGUE
	})
end

return slot0
