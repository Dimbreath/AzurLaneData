slot0 = class
slot1 = "ChallengeMainScene"
slot2 = import
slot3 = "..base.BaseUI"
slot0 = slot0(slot1, slot2(slot3))
slot1 = 5
slot0.BOSS_NUM = slot1
slot1 = 5
slot0.FADE_TIME = slot1

function slot1(slot0)
	slot1 = "ChallengeMainUI"

	return slot1
end

slot0.getUIName = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.findUI

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.initData

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.addListener

	slot1(slot2)
end

slot0.init = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.updateGrade
	slot3 = slot0.challengeInfo
	slot4 = slot3
	slot3 = slot3.getGradeList

	slot1(slot2, slot3(slot4))

	slot2 = slot0
	slot1 = slot0.updateTimePanel

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.updateSwitchModBtn

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.updateAwardPanel

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.updatePaintingList
	slot3 = slot0.nameList
	slot4 = slot0.showingIndex

	slot1(slot2, slot3, slot4)

	slot2 = slot0
	slot1 = slot0.updateRoundText
	slot3 = slot0.showingIndex

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.updateSlider
	slot3 = slot0.showingIndex

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.updateFuncBtns

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.showSLResetMsgBox

	slot1(slot2)

	slot1 = slot0.contextData
	slot1 = slot1.editFleet

	if slot1 then
		slot2 = slot0
		slot1 = slot0.doOnFleetPanel

		slot1(slot2)

		slot1 = slot0.contextData
		slot2 = nil
		slot1.editFleet = slot2
	end

	slot2 = slot0
	slot1 = slot0.tryPlayGuide

	slot1(slot2)
end

slot0.didEnter = slot1

function slot1(slot0)
	slot1 = LeanTween
	slot1 = slot1.cancel
	slot2 = go
	slot3 = slot0.modTipTF

	slot1(slot2(slot3))

	slot1 = slot0.timer

	if slot1 then
		slot1 = slot0.timer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)
	end
end

slot0.willExit = slot1

function slot1(slot0)
	slot1 = isActive
	slot2 = slot0.fleetSelect
	slot1 = slot1(slot2)

	if slot1 then
		slot2 = slot0
		slot1 = slot0.hideFleetEdit

		slot1(slot2)
	else
		slot1 = triggerButton
		slot2 = slot0.backBtn

		slot1(slot2)
	end
end

slot0.onBackPressed = slot1

function slot1(slot0, slot1)
	slot2 = {}
	slot0.fleets = slot2

	function slot2(slot0)
		slot1 = slot0
		slot1 = slot1.fleets
		slot2 = {}
		slot3 = slot1
		slot4 = slot0 + 1
		slot3 = slot3[slot4]
		slot2[1] = slot3
		slot3 = slot1
		slot4 = slot0 + 11
		slot3 = slot3[slot4]
		slot2[11] = slot3
		slot1[slot0] = slot2
	end

	slot3 = slot2
	slot4 = ChallengeProxy
	slot4 = slot4.MODE_CASUAL

	slot3(slot4)

	slot3 = slot2
	slot4 = ChallengeProxy
	slot4 = slot4.MODE_INFINITE

	slot3(slot4)
end

slot0.setFleet = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ForNorth"
	slot1 = slot1(slot2, slot3)
	slot0.northTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "PaintingList"
	slot1 = slot1(slot2, slot3)
	slot0.paintingListTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "top/back_button"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.backBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "GradeContainer"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.gradeContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "SeasonBestPoint/Text"
	slot4 = slot0.gradeContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.seasonBestPointText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ActivityBestPoint/Text"
	slot4 = slot0.gradeContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.activityBestPointText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "SeasonLevelNum/Text"
	slot4 = slot0.gradeContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.seasonLevelNumText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ActivityLevelNum/Text"
	slot4 = slot0.gradeContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.activityLevelNumText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "TimeTip"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.timeTipTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ActivityTimeText"
	slot4 = slot0.timeTipTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.activityTimeText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "SeasonTipText/DayText"
	slot4 = slot0.timeTipTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.seasonDayText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "SeasonTimeText"
	slot4 = slot0.timeTipTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.seasonTimeText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "SwitchMod"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.switchModTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "NormalBtn"
	slot4 = slot0.switchModTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.casualModBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "EndlessBtn"
	slot4 = slot0.switchModTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.infiniteModBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "BG"
	slot4 = slot0.casualModBtn
	slot1 = slot1(slot2, slot3, slot4)
	slot0.casualModBtnBG = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "BG"
	slot4 = slot0.infiniteModBtn
	slot1 = slot1(slot2, slot3, slot4)
	slot0.infiniteModBtnBG = slot1
	slot1 = GetComponent
	slot2 = slot0.casualModBtn
	slot3 = "Button"
	slot1 = slot1(slot2, slot3)
	slot0.casualModBtnSC = slot1
	slot1 = GetComponent
	slot2 = slot0.infiniteModBtn
	slot3 = "Button"
	slot1 = slot1(slot2, slot3)
	slot0.infiniteModBtnSC = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "FunctionBtns"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.functionBtnsTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "RankBtn"
	slot4 = slot0.functionBtnsTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.rankBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "StartBtn"
	slot4 = slot0.functionBtnsTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.startBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ResetBtn"
	slot4 = slot0.functionBtnsTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.resetBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "StartBtnBanned"
	slot4 = slot0.functionBtnsTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.startBtnBanned = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ResetBtnBanned"
	slot4 = slot0.functionBtnsTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.resetBtnBanned = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Award"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.awardTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "HelpBtn"
	slot4 = slot0.awardTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.helpBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "GetBtn"
	slot4 = slot0.awardTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.getBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "GotBtn"
	slot4 = slot0.awardTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.gotBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "GetBtnBanned"
	slot4 = slot0.awardTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.getBtnBanned = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ItemBG/item"
	slot4 = slot0.awardTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.itemTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Score/ScoreText"
	slot4 = slot0.awardTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.scoreText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Slider"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.slider = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "SquareList"
	slot4 = slot0.slider
	slot1 = slot1(slot2, slot3, slot4)
	slot0.squareContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Squre"
	slot4 = slot0.slider
	slot1 = slot1(slot2, slot3, slot4)
	slot0.squareTpl = slot1
	slot1 = UIItemList
	slot1 = slot1.New
	slot2 = slot0.squareContainer
	slot3 = slot0.squareTpl
	slot1 = slot1(slot2, slot3)
	slot0.squareList = slot1
	slot1 = GetComponent
	slot2 = slot0.slider
	slot3 = "Slider"
	slot1 = slot1(slot2, slot3)
	slot0.sliderSC = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "PaintingList"
	slot1 = slot1(slot2, slot3)
	slot0.paintingContainer = slot1
	slot1 = GetComponent
	slot2 = slot0.paintingContainer
	slot3 = "Slider"
	slot1 = slot1(slot2, slot3)
	slot0.scrollSC = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "material"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Image
	slot1 = slot1(slot2, slot3(slot4))
	slot1 = slot1.material
	slot0.material = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "material1"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Image
	slot1 = slot1(slot2, slot3(slot4))
	slot1 = slot1.material
	slot0.material1 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Painting"
	slot4 = slot0.paintingContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.painting = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "PaintingShadow1"
	slot4 = slot0.painting
	slot1 = slot1(slot2, slot3, slot4)
	slot0.paintingShadow1 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "PaintingShadow2"
	slot4 = slot0.painting
	slot1 = slot1(slot2, slot3, slot4)
	slot0.paintingShadow2 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "InfoImg"
	slot4 = slot0.painting
	slot1 = slot1(slot2, slot3, slot4)
	slot0.bossInfoImg = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Round/NumText"
	slot4 = slot0.painting
	slot1 = slot1(slot2, slot3, slot4)
	slot0.roundNumText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "TZ02"
	slot4 = slot0.painting
	slot1 = slot1(slot2, slot3, slot4)
	slot0.completeEffectTF = slot1
	slot1 = SetActive
	slot2 = slot0.completeEffectTF
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Card1"
	slot4 = slot0.paintingContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.card1TF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Mask/ShipPaint"
	slot4 = slot0.card1TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipPaintImg_1 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Tag"
	slot4 = slot0.card1TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.tag_1 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Mask"
	slot4 = slot0.card1TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.mask_1 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Round"
	slot4 = slot0.card1TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.roundTF_1 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Round/RoundText"
	slot4 = slot0.card1TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.roundText_1 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Card2"
	slot4 = slot0.paintingContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.card2TF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Mask/ShipPaint"
	slot4 = slot0.card2TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipPaintImg_2 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Tag"
	slot4 = slot0.card2TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.tag_2 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Mask"
	slot4 = slot0.card2TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.mask_2 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Round"
	slot4 = slot0.card2TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.roundTF_2 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Round/RoundText"
	slot4 = slot0.card2TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.roundText_2 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ModTipBtn"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.modTipBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "TipText"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.modTipTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Text"
	slot4 = slot0.modTipTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.modTipText = slot1
	slot1 = setActive
	slot2 = slot0.modTipText
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "LevelFleetSelectView"
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

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ChallengeMainMediator
		slot2 = slot2.ON_PRECOMBAT
		slot3 = slot0
		slot3 = slot3.curMode

		slot0(slot1, slot2, slot3)
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
end

