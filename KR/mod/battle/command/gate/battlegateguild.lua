slot0 = class("BattleGateGuild")
ys.Battle.BattleGateGuild = slot0
slot0.__name = "BattleGateGuild"

function slot0.Entrance(slot0, slot1)
	if BeginStageCommand.DockOverload() then
		return
	end

	slot2 = getProxy(PlayerProxy)
	slot3 = getProxy(BayProxy)
	slot5 = pg.battle_cost_template[SYSTEM_GUILD].oil_cost > 0
	slot6 = {}
	slot7 = 0
	slot8 = 0
	slot9 = 0
	slot10 = 0

	for slot18, slot19 in ipairs(slot14) do
		slot6[#slot6 + 1] = slot19.id
	end

	slot15, slot16 = slot13:GetCost()
	slot7 = slot15.gold
	slot8 = slot15.oil
	slot9 = slot15.gold + slot16.gold
	slot10 = slot15.oil + slot16.oil
	slot17 = slot2:getData()

	if slot5 and slot17.oil < slot10 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	slot1.ShipVertify()
	BeginStageCommand.SendRequest(SYSTEM_GUILD, slot6, {
		pg.guild_boss_template[stageId].dungeon_id
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
		slot8:sendNotification(GAME.BEGIN_STAGE_DONE, {
			prefabFleet = prefabFleet,
			stageId = slot7,
			system = SYSTEM_GUILD,
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

	slot2 = pg.battle_cost_template[SYSTEM_GUILD]
	slot3 = getProxy(FleetProxy)
	slot5 = slot0.statistics._battleScore
	slot6 = 0
	slot7 = {}

	for slot14, slot15 in ipairs(slot10) do
		table.insert(slot7, slot15)
	end

	slot1:SendRequest(slot1:GeneralPackage(slot0, slot7), function (slot0)
		if slot0.end_sink_cost > 0 then
			slot1.DeadShipEnergyCosume(slot2, slot3)
		end

		slot1.addShipsExp(slot0.ship_exp_list, slot2.statistics)

		slot2.statistics.mvpShipID = slot0.mvp

		slot5.GeneralPlayerCosume(SYSTEM_GUILD, ys.Battle.BattleConst.BattleScore.C < slot4, slot6, slot0.player_exp)

		slot5, slot4.extraDrops = ys.Battle.BattleConst.BattleScore.C < slot4:GeneralLoot(slot0)

		ys.Battle.BattleConst.BattleScore.C < slot4:sendNotification(GAME.FINISH_STAGE_DONE, slot4)
		slot7:updateGuildChapterShips()

		slot5 = slot7:getGuildChapter()

		slot5:writeBack(ys.Battle.BattleConst.BattleScore.C < slot4, slot2)
		slot5:updateGuildChapter(slot5)
	end)
end

return slot0
