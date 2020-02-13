slot0 = class
slot1 = "ActivityBossBattleScene2"
slot2 = import
slot3 = "view.base.BaseUI"
slot0 = slot0(slot1, slot2(slot3))
slot1 = pg
slot1 = slot1.expedition_data_template

function slot2(slot0)
	slot1 = "ActivityBossBattleUI2"

	return slot1
end

slot0.getUIName = slot2
slot2 = {}
slot3 = {
	130,
	85,
	70
}
slot2[1] = slot3
slot3 = {
	130,
	85,
	70
}
slot2[2] = slot3
slot3 = {
	70,
	130,
	105
}
slot2[3] = slot3
slot3 = {
	80,
	140,
	255
}
slot2[4] = slot3
slot0.phaseColor = slot2

function slot2(slot0)
	slot1 = slot0
	slot1 = slot1.phaseColor
	slot2 = slot0.phase
	slot1 = slot1[slot2]
	slot1 = slot1[1]
	slot1 = slot1 / 255
	slot2 = slot0
	slot2 = slot2.phaseColor
	slot3 = slot0.phase
	slot2 = slot2[slot3]
	slot2 = slot2[2]
	slot2 = slot2 / 255
	slot3 = slot0
	slot3 = slot3.phaseColor
	slot4 = slot0.phase
	slot3 = slot3[slot4]
	slot3 = slot3[3]
	slot3 = slot3 / 255

	return slot1, slot2, slot3
end

slot0.returnPhaseColor = slot2

function slot2(slot0, slot1)
	slot0.fleet = slot1
end

slot0.setFleet = slot2

function slot2(slot0, slot1)
	slot0.ptId = slot1
end

slot0.setPtID = slot2

function slot2(slot0, slot1, slot2, slot3, slot4)
	slot0.battleTime = slot1
	slot0.taskList = slot2
	slot0.itemDisplayList = slot3
	slot0.stageList = slot4
	slot5 = 1
	slot6 = 4
	slot7 = 1

	for slot8 = slot5, slot6, slot7 do
		slot9 = {}
		slot10 = slot0.itemDisplayList
		slot11 = 5 - slot8
		slot10 = slot10[slot11]
		slot10 = slot10[1]
		slot9.type = slot10
		slot10 = slot0.itemDisplayList
		slot11 = 5 - slot8
		slot10 = slot10[slot11]
		slot10 = slot10[2]
		slot9.id = slot10
		slot10 = slot0.itemDisplayList
		slot11 = 5 - slot8
		slot10 = slot10[slot11]
		slot10 = slot10[3]
		slot9.count = slot10
		slot10 = updateDrop
		slot11 = slot0.bonusWindow
		slot12 = slot11
		slot11 = slot11.Find
		slot13 = "window/scrollview/item/award"
		slot11 = slot11(slot12, slot13)
		slot12 = slot9

		slot10(slot11, slot12)

		slot10 = onButton
		slot11 = slot0
		slot13 = slot0
		slot12 = slot0.findTF
		slot14 = "phase"
		slot15 = slot8
		slot16 = "/monument/item"
		slot14 = slot14 .. slot15 .. slot16
		slot15 = slot0.hpBar
		slot12 = slot12(slot13, slot14, slot15)

		function slot13()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = slot1
			slot2 = slot2.ON_DROP
			slot3 = slot2

			slot0(slot1, slot2, slot3)
		end

		slot14 = SFX_PANEL

		slot10(slot11, slot12, slot13, slot14)
	end
end

slot0.setInfomation = slot2

function slot2(slot0, slot1)
	slot0.player = slot1
	slot2 = slot0._resPanel
	slot3 = slot2
	slot2 = slot2.setResources
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = slot0.player
	slot3 = slot2
	slot2 = slot2.getResource
	slot4 = slot0.ptId
	slot2 = slot2(slot3, slot4)
	slot0.ptScore = slot2
	slot2 = setText
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "point"
	slot6 = slot0.awardBtn
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = slot0.ptScore

	slot2(slot3, slot4)

	slot2 = pg
	slot2 = slot2.SystemOpenMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.isOpenSystem
	slot4 = slot0.player
	slot4 = slot4.level
	slot5 = "CommandRoomMediator"
	slot2 = slot2(slot3, slot4, slot5)
	slot0.openedCommanerSystem = slot2
end

slot0.setPlayer = slot2

