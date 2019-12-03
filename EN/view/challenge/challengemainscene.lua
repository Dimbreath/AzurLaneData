slot0 = class("ChallengeMainScene", import("..base.BaseUI"))
slot0.BOSS_NUM = 5
slot0.FADE_TIME = 5

function slot0.getUIName(slot0)
	return "ChallengeMainUI"
end

function slot0.init(slot0)
	slot0:findUI()
	slot0:initData()
	slot0:addListener()
end

function slot0.didEnter(slot0)
	slot0:updateGrade(slot0.challengeInfo:getGradeList())
	slot0:updateTimePanel()
	slot0:updateSwitchModBtn()
	slot0:updateAwardPanel()
	slot0:updatePaintingList(slot0.nameList, slot0.showingIndex)
	slot0:updateRoundText(slot0.showingIndex)
	slot0:updateSlider(slot0.showingIndex)
	slot0:updateFuncBtns()
	slot0:showSLResetMsgBox()

	if slot0.contextData.editFleet then
		slot0:doOnFleetPanel()

		slot0.contextData.editFleet = nil
	end

	slot0:tryPlayGuide()
end

function slot0.willExit(slot0)
	LeanTween.cancel(go(slot0.modTipTF))

	if slot0.timer then
		slot0.timer:Stop()
	end
end

function slot0.onBackPressed(slot0)
	if isActive(slot0.fleetSelect) then
		slot0:hideFleetEdit()
	else
		triggerButton(slot0.backBtn)
	end
end

function slot0.setFleet(slot0, slot1)
	slot0.fleets = {}

	slot2(ChallengeProxy.MODE_CASUAL)
	function (slot0)
		slot0.fleets[slot0] = {
			slot1[slot0 + 1],
			[11] = slot1[slot0 + 11]
		}
	end(ChallengeProxy.MODE_INFINITE)
end

