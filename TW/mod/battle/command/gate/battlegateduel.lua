slot0 = class("BattleGateDuel")
ys.Battle.BattleGateDuel = slot0
slot0.__name = "BattleGateDuel"

function slot0.Entrance(slot0, slot1)
	slot2 = slot0.mainFleetId

	if not slot1.LegalFleet(slot0.mainFleetId) then
		return
	end

	if not getProxy(MilitaryExerciseProxy).getSeasonInfo(slot3):canExercise() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("exercise_count_insufficient"))

		return
	end

	slot5 = getProxy(PlayerProxy)
	slot6 = getProxy(BayProxy)
	slot7 = getProxy(FleetProxy)
	rivalVO = getProxy(MilitaryExerciseProxy).getRivalById(slot10, nil)
	slot12 = pg.battle_cost_template[SYSTEM_DUEL].oil_cost > 0
	slot13 = {}
	slot14 = 0
	slot15 = 0
	slot16 = 0
	slot17 = 0

	for slot23, slot24 in ipairs(slot19) do
		slot13[#slot13 + 1] = slot24.id
	end

	slot20 = slot5:getData()

	if slot12 and slot20.oil < slot17 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	slot21 = 0

	for slot25, slot26 in ipairs(rivalVO.mainShips) do
		slot21 = slot21 + slot26.level
	end

	for slot25, slot26 in ipairs(rivalVO.vanguardShips) do
		slot21 = slot21 + slot26.level
	end

	RivalLevelVertiry = slot21

	slot1.ShipVertify()
	BeginStageCommand.SendRequest(SYSTEM_DUEL, slot13, {
		slot8
	}, function (slot0)
		if slot0 then
			slot1:consume({
				gold = 0,
				oil = slot1
			})
		end

		if slot3.enter_energy_cost > 0 then
			slot1 = pg.gameset.battle_consume_energy.key_value

			for slot5, slot6 in ipairs(slot4) do
				slot6:cosumeEnergy(slot1)
				slot5:updateShip(slot6)
			end
		end

		slot6:updatePlayer(slot1)
		slot9:sendNotification(GAME.BEGIN_STAGE_DONE, {
			mainFleetId = slot7,
			prefabFleet = {},
			stageId = ys.Battle.BattleConfig.ARENA_LIST[math.random(#ys.Battle.BattleConfig.ARENA_LIST)],
			system = SYSTEM_DUEL,
			rivalId = slot8,
			token = slot0.key,
			mode = mode
		})
	end, function (slot0)
		slot0:RequestFailStandardProcess(slot0)
	end)
end

function slot0.Exit(slot0, slot1)
	slot2 = pg.battle_cost_template[SYSTEM_DUEL]
	slot5 = slot0.statistics._battleScore
	slot6 = 0
	slot7 = {}
	slot8 = getProxy(FleetProxy).getFleetById(slot3, slot0.mainFleetId)
	slot6 = slot8:getEndCost().oil

	slot1:SendRequest(slot1.GeneralPackage(slot0, slot7), function (slot0)
		if slot0.end_sink_cost > 0 then
			slot1.DeadShipEnergyCosume(slot2, slot3)
		end

		slot1.addShipsExp(slot0.ship_exp_list, slot2.statistics, accumulate)

		slot2.statistics.mvpShipID = slot0.mvp
		slot1, slot2 = slot2.statistics:GeneralLoot(slot0)

		slot1.GeneralPlayerCosume(SYSTEM_DUEL, ys.Battle.BattleConst.BattleScore.C < accumulate, , slot0.player_exp, exFlag)

		slot4 = getProxy(MilitaryExerciseProxy)

		slot4:reduceExerciseCount()
		slot1:sendNotification(GAME.FINISH_STAGE_DONE, {
			system = SYSTEM_DUEL,
			statistics = slot2.statistics,
			score = slot4,
			drops = slot1,
			commanderExps = {},
			result = slot0.result,
			extraDrops = slot2
		})
	end)
end

return slot0
