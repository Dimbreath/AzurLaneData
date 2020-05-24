slot0 = class("LevelScene", import("..base.BaseUI"))
slot1 = require("Mgr/Pool/PoolUtil")
slot2 = import("view.level.MapBuilder.MapBuilder")
slot0.correspondingClass = {
	[slot2.TYPENORMAL] = "MapBuilderNormal",
	[slot2.TYPEESCORT] = "MapBuilderEscort",
	[slot2.TYPESKIRMISH] = "MapBuilderSkirmish"
}
slot3 = 0.5

function slot0.getUIName(slot0)
	return "LevelMainScene"
end

function slot0.preload(slot0, slot1)
	slot2 = 0
	slot4 = nil

	GetSpriteFromAtlasAsync("chapter/pic/cellgrid", "cell_grid", function ()
		uv0 = uv0 + 1

		if uv1 <= uv0 then
			uv2()
		end
	end)

	slot5 = PoolMgr.GetInstance()

	slot5:GetPrefab("chapter/cell_quad", "", true, function (slot0)
		uv0:ReturnPrefab("chapter/cell_quad", "", slot0)
		uv1()
	end)
	slot5:GetPrefab("chapter/cell_quad_mark", "", true, function (slot0)
		uv0:ReturnPrefab("chapter/cell_quad_mark", "", slot0)
		uv1()
	end)

	slot10 = true

	function slot11(slot0)
		uv0:ReturnPrefab("chapter/cell", "", slot0)
		uv1()
	end

	slot5:GetPrefab("chapter/cell", "", slot10, slot11)

	slot6 = {
		{
			"Tpl_Destination_Mark",
			"leveluiview",
			"destinationMarkTpl"
		}
	}
	slot0.loadedTpls = {}
	slot3 = 0 + 4 + #slot6

	for slot10, slot11 in pairs(slot6) do
		LoadAndInstantiateAsync(slot11[2], slot11[1], function (slot0)
			slot0:SetActive(false)

			slot0.name = uv0[3]
			uv1[uv0[3]] = slot0

			table.insert(uv1.loadedTpls, slot0)
			uv2()
		end, true)
	end

	slot3 = slot3 + 1
	slot8 = getProxy(ChapterProxy):getMaps()
	slot9 = slot0.contextData.mapIdx
	slot10 = slot0.contextData.chapterId

	if (slot0.contextData.chapterVO and slot11:getDataType() or ChapterConst.TypeNone) == ChapterConst.TypeSham then
		slot0.contextData.chapterVO = slot7:getShamChapter()
	elseif slot12 == ChapterConst.TypeGuild then
		slot0.contextData.chapterVO = slot7:getGuildChapter()
	elseif slot12 == ChapterConst.TypeNone and slot10 and slot8[slot9] then
		slot0.contextData.chapterVO = slot13:getChapter(slot10)
	end

	slot0:setMaps(slot8)

	slot14 = function ()
		uv0 = uv1.contextData.chapterVO

		if uv0 and uv0.active then
			return uv0:getConfig("map")
		end

		slot0 = nil

		if uv1.contextData.targetChapter and uv1.contextData.targetMap then
			uv1.contextData.openChapterId = uv1.contextData.targetChapter
			slot0 = uv1.contextData.targetMap.id
			uv1.contextData.targetChapter = nil
			uv1.contextData.targetMap = nil
		elseif uv1.contextData.eliteDefault then
			slot0 = uv2:getUseableMaxEliteMap() and slot1.id or nil
			uv1.contextData.eliteDefault = nil
		end

		return slot0 or uv1:selectMap(uv3)
	end()
	slot0.contextData.InitializeMap = slot14

	GetSpriteFromAtlasAsync("levelmap/" .. slot8[slot14]:getConfig("bg"), "", slot4)
end

function slot0.init(slot0)
	slot0:initData()
	slot0:initUI()
	slot0:initEvents()
	slot0:updateClouds()
end

function slot0.initData(slot0)
	slot0.tweens = {}
	slot0.mapItemTimer = {}
	slot0.mapWidth = 1920
	slot0.mapHeight = 1440
	slot0.levelCamIndices = 1
	slot0.frozenCount = 0
	slot0.currentBG = nil
	slot0.mbDict = {}

	if not slot0.contextData.huntingRangeVisibility then
		slot0.contextData.huntingRangeVisibility = 2
	end
end

function slot0.initUI(slot0)
	slot0.topPanel = slot0:findTF("top")
	slot0.canvasGroup = slot0.topPanel:GetComponent("CanvasGroup")
	slot0.canvasGroup.blocksRaycasts = not slot0.canvasGroup.blocksRaycasts
	slot0.canvasGroup.blocksRaycasts = not slot0.canvasGroup.blocksRaycasts
	slot0.topChapter = slot0:findTF("top_chapter", slot0.topPanel)
	slot0.chapterName = slot0:findTF("title_chapter/name", slot0.topChapter)
	slot0.chapterNoTitle = slot0:findTF("title_chapter/chapter", slot0.topChapter)
	slot0.resChapter = slot0:findTF("resources", slot0.topChapter)
	slot0.resPanel = PlayerResource.New()

	slot0.resPanel:setParent(slot0.resChapter, false)
	setActive(slot0.topChapter, true)

	slot0._voteBookBtn = slot0.topChapter:Find("vote_book")
	slot0.leftChapter = slot0:findTF("main/left_chapter")
	slot0.leftCanvasGroup = slot0.leftChapter:GetComponent(typeof(CanvasGroup))
	slot0.btnPrev = slot0:findTF("btn_prev", slot0.leftChapter)
	slot0.btnPrevCol = slot0:findTF("btn_prev/prev_image", slot0.leftChapter)
	slot0.eliteBtn = slot0:findTF("buttons/btn_elite", slot0.leftChapter)
	slot0.normalBtn = slot0:findTF("buttons/btn_normal", slot0.leftChapter)
	slot0.actNormalBtn = slot0:findTF("buttons/btn_act_normal/bg", slot0.leftChapter)
	slot0.actEliteBtn = slot0:findTF("buttons/btn_act_elite/bg", slot0.leftChapter)
	slot0.actExtraBtn = slot0:findTF("buttons/btn_act_extra/bg", slot0.leftChapter)
	slot0.actExtraBtnAnim = slot0:findTF("usm", slot0.actExtraBtn)
	slot0.remasterBtn = slot0:findTF("buttons/btn_remaster", slot0.leftChapter)
	slot0.remasterTipTF = slot0:findTF("tip", slot0.remasterBtn)

	setActive(slot0.actNormalBtn.parent, false)
	setActive(slot0.actEliteBtn.parent, false)

	slot0.escortBar = slot0:findTF("escort_bar", slot0.leftChapter)
	slot0.eliteQuota = slot0:findTF("elite_quota", slot0.leftChapter)

	setActive(slot0.eliteQuota, false)
	setActive(slot0.leftChapter, true)

	slot0.skirmishBar = slot0:findTF("left_times", slot0.leftChapter)
	slot0.rightChapter = slot0:findTF("main/right_chapter")
	slot0.rightCanvasGroup = slot0.rightChapter:GetComponent(typeof(CanvasGroup))
	slot0.eventContainer = slot0:findTF("event_btns/event_container", slot0.rightChapter)
	slot0.btnSpecial = slot0:findTF("btn_special", slot0.eventContainer)

	setActive(slot0.btnSpecial, true)

	slot0.challengeBtn = slot0:findTF("ChallengeBtn", slot0.eventContainer)
	slot0.dailyBtn = slot0:findTF("daily_button", slot0.eventContainer)
	slot0.militaryExerciseBtn = slot0:findTF("btn_pvp", slot0.eventContainer)
	slot0.shamBtn = slot0:findTF("sham_button", slot0.eventContainer)
	slot0.mirrorBtn = slot0:findTF("btn_mirror", slot0.eventContainer)
	slot0.activityBtn = slot0:findTF("event_btns/activity_btn", slot0.rightChapter)
	slot0.ptTotal = slot0:findTF("event_btns/pt_text", slot0.rightChapter)
	slot0.ticketTxt = slot0:findTF("event_btns/tickets/Text", slot0.rightChapter)
	slot0.actExchangeShopBtn = slot0:findTF("event_btns/btn_exchange", slot0.rightChapter)
	slot0.signalBtn = slot0:findTF("btn_signal", slot0.rightChapter)

	setActive(slot0.signalBtn, false)

	slot0.btnNext = slot0:findTF("btn_next", slot0.rightChapter)
	slot0.btnNextCol = slot0:findTF("btn_next/next_image", slot0.rightChapter)
	slot0.countDown = slot0:findTF("event_btns/count_down", slot0.rightChapter)
	slot0.actExtraRank = slot0:findTF("event_btns/act_extra_rank", slot0.rightChapter)

	setActive(slot0.rightChapter, true)

	slot0.damageText = slot0:findTF("damage", slot0.topPanel)

	setActive(slot0.damageText, false)

	slot0.mapHelpBtn = slot0:findTF("help_button", slot0.topPanel)

	setActive(slot0.mapHelpBtn, false)

	slot0.avoidText = slot0:findTF("text_avoid", slot0.topPanel)
	slot0.commanderTinkle = slot0:findTF("neko_tinkle", slot0.topPanel)

	setActive(slot0.commanderTinkle, false)

	slot0.spResult = slot0:findTF("sp_result", slot0.topPanel)

	setActive(slot0.spResult, false)

	slot0.helpPage = slot0:findTF("help_page", slot0.topPanel)
	slot0.helpImage = slot0:findTF("icon", slot0.helpPage)
	slot0.helpBtn = slot0:findTF("help_button", slot0.bottomStage)

	setActive(slot0.helpPage, false)

	slot0.curtain = slot0:findTF("curtain")

	setActive(slot0.curtain, false)

	slot0.map = slot0:findTF("map")
	slot0.map:GetComponent(typeof(Image)).enabled = true
	slot0.UIFXList = slot0:findTF("map/UI_FX_list")

	for slot5 = 0, slot0.UIFXList:GetComponentsInChildren(typeof(Renderer)).Length - 1 do
		slot1[slot5].sortingOrder = -1
	end

	slot2 = GameObject.Find("LevelCamera").transform
	slot0.levelCam = slot2:GetComponent(typeof(Camera))
	slot0.uiMain = slot2:Find("Canvas/UIMain")

	setActive(slot0.uiMain, false)

	GetOrAddComponent(slot0.uiMain, typeof(Image)).color = Color.New(0, 0, 0, 0.5)
	slot0.uiCam = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	slot0.levelGrid = slot0.uiMain:Find("LevelGrid")

	setActive(slot0.levelGrid, true)

	slot0.dragLayer = slot0.levelGrid:Find("DragLayer")

	setImageAlpha(slot0.dragLayer, 0.27450980392156865)

	slot0.float = slot0:findTF("float")
	slot0.clouds = slot0:findTF("clouds", slot0.float)
	slot0.chapters = slot0:findTF("levels", slot0.float)

	setActive(slot0.clouds, true)

	slot0.resources = slot0:findTF("resources"):GetComponent("ItemList")
	slot0.arrowTarget = slot0.resources.prefabItem[0]
	slot0.bombEnemyTpl = slot0.resources.prefabItem[1]
	slot0.boxTpl = slot0.resources.prefabItem[2]
	slot0.championTpl = slot0.resources.prefabItem[3]
	slot0.deadTpl = slot0.resources.prefabItem[4]
	slot0.enemyTpl = slot0.resources.prefabItem[5]
	slot0.oniTpl = slot0.resources.prefabItem[6]
	slot0.rivalTpl = slot0.resources.prefabItem[7]
	slot0.shipTpl = slot0.resources.prefabItem[8]
	slot0.subTpl = slot0.resources.prefabItem[9]
	slot0.supplyTpl = slot0.resources.prefabItem[10]
	slot0.transportTpl = slot0.resources.prefabItem[11]
	slot0.transportTargetTpl = slot0.resources.prefabItem[12]

	setText(slot0:findTF("fighting/Text", slot0.enemyTpl), i18n("ui_word_levelui2_inevent"))
	setActive(slot0.arrowTarget, false)
	setActive(slot0.resources, false)
	setAnchoredPosition(slot0.topChapter, {
		y = 0
	})
	setAnchoredPosition(slot0.leftChapter, {
		x = 0
	})
	setAnchoredPosition(slot0.rightChapter, {
		x = 0
	})

	slot0.bubbleMsgBoxes = {}
	slot0.loader = AutoLoader.New()
end

