slot0 = class("LevelScene", import("..base.BaseUI"))
slot1 = require("Mgr/Pool/PoolUtil")
slot2 = import("view.level.MapBuilder.MapBuilder")
slot0.correspondingClass = {
	[slot2.TYPENORMAL] = "MapBuilderNormal",
	[slot2.TYPEESCORT] = "MapBuilderEscort",
	[slot2.TYPESHINANO] = "MapBuilderShinano",
	[slot2.TYPESKIRMISH] = "MapBuilderSkirmish"
}
slot3 = 0.5

function slot0.getUIName(slot0)
	return "LevelMainScene"
end

function slot0.getBGM(slot0)
	table.insert({}, checkExist(slot0.contextData.chapterVO, {
		"getConfig",
		{
			"bgm"
		}
	}) or "")
	table.insert(slot1, checkExist(slot0.contextData.map, {
		"getConfig",
		{
			"bgm"
		}
	}) or "")

	for slot5, slot6 in ipairs(slot1) do
		if slot6 ~= "" then
			return slot6
		end
	end

	return uv0.super.getBGM(slot0)
end

slot0.optionsPath = {
	"top/top_chapter/option"
}

function slot0.preload(slot0, slot1)
	slot2 = getProxy(ChapterProxy)

	if slot0.contextData.mapIdx and slot0.contextData.chapterId then
		slot3 = slot2:getMapById(slot0.contextData.mapIdx)

		if slot2:getChapterById(slot0.contextData.chapterId):getConfig("map") == slot0.contextData.mapIdx then
			slot0.contextData.chapterVO = slot4
		end
	end

	slot3, slot4 = slot0:GetInitializeMap()

	if slot0.contextData.entranceStatus == nil then
		slot0.contextData.entranceStatus = not slot4
	end

	if not slot0.contextData.entranceStatus then
		slot0.contextData.InitializeMap = slot3

		slot0:PreloadLevelMainUI(slot3, slot1)
	else
		slot1()
	end
end

function slot0.GetInitializeMap(slot0)
	return function ()
		if uv0.contextData.chapterVO and slot0.active then
			return slot0:getConfig("map")
		end

		if uv0.contextData.mapIdx then
			return uv0.contextData.mapIdx
		end

		slot1 = nil

		if uv0.contextData.targetChapter and uv0.contextData.targetMap then
			uv0.contextData.openChapterId = uv0.contextData.targetChapter
			slot1 = uv0.contextData.targetMap.id
			uv0.contextData.targetChapter = nil
			uv0.contextData.targetMap = nil
		elseif uv0.contextData.eliteDefault then
			slot1 = getProxy(ChapterProxy):getUseableMaxEliteMap() and slot2.id or nil
			uv0.contextData.eliteDefault = nil
		end

		return slot1
	end() or slot0:selectMap(), tobool(slot2)
end

function slot0.init(slot0)
	slot0:initData()
	slot0:initUI()
	slot0:initEvents()
	slot0:updateClouds()
end

function slot0.initData(slot0)
	slot0.tweens = {}
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
	slot0.entranceLayer = slot0:findTF("entrance")
	slot0.entranceBg = slot0:findTF("entrance_bg")
	slot0.topChapter = slot0:findTF("top_chapter", slot0.topPanel)
	slot0.chapterName = slot0:findTF("title_chapter/name", slot0.topChapter)
	slot0.chapterNoTitle = slot0:findTF("title_chapter/chapter", slot0.topChapter)
	slot0.resChapter = slot0:findTF("resources", slot0.topChapter)
	slot0.resPanel = PlayerResource.New()

	slot0.resPanel:setParent(slot0.resChapter, false)
	setActive(slot0.topChapter, true)

	slot0._voteBookBtn = slot0.topChapter:Find("vote_book")
	slot0.leftChapter = slot0:findTF("main/left_chapter")

	setActive(slot0.leftChapter, true)

	slot0.leftCanvasGroup = slot0.leftChapter:GetComponent(typeof(CanvasGroup))
	slot0.btnPrev = slot0:findTF("btn_prev", slot0.leftChapter)
	slot0.btnPrevCol = slot0:findTF("btn_prev/prev_image", slot0.leftChapter)
	slot0.eliteBtn = slot0:findTF("buttons/btn_elite", slot0.leftChapter)
	slot0.normalBtn = slot0:findTF("buttons/btn_normal", slot0.leftChapter)
	slot0.actNormalBtn = slot0:findTF("buttons/btn_act_normal", slot0.leftChapter)

	setActive(slot0.actNormalBtn, false)

	slot0.actEliteBtn = slot0:findTF("buttons/btn_act_elite", slot0.leftChapter)

	setActive(slot0.actEliteBtn, false)

	slot0.actExtraBtn = slot0:findTF("buttons/btn_act_extra", slot0.leftChapter)
	slot0.actExtraBtnAnim = slot0:findTF("usm", slot0.actExtraBtn)
	slot0.remasterBtn = slot0:findTF("buttons/btn_remaster", slot0.leftChapter)
	slot0.escortBar = slot0:findTF("escort_bar", slot0.leftChapter)

	setActive(slot0.escortBar, false)

	slot0.eliteQuota = slot0:findTF("elite_quota", slot0.leftChapter)

	setActive(slot0.eliteQuota, false)

	slot0.skirmishBar = slot0:findTF("left_times", slot0.leftChapter)
	slot0.mainLayer = slot0:findTF("main")
	slot0.rightChapter = slot0:findTF("main/right_chapter")
	slot0.rightCanvasGroup = slot0.rightChapter:GetComponent(typeof(CanvasGroup))
	slot0.eventContainer = slot0:findTF("event_btns/event_container", slot0.rightChapter)
	slot0.btnSpecial = slot0:findTF("btn_task", slot0.eventContainer)
	slot0.challengeBtn = slot0:findTF("btn_challenge", slot0.eventContainer)
	slot0.dailyBtn = slot0:findTF("btn_daily", slot0.eventContainer)
	slot0.militaryExerciseBtn = slot0:findTF("btn_pvp", slot0.eventContainer)
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

	slot0.curtain = slot0:findTF("curtain", slot0.topPanel)

	setActive(slot0.curtain, false)

	slot0.map = slot0:findTF("map")
	slot0.map:GetComponent(typeof(Image)).enabled = true
	slot1 = slot0.map:GetComponent(typeof(AspectRatioFitter))
	slot1.aspectRatio = 1
	slot1.aspectRatio = slot1.aspectRatio
	slot0.UIFXList = slot0:findTF("map/UI_FX_list")

	for slot7 = 0, slot0.UIFXList:GetComponentsInChildren(typeof(Renderer)).Length - 1 do
		slot3[slot7].sortingOrder = -1
	end

	slot4 = GameObject.Find("LevelCamera").transform
	slot0.levelCam = slot4:GetComponent(typeof(Camera))
	slot0.uiMain = slot4:Find("Canvas/UIMain")

	setActive(slot0.uiMain, false)

	GetOrAddComponent(slot0.uiMain, typeof(Image)).color = Color.New(0, 0, 0, 0.5)
	slot0.uiCam = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	slot0.levelGrid = slot0.uiMain:Find("LevelGrid")

	setActive(slot0.levelGrid, true)

	slot0.dragLayer = slot0.levelGrid:Find("DragLayer")

	setImageAlpha(slot0.dragLayer, 0.27450980392156865)

	slot0.float = slot0:findTF("float")
	slot0.clouds = slot0:findTF("clouds", slot0.float)

	setActive(slot0.clouds, true)

	slot0.resources = slot0:findTF("resources"):GetComponent("ItemList")
	slot0.arrowTarget = slot0.resources.prefabItem[0]
	slot0.championTpl = slot0.resources.prefabItem[3]
	slot0.deadTpl = slot0.resources.prefabItem[4]
	slot0.enemyTpl = slot0.resources.prefabItem[5]
	slot0.oniTpl = slot0.resources.prefabItem[6]
	slot0.shipTpl = slot0.resources.prefabItem[8]
	slot0.subTpl = slot0.resources.prefabItem[9]
	slot0.transportTpl = slot0.resources.prefabItem[11]

	setText(slot0:findTF("fighting/Text", slot0.enemyTpl), i18n("ui_word_levelui2_inevent"))
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
	slot0.levelFleetView = LevelFleetView.New(slot0.topPanel, slot0.event, slot0.contextData)
	slot0.levelInfoView = LevelInfoView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0:buildCommanderPanel()
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
		if uv0:isfrozen() then
			return
		end

		uv0:switchToMap()
	end)
	slot0:bind(LevelUIConst.DISPLAY_REPAIR_WINDOW, function (slot0, slot1)
		uv0:displayRepairWindow(slot1)
	end)
	slot0:bind(LevelUIConst.DO_PLAY_ANIM, function (slot0, slot1)
		uv0:doPlayAnim(slot1.name, slot1.callback, slot1.onStart)
	end)
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