function slot0.findUI(slot0)
	slot0.northTF = slot0:findTF("ForNorth")
	slot0.paintingListTF = slot0:findTF("PaintingList")
	slot0.backBtn = slot0:findTF("top/back_button", slot0.northTF)
	slot0.gradeContainer = slot0:findTF("GradeContainer", slot0.northTF)
	slot0.seasonBestPointText = slot0:findTF("SeasonBestPoint/Text", slot0.gradeContainer)
	slot0.activityBestPointText = slot0:findTF("ActivityBestPoint/Text", slot0.gradeContainer)
	slot0.seasonLevelNumText = slot0:findTF("SeasonLevelNum/Text", slot0.gradeContainer)
	slot0.activityLevelNumText = slot0:findTF("ActivityLevelNum/Text", slot0.gradeContainer)
	slot0.timeTipTF = slot0:findTF("TimeTip", slot0.northTF)
	slot0.activityTimeText = slot0:findTF("ActivityTimeText", slot0.timeTipTF)
	slot0.seasonDayText = slot0:findTF("SeasonTipText/DayText", slot0.timeTipTF)
	slot0.seasonTimeText = slot0:findTF("SeasonTimeText", slot0.timeTipTF)
	slot0.switchModTF = slot0:findTF("SwitchMod", slot0.northTF)
	slot0.casualModBtn = slot0:findTF("NormalBtn", slot0.switchModTF)
	slot0.infiniteModBtn = slot0:findTF("EndlessBtn", slot0.switchModTF)
	slot0.casualModBtnBG = slot0:findTF("BG", slot0.casualModBtn)
	slot0.infiniteModBtnBG = slot0:findTF("BG", slot0.infiniteModBtn)
	slot0.casualModBtnSC = GetComponent(slot0.casualModBtn, "Button")
	slot0.infiniteModBtnSC = GetComponent(slot0.infiniteModBtn, "Button")
	slot0.functionBtnsTF = slot0:findTF("FunctionBtns", slot0.northTF)
	slot0.rankBtn = slot0:findTF("RankBtn", slot0.functionBtnsTF)
	slot0.startBtn = slot0:findTF("StartBtn", slot0.functionBtnsTF)
	slot0.resetBtn = slot0:findTF("ResetBtn", slot0.functionBtnsTF)
	slot0.startBtnBanned = slot0:findTF("StartBtnBanned", slot0.functionBtnsTF)
	slot0.resetBtnBanned = slot0:findTF("ResetBtnBanned", slot0.functionBtnsTF)
	slot0.awardTF = slot0:findTF("Award", slot0.northTF)
	slot0.helpBtn = slot0:findTF("HelpBtn", slot0.awardTF)
	slot0.getBtn = slot0:findTF("GetBtn", slot0.awardTF)
	slot0.gotBtn = slot0:findTF("GotBtn", slot0.awardTF)
	slot0.getBtnBanned = slot0:findTF("GetBtnBanned", slot0.awardTF)
	slot0.itemTF = slot0:findTF("ItemBG/item", slot0.awardTF)
	slot0.scoreText = slot0:findTF("Score/ScoreText", slot0.awardTF)
	slot0.slider = slot0:findTF("Slider", slot0.northTF)
	slot0.squareContainer = slot0:findTF("SquareList", slot0.slider)
	slot0.squareTpl = slot0:findTF("Squre", slot0.slider)
	slot0.squareList = UIItemList.New(slot0.squareContainer, slot0.squareTpl)
	slot0.sliderSC = GetComponent(slot0.slider, "Slider")
	slot0.paintingContainer = slot0:findTF("PaintingList")
	slot0.scrollSC = GetComponent(slot0.paintingContainer, "Slider")
	slot0.material = slot0:findTF("material"):GetComponent(typeof(Image)).material
	slot0.material1 = slot0:findTF("material1"):GetComponent(typeof(Image)).material
	slot0.painting = slot0:findTF("Painting", slot0.paintingContainer)
	slot0.paintingShadow1 = slot0:findTF("PaintingShadow1", slot0.painting)
	slot0.paintingShadow2 = slot0:findTF("PaintingShadow2", slot0.painting)
	slot0.bossInfoImg = slot0:findTF("InfoImg", slot0.painting)
	slot0.roundNumText = slot0:findTF("Round/NumText", slot0.painting)
	slot0.completeEffectTF = slot0:findTF("TZ02", slot0.painting)

	SetActive(slot0.completeEffectTF, false)

	slot0.card1TF = slot0:findTF("Card1", slot0.paintingContainer)
	slot0.shipPaintImg_1 = slot0:findTF("Mask/ShipPaint", slot0.card1TF)
	slot0.tag_1 = slot0:findTF("Tag", slot0.card1TF)
	slot0.mask_1 = slot0:findTF("Mask", slot0.card1TF)
	slot0.roundTF_1 = slot0:findTF("Round", slot0.card1TF)
	slot0.roundText_1 = slot0:findTF("Round/RoundText", slot0.card1TF)
	slot0.card2TF = slot0:findTF("Card2", slot0.paintingContainer)
	slot0.shipPaintImg_2 = slot0:findTF("Mask/ShipPaint", slot0.card2TF)
	slot0.tag_2 = slot0:findTF("Tag", slot0.card2TF)
	slot0.mask_2 = slot0:findTF("Mask", slot0.card2TF)
	slot0.roundTF_2 = slot0:findTF("Round", slot0.card2TF)
	slot0.roundText_2 = slot0:findTF("Round/RoundText", slot0.card2TF)
	slot0.modTipBtn = slot0:findTF("ModTipBtn", slot0.northTF)
	slot0.modTipTF = slot0:findTF("TipText", slot0.northTF)
	slot0.modTipText = slot0:findTF("Text", slot0.modTipTF)

	setActive(slot0.modTipText, false)

	slot0.fleetSelect = slot0:findTF("LevelFleetSelectView")
	slot0.fleetEditPanel = ActivityFleetPanel.New(slot0.fleetSelect.gameObject)

	function slot0.fleetEditPanel.onCancel()
		slot0:hideFleetEdit()
	end

	function slot0.fleetEditPanel.onCommit()
		slot0:commitEdit()
	end

	function slot0.fleetEditPanel.onCombat()
		slot0:commitEdit()
		slot0.commitEdit:emit(ChallengeMainMediator.ON_PRECOMBAT, slot0.curMode)
	end

	function slot0.fleetEditPanel.onLongPressShip(slot0, slot1)
		slot0:openShipInfo(slot0, slot1)
	end

	slot0.commanderFormationPanel = CmdLevelFormationPanel.New(slot0:findTF("commander_panel"))

	slot0.commanderFormationPanel:attach(slot0)
end

function slot0.tryPlayGuide(slot0)
	pg.SystemGuideMgr.GetInstance():Play(slot0)
end