function slot0.addbubbleMsgBox(slot0, slot1, slot2)
	if #slot0.bubbleMsgBoxes > 0 then
		table.insert(slot0.bubbleMsgBoxes, slot1)
	else
		slot3 = nil

		table.insert(slot0.bubbleMsgBoxes, slot1)
		function ()
			if uv0.bubbleMsgBoxes[1] then
				slot0(function ()
					table.remove(uv0.bubbleMsgBoxes, 1)
					uv1()
				end)
			elseif uv2 then
				uv2()
			end
		end()
	end
end

function slot0.initEvents(slot0)
	slot0:bind(LevelUIConst.OPEN_COMMANDER_PANEL, function (slot0, slot1, slot2, slot3)
		uv0:openCommanderPanel(slot1, slot2, slot3)
	end)
	slot0:bind(LevelUIConst.TRACK_CHAPTER, function (slot0, slot1, slot2)
		uv0:trackChapter(slot1, slot2)
	end)
	slot0:bind(LevelUIConst.HANDLE_SHOW_MSG_BOX, function (slot0, slot1)
		uv0:HandleShowMsgBox(slot1)
	end)
	slot0:bind(LevelUIConst.DO_AMBUSH_WARNING, function (slot0, slot1)
		uv0:doAmbushWarning(slot1)
	end)
	slot0:bind(LevelUIConst.DISPLAY_AMBUSH_INFO, function (slot0, slot1)
		uv0:displayAmbushInfo(slot1)
	end)
	slot0:bind(LevelUIConst.DISPLAY_STRATEGY_INFO, function (slot0, slot1)
		uv0:displayStrategyInfo(slot1)
	end)
	slot0:bind(LevelUIConst.FROZEN, function (slot0, slot1)
		uv0:frozen(slot1)
	end)
	slot0:bind(LevelUIConst.UN_FROZEN, function (slot0)
		uv0:unfrozen()
	end)
	slot0:bind(LevelUIConst.IS_FROZEN, function (slot0)
		uv0.levelStageView.isFrozen = uv0:isfrozen()
	end)
	slot0:bind(LevelUIConst.DESTROY_LEVEL_STAGE_VIEW, function (slot0)
		uv0:DestroyLevelStageView()
	end)
	slot0:bind(LevelUIConst.DO_TRACKING, function (slot0, slot1)
		uv0:doTracking(slot1)
	end)
	slot0:bind(LevelUIConst.SWITCH_TO_MAP, function ()
		uv0:switchToMap()
	end)
	slot0:bind(LevelUIConst.DISPLAY_REPAIR_WINDOW, function (slot0, slot1)
		uv0:displayRepairWindow(slot1)
	end)
	slot0:bind(LevelUIConst.DO_PLAY_ANIM, function (slot0, slot1)
		uv0:doPlayAnim(slot1.name, slot1.callback, slot1.onStart)
	end)
end

function slot0.updateBattleActivitys(slot0, slot1)
	slot0.battleActivitys = slot1
end

function slot0.updateBattleActivity(slot0, slot1)
	slot2 = Map.New({
		id = slot1
	})
	slot0.battleActivity = slot0.battleActivitys[1]
	slot3 = slot2:getConfig("on_activity")

	if slot2:getConfig("on_activity") ~= 0 then
		for slot7, slot8 in ipairs(slot0.battleActivitys) do
			if slot8.id == slot3 then
				slot0.battleActivity = slot8

				break
			end
		end
	end
end

function slot0.updatePtActivity(slot0, slot1)
	slot0.ptActivity = slot1

	slot0:updateActivityRes()
end

function slot0.updateActivityRes(slot0)
	slot2 = findTF(slot0.ptTotal, "icon/Image")

	if findTF(slot0.ptTotal, "Text") and slot2 and slot0.ptActivity then
		setText(slot1, "x" .. slot0.ptActivity.data1)
		GetImageSpriteFromAtlasAsync(pg.item_data_statistics[id2ItemId(tonumber(slot0.ptActivity:getConfig("config_id")))].icon, "", slot2, true)
	end
end

function slot0.updateBossBattleAct(slot0, slot1)
	slot0.bossBattleActivity = slot1

	if slot0.activityBossBattlePanel then
		slot0.activityBossBattlePanel:update(slot0.bossBattleActivity)
	end
end

function slot0.setCommanderPrefabs(slot0, slot1)
	slot0.commanderPrefabs = slot1
end

function slot0.didEnter(slot0)
	slot0.openedCommanerSystem = not LOCK_COMMANDER and pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "CommandRoomMediator")

	onButton(slot0, slot0:findTF("back_button", slot0.topChapter), function ()
		if uv0.contextData.map and (slot0:isActivity() or slot0:isEscort()) then
			uv0:emit(LevelMediator2.ON_SWITCH_NORMAL_MAP)

			return
		else
			uv0:emit(uv1.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.btnSpecial, function ()
		if uv0:isfrozen() then
			return
		end

		uv0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	onButton(slot0, slot0.dailyBtn, function ()
		if uv0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		uv0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(slot0, slot0.challengeBtn, function ()
		if uv0:isfrozen() then
			return
		end

		slot0, slot1 = uv0:checkChallengeOpen()

		if slot0 == false then
			pg.TipsMgr.GetInstance():ShowTips(slot1)
		else
			uv0:emit(LevelMediator2.CLICK_CHALLENGE_BTN)
		end
	end, SFX_PANEL)

	slot1 = slot0:checkChallengeOpen()

	setActive(slot0:findTF("lock", slot0.challengeBtn), not slot1)
	setGray(slot0.challengeBtn, not slot1, true)

	if slot1 and (not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE) or slot3:isEnd()) then
		setActive(slot0.challengeBtn, false)
	end

	onButton(slot0, slot0.militaryExerciseBtn, function ()
		if uv0:isfrozen() then
			return
		end

		uv0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(slot0, slot0.shamBtn, function ()
		if uv0:isfrozen() then
			return
		end

		slot0, slot1 = pg.SystemOpenMgr.GetInstance():isOpenSystem(uv0.player.level, "ShamPreCombatMediator")

		if slot0 then
			uv0:emit(LevelMediator2.ON_OPEN_SHAM)
		else
			pg.TipsMgr.GetInstance():ShowTips(slot1)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.normalBtn:Find("bg"), function ()
		if uv0:isfrozen() then
			return
		end

		uv0:setMap(uv0.contextData.map:getBindMap())
	end, SFX_PANEL)
	onButton(slot0, slot0.eliteBtn:Find("bg"), function ()
		if uv0:isfrozen() then
			return
		end

		if uv0.contextData.map:getBindMap() == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))

			if getProxy(ChapterProxy):getUseableMaxEliteMap() then
				uv0:setMap(slot1.configId)
				pg.TipsMgr.GetInstance():ShowTips(i18n("elite_warp_to_latest_map"))
			end
		elseif uv0.contextData.map:isEliteEnabled() then
			uv0:setMap(uv0.contextData.map:getBindMap())
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
		end
	end, SFX_UI_WEIGHANCHOR_HARD)
	onButton(slot0, slot0.remasterBtn:Find("bg"), function ()
		if uv0:isfrozen() then
			return
		end

		uv0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		SetActive(uv0.remasterTipTF, false)
	end, SFX_PANEL)
	onButton(slot0, slot0.signalBtn, function ()
		if uv0:isfrozen() then
			return
		end

		uv0:displaySignalPanel()
	end, SFX_PANEL)

	slot2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "EventMediator")

	setActive(slot0:findTF("lock", slot0.btnSpecial), not slot2)
	setGray(slot0.btnSpecial, not slot2, true)

	slot3 = pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "DailyLevelMediator")

	setActive(slot0:findTF("lock", slot0.dailyBtn), not slot3)
	setGray(slot0.dailyBtn, not slot3, true)

	slot4 = pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "MilitaryExerciseMediator")

	setActive(slot0:findTF("lock", slot0.militaryExerciseBtn), not slot4)
	setGray(slot0.militaryExerciseBtn, not slot4, true)

	slot7 = not ChapterConst.ActivateMirror and getProxy(ChapterProxy):getShamChapter():isOpen()

	setActive(slot0.shamBtn, slot7)

	if slot7 then
		setText(slot0:findTF("day", slot0.shamBtn), slot6:getRestDays())
	end

	slot8 = pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "ShamPreCombatMediator")

	setActive(slot0:findTF("lock", slot0.shamBtn), not slot8)
	setGray(slot0.shamBtn, not slot8, true)
	slot0:initMapBtn(slot0.btnPrev, -1)
	slot0:initMapBtn(slot0.btnNext, 1)
	slot0:emit(LevelMediator2.ON_EVENT_LIST_UPDATE)

	if slot0.contextData.editEliteChapter then
		slot0:displayFleetEdit(slot0.contextData.editEliteChapter)

		slot0.contextData.editEliteChapter = nil
	end

	for slot14, slot15 in ipairs(getProxy(ContextProxy):getContextByMediator(LevelMediator2).children) do
		slot0.levelCamIndices = slot0.levelCamIndices + 1

		function slot15.onRemoved()
			uv0:onSubLayerClose()
		end
	end

	if not slot0.contextData.isSwitchToChapter then
		slot0:tryPlaySubGuide()
	end

	if slot0.contextData.selectedChapterVO then
		slot0:displayFleetSelect(slot0.contextData.selectedChapterVO)
	end

	if slot5:ifShowRemasterTip() then
		SetActive(slot0.remasterTipTF, true)
	else
		SetActive(slot0.remasterTipTF, false)
	end

	if slot0.contextData.open_remaster then
		slot0:displayRemasterPanel(slot0.contextData.isSP)

		slot0.contextData.open_remaster = nil
	end
end

function slot0.checkChallengeOpen(slot0)
	return pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "ChallengeMainMediator")
end

function slot0.tryPlaySubGuide(slot0)
	pg.SystemGuideMgr.GetInstance():Play(slot0)
end

function slot0.onBackPressed(slot0)
	if slot0:isfrozen() or slot0.levelAmbushView and slot0.levelAmbushView:CheckState(BaseSubView.STATES.INITED) then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if slot0.levelInfoView then
		slot0:hideChapterPanel()

		return
	end

	if slot0.levelFleetView and slot0.levelFleetView:CheckState(BaseSubView.STATES.INITED) then
		slot0:hideFleetEdit()

		return
	end

	if slot0.levelSignalView and slot0.levelSignalView:CheckState(BaseSubView.STATES.INITED) then
		slot0:hideSignalPanel()

		return
	end

	if slot0.levelStrategyView and slot0.levelStrategyView:CheckState(BaseSubView.STATES.INITED) then
		slot0:hideStrategyInfo()

		return
	end

	if slot0.levelRepairView and slot0.levelRepairView:CheckState(BaseSubView.STATES.INITED) then
		slot0:hideRepairWindow()

		return
	end

	if slot0.levelRemasterView and slot0.levelRemasterView:CheckState(BaseSubView.STATES.INITED) then
		slot0:hideRemasterPanel()

		return
	end

	if isActive(slot0.helpPage) then
		setActive(slot0.helpPage, false)

		return
	end

	if slot0.contextData.chapterVO and getProxy(ChapterProxy):getActiveChapter() and slot1:getDataType() ~= ChapterConst.TypeGuild then
		slot0:switchToMap()

		return
	end

	triggerButton(slot0:findTF("back_button", slot0.topChapter))
end

function slot0.selectMap(slot0, slot1)
	if not slot0.contextData.mapIdx then
		if Map.lastMap and slot1[Map.lastMap] then
			slot2 = Map.lastMap
		else
			for slot6, slot7 in pairs(slot1) do
				if slot7:isUnlock() and slot7:getMapType() == Map.SCENARIO then
					slot2 = slot7.id
				end
			end
		end
	end

	return slot2
end

function slot0.setMaps(slot0, slot1)
	slot0.maps = slot1
end

function slot0.setShipGroups(slot0, slot1)
	slot0.shipGroups = slot1
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.updateRes(slot0, slot1)
	slot0.resPanel:setResources(slot1)

	if slot0.levelStageView and slot0.levelStageView:CheckState(BaseSubView.STATES.INITED) then
		slot0.levelStageView:SetPlayer(slot1)
	end

	slot0.player = slot1
end

function slot0.setEliteQuota(slot0, slot1, slot2)
	slot3 = slot2 - slot1

	if slot1 == slot2 then
		slot0:findTF("bg/Text", slot0.eliteQuota):GetComponent(typeof(Text)).color = Color.red
	else
		slot5.color = Color.New(0.47, 0.89, 0.27)
	end

	slot5.text = slot3 .. "/" .. slot2
end

function slot0.updateSubInfo(slot0, slot1, slot2)
	slot0.subRefreshCount = slot1
	slot0.subProgress = slot2

	setText(slot0.signalBtn:Find("nums"), slot0.subRefreshCount)
end

function slot0.updateLastFleet(slot0, slot1)
	slot0.lastFleetIndex = slot1
end