function slot2(slot0, slot1)
	slot0.activity = slot1
	slot2 = slot1.data1
	slot0.bossHP = slot2
	slot2 = slot1.data1_list
	slot0.monument = slot2
	slot2 = slot1.data2

	if slot2 ~= 1 then
		slot2 = slot0.monument
		slot2 = slot2[4]

		if slot2[4] then
			slot2 = false
		end
	else
		slot2 = true
	end

	slot0.isdead = slot2
	slot2 = math
	slot2 = slot2.floor
	slot3 = math
	slot3 = slot3.min
	slot4 = slot0.bossHP
	slot5 = 9999
	slot3 = slot3(slot4, slot5)
	slot3 = slot3 / 2500
	slot2 = slot2(slot3)
	slot2 = slot2 + 1
	slot0.phase = slot2
	slot3 = slot0
	slot2 = slot0.updatePage

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.checkStory

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updateAward

	slot2(slot3)

	slot2 = slot0.isdead

	if not slot2 then
		slot3 = slot0
		slot2 = slot0.emit
		slot4 = ActivityBossBattleMediator2
		slot4 = slot4.UPDATE_ACT_RANK_PT
		slot5 = slot0.ptScore

		slot2(slot3, slot4, slot5)
	end

	slot2 = slot0.enterStage

	if slot2 then
		function slot2()
			slot0 = slot0
			slot0 = slot0.isdead

			if slot0 then
				slot0 = slot0
				slot0 = slot0.stageList
				slot0 = slot0[0]

				return slot0
			end

			slot0 = ipairs
			slot1 = slot0
			slot1 = slot1.stageList
			slot0, slot1, slot2 = slot0(slot1)

			for slot3, slot4 in slot0, slot1, slot2 do
				slot5 = slot0.bossHP
				slot6 = slot4[1][1] + ((slot3 == 1 and 1) or 0)

				if slot5 < slot6 then
					slot5 = slot0
					slot5 = slot5.bossHP
					slot6 = slot4[1]
					slot6 = slot6[2]

					if slot6 <= slot5 then
						slot5 = slot4[2]

						return slot5
					end
				end
			end
		end

		slot3 = false
		slot0.enterStage = slot3
		slot3 = slot0.battleTime

		if slot3 ~= 0 then
			slot3 = slot0.timeMgr
			slot4 = slot3
			slot3 = slot3.GetServerTime
			slot3 = slot3(slot4)
			slot4 = slot0.timeMgr
			slot5 = slot4
			slot4 = slot4.parseTimeFromConfig
			slot6 = slot0.battleTime
			slot4 = slot4(slot5, slot6)

			if slot4 <= slot3 then
				slot3 = pg
				slot3 = slot3.TipsMgr
				slot3 = slot3.GetInstance
				slot3 = slot3()
				slot4 = slot3
				slot3 = slot3.ShowTips
				slot5 = i18n
				slot6 = "common_activity_end"

				slot3(slot4, slot5(slot6))

				return
			end
		end

		slot4 = slot0
		slot3 = slot0.emit
		slot5 = ActivityBossBattleMediator2
		slot5 = slot5.ON_STAGE
		slot6 = slot2
		slot6 = slot6()
		slot7 = slot0.bossHP

		slot3(slot4, slot5, slot6, slot7)
	end
end

slot0.setActivity = slot2