function slot0.setCommanderPrefabs(slot0, slot1)
	slot0.commanderPrefabs = slot1
end

function slot0.didEnter(slot0)
	slot0.openedCommanerSystem = not LOCK_COMMANDER and pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "CommandRoomMediator")

	onButton(slot0, slot0:findTF("back_button", slot0.topChapter), function ()
		if uv0:isfrozen() then
			return
		end

		if uv0.contextData.map and (slot0:isActivity() or slot0:isEscort()) then
			uv0:emit(LevelMediator2.ON_SWITCH_NORMAL_MAP)

			return
		elseif not uv0.contextData.entranceStatus then
			uv0:ShowEntranceUI(true)
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
	onButton(slot0, slot0.militaryExerciseBtn, function ()
		if uv0:isfrozen() then
			return
		end

		uv0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(slot0, slot0.normalBtn, function ()
		if uv0:isfrozen() then
			return
		end

		uv0:setMap(uv0.contextData.map:getBindMapId())
	end, SFX_PANEL)
	onButton(slot0, slot0.eliteBtn, function ()
		if uv0:isfrozen() then
			return
		end

		if uv0.contextData.map:getBindMapId() == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))

			if getProxy(ChapterProxy):getUseableMaxEliteMap() then
				uv0:setMap(slot1.configId)
				pg.TipsMgr.GetInstance():ShowTips(i18n("elite_warp_to_latest_map"))
			end
		elseif uv0.contextData.map:isEliteEnabled() then
			uv0:setMap(uv0.contextData.map:getBindMapId())
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
		end
	end, SFX_UI_WEIGHANCHOR_HARD)
	onButton(slot0, slot0.remasterBtn, function ()
		if uv0:isfrozen() then
			return
		end

		uv0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		SetActive(uv0.remasterBtn:Find("tip"), false)
		SetActive(uv0.entranceLayer:Find("btns/btn_remaster/tip"), false)
	end, SFX_PANEL)
	onButton(slot0, slot0.signalBtn, function ()
		if uv0:isfrozen() then
			return
		end

		uv0:displaySignalPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.entranceLayer:Find("enters/enter_main"), function ()
		if uv0:isfrozen() then
			return
		end

		uv0:ShowSelectedMap(uv0:GetInitializeMap())
	end, SFX_PANEL)
	setText(slot0.entranceLayer:Find("enters/enter_main/Text"), getProxy(ChapterProxy):getLastUnlockMap():getLastUnlockChapterName())
	onButton(slot0, slot0.entranceLayer:Find("enters/enter_world/enter"), function ()
		if uv0:isfrozen() then
			return
		end

		slot0, slot1 = pg.SystemOpenMgr.GetInstance():isOpenSystem(uv0.player.level, "WorldMediator")

		if slot0 then
			uv0:emit(LevelMediator2.ENTER_WORLD)
		else
			pg.TipsMgr.GetInstance():ShowTips(slot1)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.entranceLayer:Find("enters/enter_ready/activity"), function ()
		if uv0:isfrozen() then
			return
		end

		uv0:emit(LevelMediator2.ON_ACTIVITY_MAP)
	end, SFX_PANEL)
	onButton(slot0, slot0.entranceLayer:Find("enters/right_panel/btn_signal"), function ()
		if uv0:isfrozen() then
			return
		end

		uv0:displaySignalPanel()
	end, SFX_PANEL)
	setActive(slot0.entranceLayer:Find("enters/right_panel/btn_signal"), checkExist(getProxy(ChapterProxy):getChapterById(304), {
		"isClear"
	}))
	onButton(slot0, slot0.entranceLayer:Find("btns/btn_remaster"), function ()
		if uv0:isfrozen() then
			return
		end

		uv0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		SetActive(uv0.remasterBtn:Find("tip"), false)
		SetActive(uv0.entranceLayer:Find("btns/btn_remaster/tip"), false)
	end, SFX_PANEL)
	setActive(slot0.entranceLayer:Find("btns/btn_remaster"), OPEN_REMASTER)
	onButton(slot0, slot0.entranceLayer:Find("btns/btn_challenge"), function ()
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
	onButton(slot0, slot0.entranceLayer:Find("btns/btn_pvp"), function ()
		if uv0:isfrozen() then
			return
		end

		uv0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(slot0, slot0.entranceLayer:Find("btns/btn_daily"), function ()
		if uv0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		uv0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(slot0, slot0.entranceLayer:Find("btns/btn_task"), function ()
		if uv0:isfrozen() then
			return
		end

		uv0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	setActive(slot0.entranceLayer:Find("enters/enter_world/enter"), not WORLD_ENTER_LOCK)
	setActive(slot0.entranceLayer:Find("enters/enter_world/nothing"), WORLD_ENTER_LOCK)
	setActive(slot0.entranceLayer:Find("enters/enter_ready/nothing"), #underscore.filter(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT), function (slot0)
		return not slot0:isEnd()
	end) == 0)
	setActive(slot0.entranceLayer:Find("enters/enter_ready/activity"), #slot1 > 0)

	if #slot1 > 0 then
		table.sort(slot1, function (slot0, slot1)
			return slot1.id < slot0.id
		end)

		if slot1[1]:getConfig("config_client").entrance_bg then
			GetImageSpriteFromAtlasAsync(slot2, "", slot0.entranceLayer:Find("enters/enter_ready/activity"), true)
		end
	end

	slot2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "EventMediator")

	setActive(slot0.btnSpecial:Find("lock"), not slot2)
	setActive(slot0.entranceLayer:Find("btns/btn_task/lock"), not slot2)

	slot3 = pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "DailyLevelMediator")

	setActive(slot0.dailyBtn:Find("lock"), not slot3)
	setActive(slot0.entranceLayer:Find("btns/btn_daily/lock"), not slot3)

	slot4 = pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "MilitaryExerciseMediator")

	setActive(slot0.militaryExerciseBtn:Find("lock"), not slot4)
	setActive(slot0.entranceLayer:Find("btns/btn_pvp/lock"), not slot4)

	slot5 = slot0:checkChallengeOpen()

	setActive(slot0.challengeBtn:Find("lock"), not slot5)
	setActive(slot0.entranceLayer:Find("btns/btn_challenge/lock"), not slot5)

	slot6 = checkExist(getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE), {
		"isEnd"
	}) == false

	setActive(slot0.challengeBtn, slot6)
	setActive(slot0.entranceLayer:Find("btns/btn_challenge"), slot6)
	slot0:initMapBtn(slot0.btnPrev, -1)
	slot0:initMapBtn(slot0.btnNext, 1)

	for slot12, slot13 in ipairs(getProxy(ContextProxy):getContextByMediator(LevelMediator2).children) do
		slot0.levelCamIndices = slot0.levelCamIndices + 1

		function slot13.onRemoved()
			uv0:onSubLayerClose()
		end
	end

	slot0:emit(LevelMediator2.ON_EVENT_LIST_UPDATE)

	if slot0.contextData.editEliteChapter then
		slot0:displayFleetEdit(slot0.contextData.editEliteChapter)

		slot0.contextData.editEliteChapter = nil
	elseif slot0.contextData.selectedChapterVO then
		slot0:displayFleetSelect(slot0.contextData.selectedChapterVO)

		slot0.contextData.selectedChapterVO = nil
	end

	if not slot0.contextData.isSwitchToChapter then
		slot0:tryPlaySubGuide()
	end

	if getProxy(ChapterProxy):ifShowRemasterTip() then
		SetActive(slot0.remasterBtn:Find("tip"), true)
		SetActive(slot0.entranceLayer:Find("btns/btn_remaster/tip"), true)
	else
		SetActive(slot0.remasterBtn:Find("tip"), false)
		SetActive(slot0.entranceLayer:Find("btns/btn_remaster/tip"), false)
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
	if slot0:isfrozen() then
		return
	end

	if slot0.levelAmbushView then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if slot0.levelInfoView:isShowing() then
		slot0:hideChapterPanel()

		return
	end

	if slot0.levelFleetView:isShowing() then
		slot0:hideFleetEdit()

		return
	end

	if slot0.levelSignalView then
		slot0:hideSignalPanel()

		return
	end

	if slot0.levelStrategyView then
		slot0:hideStrategyInfo()

		return
	end

	if slot0.levelRepairView then
		slot0:hideRepairWindow()

		return
	end

	if slot0.levelRemasterView then
		slot0:hideRemasterPanel()

		return
	end

	if isActive(slot0.helpPage) then
		setActive(slot0.helpPage, false)

		return
	end

	if slot0.contextData.chapterVO and getProxy(ChapterProxy):getActiveChapter() then
		slot0:switchToMap()

		return
	end

	triggerButton(slot0:findTF("back_button", slot0.topChapter))