function slot0.initData(slot0)
	slot0.challengeProxy = getProxy(ChallengeProxy)
	slot0.challengeInfo = slot0.challengeProxy:getChallengeInfo()
	slot0.userChallengeInfoList = slot0.challengeProxy:getUserChallengeInfoList()
	slot0.timeOverTag = false

	slot0:updateData()

	slot0.openedCommanerSystem = true
end

function slot0.addListener(slot0)
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_PANEL)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.challenge_help.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.rankBtn, function ()
		slot0:emit(ChallengeMainMediator.ON_OPEN_RANK)
	end, SFX_PANEL)
	onButton(slot0, slot0.startBtn, function ()
		if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE) or slot0:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("challenge_end_tip"))
			triggerButton(slot0.backBtn)

			return
		end

		if slot0:isCrossedSeason() == true then
			slot1 = slot0.challengeProxy:getCurMode()

			if not slot0.curModeInfo then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideNo = true,
					content = i18n("challenge_season_update"),
					onYes = function ()
						slot0:emit(ChallengeConst.RESET_DATA_EVENT, slot0)
					end,
					onNo = function ()
						slot0:emit(ChallengeConst.RESET_DATA_EVENT, slot0)
					end
				})

				return
			else
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideNo = false,
					content = i18n((slot1 == ChallengeProxy.MODE_CASUAL and "challenge_season_update_casual_clear") or "challenge_season_update_infinite_clear", (slot1 == ChallengeProxy.MODE_CASUAL and slot0.curModeInfo:getScore()) or slot0.curModeInfo:getLevel()),
					onNo = function ()
						slot0:emit(ChallengeConst.RESET_DATA_EVENT, slot0)
					end,
					onYes = function ()
						slot0:emit(ChallengeMainMediator.ON_PRECOMBAT, slot0.curMode)
					end
				})

				return
			end
		end

		if not slot0.curModeInfo then
			slot0:doOnFleetPanel()

			return
		end

		slot0:emit(ChallengeMainMediator.ON_PRECOMBAT, slot0.curMode)
	end, SFX_PANEL)
	onButton(slot0, slot0.resetBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = false,
			content = i18n("challenge_normal_reset"),
			onYes = function ()
				slot0:emit(ChallengeConst.RESET_DATA_EVENT, slot0.challengeProxy:getCurMode())
			end
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.modTipBtn, function ()
		slot0:showTipText()
	end)
	addSlip(SLIP_TYPE_HRZ, slot0.paintingContainer, function ()
		if slot0.showingIndex % ChallengeConst.BOSS_NUM == 1 then
			return
		end

		slot0.showingIndex = slot0.showingIndex - 1

		slot0:updatePaintingList(slot0.nameList, slot0.showingIndex)
		slot0.updatePaintingList:updateRoundText(slot0.showingIndex)
		slot0.updatePaintingList.updateRoundText:updateSlider(slot0.showingIndex)
	end, function ()
		if slot0.showingIndex % ChallengeConst.BOSS_NUM == 0 then
			return
		end

		slot0.showingIndex = slot0.showingIndex + 1

		slot0:updatePaintingList(slot0.nameList, slot0.showingIndex)
		slot0.updatePaintingList:updateRoundText(slot0.showingIndex)
		slot0.updatePaintingList.updateRoundText:updateSlider(slot0.showingIndex)
	end)
end

function slot0.updateData(slot0)
	slot0.curMode = slot0.challengeProxy:getCurMode()
	slot0.curModeInfo = slot0.userChallengeInfoList[slot0.curMode]
	slot0.timeOverTag = false

	if not slot0.curModeInfo then
		slot0.curLevel = 1
		slot0.showingIndex = slot0.curLevel

		if slot0.curMode == ChallengeProxy.MODE_CASUAL then
			slot0.dungeonIDList = slot0.challengeInfo:getDungeonIDList()
		elseif slot0.curMode == ChallengeProxy.MODE_INFINITE then
			slot0.dungeonIDList = pg.activity_event_challenge[slot0.challengeInfo:getActivityIndex()].infinite_stage[slot0.challengeInfo:getSeasonID()][1]
		end
	else
		slot0.curLevel = slot0.curModeInfo:getLevel()
		slot0.showingIndex = slot0.curLevel
		slot0.dungeonIDList = slot0.curModeInfo:getDungeonIDList()
	end

	slot0.nameList = {}
	slot0.infoNameList = {}

	for slot4, slot5 in ipairs(slot0.dungeonIDList) do
		slot0.nameList[slot4] = pg.expedition_challenge_template[slot5].char_icon[1]
		slot0.infoNameList[slot4] = pg.expedition_challenge_template[slot5].name_p
	end

	slot0.nextNameList = {}

	if slot0.curMode == ChallengeProxy.MODE_INFINITE then
		slot1 = nil
		slot1 = (not slot0.curModeInfo or slot0.curModeInfo:getNextInfiniteDungeonIDList()) and (not pg.activity_event_challenge[slot0.challengeInfo:getActivityIndex()].infinite_stage[slot0.challengeInfo:getSeasonID()][2] or pg.activity_event_challenge[slot3].infinite_stage[slot2][2]) and pg.activity_event_challenge[slot3].infinite_stage[slot2][1]

		for slot5, slot6 in ipairs(slot1) do
			slot0.nextNameList[slot5 + ChallengeConst.BOSS_NUM] = pg.expedition_challenge_template[slot6].char_icon[1]
		end
	end