function slot0.updateEvent(slot0, slot1)
	setActive(slot0:findTF("tip", slot0.btnSpecial), slot1:hasFinishState())
end

function slot0.updateFleet(slot0, slot1)
	slot0.fleets = slot1
end

function slot0.updateChapterVO(slot0, slot1, slot2)
	if slot1:getDataType() == ChapterConst.TypeNone then
		slot4 = slot1:getConfig("map")
		slot5 = slot0.maps[slot4]

		slot5:updateChapter(slot1)
		slot5:updateChapters(slot0.maps[slot4 - 1])

		if not slot0.contextData.chapterVO then
			if slot0.contextData.mapIdx == slot4 then
				slot0:updateMapItems()
			end

			if slot0.levelSignalView and slot0.levelSignalView:CheckState(BaseSubView.STATES.INITED) then
				slot0.levelSignalView:ActionInvoke("flush")
			end
		end
	end

	if slot0.contextData.chapterVO and slot0.contextData.chapterVO:getDataType() == slot3 and slot0.contextData.chapterVO.id == slot1.id and slot1.active then
		slot0:setChapter(slot1)

		slot4 = false
		slot5 = false
		slot6 = false

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyFleet) > 0 then
			slot0.levelStageView:updateStageFleet()
			slot0.levelStageView:updateAmbushRate(slot1.fleet.line, true)

			slot6 = true

			if slot0.grid then
				slot0.grid:RefreshFleetCells()

				slot4 = true
			end
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyChampion) > 0 then
			slot6 = true

			if slot0.grid then
				slot0.grid:updateFleets()
				slot0.grid:clearChampions()
				slot0.grid:initChampions()

				slot5 = true
			end
		elseif bit.band(slot2, ChapterConst.DirtyChampionPosition) > 0 then
			slot6 = true

			if slot0.grid then
				slot0.grid:updateFleets()
				slot0.grid:updateChampions()

				slot5 = true
			end
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAchieve) > 0 then
			slot0.levelStageView:updateStageAchieve()
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAttachment) > 0 then
			slot0.levelStageView:updateAmbushRate(slot1.fleet.line, true)

			if slot3 == ChapterConst.TypeSham then
				slot0.levelStageView:updateShamProgress()
			end

			if slot0.grid then
				if slot2 >= 0 and bit.band(slot2, ChapterConst.DirtyFleet) <= 0 then
					slot0.grid:updateFleet(slot1.fleets[slot1.findex].id)
				end

				slot0.grid:updateAttachments()

				if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAutoAction) > 0 then
					slot0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
				else
					slot4 = true
				end
			end
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyStrategy) > 0 then
			slot0.levelStageView:updateStageStrategy()

			slot6 = true

			slot0.levelStageView:updateStageBarrier()
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAutoAction) > 0 then
			slot0.levelStageView:tryAutoAction()
		elseif slot4 then
			slot0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		elseif slot5 then
			slot0.grid:updateQuadCells(ChapterConst.QuadStateFrozen)
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyCellFlag) > 0 then
			slot0.grid:UpdateFloor()
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyBase) > 0 then
			slot0.levelStageView:UpdateDefenseStatus()
		end

		if slot6 then
			slot0.levelStageView:updateFleetBuff()
		end
	end
end

function slot0.updateClouds(slot0)
	slot0.cloudRTFs = {}
	slot0.cloudRects = {}
	slot0.cloudTimer = {}

	for slot4 = 1, 6 do
		slot6 = rtf(slot0:findTF("cloud_" .. slot4, slot0.clouds))

		table.insert(slot0.cloudRTFs, slot6)
		table.insert(slot0.cloudRects, slot6.rect.width)
	end

	slot0:initCloudsPos()

	for slot4, slot5 in ipairs(slot0.cloudRTFs) do
		slot9 = (slot0.mapWidth + slot0.cloudRects[slot4]) / (30 - (slot0.initPositions[slot4] or Vector2(0, 0)).y / 20)
		slot10 = nil
		slot10 = LeanTween.moveX(slot5, slot0.mapWidth, slot9):setRepeat(-1):setOnCompleteOnRepeat(true):setOnComplete(System.Action(function ()
			uv0 = uv1.cloudRects[uv2]
			uv3.anchoredPosition = Vector2(-uv0, uv4.y)

			uv5:setFrom(-uv0):setTime((uv1.mapWidth + uv0) / uv6)
		end))
		slot10.passed = math.random() * slot9
		slot0.cloudTimer[slot4] = slot10.uniqueId
	end
end

function slot0.updateCouldAnimator(slot0)
	if slot0.contextData.map:getConfig("animtor") == 1 then
		if slot0.tornadoTF and slot0.aniName ~= slot0.contextData.map:getConfig("ani_name") then
			slot0:destroyCloudAnimator()
		end

		function slot2()
			uv0.tornadoTF.transform.localScale = Vector3(uv0.tornadoTF.transform.parent.rect.width / uv0.tornadoTF.transform.rect.width, uv0.tornadoTF.transform.parent.rect.height / uv0.tornadoTF.transform.rect.height, 1)
		end

		if IsNil(slot0.tornadoTF) then
			if slot0.animtorLoading then
				return
			end

			slot0.animtorLoading = slot1

			PoolMgr.GetInstance():GetUI(slot1, true, function (slot0)
				if not uv1.contextData then
					function (slot0)
						PoolMgr.GetInstance():ReturnUI(uv0, slot0)
					end(slot0)

					return
				end

				if uv1.animtorLoading ~= uv1.contextData.map:getConfig("ani_name") then
					uv1.animtorLoading = nil

					slot1(slot0)

					return
				end

				uv1.animtorLoading = nil

				slot0:SetActive(uv1.contextData.map:getConfig("animtor") == 1 and not uv1.isSubLayerOpen)

				uv1.tornadoTF = slot0

				setParent(slot0, uv1:findTF("map"))
				tf(uv1.tornadoTF):SetSiblingIndex(1)

				uv1.aniName = uv0

				pg.ViewUtils.SetSortingOrder(slot0, ChapterConst.LayerWeightMapAnimation)
				uv2()
			end)
		else
			setParent(slot0.tornadoTF, slot0:findTF("map"))
			tf(slot0.tornadoTF):SetSiblingIndex(1)
			setActive(slot0.tornadoTF, true)
			slot2()
		end

		return
	end

	if not IsNil(slot0.tornadoTF) then
		setActive(slot0.tornadoTF, false)
	end
end

function slot0.updateActivityBtns(slot0)
	slot2 = slot0.contextData.map:isRemaster()
	slot4 = slot0.contextData.map:getConfig("type")

	setActive(slot0.activityBtn, not slot0.contextData.map:isActivity() and not slot0.contextData.map:isSkirmish() and (slot0.battleActivity and not slot0.battleActivity:isEnd()))

	if slot0.contextData.map:isEscort() then
		setActive(slot0.activityBtn, false)
	end

	setActive(slot0.signalBtn, getProxy(ChapterProxy):getChapterById(304) and slot7:isClear() and (slot4 == Map.SCENARIO or slot4 == Map.ELITE))

	slot8 = false
	slot10 = nil

	if ActivityLevelConst.hasExtraMap(slot0.maps) then
		slot8 = _.any(slot0.battleActivitys or {}, function (slot0)
			if slot0.id == uv0:getConfig("on_activity") then
				uv1 = slot0:getConfig("type")
			end

			return slot0.id == uv0:getConfig("on_activity")
		end)
	end

	slot11 = slot8 and slot4 == Map.ACT_EXTRA
	slot13 = ActivityLevelConst.getMapsByActivityType(slot0.maps, slot10)
	slot14 = ActivityLevelConst.isClearMaps(slot13, Map.ACTIVITY_EASY)
	slot15 = ActivityLevelConst.isClearMaps(slot13, Map.ACTIVITY_HARD)

	setActive(slot0.actExtraBtn.parent, slot8 and slot1 and not slot11 and not slot2)
	setActive(slot0.actEliteBtn.parent, slot0.contextData.map:existHardMap() and (slot4 == Map.ACTIVITY_EASY and (slot5 or slot2) or slot1 and slot11))
	setActive(slot0.actNormalBtn.parent, slot4 == Map.ACTIVITY_HARD and (slot5 or slot2) or slot1 and slot11)
	setActive(slot0.actExtraRank, slot1 and slot11)
	setActive(slot0.remasterBtn, OPEN_REMASTER and (slot4 == Map.SCENARIO or slot4 == Map.ELITE or slot2))
	setActive(slot0.ticketTxt.parent, slot2)

	if slot2 then
		setText(slot0.ticketTxt, slot6.remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
	end

	if slot1 then
		setActive(slot0.eliteQuota, false)
		slot0:updateActivityRes()
	end

	slot16 = slot0.contextData.map:getMapTitleNumber() == "EX"

	setActive(slot0.ptTotal, slot1 and not slot2 and slot16 and not ActivityConst.HIDE_PT_PANELS and slot0.ptActivity and not slot0.ptActivity:isEnd())
	setActive(slot0.actExchangeShopBtn, slot1 and not slot2 and slot16 and not ActivityConst.HIDE_PT_PANELS and slot5)
	setActive(slot0.eventContainer, (not slot1 or not slot16) and not slot3)
	setActive(slot0.mirrorBtn, false)

	if slot8 and slot1 and not slot11 and (slot12 and slot15 or not slot12 and slot14) then
		setActive(slot0.actExtraBtnAnim, true)
	else
		setActive(slot0.actExtraBtnAnim, false)
	end

	slot0:updateCountDown()
	slot0:registerActBtn()

	if slot1 and not slot11 then
		Map.lastMapForActivity = slot0.contextData.mapIdx
	end
end

function slot0.updateBossBattleMsg(slot0, slot1)
	if slot0.activityBossBattlePanel then
		slot0.activityBossBattlePanel:updateMsg(slot1)
	end
end

function slot0.updateCountDown(slot0)
	if slot0.newChapterCDTimer then
		slot0.newChapterCDTimer:Stop()

		slot0.newChapterCDTimer = nil
	end

	slot1 = 0

	if slot0.contextData.map:isRemaster() then
		if slot0.contextData.map.remasterId == getProxy(ChapterProxy):getActiveRemaster() then
			slot1 = math.max(slot2.remasterTime - pg.TimeMgr.GetInstance():GetServerTime(), 0)
		end

		setActive(slot0.countDown, true)
		setText(slot0.countDown:Find("title"), i18n(slot1 > 0 and "levelScene_chapter_open_count_down" or "levelScene_chapter_not_open"))
	elseif slot0.contextData.map:isActivity() then
		slot2 = getProxy(ActivityProxy)
		slot3 = pg.TimeMgr.GetInstance()

		_.each(pg.chapter_template.all, function (slot0)
			if (pg.expedition_data_by_map[pg.chapter_template[slot0].map].type == Map.ACTIVITY_HARD or slot2.type == Map.ACTIVITY_HARD) and pg.activity_template[slot1.act_id] and slot3.time and #slot3.time == 3 and uv0:parseTimeFromConfig(slot3.time[2]) - uv0:GetServerTime() > 0 then
				if uv1 == 0 then
					uv1 = slot4
				else
					uv1 = math.min(uv1, slot4)
				end
			end
		end)
		setActive(slot0.countDown, slot1 > 0)
		setText(slot0.countDown:Find("title"), i18n("levelScene_new_chapter_coming"))
	else
		setActive(slot0.countDown, false)
	end

	if slot1 > 0 then
		setText(slot0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(slot1))

		slot0.newChapterCDTimer = Timer.New(function ()
			uv0 = uv0 - 1

			if uv0 <= 0 then
				uv1:updateCountDown()

				if not uv1.contextData.chapterVO then
					uv1:setMaps(getProxy(ChapterProxy):getMaps())
					uv1:setMap(uv1.contextData.mapIdx)
				end
			else
				setText(uv1.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(uv0))
			end
		end, 1, -1)

		slot0.newChapterCDTimer:Start()
	else
		setText(slot0.countDown:Find("time"), "")
	end
end

function slot0.registerActBtn(slot0)
	if slot0.isRegisterBtn then
		return
	end

	slot0.isRegisterBtn = true

	onButton(slot0, slot0.actExtraRank, function ()
		if uv0:isfrozen() then
			return
		end

		uv0:emit(LevelMediator2.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(slot0, slot0.actExtraBtn, function ()
		if uv0:isfrozen() then
			return
		end

		uv0:emit(LevelMediator2.ON_ENTER_EXTRA_CHAPTER)
	end, SFX_PANEL)
	onButton(slot0, slot0.activityBtn, function ()
		if uv0:isfrozen() then
			return
		end

		uv0:emit(LevelMediator2.ON_ACTIVITY_MAP)
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.actExchangeShopBtn, function ()
		if uv0:isfrozen() then
			return
		end

		uv0:emit(LevelMediator2.GO_ACT_SHOP)
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.mirrorBtn, function ()
		if uv0:isfrozen() then
			return
		end

		slot0, slot1 = pg.SystemOpenMgr.GetInstance():isOpenSystem(uv0.player.level, "ShamPreCombatMediator")

		if slot0 then
			uv0:emit(LevelMediator2.ON_OPEN_SHAM)
		else
			pg.TipsMgr.GetInstance():ShowTips(slot1)
		end
	end, SFX_UI_CLICK)

	function slot1()
		slot0 = nil

		for slot4, slot5 in pairs(uv0.maps) do
			if slot5:getActiveChapter() then
				slot0 = slot6:getConfig("name")

				break
			end
		end

		if slot0 then
			uv0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("activity_level_inwarime_tip", string.split(slot0, "|")[1])
			})

			return true
		end

		return false
	end

	function slot2(slot0, slot1)
		if ActivityLevelConst.getMapsByType(uv0.maps, slot0, slot1)[1] and uv0.maps[slot3.id - 1] and not slot4:isClearForActivity() then
			return false
		end

		return true
	end

	onButton(slot0, slot0.actEliteBtn, function ()
		if uv0:isfrozen() then
			return
		end

		if uv0.contextData.map:isRemaster() then
			if uv0.maps[slot0:getBindMap() - 1] and not slot2:isClearForActivity() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock"))

				return
			end

			uv0:setMap(slot0:getBindMap())

			return
		end

		if uv1() then
			return
		end

		if not uv2(Map.ACTIVITY_HARD, uv0.battleActivity.id) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock"))

			return
		end

		uv0:emit(LevelMediator2.ON_SWITCH_BIND_ACT_MAP, uv0.battleActivity.id, Map.ACTIVITY_HARD)
	end, SFX_PANEL)
	onButton(slot0, slot0.actNormalBtn, function ()
		if uv0:isfrozen() then
			return
		end

		if uv0.contextData.map:isRemaster() then
			uv0:setMap(slot0:getBindMap())

			return
		end

		if uv1() then
			return
		end

		if not uv2(Map.ACTIVITY_EASY, uv0.battleActivity.id) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock"))

			return
		end

		uv0:emit(LevelMediator2.ON_SWITCH_BIND_ACT_MAP, uv0.battleActivity.id, Map.ACTIVITY_EASY)
	end, SFX_PANEL)
end

function slot0.destroyCloudAnimator(slot0)
	if not IsNil(slot0.tornadoTF) then
		slot0.tornadoTF.transform.localScale = Vector3.one

		PoolMgr.GetInstance():ReturnUI(slot0.aniName, slot0.tornadoTF)

		slot0.tornadoTF = nil
	end
end

function slot0.initCloudsPos(slot0, slot1)
	slot0.initPositions = {}

	for slot7, slot8 in ipairs(slot0.cloudRTFs) do
		if pg.expedition_data_by_map[slot1 or 1].clouds_pos[slot7] then
			slot8.anchoredPosition = Vector2(slot9[1], slot9[2])

			table.insert(slot0.initPositions, slot8.anchoredPosition)
		else
			setActive(slot8, false)
		end
	end
end

function slot0.initMapBtn(slot0, slot1, slot2)
	onButton(slot0, slot1, function ()
		if uv0:isfrozen() then
			return
		end

		if uv0.maps[uv0.contextData.mapIdx + uv1] then
			if slot1:getMapType() == Map.ELITE and not slot1:isEliteEnabled() then
				slot0 = uv0.maps[slot1:getBindMap()].id

				pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))
			end

			if slot2 == Map.ACTIVITY_EASY or slot2 == Map.ACTIVITY_HARD then
				if uv0.maps[slot0 - 1] and not slot3:isClearForActivity() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_map_lock"))

					return
				elseif not slot1:isUnlock() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock_1"))

					return
				end
			end

			if not slot1:isUnlock() then
				slot3 = i18n("levelScene_map_lock")

				if uv0.maps[slot0 - 1] and slot4:isClear() then
					slot3 = i18n("levelScene_chapter_unlock_tip", slot1:getConfig("level_limit"))
				end

				pg.TipsMgr.GetInstance():ShowTips(slot3)

				return
			end

			uv0:setMap(slot0)
		end
	end, SFX_PANEL)
