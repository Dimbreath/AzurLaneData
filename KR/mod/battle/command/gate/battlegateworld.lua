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

	for slot19, slot20 in ipairs(slot15) do
		slot6[#slot6 + 1] = slot20.id
	end

	slot16, slot17 = slot14:GetCost()
	slot7 = slot16.gold
	slot8 = slot16.oil
	slot9 = slot16.gold + slot17.gold
	slot10 = slot16.oil + slot17.oil
	slot18 = slot2:getData()

	if slot5 and slot18.oil < slot10 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	slot21 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot20).fleet_prefab

	slot1.ShipVertify()
	BeginStageCommand.SendRequest(SYSTEM_WORLD, slot6, {
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
		slot9:sendNotification(GAME.BEGIN_STAGE_DONE, {
			prefabFleet = slot7,
			stageId = slot8,
			system = SYSTEM_WORLD,
			token = slot0.key
		})
	end, function (slot0)
		slot0:RequestFailStandardProcess(slot0)
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
	slot9 = getProxy(WorldProxy).GetWorld(slot6).GetActiveMap(slot7).GetFleet(slot8)
	slot5 = slot9:GetShipVOs(true)
	slot10, slot11 = slot9:GetCost()
	slot4 = slot11.oil

	if slot0.statistics.submarineAid then
		for slot17, slot18 in ipairs(slot13) do
			if slot0.statistics[slot18.id] then
				table.insert(slot5, slot18)
			end
		end

		slot14, slot15 = slot12:GetCost()
		slot4 = slot4 + slot15.oil
	end

	slot1:SendRequest(slot1.GeneralPackage(slot0, slot5), function (slot0)
		if slot0.end_sink_cost > 0 then
			slot1.DeadShipEnergyCosume(slot2, slot3)
		end

		slot1.addShipsExp(slot0.ship_exp_list, slot2.statistics, accumulate)

		slot2.statistics.mvpShipID = slot0.mvp
		slot1, slot2 = slot2.statistics:GeneralLoot(slot0)

		slot1.GeneralPlayerCosume(SYSTEM_WORLD, ys.Battle.BattleConst.BattleScore.C < accumulate, , slot0.player_exp, exFlag)
		slot1:sendNotification(GAME.FINISH_STAGE_DONE, slot4)
		slot1:WriteBack(ys.Battle.BattleConst.BattleScore.C < accumulate, slot2)

		if not slot3 then
			slot7:AddLog(WorldLog.TypeBattleFailure, {
				fleet = slot6:GetFleet().id
			})
		end
	end)
end

return slot0