function slot2(slot0)
	slot1 = pg
	slot1 = slot1.TimeMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot0.timeMgr = slot1
	slot1 = getProxy
	slot2 = TaskProxy
	slot1 = slot1(slot2)
	slot0.taskProxy = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "top"
	slot1 = slot1(slot2, slot3)
	slot0.top = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "back"
	slot4 = slot0.top
	slot1 = slot1(slot2, slot3, slot4)
	slot0.backBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "playerRes"
	slot4 = slot0.top
	slot1 = slot1(slot2, slot3, slot4)
	slot0.playerRes = slot1
	slot1 = PlayerResource
	slot1 = slot1.New
	slot1 = slot1()
	slot0._resPanel = slot1
	slot1 = tf
	slot2 = slot0._resPanel
	slot2 = slot2._go
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.SetParent
	slot3 = tf
	slot4 = slot0.playerRes
	slot3 = slot3(slot4)
	slot4 = false

	slot1(slot2, slot3, slot4)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main"
	slot1 = slot1(slot2, slot3)
	slot0.mainTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "bg"
	slot1 = slot1(slot2, slot3)
	slot0.bg = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "title"
	slot4 = slot0.mainTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.titleTF = slot1
	slot1 = setActive
	slot2 = slot0.titleTF
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "rank"
	slot4 = slot0.mainTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.rankTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "bottom"
	slot4 = slot0.mainTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.bottom = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "msg_panel"
	slot4 = slot0.bottom
	slot1 = slot1(slot2, slot3, slot4)
	slot0.msgPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "hp_bar"
	slot4 = slot0.bottom
	slot1 = slot1(slot2, slot3, slot4)
	slot0.hpBar = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "hp_point"
	slot4 = slot0.bottom
	slot1 = slot1(slot2, slot3, slot4)
	slot0.hpPoint = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "btn_battle"
	slot4 = slot0.bottom
	slot1 = slot1(slot2, slot3, slot4)
	slot0.battleBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "btn_formation"
	slot4 = slot0.bottom
	slot1 = slot1(slot2, slot3, slot4)
	slot0.formationBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "btn_award"
	slot4 = slot0.bottom
	slot1 = slot1(slot2, slot3, slot4)
	slot0.awardBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "help"
	slot4 = slot0.mainTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.helpBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "bonusWindow"
	slot1 = slot1(slot2, slot3)
	slot0.bonusWindow = slot1
	slot1 = setActive
	slot2 = slot0.bonusWindow
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "fleet_select"
	slot1 = slot1(slot2, slot3)
	slot0.fleetSelect = slot1
	slot1 = ActivityFleetPanel
	slot1 = slot1.New
	slot2 = slot0.fleetSelect
	slot2 = slot2.gameObject
	slot1 = slot1(slot2)
	slot0.fleetEditPanel = slot1
	slot1 = slot0.fleetEditPanel

	function slot2()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hideFleetEdit

		slot0(slot1)
	end

	slot1.onCancel = slot2
	slot1 = slot0.fleetEditPanel

	function slot2()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.commitEdit

		slot0(slot1)
	end

	slot1.onCommit = slot2
	slot1 = slot0.fleetEditPanel

	function slot2()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.commitEdit

		slot0(slot1)

		function slot0()
			slot0 = slot0
			slot0 = slot0.isdead

			if slot0 then
				slot0 = slot0
				slot0 = slot0.stageList
				slot0 = slot0[0]

				return slot0
			end

			slot0 = ipairs
			slot1 = slot0
			slot1 = slot1.stageList
			slot0, slot1, slot2 = slot0(slot1)

			for slot3, slot4 in slot0, slot1, slot2 do
				slot5 = slot0.bossHP
				slot6 = slot4[1][1] + ((slot3 == 1 and 1) or 0)

				if slot5 < slot6 then
					slot5 = slot0
					slot5 = slot5.bossHP
					slot6 = slot4[1]
					slot6 = slot6[2]

					if slot6 <= slot5 then
						slot5 = slot4[2]

						return slot5
					end
				end
			end
		end

		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.emit
		slot3 = ActivityBossBattleMediator2
		slot3 = slot3.ON_PRECOMBAT
		slot4 = slot0

		slot1(slot2, slot3, slot4())
	end

	slot1.onCombat = slot2
	slot1 = slot0.fleetEditPanel

	function slot2(slot0, slot1)
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.openShipInfo
		slot4 = slot0
		slot5 = slot1

		slot2(slot3, slot4, slot5)
	end

	slot1.onLongPressShip = slot2
	slot1 = CmdLevelFormationPanel
	slot1 = slot1.New
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "commander_panel"
	slot1 = slot1(slot2(slot3, slot4))
	slot0.commanderFormationPanel = slot1
	slot1 = slot0.commanderFormationPanel
	slot2 = slot1
	slot1 = slot1.attach
	slot3 = slot0

	slot1(slot2, slot3)

	slot1 = false
	slot0.enterStage = slot1
	slot1 = slot0._tf
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = "Animator"
	slot1 = slot1(slot2, slot3)
	slot0.anim = slot1
	slot1 = slot0.anim
	slot2 = false
	slot1.enabled = slot2
	slot1 = setActive
	slot2 = slot0.top
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.mainTF
	slot3 = false

	slot1(slot2, slot3)
end

slot0.init = slot2

function slot2(slot0)
	function slot1()
		slot0 = slot0
		slot0 = slot0.titleEffect

		if slot0 then
			slot0 = setActive
			slot1 = slot0
			slot1 = slot1.titleEffect
			slot2 = false

			slot0(slot1, slot2)
		end

		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.titleTF
		slot2 = true

		slot0(slot1, slot2)

		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.top
		slot2 = true

		slot0(slot1, slot2)

		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.mainTF
		slot2 = true

		slot0(slot1, slot2)
	end

	slot2 = slot0.contextData
	slot2 = slot2.showAni

	if not slot2 then
		slot2 = slot1

		slot2()

		return
	end

	slot2 = slot0.contextData
	slot3 = nil
	slot2.showAni = slot3

	function slot2()
		slot0 = slot0
		slot0 = slot0.titleEffect
		slot1 = slot0
		slot0 = slot0.GetComponent
		slot2 = "DftAniEvent"
		slot0 = slot0(slot1, slot2)
		slot2 = slot0
		slot1 = slot0.SetEndEvent

		function slot3(slot0)
			slot1 = setActive
			slot2 = slot0
			slot2 = slot2.titleEffect
			slot3 = false

			slot1(slot2, slot3)

			slot1 = setActive
			slot2 = slot0
			slot2 = slot2.titleTF
			slot3 = true

			slot1(slot2, slot3)
		end

		slot1(slot2, slot3)

		slot2 = slot0
		slot1 = slot0.SetTriggerEvent

		function slot3(slot0)
			slot1 = slot0
			slot1 = slot1.anim
			slot2 = true
			slot1.enabled = slot2
			slot1 = slot0
			slot1 = slot1.anim
			slot2 = slot1
			slot1 = slot1.Play
			slot3 = "enter"
			slot4 = -1
			slot5 = 0

			slot1(slot2, slot3, slot4, slot5)
		end

		slot1(slot2, slot3)

		slot1 = setActive
		slot2 = slot0
		slot2 = slot2.titleEffect
		slot3 = true

		slot1(slot2, slot3)
	end

	slot3 = slot0.titleEffect

	if not slot3 then
		slot3 = PoolMgr
		slot3 = slot3.GetInstance
		slot3 = slot3()
		slot4 = slot3
		slot3 = slot3.GetUI
		slot5 = "ASKS"
		slot6 = true

		function slot7(slot0)
			slot1 = slot0
			slot1.titleEffect = slot0
			slot1 = setParent
			slot2 = slot0
			slot2 = slot2.titleEffect
			slot3 = slot0
			slot3 = slot3._tf

			slot1(slot2, slot3)

			slot1 = slot1

			slot1()

			slot1 = onButton
			slot2 = slot0
			slot3 = slot0
			slot3 = slot3.titleEffect

			function slot4()
				slot0 = slot0

				slot0()
			end

			slot1(slot2, slot3, slot4)
		end

		slot3(slot4, slot5, slot6, slot7)
	else
		slot3 = slot2

		slot3()
	end