end

function slot0.setMap(slot0, slot1)
	slot0.contextData.mapIdx = slot1
	slot0.contextData.map = slot0.maps[slot1]

	if slot0.contextData.map:getMapType() == Map.ACT_EXTRA then
		PlayerPrefs.SetInt("ex_mapId", slot0.contextData.map.id)
		PlayerPrefs.Save()
	elseif slot0.contextData.map:isRemaster() then
		PlayerPrefs.SetInt("remaster_lastmap_" .. slot0.contextData.map.remasterId, slot1)
		PlayerPrefs.Save()
	end

	slot0:updateBattleActivity(slot1)
	slot0:updateMap()
	slot0:tryPlayMapStory()
end

function slot0.GetMapBuilder(slot0, slot1, slot2)
	if slot0.mapBuilder and slot0.mapBuilder:GetType() ~= slot1 then
		slot0.mapBuilder:Hide()

		slot0.mapBuilder = nil
	end

	slot0:GetMapBuilderInBuffer(slot1, function (slot0)
		uv0(slot0)
	end)
end

function slot0.GetMapBuilderInBuffer(slot0, slot1, slot2)
	if not slot0.mbDict[slot1] then
		slot0.mbDict[slot1] = import("view.level.MapBuilder." .. slot0.correspondingClass[slot1]).New(slot0._tf, slot0)
		slot0.mapBuilder = slot0.mbDict[slot1]

		slot0.mbDict[slot1]:Load(function ()
			uv0(uv1.mbDict[uv2])
		end)
	else
		slot0.mapBuilder = slot0.mbDict[slot1]

		slot2(slot0.mbDict[slot1])
	end
end

function slot0.updateMap(slot0)
	if slot0.contextData.map:getConfig("bgm") and #slot2 > 0 then
		playBGM(slot2)
	end

	seriesAsync({
		function (slot0)
			uv0:SwitchBG(uv1:getConfig("bg"))
			slot0()
		end,
		function (slot0)
			slot1 = nil

			if uv0:isNormalMap() then
				slot1 = uv1.TYPENORMAL
			elseif uv0:isSkirmish() then
				slot1 = uv1.TYPESKIRMISH
			elseif uv0:isEscort() then
				slot1 = uv1.TYPEESCORT
			end

			uv2:GetMapBuilder(slot1, function (slot0)
				uv0(slot0)
			end)
		end,
		function (slot0, slot1)
			slot1:Update(uv0)
			slot0()
		end,
		function (slot0)
			slot1 = uv0.maps[uv1.id - 1]

			setActive(uv0.btnPrev, slot1)
			setActive(uv0.btnNext, uv0.maps[uv1.id + 1])

			slot3 = Color.New(0.5, 0.5, 0.5, 1)

			setImageColor(uv0.btnPrevCol, slot1 and slot1:isUnlock() and Color.white or slot3)
			setImageColor(uv0.btnNextCol, slot2 and slot2:isUnlock() and Color.white or slot3)
			setActive(uv0:findTF("title_chapter", uv0.topChapter), not uv1:isSkirmish())
			setText(uv0.chapterName, string.split(uv1:getConfig("name"), "||")[1])

			if uv1:isEscort() then
				uv0.loader:GetSprite("chapterno", "chapterex", uv0.chapterNoTitle, true)
			else
				uv0.loader:GetSprite("chapterno", "chapter" .. uv1:getMapTitleNumber(), uv0.chapterNoTitle, true)
			end

			setActive(uv0.topChapter:Find("type_chapter"), uv1:isNormalMap())
			setActive(uv0.topChapter:Find("type_escort"), uv1:isEscort())
			setActive(uv0.topChapter:Find("type_skirmish"), uv1:isSkirmish())
			uv0:updateMapItems()
			uv0:switchDifficulty()
			uv0:updateActivityBtns()
			uv0:updateCouldAnimator()

			if uv0.contextData.openChapterId then
				uv0.mapBuilder:TryOpenChapter(uv0.contextData.openChapterId)

				uv0.contextData.openChapterId = nil
			end

			slot0()
		end
	})
end

function slot0.updateMapItems(slot0)
	for slot4 = 1, slot0.UIFXList.childCount do
		setActive(slot0.UIFXList:GetChild(slot4 - 1), false)
	end

	if slot0.contextData.map:getConfig("cloud_suffix") == "" then
		setActive(slot0.clouds, false)
	else
		setActive(slot0.clouds, true)

		slot6 = "clouds_pos"

		for slot6, slot7 in ipairs(slot1:getConfig(slot6)) do
			slot0.cloudRTFs[slot6]:GetComponent(typeof(Image)).enabled = false

			GetSpriteFromAtlasAsync("clouds/cloud_" .. slot6 .. "_" .. slot2, "", function (slot0)
				if not uv0.exited and not IsNil(uv1) and uv2 == uv0.contextData.map then
					uv1.enabled = true
					uv1.sprite = slot0

					uv1:SetNativeSize()

					uv0.cloudRects[uv3] = uv4.rect.width
				end
			end)
		end
	end

	slot0.mapBuilder:UpdateMapItems(slot1)
end

function slot0.TrySwitchChapter(slot0, slot1)
	if getProxy(ChapterProxy):getActiveChapter() then
		if slot3.id == slot1.id then
			slot0:switchToChapter(slot3)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_chapter_strategying", slot3:getConfig("chapter_name")))
		end
	else
		slot0:displayChapterPanel(slot1)
	end
end

function slot0.updateChapterTF(slot0, slot1)
	slot0.mapBuilder:UpdateChapterTF(slot1)
end

function slot0.tryPlayMapStory(slot0)
	if Application.isEditor and not ENABLE_GUIDE then
		return
	end

	if slot0.contextData.map:getConfig("enter_story") and slot1 ~= "" and not pg.SystemOpenMgr.GetInstance().active then
		pg.StoryMgr.GetInstance():Play(slot1, function (slot0)
			if not slot0 then
				if uv0.contextData.map:getConfig("guide_id") and slot1 ~= "" then
					pg.SystemGuideMgr.GetInstance():PlayByGuideId(slot1)
				else
					pg.SystemOpenMgr.GetInstance():notification(uv0.player.level)
				end
			else
				pg.SystemOpenMgr.GetInstance():notification(uv0.player.level)
			end
		end)
	else
		pg.SystemOpenMgr.GetInstance():notification(slot0.player.level)
	end
end

function slot0.displaySignalPanel(slot0)
	slot0.levelSignalView = LevelSignalView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelSignalView:Load()
	slot0.levelSignalView:ActionInvoke("set", slot0.maps, slot0.subRefreshCount, slot0.subProgress)
	slot0.levelSignalView:ActionInvoke("setCBFunc", function ()
		uv0:hideSignalPanel()
		uv0:emit(LevelMediator2.ON_REFRESH_SUB_CHAPTER)
	end, function (slot0)
		uv0:hideSignalPanel()

		if slot0.active then
			uv0:switchToChapter(slot0)
		elseif uv0.contextData.mapIdx ~= slot0:getConfig("map") then
			uv0:setMap(slot0:getConfig("map"))
		end
	end, function ()
		uv0:hideSignalPanel()
	end)
end

function slot0.hideSignalPanel(slot0)
	slot0.levelSignalView:Destroy()
end

function slot0.displaySpResult(slot0, slot1, slot2)
	setActive(slot0.spResult, true)
	slot0:doPlayAnim(slot1 == 1 and "SpUnitWin" or "SpUnitLose", function (slot0)
		onButton(uv0, slot0, function ()
			removeOnButton(uv0)
			setActive(uv0, false)
			uv1:hideSpResult()
			uv2()
		end, SFX_PANEL)
	end)
end

function slot0.hideSpResult(slot0)
	setActive(slot0.spResult, false)
end

function slot0.displayBombResult(slot0, slot1)
	setActive(slot0.spResult, true)
	slot0:doPlayAnim("SpBombRet", function (slot0)
		onButton(uv0, slot0, function ()
			removeOnButton(uv0)
			setActive(uv0, false)
			uv1:hideBombResult()
			uv2()
		end, SFX_PANEL)
	end, function (slot0)
		setText(slot0.transform:Find("right/name_bg/en"), uv0.contextData.chapterVO.modelCount)
	end)
end

function slot0.hideBombResult(slot0)
	setActive(slot0.spResult, false)
end

