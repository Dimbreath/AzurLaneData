slot0 = class("BattleGateChallenge")
ys.Battle.BattleGateChallenge = slot0
slot0.__name = "BattleGateChallenge"

slot0.Entrance = function (slot0, slot1)
	slot3 = slot0.actID
	slot4 = getProxy(PlayerProxy)
	slot5 = getProxy(BayProxy)
	slot8 = pg.battle_cost_template[SYSTEM_CHALLENGE].oil_cost > 0
	slot9 = {}
	slot10 = 0
	slot11 = 0
	slot12 = 0
	slot13 = 0
	ships = getProxy(ChallengeProxy):getUserChallengeInfo(slot0.mode).getRegularFleet(slot14).getShips(slot15, false)

	for slot19, slot20 in ipairs(ships) do
		slot9[#slot9 + 1] = slot20.id
	end

	slot16 = slot4:getData()

	if slot8 and slot16.oil < slot13 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	slot1.ShipVertify()
	BeginStageCommand.SendRequest(SYSTEM_CHALLENGE, slot9, {
		slot14:getNextStageID(),
		{
			slot14:getLevel(),
			slot2
		}
	}, function (slot0)
		if slot0 then
			slot1:consume({
				gold = 0,
				oil = slot1
			})
		end

		if slot3.enter_energy_cost > 0 then
			slot1 = pg.gameset.battle_consume_energy.key_value

			for slot5, slot6 in ipairs(ships) do
				slot6:cosumeEnergy(slot1)
				slot4:updateShip(slot6)
			end
		end

		slot5:updatePlayer(slot5.updatePlayer)
		slot9:sendNotification(GAME.BEGIN_STAGE_DONE, {
			prefabFleet = {},
			stageId = slot6,
			system = SYSTEM_CHALLENGE,
			actId = slot7,
			token = slot0.key,
			mode = slot8
		})
	end, function (slot0)
		slot0:RequestFailStandardProcess(slot0)
	end)
end

slot0.Exit = function (slot0, slot1)
	slot2 = pg.battle_cost_template[SYSTEM_CHALLENGE]
	slot3 = getProxy(FleetProxy)
	slot5 = slot0.statistics._battleScore
	slot6 = 0
	slot7 = {}
	slot7 = {}

	for slot15, slot16 in ipairs(slot11) do
		table.insert(slot7, slot16)
	end

	slot6 = 0
	slot1.GeneralPackage(slot0, slot7).data2 = {
		slot9:getLevel(),
		slot8
	}

	slot1:SendRequest(slot1.GeneralPackage(slot0, slot7), function (slot0)
		if slot0.end_sink_cost > 0 then
			slot1.DeadShipEnergyCosume(slot2, slot3)
		end

		slot1.addShipsExp(slot0.ship_exp_list, slot2.statistics)

		slot2.statistics.mvpShipID = slot0.mvp
		slot1, slot2 = slot2.statistics:GeneralLoot(slot0)

		slot1.GeneralPlayerCosume(SYSTEM_CHALLENGE, ys.Battle.BattleConst.BattleScore.C < slot4, , slot0.player_exp, exFlag)
		slot1:sendNotification(GAME.FINISH_STAGE_DONE, slot4)

		function slot6(slot0)
			if slot0.statistics[slot0] then
				slot1:updateShipHP(slot0, slot1.bp)
			end
		end

		for slot10, slot11 in pairs(slot5) do
			slot6(slot11)
		end
	end)
end

return slot0