end

function slot0.ShowEntranceUI(slot0, slot1)
	setActive(slot0.entranceLayer, slot1)
	setActive(slot0.entranceBg, slot1)
	setActive(slot0.map, not slot1)
	setActive(slot0.float, not slot1)
	setActive(slot0.mainLayer, not slot1)
	setActive(slot0.topChapter:Find("type_entrance"), slot1)

	slot0.contextData.entranceStatus = tobool(slot1)

	if slot1 then
		setActive(slot0:findTF("title_chapter", slot0.topChapter), false)
		setActive(slot0.topChapter:Find("type_chapter"), false)
		setActive(slot0.topChapter:Find("type_escort"), false)
		setActive(slot0.topChapter:Find("type_skirmish"), false)

		if slot0.newChapterCDTimer then
			slot0.newChapterCDTimer:Stop()

			slot0.newChapterCDTimer = nil
		end

		slot0:RecordLastMapOnExit()

		slot0.contextData.mapIdx = nil
		slot0.contextData.map = nil
	end

	slot0:PlayBGM()
end

function slot0.PreloadLevelMainUI(slot0, slot1, slot2)
	if slot0.preloadLevelDone then
		if slot2 then
			slot2()
		end

		return
	end

	slot3 = 0
	slot5 = nil

	GetSpriteFromAtlasAsync("chapter/pic/cellgrid", "cell_grid", function ()
		uv0 = uv0 + 1

		if uv0 == uv1 and not uv2.exited then
			uv2.preloadLevelDone = true

			if uv3 then
				uv3()
			end
		end
	end)

	slot6 = PoolMgr.GetInstance()

	slot6:GetPrefab("chapter/cell_quad", "", true, function (slot0)
		uv0:ReturnPrefab("chapter/cell_quad", "", slot0)
		uv1()
	end)
	slot6:GetPrefab("chapter/cell_quad_mark", "", true, function (slot0)
		uv0:ReturnPrefab("chapter/cell_quad_mark", "", slot0)
		uv1()
	end)
	slot6:GetPrefab("chapter/cell", "", true, function (slot0)
		uv0:ReturnPrefab("chapter/cell", "", slot0)
		uv1()
	end)

	slot11 = true

	function slot12(slot0)
		uv0:ReturnPrefab("chapter/plane", "", slot0)
		uv1()
	end

	slot6:GetPrefab("chapter/plane", "", slot11, slot12)

	slot7 = {
		{
			"Tpl_Destination_Mark",
			"leveluiview",
			"destinationMarkTpl"
		}
	}
	slot0.loadedTpls = {}
	slot4 = 0 + 5 + #slot7

	for slot11, slot12 in pairs(slot7) do
		LoadAndInstantiateAsync(slot12[2], slot12[1], function (slot0)
			slot0:SetActive(false)

			slot0.name = uv0[3]
			uv1[uv0[3]] = slot0

			table.insert(uv1.loadedTpls, slot0)
			uv2()
		end, true)
	end

	slot4 = slot4 + 1

	GetSpriteFromAtlasAsync("levelmap/" .. getProxy(ChapterProxy):getMapById(slot1):getConfig("bg"), "", slot5)
end

function slot0.selectMap(slot0)
	return slot0.contextData.mapIdx or (not Map.lastMap or not getProxy(ChapterProxy):getMapById(Map.lastMap) or not slot3:isUnlock() or Map.lastMap) and slot2:getLastUnlockMap().id
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.updateRes(slot0, slot1)
	slot0.resPanel:setResources(slot1)

	if slot0.levelStageView then
		slot0.levelStageView:ActionInvoke("SetPlayer", slot1)
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
	setText(slot0.entranceLayer:Find("enters/right_panel/btn_signal/nums"), slot0.subRefreshCount)
end

function slot0.updateLastFleet(slot0, slot1)
	slot0.lastFleetIndex = slot1
end

function slot0.updateEvent(slot0, slot1)
	slot2 = slot1:hasFinishState()

	setActive(slot0.btnSpecial:Find("tip"), slot2)
	setActive(slot0.entranceLayer:Find("btns/btn_task/tip"), slot2)
end

function slot0.updateFleet(slot0, slot1)
	slot0.fleets = slot1
end