slot0.findUI = slot1

function slot1(slot0)
	slot1 = pg
	slot1 = slot1.SystemGuideMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.Play
	slot3 = slot0

	slot1(slot2, slot3)
end

slot0.tryPlayGuide = slot1

function slot1(slot0)
	slot1 = getProxy
	slot2 = ChallengeProxy
	slot1 = slot1(slot2)
	slot0.challengeProxy = slot1
	slot1 = slot0.challengeProxy
	slot2 = slot1
	slot1 = slot1.getChallengeInfo
	slot1 = slot1(slot2)
	slot0.challengeInfo = slot1
	slot1 = slot0.challengeProxy
	slot2 = slot1
	slot1 = slot1.getUserChallengeInfoList
	slot1 = slot1(slot2)
	slot0.userChallengeInfoList = slot1
	slot1 = false
	slot0.timeOverTag = slot1
	slot2 = slot0
	slot1 = slot0.updateData

	slot1(slot2)

	slot1 = true
	slot0.openedCommanerSystem = slot1
end

slot0.initData = slot1

function slot1(slot0)
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
		slot3 = slot3.challenge_help
		slot3 = slot3.tip
		slot2.helps = slot3

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.rankBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ChallengeMainMediator
		slot2 = slot2.ON_OPEN_RANK

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.startBtn

	function slot4()
		slot0 = getProxy
		slot1 = ActivityProxy
		slot0 = slot0(slot1)
		slot1 = slot0
		slot0 = slot0.getActivityByType
		slot2 = ActivityConst
		slot2 = slot2.ACTIVITY_TYPE_CHALLENGE
		slot0 = slot0(slot1, slot2)

		if slot0 then
			slot2 = slot0
			slot1 = slot0.isEnd
			slot1 = slot1(slot2)

			if slot1 then
				slot1 = pg
				slot1 = slot1.TipsMgr
				slot1 = slot1.GetInstance
				slot1 = slot1()
				slot2 = slot1
				slot1 = slot1.ShowTips
				slot3 = i18n
				slot4 = "challenge_end_tip"

				slot1(slot2, slot3(slot4))

				slot1 = triggerButton
				slot2 = slot0
				slot2 = slot2.backBtn

				slot1(slot2)

				return
			end
		end

		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.isCrossedSeason
		slot1 = slot1(slot2)

		if slot1 == true then
			slot1 = slot0
			slot1 = slot1.challengeProxy
			slot2 = slot1
			slot1 = slot1.getCurMode
			slot1 = slot1(slot2)
			slot2 = slot0
			slot2 = slot2.curModeInfo

			if not slot2 then
				slot2 = pg
				slot2 = slot2.MsgboxMgr
				slot2 = slot2.GetInstance
				slot2 = slot2()
				slot3 = slot2
				slot2 = slot2.ShowMsgBox
				slot4 = {
					hideNo = true
				}
				slot5 = i18n
				slot6 = "challenge_season_update"
				slot5 = slot5(slot6)
				slot4.content = slot5

				function slot5()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = ChallengeConst
					slot2 = slot2.RESET_DATA_EVENT
					slot3 = slot1

					slot0(slot1, slot2, slot3)
				end

				slot4.onYes = slot5

				function slot5()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = ChallengeConst
					slot2 = slot2.RESET_DATA_EVENT
					slot3 = slot1

					slot0(slot1, slot2, slot3)
				end

				slot4.onNo = slot5

				slot2(slot3, slot4)

				return
			else
				slot2 = (slot1 == ChallengeProxy.MODE_CASUAL and "challenge_season_update_casual_clear") or "challenge_season_update_infinite_clear"
				slot3 = ChallengeProxy.MODE_CASUAL

				if slot1 == slot3 then
					slot3 = slot0
					slot3 = slot3.curModeInfo
					slot4 = slot3
					slot3 = slot3.getScore
					slot3 = slot3(slot4)

					if not slot3 then
						slot3 = slot0
						slot3 = slot3.curModeInfo
						slot4 = slot3
						slot3 = slot3.getLevel
						slot3 = slot3(slot4)
					end
				end

				slot4 = pg
				slot4 = slot4.MsgboxMgr
				slot4 = slot4.GetInstance
				slot4 = slot4()
				slot5 = slot4
				slot4 = slot4.ShowMsgBox
				slot6 = {
					hideNo = false
				}
				slot7 = i18n
				slot8 = slot2
				slot9 = slot3
				slot7 = slot7(slot8, slot9)
				slot6.content = slot7

				function slot7()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = ChallengeConst
					slot2 = slot2.RESET_DATA_EVENT
					slot3 = slot1

					slot0(slot1, slot2, slot3)
				end

				slot6.onNo = slot7

				function slot7()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = ChallengeMainMediator
					slot2 = slot2.ON_PRECOMBAT
					slot3 = slot0
					slot3 = slot3.curMode

					slot0(slot1, slot2, slot3)
				end

				slot6.onYes = slot7

				slot4(slot5, slot6)

				return
			end
		end

		slot1 = slot0
		slot1 = slot1.curModeInfo

		if not slot1 then
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.doOnFleetPanel

			slot1(slot2)

			return
		end

		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.emit
		slot3 = ChallengeMainMediator
		slot3 = slot3.ON_PRECOMBAT
		slot4 = slot0
		slot4 = slot4.curMode

		slot1(slot2, slot3, slot4)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.resetBtn

	function slot4()
		slot0 = pg
		slot0 = slot0.MsgboxMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.ShowMsgBox
		slot2 = {
			hideNo = false
		}
		slot3 = i18n
		slot4 = "challenge_normal_reset"
		slot3 = slot3(slot4)
		slot2.content = slot3

		function slot3()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ChallengeConst
			slot2 = slot2.RESET_DATA_EVENT
			slot3 = slot0
			slot3 = slot3.challengeProxy
			slot4 = slot3
			slot3 = slot3.getCurMode

			slot0(slot1, slot2, slot3(slot4))
		end

		slot2.onYes = slot3

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.modTipBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.showTipText

		slot0(slot1)
	end

	slot1(slot2, slot3, slot4)

	function slot1()
		slot0 = slot0
		slot0 = slot0.showingIndex
		slot1 = ChallengeConst
		slot1 = slot1.BOSS_NUM
		slot0 = slot0 % slot1

		if slot0 == 1 then
			return
		end

		slot0 = slot0
		slot1 = slot0
		slot1 = slot1.showingIndex
		slot1 = slot1 - 1
		slot0.showingIndex = slot1
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updatePaintingList
		slot2 = slot0
		slot2 = slot2.nameList
		slot3 = slot0
		slot3 = slot3.showingIndex

		slot0(slot1, slot2, slot3)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updateRoundText
		slot2 = slot0
		slot2 = slot2.showingIndex

		slot0(slot1, slot2)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updateSlider
		slot2 = slot0
		slot2 = slot2.showingIndex

		slot0(slot1, slot2)
	end

	function slot2()
		slot0 = slot0
		slot0 = slot0.showingIndex
		slot1 = ChallengeConst
		slot1 = slot1.BOSS_NUM
		slot0 = slot0 % slot1

		if slot0 == 0 then
			return
		end

		slot0 = slot0
		slot1 = slot0
		slot1 = slot1.showingIndex
		slot1 = slot1 + 1
		slot0.showingIndex = slot1
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updatePaintingList
		slot2 = slot0
		slot2 = slot2.nameList
		slot3 = slot0
		slot3 = slot3.showingIndex

		slot0(slot1, slot2, slot3)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updateRoundText
		slot2 = slot0
		slot2 = slot2.showingIndex

		slot0(slot1, slot2)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updateSlider
		slot2 = slot0
		slot2 = slot2.showingIndex

		slot0(slot1, slot2)
	end

	slot3 = addSlip
	slot4 = SLIP_TYPE_HRZ
	slot5 = slot0.paintingContainer
	slot6 = slot1
	slot7 = slot2

	slot3(slot4, slot5, slot6, slot7)
end

slot0.addListener = slot1