function slot0.displayChapterPanel(slot0, slot1, slot2)
	function slot3(slot0)
		if uv0.player.ship_bag_max <= getProxy(BayProxy):getShipCount() then
			NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)

			return
		end

		uv0:hideChapterPanel()

		slot3 = uv1:clone()
		slot3.loopFlag = slot0

		if slot3:getConfig("type") == Chapter.CustomFleet then
			uv0:displayFleetEdit(slot3)
		else
			uv0:displayFleetSelect(slot3, #slot3:getNpcShipByType(1) > 0)
		end
	end

	function slot4()
		uv0:hideChapterPanel()
	end

	if Map.IsType(slot1:getConfig("map"), Map.SKIRMISH) and #slot1:getNpcShipByType(1) > 0 then
		slot3(false)

		return
	end

	slot0.levelInfoView = LevelInfoView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelInfoView:Load()
	slot0.levelInfoView:ActionInvoke("set", slot1, slot2)
	slot0.levelInfoView:ActionInvoke("setCBFunc", slot3, slot4)
end

function slot0.hideChapterPanel(slot0)
	if slot0.levelInfoView then
		slot0.levelInfoView:Destroy()

		slot0.levelInfoView = nil
	end
end

function slot0.displayFleetSelect(slot0, slot1, slot2)
	if slot2 then
		if slot1:isValid() then
			slot0:trackChapter(slot1, function ()
				uv0:emit(LevelMediator2.ON_TRACKING, uv1.id, {}, uv1.loopFlag)
			end)
		end

		slot0.contextData.selectedChapterVO = nil
		slot0.contextData.selectedFleetIDs = nil

		return
	end

	slot3 = nil
	slot0.levelFleetView = LevelFleetView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelFleetView:Load()
	slot0.levelFleetView:ActionInvoke("setOpenCommanderTag", slot0.openedCommanerSystem)
	slot0.levelFleetView:ActionInvoke("set", slot1, slot0.fleets, (not slot0.contextData.selectedFleetIDs or slot0.contextData.selectedFleetIDs) and slot1:selectFleets(slot0.lastFleetIndex, slot0.fleets))
	slot0.levelFleetView:ActionInvoke("setCBFunc", function (slot0)
		if uv0:isTriesLimit() and not uv0:enoughTimes2Start() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_elite_no_quota"))

			return
		end

		if #uv0:getNpcShipByType(2) > 0 then
			slot2 = {
				[TeamType.Vanguard] = #uv1.fleets[slot0[1]]:getTeamByName(TeamType.Vanguard),
				[TeamType.Main] = #uv1.fleets[slot0[1]]:getTeamByName(TeamType.Main)
			}
			slot3 = {
				[TeamType.Vanguard] = 0,
				[TeamType.Main] = 0
			}
			slot4 = nil

			for slot8, slot9 in ipairs(slot1) do
				slot4 = slot9
				slot10 = slot9:getTeamType()
				slot3[slot10] = slot3[slot10] + 1

				if slot2[slot10] + slot3[slot10] > 3 then
					break
				end
			end

			for slot8, slot9 in pairs(slot2) do
				if slot9 + slot3[slot8] > 3 then
					uv1:HandleShowMsgBox({
						modal = true,
						hideNo = true,
						content = i18n("chapter_tip_with_npc", slot4.name)
					})

					return
				end
			end
		end

		slot2 = false
		slot3 = ""

		for slot7, slot8 in ipairs(slot0) do
			slot9, slot3 = uv1.fleets[slot8]:GetEnergyStatus()

			if slot9 then
				break
			end
		end

		if slot2 then
			uv1:HandleShowMsgBox({
				content = slot3,
				onYes = function ()
					uv0:hideFleetSelect()

					if not uv1:isValid() then
						return
					end

					uv0:trackChapter(uv1, function ()
						uv0:emit(LevelMediator2.ON_TRACKING, uv1.id, uv2, uv1.loopFlag)
					end)
				end
			})
		else
			slot4()
		end

		uv1.contextData.selectedChapterVO = nil
		uv1.contextData.selectedFleetIDs = nil
	end, function ()
		uv0.contextData.selectedChapterVO = nil
		uv0.contextData.selectedFleetIDs = nil

		uv0:hideFleetSelect()
	end)
end

function slot0.updateFleetSelect(slot0)
	if slot0.levelFleetView and slot0.levelFleetView:GetLoaded() then
		slot0.levelFleetView:ActionInvoke("set", slot0.levelFleetView.chapter, slot0.fleets, slot0.levelFleetView.selects)

		if slot0.levelCMDFormationView and slot0.levelCMDFormationView:GetLoaded() and slot0.fleets[slot0.levelCMDFormationView.fleet.id] then
			slot0.levelCMDFormationView:ActionInvoke("updateFleet", slot2)
		end
	end
end

function slot0.hideFleetSelect(slot0)
	if slot0.levelCMDFormationView and slot0.levelCMDFormationView._state ~= 5 then
		slot0.levelCMDFormationView:Destroy()
	end

	slot0.levelFleetView:Destroy()
end

function slot0.displayFleetEdit(slot0, slot1)
	slot0.levelFleetView = LevelFleetView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelFleetView:Load()
	slot0.levelFleetView:ActionInvoke("setOpenCommanderTag", slot0.openedCommanerSystem)
	slot0.levelFleetView:ActionInvoke("setHardShipVOs", slot0.shipVOs)
	slot0.levelFleetView:ActionInvoke("setCBFuncOnHard", function (slot0, slot1)
		uv0:hideFleetEdit(slot0, slot1)
	end)
	slot0.levelFleetView:ActionInvoke("setOnHard", slot1)
end

function slot0.updateFleetEdit(slot0, slot1, slot2)
	if slot0.levelFleetView and slot0.levelFleetView:GetLoaded() then
		slot3 = slot0.contextData.map

		if slot1 and slot0.levelFleetView.chapter.id == slot1.id then
			slot0.levelFleetView:ActionInvoke("setOnHard", slot1)
		end

		if slot1 and slot0.levelCMDFormationView and slot0.levelCMDFormationView:GetLoaded() then
			slot0.levelCMDFormationView:ActionInvoke("updateFleet", slot1:wrapEliteFleet(slot2))
		end
	end
end

function slot0.hideFleetEdit(slot0, slot1)
	if slot1 then
		slot0:emit(LevelMediator2.ON_UPDATE_CUSTOM_FLEET, slot1.id)
	end

	if slot0.levelCMDFormationView and slot0.levelCMDFormationView._state ~= 5 then
		slot0.levelCMDFormationView:Destroy()
	end

	if slot0.levelFleetView and slot0.levelFleetView._state ~= 5 then
		slot0.levelFleetView:Destroy()
	end
end

function slot0.isCrossStoryLimit(slot0, slot1)
	slot2 = true

	if slot1 ~= "" and #slot1 > 0 then
		slot2 = _.all(slot1, function (slot0)
			if slot0[1] == 1 then
				return getProxy(TaskProxy):getTaskById(slot0[2]) and not slot2:isFinish()
			end

			return false
		end)
	end

	return slot2
end

function slot0.switchDifficulty(slot0)
	slot1 = slot0.contextData.map
	slot2 = slot1:getConfig("type")

	if slot1:getConfig("uifx") ~= "" then
		setActive(slot0:findTF(slot3, slot0.UIFXList), true)
	end

	if Map.EVENT == slot2 then
		setActive(slot0.normalBtn, false)
		setActive(slot0.eliteBtn, false)
	else
		setActive(slot0.normalBtn, slot2 == Map.ELITE)
		setActive(slot0.eliteQuota, slot2 == Map.ELITE)
		setActive(slot0.eliteBtn, slot2 == Map.SCENARIO)
		setActive(slot0.eliteBtn:Find("bg/pic_activity"), getProxy(ActivityProxy):getActivityById(ActivityConst.ELITE_AWARD_ACTIVITY_ID) and not slot5:isEnd())
	end
end

function slot0.trackChapter(slot0, slot1, slot2)
	slot3 = nil

	coroutine.wrap(function ()
		slot1 = getProxy(ChapterProxy)

		if uv0.contextData.map:isRemaster() and slot0.remasterId ~= slot1:getActiveRemaster() then
			uv0:HandleShowMsgBox({
				content = i18n("levelScene_activate_remaster"),
				onYes = function ()
					onNextTick(uv0)
				end
			})
			coroutine.yield()

			if slot1.remasterTickets <= 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_tickets_not_enough"))

				return
			end

			uv0:emit(LevelMediator2.ON_ACTIVATE_REMASTER, slot0.remasterId, function ()
				onNextTick(uv0)
			end)
			coroutine.yield()
		end

		if uv2:getConfig("enter_story") and slot2 ~= "" and uv0:isCrossStoryLimit(uv2:getConfig("enter_story_limit")) then
			pg.StoryMgr.GetInstance():Play(slot2, function ()
				onNextTick(uv0)
			end)
			coroutine.yield()
		end

		if uv3 then
			uv3()
		end
	end)()
end

function slot0.setChapter(slot0, slot1)
	slot2 = nil

	if slot1 then
		if slot1:getDataType() == ChapterConst.TypeNone then
			slot1 = slot0.maps[slot0.contextData.mapIdx]:getChapter(slot1.id)
		end
	end

	slot0.contextData.chapterId = slot2
	slot0.contextData.chapterVO = slot1
end

function slot0.switchToChapter(slot0, slot1, slot2)
	slot4 = slot0.contextData.map:getConfig("type")

	if slot1:getDataType() == ChapterConst.TypeSham and slot4 ~= Map.SHAM or slot3 == ChapterConst.TypeGuild and slot4 ~= Map.GUILD_BOSS then
		slot0.contextData.chapterMapIdx = slot0.contextData.mapIdx
	end

	if slot0.contextData.mapIdx ~= slot1:getConfig("map") then
		slot0:setMap(slot1:getConfig("map"))
	end

	slot0:setChapter(slot1)
	setActive(slot0.clouds, false)
	slot0.mapBuilder:Hide()

	slot0.leftCanvasGroup.blocksRaycasts = false
	slot0.rightCanvasGroup.blocksRaycasts = false

	slot0:onSubLayerContextChange()

	if not slot0.levelStageView then
		slot0.levelStageView = LevelStageView.New(slot0.topPanel, slot0.event, slot0.contextData)

		slot0.levelStageView:Load()
	end

	slot0:frozen(function ()
		uv0.levelStageView:tryAutoAction(function ()
			uv0.levelStageView:DoSafeCheckOnBegin()
		end)
	end)
	slot0.levelStageView:ActionInvoke("SetSeriesOperation", function ()
		seriesAsync({
			function (slot0)
				pg.UIMgr.GetInstance():BlurPanel(uv0.topPanel, false)
				onNextTick(slot0)
			end,
			function (slot0)
				uv0.levelStageView:updateStageInfo()
				uv0.levelStageView:updateAmbushRate(uv1.fleet.line, true)
				uv0.levelStageView:updateStageAchieve()
				uv0.levelStageView:updateStageBarrier()
				uv0.levelStageView:updateBombPanel()
				uv0.levelStageView:UpdateDefenseStatus()

				if uv2 == ChapterConst.TypeSham then
					uv0.levelStageView:updateShamProgress()
				end

				onNextTick(slot0)
			end,
			function (slot0)
				uv0.levelStageView:updateStageStrategy()
				onNextTick(slot0)
			end,
			function (slot0)
				uv0.levelStageView:updateStageFleet()
				uv0.levelStageView:updateFleetBuff()
				onNextTick(slot0)
			end,
			function (slot0)
				slot1 = {
					count = 0,
					amount = 2
				}

				function slot2()
					uv0.count = uv0.count + 1

					if uv0.amount <= uv0.count then
						onNextTick(uv1)
					end
				end

				slot3 = uv0:getConfig("scale")

				uv1:RecordTween("mapScale", LeanTween.value(go(uv1.map), uv1.map.localScale, Vector3.New(slot3[3], slot3[3], 1), uv2):setOnUpdateVector3(function (slot0)
					uv0.map.localScale = slot0
					uv0.float.localScale = slot0
				end):setOnComplete(System.Action(slot2)):setEase(LeanTweenType.easeOutSine).uniqueId)

				uv1.lastRecordPivot = uv1.map.pivot
				slot5 = LeanTween.value(go(uv1.map), uv1.map.pivot, Vector2.New(math.clamp(slot3[1] - 0.5, 0, 1), math.clamp(slot3[2] - 0.5, 0, 1)), uv2)

				slot5:setOnUpdateVector2(function (slot0)
					uv0.map.pivot = slot0
					uv0.float.pivot = slot0
				end):setEase(LeanTweenType.easeOutSine)
				uv1:RecordTween("mapPivot", slot5.uniqueId)
				shiftPanel(uv1.leftChapter, -uv1.leftChapter.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
				shiftPanel(uv1.rightChapter, uv1.rightChapter.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
				shiftPanel(uv1.topChapter, 0, uv1.topChapter.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
				uv1.levelStageView:ShiftStagePanelIn()
				uv1:SwitchBG(uv0:getConfig("bg"), slot2)

				if uv0:getConfig("bgm") and #slot7 > 0 then
					playBGM(slot7)
				end
			end,
			function (slot0)
				setActive(uv0.topChapter, false)
				setActive(uv0.leftChapter, false)
				setActive(uv0.rightChapter, false)

				uv0.leftCanvasGroup.blocksRaycasts = true
				uv0.rightCanvasGroup.blocksRaycasts = true

				uv0:initGrid(slot0)
			end,
			function (slot0)
				uv0.levelStageView:SetGrid(uv0.grid)

				uv0.contextData.huntingRangeVisibility = uv0.contextData.huntingRangeVisibility - 1

				uv0.grid:toggleHuntingRange()
				slot0()
			end,
			function (slot0)
				if uv0:getConfig("pop_pic") and #slot1 > 0 and uv1.FirstEnterChapter == uv0.id then
					uv1:doPlayAnim(slot1, function (slot0)
						setActive(slot0, false)
						uv0()
					end)

					uv1.FirstEnterChapter = nil
				else
					slot0()
				end
			end,
			function (slot0)
				uv0:unfrozen()

				if uv1 then
					uv1()
				end
			end
		})
	end)
	slot0.levelStageView:ActionInvoke("SetPlayer", slot0.player)
	slot0.levelStageView:ActionInvoke("SwitchToChapter", slot1)
end

function slot0.switchToMap(slot0)
	slot2 = ChapterConst.TypeNone

	if slot0.contextData.chapterVO then
		slot2 = slot1:getDataType()
	end

	slot3 = getProxy(ChapterProxy)

	if slot1:getMapType() == Map.ESCORT and OPEN_ESCORT and (#slot3.escortMaps == 0 or _.any(slot4, function (slot0)
		return slot0:shouldFetch()
	end)) then
		slot0:emit(LevelMediator2.ON_FETCH_ESCORT)

		return
	end

	if slot3.subNextReqTime < pg.TimeMgr.GetInstance():GetServerTime() then
		slot0:emit(LevelMediator2.ON_FETCH_SUB_CHAPTER)

		return
	end

	slot0:frozen()
	slot0:destroyGrid()
	slot0:RecordTween("mapScale", LeanTween.value(go(slot0.map), slot0.map.localScale, Vector3.one, uv0):setOnUpdateVector3(function (slot0)
		uv0.map.localScale = slot0
		uv0.float.localScale = slot0
	end):setOnComplete(System.Action(function ()
		uv0:unfrozen()
	end)):setEase(LeanTweenType.easeOutSine).uniqueId)

	slot6 = LeanTween.value(go(slot0.map), slot0.map.pivot, slot0.lastRecordPivot or Vector2.zero, uv0)

	slot6:setOnUpdateVector2(function (slot0)
		uv0.map.pivot = slot0
		uv0.float.pivot = slot0
	end):setEase(LeanTweenType.easeOutSine)
	slot0:RecordTween("mapPivot", slot6.uniqueId)
	setActive(slot0.topChapter, true)
	setActive(slot0.leftChapter, true)
	setActive(slot0.rightChapter, true)
	shiftPanel(slot0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

	if slot0.levelStageView then
		slot0.levelStageView:ShiftStagePanelOut(function ()
			if not uv0.contextData.chapterVO then
				uv0:DestroyLevelStageView()
			end
		end)
	end

	slot0:SwitchBG(slot0.contextData.map:getConfig("bg"))

	if slot0.contextData.map:getConfig("bgm") and #slot8 > 0 then
		playBGM(slot8)
	end

	pg.UIMgr.GetInstance():UnblurPanel(slot0.topPanel, slot0._tf)

	if slot0.ambushWarning and slot0.ambushWarning.activeSelf then
		slot0.ambushWarning:SetActive(false)
		slot0:unfrozen()
	end

	slot0:onSubLayerContextChange()
	slot0:setChapter(nil)

	if slot2 == ChapterConst.TypeSham then
		slot0.contextData.mapIdx = slot0.contextData.chapterMapIdx
		slot0.contextData.chapterMapIdx = nil

		slot0:setMap(slot0:selectMap(slot0.maps))
	elseif slot2 == ChapterConst.TypeNone then
		slot0:updateMapItems()
		slot0:switchDifficulty()
		slot0:updateActivityBtns()
	end
end

function slot0.SwitchBG(slot0, slot1, slot2)
	if not slot1 or #slot1 <= 0 then
		if slot2 then
			slot2()
		end
	elseif slot0.currentBG ~= slot1 then
		slot0.currentBG = slot1

		GetSpriteFromAtlasAsync("levelmap/" .. slot1, "", function (slot0)
			if not IsNil(uv0.map) and uv1 == uv0.currentBG then
				setImageSprite(uv0.map, slot0, true)

				if uv2 then
					uv2()
				end
			end
		end)
	end
end

function slot0.DestroyLevelStageView(slot0)
	if slot0.levelStageView then
		slot0.levelStageView:Destroy()

		slot0.levelStageView = nil
	end
end

function slot0.displayAmbushInfo(slot0, slot1)
	slot0.levelAmbushView = LevelAmbushView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelAmbushView:Load()
	slot0.levelAmbushView:ActionInvoke("SetFuncOnComplete", slot1)
end

function slot0.hideAmbushInfo(slot0)
	if slot0.levelAmbushView then
		slot0.levelAmbushView:Destroy()
	end
end

function slot0.doAmbushWarning(slot0, slot1)
	slot0:frozen()

	function slot2()
		uv0.ambushWarning:SetActive(true)

		slot0 = tf(uv0.ambushWarning)

		slot0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		slot0:SetSiblingIndex(1)

		slot1 = slot0:GetComponent("DftAniEvent")

		slot1:SetTriggerEvent(function (slot0)
			uv0()
		end)
		slot1:SetEndEvent(function (slot0)
			uv0.ambushWarning:SetActive(false)
			uv0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		Timer.New(function ()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		end, 1, 1):Start()
	end

	if not slot0.ambushWarning then
		PoolMgr.GetInstance():GetUI("ambushwarnui", true, function (slot0)
			slot0:SetActive(true)

			uv0.ambushWarning = slot0

			uv1()
		end)
	else
		slot2()
	end
end

function slot0.destroyAmbushWarn(slot0)
	if slot0.ambushWarning then
		PoolMgr.GetInstance():ReturnUI("ambushwarnui", slot0.ambushWarning)

		slot0.ambushWarning = nil
	end
end

function slot0.displayStrategyInfo(slot0, slot1)
	slot0.levelStrategyView = LevelStrategyView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelStrategyView:Load()
	slot0.levelStrategyView:ActionInvoke("set", slot1)
	slot0.levelStrategyView:ActionInvoke("setCBFunc", function ()
		slot0 = uv0.contextData.chapterVO
		slot1 = slot0:getDataType()
		slot3 = pg.strategy_data_template[uv1.id]

		if not slot0.fleet:canUseStrategy(uv1) then
			return
		end

		if slot3.type == ChapterConst.StgTypeForm then
			uv0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = slot2:getNextStgUser(uv1.id),
				arg1 = uv1.id
			})
		elseif slot3.type == ChapterConst.StgTypeConsume then
			uv0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = slot4,
				arg1 = uv1.id
			})
		end

		uv0:hideStrategyInfo()
	end, function ()
		uv0:hideStrategyInfo()
	end)
end

function slot0.selectStrategyTarget(slot0, slot1, slot2)
	slot5 = slot0.contextData.chapterVO.fleet.line
	slot6 = {}

	if slot1.id == ChapterConst.StrategyAirStrike then
		slot6 = slot3:calcAreaCells(slot5.row, slot5.column, slot1.arg[2], slot1.arg[3])
	elseif slot1.id == ChapterConst.StrategyCannon then
		slot6 = slot3:calcAreaCells(slot5.row, slot5.column, 0, slot1.arg[2])
	end

	slot6 = _.filter(slot6, function (slot0)
		return not uv0:existFleet(nil, slot0.row, slot0.column)
	end)

	_.each(slot6, function (slot0)
		uv0.grid:shiningTarget(slot0.row, slot0.column, true)
	end)
	slot0.grid:updateQuadCells(ChapterConst.QuadStateStrategy, slot6, function (slot0)
		_.each(uv0, function (slot0)
			uv0.grid:shiningTarget(slot0.row, slot0.column, false)
		end)

		if slot0 and _.any(uv0, function (slot0)
			return slot0.row == uv0.row and slot0.column == uv0.column
		end) and uv2:existEnemy(ChapterConst.SubjectPlayer, slot0.row, slot0.column) then
			uv3(slot0.row, slot0.column)
		else
			uv1.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		end
	end)
end

function slot0.hideStrategyInfo(slot0)
	slot0.levelStrategyView:Destroy()
end

function slot0.displayRepairWindow(slot0, slot1)
	slot4 = getProxy(ChapterProxy)
	slot5, slot6, slot7, slot8 = nil

	if slot0.contextData.chapterVO:getDataType() == ChapterConst.TypeSham then
		slot5 = slot2.repairTimes
		slot6, slot7, slot8 = ChapterConst.GetShamRepairParams()
	elseif slot3 == ChapterConst.TypeNone then
		slot5 = slot4.repairTimes
		slot6, slot7, slot8 = ChapterConst.GetRepairParams()
	end

	slot0.levelRepairView = LevelRepairView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelRepairView:Load()
	slot0.levelRepairView:ActionInvoke("set", slot5, slot6, slot7, slot8)
	slot0.levelRepairView:ActionInvoke("setCBFunc", function ()
		if uv0 - math.min(uv1, uv0) == 0 and uv2.player:getTotalGem() < uv3 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
		end

		uv2:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRepair,
			id = uv4.fleet.id,
			arg1 = uv5.id
		})
		uv2:hideRepairWindow()
	end, function ()
		uv0:hideRepairWindow()
	end)
