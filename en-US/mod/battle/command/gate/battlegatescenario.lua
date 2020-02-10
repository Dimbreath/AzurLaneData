slot0 = class
slot1 = "BattleGateScenario"
slot0 = slot0(slot1)
slot1 = ys
slot1 = slot1.Battle
slot1.BattleGateScenario = slot0
slot1 = "BattleGateScenario"
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
	slot5 = pg.battle_cost_template[SYSTEM_SCENARIO].oil_cost > 0
	slot6 = {}
	slot7 = 0
	slot8 = 0
	slot9 = 0
	slot10 = 0
	slot11 = getProxy(ChapterProxy)
	slot13 = slot11.getActiveChapter(slot11).fleet
	slot15, slot16, slot17 = ipairs(slot13.getShips(slot13, false))

	for slot18, slot19 in slot15, slot16, slot17 do
		slot20 = #slot6
		slot20 = slot20 + 1
		slot21 = slot19.id
		slot6[slot20] = slot21
	end

	slot16 = slot12
	slot15 = slot12.getFleetCost
	slot17 = slot13
	slot15, slot16 = slot15(slot16, slot17)
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

	slot18 = slot0.stageId
	slot19 = pg
	slot19 = slot19.expedition_data_template
	slot19 = slot19[slot18]
	slot19 = slot19.dungeon_id
	slot20 = ys
	slot20 = slot20.Battle
	slot20 = slot20.BattleDataFunction
	slot20 = slot20.GetDungeonTmpDataByID
	slot21 = slot19
	slot20 = slot20(slot21)
	slot20 = slot20.fleet_prefab
	slot21 = slot1.ShipVertify

	slot21()

	slot21 = nil
	slot23 = slot12
	slot22 = slot12.getPlayType
	slot22 = slot22(slot23)
	slot23 = ChapterConst
	slot23 = slot23.TypeExtra

	if slot22 == slot23 then
		slot21 = true
	end

	function slot22(slot0)
		slot1 = uv0

		if slot1 then
			slot1 = uv1
			slot2 = slot1
			slot1 = slot1.consume
			slot3 = {
				gold = 0
			}
			slot4 = uv2
			slot3.oil = slot4

			slot1(slot2, slot3)
		end

		slot1 = uv3
		slot1 = slot1.enter_energy_cost
		slot2 = 0

		if slot1 > slot2 then
			slot1 = uv4

			if not slot1 then
				slot1 = pg
				slot1 = slot1.gameset
				slot1 = slot1.battle_consume_energy
				slot1 = slot1.key_value
				slot2 = ipairs
				slot3 = uv5
				slot2, slot3, slot4 = slot2(slot3)

				for slot5, slot6 in slot2, slot3, slot4 do
					slot8 = slot6
					slot7 = slot6.cosumeEnergy
					slot9 = slot1

					slot7(slot8, slot9)

					slot7 = uv6
					slot8 = slot7
					slot7 = slot7.updateShip
					slot9 = slot6

					slot7(slot8, slot9)
				end
			end
		end

		slot1 = uv7
		slot2 = slot1
		slot1 = slot1.updatePlayer
		slot3 = uv1

		slot1(slot2, slot3)

		slot1 = {}
		slot2 = uv8
		slot1.prefabFleet = slot2
		slot2 = uv9
		slot1.stageId = slot2
		slot2 = SYSTEM_SCENARIO
		slot1.system = slot2
		slot2 = slot0.key
		slot1.token = slot2
		slot2 = slot0.exitCallback
		slot1.exitCallback = slot2
		slot2 = uv10
		slot3 = slot2
		slot2 = slot2.sendNotification
		slot4 = GAME
		slot4 = slot4.BEGIN_STAGE_DONE
		slot5 = slot1

		slot2(slot3, slot4, slot5)
	end

	function slot23(slot0)
		slot1 = uv0
		slot2 = slot1
		slot1 = slot1.RequestFailStandardProcess
		slot3 = slot0

		slot1(slot2, slot3)
	end

	slot24 = BeginStageCommand
	slot24 = slot24.SendRequest
	slot25 = SYSTEM_SCENARIO
	slot26 = slot6
	slot27 = {
		slot18
	}
	slot28 = slot22
	slot29 = slot23

	slot24(slot25, slot26, slot27, slot28, slot29)
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
	slot3 = SYSTEM_SCENARIO
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
	slot7 = 0
	slot8 = {}
	slot10 = slot4
	slot9 = slot4.getActiveChapter
	slot9 = slot9(slot10)
	slot10 = slot9.fleet
	slot12 = slot10
	slot11 = slot10.getShips
	slot13 = true
	slot11 = slot11(slot12, slot13)
	slot12 = ipairs
	slot13 = slot11
	slot12, slot13, slot14 = slot12(slot13)

	for slot15, slot16 in slot12, slot13, slot14 do
		slot17 = table
		slot17 = slot17.insert
		slot18 = slot8
		slot19 = slot16

		slot17(slot18, slot19)
	end

	slot13 = slot9
	slot12 = slot9.getFleetCost
	slot14 = slot10
	slot12, slot13 = slot12(slot13, slot14)
	slot6 = slot13.gold
	slot7 = slot13.oil
	slot14 = slot0.statistics
	slot14 = slot14.submarineAid

	if slot14 then
		slot14 = _
		slot14 = slot14.detect
		slot15 = slot9.fleets

		function slot16(slot0)
			slot2 = slot0
			slot1 = slot0.getFleetType
			slot1 = slot1(slot2)
			slot2 = FleetType
			slot2 = slot2.Submarine

			if slot1 == slot2 then
				slot2 = slot0
				slot1 = slot0.isValid
				slot1 = slot1(slot2)
			else
				slot1 = false

				if false then
					slot1 = true
				end
			end

			return slot1
		end

		slot14 = slot14(slot15, slot16)

		if slot14 then
			slot16 = slot14
			slot15 = slot14.getShipsByTeam
			slot17 = TeamType
			slot17 = slot17.Submarine
			slot18 = true
			slot15 = slot15(slot16, slot17, slot18)
			submarineTeam = slot15
			slot15 = ipairs
			slot16 = submarineTeam
			slot15, slot16, slot17 = slot15(slot16)

			for slot18, slot19 in slot15, slot16, slot17 do
				slot20 = slot0.statistics
				slot21 = slot19.id
				slot20 = slot20[slot21]

				if slot20 then
					slot20 = table
					slot20 = slot20.insert
					slot21 = slot8
					slot22 = slot19

					slot20(slot21, slot22)

					slot21 = slot19
					slot20 = slot19.getEndBattleExpend
					slot20 = slot20(slot21)
					slot7 = slot7 + slot20
				end
			end
		else
			slot15 = print
			slot16 = "finish stage error: can not find submarine fleet."

			slot15(slot16)
		end
	end

	slot14 = ys
	slot14 = slot14.Battle
	slot14 = slot14.BattleConst
	slot14 = slot14.BattleScore
	slot14 = slot14.C
	slot14 = slot14 < slot5
	slot16 = slot9
	slot15 = slot9.writeBack
	slot17 = slot14
	slot18 = slot0

	slot15(slot16, slot17, slot18)

	slot16 = slot4
	slot15 = slot4.updateChapter
	slot17 = slot9

	slot15(slot16, slot17)

	slot15 = slot1.GeneralPackage
	slot16 = slot0
	slot17 = slot8
	slot15 = slot15(slot16, slot17)

	function slot16(slot0)
		slot1 = uv0
		slot2 = slot1
		slot1 = slot1.getPlayType
		slot1 = slot1(slot2)
		slot2 = ChapterConst
		slot2 = slot2.TypeExtra

		if slot1 ~= slot2 then
			slot1 = false
		else
			slot1 = true
		end

		slot2 = uv1
		slot2 = slot2.end_sink_cost
		slot3 = 0

		if slot2 > slot3 and not slot1 then
			slot2 = uv2
			slot2 = slot2.DeadShipEnergyCosume
			slot3 = uv3
			slot4 = uv4

			slot2(slot3, slot4)
		end

		slot2 = uv2
		slot2 = slot2.addShipsExp
		slot3 = slot0.ship_exp_list
		slot4 = uv3
		slot4 = slot4.statistics
		slot5 = true

		slot2(slot3, slot4, slot5)

		slot2 = uv2
		slot2 = slot2.GenerateCommanderExp
		slot3 = slot0
		slot4 = uv5
		slot5 = slot4
		slot4 = slot4.getActiveChapter
		slot4 = slot4(slot5)
		slot4 = slot4.fleet
		slot2 = slot2(slot3, slot4)
		slot3 = uv3
		slot3 = slot3.statistics
		slot4 = slot0.mvp
		slot3.mvpShipID = slot4
		slot3 = uv2
		slot4 = slot3
		slot3 = slot3.GeneralLoot
		slot5 = slot0
		slot3, slot4 = slot3(slot4, slot5)
		slot5 = uv2
		slot5 = slot5.GeneralPlayerCosume
		slot6 = SYSTEM_SCENARIO
		slot7 = uv6
		slot8 = uv7
		slot9 = slot0.player_exp
		slot10 = slot1

		slot5(slot6, slot7, slot8, slot9, slot10)

		slot5 = {}
		slot6 = SYSTEM_SCENARIO
		slot5.system = slot6
		slot6 = uv3
		slot6 = slot6.statistics
		slot5.statistics = slot6
		slot6 = uv8
		slot5.score = slot6
		slot5.drops = slot3
		slot5.commanderExps = slot2
		slot6 = slot0.result
		slot5.result = slot6
		slot5.extraDrops = slot4
		slot6 = uv3
		slot6 = slot6.exitCallback
		slot5.exitCallback = slot6
		slot6 = uv2
		slot7 = slot6
		slot6 = slot6.sendNotification
		slot8 = GAME
		slot8 = slot8.FINISH_STAGE_DONE
		slot9 = slot5

		slot6(slot7, slot8, slot9)

		slot6 = uv5
		slot7 = slot6
		slot6 = slot6.updateActiveChapterShips

		slot6(slot7)

		slot6 = uv5
		slot7 = slot6
		slot6 = slot6.getActiveChapter
		slot6 = slot6(slot7)
		slot8 = slot6
		slot7 = slot6.writeDrops
		slot9 = slot3

		slot7(slot8, slot9)

		slot7 = uv5
		slot8 = slot7
		slot7 = slot7.getMaps
		slot7 = slot7(slot8)
		slot8 = nil
		slot9 = ipairs
		slot10 = slot7
		slot9, slot10, slot11 = slot9(slot10)

		for slot12, slot13 in slot9, slot10, slot11 do
			slot15 = slot13
			slot14 = slot13.isUnlock
			slot14 = slot14(slot15)

			if slot14 then
				slot8 = slot13.id
			end
		end

		slot9 = uv5
		slot10 = slot9
		slot9 = slot9.updateChapter
		slot11 = slot6

		slot9(slot10, slot11)

		slot9 = uv5
		slot10 = slot9
		slot9 = slot9.getMaps
		slot9 = slot9(slot10)
		slot7 = slot9
		slot9 = nil
		slot10 = ipairs
		slot11 = slot7
		slot10, slot11, slot12 = slot10(slot11)

		for slot13, slot14 in slot10, slot11, slot12 do
			slot16 = slot14
			slot15 = slot14.isUnlock
			slot15 = slot15(slot16)

			if slot15 then
				slot9 = slot14.id
			end
		end

		slot10 = Map
		slot10 = slot10.lastMap

		if slot10 and slot9 ~= slot8 and slot8 < slot9 then
			slot10 = Map
			slot11 = true
			slot10.autoNextPage = slot11
		end
	end

	slot18 = slot1
	slot17 = slot1.SendRequest
	slot19 = slot15
	slot20 = slot16

	slot17(slot18, slot19, slot20)
end

slot0.Exit = slot1

return slot0
