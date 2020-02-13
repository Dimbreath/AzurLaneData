slot0 = class("BattleGateSubRoutine")
ys.Battle.BattleGateSubRoutine = slot0
slot0.__name = "BattleGateSubRoutine"

function slot0.Entrance(slot0, slot1)
	if not slot1.LegalFleet(slot0.mainFleetId) then
		return
	end

	if BeginStageCommand.DockOverload() then
		return
	end

	slot2 = getProxy(PlayerProxy)
	slot3 = getProxy(BayProxy)
	slot4 = getProxy(FleetProxy)
	slot6 = pg.battle_cost_template[SYSTEM_SUB_ROUTINE].oil_cost > 0
	slot7 = {}
	slot8 = 0
	slot9 = 0
	slot10 = 0
	slot11 = 0

	for slot17, slot18 in ipairs(slot13) do
		slot7[#slot7 + 1] = slot18.id
	end

	slot9 = slot12:getStartCost().oil
	slot11 = slot12:GetCostSum().oil
	slot16 = slot2:getData()

	if slot6 and slot16.oil < slot11 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	slot17 = slot0.mainFleetId
	slot20 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot19).fleet_prefab

	slot1.ShipVertify()
	BeginStageCommand.SendRequest(SYSTEM_SUB_ROUTINE, slot7, {
		slot0.stageId
	}, function (slot0)
		if slot0 then
			slot1:consume({
				gold = 0,
				oil = slot1
			})
		end

		if slot3.enter_energy_cost > 0 and not exFlag then
			slot1 = pg.gameset.battle_consume_energy.key_value

			for slot5, slot6 in ipairs(slot4) do
				slot6:cosumeEnergy(slot1)
				slot5:updateShip(slot6)
			end
		end

		slot6:updatePlayer(slot6.updatePlayer)
		slot10:sendNotification(GAME.BEGIN_STAGE_DONE, {
			mainFleetId = slot7,
			prefabFleet = slot8,
			stageId = slot9,
			system = SYSTEM_SUB_ROUTINE,
			token = slot0.key
		})
	end, function (slot0)
		slot0:RequestFailStandardProcess(slot0)
	end)
end

function slot0.Exit(slot0, slot1)
	slot2 = pg.battle_cost_template[SYSTEM_SUB_ROUTINE]
	slot5 = slot0.statistics._battleScore
	slot6 = 0
	slot7 = {}
	slot8 = getProxy(FleetProxy).getFleetById(slot3, slot0.mainFleetId)
	slot6 = slot8:getEndCost().oil

	slot1:SendRequest(slot1.GeneralPackage(slot0, slot7), function (slot0)
		if slot0.end_sink_cost > 0 then
			slot1.DeadShipEnergyCosume(slot2, slot3)
		end

		slot1.addShipsExp(slot0.ship_exp_list, slot2.statistics, true)

		slot2.statistics.mvpShipID = slot0.mvp
		slot1, slot2 = slot2.statistics:GeneralLoot(slot0)

		slot1.GeneralPlayerCosume(SYSTEM_SUB_ROUTINE, ys.Battle.BattleConst.BattleScore.C < true, , slot0.player_exp, exFlag)

		if slot3 then
			slot4 = getProxy(DailyLevelProxy)
			slot4.data[slot4.dailyLevelId] = (slot4.data[slot4.dailyLevelId] or 0) + 1
		end

		slot1:sendNotification(GAME.FINISH_STAGE_DONE, {
			system = SYSTEM_SUB_ROUTINE,
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