function slot1(slot0)
	slot1 = slot0.challengeProxy
	slot2 = slot1
	slot1 = slot1.getCurMode
	slot1 = slot1(slot2)
	slot0.curMode = slot1
	slot1 = slot0.userChallengeInfoList
	slot2 = slot0.curMode
	slot1 = slot1[slot2]
	slot0.curModeInfo = slot1
	slot1 = false
	slot0.timeOverTag = slot1
	slot1 = slot0.curModeInfo

	if not slot1 then
		slot1 = 1
		slot0.curLevel = slot1
		slot1 = slot0.curLevel
		slot0.showingIndex = slot1
		slot1 = slot0.curMode
		slot2 = ChallengeProxy
		slot2 = slot2.MODE_CASUAL

		if slot1 == slot2 then
			slot1 = slot0.challengeInfo
			slot2 = slot1
			slot1 = slot1.getDungeonIDList
			slot1 = slot1(slot2)
			slot0.dungeonIDList = slot1
		else
			slot1 = slot0.curMode
			slot2 = ChallengeProxy
			slot2 = slot2.MODE_INFINITE

			if slot1 == slot2 then
				slot1 = slot0.challengeInfo
				slot2 = slot1
				slot1 = slot1.getSeasonID
				slot1 = slot1(slot2)
				slot2 = slot0.challengeInfo
				slot3 = slot2
				slot2 = slot2.getActivityIndex
				slot2 = slot2(slot3)
				slot3 = pg
				slot3 = slot3.activity_event_challenge
				slot3 = slot3[slot2]
				slot3 = slot3.infinite_stage
				slot3 = slot3[slot1]
				slot3 = slot3[1]
				slot0.dungeonIDList = slot3
			end
		end
	else
		slot1 = slot0.curModeInfo
		slot2 = slot1
		slot1 = slot1.getLevel
		slot1 = slot1(slot2)
		slot0.curLevel = slot1
		slot1 = slot0.curLevel
		slot0.showingIndex = slot1
		slot1 = slot0.curModeInfo
		slot2 = slot1
		slot1 = slot1.getDungeonIDList
		slot1 = slot1(slot2)
		slot0.dungeonIDList = slot1
	end

	slot1 = {}
	slot0.nameList = slot1
	slot1 = {}
	slot0.infoNameList = slot1
	slot1 = ipairs
	slot2 = slot0.dungeonIDList
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = pg
		slot6 = slot6.expedition_challenge_template
		slot6 = slot6[slot5]
		slot6 = slot6.char_icon
		slot6 = slot6[1]
		slot7 = slot0.nameList
		slot7[slot4] = slot6
		slot7 = pg
		slot7 = slot7.expedition_challenge_template
		slot7 = slot7[slot5]
		slot7 = slot7.name_p
		slot8 = slot0.infoNameList
		slot8[slot4] = slot7
	end

	slot1 = {}
	slot0.nextNameList = slot1
	slot1 = slot0.curMode
	slot2 = ChallengeProxy
	slot2 = slot2.MODE_INFINITE

	if slot1 == slot2 then
		slot1 = nil
		slot2 = slot0.curModeInfo

		if slot2 then
			slot2 = slot0.curModeInfo
			slot3 = slot2
			slot2 = slot2.getNextInfiniteDungeonIDList
			slot2 = slot2(slot3)
			slot1 = slot2
		else
			slot2 = slot0.challengeInfo
			slot3 = slot2
			slot2 = slot2.getSeasonID
			slot2 = slot2(slot3)
			slot3 = slot0.challengeInfo
			slot4 = slot3
			slot3 = slot3.getActivityIndex
			slot3 = slot3(slot4)
			slot4 = pg
			slot4 = slot4.activity_event_challenge
			slot4 = slot4[slot3]
			slot4 = slot4.infinite_stage
			slot4 = slot4[slot2]
			slot4 = slot4[2]

			if slot4 then
				slot4 = pg
				slot4 = slot4.activity_event_challenge
				slot4 = slot4[slot3]
				slot4 = slot4.infinite_stage
				slot4 = slot4[slot2]
				slot1 = slot4[2]
			else
				slot4 = pg
				slot4 = slot4.activity_event_challenge
				slot4 = slot4[slot3]
				slot4 = slot4.infinite_stage
				slot4 = slot4[slot2]
				slot1 = slot4[1]
			end
		end

		slot2 = ipairs
		slot3 = slot1
		slot2, slot3, slot4 = slot2(slot3)

		for slot5, slot6 in slot2, slot3, slot4 do
			slot7 = pg
			slot7 = slot7.expedition_challenge_template
			slot7 = slot7[slot6]
			slot7 = slot7.char_icon
			slot7 = slot7[1]
			slot8 = slot0.nextNameList
			slot9 = ChallengeConst
			slot9 = slot9.BOSS_NUM
			slot9 = slot5 + slot9
			slot8[slot9] = slot7
		end
	end
end

slot0.updateData = slot1