end

slot0.enterAnim = slot2

function slot2(slot0)
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.backBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = slot1
		slot2 = slot2.ON_BACK

		slot0(slot1, slot2)
	end

	slot5 = SOUND_BACK

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.awardBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.showAwards

		slot0(slot1)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.battleBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.tryBattle

		slot0(slot1)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.formationBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.fleetEditPanel
		slot1 = slot0
		slot0 = slot0.attach
		slot2 = slot0

		slot0(slot1, slot2)

		slot0 = slot0
		slot0 = slot0.fleetEditPanel
		slot1 = slot0
		slot0 = slot0.setFleets
		slot2 = slot0
		slot2 = slot2.fleet

		slot0(slot1, slot2)

		slot0 = slot0
		slot0 = slot0.fleetEditPanel
		slot1 = slot0
		slot0 = slot0.set
		slot2 = 1
		slot3 = 1

		slot0(slot1, slot2, slot3)

		slot0 = pg
		slot0 = slot0.UIMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.BlurPanel
		slot2 = slot0
		slot2 = slot2.fleetEditPanel
		slot2 = slot2._tf

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.rankTF

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityBossBattleMediator2
		slot2 = slot2.ON_RANK

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.helpBtn

	function slot4()
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
		slot3 = slot3.world_boss_help
		slot3 = slot3.tip
		slot2.helps = slot3

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = slot0.contextData
	slot1 = slot1.editFleet

	if slot1 then
		slot1 = triggerButton
		slot2 = slot0.formationBtn

		slot1(slot2)

		slot1 = slot0.contextData
		slot2 = nil
		slot1.editFleet = slot2
	end

	slot2 = slot0
	slot1 = slot0.enterAnim

	slot1(slot2)
end

slot0.didEnter = slot2

function slot2(slot0)
	slot1 = pg
	slot1 = slot1.StoryMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot0.activity
	slot3 = slot2
	slot2 = slot2.getConfig
	slot4 = "config_client"
	slot2 = slot2(slot3, slot4)
	slot2 = slot2.story
	slot3 = nil

	function slot4()
		slot0 = slot0

		if slot0 then
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
	end

	slot5 = coroutine
	slot5 = slot5.create

	function slot6()
		slot0 = ipairs
		slot1 = slot0
		slot0, slot1, slot2 = slot0(slot1)

		for slot3, slot4 in slot0, slot1, slot2 do
			slot5 = slot1.bossHP
			slot6 = slot4[1] + ((slot3 == 1 and 1) or 0)

			if slot5 >= slot6 then
				slot5 = slot4[1]

				if slot5 == 0 then
					slot5 = slot1
					slot5 = slot5.isdead

					if slot5 then
						slot5 = slot1
						slot5 = slot5.player
						slot6 = slot5
						slot5 = slot5.IsPlayed
						slot7 = slot4[2]
						slot5 = slot5(slot6, slot7)

						if not slot5 then
							slot5 = slot2
							slot6 = slot5
							slot5 = slot5.Play
							slot7 = slot4[2]
							slot8 = slot3

							slot5(slot6, slot7, slot8)

							slot5 = coroutine
							slot5 = slot5.yield

							slot5()
						end
					end
				end
			end
		end
	end

	slot5 = slot5(slot6)
	slot3 = slot5
	slot5 = slot4

	slot5()
end

slot0.checkStory = slot2

