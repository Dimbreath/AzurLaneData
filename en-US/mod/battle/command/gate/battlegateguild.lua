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

	for slot18, slot19 in ipairs(getProxy(ChapterProxy):getGuildChapter().fleet:getShips(false)) do
		slot6[#slot6 + 1] = slot19.id
	end

	slot15, slot16 = slot13:GetCost()
	slot7 = slot15.gold
	slot8 = slot15.oil
	slot9 = slot15.gold + slot16.gold

	if slot5 and slot2:getData().oil < slot15.oil + slot16.oil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	slot1.ShipVertify()

	slot25[1] = pg.guild_boss_template[stageId].dungeon_id

	BeginStageCommand.SendRequest(SYSTEM_GUILD, slot6, {}, function (slot0)
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

		slot1.prefabFleet = prefabFleet
		slot1.stageId = uv7
		slot1.system = SYSTEM_GUILD
		slot1.token = slot0.key

		uv8:sendNotification(GAME.BEGIN_STAGE_DONE, {})
	end, function (slot0)
		uv0:RequestFailStandardProcess(slot0)
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

	for slot14, slot15 in ipairs(getProxy(ChapterProxy):getGuildChapter().fleet:getShips(true)) do
		table.insert({}, slot15)
	end

	slot1:SendRequest(slot1:GeneralPackage(slot0, slot7), function (slot0)
		if uv0.end_sink_cost > 0 then
			uv1.DeadShipEnergyCosume(uv2, uv3)
		end

		uv1.addShipsExp(slot0.ship_exp_list, uv2.statistics)

		uv2.statistics.mvpShipID = slot0.mvp
		slot1 = ys.Battle.BattleConst.BattleScore.C < uv4

		uv5.GeneralPlayerCosume(SYSTEM_GUILD, slot1, uv6, slot0.player_exp)

		slot4.drops, slot4.extraDrops = uv1:GeneralLoot(slot0)
		slot4.system = SYSTEM_GUILD
		slot4.statistics = uv2.statistics
		slot4.score = uv4
		slot4.commanderExps = {}
		slot4.result = slot0.result

		uv1:sendNotification(GAME.FINISH_STAGE_DONE, {})
		uv7:updateGuildChapterShips()

		slot5 = uv7:getGuildChapter()

		slot5:writeBack(slot1, uv2)
		uv7:updateGuildChapter(slot5)
	end)
end

return slot0