function slot1(slot0, slot1, slot2)
	slot3 = slot1 or slot0.nameList
	slot5 = slot0.curLevel

	if ChallengeConst.BOSS_NUM < (slot2 or slot0.showingIndex) then
		slot6 = ChallengeConst
		slot6 = slot6.BOSS_NUM
		slot6 = slot4 % slot6

		if slot6 == 0 then
			slot6 = ChallengeConst
			slot6 = slot6.BOSS_NUM

			if not slot6 then
				slot6 = ChallengeConst
				slot6 = slot6.BOSS_NUM
				slot4 = slot4 % slot6
			end
		end
	end

	slot6 = slot0.curMode
	slot7 = ChallengeProxy
	slot7 = slot7.MODE_INFINITE

	if slot6 == slot7 then
		slot6 = ChallengeConst
		slot6 = slot6.BOSS_NUM

		if slot6 < slot5 then
			slot6 = ChallengeConst
			slot6 = slot6.BOSS_NUM
			slot6 = slot5 % slot6

			if slot6 == 0 then
				slot6 = ChallengeConst
				slot6 = slot6.BOSS_NUM

				if not slot6 then
					slot6 = ChallengeConst
					slot6 = slot6.BOSS_NUM
					slot5 = slot5 % slot6
				end
			end
		end
	end

	function slot6(slot0)
		slot1 = slot0.material
		slot2 = slot1
		slot1 = slot1.SetFloat
		slot3 = "_LineGray"
		slot4 = 0.3

		slot1(slot2, slot3, slot4)

		slot1 = slot0.material
		slot2 = slot1
		slot1 = slot1.SetFloat
		slot3 = "_TearDistance"
		slot4 = 0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.cancel
		slot2 = slot0.gameObject

		slot1(slot2)

		slot1 = LeanTween
		slot1 = slot1.value
		slot2 = slot0.gameObject
		slot3 = 0
		slot4 = 2
		slot5 = 2
		slot1 = slot1(slot2, slot3, slot4, slot5)
		slot2 = slot1
		slot1 = slot1.setLoopClamp
		slot1 = slot1(slot2)
		slot2 = slot1
		slot1 = slot1.setOnUpdate
		slot3 = System
		slot3 = slot3.Action_float

		function slot4(slot0)
			slot1 = 1.2

			if slot0 >= slot1 then
				slot1 = slot0
				slot1 = slot1.material
				slot2 = slot1
				slot1 = slot1.SetFloat
				slot3 = "_LineGray"
				slot4 = 0.3

				slot1(slot2, slot3, slot4)
			else
				slot1 = 1.1

				if slot0 >= slot1 then
					slot1 = slot0
					slot1 = slot1.material
					slot2 = slot1
					slot1 = slot1.SetFloat
					slot3 = "_LineGray"
					slot4 = 0.45

					slot1(slot2, slot3, slot4)
				else
					slot1 = 1.03

					if slot0 >= slot1 then
						slot1 = slot0
						slot1 = slot1.material
						slot2 = slot1
						slot1 = slot1.SetFloat
						slot3 = "_TearDistance"
						slot4 = 0

						slot1(slot2, slot3, slot4)
					else
						slot1 = 1

						if slot0 >= slot1 then
							slot1 = slot0
							slot1 = slot1.material
							slot2 = slot1
							slot1 = slot1.SetFloat
							slot3 = "_TearDistance"
							slot4 = 0.3

							slot1(slot2, slot3, slot4)
						else
							slot1 = 0.35

							if slot0 >= slot1 then
								slot1 = slot0
								slot1 = slot1.material
								slot2 = slot1
								slot1 = slot1.SetFloat
								slot3 = "_LineGray"
								slot4 = 0.3

								slot1(slot2, slot3, slot4)
							else
								slot1 = 0.3

								if slot0 >= slot1 then
									slot1 = slot0
									slot1 = slot1.material
									slot2 = slot1
									slot1 = slot1.SetFloat
									slot3 = "_LineGray"
									slot4 = 0.4

									slot1(slot2, slot3, slot4)
								else
									slot1 = 0.25

									if slot0 >= slot1 then
										slot1 = slot0
										slot1 = slot1.material
										slot2 = slot1
										slot1 = slot1.SetFloat
										slot3 = "_LineGray"
										slot4 = 0.3

										slot1(slot2, slot3, slot4)
									else
										slot1 = 0.2

										if slot0 >= slot1 then
											slot1 = slot0
											slot1 = slot1.material
											slot2 = slot1
											slot1 = slot1.SetFloat
											slot3 = "_LineGray"
											slot4 = 0.4

											slot1(slot2, slot3, slot4)
										end
									end
								end
							end
						end
					end
				end
			end
		end

		slot1(slot2, slot3(slot4))
	end

	slot7 = setPaintingPrefabAsync
	slot8 = slot0.painting
	slot9 = slot3[slot4]
	slot10 = "chuanwu"

	function slot11()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.findTF
		slot2 = "fitter"
		slot3 = slot0
		slot3 = slot3.painting
		slot0 = slot0(slot1, slot2, slot3)
		slot1 = slot0
		slot0 = slot0.GetChild
		slot2 = 0
		slot0 = slot0(slot1, slot2)

		if slot0 then
			SetActive(slot0.completeEffectTF, slot1 - 1 - () >= 0)

			if slot2 then
				slot3 = slot0
				slot3 = slot3.material1
				slot1.material = slot3
				slot3 = slot1.material
				slot4 = slot3
				slot3 = slot3.SetFloat
				slot5 = "_LineDensity"
				slot6 = 7

				slot3(slot4, slot5, slot6)

				slot3 = slot3
				slot4 = slot1

				slot3(slot4)
			else
				slot3 = slot0
				slot3 = slot3.material
				slot1.material = slot3
				slot3 = slot1.material
				slot4 = slot3
				slot3 = slot3.SetFloat
				slot5 = "_Range"
				slot6 = 16

				slot3(slot4, slot5, slot6)

				slot3 = slot1.material
				slot4 = slot3
				slot3 = slot3.SetFloat
				slot5 = "_Degree"
				slot6 = 7

				slot3(slot4, slot5, slot6)
			end
		end
	end

	slot7(slot8, slot9, slot10, slot11)

	slot7 = setPaintingPrefabAsync
	slot8 = slot0.paintingShadow1
	slot9 = slot3[slot4]
	slot10 = "chuanwu"

	function slot11()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.findTF
		slot2 = "fitter"
		slot3 = slot0
		slot3 = slot3.paintingShadow1
		slot0 = slot0(slot1, slot2, slot3)
		slot1 = slot0
		slot0 = slot0.GetChild
		slot2 = 0
		slot0 = slot0(slot1, slot2)

		if slot0 then
			slot2 = slot0
			slot1 = slot0.GetComponent
			slot3 = "Image"
			slot1 = slot1(slot2, slot3)
			slot2 = Color
			slot2 = slot2.New
			slot3 = 0
			slot4 = 0
			slot5 = 0
			slot6 = 0.44
			slot2 = slot2(slot3, slot4, slot5, slot6)
			slot1.color = slot2
		end
	end

	slot7(slot8, slot9, slot10, slot11)

	slot7 = setPaintingPrefabAsync
	slot8 = slot0.paintingShadow2
	slot9 = slot3[slot4]
	slot10 = "chuanwu"

	function slot11()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.findTF
		slot2 = "fitter"
		slot3 = slot0
		slot3 = slot3.paintingShadow2
		slot0 = slot0(slot1, slot2, slot3)
		slot1 = slot0
		slot0 = slot0.GetChild
		slot2 = 0
		slot0 = slot0(slot1, slot2)

		if slot0 then
			slot2 = slot0
			slot1 = slot0.GetComponent
			slot3 = "Image"
			slot1 = slot1(slot2, slot3)
			slot2 = Color
			slot2 = slot2.New
			slot3 = 1
			slot4 = 1
			slot5 = 1
			slot6 = 0.15
			slot2 = slot2(slot3, slot4, slot5, slot6)
			slot1.color = slot2
		end
	end

	slot7(slot8, slot9, slot10, slot11)

	slot7 = LoadSpriteAsync
	slot8 = "ChallengeBossInfo/"
	slot9 = slot0.infoNameList
	slot9 = slot9[slot4]
	slot8 = slot8 .. slot9

	function slot9(slot0)
		slot1 = setImageSprite
		slot2 = slot0
		slot2 = slot2.bossInfoImg
		slot3 = slot0
		slot4 = true

		slot1(slot2, slot3, slot4)
	end

	slot7(slot8, slot9)

	slot7 = slot0
	slot7 = slot7.BOSS_NUM
	slot7 = slot7 - slot4
	slot8 = 2

	if slot7 >= slot8 then
		slot7 = setActive
		slot8 = slot0.roundTF_1
		slot9 = true

		slot7(slot8, slot9)

		slot7 = setActive
		slot8 = slot0.roundTF_2
		slot9 = true

		slot7(slot8, slot9)

		slot7 = setActive
		slot8 = slot0.mask_1
		slot9 = true

		slot7(slot8, slot9)

		slot7 = setActive
		slot8 = slot0.mask_2
		slot9 = true

		slot7(slot8, slot9)

		slot7 = LoadSpriteAsync
		slot8 = "shipYardIcon/"
		slot9 = slot4 + 1
		slot9 = slot3[slot9]
		slot8 = slot8 .. slot9

		function slot9(slot0)
			slot1 = setImageSprite
			slot2 = slot0
			slot2 = slot2.shipPaintImg_1
			slot3 = slot0

			slot1(slot2, slot3)
		end

		slot7(slot8, slot9)

		slot7 = LoadSpriteAsync
		slot8 = "shipYardIcon/"
		slot9 = slot4 + 2
		slot9 = slot3[slot9]
		slot8 = slot8 .. slot9

		function slot9(slot0)
			slot1 = setImageSprite
			slot2 = slot0
			slot2 = slot2.shipPaintImg_2
			slot3 = slot0

			slot1(slot2, slot3)
		end

		slot7(slot8, slot9)
	else
		slot7 = slot0
		slot7 = slot7.BOSS_NUM
		slot7 = slot7 - slot4

		if slot7 == 1 then
			slot7 = setActive
			slot8 = slot0.roundTF_1
			slot9 = true

			slot7(slot8, slot9)

			slot7 = setActive
			slot8 = slot0.roundTF_2
			slot9 = false

			slot7(slot8, slot9)

			slot7 = setActive
			slot8 = slot0.mask_1
			slot9 = true

			slot7(slot8, slot9)

			slot7 = setActive
			slot8 = slot0.mask_2
			slot9 = false

			slot7(slot8, slot9)

			slot7 = LoadSpriteAsync
			slot8 = "shipYardIcon/"
			slot9 = slot4 + 1
			slot9 = slot3[slot9]
			slot8 = slot8 .. slot9

			function slot9(slot0)
				slot1 = setImageSprite
				slot2 = slot0
				slot2 = slot2.shipPaintImg_1
				slot3 = slot0

				slot1(slot2, slot3)
			end

			slot7(slot8, slot9)

			slot7 = slot0.curMode
			slot8 = ChallengeProxy
			slot8 = slot8.MODE_INFINITE

			if slot7 == slot8 then
				slot7 = LoadSpriteAsync
				slot8 = "shipYardIcon/"
				slot9 = slot0.nextNameList
				slot10 = slot4 + 2
				slot9 = slot9[slot10]
				slot8 = slot8 .. slot9

				function slot9(slot0)
					slot1 = setImageSprite
					slot2 = slot0
					slot2 = slot2.shipPaintImg_2
					slot3 = slot0

					slot1(slot2, slot3)

					slot1 = setActive
					slot2 = slot0
					slot2 = slot2.mask_2
					slot3 = true

					slot1(slot2, slot3)

					slot1 = setActive
					slot2 = slot0
					slot2 = slot2.roundTF_2
					slot3 = true

					slot1(slot2, slot3)
				end

				slot7(slot8, slot9)
			end
		else
			slot7 = setActive
			slot8 = slot0.roundTF_1
			slot9 = false

			slot7(slot8, slot9)

			slot7 = setActive
			slot8 = slot0.roundTF_2
			slot9 = false

			slot7(slot8, slot9)

			slot7 = setActive
			slot8 = slot0.mask_1
			slot9 = false

			slot7(slot8, slot9)

			slot7 = setActive
			slot8 = slot0.mask_2
			slot9 = false

			slot7(slot8, slot9)

			slot7 = slot0.curMode
			slot8 = ChallengeProxy
			slot8 = slot8.MODE_INFINITE

			if slot7 == slot8 then
				slot7 = LoadSpriteAsync
				slot8 = "shipYardIcon/"
				slot9 = slot0.nextNameList
				slot10 = slot4 + 1
				slot9 = slot9[slot10]
				slot8 = slot8 .. slot9

				function slot9(slot0)
					slot1 = setImageSprite
					slot2 = slot0
					slot2 = slot2.shipPaintImg_1
					slot3 = slot0

					slot1(slot2, slot3)

					slot1 = setActive
					slot2 = slot0
					slot2 = slot2.mask_1
					slot3 = true

					slot1(slot2, slot3)

					slot1 = setActive
					slot2 = slot0
					slot2 = slot2.roundTF_1
					slot3 = true

					slot1(slot2, slot3)
				end

				slot7(slot8, slot9)

				slot7 = LoadSpriteAsync
				slot8 = "shipYardIcon/"
				slot9 = slot0.nextNameList
				slot10 = slot4 + 2
				slot9 = slot9[slot10]
				slot8 = slot8 .. slot9

				function slot9(slot0)
					slot1 = setImageSprite
					slot2 = slot0
					slot2 = slot2.shipPaintImg_2
					slot3 = slot0

					slot1(slot2, slot3)

					slot1 = setActive
					slot2 = slot0
					slot2 = slot2.mask_2
					slot3 = true

					slot1(slot2, slot3)

					slot1 = setActive
					slot2 = slot0
					slot2 = slot2.roundTF_2
					slot3 = true

					slot1(slot2, slot3)
				end

				slot7(slot8, slot9)
			end
		end
	end

	slot7 = slot5 - 1
	slot7 = slot7 - slot4
	slot8 = 2

	if slot7 >= slot8 then
		slot7 = setActive
		slot8 = slot0.tag_1
		slot9 = true

		slot7(slot8, slot9)

		slot7 = setActive
		slot8 = slot0.tag_2
		slot9 = true

		slot7(slot8, slot9)
	else
		slot7 = slot5 - 1
		slot7 = slot7 - slot4

		if slot7 == 1 then
			slot7 = setActive
			slot8 = slot0.tag_1
			slot9 = true

			slot7(slot8, slot9)

			slot7 = setActive
			slot8 = slot0.tag_2
			slot9 = false

			slot7(slot8, slot9)
		else
			slot7 = slot5 - 1
			slot7 = slot7 - slot4
			slot8 = 0

			if slot7 <= slot8 then
				slot7 = setActive
				slot8 = slot0.tag_1
				slot9 = false

				slot7(slot8, slot9)

				slot7 = setActive
				slot8 = slot0.tag_2
				slot9 = false

				slot7(slot8, slot9)
			end
		end
	end
