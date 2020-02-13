slot0 = class
slot1 = "PockySkinPage"
slot2 = import
slot3 = "view.base.BaseActivityPage"
slot0 = slot0(slot1, slot2(slot3))

function slot1()
	slot0 = pg
	slot0 = slot0.TimeMgr
	slot0 = slot0.GetInstance
	slot0 = slot0()
	slot1 = slot0
	slot0 = slot0.GetServerTime
	slot0 = slot0(slot1)
	slot1 = pg
	slot1 = slot1.TimeMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.STimeDescS
	slot3 = slot0
	slot4 = "*t"
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1.yday

	return slot2
end

slot0.GetCurrentDay = slot1

function slot1(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.leftStage = slot0.bg:Find("left")
	slot0.rightStage = slot0.bg:Find("right")
	slot0.taskDesc = slot0.leftStage:Find("task")
	slot0.signDesc = slot0.leftStage:Find("signin")
	slot0.spine = nil
	slot0.spineLRQ = GetSpineRequestPackage.New("beierfasite_4", function (slot0)
		SetParent(slot0, slot0.leftStage:Find("ship"))

		slot0.spine = slot0
		slot0.spine.transform.localScale = Vector3.one

		slot0:SetAction("stand")

		slot0.spineLRQ = nil
	end):Start()
	slot0.startDay = PlayerPrefs.GetInt("PockySkinSignDay" .. (getProxy(PlayerProxy):getRawData().id or "-1"), 0)
	slot0.usmLRQ = nil
end

slot0.OnInit = slot1

function slot1(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	slot1 = getProxy
	slot2 = ActivityProxy
	slot1 = slot1(slot2)
	slot2 = slot0.activity
	slot3 = slot2
	slot2 = slot2.getConfig
	slot4 = "config_client"
	slot2 = slot2(slot3, slot4)
	slot2 = slot2.linkids
	slot3 = false
	slot4 = slot0.activity
	slot0.ActSignIn = slot4
	slot4 = getProxy
	slot5 = TaskProxy
	slot4 = slot4(slot5)
	slot0.taskProxy = slot4
	slot4 = slot0.ActSignIn

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-29, warpins: 1 ---
		slot4 = 0
		slot0.nday = slot4
		slot4 = slot0.ActSignIn
		slot5 = slot4
		slot4 = slot4.getConfig
		slot6 = "config_data"
		slot4 = slot4(slot5, slot6)
		slot0.taskGroup = slot4

		if not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-33, warpins: 1 ---
			slot4 = updateActivityTaskStatus
			slot5 = slot0.ActSignIn
			slot4 = slot4(slot5)
			slot3 = slot4
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 34-41, warpins: 3 ---
	slot5 = slot1
	slot4 = slot1.getActivityById
	slot6 = slot2[1]
	slot4 = slot4(slot5, slot6)
	slot0.ActPT = slot4
	slot4 = slot0.ActPT

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 42-44, warpins: 1 ---
		slot4 = slot0.ptData

		if slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 45-50, warpins: 1 ---
			slot4 = slot0.ptData
			slot5 = slot4
			slot4 = slot4.Update
			slot6 = slot0.ActPT

			slot4(slot5, slot6)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 51-55, warpins: 1 ---
			slot4 = ActivityPtData
			slot4 = slot4.New
			slot5 = slot0.ActPT
			slot4 = slot4(slot5)
			slot0.ptData = slot4
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 56-63, warpins: 3 ---
	slot5 = slot1
	slot4 = slot1.getActivityById
	slot6 = slot2[2]
	slot4 = slot4(slot5, slot6)
	slot0.ActTaskList = slot4
	slot4 = slot0.ActTaskList

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 64-73, warpins: 1 ---
		slot4 = 0
		slot0.nday2 = slot4
		slot4 = slot0.ActTaskList
		slot5 = slot4
		slot4 = slot4.getConfig
		slot6 = "config_data"
		slot4 = slot4(slot5, slot6)
		slot0.taskGroup2 = slot4

		if not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 74-77, warpins: 1 ---
			slot4 = updateActivityTaskStatus
			slot5 = slot0.ActTaskList
			slot4 = slot4(slot5)
			slot3 = slot4
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 78-85, warpins: 3 ---
	slot5 = slot1
	slot4 = slot1.getActivityById
	slot6 = slot2[3]
	slot4 = slot4(slot5, slot6)
	slot0.ActFinal = slot4
	slot4 = slot0.ActFinal

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 86-95, warpins: 1 ---
		slot4 = 0
		slot0.nday3 = slot4
		slot4 = slot0.ActFinal
		slot5 = slot4
		slot4 = slot4.getConfig
		slot6 = "config_data"
		slot4 = slot4(slot5, slot6)
		slot0.taskGroup3 = slot4

		if not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 96-99, warpins: 1 ---
			slot4 = updateActivityTaskStatus
			slot5 = slot0.ActFinal
			slot4 = slot4(slot5)
			slot3 = slot4
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 100-100, warpins: 3 ---
	return slot3
	--- END OF BLOCK #4 ---



end

slot0.OnDataSetting = slot1

function slot1(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-42, warpins: 1 ---
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.rightStage
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "display_btn"
	slot3 = slot3(slot4, slot5)

	function slot4()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-33, warpins: 1 ---
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityMediator
		slot2 = slot2.SHOW_AWARD_WINDOW
		slot3 = PtAwardWindow
		slot4 = {}
		slot5 = slot0
		slot5 = slot5.ptData
		slot5 = slot5.type
		slot4.type = slot5
		slot5 = slot0
		slot5 = slot5.ptData
		slot5 = slot5.dropList
		slot4.dropList = slot5
		slot5 = slot0
		slot5 = slot5.ptData
		slot5 = slot5.targets
		slot4.targets = slot5
		slot5 = slot0
		slot5 = slot5.ptData
		slot5 = slot5.level
		slot4.level = slot5
		slot5 = slot0
		slot5 = slot5.ptData
		slot5 = slot5.count
		slot4.count = slot5
		slot5 = slot0
		slot5 = slot5.ptData
		slot5 = slot5.resId
		slot4.resId = slot5

		slot0(slot1, slot2, slot3, slot4)

		return
		--- END OF BLOCK #0 ---



	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.rightStage
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "battle_btn"
	slot3 = slot3(slot4, slot5)

	function slot4()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityMediator
		slot2 = slot2.SPECIAL_BATTLE_OPERA

		slot0(slot1, slot2)

		return
		--- END OF BLOCK #0 ---



	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.rightStage
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "get_btn"
	slot3 = slot3(slot4, slot5)

	function slot4()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-20, warpins: 1 ---
		slot0 = slot0
		slot0 = slot0.ptData
		slot1 = slot0
		slot0 = slot0.GetResProgress
		slot0, slot1 = slot0(slot1)
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.emit
		slot4 = ActivityMediator
		slot4 = slot4.EVENT_PT_OPERATION
		slot5 = {
			cmd = 1
		}
		slot6 = slot0
		slot6 = slot6.ptData
		slot7 = slot6
		slot6 = slot6.GetId
		slot6 = slot6(slot7)
		slot5.activity_id = slot6
		slot5.arg1 = slot1

		slot2(slot3, slot4, slot5)

		return
		--- END OF BLOCK #0 ---



	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.bg
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "help"
	slot3 = slot3(slot4, slot5)

	function slot4()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		slot0 = pg
		slot0 = slot0.MsgboxMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.ShowMsgBox
		slot2 = {}
		slot3 = MSGBOX_TYPE_HELP
		slot2.type = slot3
		slot3 = pg
		slot3 = slot3.gametip
		slot3 = slot3.pocky_help
		slot3 = slot3.tip
		slot2.helps = slot3

		slot0(slot1, slot2)

		return
		--- END OF BLOCK #0 ---



	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	return
	--- END OF BLOCK #0 ---



end

slot0.OnFirstFlush = slot1

function slot1(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = slot0.spine

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-11, warpins: 2 ---
	slot2 = slot0.spine
	slot3 = slot2
	slot2 = slot2.GetComponent
	slot4 = "SpineAnimUI"
	slot2 = slot2(slot3, slot4)

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-16, warpins: 1 ---
		slot4 = slot2
		slot3 = slot2.SetAction
		slot5 = slot1
		slot6 = 0

		slot3(slot4, slot5, slot6)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-17, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.SetAction = slot1

function slot1(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot0:UpdateTaskList()
	slot0:UpdatePTList()

	slot2 = "ui"
	slot3 = (slot0.startDay < slot0.GetCurrentDay() and "juu_factory_rest") or "juu_factory"
	slot4 = slot0.usmLRQ

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-17, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 21-23, warpins: 2 ---
	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-27, warpins: 1 ---
		slot4 = slot0.usmLRQ
		slot4 = slot4.name

		if slot4 ~= slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-33, warpins: 1 ---
			slot4 = slot0.usmLRQ
			slot5 = slot4
			slot4 = slot4.Stop

			slot4(slot5)

			slot4 = nil
			slot0.usmLRQ = slot4
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 34-36, warpins: 3 ---
	slot4 = slot0.usmName

	if slot4 ~= slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-50, warpins: 1 ---
		slot4 = LoadPrefabRequestPackage
		slot4 = slot4.New
		slot5 = slot2
		slot6 = "/"
		slot7 = slot3
		slot5 = slot5 .. slot6 .. slot7
		slot6 = slot3

		function slot7(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot1 = IsNil
			slot2 = slot0
			slot2 = slot2.usm
			slot1 = slot1(slot2)

			if not slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-10, warpins: 1 ---
				slot1 = Destroy
				slot2 = slot0
				slot2 = slot2.usm

				slot1(slot2)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-22, warpins: 2 ---
			slot1 = slot0
			slot1.usm = slot0
			slot1 = setParent
			slot2 = slot0
			slot3 = slot0
			slot3 = slot3.bg
			slot4 = slot3
			slot3 = slot3.Find
			slot5 = "usm"

			slot1(slot2, slot3(slot4, slot5))

			return
			--- END OF BLOCK #1 ---



		end

		slot4 = slot4(slot5, slot6, slot7)
		slot5 = slot4
		slot4 = slot4.Start
		slot4 = slot4(slot5)
		slot0.usmLRQ = slot4
		slot0.usmName = slot3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 51-52, warpins: 2 ---
	return
	--- END OF BLOCK #4 ---



end

slot0.OnUpdateFlush = slot1

function slot1(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot0.nday = slot0.ActSignIn.data3 or 0
	slot0.nday2 = slot0.ActTaskList.data3 or 0
	slot0.nday3 = slot0.ActFinal.data3 or 0
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-10, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-16, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 18-33, warpins: 2 ---
	slot1 = slot0.ActSignIn
	slot2 = slot1
	slot1 = slot1.getConfig
	slot3 = "config_client"
	slot1 = slot1(slot2, slot3)
	slot1 = slot1.story
	slot2 = checkExist
	slot3 = slot1
	slot4 = {}
	slot5 = slot0.nday
	slot4[1] = slot5
	slot5 = {
		1
	}
	slot2 = slot2(slot3, slot4, slot5)

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-45, warpins: 1 ---
		slot2 = pg
		slot2 = slot2.StoryMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot4 = slot2
		slot3 = slot2.IsPlayed
		slot5 = slot0.nday
		slot5 = slot1[slot5]
		slot5 = slot5[1]
		slot3 = slot3(slot4, slot5)

		if not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-51, warpins: 1 ---
			slot4 = slot2
			slot3 = slot2.Play
			slot5 = slot0.nday
			slot5 = slot1[slot5]
			slot5 = slot5[1]

			slot3(slot4, slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 52-120, warpins: 3 ---
	slot2 = slot0.leftStage
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "go_btn"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0.leftStage
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "get_btn"
	slot3 = slot3(slot4, slot5)
	slot4 = slot0.leftStage
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = "sign_btn"
	slot4 = slot4(slot5, slot6)
	slot5 = slot0.leftStage
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = "got_btn"
	slot5 = slot5(slot6, slot7)
	slot6 = slot0.leftStage
	slot7 = slot6
	slot6 = slot6.Find
	slot8 = "award"
	slot6 = slot6(slot7, slot8)
	slot7 = slot0.leftStage
	slot8 = slot7
	slot7 = slot7.Find
	slot9 = "slider"
	slot7 = slot7(slot8, slot9)
	slot8 = getProxy
	slot9 = TaskProxy
	slot8 = slot8(slot9)
	slot9 = slot0.taskGroup
	slot10 = slot0.nday
	slot9 = slot9[slot10]
	slot9 = slot9[1]
	slot10 = slot0.taskGroup2
	slot11 = slot0.nday2
	slot10 = slot10[slot11]
	slot10 = slot10[1]
	slot11 = slot0.taskGroup3
	slot12 = slot0.nday3
	slot11 = slot11[slot12]
	slot11 = slot11[1]
	slot13 = slot8
	slot12 = slot8.getTaskVO
	slot14 = slot9
	slot12 = slot12(slot13, slot14)
	slot14 = slot8
	slot13 = slot8.getTaskVO
	slot15 = slot10
	slot13 = slot13(slot14, slot15)
	slot15 = slot8
	slot14 = slot8.getTaskVO
	slot16 = slot11
	slot14 = slot14(slot15, slot16)
	slot16 = slot12
	slot15 = slot12.getTaskStatus
	slot15 = slot15(slot16)
	slot17 = slot13
	slot16 = slot13.getTaskStatus
	slot16 = slot16(slot17)
	slot18 = slot14
	slot17 = slot14.getTaskStatus
	slot17 = slot17(slot18)
	slot18 = slot0.startTaskid

	if not slot18 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 121-122, warpins: 1 ---
		slot0.startTaskid = slot9
		slot0.startStatus = slot15
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 123-126, warpins: 2 ---
	slot18 = false
	slot19 = slot0.startTaskid

	if slot19 ~= slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 127-130, warpins: 1 ---
		slot0.startTaskid = slot9
		slot0.startStatus = slot15
		slot18 = true
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 131-133, warpins: 1 ---
		slot19 = slot0.startStatus

		if slot19 ~= slot15 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 134-135, warpins: 1 ---
			slot0.startStatus = slot15
			slot18 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 136-139, warpins: 3 ---
	slot19 = slot0.GetCurrentDay
	slot19 = slot19()

	if slot18 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 140-142, warpins: 1 ---
		slot20 = slot0.startDay

		if slot20 < slot19 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 143-155, warpins: 1 ---
			slot0.startDay = slot19

			PlayerPrefs.SetInt("PockySkinSignDay" .. (getProxy(PlayerProxy):getRawData().id or "-1"), slot0.startDay)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 157-159, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 160-161, warpins: 3 ---
	if slot17 == 2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 162-224, warpins: 1 ---
		slot20 = setActive
		slot21 = slot6
		slot22 = false

		slot20(slot21, slot22)

		slot20 = setActive
		slot21 = slot7
		slot22 = false

		slot20(slot21, slot22)

		slot20 = setActive
		slot21 = slot0.taskDesc
		slot22 = false

		slot20(slot21, slot22)

		slot20 = setActive
		slot21 = slot0.signDesc
		slot22 = true

		slot20(slot21, slot22)

		slot20 = setText
		slot21 = slot0.signDesc
		slot22 = slot21
		slot21 = slot21.Find
		slot23 = "title"
		slot21 = slot21(slot22, slot23)
		slot22 = i18n
		slot23 = "pocky_jiujiu"

		slot20(slot21, slot22(slot23))

		slot20 = setText
		slot21 = slot0.signDesc
		slot22 = slot21
		slot21 = slot21.Find
		slot23 = "desc"
		slot21 = slot21(slot22, slot23)
		slot22 = i18n
		slot23 = "pocky_jiujiu_desc"

		slot20(slot21, slot22(slot23))

		slot20 = setActive
		slot21 = slot2
		slot22 = false

		slot20(slot21, slot22)

		slot20 = setActive
		slot21 = slot4
		slot22 = true

		slot20(slot21, slot22)

		slot20 = setActive
		slot21 = slot3
		slot22 = false

		slot20(slot21, slot22)

		slot20 = setActive
		slot21 = slot5
		slot22 = false

		slot20(slot21, slot22)

		slot20 = onButton
		slot21 = slot0
		slot22 = slot4

		function slot23()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot0 = slot0
			slot0 = slot0.GetCurrentDay
			slot0 = slot0()
			slot1 = slot0
			slot1 = slot1.startDay

			if slot1 < slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-21, warpins: 1 ---
				slot0.startDay = slot0

				PlayerPrefs.SetInt("PockySkinSignDay" .. (getProxy(PlayerProxy):getRawData().id or "-1"), slot0.startDay)
				slot0:OnUpdateFlush()
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 23-30, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 31-31, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end

		slot24 = SFX_PANEL

		slot20(slot21, slot22, slot23, slot24)

		slot20 = removeOnButton
		slot21 = slot5

		slot20(slot21)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 225-232, warpins: 2 ---
	slot20, slot21, slot22 = nil
	slot23 = slot0.ptData
	slot23 = slot23.level
	slot24 = slot0.ptData
	slot24 = slot24.targets
	slot24 = #slot24

	if slot23 >= slot24 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 233-237, warpins: 1 ---
		slot23 = slot0.nday
		slot24 = slot0.taskGroup
		slot24 = #slot24

		if slot23 >= slot24 and slot15 == 2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 240-244, warpins: 1 ---
			slot23 = slot0.nday2
			slot24 = slot0.taskGroup2
			slot24 = #slot24

			if slot23 >= slot24 and slot16 == 2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 247-253, warpins: 1 ---
				slot23 = setActive
				slot24 = slot4
				slot25 = false

				slot23(slot24, slot25)

				slot20 = slot3
				slot21 = slot14
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 254-257, warpins: 5 ---
		slot23 = slot0.nday
		slot24 = slot0.nday2

		if slot23 <= slot24 and slot15 ~= 2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 260-266, warpins: 1 ---
			slot23 = setActive
			slot24 = slot3
			slot25 = false

			slot23(slot24, slot25)

			slot20 = slot4
			slot21 = slot12
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 267-272, warpins: 2 ---
			slot23 = setActive
			slot24 = slot4
			slot25 = false

			slot23(slot24, slot25)

			slot20 = slot3
			slot21 = slot13
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 273-352, warpins: 3 ---
	setActive(slot6, true)
	updateDrop(slot6, slot24)
	onButton(slot0, slot6, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0:emit(BaseUI.ON_DROP, slot0)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	setActive(slot7, true)
	setActive(slot0.taskDesc, true)
	setActive(slot0.signDesc, false)
	setText(slot0.taskDesc:Find("title"), slot21:getConfig("name"))
	setText(slot0.taskDesc:Find("desc"), slot21:getConfig("desc"))
	setSlider(slot7, 0, slot26, slot21:getProgress())

	slot27 = slot21:getTaskStatus()

	setActive(slot2, slot27 == 0)
	setActive(slot20, slot27 == 1)
	setActive(slot5, slot27 == 2)

	slot28 = onButton
	slot29 = slot0
	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 356-360, warpins: 2 ---
	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 364-368, warpins: 2 ---
	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 372-386, warpins: 2 ---
	slot30 = slot2

	function slot31()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityMediator
		slot2 = slot2.ON_TASK_GO
		slot3 = slot1

		slot0(slot1, slot2, slot3)

		return
		--- END OF BLOCK #0 ---



	end

	slot32 = SFX_PANEL

	slot28(slot29, slot30, slot31, slot32)

	slot28 = onButton
	slot29 = slot0
	slot30 = slot20

	function slot31()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityMediator
		slot2 = slot2.ON_TASK_SUBMIT
		slot3 = slot1

		slot0(slot1, slot2, slot3)

		return
		--- END OF BLOCK #0 ---



	end

	slot32 = SFX_PANEL

	slot28(slot29, slot30, slot31, slot32)

	return
	--- END OF BLOCK #12 ---



end

slot0.UpdateTaskList = slot1

function slot1(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.ptData

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-22, warpins: 2 ---
	slot1 = slot0.ptData
	slot2 = slot1
	slot1 = slot1.getTargetLevel
	slot1 = slot1(slot2)
	slot2 = slot0.ActPT
	slot3 = slot2
	slot2 = slot2.getConfig
	slot4 = "config_client"
	slot2 = slot2(slot3, slot4)
	slot2 = slot2.story
	slot3 = checkExist
	slot4 = slot2
	slot5 = {}
	slot5[1] = slot1
	slot6 = {
		1
	}
	slot3 = slot3(slot4, slot5, slot6)

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-33, warpins: 1 ---
		slot3 = pg
		slot3 = slot3.StoryMgr
		slot3 = slot3.GetInstance
		slot3 = slot3()
		slot5 = slot3
		slot4 = slot3.IsPlayed
		slot6 = slot2[slot1]
		slot6 = slot6[1]
		slot4 = slot4(slot5, slot6)

		if not slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 34-38, warpins: 1 ---
			slot5 = slot3
			slot4 = slot3.Play
			slot6 = slot2[slot1]
			slot6 = slot6[1]

			slot4(slot5, slot6)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 39-97, warpins: 3 ---
	slot12, slot13 = slot0.ptData:GetResProgress()

	setSlider(slot6, 0, 1, math.min(slot3, slot4) / slot0.ptData:GetTotalResRequire())
	setSlider(slot8, 0, 1, slot0.ptData:GetUnlockedMaxResRequire() / slot0.ptData.GetTotalResRequire())
	setActive(slot0.rightStage:Find("battle_btn"), slot0.ptData:CanGetMorePt() and not slot0.ptData:CanGetAward() and slot0.ptData:CanGetNextAward())
	setActive(slot0.rightStage:Find("get_btn"), slot9)
	setActive(slot0.rightStage:Find("got_btn"), not slot0.ptData.CanGetNextAward())

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 105-122, warpins: 4 ---
	--- END OF BLOCK #3 ---



end

slot0.UpdatePTList = slot1

function slot1(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.spineLRQ

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot1 = slot0.spineLRQ
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.spineLRQ = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-12, warpins: 2 ---
	slot1 = slot0.spine

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-28, warpins: 1 ---
		slot1 = slot0.spine
		slot1 = slot1.transform
		slot2 = Vector3
		slot2 = slot2.one
		slot1.localScale = slot2
		slot1 = pg
		slot1 = slot1.PoolMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.ReturnSpineChar
		slot3 = "beierfasite_4"
		slot4 = slot0.spine

		slot1(slot2, slot3, slot4)

		slot1 = nil
		slot0.spine = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 29-29, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.OnDestroy = slot1

return slot0