end

function slot0.hideRepairWindow(slot0)
	slot0.levelRepairView:Destroy()
end

function slot0.displayRemasterPanel(slot0, slot1)
	slot2 = getProxy(ChapterProxy)
	slot3 = {}
	slot4 = pg.TimeMgr.GetInstance()

	for slot8, slot9 in ipairs(pg.re_map_template.all) do
		table.insert(slot3, pg.re_map_template[slot9])
	end

	slot0.levelRemasterView = LevelRemasterView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelRemasterView:Load()
	slot0.levelRemasterView:ActionInvoke("set", slot3, slot2.remasterTickets, slot1)
	slot0.levelRemasterView:ActionInvoke("setCBFunc", function (slot0)
		uv0:setMap(PlayerPrefs.HasKey("remaster_lastmap_" .. slot0.id) and PlayerPrefs.GetInt("remaster_lastmap_" .. slot0.id) or pg.chapter_template[slot0.config_data[1]].map)
		uv0:hideRemasterPanel()
	end, function ()
		uv0:hideRemasterPanel()
	end)
end

function slot0.hideRemasterPanel(slot0)
	slot0.levelRemasterView:Destroy()
end

function slot0.initGrid(slot0, slot1)
	slot2 = slot0.contextData.chapterVO

	slot0:enableLevelCamera()
	setActive(slot0.uiMain, true)

	slot0.levelGrid.localEulerAngles = Vector3(slot2.theme.angle, 0, 0)
	slot0.grid = LevelGrid.New(slot0.dragLayer)

	slot0.grid:attach(slot0)
	slot0.grid:setItems(slot0.shipTpl, slot0.subTpl, slot0.transportTpl, slot0.transportTargetTpl, slot0.enemyTpl, slot0.deadTpl, slot0.boxTpl, slot0.supplyTpl, slot0.rivalTpl, slot0.championTpl, slot0.spineTpl, slot0.oniTpl, slot0.oniTargetTpl, slot0.bombEnemyTpl, slot0.arrowTarget)
	slot0.grid:ExtendItem("destinationMarkTpl", slot0.destinationMarkTpl)

	function slot0.grid.onCellClick(slot0)
		uv0:clickGridCell(slot0)
	end

	if slot2:getDataType() == ChapterConst.TypeNone then
		function slot0.grid.onShipStepChange(slot0)
			uv0.levelStageView:updateAmbushRate(slot0)
		end
	end

	function slot0.grid.onShipArrived()
		uv0:overrideChapter()
		uv0.levelStageView:updateAmbushRate(uv0.contextData.chapterVO.fleet.line, true)
		uv0.levelStageView:updateStageStrategy()
	end

	slot0.grid:initAll(function ()
		uv0:tryFocusForGuide()
		uv1()
	end)