end

slot0.updatePaintingList = slot1

function slot1(slot0, slot1)
	slot2 = slot1 or slot0.showingIndex
	slot3 = slot0.curMode
	slot4 = ChallengeProxy.MODE_CASUAL

	if slot3 == slot4 then
		slot3 = ChallengeConst
		slot3 = slot3.BOSS_NUM

		if slot3 < slot2 then
			slot3 = ChallengeConst
			slot3 = slot3.BOSS_NUM
			slot3 = slot2 % slot3

			if slot3 == 0 then
				slot3 = ChallengeConst
				slot3 = slot3.BOSS_NUM

				if not slot3 then
					slot3 = ChallengeConst
					slot3 = slot3.BOSS_NUM
					slot2 = slot2 % slot3
				end
			end
		end
	end

	slot3 = setText
	slot4 = slot0.roundNumText
	slot5 = string
	slot5 = slot5.format
	slot6 = "%02d"
	slot7 = slot2

	slot3(slot4, slot5(slot6, slot7))

	slot3 = setText
	slot4 = slot0.roundText_1
	slot5 = "Round"
	slot6 = slot2 + 1
	slot5 = slot5 .. slot6

	slot3(slot4, slot5)

	slot3 = setText
	slot4 = slot0.roundText_2
	slot5 = "Round"
	slot6 = slot2 + 2
	slot5 = slot5 .. slot6

	slot3(slot4, slot5)
end

slot0.updateRoundText = slot1

function slot1(slot0, slot1)
	slot3 = slot0.curLevel

	if ChallengeConst.BOSS_NUM < (slot1 or slot0.showingIndex) then
		slot4 = ChallengeConst
		slot4 = slot4.BOSS_NUM
		slot4 = slot2 % slot4

		if slot4 == 0 then
			slot4 = ChallengeConst
			slot4 = slot4.BOSS_NUM

			if not slot4 then
				slot4 = ChallengeConst
				slot4 = slot4.BOSS_NUM
				slot2 = slot2 % slot4
			end
		end
	end

	slot4 = slot0.curMode
	slot5 = ChallengeProxy
	slot5 = slot5.MODE_INFINITE

	if slot4 == slot5 then
		slot4 = ChallengeConst
		slot4 = slot4.BOSS_NUM

		if slot4 < slot3 then
			slot4 = ChallengeConst
			slot4 = slot4.BOSS_NUM
			slot4 = slot3 % slot4

			if slot4 == 0 then
				slot4 = ChallengeConst
				slot4 = slot4.BOSS_NUM

				if not slot4 then
					slot4 = ChallengeConst
					slot4 = slot4.BOSS_NUM
					slot3 = slot3 % slot4
				end
			end
		end
	end

	slot4 = ChallengeConst
	slot4 = slot4.BOSS_NUM
	slot4 = slot4 - 1
	slot4 = 1 / slot4
	slot5 = slot3 - 1
	slot5 = slot5 * slot4
	slot6 = slot0.sliderSC
	slot6.value = slot5
	slot6 = slot0.squareList
	slot7 = slot6
	slot6 = slot6.make

	function slot8(slot0, slot1, slot2)
		slot3 = slot0
		slot4 = slot3
		slot3 = slot3.findTF
		slot5 = "UnFinished"
		slot6 = slot2
		slot3 = slot3(slot4, slot5, slot6)
		slot4 = slot0
		slot5 = slot4
		slot4 = slot4.findTF
		slot6 = "Finished"
		slot7 = slot2
		slot4 = slot4(slot5, slot6, slot7)
		slot5 = slot0
		slot6 = slot5
		slot5 = slot5.findTF
		slot7 = "Challengeing"
		slot8 = slot2
		slot5 = slot5(slot6, slot7, slot8)
		slot6 = slot0
		slot7 = slot6
		slot6 = slot6.findTF
		slot8 = "Arrow"
		slot9 = slot2
		slot6 = slot6(slot7, slot8, slot9)

		function slot7()
			slot0 = setActive
			slot1 = slot0
			slot2 = true

			slot0(slot1, slot2)

			slot0 = setActive
			slot1 = slot1
			slot2 = false

			slot0(slot1, slot2)

			slot0 = setActive
			slot1 = slot2
			slot2 = false

			slot0(slot1, slot2)
		end

		function slot8()
			slot0 = setActive
			slot1 = slot0
			slot2 = false

			slot0(slot1, slot2)

			slot0 = setActive
			slot1 = slot1
			slot2 = true

			slot0(slot1, slot2)

			slot0 = setActive
			slot1 = slot2
			slot2 = false

			slot0(slot1, slot2)
		end

		function slot9()
			slot0 = setActive
			slot1 = slot0
			slot2 = false

			slot0(slot1, slot2)

			slot0 = setActive
			slot1 = slot1
			slot2 = false

			slot0(slot1, slot2)

			slot0 = setActive
			slot1 = slot2
			slot2 = true

			slot0(slot1, slot2)
		end

		slot10 = UIItemList
		slot10 = slot10.EventUpdate

		if slot0 == slot10 then
			slot10 = slot1 + 1
			slot11 = slot1

			if slot10 < slot11 then
				slot10 = slot7

				slot10()
			else
				slot10 = slot1 + 1
				slot11 = slot1

				if slot10 == slot11 then
					slot10 = slot9

					slot10()
				else
					slot10 = slot1 + 1
					slot11 = slot1

					if slot11 < slot10 then
						slot10 = slot8

						slot10()
					end
				end
			end

			slot10 = slot1 + 1
			slot11 = slot2

			if slot10 == slot11 then
				slot10 = setActive
				slot11 = slot6
				slot12 = true

				slot10(slot11, slot12)
			else
				slot10 = setActive
				slot11 = slot6
				slot12 = false

				slot10(slot11, slot12)
			end
		end
	end

	slot6(slot7, slot8)

	slot6 = slot0.squareList
	slot7 = slot6
	slot6 = slot6.align
	slot8 = ChallengeConst
	slot8 = slot8.BOSS_NUM

	slot6(slot7, slot8)
end

slot0.updateSlider = slot1

function slot1(slot0, slot1)
	slot2 = setText
	slot3 = slot0.seasonBestPointText
	slot4 = slot1.seasonMaxScore

	slot2(slot3, slot4)

	slot2 = setText
	slot3 = slot0.activityBestPointText
	slot4 = slot1.activityMaxScore

	slot2(slot3, slot4)

	slot2 = setText
	slot3 = slot0.seasonLevelNumText
	slot4 = slot1.seasonMaxLevel

	slot2(slot3, slot4)

	slot2 = setText
	slot3 = slot0.activityLevelNumText
	slot4 = slot1.activityMaxLevel

	slot2(slot3, slot4)
end

slot0.updateGrade = slot1