function slot2(slot0)
	slot1 = string
	slot1 = slot1.format
	slot2 = "%.2f"
	slot3 = slot0.bossHP
	slot3 = slot3 / 100
	slot1 = slot1(slot2, slot3)
	slot2 = string
	slot2 = slot2.find
	slot3 = slot1
	slot4 = "%."
	slot2, slot3 = slot2(slot3, slot4)
	slot4 = setText
	slot6 = slot0
	slot5 = slot0.findTF
	slot7 = "number1"
	slot8 = slot0.hpPoint
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = string
	slot6 = slot6.sub
	slot7 = slot1
	slot8 = 1
	slot9 = slot3

	slot4(slot5, slot6(slot7, slot8, slot9))

	slot4 = setText
	slot6 = slot0
	slot5 = slot0.findTF
	slot7 = "number2"
	slot8 = slot0.hpPoint
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = string
	slot6 = slot6.sub
	slot7 = slot1
	slot8 = slot3 + 1

	slot4(slot5, slot6(slot7, slot8))

	slot4 = GetImageSpriteFromAtlasAsync
	slot5 = "commonbg/act_boss_bg_"
	slot6 = slot0.phase
	slot5 = slot5 .. slot6
	slot6 = ""
	slot7 = slot0.bg

	slot4(slot5, slot6, slot7)

	slot4 = setImageColor
	slot6 = slot0
	slot5 = slot0.findTF
	slot7 = "back_light"
	slot8 = slot0.mainTF
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = Color
	slot6 = slot6.New
	slot8 = slot0
	slot7 = slot0.returnPhaseColor

	slot4(slot5, slot6(slot7(slot8)))

	slot4 = 1
	slot5 = 4
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot8 = slot0:findTF("phase" .. slot7, slot0.hpBar)

		setSlider(slot0:findTF("Slider", slot8), 0, 2500, math.min(math.max(slot0.bossHP - (slot7 - 1) * 2500, 0), 2500))
		setActive(slot0:findTF("mood", slot8), slot7 == slot0.phase)
		setActive(slot0:findTF("monument/item", slot8), defaultValue(slot0.monument[5 - slot7], 0) == 0)
		setActive(slot0:findTF("monument/time", slot8), defaultValue(slot0.monument[5 - slot7], 0) > 0)

		slot9 = slot0.monument[5 - slot7]

		if slot9 then
			slot9 = slot0.timeMgr
			slot10 = slot9
			slot9 = slot9.CTimeDescC
			slot11 = slot0.monument
			slot12 = 5 - slot7
			slot11 = slot11[slot12]
			slot12 = "%m/%d/%H:%M"
			slot9 = slot9(slot10, slot11, slot12)
			slot10 = setText
			slot12 = slot0
			slot11 = slot0.findTF
			slot13 = "monument/time/word"
			slot14 = slot8
			slot11 = slot11(slot12, slot13, slot14)
			slot12 = slot9

			slot10(slot11, slot12)
		end
	end
end

slot0.updatePage = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.emit
	slot3 = ActivityBossBattleMediator2
	slot3 = slot3.ON_TRY_BATTLE

	slot1(slot2, slot3)
end

slot0.tryBattle = slot2