end

function slot0.updatePaintingList(slot0, slot1, slot2)
	slot3 = slot1 or slot0.nameList
	slot5 = slot0.curLevel

	if ChallengeConst.BOSS_NUM < (slot2 or slot0.showingIndex) then
		slot4 = (slot4 % ChallengeConst.BOSS_NUM == 0 and ChallengeConst.BOSS_NUM) or slot4 % ChallengeConst.BOSS_NUM
	end

	if slot0.curMode == ChallengeProxy.MODE_INFINITE and ChallengeConst.BOSS_NUM < slot5 then
		slot5 = (slot5 % ChallengeConst.BOSS_NUM == 0 and ChallengeConst.BOSS_NUM) or slot5 % ChallengeConst.BOSS_NUM

		function slot6(slot0)
			slot0.material:SetFloat("_LineGray", 0.3)
			slot0.material:SetFloat("_TearDistance", 0)
			LeanTween.cancel(slot0.gameObject)
			LeanTween.value(slot0.gameObject, 0, 2, 2):setLoopClamp():setOnUpdate(System.Action_float(function (slot0)
				if slot0 >= 1.2 then
					slot0.material:SetFloat("_LineGray", 0.3)
				elseif slot0 >= 1.1 then
					slot0.material:SetFloat("_LineGray", 0.45)
				elseif slot0 >= 1.03 then
					slot0.material:SetFloat("_TearDistance", 0)
				elseif slot0 >= 1 then
					slot0.material:SetFloat("_TearDistance", 0.3)
				elseif slot0 >= 0.35 then
					slot0.material:SetFloat("_LineGray", 0.3)
				elseif slot0 >= 0.3 then
					slot0.material:SetFloat("_LineGray", 0.4)
				elseif slot0 >= 0.25 then
					slot0.material:SetFloat("_LineGray", 0.3)
				elseif slot0 >= 0.2 then
					slot0.material:SetFloat("_LineGray", 0.4)
				end
			end))
		end

		setPaintingPrefabAsync(slot0.painting, slot3[slot4], "chuanwu", function ()
			if slot0:findTF("fitter", slot0.painting):GetChild(0) then
				SetActive(slot0.completeEffectTF, slot1 - 1 - () >= 0)

				if slot1 - 1 - () >= 0 then
					slot1.material = slot0.material1

					slot1.material:SetFloat("_LineDensity", 7)
					slot1.material.SetFloat(slot1)
				else
					slot1.material = slot0.material

					slot1.material:SetFloat("_Range", 16)
					slot1.material:SetFloat("_Degree", 7)
				end
			end
		end)
		setPaintingPrefabAsync(slot0.paintingShadow1, slot3[slot4], "chuanwu", function ()
			if slot0:findTF("fitter", slot0.paintingShadow1):GetChild(0) then
				slot0:GetComponent("Image").color = Color.New(0, 0, 0, 0.44)
			end
		end)
		setPaintingPrefabAsync(slot0.paintingShadow2, slot3[slot4], "chuanwu", function ()
			if slot0:findTF("fitter", slot0.paintingShadow2):GetChild(0) then
				slot0:GetComponent("Image").color = Color.New(1, 1, 1, 0.15)
			end
		end)
		LoadSpriteAsync("ChallengeBossInfo/" .. slot0.infoNameList[slot4], function (slot0)
			setImageSprite(slot0.bossInfoImg, slot0, true)
		end)
	end

	if slot0.BOSS_NUM - slot4 >= 2 then
		setActive(slot0.roundTF_1, true)
		setActive(slot0.roundTF_2, true)
		setActive(slot0.mask_1, true)
		setActive(slot0.mask_2, true)
		LoadSpriteAsync("shipYardIcon/" .. slot3[slot4 + 1], function (slot0)
			setImageSprite(slot0.shipPaintImg_1, slot0)
		end)
		LoadSpriteAsync("shipYardIcon/" .. slot3[slot4 + 2], function (slot0)
			setImageSprite(slot0.shipPaintImg_2, slot0)
		end)
	elseif slot0.BOSS_NUM - slot4 == 1 then
		setActive(slot0.roundTF_1, true)
		setActive(slot0.roundTF_2, false)
		setActive(slot0.mask_1, true)
		setActive(slot0.mask_2, false)
		LoadSpriteAsync("shipYardIcon/" .. slot3[slot4 + 1], function (slot0)
			setImageSprite(slot0.shipPaintImg_1, slot0)
		end)

		if slot0.curMode == ChallengeProxy.MODE_INFINITE then
			LoadSpriteAsync("shipYardIcon/" .. slot0.nextNameList[slot4 + 2], function (slot0)
				setImageSprite(slot0.shipPaintImg_2, slot0)
				setActive(slot0.mask_2, true)
				setActive(slot0.roundTF_2, true)
			end)
		end
	else
		setActive(slot0.roundTF_1, false)
		setActive(slot0.roundTF_2, false)
		setActive(slot0.mask_1, false)
		setActive(slot0.mask_2, false)

		if slot0.curMode == ChallengeProxy.MODE_INFINITE then
			LoadSpriteAsync("shipYardIcon/" .. slot0.nextNameList[slot4 + 1], function (slot0)
				setImageSprite(slot0.shipPaintImg_1, slot0)
				setActive(slot0.mask_1, true)
				setActive(slot0.roundTF_1, true)
			end)
			LoadSpriteAsync("shipYardIcon/" .. slot0.nextNameList[slot4 + 2], function (slot0)
				setImageSprite(slot0.shipPaintImg_2, slot0)
				setActive(slot0.mask_2, true)
				setActive(slot0.roundTF_2, true)
			end)
		end
	end

	if slot5 - 1 - slot4 >= 2 then
		setActive(slot0.tag_1, true)
		setActive(slot0.tag_2, true)
	elseif slot5 - 1 - slot4 == 1 then
		setActive(slot0.tag_1, true)
		setActive(slot0.tag_2, false)
	elseif slot5 - 1 - slot4 <= 0 then
		setActive(slot0.tag_1, false)
		setActive(slot0.tag_2, false)
	end
