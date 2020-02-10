slot0 = class("BattleGateChallenge")
ys.Battle.BattleGateChallenge = slot0
slot0.__name = "BattleGateChallenge"

function slot0.Entrance(slot0, slot1)
	slot3 = slot0.actID
	slot4 = getProxy(PlayerProxy)
	slot5 = getProxy(BayProxy)
	slot8 = pg.battle_cost_template[SYSTEM_CHALLENGE].oil_cost > 0
	slot9 = {}
	slot10 = 0
	slot11 = 0
	slot12 = 0
	slot13 = 0
	ships = getProxy(ChallengeProxy):getUserChallengeInfo(slot0.mode):getRegularFleet():getShips(false)

	for slot19, slot20 in ipairs(ships) do
		slot9[#slot9 + 1] = slot20.id
	end

	if slot8 and slot4:getData().oil < slot13 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	slot19[1] = slot14:getLevel()
	slot19[2] = slot2

	slot1.ShipVertify()

	slot25[1] = slot14:getNextStageID()
	slot25[2] = {}

	BeginStageCommand.SendRequest(SYSTEM_CHALLENGE, slot9, {}, function (slot0)
		if uv0 then
			slot3.oil = uv2

			uv1:consume({
				gold = 0
			})
		end

		if uv3.enter_energy_cost > 0 then
			for slot5, slot6 in ipairs(ships) do
				slot6:cosumeEnergy(pg.gameset.battle_consume_energy.key_value)
				uv4:updateShip(slot6)
			end
		end

		slot1 = uv5

		slot1:updatePlayer(uv1)

		slot1.prefabFleet = {}
		slot1.stageId = uv6
		slot1.system = SYSTEM_CHALLENGE
		slot1.actId = uv7
		slot1.token = slot0.key
		slot1.mode = uv8

		uv9:sendNotification(GAME.BEGIN_STAGE_DONE, {})
	end, function (slot0)
		uv0:RequestFailStandardProcess(slot0)
	end)
end

function slot0.Exit(slot0, slot1)
	slot2 = pg.battle_cost_template[SYSTEM_CHALLENGE]
	slot3 = getProxy(FleetProxy)
	slot5 = slot0.statistics._battleScore
	slot6 = 0
	slot7 = {}

	for slot15, slot16 in ipairs(getProxy(ChallengeProxy):getUserChallengeInfo(slot0.mode):getRegularFleet():getShips(true)) do
		table.insert({}, slot16)
	end

	slot12[1] = slot9:getLevel()
	slot12[2] = slot8
	slot6 = 0
	slot13 = slot1.GeneralPackage(slot0, slot7)
	slot13.data2 = {}

	slot1:SendRequest(slot13, function (slot0)
		if uv0.end_sink_cost > 0 then
			uv1.DeadShipEnergyCosume(uv2, uv3)
		end

		uv1.addShipsExp(slot0.ship_exp_list, uv2.statistics)

		uv2.statistics.mvpShipID = slot0.mvp
		slot4.drops, slot4.extraDrops = uv1:GeneralLoot(slot0)

		uv1.GeneralPlayerCosume(SYSTEM_CHALLENGE, ys.Battle.BattleConst.BattleScore.C < uv4, uv5, slot0.player_exp, exFlag)

		slot4.system = SYSTEM_CHALLENGE
		slot4.statistics = uv2.statistics
		slot4.score = uv4
		slot4.commanderExps = {}
		slot4.result = slot0.result

		uv1:sendNotification(GAME.FINISH_STAGE_DONE, {})

		for slot10, slot11 in pairs(uv6:getShipUIDList()) do
			function (slot0)
				if uv0.statistics[slot0] then
					uv1:updateShipHP(slot0, slot1.bp)
				end
			end(slot11)
		end
	end)
end

return slot0