function slot2(slot0)
	slot1 = setActive
	slot2 = slot0.bonusWindow
	slot3 = true

	slot1(slot2, slot3)

	slot1 = slot0.awardList

	if not slot1 then
		slot1 = onButton
		slot2 = slot0
		slot3 = slot0.bonusWindow

		function slot4()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.closeAwards

			slot0(slot1)
		end

		slot5 = SFX_PANEL

		slot1(slot2, slot3, slot4, slot5)

		slot1 = onButton
		slot2 = slot0
		slot3 = slot0.bonusWindow
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/top/btnBack"
		slot3 = slot3(slot4, slot5)

		function slot4()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.closeAwards

			slot0(slot1)
		end

		slot5 = SFX_PANEL

		slot1(slot2, slot3, slot4, slot5)

		slot1 = UIItemList
		slot1 = slot1.New
		slot2 = slot0.bonusWindow
		slot3 = slot2
		slot2 = slot2.Find
		slot4 = "window/scrollview/list"
		slot2 = slot2(slot3, slot4)
		slot3 = slot0.bonusWindow
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/scrollview/item"
		slot1 = slot1(slot2, slot3(slot4, slot5))
		slot0.awardList = slot1
		slot1 = setActive
		slot2 = slot0.bonusWindow
		slot3 = slot2
		slot2 = slot2.Find
		slot4 = "window/scrollview/item"
		slot2 = slot2(slot3, slot4)
		slot3 = false

		slot1(slot2, slot3)

		slot1 = slot0.awardList
		slot2 = slot1
		slot1 = slot1.make

		function slot3(slot0, slot1, slot2)
			slot3 = slot0
			slot3 = slot3.taskList
			slot4 = slot1 + 1
			slot3 = slot3[slot4]
			slot3 = slot3[1]
			slot4 = slot0
			slot4 = slot4.taskList
			slot5 = slot1 + 1
			slot4 = slot4[slot5]
			slot4 = slot4[2]
			slot5 = slot0
			slot5 = slot5.taskProxy
			slot6 = slot5
			slot5 = slot5.getTaskById
			slot7 = slot4
			slot5 = slot5(slot6, slot7)

			if not slot5 then
				slot5 = slot0
				slot5 = slot5.taskProxy
				slot6 = slot5
				slot5 = slot5.getFinishTaskById
				slot7 = slot4
				slot5 = slot5(slot6, slot7)

				if not slot5 then
					slot5 = Task
					slot5 = slot5.New
					slot6 = {
						id = slot4
					}
					slot5 = slot5(slot6)
				end
			end

			slot6 = UIItemList
			slot6 = slot6.EventInit

			if slot0 == slot6 then
				slot6 = setText
				slot8 = slot2
				slot7 = slot2.Find
				slot9 = "mask/target/Text"
				slot7 = slot7(slot8, slot9)
				slot8 = i18n
				slot9 = "world_boss_award_limit"
				slot10 = string
				slot10 = slot10.format
				slot11 = "%2d"
				slot12 = slot3 / 100

				slot6(slot7, slot8(slot9, slot10(slot11, slot12)))

				slot6 = setText
				slot8 = slot2
				slot7 = slot2.Find
				slot9 = "title/Text"
				slot7 = slot7(slot8, slot9)
				slot8 = "PHASE "
				slot9 = slot1 + 1
				slot8 = slot8 .. slot9

				slot6(slot7, slot8)

				slot6 = setText
				slot8 = slot2
				slot7 = slot2.Find
				slot9 = "target/title"
				slot7 = slot7(slot8, slot9)
				slot8 = i18n
				slot9 = "qiuqiu_count"

				slot6(slot7, slot8(slot9))

				slot6 = setText
				slot8 = slot2
				slot7 = slot2.Find
				slot9 = "target/Text"
				slot7 = slot7(slot8, slot9)
				slot9 = slot5
				slot8 = slot5.getConfig
				slot10 = "target_num"

				slot6(slot7, slot8(slot9, slot10))

				slot7 = slot5
				slot6 = slot5.getConfig
				slot8 = "award_display"
				slot6 = slot6(slot7, slot8)
				slot6 = slot6[1]
				slot7 = {}
				slot8 = slot6[1]
				slot7.type = slot8
				slot8 = slot6[2]
				slot7.id = slot8
				slot8 = slot6[3]
				slot7.count = slot8
				slot8 = updateDrop
				slot10 = slot2
				slot9 = slot2.Find
				slot11 = "award"
				slot9 = slot9(slot10, slot11)
				slot10 = slot7

				slot8(slot9, slot10)

				slot8 = onButton
				slot9 = slot0
				slot10 = slot2

				function slot11()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = slot1
					slot2 = slot2.ON_DROP
					slot3 = slot2

					slot0(slot1, slot2, slot3)
				end

				slot12 = SFX_PANEL

				slot8(slot9, slot10, slot11, slot12)

				return
			end

			slot6 = UIItemList
			slot6 = slot6.EventUpdate

			if slot0 == slot6 then
				setActive(slot2:Find("target"), slot0.bossHP <= slot3)
				setActive(slot2:Find("mask"), slot3 < slot0.bossHP)

				slot6 = setActive
				slot8 = slot2
				slot7 = slot2.Find
				slot9 = "award/mask"
				slot7 = slot7(slot8, slot9)
				slot9 = slot5
				slot8 = slot5.isReceive

				slot6(slot7, slot8(slot9))

				slot6 = setActive
				slot8 = slot2
				slot7 = slot2.Find
				slot9 = "award/mask_can"
				slot7 = slot7(slot8, slot9)
				slot8 = slot0
				slot8 = slot8.bossHP

				if slot8 <= slot3 then
					slot9 = slot5
					slot8 = slot5.isFinish
					slot8 = slot8(slot9)

					if slot8 then
						slot9 = slot5
						slot8 = slot5.isReceive
						slot8 = slot8(slot9)
						slot8 = not slot8
					end
				else
					slot8 = false

					if false then
						slot8 = true
					end
				end

				slot6(slot7, slot8)
			end
		end

		slot1(slot2, slot3)
	end

	slot2 = slot0
	slot1 = slot0.updateAward

	slot1(slot2)
end

slot0.showAwards = slot2

function slot2(slot0)
	slot1 = setActive
	slot2 = slot0.bonusWindow
	slot3 = false

	slot1(slot2, slot3)
end