end

function slot0.updateRoundText(slot0, slot1)
	slot2 = slot1 or slot0.showingIndex

	if slot0.curMode == ChallengeProxy.MODE_CASUAL and ChallengeConst.BOSS_NUM < slot2 then
		setText(slot0.roundNumText, string.format("%02d", (slot2 % ChallengeConst.BOSS_NUM == 0 and ChallengeConst.BOSS_NUM) or slot2 % ChallengeConst.BOSS_NUM))
		setText(slot0.roundText_1, "Round" .. ((slot2 % ChallengeConst.BOSS_NUM == 0 and ChallengeConst.BOSS_NUM) or slot2 % ChallengeConst.BOSS_NUM) + 1)
		setText(slot0.roundText_2, "Round" .. ((slot2 % ChallengeConst.BOSS_NUM == 0 and ChallengeConst.BOSS_NUM) or slot2 % ChallengeConst.BOSS_NUM) + 2)

		return
	end
end

function slot0.updateSlider(slot0, slot1)
	slot3 = slot0.curLevel

	if ChallengeConst.BOSS_NUM < (slot1 or slot0.showingIndex) then
		slot2 = (slot2 % ChallengeConst.BOSS_NUM == 0 and ChallengeConst.BOSS_NUM) or slot2 % ChallengeConst.BOSS_NUM
	end

	if slot0.curMode == ChallengeProxy.MODE_INFINITE and ChallengeConst.BOSS_NUM < slot3 then
		slot0.sliderSC.value = (((slot3 % ChallengeConst.BOSS_NUM == 0 and ChallengeConst.BOSS_NUM) or slot3 % ChallengeConst.BOSS_NUM) - 1) * 1 / (ChallengeConst.BOSS_NUM - 1)

		slot0.squareList:make(function (slot0, slot1, slot2)
			slot3 = slot0:findTF("UnFinished", slot2)
			slot4 = slot0:findTF("Finished", slot2)
			slot5 = slot0:findTF("Challengeing", slot2)
			slot6 = slot0:findTF("Arrow", slot2)

			function slot7()
				setActive(setActive, true)
				setActive(setActive, false)
				setActive(false, false)
			end

			function slot8()
				setActive(setActive, false)
				setActive(setActive, true)
				setActive(true, false)
			end

			function slot9()
				setActive(setActive, false)
				setActive(setActive, false)
				setActive(false, true)
			end

			if slot0 == UIItemList.EventUpdate then
				if slot1 + 1 < slot1 then
					slot7()
				elseif slot1 + 1 == slot1 then
					slot9()
				elseif slot1 < slot1 + 1 then
					slot8()
				end

				if slot1 + 1 == slot2 then
					setActive(slot6, true)
				else
					setActive(slot6, false)
				end
			end
		end)
		slot0.squareList:align(ChallengeConst.BOSS_NUM)

		return
	end