end

function slot0.tryFocusForGuide(slot0)
	if pg.GuideMgr.GetInstance():isRuning() and slot0.contextData.chapterVO:findChapterCell(ChapterConst.AttachBoss) then
		slot0.grid:focusOnCell(slot2)
	end
end

function slot0.destroyGrid(slot0)
	if slot0.grid then
		slot0.grid:detach()

		slot0.grid = nil

		slot0:disableLevelCamera()
		setActive(slot0.dragLayer, true)
		setActive(slot0.uiMain, false)
	end
end

function slot0.clickGridCell(slot0, slot1)
	if not slot0:isfrozen() then
		slot0.levelStageView:clickGridCell(slot1)
	end
end

function slot0.doTracking(slot0, slot1)
	slot0:frozen()

	function slot2()
		uv0.radar:SetActive(true)

		slot0 = tf(uv0.radar)

		slot0:SetParent(uv0.topPanel, false)
		slot0:SetSiblingIndex(1)
		slot0:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
			uv0.radar:SetActive(false)
			uv0:unfrozen()
			uv1()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WEIGHANCHOR_SEARCH)
	end

	if not slot0.radar then
		PoolMgr.GetInstance():GetUI("RadarEffectUI", true, function (slot0)
			slot0:SetActive(true)

			uv0.radar = slot0

			uv1()
		end)
	else
		slot2()
	end
end

function slot0.destroyTracking(slot0)
	if slot0.radar then
		PoolMgr.GetInstance():ReturnUI("RadarEffectUI", slot0.radar)

		slot0.radar = nil
	end
end

function slot0.doPlayAirStrike(slot0, slot1, slot2, slot3)
	function slot4()
		uv0.playing = true

		uv0:frozen()
		uv0.airStrike:SetActive(true)

		slot0 = tf(uv0.airStrike)

		slot0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		slot0:SetAsLastSibling()
		setActive(slot0:Find("words/be_striked"), uv1 == ChapterConst.SubjectChampion)
		setActive(slot0:Find("words/strike_enemy"), uv1 == ChapterConst.SubjectPlayer)
		slot0:GetComponent("DftAniEvent"):SetEndEvent(function ()
			uv0.playing = false

			SetActive(uv0.airStrike, false)

			if uv1 then
				uv1()
			end

			uv0:unfrozen()
		end)

		if uv3 then
			onButton(uv0, slot0, slot1, SFX_PANEL)
		else
			removeOnButton(slot0)
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not slot0.airStrike then
		PoolMgr.GetInstance():GetUI("AirStrike", true, function (slot0)
			slot0:SetActive(true)

			uv0.airStrike = slot0

			uv1()
		end)
	else
		slot4()
	end
end

function slot0.destroyAirStrike(slot0)
	if slot0.airStrike then
		slot0.airStrike:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("AirStrike", slot0.airStrike)

		slot0.airStrike = nil
	end
end

function slot0.doPlayAnim(slot0, slot1, slot2, slot3)
	slot0.uiAnims = slot0.uiAnims or {}

	function slot5()
		uv0.playing = true

		uv0:frozen()
		uv1:SetActive(true)

		slot0 = tf(uv1)

		slot0:SetParent(uv0.topPanel, false)
		slot0:SetAsLastSibling()

		if uv2 then
			uv2(uv1)
		end

		slot0:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
			uv0.playing = false

			if uv1 then
				uv1(uv2)
			end

			uv0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not slot0.uiAnims[slot1] then
		PoolMgr.GetInstance():GetUI(slot1, true, function (slot0)
			slot0:SetActive(true)

			uv0.uiAnims[uv1] = slot0
			uv2 = uv0.uiAnims[uv1]

			uv3()
		end)
	else
		slot5()
	end
end

function slot0.destroyUIAnims(slot0)
	if slot0.uiAnims then
		for slot4, slot5 in pairs(slot0.uiAnims) do
			slot5:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(slot4, slot5)
		end

		slot0.uiAnims = nil
	end
end

function slot0.doPlayTorpedo(slot0, slot1)
	function slot2()
		uv0.playing = true

		uv0:frozen()
		uv0.torpetoAni:SetActive(true)

		slot0 = tf(uv0.torpetoAni)

		slot0:SetParent(uv0.topPanel, false)
		slot0:SetAsLastSibling()
		slot0:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
			uv0.playing = false

			SetActive(uv0.torpetoAni, false)

			if uv1 then
				uv1()
			end

			uv0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not slot0.torpetoAni then
		PoolMgr.GetInstance():GetUI("Torpeto", true, function (slot0)
			slot0:SetActive(true)

			uv0.torpetoAni = slot0

			uv1()
		end)
	else
		slot2()
	end
end

function slot0.destroyTorpedo(slot0)
	if slot0.torpetoAni then
		slot0.torpetoAni:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("Torpeto", slot0.torpetoAni)

		slot0.torpetoAni = nil
	end
end

function slot0.doPlayStrikeAnim(slot0, slot1, slot2, slot3)
	slot0.strikeAnims = slot0.strikeAnims or {}
	slot4, slot5, slot6 = nil

	function slot7()
		if coroutine.status(uv0) == "suspended" then
			slot0, slot1 = coroutine.resume(uv0)
		end
	end

	slot6 = coroutine.create(function ()
		uv0.playing = true

		uv0:frozen()

		slot0 = uv0.strikeAnims[uv1]

		setActive(slot0, true)

		slot1 = tf(slot0)
		slot3 = findTF(slot1, "mask/painting")
		slot4 = findTF(slot1, "ship")

		setParent(uv2, slot3:Find("fitter"), false)
		setParent(uv3, slot4, false)
		setActive(slot4, false)
		setActive(findTF(slot1, "torpedo"), false)
		slot1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		slot1:SetAsLastSibling()

		slot5 = slot1:GetComponent("DftAniEvent")

		slot5:SetStartEvent(function (slot0)
			uv0:SetAction("attack", 0)

			uv1.freeze = true
		end)
		slot5:SetTriggerEvent(function (slot0)
			uv0.freeze = false

			uv1:SetActionCallBack(function (slot0)
				if slot0 == "action" then
					-- Nothing
				elseif slot0 == "finish" then
					uv0.freeze = true
				end
			end)
		end)
		slot5:SetEndEvent(function (slot0)
			uv0.freeze = false

			uv1()
		end)
		onButton(uv0, slot1, uv4, SFX_CANCEL)
		coroutine.yield()
		retPaintingPrefab(slot3, uv5:getPainting())

		uv3:GetComponent("SpineAnimUI"):GetComponent("SkeletonGraphic").freeze = false

		PoolMgr.GetInstance():ReturnSpineChar(uv5:getPrefab(), uv3)
		setActive(slot0, false)

		uv0.playing = false

		uv0:unfrozen()

		if uv6 then
			uv6()
		end
	end)

	function slot8()
		if uv0.strikeAnims[uv1] and uv2 and uv3 then
			uv4()
		end
	end

	PoolMgr.GetInstance():GetPainting(slot1:getPainting(), true, function (slot0)
		uv0 = slot0

		Ship.SetExpression(uv0, uv1:getPainting())
		uv2()
	end)
	PoolMgr.GetInstance():GetSpineChar(slot1:getPrefab(), true, function (slot0)
		uv0 = slot0
		uv0.transform.localScale = Vector3.one

		uv1()
	end)

	if not slot0.strikeAnims[slot2] then
		PoolMgr.GetInstance():GetUI(slot2, true, function (slot0)
			uv0.strikeAnims[uv1] = slot0

			uv2()
		end)
	end
end

function slot0.destroyStrikeAnim(slot0)
	if slot0.strikeAnims then
		for slot4, slot5 in pairs(slot0.strikeAnims) do
			slot5:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(slot4, slot5)
		end

		slot0.strikeAnims = nil
	end
end

function slot0.doPlayEnemyAnim(slot0, slot1, slot2, slot3)
	slot0.strikeAnims = slot0.strikeAnims or {}
	slot4, slot5 = nil

	function slot6()
		if coroutine.status(uv0) == "suspended" then
			slot0, slot1 = coroutine.resume(uv0)
		end
	end

	slot5 = coroutine.create(function ()
		uv0.playing = true

		uv0:frozen()

		slot0 = uv0.strikeAnims[uv1]

		setActive(slot0, true)

		slot1 = tf(slot0)
		slot3 = findTF(slot1, "ship")

		setParent(uv2, slot3, false)
		setActive(slot3, false)
		setActive(findTF(slot1, "torpedo"), false)
		slot1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		slot1:SetAsLastSibling()

		slot4 = slot1:GetComponent("DftAniEvent")

		slot4:SetStartEvent(function (slot0)
			uv0:SetAction("attack", 0)

			uv1.freeze = true
		end)
		slot4:SetTriggerEvent(function (slot0)
			uv0.freeze = false

			uv1:SetActionCallBack(function (slot0)
				if slot0 == "action" then
					-- Nothing
				elseif slot0 == "finish" then
					uv0.freeze = true
				end
			end)
		end)
		slot4:SetEndEvent(function (slot0)
			uv0.freeze = false

			uv1()
		end)
		onButton(uv0, slot1, uv3, SFX_CANCEL)
		coroutine.yield()

		uv2:GetComponent("SpineAnimUI"):GetComponent("SkeletonGraphic").freeze = false

		PoolMgr.GetInstance():ReturnSpineChar(uv4:getPrefab(), uv2)
		setActive(slot0, false)

		uv0.playing = false

		uv0:unfrozen()

		if uv5 then
			uv5()
		end
	end)

	function slot7()
		if uv0.strikeAnims[uv1] and uv2 then
			uv3()
		end
	end

	PoolMgr.GetInstance():GetSpineChar(slot1:getPrefab(), true, function (slot0)
		uv0 = slot0
		uv0.transform.localScale = Vector3.one

		uv1()
	end)

	if not slot0.strikeAnims[slot2] then
		PoolMgr.GetInstance():GetUI(slot2, true, function (slot0)
			uv0.strikeAnims[uv1] = slot0

			uv2()
		end)
	end
end

function slot0.doSignalSearch(slot0, slot1)
	slot0:frozen()

	function slot2()
		uv0.playing = true

		uv0.signalAni:SetActive(true)

		slot0 = tf(uv0.signalAni)

		slot0:SetParent(uv0.topPanel, false)
		slot0:SetAsLastSibling()
		slot0:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
			uv0.playing = false

			SetActive(uv0.signalAni, false)

			if uv1 then
				uv1()
			end

			uv0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not slot0.signalAni then
		PoolMgr.GetInstance():GetUI("SignalUI", true, function (slot0)
			slot0:SetActive(true)

			uv0.signalAni = slot0

			uv1()
		end)
	else
		slot2()
	end
end

function slot0.destroySignalSearch(slot0)
	if slot0.signalAni then
		slot0.signalAni:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("SignalUI", slot0.signalAni)

		slot0.signalAni = nil
	end
end

function slot0.doPlayCommander(slot0, slot1, slot2)
	slot0:frozen()
	setActive(slot0.commanderTinkle, true)
	setText(slot0.commanderTinkle:Find("name"), #slot1:getSkills() > 0 and slot3[1]:getConfig("name") or "")
	setImageSprite(slot0.commanderTinkle:Find("icon"), GetSpriteFromAtlas("commanderhrz/" .. slot1:getConfig("painting"), ""))

	slot0.commanderTinkle:GetComponent(typeof(CanvasGroup)).alpha = 0
	slot5 = Vector2(248, 237)

	LeanTween.value(go(slot0.commanderTinkle), 0, 1, 0.5):setOnUpdate(System.Action_float(function (slot0)
		slot1 = uv0.commanderTinkle.localPosition
		slot1.x = uv1.x + -100 * (1 - slot0)
		uv0.commanderTinkle.localPosition = slot1
		uv2.alpha = slot0
	end)):setEase(LeanTweenType.easeOutSine)
	LeanTween.value(go(slot0.commanderTinkle), 0, 1, 0.3):setDelay(0.7):setOnUpdate(System.Action_float(function (slot0)
		slot1 = uv0.commanderTinkle.localPosition
		slot1.x = uv1.x + 100 * slot0
		uv0.commanderTinkle.localPosition = slot1
		uv2.alpha = 1 - slot0
	end)):setOnComplete(System.Action(function ()
		if uv0 then
			uv0()
		end

		uv1:unfrozen()
	end))
end

function slot0.strikeEnemy(slot0, slot1, slot2, slot3)
	if not slot0.grid:shakeCell(slot1) then
		slot3()

		return
	end

	slot0:frozen()

	slot0.damageText.position = slot0.uiCam:ScreenToWorldPoint(slot0.levelCam:WorldToScreenPoint(slot4.position))
	slot6 = slot0.damageText.localPosition
	slot6.y = slot6.y + 40
	slot6.z = 0

	slot0:easeDamage(slot6, slot2, function ()
		uv0:unfrozen()
		uv1()
	end)
end

function slot0.easeDamage(slot0, slot1, slot2, slot3)
	slot0:frozen()
	setText(slot0.damageText, slot2)
	setActive(slot0.damageText, true)

	slot0.damageText.localPosition = slot1

	LeanTween.value(go(slot0.damageText), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
		slot1 = uv0.damageText.localPosition
		slot1.y = uv1.y + 60 * slot0
		uv0.damageText.localPosition = slot1

		setTextAlpha(uv0.damageText, 1 - slot0)
	end)):setOnComplete(System.Action(function ()
		setActive(uv0.damageText, false)
		uv0:unfrozen()

		if uv1 then
			uv1()
		end
	end))