slot0.closeAwards = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.getDoingTask
	slot1, slot2, slot3 = slot1(slot2)
	slot4 = setActive
	slot6 = slot0
	slot5 = slot0.findTF
	slot7 = "flash"
	slot8 = slot0.awardBtn
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = slot0.bossHP

	if slot6 <= slot2 then
		slot7 = slot3
		slot6 = slot3.isFinish
		slot6 = slot6(slot7)

		if slot6 then
			slot7 = slot3
			slot6 = slot3.isReceive
			slot6 = slot6(slot7)
			slot6 = not slot6
		end
	else
		slot6 = false

		if false then
			slot6 = true
		end
	end

	slot4(slot5, slot6)

	slot4 = slot0.awardList

	if slot4 then
		slot4 = slot0.awardList
		slot5 = slot4
		slot4 = slot4.align
		slot6 = slot0.taskList
		slot6 = #slot6

		slot4(slot5, slot6)

		slot5 = slot0
		slot4 = slot0.updateTaskBtn
		slot6 = slot1
		slot7 = slot2
		slot8 = slot3

		slot4(slot5, slot6, slot7, slot8)
	end
end

slot0.updateAward = slot2

function slot2(slot0)
	slot1, slot2, slot3 = nil
	slot4 = ipairs
	slot5 = slot0.taskList
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot1 = slot7
		slot2 = slot8[1]
		slot9 = slot0.taskProxy
		slot10 = slot9
		slot9 = slot9.getTaskById
		slot11 = slot8[2]
		slot9 = slot9(slot10, slot11)
		slot3 = slot9

		if slot3 then
			break
		else
			slot9 = slot0.taskProxy
			slot10 = slot9
			slot9 = slot9.getFinishTaskById
			slot11 = slot8[2]
			slot9 = slot9(slot10, slot11)
			slot3 = slot9
		end
	end

	slot4 = slot1
	slot5 = slot2
	slot6 = slot3

	return slot4, slot5, slot6
end

slot0.getDoingTask = slot2

function slot2(slot0, slot1, slot2, slot3)
	slot4 = scrollTo
	slot5 = slot0.bonusWindow
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = "window/scrollview"
	slot5 = slot5(slot6, slot7)
	slot6 = 0
	slot7 = slot1 - 1
	slot8 = slot0.taskList
	slot8 = #slot8
	slot8 = slot8 - 1
	slot7 = slot7 / slot8
	slot7 = 1 - slot7

	slot4(slot5, slot6, slot7)

	slot4 = {}
	slot5 = slot0.bonusWindow
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = "window/btn_dis"
	slot5 = slot5(slot6, slot7)
	slot4[1] = slot5
	slot5 = slot0.bonusWindow
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = "window/btn_get"
	slot5 = slot5(slot6, slot7)
	slot4[2] = slot5
	slot5 = slot0.bonusWindow
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = "window/btn_got"
	slot4[MULTRES] = slot5(slot6, slot7)
	slot5 = setActive
	slot6 = slot4[1]
	slot7 = slot0.bossHP

	if slot2 >= slot7 then
		slot8 = slot3
		slot7 = slot3.isFinish
		slot7 = slot7(slot8)
		slot7 = not slot7

		if not slot7 then
			slot7 = false
		end
	else
		slot7 = true
	end

	slot5(slot6, slot7)

	slot5 = setActive
	slot6 = slot4[2]
	slot7 = slot0.bossHP

	if slot7 <= slot2 then
		slot8 = slot3
		slot7 = slot3.isFinish
		slot7 = slot7(slot8)

		if slot7 then
			slot8 = slot3
			slot7 = slot3.isReceive
			slot7 = slot7(slot8)
			slot7 = not slot7
		end
	else
		slot7 = false

		if false then
			slot7 = true
		end
	end

	slot5(slot6, slot7)

	slot5 = setActive
	slot6 = slot4[3]
	slot8 = slot3
	slot7 = slot3.isReceive

	slot5(slot6, slot7(slot8))

	slot5 = onButton
	slot6 = slot0
	slot7 = slot4[2]

	function slot8()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityBossBattleMediator2
		slot2 = slot2.ON_GET
		slot3 = slot1
		slot3 = slot3.id

		slot0(slot1, slot2, slot3)
	end

	slot9 = SFX_PANEL

	slot5(slot6, slot7, slot8, slot9)
end

slot0.updateTaskBtn = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.emit
	slot3 = ActivityBossBattleMediator2
	slot3 = slot3.ON_COMMIT_FLEET

	slot1(slot2, slot3)
end

slot0.commitEdit = slot2

function slot2(slot0)
	slot1 = slot0.fleetEditPanel
	slot2 = slot1
	slot1 = slot1.setFleets
	slot3 = slot0.fleet

	slot1(slot2, slot3)

	slot1 = slot0.fleetEditPanel
	slot2 = slot1
	slot1 = slot1.updateFleets

	slot1(slot2)
end

slot0.updateEditPanel = slot2

