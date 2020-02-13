slot0 = class
slot1 = "BattleGateGuild"
slot0 = slot0(slot1)
slot1 = ys
slot1 = slot1.Battle
slot1.BattleGateGuild = slot0
slot1 = "BattleGateGuild"
slot0.__name = slot1

function slot1(slot0, slot1)
	slot2 = BeginStageCommand
	slot2 = slot2.DockOverload
	slot2 = slot2()

	if slot2 then
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
	slot15, slot16, slot17 = ipairs(slot14)

	for slot18, slot19 in slot15, slot16, slot17 do
		slot20 = #slot6
		slot20 = slot20 + 1
		slot21 = slot19.id
		slot6[slot20] = slot21
	end

	slot16 = slot13
	slot15 = slot13.GetCost
	slot15, slot16 = slot15(slot16)
	slot7 = slot15.gold
	slot8 = slot15.oil
	slot17 = slot15.gold
	slot18 = slot16.gold
	slot9 = slot17 + slot18
	slot17 = slot15.oil
	slot18 = slot16.oil
	slot10 = slot17 + slot18
	slot18 = slot2
	slot17 = slot2.getData
	slot17 = slot17(slot18)

	if slot5 then
		slot18 = slot17.oil

		if slot18 < slot10 then
			slot18 = pg
			slot18 = slot18.TipsMgr
			slot18 = slot18.GetInstance
			slot18 = slot18()
			slot19 = slot18
			slot18 = slot18.ShowTips
			slot20 = i18n
			slot21 = "stage_beginStage_error_noResource"

			slot18(slot19, slot20(slot21))

			return
		end
	end

	slot18 = stageId
	slot19 = pg
	slot19 = slot19.guild_boss_template
	slot19 = slot19[slot18]
	slot19 = slot19.dungeon_id
	slot20 = slot1.ShipVertify

	slot20()

	function slot20(slot0)
		slot1 = slot0

		if slot1 then
			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.consume
			slot3 = {
				gold = 0
			}
			slot4 = slot2
			slot3.oil = slot4

			slot1(slot2, slot3)
		end

		slot1 = slot3
		slot1 = slot1.enter_energy_cost
		slot2 = 0

		if slot1 > slot2 then
			slot1 = exFlag

			if not slot1 then
				slot1 = pg
				slot1 = slot1.gameset
				slot1 = slot1.battle_consume_energy
				slot1 = slot1.key_value
				slot2 = ipairs
				slot3 = slot4
				slot2, slot3, slot4 = slot2(slot3)

				for slot5, slot6 in slot2, slot3, slot4 do
					slot8 = slot6
					slot7 = slot6.cosumeEnergy
					slot9 = slot1

					slot7(slot8, slot9)

					slot7 = slot5
					slot8 = slot7
					slot7 = slot7.updateShip
					slot9 = slot6

					slot7(slot8, slot9)
				end
			end
		end

		slot1 = slot6
		slot2 = slot1
		slot1 = slot1.updatePlayer
		slot3 = slot1

		slot1(slot2, slot3)

		slot1 = {}
		slot2 = prefabFleet
		slot1.prefabFleet = slot2
		slot2 = slot7
		slot1.stageId = slot2
		slot2 = SYSTEM_GUILD
		slot1.system = slot2
		slot2 = slot0.key
		slot1.token = slot2
		slot2 = slot8
		slot3 = slot2
		slot2 = slot2.sendNotification
		slot4 = GAME
		slot4 = slot4.BEGIN_STAGE_DONE
		slot5 = slot1

		slot2(slot3, slot4, slot5)
	end

	function slot21(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.RequestFailStandardProcess
		slot3 = slot0

		slot1(slot2, slot3)
	end

	slot22 = BeginStageCommand
	slot22 = slot22.SendRequest
	slot23 = SYSTEM_GUILD
	slot24 = slot6
	slot25 = {
		slot19
	}
	slot26 = slot20
	slot27 = slot21

	slot22(slot23, slot24, slot25, slot26, slot27)
end

slot0.Entrance = slot1

function slot1(slot0, slot1)
	slot2 = slot1.CheaterVertify
	slot2 = slot2()

	if slot2 then
		return
	end

	slot2 = pg
	slot2 = slot2.battle_cost_template
	slot3 = SYSTEM_GUILD
	slot2 = slot2[slot3]
	slot3 = getProxy
	slot4 = FleetProxy
	slot3 = slot3(slot4)
	slot4 = getProxy
	slot5 = ChapterProxy
	slot4 = slot4(slot5)
	slot5 = slot0.statistics
	slot5 = slot5._battleScore
	slot6 = 0
	slot7 = {}
	slot9 = slot4
	slot8 = slot4.getGuildChapter
	slot8 = slot8(slot9)
	slot9 = slot8.fleet
	slot11 = slot9
	slot10 = slot9.getShips
	slot12 = true
	slot10 = slot10(slot11, slot12)
	slot11 = ipairs
	slot12 = slot10
	slot11, slot12, slot13 = slot11(slot12)

	for slot14, slot15 in slot11, slot12, slot13 do
		slot16 = table
		slot16 = slot16.insert
		slot17 = slot7
		slot18 = slot15

		slot16(slot17, slot18)
	end

	slot12 = slot1
	slot11 = slot1.GeneralPackage
	slot13 = slot0
	slot14 = slot7
	slot11 = slot11(slot12, slot13, slot14)

	function slot12(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-28, warpins: 2 ---
		slot1 = slot0
		slot1 = slot1.end_sink_cost
		slot2 = 0

		if slot1 > slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-10, warpins: 1 ---
			slot1 = slot1
			slot1 = slot1.DeadShipEnergyCosume
			slot2 = slot2
			slot3 = slot3

			slot1(slot2, slot3)
			--- END OF BLOCK #0 ---



		end

		slot1 = slot1
		slot1 = slot1.addShipsExp
		slot2 = slot0.ship_exp_list
		slot3 = slot2
		slot3 = slot3.statistics

		slot1(slot2, slot3)

		slot1 = slot2
		slot1 = slot1.statistics
		slot2 = slot0.mvp
		slot1.mvpShipID = slot2
		slot1 = slot4
		slot2 = ys
		slot2 = slot2.Battle
		slot2 = slot2.BattleConst
		slot2 = slot2.BattleScore
		slot2 = slot2.C
		slot1 = slot2 < slot1
		slot2 = slot5
		slot2 = slot2.GeneralPlayerCosume
		slot3 = SYSTEM_GUILD
		slot4 = slot1
		slot5 = slot6
		slot6 = slot0.player_exp

		slot2(slot3, slot4, slot5, slot6)

		slot2 = slot1
		slot3 = slot2
		slot2 = slot2.GeneralLoot
		slot4 = slot0
		slot2, slot3 = slot2(slot3, slot4)
		slot4 = {}
		slot5 = SYSTEM_GUILD
		slot4.system = slot5
		slot5 = slot2
		slot5 = slot5.statistics
		slot4.statistics = slot5
		slot5 = slot4
		slot4.score = slot5
		slot4.drops = slot2
		slot5 = {}
		slot4.commanderExps = slot5
		slot5 = slot0.result
		slot4.result = slot5
		slot4.extraDrops = slot3
		slot5 = slot1
		slot6 = slot5
		slot5 = slot5.sendNotification
		slot7 = GAME
		slot7 = slot7.FINISH_STAGE_DONE
		slot8 = slot4

		slot5(slot6, slot7, slot8)

		slot5 = slot7
		slot6 = slot5
		slot5 = slot5.updateGuildChapterShips

		slot5(slot6)

		slot5 = slot7
		slot6 = slot5
		slot5 = slot5.getGuildChapter
		slot5 = slot5(slot6)
		slot7 = slot5
		slot6 = slot5.writeBack
		slot8 = slot1
		slot9 = slot2

		slot6(slot7, slot8, slot9)

		slot6 = slot7
		slot7 = slot6
		slot6 = slot6.updateGuildChapter
		slot8 = slot5

		slot6(slot7, slot8)

		return

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 29-30, warpins: 1 ---
		slot1 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-31, warpins: 1 ---
			slot1 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 32-83, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	slot14 = slot1
	slot13 = slot1.SendRequest
	slot15 = slot11
	slot16 = slot12

	slot13(slot14, slot15, slot16)
end

slot0.Exit = slot1

return slot0