function slot1(slot0)
	slot1 = getProxy
	slot2 = ActivityProxy
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.getActivityByType
	slot4 = ActivityConst
	slot4 = slot4.ACTIVITY_TYPE_CHALLENGE
	slot2 = slot2(slot3, slot4)
	slot3 = slot2.stopTime
	slot4 = pg
	slot4 = slot4.TimeMgr
	slot4 = slot4.GetInstance
	slot4 = slot4()
	slot5 = slot4
	slot4 = slot4.STimeDescS
	slot6 = slot3
	slot7 = "%Y.%m.%d"
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = setText
	slot6 = slot0.activityTimeText
	slot7 = slot4

	slot5(slot6, slot7)

	slot5 = pg
	slot5 = slot5.TimeMgr
	slot5 = slot5.GetInstance
	slot5 = slot5()
	slot7 = slot5
	slot6 = slot5.GetNextWeekTime
	slot8 = 1
	slot9 = 0
	slot10 = 0
	slot11 = 0
	slot6 = slot6(slot7, slot8, slot9, slot10, slot11)
	slot8 = slot5
	slot7 = slot5.GetServerTime
	slot7 = slot7(slot8)
	slot6 = slot6 - slot7
	slot8 = slot5
	slot7 = slot5.parseTimeFrom
	slot9 = slot6
	slot7, slot8, slot9, slot10 = slot7(slot8, slot9)
	slot11 = setText
	slot12 = slot0.seasonDayText
	slot13 = slot7

	slot11(slot12, slot13)

	slot11 = setText
	slot12 = slot0.seasonTimeText
	slot13 = string
	slot13 = slot13.format
	slot14 = "%02d:%02d:%02d"
	slot15 = slot8
	slot16 = slot9
	slot17 = slot10

	slot11(slot12, slot13(slot14, slot15, slot16, slot17))

	slot11 = slot0.timer

	if slot11 then
		slot11 = slot0.timer
		slot12 = slot11
		slot11 = slot11.Stop

		slot11(slot12)
	end

	slot11 = Timer
	slot11 = slot11.New

	function slot12()
		slot0 = slot0
		slot0 = slot0 - 1
		slot0 = slot0
		slot0 = pg
		slot0 = slot0.TimeMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.parseTimeFrom
		slot2 = slot0
		slot0, slot1, slot2, slot3 = slot0(slot1, slot2)
		slot4 = setText
		slot5 = slot1
		slot5 = slot5.seasonDayText
		slot6 = slot0

		slot4(slot5, slot6)

		slot4 = setText
		slot5 = slot1
		slot5 = slot5.seasonTimeText
		slot6 = string
		slot6 = slot6.format
		slot7 = "%02d:%02d:%02d"
		slot8 = slot1
		slot9 = slot2
		slot10 = slot3

		slot4(slot5, slot6(slot7, slot8, slot9, slot10))

		slot4 = slot0
		slot5 = 0

		if slot4 <= slot5 then
			slot4 = slot1
			slot5 = true
			slot4.timeOverTag = slot5
			slot4 = slot1
			slot4 = slot4.timer
			slot5 = slot4
			slot4 = slot4.Stop

			slot4(slot5)
		end
	end

	slot13 = 1
	slot14 = -1
	slot11 = slot11(slot12, slot13, slot14)
	slot0.timer = slot11
	slot11 = slot0.timer
	slot12 = slot11
	slot11 = slot11.Start

	slot11(slot12)
end

slot0.updateTimePanel = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.isFinishedCasualMode
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = setActive
		slot2 = slot0.infiniteModBtn
		slot3 = false

		slot1(slot2, slot3)
	else
		slot1 = setActive
		slot2 = slot0.infiniteModBtn
		slot3 = true

		slot1(slot2, slot3)
	end

	slot1 = slot0.curMode
	slot2 = ChallengeProxy
	slot2 = slot2.MODE_CASUAL

	if slot1 == slot2 then
		slot1 = setActive
		slot2 = slot0.casualModBtnBG
		slot3 = true

		slot1(slot2, slot3)

		slot1 = setActive
		slot2 = slot0.infiniteModBtnBG
		slot3 = false

		slot1(slot2, slot3)
	else
		slot1 = setActive
		slot2 = slot0.casualModBtnBG
		slot3 = false

		slot1(slot2, slot3)

		slot1 = setActive
		slot2 = slot0.infiniteModBtnBG
		slot3 = true

		slot1(slot2, slot3)
	end

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.casualModBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.curMode
		slot1 = ChallengeProxy
		slot1 = slot1.MODE_CASUAL

		if slot0 == slot1 then
			return
		end

		slot0 = slot0
		slot0 = slot0.curModeInfo

		if slot0 then
			function slot1()
				slot0.challengeProxy:setCurMode(ChallengeProxy.MODE_CASUAL)
				setActive(slot0.casualModBtnBG, true)
				setActive(slot0.infiniteModBtnBG, false)
				setActive:updateData()
				setActive.updateData:updatePaintingList(slot0.nameList, slot0.showingIndex)
				setActive.updateData.updatePaintingList:updateRoundText(slot0.showingIndex)
				setActive.updateData.updatePaintingList.updateRoundText:updateSlider(slot0.showingIndex)
				setActive.updateData.updatePaintingList.updateRoundText.updateSlider:updateSwitchModBtn()
				setActive.updateData.updatePaintingList.updateRoundText.updateSlider.updateSwitchModBtn:updateFuncBtns()
				setActive.updateData.updatePaintingList.updateRoundText.updateSlider.updateSwitchModBtn.updateFuncBtns:showTipText()
			end

			slot2 = slot0:isCrossedSeason()

			if slot2 then
				slot2 = "challenge_season_update_infinite_switch"
				slot3 = slot0
				slot4 = pg
				slot4 = slot4.MsgboxMgr
				slot4 = slot4.GetInstance
				slot4 = slot4()
				slot5 = slot4
				slot4 = slot4.ShowMsgBox
				slot6 = {
					hideNo = false
				}
				slot7 = i18n
				slot8 = slot2
				slot9 = slot3
				slot7 = slot7(slot8, slot9)
				slot6.content = slot7

				function slot7()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = ChallengeConst
					slot2 = slot2.RESET_DATA_EVENT
					slot3 = ChallengeProxy
					slot3 = slot3.MODE_INFINITE

					slot0(slot1, slot2, slot3)
				end

				slot6.onYes = slot7
				slot6.onNo = slot1

				slot4(slot5, slot6)

				return
			end
		end

		slot2 = pg
		slot2 = slot2.MsgboxMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.ShowMsgBox
		slot4 = {
			hideNo = false
		}
		slot5 = i18n
		slot6 = "challenge_infinite_click_switch"
		slot7 = slot0
		slot5 = slot5(slot6, slot7)
		slot4.content = slot5
		slot4.onYes = slot1

		slot2(slot3, slot4)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.infiniteModBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.curMode
		slot1 = ChallengeProxy
		slot1 = slot1.MODE_INFINITE

		if slot0 == slot1 then
			return
		end

		slot0 = slot0
		slot0 = slot0.curModeInfo

		if slot0 then
			slot0 = slot0
			slot0 = slot0.curModeInfo
			slot1 = slot0
			slot0 = slot0.getScore
			slot0 = slot0(slot1)

			if not slot0 then
				slot0 = slot0
				slot0 = slot0.challengeInfo
				slot1 = slot0
				slot0 = slot0.getGradeList
				slot0 = slot0(slot1)
				slot0 = slot0.seasonMaxScore
			end
		end

		function slot1()
			slot0 = slot0
			slot0 = slot0.challengeProxy
			slot1 = slot0
			slot0 = slot0.setCurMode
			slot2 = ChallengeProxy
			slot2 = slot2.MODE_INFINITE

			slot0(slot1, slot2)

			slot0 = setActive
			slot1 = slot0
			slot1 = slot1.casualModBtnBG
			slot2 = false

			slot0(slot1, slot2)

			slot0 = setActive
			slot1 = slot0
			slot1 = slot1.infiniteModBtnBG
			slot2 = true

			slot0(slot1, slot2)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updateData

			slot0(slot1)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updatePaintingList
			slot2 = slot0
			slot2 = slot2.nameList
			slot3 = slot0
			slot3 = slot3.showingIndex

			slot0(slot1, slot2, slot3)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updateRoundText
			slot2 = slot0
			slot2 = slot2.showingIndex

			slot0(slot1, slot2)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updateSlider
			slot2 = slot0
			slot2 = slot2.showingIndex

			slot0(slot1, slot2)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updateFuncBtns

			slot0(slot1)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.showTipText

			slot0(slot1)
		end

		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.isCrossedSeason
		slot2 = slot2(slot3)

		if slot2 then
			slot2 = "challenge_season_update_casual_switch"
			slot3 = slot0
			slot4 = pg
			slot4 = slot4.MsgboxMgr
			slot4 = slot4.GetInstance
			slot4 = slot4()
			slot5 = slot4
			slot4 = slot4.ShowMsgBox
			slot6 = {
				hideNo = false
			}
			slot7 = i18n
			slot8 = slot2
			slot9 = slot3
			slot7 = slot7(slot8, slot9)
			slot6.content = slot7

			function slot7()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = ChallengeConst
				slot2 = slot2.RESET_DATA_EVENT
				slot3 = ChallengeProxy
				slot3 = slot3.MODE_CASUAL

				slot0(slot1, slot2, slot3)
			end

			slot6.onYes = slot7
			slot6.onNo = slot1

			slot4(slot5, slot6)

			return
		end

		slot2 = pg
		slot2 = slot2.MsgboxMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.ShowMsgBox
		slot4 = {
			hideNo = false
		}
		slot5 = i18n
		slot6 = "challenge_casual_click_switch"
		slot7 = slot0
		slot5 = slot5(slot6, slot7)
		slot4.content = slot5
		slot4.onYes = slot1

		slot2(slot3, slot4)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)