end

function slot0.updateGrade(slot0, slot1)
	setText(slot0.seasonBestPointText, slot1.seasonMaxScore)
	setText(slot0.activityBestPointText, slot1.activityMaxScore)
	setText(slot0.seasonLevelNumText, slot1.seasonMaxLevel)
	setText(slot0.activityLevelNumText, slot1.activityMaxLevel)
end

function slot0.updateTimePanel(slot0)
	setText(slot0.activityTimeText, slot4)

	slot5 = pg.TimeMgr.GetInstance()
	slot13, slot15, slot16, slot17 = slot5:parseTimeFrom(slot6)

	setText(slot0.seasonDayText, slot7)
	setText(slot0.seasonTimeText, string.format("%02d:%02d:%02d", slot8, slot9, slot10))

	if slot0.timer then
		slot0.timer:Stop()
	end

	slot0.timer = Timer.New(function ()
		slot0 = slot0 - 1
		slot6, slot5, slot9, slot10 = pg.TimeMgr.GetInstance():parseTimeFrom(pg.TimeMgr.GetInstance().parseTimeFrom)

		setText(slot1.seasonDayText, slot0)
		setText(slot1.seasonTimeText, string.format("%02d:%02d:%02d", slot1, slot2, slot3))

		if slot0 <= 0 then
			slot1.timeOverTag = true

			slot1.timer:Stop()
		end
	end, 1, -1)

	slot0.timer:Start()
end

function slot0.updateSwitchModBtn(slot0)
	if not slot0:isFinishedCasualMode() then
		setActive(slot0.infiniteModBtn, false)
	else
		setActive(slot0.infiniteModBtn, true)
	end

	if slot0.curMode == ChallengeProxy.MODE_CASUAL then
		setActive(slot0.casualModBtnBG, true)
		setActive(slot0.infiniteModBtnBG, false)
	else
		setActive(slot0.casualModBtnBG, false)
		setActive(slot0.infiniteModBtnBG, true)
	end

	onButton(slot0, slot0.casualModBtn, function ()
		if slot0.curMode == ChallengeProxy.MODE_CASUAL then
			return
		end

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

		if (slot0.curModeInfo and slot0.curModeInfo:getLevel()) or 0:isCrossedSeason() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = false,
				content = i18n("challenge_season_update_infinite_switch", slot0),
				onYes = function ()
					slot0:emit(ChallengeConst.RESET_DATA_EVENT, ChallengeProxy.MODE_INFINITE)
				end,
				onNo = slot1
			})

			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = false,
			content = i18n("challenge_infinite_click_switch", slot0),
			onYes = slot1
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.infiniteModBtn, function ()
		if slot0.curMode == ChallengeProxy.MODE_INFINITE then
			return
		end

		function slot1()
			slot0.challengeProxy:setCurMode(ChallengeProxy.MODE_INFINITE)
			setActive(slot0.casualModBtnBG, false)
			setActive(slot0.infiniteModBtnBG, true)
			setActive:updateData()
			setActive.updateData:updatePaintingList(slot0.nameList, slot0.showingIndex)
			setActive.updateData.updatePaintingList:updateRoundText(slot0.showingIndex)
			setActive.updateData.updatePaintingList.updateRoundText:updateSlider(slot0.showingIndex)
			setActive.updateData.updatePaintingList.updateRoundText.updateSlider:updateFuncBtns()
			setActive.updateData.updatePaintingList.updateRoundText.updateSlider.updateFuncBtns:showTipText()
		end

		if (slot0.curModeInfo and slot0.curModeInfo:getScore()) or slot0.challengeInfo:getGradeList().seasonMaxScore:isCrossedSeason() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = false,
				content = i18n("challenge_season_update_casual_switch", slot0),
				onYes = function ()
					slot0:emit(ChallengeConst.RESET_DATA_EVENT, ChallengeProxy.MODE_CASUAL)
				end,
				onNo = slot1
			})

			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = false,
			content = i18n("challenge_casual_click_switch", slot0),
			onYes = slot1
		})
	end, SFX_PANEL)
