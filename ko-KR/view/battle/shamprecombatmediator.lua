slot0 = class
slot1 = "ShamPreCombatMediator"
slot2 = import
slot3 = "..base.ContextMediator"
slot0 = slot0(slot1, slot2(slot3))
slot1 = "ShamPreCombatMediator.OP"
slot0.OP = slot1
slot1 = "ShamPreCombatMediator.SAVE"
slot0.SAVE = slot1
slot1 = "ShamPreCombatMediator.RESET"
slot0.RESET = slot1
slot1 = "ShamPreCombatMediator:START"
slot0.START = slot1
slot1 = "ShamPreCombatMediator:CHANGE_FLEET_SHIP"
slot0.CHANGE_FLEET_SHIP = slot1
slot1 = "ShamPreCombatMediator:OPEN_SHIP_INFO"
slot0.OPEN_SHIP_INFO = slot1

function slot1(slot0)
	slot1 = getProxy
	slot2 = BayProxy
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.setSelectShipId
	slot4 = nil

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.bind
	slot4 = slot0
	slot4 = slot4.SAVE

	function slot5(slot0, slot1)
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.save
		slot4 = slot1

		slot2(slot3, slot4)
	end

	slot2(slot3, slot4, slot5)

	slot3 = slot0
	slot2 = slot0.bind
	slot4 = slot0
	slot4 = slot4.START

	function slot5(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.enter

		slot1(slot2)
	end

	slot2(slot3, slot4, slot5)

	slot3 = slot0
	slot2 = slot0.bind
	slot4 = slot0
	slot4 = slot4.RESET

	function slot5(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.reset

		slot1(slot2)
	end

	slot2(slot3, slot4, slot5)

	slot3 = slot0
	slot2 = slot0.bind
	slot4 = slot0
	slot4 = slot4.OP

	function slot5(slot0, slot1)
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.save

		function slot4()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.sendNotification
			slot2 = GAME
			slot2 = slot2.SHAM_OP
			slot3 = slot1

			slot0(slot1, slot2, slot3)
		end

		slot2(slot3, slot4)
	end

	slot2(slot3, slot4, slot5)

	slot3 = slot0
	slot2 = slot0.bind
	slot4 = slot0
	slot4 = slot4.CHANGE_FLEET_SHIP

	function slot5(slot0, slot1)
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.openDockYard
		slot4 = slot1.type
		slot5 = slot1.shipVO
		slot6 = slot1.team

		slot2(slot3, slot4, slot5, slot6)
	end

	slot2(slot3, slot4, slot5)

	slot3 = slot0
	slot2 = slot0.bind
	slot4 = slot0
	slot4 = slot4.OPEN_SHIP_INFO

	function slot5(slot0, slot1)
		slot2 = getProxy
		slot3 = BayProxy
		slot2 = slot2(slot3)
		slot4 = slot2
		slot3 = slot2.getShipById
		slot5 = slot1
		slot3 = slot3(slot4, slot5)

		if slot3 then
			slot3 = slot0
			slot3 = slot3.contextData
			slot3 = slot3.shamChapter
			slot4 = slot0
			slot5 = slot4
			slot4 = slot4.sendNotification
			slot6 = GAME
			slot6 = slot6.GO_SCENE
			slot7 = SCENE
			slot7 = slot7.SHIPINFO
			slot8 = {
				shipId = slot1
			}
			slot10 = slot3
			slot9 = slot3.getShips
			slot9 = slot9(slot10)
			slot8.shipVOs = slot9

			slot4(slot5, slot6, slot7, slot8)
		end
	end

	slot2(slot3, slot4, slot5)

	slot2 = getProxy
	slot3 = PlayerProxy
	slot2 = slot2(slot3)
	slot3 = slot0.viewComponent
	slot4 = slot3
	slot3 = slot3.setPlayerInfo
	slot6 = slot2
	slot5 = slot2.getData

	slot3(slot4, slot5(slot6))

	slot3 = slot0.contextData
	slot3 = slot3.shamChapter
	slot4 = slot0.viewComponent
	slot5 = slot4
	slot4 = slot4.updateChapter
	slot6 = slot3

	slot4(slot5, slot6)

	slot4 = slot3.active

	if not slot4 then
		slot4 = slot0.contextData
		slot4 = slot4.confirmed

		if slot4 then
			slot4 = slot0.viewComponent
			slot5 = slot4
			slot4 = slot4.displayFormation

			slot4(slot5)
		else
			slot4 = slot0.viewComponent
			slot5 = slot4
			slot4 = slot4.displayFleetPanel

			slot4(slot5)
		end
	end
end

slot0.register = slot1

function slot1(slot0)
	slot1 = {}
	slot2 = PlayerProxy
	slot2 = slot2.UPDATED
	slot1[1] = slot2
	slot2 = ChapterProxy
	slot2 = slot2.SHAM_CHAPTER_UPDATED
	slot1[2] = slot2
	slot2 = GAME
	slot2 = slot2.SHAM_ENTER_DONE
	slot1[3] = slot2
	slot2 = GAME
	slot2 = slot2.SHAM_OP_DONE
	slot1[4] = slot2
	slot2 = GAME
	slot2 = slot2.SHAM_ENTER_ERROR
	slot1[5] = slot2

	return slot1
end

slot0.listNotificationInterests = slot1

function slot1(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.getName
	slot2 = slot2(slot3)
	slot4 = slot1
	slot3 = slot1.getBody
	slot3 = slot3(slot4)
	slot4 = PlayerProxy
	slot4 = slot4.UPDATED

	if slot2 == slot4 then
		slot4 = getProxy
		slot5 = PlayerProxy
		slot4 = slot4(slot5)
		slot5 = slot0.viewComponent
		slot6 = slot5
		slot5 = slot5.setPlayerInfo
		slot8 = slot4
		slot7 = slot4.getData

		slot5(slot6, slot7(slot8))
	else
		slot4 = GAME
		slot4 = slot4.SHAM_ENTER_DONE

		if slot2 == slot4 then
			slot4 = slot0.viewComponent
			slot5 = slot4
			slot4 = slot4.emit
			slot6 = BaseUI
			slot6 = slot6.ON_CLOSE

			slot4(slot5, slot6)
		else
			slot4 = GAME
			slot4 = slot4.SHAM_ENTER_ERROR

			if slot2 == slot4 then
				if slot3 == 3 then
					slot5 = slot0
					slot4 = slot0.display

					slot4(slot5)
				end
			else
				slot4 = GAME
				slot4 = slot4.SHAM_OP_DONE

				if slot2 == slot4 then
					slot4 = slot3.type
					slot5 = ChapterConst
					slot5 = slot5.OpStrategy

					if slot4 ~= slot5 then
						slot4 = slot3.type
						slot5 = ChapterConst
						slot5 = slot5.OpRepair

						if slot4 ~= slot5 then
							slot4 = slot3.type
							slot5 = ChapterConst
							slot5 = slot5.OpRequest

							if slot4 == slot5 then
								slot5 = slot0
								slot4 = slot0.display

								slot4(slot5)
							end
						end
					end
				end
			end
		end
	end
end

slot0.handleNotification = slot1

function slot1(slot0)
	slot1 = getProxy
	slot2 = ChapterProxy
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.getShamChapter
	slot2 = slot2(slot3)
	slot3 = slot0.contextData
	slot3.shamChapter = slot2
	slot3 = slot0.viewComponent
	slot4 = slot3
	slot3 = slot3.updateChapter
	slot5 = slot2

	slot3(slot4, slot5)

	slot3 = slot0.viewComponent
	slot4 = slot3
	slot3 = slot3.displayFormation

	slot3(slot4)
end

slot0.display = slot1

function slot1(slot0, slot1)
	slot2 = getProxy
	slot3 = ChapterProxy
	slot2 = slot2(slot3)
	slot4 = slot2
	slot3 = slot2.getShamChapter
	slot3 = slot3(slot4)
	slot4 = slot0.contextData
	slot4 = slot4.shamChapter
	slot5 = nil

	function slot6()
		slot0 = coroutine
		slot0 = slot0.status
		slot1 = slot0
		slot0 = slot0(slot1)

		if slot0 == "suspended" then
			slot0 = coroutine
			slot0 = slot0.resume
			slot1 = slot0
			slot0, slot1 = slot0(slot1)
		end
	end

	slot7 = coroutine
	slot7 = slot7.create

	function slot8()
		slot0 = slot0
		slot0 = slot0.fleet
		slot1 = slot0
		slot0 = slot0.getShipIds
		slot0 = slot0(slot1)
		slot1 = slot1
		slot1 = slot1.active

		if slot1 then
			slot1 = slot0
			slot1 = slot1.fleet
			slot2 = slot1
			slot1 = slot1.isFormationDiffWith
			slot3 = slot1
			slot3 = slot3.fleet
			slot1 = slot1(slot2, slot3)

			if slot1 then
				slot1 = slot2
				slot2 = slot1
				slot1 = slot1.sendNotification
				slot3 = GAME
				slot3 = slot3.SHAM_CHANGE_FORMATION
				slot4 = {
					fleetShipIds = slot0
				}
				slot5 = slot3
				slot4.callback = slot5

				slot1(slot2, slot3, slot4)

				slot1 = coroutine
				slot1 = slot1.yield

				slot1()

				slot1 = slot4
				slot2 = slot1
				slot1 = slot1.getShamChapter
				slot1 = slot1(slot2)
				slot1 = slot1
			end
		else
			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.updateFriendShip
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.getFriendShip

			slot1(slot2, slot3(slot4))

			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.updateRawShips
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.getRawShips

			slot1(slot2, slot3(slot4))

			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.updateFleetShips
			slot3 = slot0

			slot1(slot2, slot3)

			slot1 = slot4
			slot2 = slot1
			slot1 = slot1.updateShamChapter
			slot3 = slot1

			slot1(slot2, slot3)

			slot1 = slot4
			slot2 = slot1
			slot1 = slot1.localSaveShamChapter

			slot1(slot2)
		end

		slot1 = slot5

		if slot1 then
			slot1 = slot5

			slot1()
		end
	end

	slot7 = slot7(slot8)
	slot5 = slot7
	slot7 = slot6

	slot7()
end

slot0.save = slot1

function slot1(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shamChapter
	slot3 = slot1
	slot2 = slot1.isOpen
	slot2 = slot2(slot3)

	if not slot2 then
		slot2 = pg
		slot2 = slot2.TipsMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.ShowTips
		slot4 = i18n
		slot5 = "common_activity_not_start"

		slot2(slot3, slot4(slot5))
	else
		slot3 = slot1
		slot2 = slot1.isValid
		slot2 = slot2(slot3)

		if not slot2 then
			slot2 = pg
			slot2 = slot2.TipsMgr
			slot2 = slot2.GetInstance
			slot2 = slot2()
			slot3 = slot2
			slot2 = slot2.ShowTips
			slot4 = i18n
			slot5 = "sham_team_limit"

			slot2(slot3, slot4(slot5))
		else
			slot2 = slot1.fleet
			slot3 = slot2
			slot2 = slot2.isValid
			slot2 = slot2(slot3)

			if not slot2 then
				slot2 = pg
				slot2 = slot2.TipsMgr
				slot2 = slot2.GetInstance
				slot2 = slot2()
				slot3 = slot2
				slot2 = slot2.ShowTips
				slot4 = i18n
				slot5 = "sham_formation_invalid"

				slot2(slot3, slot4(slot5))
			else
				slot2 = slot1.id

				if not slot2 then
					slot3 = ChapterConst
					slot3 = slot3.ActivateMirror

					if slot3 then
						slot3 = ChapterConst
						slot2 = slot3.MirrorShamId
					else
						slot2 = pg.sim_battle_template[slot1.simId] and pg.sim_battle_template[slot1.simId].sham_chapter_id
					end
				end

				if not slot2 then
					return
				end

				slot3 = slot1.active

				if slot3 then
					slot4 = slot0
					slot3 = slot0.save

					function slot5()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-12, warpins: 1 ---
						slot0 = slot0
						slot0 = slot0.fleet
						slot1 = slot0
						slot2 = slot1
						slot1 = slot1.getChapterCell
						slot3 = slot0.line
						slot3 = slot3.row
						slot4 = slot0.line
						slot4 = slot4.column
						slot1 = slot1(slot2, slot3, slot4)
						--- END OF BLOCK #0 ---

						slot2 = if slot1 then
						JUMP TO BLOCK #1
						else
						JUMP TO BLOCK #5
						end



						-- Decompilation error in this vicinity:
						--- BLOCK #1 13-17, warpins: 1 ---
						slot2 = slot1.attachment
						slot3 = ChapterConst
						slot3 = slot3.AttachRival
						--- END OF BLOCK #1 ---

						if slot2 == slot3 then
						JUMP TO BLOCK #5
						else
						JUMP TO BLOCK #3
						end



						-- Decompilation error in this vicinity:
						--- BLOCK #5 24-25, warpins: 3 ---
						--- END OF BLOCK #5 ---

						slot2 = if slot1.flag == 0 then
						JUMP TO BLOCK #6
						else
						JUMP TO BLOCK #7
						end



						-- Decompilation error in this vicinity:
						--- BLOCK #6 26-35, warpins: 1 ---
						slot3 = slot1
						slot4 = slot3
						slot3 = slot3.sendNotification
						slot5 = GAME
						slot5 = slot5.BEGIN_STAGE
						slot6 = {}
						slot7 = SYSTEM_SHAM
						slot6.system = slot7

						slot3(slot4, slot5, slot6)

						--- END OF BLOCK #6 ---

						UNCONDITIONAL JUMP; TARGET BLOCK #8



						-- Decompilation error in this vicinity:
						--- BLOCK #7 36-40, warpins: 1 ---
						slot3 = slot1
						slot4 = slot3
						slot3 = slot3.save

						function slot5()

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-8, warpins: 1 ---
							slot0 = slot0
							slot0 = slot0.viewComponent
							slot1 = slot0
							slot0 = slot0.emit
							slot2 = BaseUI
							slot2 = slot2.ON_CLOSE

							slot0(slot1, slot2)

							return
							--- END OF BLOCK #0 ---



						end

						slot3(slot4, slot5)

						--- END OF BLOCK #7 ---




						-- Decompilation error in this vicinity:
						--- BLOCK #8 41-41, warpins: 2 ---
						return
						--- END OF BLOCK #8 ---



					end

					slot3(slot4, slot5)
				else

					-- Decompilation error in this vicinity:
					--- BLOCK #15 80-96, warpins: 1 ---
					slot3 = _
					slot3 = slot3.keys
					slot5 = slot1
					slot4 = slot1.getRawShips
					slot3 = slot3(slot4(slot5))
					slot4 = slot1.fleet
					slot5 = slot4
					slot4 = slot4.getShipIds
					slot4 = slot4(slot5)
					slot5 = 0
					slot6 = 0
					slot8 = slot1
					slot7 = slot1.getFriendShip
					slot7 = slot7(slot8)

					if slot7 then

						-- Decompilation error in this vicinity:
						--- BLOCK #16 97-104, warpins: 1 ---
						slot8 = getProxy
						slot9 = PlayerProxy
						slot8 = slot8(slot9)
						slot9 = slot8.playerAssists
						slot10 = pairs
						slot11 = slot9
						slot10, slot11, slot12 = slot10(slot11)

						--- END OF BLOCK #16 ---

						FLOW; TARGET BLOCK #17



						-- Decompilation error in this vicinity:
						--- BLOCK #17 105-117, warpins: 0 ---
						for slot13, slot14 in slot10, slot11, slot12 do

							-- Decompilation error in this vicinity:
							--- BLOCK #0 105-107, warpins: 1 ---
							slot15 = slot14.ship
							--- END OF BLOCK #0 ---

							slot15 = if slot15 then
							JUMP TO BLOCK #1
							else
							JUMP TO BLOCK #4
							end



							-- Decompilation error in this vicinity:
							--- BLOCK #1 108-112, warpins: 1 ---
							slot15 = slot14.ship
							slot15 = slot15.id
							slot16 = slot7.id
							--- END OF BLOCK #1 ---

							if slot15 == slot16 then
							JUMP TO BLOCK #2
							else
							JUMP TO BLOCK #4
							end



							-- Decompilation error in this vicinity:
							--- BLOCK #2 113-115, warpins: 1 ---
							slot5 = slot13
							slot6 = slot7.id

							--- END OF BLOCK #2 ---

							FLOW; TARGET BLOCK #3



							-- Decompilation error in this vicinity:
							--- BLOCK #3 116-116, warpins: 1 ---
							break
							--- END OF BLOCK #3 ---

							FLOW; TARGET BLOCK #4



							-- Decompilation error in this vicinity:
							--- BLOCK #4 116-117, warpins: 3 ---
							--- END OF BLOCK #4 ---



						end
						--- END OF BLOCK #17 ---



					end

					--- END OF BLOCK #15 ---

					FLOW; TARGET BLOCK #18



					-- Decompilation error in this vicinity:
					--- BLOCK #18 118-121, warpins: 3 ---
					function slot8()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-18, warpins: 1 ---
						slot0 = slot0
						slot1 = slot0
						slot0 = slot0.sendNotification
						slot2 = GAME
						slot2 = slot2.SHAM_ENTER
						slot3 = {}
						slot4 = slot1
						slot3.id = slot4
						slot4 = slot2
						slot3.group_id_list = slot4
						slot4 = slot3
						slot3.formation_list = slot4
						slot4 = slot4
						slot3.friend_id = slot4
						slot4 = slot5
						slot3.friend_ship_id = slot4

						slot0(slot1, slot2, slot3)

						return
						--- END OF BLOCK #0 ---



					end

					slot9 = 0

					if slot5 > slot9 then

						-- Decompilation error in this vicinity:
						--- BLOCK #19 122-124, warpins: 1 ---
						slot9 = slot8

						slot9()
						--- END OF BLOCK #19 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #20 125-137, warpins: 1 ---
						slot9 = pg
						slot9 = slot9.MsgboxMgr
						slot9 = slot9.GetInstance
						slot9 = slot9()
						slot10 = slot9
						slot9 = slot9.ShowMsgBox
						slot11 = {
							hideNo = false
						}
						slot12 = i18n
						slot13 = "sham_friend_ship_tip"
						slot12 = slot12(slot13)
						slot11.content = slot12
						slot11.onYes = slot8

						slot9(slot10, slot11)
						--- END OF BLOCK #20 ---



					end
					--- END OF BLOCK #18 ---

					FLOW; TARGET BLOCK #21



					-- Decompilation error in this vicinity:
					--- BLOCK #21 138-138, warpins: 2 ---
					--- END OF BLOCK #21 ---



				end
			end
		end
	end
end

slot0.enter = slot1

function slot1(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot2 = slot0
	slot1 = slot0.sendNotification
	slot3 = GAME
	slot3 = slot3.SHAM_OP
	slot4 = {}
	slot5 = ChapterConst
	slot5 = slot5.OpRetreat
	slot4.type = slot5

	slot1(slot2, slot3, slot4)

	return
	--- END OF BLOCK #0 ---



end

slot0.reset = slot1

function slot1(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot4 = slot0.contextData
	slot4 = slot4.shamChapter
	slot5 = {
		inSham = false,
		inChapter = false,
		inAdmiral = false,
		inFleet = false,
		inClass = false,
		inEvent = false,
		inTactics = false,
		inBackyard = false
	}
	slot6 = nil

	function slot7()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0 = coroutine
		slot0 = slot0.status
		slot1 = slot0
		slot0 = slot0(slot1)
		--- END OF BLOCK #0 ---

		if slot0 == "suspended" then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-10, warpins: 1 ---
		slot0 = coroutine
		slot0 = slot0.resume
		slot1 = slot0
		slot0, slot1 = slot0(slot1)

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end

	slot8 = coroutine
	slot8 = slot8.create

	function slot9()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot0, slot1, slot2, slot3, slot4 = nil
		slot5 = slot0
		--- END OF BLOCK #0 ---

		if slot5 == 0 then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #7
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-14, warpins: 1 ---
		slot5 = slot1
		slot6 = slot5
		slot5 = slot5.getShips
		slot7 = true
		slot5 = slot5(slot6, slot7)
		slot0 = slot5
		slot5 = #slot0
		slot6 = 1
		slot7 = -1

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 15-38, warpins: 0 ---
		for slot8 = slot5, slot6, slot7 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-19, warpins: 2 ---
			slot9 = slot0[slot8]
			slot9 = slot9.hpRant
			slot10 = 0
			--- END OF BLOCK #0 ---

			if slot9 <= slot10 then
			JUMP TO BLOCK #1
			else
			JUMP TO BLOCK #2
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #1 20-25, warpins: 1 ---
			slot9 = table
			slot9 = slot9.remove
			slot10 = slot0
			slot11 = slot8

			slot9(slot10, slot11)

			--- END OF BLOCK #1 ---

			UNCONDITIONAL JUMP; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #2 26-34, warpins: 1 ---
			slot9 = slot1
			slot9 = slot9.fleet
			slot10 = slot9
			slot9 = slot9.containsShip
			slot11 = slot0[slot8]
			slot11 = slot11.id
			slot9 = slot9(slot10, slot11)
			--- END OF BLOCK #2 ---

			slot9 = if slot9 then
			JUMP TO BLOCK #3
			else
			JUMP TO BLOCK #4
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #3 35-37, warpins: 1 ---
			slot9 = slot0[slot8]
			slot10 = true
			slot9.shamInFleet = slot10
			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 38-38, warpins: 3 ---
			--- END OF BLOCK #4 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 39-41, warpins: 1 ---
		slot5 = slot2
		--- END OF BLOCK #3 ---

		slot5 = if slot5 then
		JUMP TO BLOCK #4
		else
		JUMP TO BLOCK #5
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #4 42-47, warpins: 1 ---
		slot5 = {}
		slot6 = slot2
		slot6 = slot6.id
		slot5[1] = slot6
		--- END OF BLOCK #4 ---

		slot1 = if not slot5 then
		JUMP TO BLOCK #5
		else
		JUMP TO BLOCK #6
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #5 48-48, warpins: 2 ---
		slot1 = {}
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 49-52, warpins: 2 ---
		slot2 = 1
		slot3 = 1
		slot4 = true
		--- END OF BLOCK #6 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #20



		-- Decompilation error in this vicinity:
		--- BLOCK #7 53-55, warpins: 1 ---
		slot5 = slot0
		--- END OF BLOCK #7 ---

		if slot5 == 1 then
		JUMP TO BLOCK #8
		else
		JUMP TO BLOCK #9
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #8 56-107, warpins: 1 ---
		slot5 = slot1
		slot6 = slot5
		slot5 = slot5.getShips
		slot5 = slot5(slot6)
		slot6 = _
		slot7 = slot5
		slot6 = slot6(slot7)
		slot7 = slot6
		slot6 = slot6.chain
		slot6 = slot6(slot7)
		slot7 = slot6
		slot6 = slot6.filter

		function slot8(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot2 = slot0
			slot1 = slot0.getTeamType
			slot1 = slot1(slot2)
			slot2 = slot0
			--- END OF BLOCK #0 ---

			if slot1 ~= slot2 then
			JUMP TO BLOCK #1
			else
			JUMP TO BLOCK #2
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #1 7-8, warpins: 1 ---
			slot1 = false
			--- END OF BLOCK #1 ---

			UNCONDITIONAL JUMP; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #2 9-9, warpins: 1 ---
			slot1 = true

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 10-10, warpins: 2 ---
			return slot1
			--- END OF BLOCK #3 ---



		end

		slot6 = slot6(slot7, slot8)
		slot7 = slot6
		slot6 = slot6.map

		function slot8(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			slot1 = slot0.id

			return slot1
			--- END OF BLOCK #0 ---



		end

		slot6 = slot6(slot7, slot8)
		slot7 = slot6
		slot6 = slot6.value
		slot6 = slot6(slot7)
		slot1 = slot6
		slot2 = 0
		slot6 = math
		slot6 = slot6.min
		slot7 = ChapterConst
		slot7 = slot7.ShamShipLimit
		slot8 = #slot5
		slot9 = #slot1
		slot8 = slot8 - slot9
		slot7 = slot7 - slot8
		slot8 = ChapterConst
		slot8 = slot8.ShamTeamShipLimit
		slot6 = slot6(slot7, slot8)
		slot3 = slot6
		slot6 = getProxy
		slot7 = BayProxy
		slot6 = slot6(slot7)
		slot8 = slot6
		slot7 = slot6.getData
		slot7 = slot7(slot8)
		slot8 = _
		slot8 = slot8.filter
		slot9 = _
		slot9 = slot9.values
		slot10 = slot7
		slot9 = slot9(slot10)

		function slot10(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot2 = slot0
			slot1 = slot0.getTeamType
			slot1 = slot1(slot2)
			slot2 = slot0
			--- END OF BLOCK #0 ---

			if slot1 ~= slot2 then
			JUMP TO BLOCK #1
			else
			JUMP TO BLOCK #2
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #1 7-8, warpins: 1 ---
			slot1 = false
			--- END OF BLOCK #1 ---

			UNCONDITIONAL JUMP; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #2 9-9, warpins: 1 ---
			slot1 = true

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 10-10, warpins: 2 ---
			return slot1
			--- END OF BLOCK #3 ---



		end

		slot8 = slot8(slot9, slot10)
		slot0 = slot8
		slot4 = false
		--- END OF BLOCK #8 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #20



		-- Decompilation error in this vicinity:
		--- BLOCK #9 108-110, warpins: 1 ---
		slot5 = slot0
		--- END OF BLOCK #9 ---

		if slot5 == 2 then
		JUMP TO BLOCK #10
		else
		JUMP TO BLOCK #20
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #10 111-125, warpins: 1 ---
		slot5 = getProxy
		slot6 = FriendProxy
		slot5 = slot5(slot6)
		slot7 = slot5
		slot6 = slot5.getRawData
		slot6 = slot6(slot7)
		slot7 = getProxy
		slot8 = PlayerProxy
		slot7 = slot7(slot8)
		slot8 = slot7.playerAssists
		slot9 = {}
		slot10 = pairs
		slot11 = slot6
		slot10, slot11, slot12 = slot10(slot11)

		--- END OF BLOCK #10 ---

		FLOW; TARGET BLOCK #11



		-- Decompilation error in this vicinity:
		--- BLOCK #11 126-148, warpins: 0 ---
		for slot13, slot14 in slot10, slot11, slot12 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 126-128, warpins: 1 ---
			slot15 = slot8[slot13]
			--- END OF BLOCK #0 ---

			slot15 = if slot15 then
			JUMP TO BLOCK #1
			else
			JUMP TO BLOCK #2
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #1 129-141, warpins: 1 ---
			slot15 = pg
			slot15 = slot15.TimeMgr
			slot15 = slot15.GetInstance
			slot15 = slot15()
			slot16 = slot15
			slot15 = slot15.GetServerTime
			slot15 = slot15(slot16)
			slot16 = slot8[slot13]
			slot16 = slot16.timeStamp
			slot15 = slot15 - slot16
			slot16 = 60
			--- END OF BLOCK #1 ---

			if slot15 > slot16 then
			JUMP TO BLOCK #2
			else
			JUMP TO BLOCK #3
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #2 142-146, warpins: 2 ---
			slot15 = table
			slot15 = slot15.insert
			slot16 = slot9
			slot17 = slot13

			slot15(slot16, slot17)
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 147-148, warpins: 3 ---
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #11 ---

		FLOW; TARGET BLOCK #12



		-- Decompilation error in this vicinity:
		--- BLOCK #12 149-152, warpins: 1 ---
		slot10 = #slot9
		slot11 = 0
		--- END OF BLOCK #12 ---

		if slot10 > slot11 then
		JUMP TO BLOCK #13
		else
		JUMP TO BLOCK #14
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #13 153-168, warpins: 1 ---
		slot10 = slot4
		slot11 = slot10
		slot10 = slot10.sendNotification
		slot12 = GAME
		slot12 = slot12.REQ_PLAYER_ASSIST_SHIP
		slot13 = {}
		slot13.playerIds = slot9
		slot14 = Player
		slot14 = slot14.ASSISTS_TYPE_SHAM
		slot13.type = slot14
		slot14 = slot5
		slot13.callback = slot14

		slot10(slot11, slot12, slot13)

		slot10 = coroutine
		slot10 = slot10.yield

		slot10()

		--- END OF BLOCK #13 ---

		FLOW; TARGET BLOCK #14



		-- Decompilation error in this vicinity:
		--- BLOCK #14 169-173, warpins: 2 ---
		slot0 = {}
		slot10 = pairs
		slot11 = slot8
		slot10, slot11, slot12 = slot10(slot11)

		--- END OF BLOCK #14 ---

		FLOW; TARGET BLOCK #15



		-- Decompilation error in this vicinity:
		--- BLOCK #15 174-185, warpins: 0 ---
		for slot13, slot14 in slot10, slot11, slot12 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 174-176, warpins: 1 ---
			slot15 = slot6[slot13]
			--- END OF BLOCK #0 ---

			slot15 = if slot15 then
			JUMP TO BLOCK #1
			else
			JUMP TO BLOCK #2
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #1 177-183, warpins: 1 ---
			slot15 = slot14.ship
			slot15.playerId = slot13
			slot15 = table
			slot15 = slot15.insert
			slot16 = slot0
			slot17 = slot14.ship

			slot15(slot16, slot17)
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 184-185, warpins: 3 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #15 ---

		FLOW; TARGET BLOCK #16



		-- Decompilation error in this vicinity:
		--- BLOCK #16 186-191, warpins: 1 ---
		slot10 = slot1
		slot11 = slot10
		slot10 = slot10.getFriendShip
		slot10 = slot10(slot11)
		--- END OF BLOCK #16 ---

		slot10 = if slot10 then
		JUMP TO BLOCK #17
		else
		JUMP TO BLOCK #18
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #17 192-196, warpins: 1 ---
		slot11 = {}
		slot12 = slot10.id
		slot11[1] = slot12
		--- END OF BLOCK #17 ---

		slot1 = if not slot11 then
		JUMP TO BLOCK #18
		else
		JUMP TO BLOCK #19
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #18 197-197, warpins: 2 ---
		slot1 = {}
		--- END OF BLOCK #18 ---

		FLOW; TARGET BLOCK #19



		-- Decompilation error in this vicinity:
		--- BLOCK #19 198-200, warpins: 2 ---
		slot2 = 1
		slot3 = 1
		slot4 = true
		--- END OF BLOCK #19 ---

		FLOW; TARGET BLOCK #20



		-- Decompilation error in this vicinity:
		--- BLOCK #20 201-238, warpins: 4 ---
		slot5 = slot4
		slot6 = slot5
		slot5 = slot5.getDockCallbackFuncs
		slot7 = slot0
		slot8 = slot2
		slot9 = slot3
		slot5, slot6, slot7 = slot5(slot6, slot7, slot8, slot9)
		slot8 = slot4
		slot9 = slot8
		slot8 = slot8.sendNotification
		slot10 = GAME
		slot10 = slot10.GO_SCENE
		slot11 = SCENE
		slot11 = slot11.DOCKYARD
		slot12 = {}
		slot12.shipVOs = slot0
		slot12.selectedIds = slot1
		slot12.selectedMin = slot2
		slot12.selectedMax = slot3
		slot13 = i18n
		slot14 = "ship_formationMediator_leastLimit"
		slot13 = slot13(slot14)
		slot12.leastLimitMsg = slot13
		slot12.quitTeam = slot4
		slot13 = slot3
		slot12.teamFilter = slot13
		slot13 = i18n
		slot14 = "word_formation"
		slot13 = slot13(slot14)
		slot12.leftTopInfo = slot13
		slot12.onShip = slot5
		slot12.confirmSelect = slot6
		slot12.onSelected = slot7
		slot13 = slot6
		slot12.flags = slot13
		slot13 = slot0
		slot13 = slot13 == 2
		slot12.selectFriend = slot13

		slot8(slot9, slot10, slot11, slot12)

		return

		--- END OF BLOCK #20 ---

		FLOW; TARGET BLOCK #23



		-- Decompilation error in this vicinity:
		--- BLOCK #21 239-240, warpins: 1 ---
		slot13 = false
		--- END OF BLOCK #21 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #23



		-- Decompilation error in this vicinity:
		--- BLOCK #22 241-241, warpins: 1 ---
		slot13 = true
		--- END OF BLOCK #22 ---

		FLOW; TARGET BLOCK #23



		-- Decompilation error in this vicinity:
		--- BLOCK #23 242-244, warpins: 2 ---
		--- END OF BLOCK #23 ---



	end

	slot8 = slot8(slot9)
	slot6 = slot8
	slot8 = slot7

	slot8()

	return
	--- END OF BLOCK #0 ---



end

slot0.openDockYard = slot1

function slot1(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot4 = slot0.contextData
	slot4 = slot4.shamChapter
	slot5 = slot4.fleet

	function slot6(slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot3 = slot0
		--- END OF BLOCK #0 ---

		if slot3 == 0 then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #6
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 4-11, warpins: 1 ---
		slot3 = slot1
		slot3 = slot3.fleet
		slot5 = slot3
		slot4 = slot3.containsShip
		slot6 = slot0.id
		slot4 = slot4(slot5, slot6)
		--- END OF BLOCK #1 ---

		slot4 = if not slot4 then
		JUMP TO BLOCK #2
		else
		JUMP TO BLOCK #15
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #2 12-17, warpins: 1 ---
		slot5 = slot3
		slot4 = slot3.containsSameKind
		slot6 = slot0
		slot4 = slot4(slot5, slot6)
		--- END OF BLOCK #2 ---

		slot4 = if slot4 then
		JUMP TO BLOCK #3
		else
		JUMP TO BLOCK #15
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #3 18-20, warpins: 1 ---
		slot4 = slot2
		--- END OF BLOCK #3 ---

		slot4 = if slot4 then
		JUMP TO BLOCK #4
		else
		JUMP TO BLOCK #5
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #4 21-27, warpins: 1 ---
		slot4 = slot2
		slot5 = slot4
		slot4 = slot4.isSameKind
		slot6 = slot0
		slot4 = slot4(slot5, slot6)
		--- END OF BLOCK #4 ---

		slot4 = if not slot4 then
		JUMP TO BLOCK #5
		else
		JUMP TO BLOCK #15
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #5 28-33, warpins: 2 ---
		slot4 = false
		slot5 = i18n
		slot6 = "event_same_type_not_allowed"

		return slot4, slot5(slot6)

		--- END OF BLOCK #5 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #15



		-- Decompilation error in this vicinity:
		--- BLOCK #6 34-36, warpins: 1 ---
		slot3 = slot0
		--- END OF BLOCK #6 ---

		if slot3 == 1 then
		JUMP TO BLOCK #7
		else
		JUMP TO BLOCK #12
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #7 37-41, warpins: 1 ---
		slot3 = slot0.level
		slot4 = ChapterConst
		slot4 = slot4.ShamShipLevelLimit
		--- END OF BLOCK #7 ---

		if slot3 < slot4 then
		JUMP TO BLOCK #8
		else
		JUMP TO BLOCK #9
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #8 42-48, warpins: 1 ---
		slot3 = false
		slot4 = i18n
		slot5 = "sham_ship_level_limit"
		slot6 = ChapterConst
		slot6 = slot6.ShamShipLevelLimit

		return slot3, slot4(slot5, slot6)

		--- END OF BLOCK #8 ---

		FLOW; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #9 49-55, warpins: 2 ---
		slot3 = getProxy
		slot4 = BayProxy
		slot3 = slot3(slot4)
		slot4 = ipairs
		slot5 = slot2
		slot4, slot5, slot6 = slot4(slot5)

		--- END OF BLOCK #9 ---

		FLOW; TARGET BLOCK #10



		-- Decompilation error in this vicinity:
		--- BLOCK #10 56-74, warpins: 0 ---
		for slot7, slot8 in slot4, slot5, slot6 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 56-61, warpins: 1 ---
			slot10 = slot3
			slot9 = slot3.getShipById
			slot11 = slot8
			slot9 = slot9(slot10, slot11)
			--- END OF BLOCK #0 ---

			slot9 = if slot9 then
			JUMP TO BLOCK #1
			else
			JUMP TO BLOCK #3
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #1 62-67, warpins: 1 ---
			slot11 = slot0
			slot10 = slot0.isSameKind
			slot12 = slot9
			slot10 = slot10(slot11, slot12)
			--- END OF BLOCK #1 ---

			slot10 = if slot10 then
			JUMP TO BLOCK #2
			else
			JUMP TO BLOCK #3
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #2 68-72, warpins: 1 ---
			slot10 = false
			slot11 = i18n
			slot12 = "event_same_type_not_allowed"

			return slot10, slot11(slot12)
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 73-74, warpins: 4 ---
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #10 ---

		FLOW; TARGET BLOCK #11



		-- Decompilation error in this vicinity:
		--- BLOCK #11 75-75, warpins: 1 ---
		--- END OF BLOCK #11 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #15



		-- Decompilation error in this vicinity:
		--- BLOCK #12 76-78, warpins: 1 ---
		slot3 = slot0
		--- END OF BLOCK #12 ---

		if slot3 == 2 then
		JUMP TO BLOCK #13
		else
		JUMP TO BLOCK #15
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #13 79-83, warpins: 1 ---
		slot3 = slot0.level
		slot4 = ChapterConst
		slot4 = slot4.ShamShipLevelLimit
		--- END OF BLOCK #13 ---

		if slot3 < slot4 then
		JUMP TO BLOCK #14
		else
		JUMP TO BLOCK #15
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #14 84-90, warpins: 1 ---
		slot3 = false
		slot4 = i18n
		slot5 = "sham_ship_level_limit"
		slot6 = ChapterConst
		slot6 = slot6.ShamShipLevelLimit

		return slot3, slot4(slot5, slot6)

		--- END OF BLOCK #14 ---

		FLOW; TARGET BLOCK #15



		-- Decompilation error in this vicinity:
		--- BLOCK #15 91-92, warpins: 8 ---
		slot3 = true

		return slot3
		--- END OF BLOCK #15 ---



	end

	function slot7(slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot3 = slot1

		slot3()

		return
		--- END OF BLOCK #0 ---



	end

	function slot8(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot1 = getProxy
		slot2 = BayProxy
		slot1 = slot1(slot2)
		slot2 = slot0
		--- END OF BLOCK #0 ---

		if slot2 == 0 then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #16
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-13, warpins: 1 ---
		slot2 = nil
		slot3 = slot1
		slot4 = slot3
		slot3 = slot3.getFriendShip
		slot3 = slot3(slot4)
		--- END OF BLOCK #1 ---

		slot3 = if slot3 then
		JUMP TO BLOCK #2
		else
		JUMP TO BLOCK #4
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #2 14-17, warpins: 1 ---
		slot4 = slot3.id
		slot5 = slot0[1]
		--- END OF BLOCK #2 ---

		if slot4 == slot5 then
		JUMP TO BLOCK #3
		else
		JUMP TO BLOCK #4
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #3 18-19, warpins: 1 ---
		slot2 = slot3
		--- END OF BLOCK #3 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #4 20-25, warpins: 2 ---
		slot4 = slot1
		slot5 = slot4
		slot4 = slot4.getShip
		slot6 = slot0[1]
		slot4 = slot4(slot5, slot6)
		slot2 = slot4
		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 26-27, warpins: 2 ---
		--- END OF BLOCK #5 ---

		slot2 = if not slot2 then
		JUMP TO BLOCK #6
		else
		JUMP TO BLOCK #11
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #6 28-30, warpins: 1 ---
		slot4 = slot2
		--- END OF BLOCK #6 ---

		slot4 = if slot4 then
		JUMP TO BLOCK #7
		else
		JUMP TO BLOCK #28
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #7 31-38, warpins: 1 ---
		slot4 = slot2
		slot5 = slot4
		slot4 = slot4.getTeamType
		slot4 = slot4(slot5)
		slot5 = slot1
		slot5 = slot5.active
		--- END OF BLOCK #7 ---

		slot5 = if slot5 then
		JUMP TO BLOCK #8
		else
		JUMP TO BLOCK #10
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #8 39-43, warpins: 1 ---
		slot5 = slot3
		slot5 = slot5[slot4]
		slot5 = #slot5
		--- END OF BLOCK #8 ---

		if slot5 == 1 then
		JUMP TO BLOCK #9
		else
		JUMP TO BLOCK #10
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #9 44-62, warpins: 1 ---
		slot5 = pg
		slot5 = slot5.TipsMgr
		slot5 = slot5.GetInstance
		slot5 = slot5()
		slot6 = slot5
		slot5 = slot5.ShowTips
		slot7 = i18n
		slot8 = "ship_formationUI_removeError_onlyShip"
		slot9 = slot2
		slot10 = slot9
		slot9 = slot9.getName
		slot9 = slot9(slot10)
		slot10 = ""
		slot11 = Fleet
		slot11 = slot11.C_TEAM_NAME
		slot11 = slot11[slot4]

		slot5(slot6, slot7(slot8, slot9, slot10, slot11))

		--- END OF BLOCK #9 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #28



		-- Decompilation error in this vicinity:
		--- BLOCK #10 63-69, warpins: 2 ---
		slot5 = slot3
		slot6 = slot5
		slot5 = slot5.removeShip
		slot7 = slot2
		slot7 = slot7.id

		slot5(slot6, slot7)

		--- END OF BLOCK #10 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #28



		-- Decompilation error in this vicinity:
		--- BLOCK #11 70-72, warpins: 1 ---
		slot4 = slot2
		--- END OF BLOCK #11 ---

		slot4 = if slot4 then
		JUMP TO BLOCK #12
		else
		JUMP TO BLOCK #15
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #12 73-79, warpins: 1 ---
		slot4 = slot3
		slot5 = slot4
		slot4 = slot4.containsShip
		slot6 = slot2.id
		slot4 = slot4(slot5, slot6)
		--- END OF BLOCK #12 ---

		slot4 = if slot4 then
		JUMP TO BLOCK #13
		else
		JUMP TO BLOCK #14
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #13 80-87, warpins: 1 ---
		slot4 = slot3
		slot5 = slot4
		slot4 = slot4.switchShip
		slot6 = slot2
		slot6 = slot6.id
		slot7 = slot2.id

		slot4(slot5, slot6, slot7)

		--- END OF BLOCK #13 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #28



		-- Decompilation error in this vicinity:
		--- BLOCK #14 88-101, warpins: 1 ---
		slot4 = slot3
		slot5 = slot4
		slot4 = slot4.replaceShip
		slot6 = slot2
		slot6 = slot6.id
		slot7 = {}
		slot8 = slot2.id
		slot7.id = slot8
		slot8 = slot2.hpRant
		slot7.hp_rant = slot8
		slot8 = slot2.strategies
		slot7.strategies = slot8

		slot4(slot5, slot6, slot7)

		--- END OF BLOCK #14 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #28



		-- Decompilation error in this vicinity:
		--- BLOCK #15 102-113, warpins: 1 ---
		slot4 = slot3
		slot5 = slot4
		slot4 = slot4.addShip
		slot6 = {}
		slot7 = slot2.id
		slot6.id = slot7
		slot7 = slot2.hpRant
		slot6.hp_rant = slot7
		slot7 = slot2.strategies
		slot6.strategies = slot7

		slot4(slot5, slot6)

		--- END OF BLOCK #15 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #28



		-- Decompilation error in this vicinity:
		--- BLOCK #16 114-116, warpins: 1 ---
		slot2 = slot0
		--- END OF BLOCK #16 ---

		if slot2 == 1 then
		JUMP TO BLOCK #17
		else
		JUMP TO BLOCK #19
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #17 117-120, warpins: 1 ---
		slot2 = slot1
		slot2 = slot2.active
		--- END OF BLOCK #17 ---

		slot2 = if not slot2 then
		JUMP TO BLOCK #18
		else
		JUMP TO BLOCK #28
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #18 121-143, warpins: 1 ---
		slot2 = {}
		slot3 = _
		slot3 = slot3.each
		slot4 = slot0

		function slot5(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot1 = slot0
			slot2 = {
				hp_rant = 10000
			}
			slot2.id = slot0
			slot3 = {}
			slot2.strategies = slot3
			slot1[slot0] = slot2

			return
			--- END OF BLOCK #0 ---



		end

		slot3(slot4, slot5)

		slot3 = slot1
		slot4 = slot3
		slot3 = slot3.updateRawShipsByTeam
		slot5 = slot2
		slot6 = slot4

		slot3(slot4, slot5, slot6)

		slot3 = _
		slot3 = slot3.each
		slot4 = _
		slot4 = slot4.keys
		slot5 = slot3
		slot5 = slot5.ships
		slot4 = slot4(slot5)

		function slot5(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.containsShip
			slot3 = slot0
			slot1 = slot1(slot2, slot3)
			--- END OF BLOCK #0 ---

			slot1 = if not slot1 then
			JUMP TO BLOCK #1
			else
			JUMP TO BLOCK #2
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #1 8-12, warpins: 1 ---
			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.removeShip
			slot3 = slot0

			slot1(slot2, slot3)

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 13-13, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end

		slot3(slot4, slot5)

		--- END OF BLOCK #18 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #28



		-- Decompilation error in this vicinity:
		--- BLOCK #19 144-146, warpins: 1 ---
		slot2 = slot0
		--- END OF BLOCK #19 ---

		if slot2 == 2 then
		JUMP TO BLOCK #20
		else
		JUMP TO BLOCK #28
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #20 147-150, warpins: 1 ---
		slot2 = slot1
		slot2 = slot2.active
		--- END OF BLOCK #20 ---

		slot2 = if not slot2 then
		JUMP TO BLOCK #21
		else
		JUMP TO BLOCK #28
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #21 151-162, warpins: 1 ---
		slot2 = slot1
		slot3 = slot2
		slot2 = slot2.getFriendShip
		slot2, slot3 = slot2(slot3)
		slot4 = getProxy
		slot5 = PlayerProxy
		slot4 = slot4(slot5)
		slot5 = slot4.playerAssists
		slot6 = pairs
		slot7 = slot5
		slot6, slot7, slot8 = slot6(slot7)

		--- END OF BLOCK #21 ---

		FLOW; TARGET BLOCK #22



		-- Decompilation error in this vicinity:
		--- BLOCK #22 163-181, warpins: 0 ---
		for slot9, slot10 in slot6, slot7, slot8 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 163-165, warpins: 1 ---
			slot11 = slot10.ship
			--- END OF BLOCK #0 ---

			slot11 = if slot11 then
			JUMP TO BLOCK #1
			else
			JUMP TO BLOCK #4
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #1 166-170, warpins: 1 ---
			slot11 = slot10.ship
			slot11 = slot11.id
			slot12 = slot0[1]
			--- END OF BLOCK #1 ---

			if slot11 == slot12 then
			JUMP TO BLOCK #2
			else
			JUMP TO BLOCK #4
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #2 171-179, warpins: 1 ---
			slot11 = Clone
			slot12 = slot10.ship
			slot11 = slot11(slot12)
			slot3 = slot11
			slot11 = 10000
			slot3.hpRant = slot11
			slot11 = {}
			slot3.strategies = slot11

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 180-180, warpins: 1 ---
			break
			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 180-181, warpins: 3 ---
			--- END OF BLOCK #4 ---



		end

		--- END OF BLOCK #22 ---

		FLOW; TARGET BLOCK #23



		-- Decompilation error in this vicinity:
		--- BLOCK #23 182-188, warpins: 2 ---
		slot6 = slot1
		slot7 = slot6
		slot6 = slot6.updateFriendShip
		slot8 = slot3

		slot6(slot7, slot8)

		--- END OF BLOCK #23 ---

		slot2 = if slot2 then
		JUMP TO BLOCK #24
		else
		JUMP TO BLOCK #28
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #24 189-195, warpins: 1 ---
		slot6 = slot3
		slot7 = slot6
		slot6 = slot6.containsShip
		slot8 = slot2.id
		slot6 = slot6(slot7, slot8)
		--- END OF BLOCK #24 ---

		slot6 = if slot6 then
		JUMP TO BLOCK #25
		else
		JUMP TO BLOCK #28
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #25 196-197, warpins: 1 ---
		--- END OF BLOCK #25 ---

		slot3 = if slot3 then
		JUMP TO BLOCK #26
		else
		JUMP TO BLOCK #27
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #26 198-210, warpins: 1 ---
		slot6 = slot3
		slot7 = slot6
		slot6 = slot6.replaceShip
		slot8 = slot2.id
		slot9 = {}
		slot10 = slot3.id
		slot9.id = slot10
		slot10 = slot3.hpRant
		slot9.hp_rant = slot10
		slot10 = slot3.strategies
		slot9.strategies = slot10

		slot6(slot7, slot8, slot9)

		--- END OF BLOCK #26 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #28



		-- Decompilation error in this vicinity:
		--- BLOCK #27 211-215, warpins: 1 ---
		slot6 = slot3
		slot7 = slot6
		slot6 = slot6.removeShip
		slot8 = slot2.id

		slot6(slot7, slot8)

		--- END OF BLOCK #27 ---

		FLOW; TARGET BLOCK #28



		-- Decompilation error in this vicinity:
		--- BLOCK #28 216-216, warpins: 14 ---
		return
		--- END OF BLOCK #28 ---



	end

	slot9 = slot6
	slot10 = slot7
	slot11 = slot8

	return slot9, slot10, slot11
	--- END OF BLOCK #0 ---



end

slot0.getDockCallbackFuncs = slot1

return slot0