end

slot0.updateSwitchModBtn = slot1

function slot1(slot0)
	slot1 = slot0.userChallengeInfoList
	slot2 = slot0.curMode
	slot1 = slot1[slot2]

	if slot1 then
		slot2 = setActive
		slot3 = slot0.resetBtn
		slot4 = true

		slot2(slot3, slot4)

		slot2 = SetActive
		slot3 = slot0.resetBtnBanned
		slot4 = false

		slot2(slot3, slot4)
	else
		slot2 = setActive
		slot3 = slot0.resetBtn
		slot4 = false

		slot2(slot3, slot4)

		slot2 = SetActive
		slot3 = slot0.resetBtnBanned
		slot4 = true

		slot2(slot3, slot4)
	end
end

slot0.updateResetBtn = slot1

function slot1(slot0)
	slot1 = slot0.userChallengeInfoList
	slot2 = slot0.curMode
	slot1 = slot1[slot2]

	if slot1 then
		slot2 = slot0.curMode
		slot3 = ChallengeProxy
		slot3 = slot3.MODE_CASUAL

		if slot2 == slot3 then
			slot3 = slot1
			slot2 = slot1.getLevel
			slot2 = slot2(slot3)
			slot3 = ChallengeConst
			slot3 = slot3.BOSS_NUM

			if slot3 < slot2 then
				slot2 = SetActive
				slot3 = slot0.startBtn
				slot4 = false

				slot2(slot3, slot4)

				slot2 = SetActive
				slot3 = slot0.startBtnBanned
				slot4 = true

				slot2(slot3, slot4)
			end
		else
			slot2 = SetActive
			slot3 = slot0.startBtn
			slot4 = true

			slot2(slot3, slot4)

			slot2 = SetActive
			slot3 = slot0.startBtnBanned
			slot4 = false

			slot2(slot3, slot4)
		end
	else
		slot2 = SetActive
		slot3 = slot0.startBtn
		slot4 = true

		slot2(slot3, slot4)

		slot2 = SetActive
		slot3 = slot0.startBtnBanned
		slot4 = false

		slot2(slot3, slot4)
	end
end

slot0.updateStartBtn = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.updateResetBtn

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.updateStartBtn

	slot1(slot2)
end

slot0.updateFuncBtns = slot1

function slot1(slot0)
	slot1 = getProxy
	slot2 = ActivityProxy
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.getActivityByType
	slot3 = ActivityConst
	slot3 = slot3.ACTIVITY_TYPE_CHALLENGE
	slot1 = slot1(slot2, slot3)
	slot2 = pg
	slot2 = slot2.activity_template
	slot3 = slot1.id
	slot2 = slot2[slot3]
	slot2 = slot2.config_data
	slot2 = slot2[1]
	slot3 = pg
	slot3 = slot3.activity_template
	slot3 = slot3[slot2]
	slot3 = slot3.config_data
	slot3 = slot3[1]
	slot4 = getProxy
	slot5 = TaskProxy
	slot4 = slot4(slot5)
	slot5 = slot4
	slot4 = slot4.getTaskById
	slot6 = slot3
	slot4 = slot4(slot5, slot6)

	if not slot4 then
		slot5 = getProxy
		slot6 = TaskProxy
		slot5 = slot5(slot6)
		slot6 = slot5
		slot5 = slot5.getFinishTaskById
		slot7 = slot3
		slot5 = slot5(slot6, slot7)
		slot4 = slot5
	end

	slot6 = slot4
	slot5 = slot4.getConfig
	slot7 = "target_num"
	slot5 = slot5(slot6, slot7)
	slot6 = slot0.challengeInfo
	slot7 = slot6
	slot6 = slot6.getGradeList
	slot6 = slot6(slot7)
	slot6 = slot6.activityMaxScore
	slot7 = setText
	slot8 = slot0.scoreText
	slot9 = slot6
	slot10 = " / "
	slot11 = slot5
	slot9 = slot9 .. slot10 .. slot11

	slot7(slot8, slot9)

	slot8 = slot4
	slot7 = slot4.getTaskStatus
	slot7 = slot7(slot8)

	if slot7 == 0 then
		slot8 = setActive
		slot9 = slot0.getBtn
		slot10 = false

		slot8(slot9, slot10)

		slot8 = setActive
		slot9 = slot0.getBtnBanned
		slot10 = true

		slot8(slot9, slot10)

		slot8 = setActive
		slot9 = slot0.gotBtn
		slot10 = false

		slot8(slot9, slot10)
	elseif slot7 == 1 then
		slot8 = setActive
		slot9 = slot0.getBtn
		slot10 = true

		slot8(slot9, slot10)

		slot8 = setActive
		slot9 = slot0.getBtnBanned
		slot10 = false

		slot8(slot9, slot10)

		slot8 = setActive
		slot9 = slot0.gotBtn
		slot10 = false

		slot8(slot9, slot10)
	elseif slot7 == 2 then
		slot8 = setActive
		slot9 = slot0.getBtn
		slot10 = false

		slot8(slot9, slot10)

		slot8 = setActive
		slot9 = slot0.getBtnBanned
		slot10 = false

		slot8(slot9, slot10)

		slot8 = setActive
		slot9 = slot0.gotBtn
		slot10 = true

		slot8(slot9, slot10)
	end

	slot9 = slot4
	slot8 = slot4.getConfig
	slot10 = "award_display"
	slot8 = slot8(slot9, slot10)
	slot8 = slot8[1]
	slot9 = {}
	slot10 = slot8[1]
	slot9.type = slot10
	slot10 = slot8[2]
	slot9.id = slot10
	slot10 = slot8[3]
	slot9.count = slot10
	slot10 = updateDrop
	slot11 = slot0.itemTF
	slot12 = slot9

	slot10(slot11, slot12)

	slot10 = onButton
	slot11 = slot0
	slot12 = slot0.itemTF

	function slot13()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = BaseUI
		slot2 = slot2.ON_DROP
		slot3 = slot1

		slot0(slot1, slot2, slot3)
	end

	slot14 = SFX_PANEL

	slot10(slot11, slot12, slot13, slot14)

	slot10 = onButton
	slot11 = slot0
	slot12 = slot0.getBtn

	function slot13()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ChallengeConst
		slot2 = slot2.CLICK_GET_AWARD_BTN
		slot3 = slot1
		slot3 = slot3.id

		slot0(slot1, slot2, slot3)
	end

	slot14 = SFX_PANEL

	slot10(slot11, slot12, slot13, slot14)

	slot10 = nil
end

slot0.updateAwardPanel = slot1

function slot1(slot0)
	slot1 = false
	slot2, slot3 = nil
	slot4 = pairs
	slot5 = slot0.userChallengeInfoList
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot10 = slot8
		slot9 = slot8.getResetFlag
		slot9 = slot9(slot10)
		slot10 = ChallengeConst
		slot10 = slot10.NEED_TO_RESET_SAVELOAD

		if slot10 <= slot9 then
			slot1 = true
			slot2 = slot8
			slot3 = slot7

			break
		end
	end

	if slot1 == true then
		slot4, slot5 = nil
		slot6 = ChallengeProxy
		slot6 = slot6.MODE_CASUAL

		if slot3 == slot6 then
			slot4 = "challenge_casual_reset"
			slot7 = slot2
			slot6 = slot2.getScore
			slot6 = slot6(slot7)
			slot5 = slot6
		else
			slot6 = ChallengeProxy
			slot6 = slot6.MODE_INFINITE

			if slot3 == slot6 then
				slot4 = "challenge_infinite_reset"
				slot7 = slot2
				slot6 = slot2.getLevel
				slot6 = slot6(slot7)
				slot5 = slot6 - 1
			end
		end

		slot6 = pg
		slot6 = slot6.MsgboxMgr
		slot6 = slot6.GetInstance
		slot6 = slot6()
		slot7 = slot6
		slot6 = slot6.ShowMsgBox
		slot8 = {
			hideNo = true
		}
		slot9 = i18n
		slot10 = slot4
		slot11 = slot5
		slot9 = slot9(slot10, slot11)
		slot8.content = slot9

		function slot9()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ChallengeConst
			slot2 = slot2.RESET_DATA_EVENT
			slot3 = slot1

			slot0(slot1, slot2, slot3)
		end

		slot8.onYes = slot9

		function slot9()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ChallengeConst
			slot2 = slot2.RESET_DATA_EVENT
			slot3 = slot1

			slot0(slot1, slot2, slot3)
		end

		slot8.onNo = slot9

		slot6(slot7, slot8)
	end