end

function slot0.updateResetBtn(slot0)
	if slot0.userChallengeInfoList[slot0.curMode] then
		setActive(slot0.resetBtn, true)
		SetActive(slot0.resetBtnBanned, false)
	else
		setActive(slot0.resetBtn, false)
		SetActive(slot0.resetBtnBanned, true)
	end
end

function slot0.updateStartBtn(slot0)
	if slot0.userChallengeInfoList[slot0.curMode] then
		if slot0.curMode == ChallengeProxy.MODE_CASUAL and ChallengeConst.BOSS_NUM < slot1:getLevel() then
			SetActive(slot0.startBtn, false)
			SetActive(slot0.startBtnBanned, true)
		else
			SetActive(slot0.startBtn, true)
			SetActive(slot0.startBtnBanned, false)
		end
	else
		SetActive(slot0.startBtn, true)
		SetActive(slot0.startBtnBanned, false)
	end
end

function slot0.updateFuncBtns(slot0)
	slot0:updateResetBtn()
	slot0:updateStartBtn()
end

function slot0.updateAwardPanel(slot0)
	setText(slot0.scoreText, slot6 .. " / " .. getProxy(TaskProxy):getTaskById(pg.activity_template[pg.activity_template[getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE).id].config_data[1]].config_data[1]) or getProxy(TaskProxy):getFinishTaskById(slot3):getConfig("target_num"))

	if getProxy(TaskProxy).getTaskById(pg.activity_template[pg.activity_template[getProxy(ActivityProxy).getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE).id].config_data[1]].config_data[1]) or getProxy(TaskProxy).getFinishTaskById(slot3):getTaskStatus() == 0 then
		setActive(slot0.getBtn, false)
		setActive(slot0.getBtnBanned, true)
		setActive(slot0.gotBtn, false)
	elseif slot7 == 1 then
		setActive(slot0.getBtn, true)
		setActive(slot0.getBtnBanned, false)
		setActive(slot0.gotBtn, false)
	elseif slot7 == 2 then
		setActive(slot0.getBtn, false)
		setActive(slot0.getBtnBanned, false)
		setActive(slot0.gotBtn, true)
	end

	updateDrop(slot0.itemTF, slot9)
	onButton(slot0, slot0.itemTF, function ()
		slot0:emit(BaseUI.ON_DROP, slot0)
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		slot0:emit(ChallengeConst.CLICK_GET_AWARD_BTN, slot1.id)
	end, SFX_PANEL)

	slot10 = nil
end

function slot0.showSLResetMsgBox(slot0)
	slot1 = false
	slot2, slot3 = nil

	for slot7, slot8 in pairs(slot0.userChallengeInfoList) do
		if ChallengeConst.NEED_TO_RESET_SAVELOAD <= slot8:getResetFlag() then
			slot1 = true
			slot2 = slot8
			slot3 = slot7

			break
		end
	end

	if slot1 == true then
		slot4, slot5 = nil

		if slot3 == ChallengeProxy.MODE_CASUAL then
			slot4 = "challenge_casual_reset"
			slot5 = slot2:getScore()
		elseif slot3 == ChallengeProxy.MODE_INFINITE then
			slot4 = "challenge_infinite_reset"
			slot5 = slot2:getLevel() - 1
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = i18n(slot4, slot5),
			onYes = function ()
				slot0:emit(ChallengeConst.RESET_DATA_EVENT, slot0)
			end,
			onNo = function ()
				slot0:emit(ChallengeConst.RESET_DATA_EVENT, slot0)
			end
		})
	end
end

