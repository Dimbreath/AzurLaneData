slot0 = class("BattleGateCooperate")
ys.Battle.BattleGateCooperate = slot0
slot0.__name = "BattleGateCooperate"

function slot0.Entrance(slot0, slot1)
	if BeginStageCommand.DockOverload() then
		return
	end

	slot2 = slot0.actID
	slot3 = getProxy(PlayerProxy)
	slot4 = getProxy(BayProxy)
	slot5 = getProxy(FleetProxy)
	slot7 = pg.battle_cost_template[SYSTEM_HP_SHARE_ACT_BOSS].oil_cost > 0
	slot8 = {}
	slot9 = 0
	slot10 = 0
	slot11 = 0
	slot12 = 0

	for slot17, slot18 in ipairs(slot5:getActivityFleets()[slot2][Fleet.REGULAR_FLEET_ID].ships) do
		slot8[#slot8 + 1] = slot18
	end

	slot10 = slot13:getStartCost().oil
	slot12 = slot13:GetCostSum().oil
	slot16 = slot4:getSortShipsByFleet(slot13)
	slot17 = slot3:getData()

	if slot7 and slot17.oil < slot12 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	slot20 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot19).fleet_prefab

	slot1.ShipVertify()

	slot21 = nil

	if chapter:getPlayType() == ChapterConst.TypeExtra then
		slot21 = true
	end

	BeginStageCommand.SendRequest(SYSTEM_HP_SHARE_ACT_BOSS, slot8, {
		slot18
	}, function (slot0)
		if slot0 then
			slot1:consume({
				gold = 0,
				oil = slot1
			})
		end

		if slot3.enter_energy_cost > 0 and not slot4 then
			slot1 = pg.gameset.battle_consume_energy.key_value

			for slot5, slot6 in ipairs(slot5) do
				slot6:cosumeEnergy(slot1)
				slot6:updateShip(slot6)
			end
		end

		slot7:updatePlayer(slot7.updatePlayer)
		slot11:sendNotification(GAME.BEGIN_STAGE_DONE, {
			mainFleetId = Fleet.REGULAR_FLEET_ID,
			prefabFleet = slot8,
			stageId = slot9,
			actId = slot10,
			system = SYSTEM_HP_SHARE_ACT_BOSS,
			token = slot0.key
		})
	end, function (slot0)
		slot0:RequestFailStandardProcess(slot0)
	end)
end

function slot0.Exit(slot0, slot1)
	if client.CheaterVertify() then
		return
	end

	slot2 = pg.battle_cost_template[SYSTEM_HP_SHARE_ACT_BOSS]
	slot4 = getProxy(ChapterProxy)
	slot5 = ys.Battle.BattleConst.BattleScore.S
	slot6 = 0
	slot7 = 0
	slot8 = nil
	slot8 = bayProxy:getShipsByFleet(getProxy(FleetProxy).getActivityFleets(slot3)[slot0.actID][slot0.mainFleetId])
	slot7 = getProxy(FleetProxy).getActivityFleets(slot3)[slot0.actID][slot0.mainFleetId].getEndCost(slot11).oil

	if slot0.statistics.submarineAid then
		if slot3:getActivityFleets()[slot0.actID][Fleet.SUBMARINE_FLEET_ID] then
			for slot20, slot21 in ipairs(slot16) do
				if slot0.statistics[slot21.id] then
					table.insert(slot8, slot21)

					slot7 = slot7 + slot21:getEndBattleExpend()
				end
			end
		else
			print("finish stage error: can not find submarine fleet.")
		end
	end

	slot13 = client.GeneralPackage(slot0, slot8)
	slot14 = {}

	for slot18, slot19 in ipairs(slot0.statistics._enemyInfoList) do
		table.insert(slot14, {
			enemy_id = slot19.id,
			damage_taken = slot19.damage,
			total_hp = slot19.totalHp
		})
	end

	slot13.enemy_info = slot14

	client:SendRequest(slot13, function (slot0)
		if slot0.end_sink_cost > 0 then
			client.DeadShipEnergyCosume(client.DeadShipEnergyCosume, )
		end

		client.addShipsExp(slot0.ship_exp_list, slot1.statistics)

		client.addShipsExp.statistics.mvpShipID = slot0.mvp
		slot1, slot2 = client:GeneralLoot(slot0)

		slot4.GeneralPlayerCosume(SYSTEM_HP_SHARE_ACT_BOSS, ys.Battle.BattleConst.BattleScore.C < slot0, , slot0.player_exp)
		client:sendNotification(GAME.FINISH_STAGE_DONE, {
			system = SYSTEM_HP_SHARE_ACT_BOSS,
			statistics = slot1.statistics,
			score = ys.Battle.BattleConst.BattleScore.C < slot0,
			drops = slot1,
			commanderExps = {},
			result = slot0.result,
			extraDrops = slot2
		})
	end)
end

return slot0
