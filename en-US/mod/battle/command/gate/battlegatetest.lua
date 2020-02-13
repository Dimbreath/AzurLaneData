slot0 = class("BattleGateTest")
ys.Battle.BattleGateTest = slot0
slot0.__name = "BattleGateTest"

function slot0.Entrance(slot0, slot1)
	if not slot1.LegalFleet(slot0.mainFleetId) then
		return
	end

	slot4 = {}

	for slot10, slot11 in ipairs(slot6) do
		slot4[#slot4 + 1] = slot11.id
	end

	slot7 = slot0.mainFleetId
	slot9 = pg.expedition_data_template[slot0.stageId].dungeon_id

	BeginStageCommand.SendRequest(SYSTEM_TEST, slot4, {
		slot0.stageId
	}, function (slot0)
		slot0.key:sendNotification(GAME.BEGIN_STAGE_DONE, {
			mainFleetId = slot0,
			prefabFleet = {},
			stageId = slot1,
			system = SYSTEM_TEST,
			token = slot0.key
		})
	end, function (slot0)
		slot0:RequestFailStandardProcess(slot0)
	end)
end

function slot0.Exit(slot0, slot1)
	slot2 = pg.battle_cost_template[SYSTEM_TEST]
	slot5 = slot0.statistics._battleScore
	slot6 = 0
	slot7 = {}

	slot1:SendRequest(slot1.GeneralPackage(slot0, slot7), function (slot0)
		slot0.statistics.mvpShipID = slot0.mvp

		{}:sendNotification(GAME.FINISH_STAGE_DONE, {
			system = SYSTEM_TEST,
			statistics = slot0.statistics,
			score = slot1,
			drops = {},
			commanderExps = {},
			result = slot0.result,
			extraDrops = 
		})
	end)
end

return slot0