end

function slot0.easeAvoid(slot0, slot1, slot2)
	slot0:frozen()

	slot0.avoidText.position = slot0.uiCam:ScreenToWorldPoint(slot0.levelCam:WorldToScreenPoint(slot1))
	slot4 = slot0.avoidText.localPosition
	slot4.z = 0
	slot0.avoidText.localPosition = slot4

	setActive(slot0.avoidText, true)

	slot5 = slot0.avoidText:Find("avoid")

	LeanTween.value(go(slot0.avoidText), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
		slot1 = uv0.avoidText.localPosition
		slot1.y = uv1.y + 100 * slot0
		uv0.avoidText.localPosition = slot1

		setImageAlpha(uv0.avoidText, 1 - slot0)
		setImageAlpha(uv2, 1 - slot0)
	end)):setOnComplete(System.Action(function ()
		setActive(uv0.avoidText, false)
		uv0:unfrozen()

		if uv1 then
			uv1()
		end
	end))
end

function slot0.overrideChapter(slot0)
	slot0:emit(LevelMediator2.ON_OVERRIDE_CHAPTER)
end

function slot0.onSubLayerOpen(slot0)
	setActive(slot0.topPanel, false)
	slot0:disableLevelCamera()

	slot0.visibilityForPreCombat = {
		leftChapter = isActive(slot0.leftChapter),
		rightChapter = isActive(slot0.rightChapter),
		clouds = isActive(slot0.clouds),
		chapters = isActive(slot0.chapters)
	}

	for slot4, slot5 in pairs(slot0.visibilityForPreCombat) do
		setActive(slot0[slot4], false)
	end

	slot2 = slot0.contextData.map:getConfig("bg")

	if slot0.tornadoTF and slot2 and #slot2 > 0 then
		setActive(slot0.tornadoTF, false)
	end

	slot0.isSubLayerOpen = true
end

function slot0.onSubLayerClose(slot0)
	if not slot0.exited then
		slot0:enableLevelCamera()

		if #getProxy(ContextProxy):getContextByMediator(LevelMediator2).children == 0 then
			setActive(slot0.topPanel, true)

			if slot0.visibilityForPreCombat then
				for slot6, slot7 in pairs(slot0.visibilityForPreCombat) do
					setActive(slot0[slot6], slot7)
				end

				slot0.visibilityForPreCombat = nil
			end
		end
	end

	if slot0.tornadoTF and slot0.contextData.map:getConfig("animtor") == 1 then
		setActive(slot0.tornadoTF, true)
	end

	slot0.isSubLayerOpen = nil
end

function slot0.onSubLayerContextChange(slot0)
	slot0.visibilityForPreCombat = nil
end

function slot0.popStageStrategy(slot0)
	if slot0:findTF("event/collapse", slot0.levelStageView.rightStage).anchoredPosition.x <= 1 then
		triggerButton(slot1)
	end
end

function slot0.resetLevelGrid(slot0)
	slot0.dragLayer.localPosition = Vector3.zero
end

function slot0.ShowCurtains(slot0, slot1)
	setActive(slot0.curtain, slot1)
end

function slot0.ClearLoadedTemplates(slot0)
	for slot4, slot5 in pairs(slot0.loadedTpls) do
		if not IsNil(slot5) then
			uv0.Destroy(slot5, true)
		end
	end

	slot0.loadedTpls = nil
end

function slot0.frozen(slot0, slot1)
	if slot1 then
		slot0.fcall = slot1
	end

	slot0.frozenCount = slot0.frozenCount + 1
	slot0.canvasGroup.blocksRaycasts = slot0.frozenCount == 0
end

function slot0.unfrozen(slot0, slot1)
	if slot0.exited then
		return
	end

	slot0.frozenCount = slot0.frozenCount - (slot1 == -1 and slot0.frozenCount or slot1 or 1)
	slot0.canvasGroup.blocksRaycasts = slot0.frozenCount == 0

	if slot0.frozenCount == 0 and slot0.fcall then
		slot0.fcall = nil

		slot0.fcall()
	end
end

function slot0.isfrozen(slot0)
	return slot0.frozenCount > 0
end

function slot0.enableLevelCamera(slot0)
	slot0.levelCamIndices = math.max(slot0.levelCamIndices - 1, 0)

	if slot0.levelCamIndices == 0 then
		slot0.levelCam.enabled = true

		pg.LayerWeightMgr.GetInstance():switchOriginParent()
	end
end

function slot0.disableLevelCamera(slot0)
	slot0.levelCamIndices = slot0.levelCamIndices + 1

	if slot0.levelCamIndices > 0 then
		slot0.levelCam.enabled = false

		pg.LayerWeightMgr.GetInstance():switchOriginParent()
	end
end

function slot0.RecordTween(slot0, slot1, slot2)
	slot0.tweens[slot1] = slot2
end

function slot0.DeleteTween(slot0, slot1)
	if slot0.tweens[slot1] then
		LeanTween.cancel(slot2)

		slot0.tweens[slot1] = nil
	end
end

function slot0.openCommanderPanel(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = slot2.id
	slot0.levelCMDFormationView = LevelCMDFormationView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelCMDFormationView:Load()
	slot0.levelCMDFormationView:ActionInvoke("update", slot1, slot0.commanderPrefabs, (slot3 or function (slot0)
		if slot0.type == LevelUIConst.COMMANDER_OP_ADD then
			uv0.contextData.commanderSelected = {
				chapterId = uv1,
				fleetId = uv2.id
			}

			uv0:emit(LevelMediator2.ON_SELECT_COMMANDER, slot0.pos, uv2.id, uv3)
			uv0:closeCommanderPanel()
		else
			uv0:emit(LevelMediator2.ON_COMMANDER_OP, {
				FleetType = LevelUIConst.FLEET_TYPE_SELECT,
				data = slot0,
				fleetId = uv2.id,
				chapterId = uv1
			}, uv3)
		end
	end) and function (slot0)
		if slot0.type == LevelUIConst.COMMANDER_OP_ADD then
			uv0.contextData.eliteCommanderSelected = {
				index = uv1,
				pos = slot0.pos,
				chapterId = uv2
			}

			uv0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, uv1, slot0.pos, uv3)
			uv0:closeCommanderPanel()
		else
			uv0:emit(LevelMediator2.ON_COMMANDER_OP, {
				FleetType = LevelUIConst.FLEET_TYPE_EDIT,
				data = slot0,
				index = uv1,
				chapterId = uv2
			}, uv3)
		end
	end)
	slot0.levelCMDFormationView:ActionInvoke("open")
end

function slot0.updateCommanderPrefab(slot0)
	if slot0.levelCMDFormationView and slot0.levelCMDFormationView:GetLoaded() then
		slot0.levelCMDFormationView:ActionInvoke("updatePrefabs", slot0.commanderPrefabs)
	end
end

function slot0.closeCommanderPanel(slot0)
	slot0.levelCMDFormationView:close()
end

function slot0.HandleShowMsgBox(slot0, slot1)
	slot1.blurLevelCamera = true

	pg.MsgboxMgr.GetInstance():ShowMsgBox(slot1)
end

function slot0.updatePoisonAreaTip(slot0)
	slot1 = slot0.contextData.chapterVO

	if function (slot0)
		slot1 = {}
		slot2 = pg.map_event_list[uv0.id] or {}
		slot3 = nil

		for slot7, slot8 in ipairs(uv0:isLoop() and (slot2.event_list_loop or {}) or slot2.event_list or {}) do
			if pg.map_event_template[slot8].c_type == slot0 then
				table.insert(slot1, slot9)
			end
		end

		return slot1
	end(ChapterConst.EvtType_Poison) then
		for slot7, slot8 in ipairs(slot3) do
			if slot8.round_gametip ~= nil and slot9 ~= "" and slot1:getRoundNum() == slot9[1] then
				pg.TipsMgr.GetInstance():ShowTips(i18n(slot9[2]))
			end
		end
	end
end

function slot0.updateVoteBookBtn(slot0, slot1)
	slot2 = slot1 and not slot1:IsExpired()

	setActive(slot0._voteBookBtn, slot2)
	slot0:RemoveVoteBookTimer()

	if slot2 then
		onButton(slot0, slot0._voteBookBtn, function ()
			uv0:emit(LevelMediator2.ON_VOTE_BOOK)
		end, SFX_PANEL)

		slot3 = slot0._voteBookBtn:Find("tip/Text"):GetComponent(typeof(Text))
		slot0.voteBookTimer = Timer.New(function ()
			uv0.text = uv1:GetCDTime()
		end, 1, -1)

		slot0.voteBookTimer:Start()
		slot0.voteBookTimer.func()
	end
end

function slot0.RemoveVoteBookTimer(slot0)
	if slot0.voteBookTimer then
		slot0.voteBookTimer:Stop()

		slot0.voteBookTimer = nil
	end
end

function slot0.willExit(slot0)
	slot0.loader:Clear()
	slot0:RemoveVoteBookTimer()

	if slot0.contextData.chapterVO then
		pg.UIMgr.GetInstance():UnblurPanel(slot0.topPanel, slot0._tf)
	end

	slot0:ClearLoadedTemplates()

	if slot0.levelFleetView and slot0.levelFleetView.selectIds then
		slot0.contextData.selectedFleetIDs = {}

		for slot4, slot5 in pairs(slot0.levelFleetView.selectIds) do
			for slot9, slot10 in pairs(slot5) do
				slot0.contextData.selectedFleetIDs[#slot0.contextData.selectedFleetIDs + 1] = slot10
			end
		end
	end

	slot0:DestroyLevelStageView()
	slot0:hideChapterPanel()
	slot0:hideFleetEdit()
	slot0:hideSpResult()
	slot0:hideBombResult()
	slot0:destroyGrid()
	slot0:destroyAmbushWarn()
	slot0:destroyAirStrike()
	slot0:destroyTorpedo()
	slot0:destroyStrikeAnim()
	slot0:destroyTracking()
	slot0:destroyCloudAnimator()
	slot0:destroyUIAnims()
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad_mark", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell", "")

	slot4 = ""

	PoolMgr.GetInstance():DestroyPrefab("effect/juguangdeng_SLG", slot4)

	for slot4, slot5 in pairs(slot0.mbDict) do
		slot5:Destroy()
	end

	slot0.mbDict = nil

	for slot4, slot5 in pairs(slot0.mapItemTimer) do
		if slot5 then
			slot5:Stop()
		end
	end

	slot0.mapItemTimer = nil

	for slot4, slot5 in pairs(slot0.tweens) do
		LeanTween.cancel(slot5)
	end

	slot0.tweens = nil

	if slot0.cloudTimer then
		_.each(slot0.cloudTimer, function (slot0)
			LeanTween.cancel(slot0)
		end)

		slot0.cloudTimer = nil
	end

	if slot0.newChapterCDTimer then
		slot0.newChapterCDTimer:Stop()

		slot0.newChapterCDTimer = nil
	end

	if slot0.resPanel then
		slot0.resPanel:exit()

		slot0.resPanel = nil
	end

	if slot0.activityBossBattlePanel then
		slot0.activityBossBattlePanel:clear()
	end

	LeanTween.cancel(go(slot0.damageText))

	slot0.map.localScale = Vector3.one
	slot0.map.pivot = Vector2(0.5, 0.5)
	slot0.float.localScale = Vector3.one
	slot0.float.pivot = Vector2(0.5, 0.5)

	clearImageSprite(slot0.map)
	_.each(slot0.cloudRTFs, function (slot0)
		clearImageSprite(slot0)
	end)
	PoolMgr.GetInstance():DestroyAllSprite()

	if getProxy(ChapterProxy) then
		if slot0.contextData.map:NeedRecordMap() then
			slot1:recordLastMap(ChapterProxy.LAST_MAP, slot2.id)
		end

		if Map.lastMapForActivity then
			slot1:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, Map.lastMapForActivity)
		end
	end
end

return slot0