function slot0.showTipText(slot0)
	slot1 = nil

	setText(slot0.modTipText, i18n((slot0.curMode == ChallengeProxy.MODE_CASUAL and "challenge_normal_tip") or "challenge_unlimited_tip"))

	if slot0.modTipText:GetComponent(typeof(DftAniEvent)) then
		slot2:SetEndEvent(function (slot0)
			setActive(slot0.modTipText, false)
		end)
	end

	setActive(slot0.modTipText, true)
end

function slot0.doOnFleetPanel(slot0)
	slot0.fleetEditPanel:attach(slot0)
	slot0.fleetEditPanel:setFleets(slot0.fleets[slot0.curMode])
	slot0.fleetEditPanel:set(1, 1)
	pg.UIMgr.GetInstance():BlurPanel(slot0.fleetEditPanel._tf)
end

function slot0.isFinishedCasualMode(slot0)
	slot1 = false
	slot3 = slot0.userChallengeInfoList[ChallengeProxy.MODE_CASUAL]

	if slot0.userChallengeInfoList[ChallengeProxy.MODE_INFINITE] then
		slot1 = true
	elseif not slot2 then
		slot4 = slot0.challengeInfo:getGradeList().seasonMaxLevel

		if slot3 then
			if slot3:getSeasonID() == slot0.challengeInfo:getSeasonID() then
				if ChallengeConst.BOSS_NUM <= slot4 then
					slot1 = true
				else
					slot1 = false
				end
			else
				slot1 = false
			end
		elseif ChallengeConst.BOSS_NUM <= slot4 then
			slot1 = true
		elseif not slot3 then
			slot1 = false
		end
	end

	return slot1
end

function slot0.isCrossedSeason(slot0)
	slot1 = false

	if slot0.timeOverTag == true then
		slot1 = true
	elseif slot0.curModeInfo then
		if slot0.curModeInfo:getSeasonID() ~= slot0.challengeInfo:getSeasonID() then
			slot1 = true
		end
	else
		slot1 = false
	end

	return slot1
end

function slot0.commitEdit(slot0)
	slot0:emit(ChallengeMainMediator.ON_COMMIT_FLEET)
end

function slot0.openShipInfo(slot0, slot1, slot2)
	slot0:emit(ChallengeMainMediator.ON_FLEET_SHIPINFO, {
		shipId = slot1,
		shipVOs = slot2
	})
end

function slot0.hideFleetEdit(slot0)
	setActive(slot0.fleetSelect, false)
	slot0:closeCommanderPanel()
	pg.UIMgr.GetInstance():UnblurPanel(slot0.fleetSelect, slot0._tf)
	setParent(slot0.fleetSelect, slot0._tf, false)
end

function slot0.updateEditPanel(slot0)
	slot0.fleetEditPanel:setFleets(slot0.fleets[slot0.curMode])
	slot0.fleetEditPanel:updateFleets()
end

function slot0.setCommanderPrefabs(slot0, slot1)
	slot0.commanderPrefabs = slot1
end

function slot0.openCommanderPanel(slot0, slot1, slot2)
	slot0.levelCMDFormationView = LevelCMDFormationView.New(slot0.fleetSelect, slot0.event, slot0.contextData)

	slot0.levelCMDFormationView:Load()
	slot0.levelCMDFormationView:ActionInvoke("update", slot1, slot0.commanderPrefabs, function (slot0)
		if slot0.type == LevelUIConst.COMMANDER_OP_ADD then
			slot0.contextData.eliteCommanderSelected = {
				fleetIndex = slot1,
				cmdPos = slot0.pos,
				mode = slot0.curMode
			}

			slot0:emit(ChallengeMainMediator.ON_SELECT_ELITE_COMMANDER, slot0.emit, slot0.pos, chapterId)
			slot0:closeCommanderPanel()
			slot0:hideFleetEdit()
		end
	end)
	slot0.levelCMDFormationView:ActionInvoke("open")
	slot0.levelCMDFormationView:ActionInvoke("hidePrefabButtons")
end

function slot0.updateCommanderPrefab(slot0)
	if slot0.levelCMDFormationView and slot0.levelCMDFormationView:GetLoaded() then
		slot0.levelCMDFormationView:ActionInvoke("updatePrefabs", slot0.commanderPrefabs)
	end
end

function slot0.closeCommanderPanel(slot0)
	if slot0.levelCMDFormationView and slot0.levelCMDFormationView:GetLoaded() and not slot0.levelCMDFormationView:CheckState(BaseSubView.STATES.DESTROY) then
		slot0.levelCMDFormationView:close()
	end
end

return slot0