end

slot0.showSLResetMsgBox = slot1

function slot1(slot0)
	slot1 = nil

	setText(slot0.modTipText, i18n(slot1))

	slot2 = slot0.modTipText:GetComponent(typeof(DftAniEvent))

	if slot2 then
		slot4 = slot2
		slot3 = slot2.SetEndEvent

		function slot5(slot0)
			slot1 = setActive
			slot2 = slot0
			slot2 = slot2.modTipText
			slot3 = false

			slot1(slot2, slot3)
		end

		slot3(slot4, slot5)
	end

	slot3 = setActive
	slot4 = slot0.modTipText
	slot5 = true

	slot3(slot4, slot5)
end

slot0.showTipText = slot1

function slot1(slot0)
	slot1 = slot0.fleetEditPanel
	slot2 = slot1
	slot1 = slot1.attach
	slot3 = slot0

	slot1(slot2, slot3)

	slot1 = slot0.fleetEditPanel
	slot2 = slot1
	slot1 = slot1.setFleets
	slot3 = slot0.fleets
	slot4 = slot0.curMode
	slot3 = slot3[slot4]

	slot1(slot2, slot3)

	slot1 = slot0.fleetEditPanel
	slot2 = slot1
	slot1 = slot1.set
	slot3 = 1
	slot4 = 1

	slot1(slot2, slot3, slot4)

	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.BlurPanel
	slot3 = slot0.fleetEditPanel
	slot3 = slot3._tf

	slot1(slot2, slot3)
end

slot0.doOnFleetPanel = slot1

function slot1(slot0)
	slot1 = false
	slot2 = slot0.userChallengeInfoList
	slot3 = ChallengeProxy
	slot3 = slot3.MODE_INFINITE
	slot2 = slot2[slot3]
	slot3 = slot0.userChallengeInfoList
	slot4 = ChallengeProxy
	slot4 = slot4.MODE_CASUAL
	slot3 = slot3[slot4]

	if slot2 then
		slot1 = true
	elseif not slot2 then
		slot4 = slot0.challengeInfo
		slot5 = slot4
		slot4 = slot4.getGradeList
		slot4 = slot4(slot5)
		slot4 = slot4.seasonMaxLevel

		if slot3 then
			slot6 = slot3
			slot5 = slot3.getSeasonID
			slot5 = slot5(slot6)
			slot6 = slot0.challengeInfo
			slot7 = slot6
			slot6 = slot6.getSeasonID
			slot6 = slot6(slot7)

			if slot5 == slot6 then
				slot5 = ChallengeConst
				slot5 = slot5.BOSS_NUM

				if slot5 <= slot4 then
					slot1 = true
				else
					slot1 = false
				end
			else
				slot1 = false
			end
		else
			slot5 = ChallengeConst
			slot5 = slot5.BOSS_NUM

			if slot5 <= slot4 then
				slot1 = true
			elseif not slot3 then
				slot1 = false
			end
		end
	end

	return slot1
end

slot0.isFinishedCasualMode = slot1

function slot1(slot0)
	slot1 = false
	slot2 = slot0.timeOverTag

	if slot2 == true then
		slot1 = true
	else
		slot2 = slot0.curModeInfo

		if slot2 then
			slot2 = slot0.curModeInfo
			slot3 = slot2
			slot2 = slot2.getSeasonID
			slot2 = slot2(slot3)
			slot3 = slot0.challengeInfo
			slot4 = slot3
			slot3 = slot3.getSeasonID
			slot3 = slot3(slot4)

			if slot2 ~= slot3 then
				slot1 = true
			end
		else
			slot1 = false
		end
	end

	return slot1
end

slot0.isCrossedSeason = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.emit
	slot3 = ChallengeMainMediator
	slot3 = slot3.ON_COMMIT_FLEET

	slot1(slot2, slot3)
end

slot0.commitEdit = slot1

function slot1(slot0, slot1, slot2)
	slot4 = slot0
	slot3 = slot0.emit
	slot5 = ChallengeMainMediator
	slot5 = slot5.ON_FLEET_SHIPINFO
	slot6 = {
		shipId = slot1,
		shipVOs = slot2
	}

	slot3(slot4, slot5, slot6)
end

slot0.openShipInfo = slot1

function slot1(slot0)
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

slot0.hideFleetEdit = slot1

function slot1(slot0)
	slot1 = slot0.fleetEditPanel
	slot2 = slot1
	slot1 = slot1.setFleets
	slot3 = slot0.fleets
	slot4 = slot0.curMode
	slot3 = slot3[slot4]

	slot1(slot2, slot3)

	slot1 = slot0.fleetEditPanel
	slot2 = slot1
	slot1 = slot1.updateFleets

	slot1(slot2)
end

slot0.updateEditPanel = slot1

function slot1(slot0, slot1)
	slot0.commanderPrefabs = slot1
end

slot0.setCommanderPrefabs = slot1

function slot1(slot0, slot1, slot2)
	function slot3(slot0)
		slot1 = slot0.type
		slot2 = LevelUIConst
		slot2 = slot2.COMMANDER_OP_ADD

		if slot1 == slot2 then
			slot1 = slot0
			slot1 = slot1.contextData
			slot2 = {}
			slot3 = slot1
			slot2.fleetIndex = slot3
			slot3 = slot0.pos
			slot2.cmdPos = slot3
			slot3 = slot0
			slot3 = slot3.curMode
			slot2.mode = slot3
			slot1.eliteCommanderSelected = slot2
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = ChallengeMainMediator
			slot3 = slot3.ON_SELECT_ELITE_COMMANDER
			slot4 = slot1
			slot5 = slot0.pos
			slot6 = chapterId

			slot1(slot2, slot3, slot4, slot5, slot6)

			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.closeCommanderPanel

			slot1(slot2)

			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.hideFleetEdit

			slot1(slot2)
		end
	end

	slot4 = LevelCMDFormationView
	slot4 = slot4.New
	slot5 = slot0.fleetSelect
	slot6 = slot0.event
	slot7 = slot0.contextData
	slot4 = slot4(slot5, slot6, slot7)
	slot0.levelCMDFormationView = slot4
	slot4 = slot0.levelCMDFormationView
	slot5 = slot4
	slot4 = slot4.Load

	slot4(slot5)

	slot4 = slot0.levelCMDFormationView
	slot5 = slot4
	slot4 = slot4.ActionInvoke
	slot6 = "update"
	slot7 = slot1
	slot8 = slot0.commanderPrefabs
	slot9 = slot3

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = slot0.levelCMDFormationView
	slot5 = slot4
	slot4 = slot4.ActionInvoke
	slot6 = "open"

	slot4(slot5, slot6)

	slot4 = slot0.levelCMDFormationView
	slot5 = slot4
	slot4 = slot4.ActionInvoke
	slot6 = "hidePrefabButtons"

	slot4(slot5, slot6)
end

slot0.openCommanderPanel = slot1

function slot1(slot0)
	slot1 = slot0.levelCMDFormationView

	if slot1 then
		slot1 = slot0.levelCMDFormationView
		slot2 = slot1
		slot1 = slot1.GetLoaded
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = slot0.levelCMDFormationView
			slot2 = slot1
			slot1 = slot1.ActionInvoke
			slot3 = "updatePrefabs"
			slot4 = slot0.commanderPrefabs

			slot1(slot2, slot3, slot4)
		end
	end
end

slot0.updateCommanderPrefab = slot1

function slot1(slot0)
	slot1 = slot0.levelCMDFormationView

	if slot1 then
		slot1 = slot0.levelCMDFormationView
		slot2 = slot1
		slot1 = slot1.GetLoaded
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = slot0.levelCMDFormationView
			slot2 = slot1
			slot1 = slot1.CheckState
			slot3 = BaseSubView
			slot3 = slot3.STATES
			slot3 = slot3.DESTROY
			slot1 = slot1(slot2, slot3)

			if not slot1 then
				slot1 = slot0.levelCMDFormationView
				slot2 = slot1
				slot1 = slot1.close

				slot1(slot2)
			end
		end
	end
end

slot0.closeCommanderPanel = slot1

return slot0
