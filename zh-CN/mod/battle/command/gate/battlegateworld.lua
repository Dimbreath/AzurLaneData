slot0 = class("BattleGateWorld")
ys.Battle.BattleGateWorld = slot0
slot0.__name = "BattleGateWorld"

function slot0.Entrance(slot0, slot1)
	if BeginStageCommand.DockOverload() then
		return
	end

	slot2 = getProxy(PlayerProxy)
	slot3 = getProxy(BayProxy)
	slot5 = pg.battle_cost_template[SYSTEM_WORLD].oil_cost > 0
	slot6 = {}
	slot7 = 0
	slot8 = 0
	slot9 = 0
	slot10 = 0

	for slot19, slot20 in ipairs(getProxy(WorldProxy):GetWorld():GetActiveMap():GetFleet():GetShipVOs(false)) do
		slot6[#slot6 + 1] = slot20.id
	end

	slot16, slot17 = slot14:GetCost()
	slot7 = slot16.gold
	slot8 = slot16.oil
	slot9 = slot16.gold + slot17.gold

	if slot5 and slot2:getData().oil < slot16.oil + slot17.oil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	slot19 = slot0.stageId
	slot21 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(pg.expedition_data_template[slot19].dungeon_id).fleet_prefab

	slot1.ShipVertify()
	BeginStageCommand.SendRequest(SYSTEM_WORLD, slot6, {
		slot19
	}, function (slot0)
		if uv0 then
			uv1:consume({
				gold = 0,
				oil = uv2
			})
		end

		if uv3.enter_energy_cost > 0 and not exFlag then
			for slot5, slot6 in ipairs(uv4) do
				slot6:cosumeEnergy(pg.gameset.battle_consume_energy.key_value)
				uv5:updateShip(slot6)
			end
		end

		uv6:updatePlayer(uv1)
		uv9:sendNotification(GAME.BEGIN_STAGE_DONE, {
			prefabFleet = uv7,
			stageId = uv8,
			system = SYSTEM_WORLD,
			token = slot0.key
		})
	end, function (slot0)
		uv0:RequestFailStandardProcess(slot0)
	end)
end

function slot0.Exit(slot0, slot1)
	if slot1.CheaterVertify() then
		return
	end

	slot2 = pg.battle_cost_template[SYSTEM_WORLD]
	slot3 = slot0.statistics._battleScore
	slot4 = 0
	slot5 = {}
	slot9 = getProxy(WorldProxy):GetWorld():GetActiveMap():GetFleet()
	slot5 = slot9:GetShipVOs(true)
	slot10, slot11 = slot9:GetCost()
	slot4 = slot11.oil

	if slot0.statistics.submarineAid then
		for slot17, slot18 in ipairs(slot8:GetSubmarineFleet():GetTeamShipVOs(TeamType.Submarine, true)) do
			if slot0.statistics[slot18.id] then
				table.insert(slot5, slot18)
			end
		end

		slot14, slot15 = slot12:GetCost()
		slot4 = slot4 + slot15.oil
	end

	slot1:SendRequest(slot1.GeneralPackage(slot0, slot5), function (slot0)
		if uv0.end_sink_cost > 0 then
			uv1.DeadShipEnergyCosume(uv2, uv3)
		end

		uv1.addShipsExp(slot0.ship_exp_list, uv2.statistics, accumulate)

		uv2.statistics.mvpShipID = slot0.mvp
		slot1, slot2 = uv1:GeneralLoot(slot0)
		slot3 = ys.Battle.BattleConst.BattleScore.C < uv4

		uv1.GeneralPlayerCosume(SYSTEM_WORLD, slot3, uv5, slot0.player_exp, exFlag)
		uv1:sendNotification(GAME.FINISH_STAGE_DONE, {
			system = SYSTEM_WORLD,
			statistics = uv2.statistics,
			score = uv4,
			drops = slot1,
			commanderExps = {},
			result = slot0.result,
			extraDrops = slot2
		})
		uv6:WriteBack(slot3, uv2)

		if not slot3 then
			uv7:AddLog(WorldLog.TypeBattleFailure, {
				fleet = uv6:GetFleet().id
			})
		end
	end)
end

return slot0