function slot0.updateChapterVO(slot0, slot1, slot2)
	if not slot0.contextData.chapterVO then
		if slot0.contextData.mapIdx == slot1:getConfig("map") then
			slot0:updateMapItems()
		end

		if slot0.levelSignalView then
			slot0.levelSignalView:ActionInvoke("flush")
		end
	end

	if slot0.contextData.chapterVO and slot0.contextData.chapterVO.id == slot1.id then
		slot0:setChapter(slot1)
	end

	if slot0.contextData.chapterVO and slot0.contextData.chapterVO.id == slot1.id and slot1.active then
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
	slot1 = slot0.contextData.map:getConfig("ani_name")

	if slot0.contextData.map:getConfig("animtor") == 1 and slot1 and #slot1 > 0 then
		if slot0.tornadoTF and slot0.aniName ~= slot0.contextData.map:getConfig("ani_name") then
			slot0:destroyCloudAnimator()
		end

		function slot3()
			uv0.tornadoTF.transform.localScale = Vector3(uv0.tornadoTF.transform.parent.rect.width / uv0.tornadoTF.transform.rect.width, uv0.tornadoTF.transform.parent.rect.height / uv0.tornadoTF.transform.rect.height, 1)
		end

		if IsNil(slot0.tornadoTF) then
			if slot0.animtorLoading then
				return
			end

			slot0.animtorLoading = slot2

			PoolMgr.GetInstance():GetUI(slot2, true, function (slot0)
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
			slot3()
		end

		return
	end

	if not IsNil(slot0.tornadoTF) then
		setActive(slot0.tornadoTF, false)
	end
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

	slot0.mapBuilder.buffer:UpdateMapItems(slot1)
end

function slot0.switchDifficulty(slot0)
	slot1 = slot0.contextData.map
	slot2 = slot1:getConfig("type")

	if slot1:getConfig("uifx") ~= "" then
		setActive(slot0:findTF(slot3, slot0.UIFXList), true)
	end

	setActive(slot0.normalBtn, slot2 == Map.ELITE)
	setActive(slot0.eliteQuota, slot2 == Map.ELITE)
	setActive(slot0.eliteBtn, slot2 == Map.SCENARIO)
	setActive(slot0.eliteBtn:Find("pic_activity"), getProxy(ActivityProxy):getActivityById(ActivityConst.ELITE_AWARD_ACTIVITY_ID) and not slot5:isEnd())
end

function slot0.updateActivityBtns(slot0)
	slot1, slot2 = slot0.contextData.map:isActivity()
	slot3 = slot0.contextData.map:isRemaster()
	slot6 = slot0.contextData.map:getConfig("type")

	if getProxy(ActivityProxy):GetEarliestActByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot8:isEnd() and not slot1 and not slot0.contextData.map:isSkirmish() and not slot0.contextData.map:isEscort() then
		setImageSprite(slot0.activityBtn, slot9 and LoadSprite("ui/mainui_atlas", "event_map_" .. slot8.id) or LoadSprite("ui/mainui_atlas", "event_map"), true)
	end

	setActive(slot0.activityBtn, slot10)
	setActive(slot0.signalBtn, getProxy(ChapterProxy):getChapterById(304):isClear() and (slot6 == Map.SCENARIO or slot6 == Map.ELITE))

	if slot1 and slot2 then
		setActive(slot0.actExtraBtn, underscore.any(slot11:getMapsByActivities(), function (slot0)
			return slot0:isActExtra()
		end) and not slot3 and slot6 ~= Map.ACT_EXTRA)

		if isActive(slot0.actExtraBtn) then
			if underscore.all(underscore.filter(slot13, function (slot0)
				return slot0:getMapType() == Map.ACTIVITY_EASY or slot1 == Map.ACTIVITY_HARD
			end), function (slot0)
				return slot0:isClear()
			end) then
				setActive(slot0.actExtraBtnAnim, true)
			else
				setActive(slot0.actExtraBtnAnim, false)
			end
		end

		setActive(slot0.actEliteBtn, checkExist(slot0.contextData.map:getBindMap(), {
			"isHardMap"
		}) and slot6 ~= Map.ACTIVITY_HARD)
		setActive(slot0.actNormalBtn, slot6 ~= Map.ACTIVITY_EASY)
		setActive(slot0.actExtraRank, slot6 == Map.ACT_EXTRA)
		setActive(slot0.actExchangeShopBtn, not slot3 and slot2 and not ActivityConst.HIDE_PT_PANELS)
		setActive(slot0.ptTotal, not slot3 and slot2 and not ActivityConst.HIDE_PT_PANELS and slot0.ptActivity and not slot0.ptActivity:isEnd())
		slot0:updateActivityRes()
	else
		setActive(slot0.actExtraBtn, false)
		setActive(slot0.actEliteBtn, false)
		setActive(slot0.actNormalBtn, false)
		setActive(slot0.actExtraRank, false)
		setActive(slot0.actExchangeShopBtn, false)
		setActive(slot0.ptTotal, false)
	end

	setActive(slot0.eventContainer, (not slot1 or not slot2) and not slot4 and not slot5)
	setActive(slot0.remasterBtn, OPEN_REMASTER and (slot3 or not slot1 and not slot5))
	setActive(slot0.ticketTxt.parent, slot3)

	if slot3 then
		setText(slot0.ticketTxt, getProxy(ChapterProxy).remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
	end

	slot0:updateCountDown()
	slot0:registerActBtn()

	if slot1 and slot6 ~= Map.ACT_EXTRA then
		Map.lastMapForActivity = slot0.contextData.mapIdx
	end
end

function slot0.updateCountDown(slot0)
	slot1 = getProxy(ChapterProxy)

	if slot0.newChapterCDTimer then
		slot0.newChapterCDTimer:Stop()

		slot0.newChapterCDTimer = nil
	end

	slot2 = 0

	if slot0.contextData.map:isRemaster() then
		if slot0.contextData.map.remasterId == slot1:getActiveRemaster() then
			slot2 = math.max(slot1.remasterTime - pg.TimeMgr.GetInstance():GetServerTime(), 0)
		end

		setActive(slot0.countDown, true)
		setText(slot0.countDown:Find("title"), i18n(slot2 > 0 and "levelScene_chapter_open_count_down" or "levelScene_chapter_not_open"))
	elseif slot0.contextData.map:isActivity() then
		_.each(slot1:getMapsByActivities(), function (slot0)
			if uv0 == 0 then
				uv0 = slot0:getChapterTimeLimit()
			else
				uv0 = math.min(uv0, slot1)
			end
		end)
		setActive(slot0.countDown, slot2 > 0)
		setText(slot0.countDown:Find("title"), i18n("levelScene_new_chapter_coming"))
	else
		setActive(slot0.countDown, false)
	end

	if slot2 > 0 then
		setText(slot0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(slot2))

		slot0.newChapterCDTimer = Timer.New(function ()
			uv0 = uv0 - 1

			if uv0 <= 0 then
				uv1:updateCountDown()

				if not uv1.contextData.chapterVO then
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

	slot1 = getProxy(ChapterProxy)

	function slot2(slot0, slot1, slot2)
		slot3 = nil
		slot3 = _.select((not slot0:isRemaster() or uv0:getRemasterMaps(slot0.remasterId)) and uv0:getMapsByActivities(), function (slot0)
			return slot0:getMapType() == uv0
		end)

		table.sort(slot3, function (slot0, slot1)
			return slot0.id < slot1.id
		end)

		slot4 = table.indexof(underscore.map(slot3, function (slot0)
			return slot0.id
		end), slot2) or #slot3

		while not slot3[slot4]:isUnlock() do
			if slot4 > 1 then
				slot4 = slot4 - 1
			else
				break
			end
		end

		return slot3[slot4]
	end

	onButton(slot0, slot0.actEliteBtn, function ()
		if uv0:isfrozen() then
			return
		end

		slot2, slot3 = uv1(uv0.contextData.map, Map.ACTIVITY_HARD, uv0.contextData.map:getBindMapId()):isUnlock()

		if slot2 then
			uv0:setMap(slot1.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(slot3)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.actNormalBtn, function ()
		if uv0:isfrozen() then
			return
		end

		slot2, slot3 = uv1(uv0.contextData.map, Map.ACTIVITY_EASY, uv0.contextData.map:getBindMapId()):isUnlock()

		if slot2 then
			uv0:setMap(slot1.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(slot3)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.actExtraBtn, function ()
		if uv0:isfrozen() then
			return
		end

		slot2, slot3 = uv1(uv0.contextData.map, Map.ACT_EXTRA, PlayerPrefs.HasKey("ex_mapId") and PlayerPrefs.GetInt("ex_mapId") or 0):isUnlock()

		if slot2 then
			uv0:setMap(slot1.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(slot3)
		end
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

		if getProxy(ChapterProxy):getMapById(uv0.contextData.mapIdx + uv1) then
			if slot1:getMapType() == Map.ELITE and not slot1:isEliteEnabled() then
				slot0 = slot1:getBindMap().id

				pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))
			end

			slot3, slot4 = slot1:isUnlock()

			if not slot3 then
				pg.TipsMgr.GetInstance():ShowTips(slot4)

				return
			end

			uv0:setMap(slot0)
		end
	end, SFX_PANEL)
end

function slot0.ShowSelectedMap(slot0, slot1, slot2)
	seriesAsync({
		function (slot0)
			if uv0.contextData.entranceStatus then
				uv0:frozen()

				uv0.nextPreloadMap = uv1

				uv0:PreloadLevelMainUI(uv1, function ()
					uv0:unfrozen()

					if uv0.nextPreloadMap ~= uv1 then
						return
					end

					uv0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, uv1)
					uv0:ShowEntranceUI(false)
					uv2()
				end)
			else
				uv0:setMap(uv1)
				slot0()
			end
		end,
		function (slot0)
			if uv0 then
				uv0()
			end
		end
	})
end

function slot0.setMap(slot0, slot1)
	slot0.contextData.mapIdx = slot1
	slot0.contextData.map = getProxy(ChapterProxy):getMapById(slot1)

	if slot0.contextData.map:getMapType() == Map.ACT_EXTRA then
		PlayerPrefs.SetInt("ex_mapId", slot0.contextData.map.id)
		PlayerPrefs.Save()
	elseif slot0.contextData.map:isRemaster() then
		PlayerPrefs.SetInt("remaster_lastmap_" .. slot0.contextData.map.remasterId, slot1)
		PlayerPrefs.Save()
	end

	slot0:updateMap()
	slot0:tryPlayMapStory()
end

function slot0.SwitchMapBuilder(slot0, slot1, slot2)
	slot3 = slot0:GetMapBuilderInBuffer(slot1)

	if not slot0.mapBuilder then
		slot0.mapBuilder = slot0.mbDict[slot1]
	end

	slot3.buffer:Show()
	slot3.buffer:DoFunction(function ()
		if uv0.mapBuilder and uv0.mapBuilder:GetType() ~= uv1 then
			uv0.mapBuilder.buffer:Hide()
		end

		uv0.mapBuilder = uv0.mbDict[uv1]

		uv2(uv3)
	end)
end

function slot0.GetMapBuilderInBuffer(slot0, slot1)
	if not slot0.mbDict[slot1] then
		slot0.mbDict[slot1] = import("view.level.MapBuilder." .. slot0.correspondingClass[slot1]).New(slot0._tf, slot0)

		slot0.mbDict[slot1]:Load()
	end

	return slot0.mbDict[slot1]
end

function slot0.JudgeMapBuilderType(slot0)
	slot2 = nil

	if slot0.contextData.map:getConfig("ui_type") == uv0.TYPESHINANO then
		slot2 = uv0.TYPESHINANO
	elseif slot1:isNormalMap() then
		slot2 = uv0.TYPENORMAL
	elseif slot1:isSkirmish() then
		slot2 = uv0.TYPESKIRMISH
	elseif slot1:isEscort() then
		slot2 = uv0.TYPEESCORT
	end

	return slot2
end

function slot0.updateMap(slot0)
	slot1 = slot0.contextData.map
	slot2 = slot0.contextData.chapterVO

	seriesAsync({
		function (slot0)
			uv0:SwitchBG(uv1:getConfig("bg"))
			uv0:SwitchMapBuilder(uv0:JudgeMapBuilderType(), slot0)
		end,
		function (slot0)
			slot1 = getProxy(ChapterProxy)

			uv0.mapBuilder:Update(uv1)
			uv0:UpdateSwitchMapButton()
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
			uv0:updateCouldAnimator()
			uv0.mapBuilder:PostUpdateMap(uv1)
			uv0:updateMapItems()
			uv0:switchDifficulty()
			uv0:updateActivityBtns()

			if uv0.contextData.openChapterId then
				uv0.mapBuilder.buffer:TryOpenChapter(uv0.contextData.openChapterId)

				uv0.contextData.openChapterId = nil
			end

			slot0()
		end
	})
end

function slot0.UpdateSwitchMapButton(slot0)
	slot1 = slot0.contextData.map
	slot2 = getProxy(ChapterProxy)
	slot3 = slot2:getMapById(slot1.id - 1)

	setActive(slot0.btnPrev, slot3)
	setActive(slot0.btnNext, slot2:getMapById(slot1.id + 1))

	slot5 = Color.New(0.5, 0.5, 0.5, 1)

	setImageColor(slot0.btnPrevCol, slot3 and slot3:isUnlock() and Color.white or slot5)
	setImageColor(slot0.btnNextCol, slot4 and slot4:isUnlock() and Color.white or slot5)
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
	if not slot0.mapBuilder.UpdateChapterTF then
		return
	end

	slot0.mapBuilder:UpdateChapterTF(slot1)
end

function slot0.tryPlayMapStory(slot0)
	if Application.isEditor and not ENABLE_GUIDE then
		return
	end

	if slot0.contextData.map:getConfig("enter_story") and slot1 ~= "" and not pg.SystemOpenMgr.GetInstance().active then
		pg.NewStoryMgr.GetInstance():Play(slot1, function (slot0)
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
	slot0.levelSignalView:ActionInvoke("set", slot0.subRefreshCount, slot0.subProgress)
	slot0.levelSignalView:ActionInvoke("setCBFunc", function ()
		uv0:hideSignalPanel()
		uv0:emit(LevelMediator2.ON_REFRESH_SUB_CHAPTER)
	end, function (slot0)
		uv0:hideSignalPanel()

		if slot0.active then
			if uv0.contextData.entranceStatus then
				uv0:ShowSelectedMap(slot0:getConfig("map"), function ()
					uv0:switchToChapter(uv1)
				end)
			else
				uv0:switchToChapter(slot0)
			end
		elseif uv0.contextData.mapIdx ~= slot0:getConfig("map") then
			uv0:ShowSelectedMap(slot0:getConfig("map"))
		end
	end, function ()
		uv0:hideSignalPanel()
	end)
end

function slot0.hideSignalPanel(slot0)
	if slot0.levelSignalView then
		slot0.levelSignalView:Destroy()

		slot0.levelSignalView = nil
	end
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
			uv1:hideSpResult()
			uv2()
		end, SFX_PANEL)
	end, function (slot0)
		setText(slot0.transform:Find("right/name_bg/en"), uv0.contextData.chapterVO.modelCount)
	end)
end

function slot0.displayChapterPanel(slot0, slot1, slot2)
	function slot3(slot0)
		if uv0.player:getMaxShipBag() <= getProxy(BayProxy):getShipCount() then
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

	if getProxy(ChapterProxy):getMapById(slot1:getConfig("map")):isSkirmish() and #slot1:getNpcShipByType(1) > 0 then
		slot3(false)

		return
	end

	slot0.levelInfoView:Load()
	slot0.levelInfoView:ActionInvoke("set", slot1, slot2)
	slot0.levelInfoView:ActionInvoke("setCBFunc", slot3, slot4)
	slot0.levelInfoView:ActionInvoke("Show")
end

function slot0.hideChapterPanel(slot0)
	if slot0.levelInfoView:isShowing() then
		slot0.levelInfoView:ActionInvoke("Hide")
	end
end

function slot0.destroyChapterPanel(slot0)
	slot0.levelInfoView:Destroy()

	slot0.levelInfoView = nil
end

function slot0.displayFleetSelect(slot0, slot1, slot2)
	if slot2 then
		if slot1:isValid() then
			slot0:trackChapter(slot1, function ()
				uv0:emit(LevelMediator2.ON_TRACKING, uv1.id, {}, uv1.loopFlag)
			end)
		end

		return
	end

	slot0.levelFleetView:updateSpecialOperationTickets(slot0.spTickets)
	slot0.levelFleetView:Load()
	slot0.levelFleetView:ActionInvoke("setOpenCommanderTag", slot0.openedCommanerSystem)
	slot0.levelFleetView:ActionInvoke("set", slot1, slot0.fleets, slot0.contextData.selectedFleetIDs or slot1:selectFleets(slot0.lastFleetIndex, slot0.fleets))
	slot0.levelFleetView:ActionInvoke("setCBFunc", function (slot0, slot1)
		if uv0:isTriesLimit() and not uv0:enoughTimes2Start() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_elite_no_quota"))

			return
		end

		if #uv0:getNpcShipByType(2) > 0 then
			slot3 = {
				[TeamType.Vanguard] = #uv1.fleets[slot0[1]]:getTeamByName(TeamType.Vanguard),
				[TeamType.Main] = #uv1.fleets[slot0[1]]:getTeamByName(TeamType.Main)
			}
			slot4 = {
				[TeamType.Vanguard] = 0,
				[TeamType.Main] = 0
			}
			slot5 = nil

			for slot9, slot10 in ipairs(slot2) do
				slot5 = slot10
				slot11 = slot10:getTeamType()
				slot4[slot11] = slot4[slot11] + 1

				if slot3[slot11] + slot4[slot11] > 3 then
					break
				end
			end

			for slot9, slot10 in pairs(slot3) do
				if slot10 + slot4[slot9] > 3 then
					uv1:HandleShowMsgBox({
						modal = true,
						hideNo = true,
						content = i18n("chapter_tip_with_npc", slot5.name)
					})

					return
				end
			end
		end

		slot3 = false
		slot4 = ""

		for slot8, slot9 in ipairs(slot0) do
			slot10, slot4 = uv1.fleets[slot9]:GetEnergyStatus()

			if slot10 then
				break
			end
		end

		if slot3 then
			uv1:HandleShowMsgBox({
				content = slot4,
				onYes = function ()
					uv0:hideFleetSelect()

					if not uv1:isValid() then
						return
					end

					uv0:trackChapter(uv1, function ()
						uv0:emit(LevelMediator2.ON_TRACKING, uv1.id, uv2, uv1.loopFlag, uv3)
					end)
				end
			})
		else
			slot5()
		end

		uv1.contextData.selectedFleetIDs = Clone(slot0)
	end, function ()
		uv0:hideFleetSelect()
	end)
	slot0.levelFleetView:ActionInvoke("Show")
end

function slot0.updateFleetSelect(slot0)
	if slot0.levelFleetView:isShowing() then
		slot0.levelFleetView:ActionInvoke("set", slot0.levelFleetView.chapter, slot0.fleets, slot0.levelFleetView.selects)

		if slot0.levelCMDFormationView:isShowing() and slot0.fleets[slot0.levelCMDFormationView.fleet.id] then
			slot0.levelCMDFormationView:ActionInvoke("updateFleet", slot2)
		end
	end
end

function slot0.hideFleetSelect(slot0)
	if slot0.levelCMDFormationView:isShowing() then
		slot0.levelCMDFormationView:Hide()
	end

	if slot0.levelFleetView then
		slot0.levelFleetView:Hide()
	end
end

function slot0.buildCommanderPanel(slot0)
	slot0.levelCMDFormationView = LevelCMDFormationView.New(slot0.topPanel, slot0.event, slot0.contextData)
end

function slot0.destroyFleetSelect(slot0)
	slot0.levelFleetView:Destroy()

	slot0.levelFleetView = nil
end

function slot0.displayFleetEdit(slot0, slot1)
	slot0.levelFleetView:updateSpecialOperationTickets(slot0.spTickets)
	slot0.levelFleetView:Load()
	slot0.levelFleetView:ActionInvoke("setOpenCommanderTag", slot0.openedCommanerSystem)
	slot0.levelFleetView:ActionInvoke("setHardShipVOs", slot0.shipVOs)
	slot0.levelFleetView:ActionInvoke("setCBFuncOnHard", function (slot0, slot1)
		uv0:hideFleetEdit(slot0, slot1)
	end)
	slot0.levelFleetView:ActionInvoke("setOnHard", slot1)
	slot0.levelFleetView:ActionInvoke("Show")
end

function slot0.updateFleetEdit(slot0, slot1, slot2)
	if slot0.levelFleetView then
		slot3 = slot0.contextData.map

		if slot1 and slot0.levelFleetView.chapter.id == slot1.id then
			slot0.levelFleetView:ActionInvoke("setOnHard", slot1)
		end

		if slot1 and slot0.levelCMDFormationView:isShowing() then
			slot0.levelCMDFormationView:ActionInvoke("updateFleet", slot1:wrapEliteFleet(slot2))
		end
	end
end

function slot0.hideFleetEdit(slot0, slot1)
	if slot1 then
		slot0:emit(LevelMediator2.ON_UPDATE_CUSTOM_FLEET, slot1.id)
	end

	slot0:hideFleetSelect()
end

function slot0.destroyFleetEdit(slot0, slot1)
	if slot1 then
		slot0:emit(LevelMediator2.ON_UPDATE_CUSTOM_FLEET, slot1.id)
	end

	slot0:destroyFleetSelect()
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
			pg.NewStoryMgr.GetInstance():Play(slot2, function ()
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
		slot2 = slot1.id
	end

	slot0.contextData.chapterId = slot2
	slot0.contextData.chapterVO = slot1
end

function slot0.switchToChapter(slot0, slot1, slot2)
	if slot0.contextData.mapIdx ~= slot1:getConfig("map") then
		slot0:setMap(slot1:getConfig("map"))
	end

	slot0:setChapter(slot1)
	setActive(slot0.clouds, false)
	slot0.mapBuilder.buffer:Hide()

	slot0.leftCanvasGroup.blocksRaycasts = false
	slot0.rightCanvasGroup.blocksRaycasts = false

	slot0:onSubLayerContextChange()

	if not slot0.levelStageView then
		slot0.levelStageView = LevelStageView.New(slot0.topPanel, slot0.event, slot0.contextData)

		slot0.levelStageView:Load()
	end

	slot0:frozen(function ()
		uv0.levelStageView:tryAutoAction(function ()
			if uv0.levelStageView then
				uv0.levelStageView:DoSafeCheckOnBegin()
			end
		end)
	end)
	slot0.levelStageView:ActionInvoke("SetSeriesOperation", function ()
		seriesAsync({
			function (slot0)
				pg.UIMgr.GetInstance():BlurPanel(uv0.topPanel, false, {
					blurCamList = {
						pg.UIMgr.CameraUI
					}
				})
				uv0.levelStageView:updateStageInfo()
				uv0.levelStageView:updateAmbushRate(uv1.fleet.line, true)
				uv0.levelStageView:updateStageAchieve()
				uv0.levelStageView:updateStageBarrier()
				uv0.levelStageView:updateBombPanel()
				uv0.levelStageView:UpdateDefenseStatus()
				uv0.levelStageView:PopBar()
				onNextTick(slot0)
			end,
			function (slot0)
				if uv0.exited then
					return
				end

				uv0.levelStageView:updateStageStrategy()
				onNextTick(slot0)
			end,
			function (slot0)
				if uv0.exited then
					return
				end

				uv0.levelStageView:updateStageFleet()
				uv0.levelStageView:updateFleetBuff()
				onNextTick(slot0)
			end,
			function (slot0)
				if uv0.exited then
					return
				end

				parallelAsync({
					function (slot0)
						slot1 = uv0:getConfig("scale")

						uv1:RecordTween("mapScale", LeanTween.value(go(uv1.map), uv1.map.localScale, Vector3.New(slot1[3], slot1[3], 1), uv2):setOnUpdateVector3(function (slot0)
							uv0.map.localScale = slot0
							uv0.float.localScale = slot0
						end):setOnComplete(System.Action(slot0)):setEase(LeanTweenType.easeOutSine).uniqueId)

						uv1.lastRecordPivot = uv1.map.pivot
						slot3 = LeanTween.value(go(uv1.map), uv1.map.pivot, Vector2.New(math.clamp(slot1[1] - 0.5, 0, 1), math.clamp(slot1[2] - 0.5, 0, 1)), uv2)

						slot3:setOnUpdateVector2(function (slot0)
							uv0.map.pivot = slot0
							uv0.float.pivot = slot0
						end):setEase(LeanTweenType.easeOutSine)
						uv1:RecordTween("mapPivot", slot3.uniqueId)
						shiftPanel(uv1.leftChapter, -uv1.leftChapter.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(uv1.rightChapter, uv1.rightChapter.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(uv1.topChapter, 0, uv1.topChapter.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						uv1.levelStageView:ShiftStagePanelIn()
					end,
					function (slot0)
						uv1:SwitchBG(uv0:getConfig("bg"), slot0)
						uv1:PlayBGM()
					end
				}, function ()
					onNextTick(uv0)
				end)
			end,
			function (slot0)
				if uv0.exited then
					return
				end

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
				slot1 = getProxy(ChapterProxy)

				uv1.levelStageView:UpdateComboPanel(slot1:GetComboHistory(uv0.id))
				slot1:RecordComboHistory(uv0.id, nil)
				uv1.levelStageView:UpdateDOALinkFeverPanel(slot1:GetLastDefeatedEnemy(uv0.id))
				slot1:RecordLastDefeatedEnemy(uv0.id, nil)
				slot0()
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

function slot0.switchToMap(slot0, slot1)
	slot3 = getProxy(ChapterProxy)
	slot4 = slot0.contextData.chapterVO and slot3:getMapById(slot2:getConfig("map"))

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
		uv0.mapBuilder.buffer:Show()
		uv0:updateMapItems()
		uv0:unfrozen()

		if uv1 then
			uv1()
		end
	end)):setEase(LeanTweenType.easeOutSine).uniqueId)

	slot7 = LeanTween.value(go(slot0.map), slot0.map.pivot, slot0.lastRecordPivot or Vector2.zero, uv0)

	slot7:setOnUpdateVector2(function (slot0)
		uv0.map.pivot = slot0
		uv0.float.pivot = slot0
	end):setEase(LeanTweenType.easeOutSine)
	slot0:RecordTween("mapPivot", slot7.uniqueId)
	setActive(slot0.topChapter, true)
	setActive(slot0.leftChapter, true)
	setActive(slot0.rightChapter, true)
	shiftPanel(slot0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

	if slot0.levelStageView then
		slot0.levelStageView:ShiftStagePanelOut(function ()
			uv0:DestroyLevelStageView()
		end)
	end

	slot0:SwitchBG(slot0.contextData.map:getConfig("bg"))
	slot0:setChapter(nil)
	slot0:PlayBGM()
	pg.UIMgr.GetInstance():UnblurPanel(slot0.topPanel, slot0._tf)

	if slot0.ambushWarning and slot0.ambushWarning.activeSelf then
		slot0.ambushWarning:SetActive(false)
		slot0:unfrozen()
	end

	slot0:onSubLayerContextChange()
	slot0:switchDifficulty()
	slot0:updateActivityBtns()
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
				setImageSprite(uv0.map, slot0)

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

		slot0.levelAmbushView = nil
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
		slot2 = pg.strategy_data_template[uv1.id]

		if not uv0.contextData.chapterVO.fleet:canUseStrategy(uv1) then
			return
		end

		if slot2.type == ChapterConst.StgTypeForm then
			uv0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = slot1:getNextStgUser(uv1.id),
				arg1 = uv1.id
			})
		elseif slot2.type == ChapterConst.StgTypeConsume then
			uv0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = slot3,
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
	if slot0.levelStrategyView then
		slot0.levelStrategyView:Destroy()

		slot0.levelStrategyView = nil
	end
end

function slot0.displayRepairWindow(slot0, slot1)
	slot2 = slot0.contextData.chapterVO
	slot4, slot5, slot6, slot7 = nil
	slot8, slot9, slot10 = ChapterConst.GetRepairParams()
	slot0.levelRepairView = LevelRepairView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelRepairView:Load()
	slot0.levelRepairView:ActionInvoke("set", getProxy(ChapterProxy).repairTimes, slot8, slot9, slot10)
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
	if slot0.levelRepairView then
		slot0.levelRepairView:Destroy()

		slot0.levelRepairView = nil
	end
end

function slot0.displayRemasterPanel(slot0, slot1)
	slot2 = getProxy(ChapterProxy)
	slot3 = {}
	slot4 = pg.TimeMgr.GetInstance()

	for slot8, slot9 in ipairs(pg.re_map_template.all) do
		table.insert(slot3, pg.re_map_template[slot9])
	end

	table.sort(slot3, function (slot0, slot1)
		return slot0.order < slot1.order
	end)

	slot0.levelRemasterView = LevelRemasterView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelRemasterView:Load()
	slot0.levelRemasterView:ActionInvoke("set", slot3, slot2.remasterTickets, slot1)
	slot0.levelRemasterView:ActionInvoke("setCBFunc", function (slot0)
		if not (PlayerPrefs.HasKey("remaster_lastmap_" .. slot0.id) and PlayerPrefs.GetInt("remaster_lastmap_" .. slot0.id) or pg.chapter_template[slot0.config_data[1]].map) then
			return
		end

		uv0:ShowSelectedMap(slot1, function ()
			uv0:hideRemasterPanel()
		end)
	end, function ()
		uv0:hideRemasterPanel()
	end)
end

function slot0.hideRemasterPanel(slot0)
	if slot0.levelRemasterView then
		slot0.levelRemasterView:Destroy()

		slot0.levelRemasterView = nil
	end
end

function slot0.initGrid(slot0, slot1)
	if not slot0.contextData.chapterVO then
		return
	end

	slot0:enableLevelCamera()
	setActive(slot0.uiMain, true)

	slot0.levelGrid.localEulerAngles = Vector3(slot2.theme.angle, 0, 0)
	slot0.grid = LevelGrid.New(slot0.dragLayer)

	slot0.grid:attach(slot0)
	slot0.grid:ExtendItem("shipTpl", slot0.shipTpl)
	slot0.grid:ExtendItem("subTpl", slot0.subTpl)
	slot0.grid:ExtendItem("transportTpl", slot0.transportTpl)
	slot0.grid:ExtendItem("enemyTpl", slot0.enemyTpl)
	slot0.grid:ExtendItem("deadTpl", slot0.deadTpl)
	slot0.grid:ExtendItem("championTpl", slot0.championTpl)
	slot0.grid:ExtendItem("oniTpl", slot0.oniTpl)
	slot0.grid:ExtendItem("arrowTpl", slot0.arrowTarget)
	slot0.grid:ExtendItem("destinationMarkTpl", slot0.destinationMarkTpl)

	function slot0.grid.onCellClick(slot0)
		uv0:clickGridCell(slot0)
	end

	function slot0.grid.onShipStepChange(slot0)
		uv0.levelStageView:updateAmbushRate(slot0)
	end

	function slot0.grid.onShipArrived()
		uv0:overrideChapter()
		uv0.levelStageView:updateAmbushRate(uv0.contextData.chapterVO.fleet.line, true)
		uv0.levelStageView:updateStageStrategy()
	end

	slot0.grid:initAll(function ()
		uv0()
	end)
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
		pg.UIMgr.GetInstance():OverlayPanel(tf(uv1), false, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})

		if uv2 then
			uv2(uv1)
		end

		slot0:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
			uv0.playing = false

			pg.UIMgr.GetInstance():UnOverlayPanel(uv1, uv0._tf)

			if uv2 then
				uv2(uv3)
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
			pg.UIMgr.GetInstance():UnOverlayPanel(tf(slot5), slot0._tf)
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

		ShipExpressionHelper.SetExpression(uv0, uv1:getPainting())
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
		clouds = isActive(slot0.clouds)
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
	if not slot0.loadedTpls then
		return
	end

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
	slot4 = slot2.id

	slot0.levelCMDFormationView:setCallback(function (slot0)
		if not uv0 then
			if slot0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
				uv1:emit(LevelMediator2.ON_COMMANDER_SKILL, slot0.skill)
			elseif slot0.type == LevelUIConst.COMMANDER_OP_ADD then
				uv1.contextData.commanderSelected = {
					chapterId = uv2,
					fleetId = uv3.id
				}

				uv1:emit(LevelMediator2.ON_SELECT_COMMANDER, slot0.pos, uv3.id, uv4)
				uv1:closeCommanderPanel()
			else
				uv1:emit(LevelMediator2.ON_COMMANDER_OP, {
					FleetType = LevelUIConst.FLEET_TYPE_SELECT,
					data = slot0,
					fleetId = uv3.id,
					chapterId = uv2
				}, uv4)
			end
		elseif slot0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
			uv1:emit(LevelMediator2.ON_COMMANDER_SKILL, slot0.skill)
		elseif slot0.type == LevelUIConst.COMMANDER_OP_ADD then
			uv1.contextData.eliteCommanderSelected = {
				index = uv0,
				pos = slot0.pos,
				chapterId = uv2
			}

			uv1:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, uv0, slot0.pos, uv4)
			uv1:closeCommanderPanel()
		else
			uv1:emit(LevelMediator2.ON_COMMANDER_OP, {
				FleetType = LevelUIConst.FLEET_TYPE_EDIT,
				data = slot0,
				index = uv0,
				chapterId = uv2
			}, uv4)
		end
	end)
	slot0.levelCMDFormationView:Load()
	slot0.levelCMDFormationView:ActionInvoke("update", slot1, slot0.commanderPrefabs)
	slot0.levelCMDFormationView:ActionInvoke("Show")
end

function slot0.updateCommanderPrefab(slot0)
	if slot0.levelCMDFormationView:isShowing() then
		slot0.levelCMDFormationView:ActionInvoke("updatePrefabs", slot0.commanderPrefabs)
	end
end

function slot0.closeCommanderPanel(slot0)
	slot0.levelCMDFormationView:ActionInvoke("Hide")
end

function slot0.destroyCommanderPanel(slot0)
	slot0.levelCMDFormationView:Destroy()

	slot0.levelCMDFormationView = nil
end

function slot0.setSpecialOperationTickets(slot0, slot1)
	slot0.spTickets = slot1
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

function slot0.RecordLastMapOnExit(slot0)
	if getProxy(ChapterProxy) and not slot0.contextData.noRecord then
		if not slot0.contextData.map then
			return
		end

		if slot2 and slot2:NeedRecordMap() then
			slot1:recordLastMap(ChapterProxy.LAST_MAP, slot2.id)
		end

		if Map.lastMapForActivity then
			slot1:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, Map.lastMapForActivity)
		end
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

	slot0:destroyChapterPanel()
	slot0:destroyFleetEdit()
	slot0:destroyCommanderPanel()
	slot0:DestroyLevelStageView()
	slot0:hideSignalPanel()
	slot0:hideRepairWindow()
	slot0:hideStrategyInfo()
	slot0:hideRemasterPanel()
	slot0:hideSpResult()
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

	PoolMgr.GetInstance():DestroyPrefab("chapter/plane", slot4)

	for slot4, slot5 in pairs(slot0.mbDict) do
		slot5:Destroy()
	end

	slot0.mbDict = nil

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

	LeanTween.cancel(go(slot0.damageText))
	LeanTween.cancel(go(slot0.avoidText))

	slot0.map.localScale = Vector3.one
	slot0.map.pivot = Vector2(0.5, 0.5)
	slot0.float.localScale = Vector3.one
	slot0.float.pivot = Vector2(0.5, 0.5)

	clearImageSprite(slot0.map)
	_.each(slot0.cloudRTFs, function (slot0)
		clearImageSprite(slot0)
	end)
	PoolMgr.GetInstance():DestroyAllSprite()
	slot0:RecordLastMapOnExit()
end

return slot0
