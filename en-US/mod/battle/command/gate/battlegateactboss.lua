slot0 = class("BattleGateActBoss")
ys.Battle.BattleGateActBoss = slot0
slot0.__name = "BattleGateActBoss"

function slot0.Entrance(slot0, slot1)
	if BeginStageCommand.DockOverload() then
		return
	end

	slot3 = getProxy(PlayerProxy)
	slot7 = pg.battle_cost_template[SYSTEM_ACT_BOSS].oil_cost > 0
	slot8 = {}
	slot9 = 0
	slot10 = 0
	slot11 = 0
	slot12 = 0

	for slot18, slot19 in ipairs(getProxy(BayProxy):getSortShipsByFleet(getProxy(FleetProxy):getActivityFleets()[slot0.actID][slot0.mainFleetId])) do
		slot8[#slot8 + 1] = slot19.id
	end

	slot10 = slot13:getStartCost().oil

	if slot7 and slot3:getData().oil < slot13:GetCostSum().oil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	slot18 = slot0.mainFleetId
	slot19 = slot0.stageId
	slot21 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(pg.expedition_data_template[slot19].dungeon_id).fleet_prefab

	slot1.ShipVertify()

	slot27[1] = slot19

	BeginStageCommand.SendRequest(SYSTEM_ACT_BOSS, slot8, {}, function (slot0)
		if uv0 then
			slot3.oil = uv2

			uv1:consume({
				gold = 0
			})
		end

		if uv3.enter_energy_cost > 0 and not exFlag then
			for slot5, slot6 in ipairs(uv4) do
				slot6:cosumeEnergy(pg.gameset.battle_consume_energy.key_value)
				uv5:updateShip(slot6)
			end
		end

		slot1 = uv6

		slot1:updatePlayer(uv1)

		slot1.mainFleetId = uv7
		slot1.actId = uv8
		slot1.prefabFleet = uv9
		slot1.stageId = uv10
		slot1.system = SYSTEM_ACT_BOSS
		slot1.token = slot0.key

		uv11:sendNotification(GAME.BEGIN_STAGE_DONE, {})
	end, function (slot0)
		uv0:RequestFailStandardProcess(slot0)
	end)
end

function slot0.Exit(slot0, slot1)
	slot2 = pg.battle_cost_template[SYSTEM_ACT_BOSS]
	slot4 = getProxy(BayProxy)
	slot5 = slot0.statistics._battleScore
	slot9 = 0
	slot10 = {}
	slot9 = getProxy(FleetProxy):getActivityFleets()[slot0.actID][slot0.mainFleetId]:getEndCost().oil

	for slot16, slot17 in pairs(slot8.commanderIds) do
		table.insert({}, slot17)
	end

	slot10 = slot4:getSortShipsByFleet(slot8)

	if slot0.statistics.submarineAid then
		if slot7[slot0.mainFleetId + 10] then
			for slot18, slot19 in ipairs(slot4:getShipsByFleet(slot13)) do
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

	slot13 = slot1.GeneralPackage(slot0, slot10)
	slot13.commander_id_list = slot12

	slot1:SendRequest(slot13, function (slot0)
		if uv0.end_sink_cost > 0 then
			uv1.DeadShipEnergyCosume(uv2, uv3)
		end

		uv1.addShipsExp(slot0.ship_exp_list, uv2.statistics, true)

		uv2.statistics.mvpShipID = slot0.mvp
		slot1, slot2 = uv1:GeneralLoot(slot0)
		slot3 = ys.Battle.BattleConst.BattleScore.C < uv4
		slot4 = uv1.GenerateCommanderExp(slot0, uv5)

		uv1.GeneralPlayerCosume(SYSTEM_ACT_BOSS, slot3, uv6, slot0.player_exp, exFlag)

		if slot3 then
			slot8.stageId = uv2.stageId

			uv1:sendNotification(GAME.ACT_BOSS_NORMAL_UPDATE, {})
		end

		slot5.system = SYSTEM_ACT_BOSS
		slot5.statistics = uv2.statistics
		slot5.score = uv4
		slot5.drops = slot1
		slot5.commanderExps = slot4
		slot5.result = slot0.result
		slot5.extraDrops = slot2

		uv1:sendNotification(GAME.FINISH_STAGE_DONE, {})
	end)
end

return slot0
