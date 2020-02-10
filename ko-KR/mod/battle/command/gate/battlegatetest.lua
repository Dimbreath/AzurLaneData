slot0 = class("BattleGateTest")
ys.Battle.BattleGateTest = slot0
slot0.__name = "BattleGateTest"

function slot0.Entrance(slot0, slot1)
	if not slot1.LegalFleet(slot0.mainFleetId) then
		return
	end

	slot4 = {}

	for slot10, slot11 in ipairs(getProxy(BayProxy):getSortShipsByFleet(getProxy(FleetProxy):getFleetById(slot0.mainFleetId))) do
		slot4[#slot4 + 1] = slot11.id
	end

	slot7 = slot0.mainFleetId
	slot8 = slot0.stageId
	slot9 = pg.expedition_data_template[slot8].dungeon_id
	slot15[1] = slot8

	BeginStageCommand.SendRequest(SYSTEM_TEST, slot4, {}, function (slot0)
		slot1.mainFleetId = uv0
		slot1.prefabFleet = {}
		slot1.stageId = uv1
		slot1.system = SYSTEM_TEST
		slot1.token = slot0.key

		uv2:sendNotification(GAME.BEGIN_STAGE_DONE, {})
	end, function (slot0)
		uv0:RequestFailStandardProcess(slot0)
	end)
end

function slot0.Exit(slot0, slot1)
	slot2 = pg.battle_cost_template[SYSTEM_TEST]
	slot5 = slot0.statistics._battleScore
	slot6 = 0
	slot7 = {}

	slot1:SendRequest(slot1.GeneralPackage(slot0, getProxy(BayProxy):getShipsByFleet(getProxy(FleetProxy):getFleetById(slot0.mainFleetId))), function (slot0)
		uv0.statistics.mvpShipID = slot0.mvp
		slot1.system = SYSTEM_TEST
		slot1.statistics = uv0.statistics
		slot1.score = uv1
		slot1.drops = {}
		slot1.commanderExps = {}
		slot1.result = slot0.result
		slot1.extraDrops = {}

		uv2:sendNotification(GAME.FINISH_STAGE_DONE, {})
	end)
end

return slot0
