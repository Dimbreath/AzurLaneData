slot0 = class("BattleGateActBoss")
ys.Battle.BattleGateActBoss = slot0
slot0.__name = "BattleGateActBoss"

function slot0.Entrance(slot0, slot1)
	if BeginStageCommand.DockOverload() then
		return
	end

	slot2 = slot0.actID
	slot3 = getProxy(PlayerProxy)
	slot4 = getProxy(BayProxy)
	slot5 = getProxy(FleetProxy)
	slot7 = pg.battle_cost_template[SYSTEM_ACT_BOSS].oil_cost > 0
	slot8 = {}
	slot9 = 0
	slot10 = 0
	slot11 = 0
	slot12 = 0

	for slot18, slot19 in ipairs(slot14) do
		slot8[#slot8 + 1] = slot19.id
	end

	slot10 = slot13:getStartCost().oil
	slot12 = slot13:GetCostSum().oil
	slot17 = slot3:getData()

	if slot7 and slot17.oil < slot12 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	slot18 = slot0.mainFleetId
	slot21 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot20).fleet_prefab

	slot1.ShipVertify()
	BeginStageCommand.SendRequest(SYSTEM_ACT_BOSS, slot8, {
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
		slot11:sendNotification(GAME.BEGIN_STAGE_DONE, {
			mainFleetId = slot7,
			actId = slot8,
			prefabFleet = slot9,
			stageId = slot10,
			system = SYSTEM_ACT_BOSS,
			token = slot0.key
		})
	end, function (slot0)
		slot0:RequestFailStandardProcess(slot0)
	end)
end

function slot0.Exit(slot0, slot1)
	slot2 = pg.battle_cost_template[SYSTEM_ACT_BOSS]
	slot4 = getProxy(BayProxy)
	slot5 = slot0.statistics._battleScore
	slot9 = 0
	slot10 = {}
	slot9 = getProxy(FleetProxy).getActivityFleets(slot3)[slot0.actID][slot0.mainFleetId].getEndCost(slot8).oil
	slot12 = {}

	for slot16, slot17 in pairs(getProxy(FleetProxy).getActivityFleets(slot3)[slot0.actID][slot0.mainFleetId].commanderIds) do
		table.insert(slot12, slot17)
	end

	slot10 = slot4:getSortShipsByFleet(slot8)

	if slot0.statistics.submarineAid then
		if slot7[slot0.mainFleetId + 10] then
			for slot18, slot19 in ipairs(slot14) do
				if slot0.statistics[slot19.id] then
					table.insert(slot10, slot19)

					slot9 = slot9 + slot19:getEndBattleExpend()
				end
			end

			for slot18, slot19 in pairs(slot13.commanderIds) do
				table.insert(slot12, slot19)
			end
		else
			print("finish stage error: can not find submarin fleet.")
		end
	end

	slot1.GeneralPackage(slot0, slot10).commander_id_list = slot12

	slot1:SendRequest(slot1.GeneralPackage(slot0, slot10), function (slot0)
		if slot0.end_sink_cost > 0 then
			slot1.DeadShipEnergyCosume(slot2, slot3)
		end

		slot1.addShipsExp(slot0.ship_exp_list, slot2.statistics, true)

		slot2.statistics.mvpShipID = slot0.mvp
		slot1, slot2 = slot2.statistics:GeneralLoot(slot0)
		slot4 = slot1.GenerateCommanderExp(slot0, )

		slot1.GeneralPlayerCosume(SYSTEM_ACT_BOSS, ys.Battle.BattleConst.BattleScore.C < true, , slot0.player_exp, exFlag)

		if slot3 then
			slot1:sendNotification(GAME.ACT_BOSS_NORMAL_UPDATE, {
				stageId = slot2.stageId
			})
		end

		slot1:sendNotification(GAME.FINISH_STAGE_DONE, {
			system = SYSTEM_ACT_BOSS,
			statistics = slot2.statistics,
			score = slot4,
			drops = slot1,
			commanderExps = slot4,
			result = slot0.result,
			extraDrops = slot2
		})
	end)
end

return slot0