function slot2(slot0)
	slot1 = setActive
	slot2 = slot0.fleetSelect
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.closeCommanderPanel

	slot1(slot2)

	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.UnblurPanel
	slot3 = slot0.fleetSelect
	slot4 = slot0._tf

	slot1(slot2, slot3, slot4)

	slot1 = setParent
	slot2 = slot0.fleetSelect
	slot3 = slot0._tf
	slot4 = false

	slot1(slot2, slot3, slot4)
end

slot0.hideFleetEdit = slot2

function slot2(slot0, slot1, slot2)
	slot4 = slot0
	slot3 = slot0.emit
	slot5 = ActivityBossBattleMediator2
	slot5 = slot5.ON_FLEET_SHIPINFO
	slot6 = {
		shipId = slot1,
		shipVOs = slot2
	}

	slot3(slot4, slot5, slot6)
end

slot0.openShipInfo = slot2

function slot2(slot0, slot1)
	slot2 = nil

	function slot2(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.emit
		slot3 = ActivityBossBattleMediator2
		slot3 = slot3.ON_SELECT_COMMANDER
		slot4 = slot1
		slot4 = slot4.id
		slot5 = slot0

		slot1(slot2, slot3, slot4, slot5)

		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.hideFleetEdit

		slot1(slot2)
	end

	slot3 = slot0.commanderFormationPanel
	slot4 = slot3
	slot3 = slot3.update
	slot5 = slot1
	slot6 = slot2

	slot3(slot4, slot5, slot6)

	slot3 = slot0.commanderFormationPanel
	slot4 = slot3
	slot3 = slot3.open

	slot3(slot4)
end

slot0.openCommanderPanel = slot2

function slot2(slot0)
	slot1 = slot0.commanderFormationPanel
	slot2 = slot1
	slot1 = slot1.close

	slot1(slot2)
end

slot0.closeCommanderPanel = slot2

function slot2(slot0, slot1)
	slot2 = ipairs
	slot3 = slot1
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot0
		slot7 = slot0.addMsg
		slot9 = slot6

		slot7(slot8, slot9)
	end
end

slot0.initMsg = slot2

function slot2(slot0, slot1)
	slot2 = slot0.msgPanel
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "word_panel/list"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0.msgPanel
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "word_panel/pool"
	slot3 = slot3(slot4, slot5)
	slot4 = slot3.childCount

	if slot4 == 0 then
		slot4 = setParent
		slot6 = slot2
		slot5 = slot2.GetChild
		slot7 = 0
		slot5 = slot5(slot6, slot7)
		slot6 = slot3

		slot4(slot5, slot6)
	end

	slot5 = slot3
	slot4 = slot3.GetChild
	slot6 = 0
	slot4 = slot4(slot5, slot6)
	slot5 = setText
	slot6 = slot4
	slot7 = i18n
	slot8 = "world_boss_tip"
	slot9 = slot1.name
	slot10 = slot1.score

	slot5(slot6, slot7(slot8, slot9, slot10))

	slot5 = setParent
	slot6 = slot4
	slot7 = slot2

	slot5(slot6, slot7)
end

slot0.addMsg = slot2

function slot2(slot0, slot1, slot2)
	slot3 = nil
	slot4 = 1
	slot5 = 3
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot8 = slot0.rankTF
		slot9 = slot8
		slot8 = slot8.GetChild
		slot10 = slot7 - 1
		slot8 = slot8(slot9, slot10)
		slot3 = slot8
		slot8 = setActive
		slot9 = slot3
		slot10 = slot1[slot7]

		slot8(slot9, slot10)

		slot8 = slot1[slot7]

		if slot8 then
			slot8 = Ship
			slot8 = slot8.New
			slot9 = {}
			slot10 = slot1[slot7]
			slot10 = slot10.icon
			slot9.configId = slot10
			slot10 = slot1[slot7]
			slot10 = slot10.skinId
			slot9.skin_id = slot10
			slot8 = slot8(slot9)
			slot9 = slot1[slot7]
			slot9 = slot9.remoulded
			slot8.remoulded = slot9
			slot10 = slot8
			slot9 = slot8.getPainting
			slot9 = slot9(slot10)
			slot10 = GetImageSpriteFromAtlasAsync
			slot11 = "SquareIcon/"
			slot12 = slot9
			slot11 = slot11 .. slot12
			slot12 = ""
			slot14 = slot3
			slot13 = slot3.Find
			slot15 = "icon"

			slot10(slot11, slot12, slot13(slot14, slot15))

			slot10 = setText
			slot12 = slot3
			slot11 = slot3.Find
			slot13 = "name"
			slot11 = slot11(slot12, slot13)
			slot12 = slot1[slot7]
			slot12 = slot12.name

			slot10(slot11, slot12)
		end
	end
end

slot0.setRank = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.hideFleetEdit

	slot1(slot2)
end

slot0.willExit = slot2

return slot0
