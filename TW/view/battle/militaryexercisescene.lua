slot0 = class("MilitaryExerciseScene", import("..base.BaseUI"))
slot0.TYPE_SHOP = 1

function slot0.getUIName(slot0)
	return "MilitaryExerciseUI"
end

function slot0.getBGM(slot0)
	return "level"
end

function slot0.setShips(slot0, slot1)
	slot0.ships = slot1
end

function slot0.setFleet(slot0, slot1)
	slot0.fleet = slot1
end

function slot0.setRivals(slot0, slot1)
	table.sort(slot1, function (slot0, slot1)
		return slot0.rank < slot1.rank
	end)

	slot0.rivalVOs = slot1
end

function slot0.setExerciseCount(slot0, slot1)
	slot0.exerciseCount = slot1
end

function slot0.setSeasonTime(slot0, slot1)
	slot0.seasonTime = slot1
end

function slot0.setRecoverTime(slot0, slot1)
	slot0.recoverTime = slot1
end

function slot0.setActivity(slot0, slot1)
	slot0.activity = slot1

	slot0:setSeasonTime(slot1.stopTime)
end

function slot0.updateSeaInfoVO(slot0, slot1)
	slot0.seasonInfo = slot1

	slot0:setFleet(slot1.fleet)
	slot0:setRivals(slot1.rivals)
	slot0:setExerciseCount(slot1.fightCount)
	slot0:setRecoverTime(slot1.resetTime)
end

function slot0.setSeasonInfo(slot0, slot1)
	slot0:updateSeaInfoVO(slot1)
	slot0:setFleet(slot1.fleet)
	slot0:setRivals(slot1.rivals)
	slot0:setExerciseCount(slot1.fightCount)
	slot0:setRecoverTime(slot1.resetTime)
	slot0:updateSeasonTime()
	slot0:initPlayerFleet()
	slot0:initPlayerInfo()
	slot0:updateRivals()
end

function slot0.init(slot0)
	slot0.backBtn = slot0:findTF("blur_panel/adapt/top/backBtn")
	slot0._normalUIMain = pg.UIMgr.GetInstance().UIMain
	slot0._overlayUIMain = pg.UIMgr.GetInstance().OverlayMain
	slot0.playerResOb = slot0:findTF("playerRes")
	slot0.resPanel = PlayerResource.New()

	tf(slot0.resPanel._go):SetParent(tf(slot0.playerResOb), false)

	slot0.top = findTF(slot0._tf, "blur_panel/adapt/top")

	SetParent(slot0.playerResOb, slot0.top)

	slot0.awardPanel = slot0:findTF("award_info_panel")

	setActive(slot0.awardPanel, false)

	slot0.rivalList = slot0:findTF("center/rival_list")
	slot0.bottomPanel = slot0:findTF("bottom")
	slot0.shipTpl = slot0:getTpl("fleet_info/shiptpl", slot0.bottomPanel)
	slot0.emptyTpl = slot0:getTpl("fleet_info/emptytpl", slot0.bottomPanel)
	slot0.mainContainer = slot0:findTF("fleet_info/main", slot0.bottomPanel)
	slot0.vanguardContainer = slot0:findTF("fleet_info/vanguard", slot0.bottomPanel)
	slot0.rankCfg = pg.arena_data_rank

	slot0:uiStartAnimating()
end

function slot0.updatePlayer(slot0, slot1)
	slot0.player = slot1

	slot0.resPanel:setResources(slot1)
	setText(findTF(slot0:findTF("bottom/player_info"), "statistics_panel/exploit_bg/score"), slot1.exploit)
end

function slot0.uiStartAnimating(slot0)
	setAnchoredPosition(slot0.bottomPanel, {
		y = slot0.bottomPanel.localPosition.y - 308
	})
	shiftPanel(slot0.bottomPanel, nil, slot0.bottomPanel.localPosition.y, 0.3, 0, true, true)
end

function slot0.uiExitAnimating(slot0)
	shiftPanel(slot0.bottomPanel, nil, slot0.bottomPanel.localPosition.y - 308, 0.3, 0, true, true)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		if slot0.isOpenRivalInfoPanel then
			slot0:closeRivalInfoPanel()
		else
			slot0:emit(slot1.ON_BACK)
		end
	end, SFX_CANCEL)
	setActive(slot0:findTF("stamp"), getProxy(TaskProxy):mingshiTouchFlagEnabled())

	if LOCK_CLICK_MINGSHI then
		setActive(slot0:findTF("stamp"), false)
	end

	onButton(slot0, slot0:findTF("stamp"), function ()
		getProxy(TaskProxy):dealMingshiTouchFlag(10)
	end, SFX_CONFIRM)
	onButton(slot0, slot0:findTF("bottom/buttons/rank_btn"), function ()
		slot0:emit(MilitaryExerciseMediator.OPEN_RANK)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("bottom/buttons/shop_btn"), function ()
		slot0:emit(MilitaryExerciseMediator.OPEN_SHOP)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("bottom/buttons/award_btn"), function ()
		slot0.isOpenAwards = true

		pg.UIMgr.GetInstance():BlurPanel(slot0.awardPanel)

		if not pg.UIMgr.GetInstance().BlurPanel.isInitAward then
			slot0:initAwards()

			slot0.initAwards.isInitAward = true
		else
			setActive(slot0.awardPanel, true)
		end
	end, SFX_PANEL)
	onButton(slot0, findTF(slot0._tf, "center/replace_rival_btn"), function ()
		slot0:emit(MilitaryExerciseMediator.REPLACE_RIVALS)
	end, SFX_PANEL)

	if slot0.contextData.mode == slot0.TYPE_SHOP then
		triggerToggle(slot0.shopBtn, true)
	end
end

function slot0.updateSeasonTime(slot0)
	slot0.seasonInfoPanel = slot0:findTF("center/season_info")

	slot0:updateSeasonLeftTime(slot0.seasonTime)
	slot0:updateRecoverTime(slot0.recoverTime)
	slot0:updateExerciseCount()
end

function slot0.updateExerciseCount(slot0)
	setText(findTF(slot0.seasonInfoPanel, "count"), math.max(slot0.exerciseCount or 0, 0) .. "/" .. SeasonInfo.MAX_FIGHTCOUNT)
end

function slot0.updateSeasonLeftTime(slot0, slot1)
	if slot0.leftTimeTimer then
		slot0.leftTimeTimer:Stop()

		slot0.leftTimeTimer = nil
	end

	slot2 = findTF(slot0.seasonInfoPanel, "left_time_container/day")
	slot3 = findTF(slot0.seasonInfoPanel, "left_time_container/time")
	slot0.leftTimeTimer = Timer.New(function ()
		if slot0 - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
			slot6, slot6, slot10, slot11 = pg.TimeMgr.GetInstance():parseTimeFrom(slot0)

			setText(slot1, slot1)
			setText(slot2, string.format("%02d:%02d:%02d", slot2, slot3, slot4))
		else
			setText(setText, 0)
			setText(setText, string.format("%02d:%02d:%02d", 0, 0, 0))
			slot3.leftTimeTimer:Stop()

			string.format.leftTimeTimer = nil
		end
	end, 1, -1)

	slot0.leftTimeTimer:Start()
	slot0.leftTimeTimer.func()
end

function slot0.updateRecoverTime(slot0, slot1)
	if slot0.recoverTimer then
		slot0.recoverTimer:Stop()

		slot0.recoverTimer = nil
	end

	slot2 = findTF(slot0.seasonInfoPanel, "recover_container/time")

	if slot1 == 0 then
		setText(slot2, "")

		return
	end

	slot0.recoverTimer = Timer.New(function ()
		if slot0 - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
			setText(setText, i18n("exercise_count_recover_tip", pg.TimeMgr.GetInstance():DescCDTime(slot0)))
		else
			slot2.recoverTimer:Stop()

			slot2.recoverTimer.recoverTimer = nil
		end
	end, 1, -1)

	slot0.recoverTimer:Start()
	slot0.recoverTimer.func()
end

function slot0.initPlayerFleet(slot0)
	function slot1(slot0, slot1, slot2)
		slot3 = cloneTplTo(slot0.shipTpl, slot1)
		slot4 = slot0.configId
		slot5 = slot0.skinId

		updateShip(slot3, slot0, {
			initStar = true
		})
		setText(findTF(slot3, "icon_bg/lv/Text"), slot0.level)
		onButton(slot0, slot3, function ()
			slot0:emit(MilitaryExerciseMediator.OPEN_DOCKYARD, slot0, slot2.id)
		end, SFX_PANEL)
	end

	removeAllChildren(slot0.mainContainer)
	removeAllChildren(slot0.vanguardContainer)

	for slot5 = 1, 3, 1 do
		if slot0.fleet.mainShips[slot5] then
			if slot0.ships[slot6] then
				slot1(slot7, slot0.mainContainer, TeamType.Main)
			end
		else
			onButton(slot0, findTF(slot7, "icon_bg"), function ()
				slot0:emit(MilitaryExerciseMediator.OPEN_DOCKYARD, TeamType.Main, 0)
			end, SFX_PANEL)
		end
	end

	for slot5 = 1, 3, 1 do
		if slot0.fleet.vanguardShips[slot5] then
			if slot0.ships[slot6] then
				slot1(slot7, slot0.vanguardContainer, TeamType.Vanguard)
			end
		else
			onButton(slot0, findTF(slot7, "icon_bg"), function ()
				slot0:emit(MilitaryExerciseMediator.OPEN_DOCKYARD, TeamType.Vanguard, 0)
			end, SFX_PANEL)
		end
	end
end

function slot0.initPlayerInfo(slot0)
	slot2 = slot0:findTF("bottom/player_info")

	setText(findTF(slot2, "statistics_panel/score_bg/score"), slot1)
	setText(findTF(slot2, "statistics_panel/rank_bg/score"), slot0.seasonInfo.rank)

	slot6 = SeasonInfo.getMilitaryRank(slot1, slot0.seasonInfo.rank)

	LoadImageSpriteAsync("emblem/" .. slot7, findTF(slot2, "medal_bg/medal"), true)
	LoadImageSpriteAsync("emblem/n_" .. slot7, findTF(slot2, "medal_bg/Text"), true)

	slot14, slot13, slot11 = SeasonInfo.getNextMilitaryRank(slot1, slot0.seasonInfo.rank)

	setText(slot3, slot9)
	setText(slot5, slot10)
	setText(findTF(slot2, "upgrade_rank_tip/level"), (slot11 > 0 and slot11) or "-")

	findTF(slot2, "exp_slider"):GetComponent("Slider").value = math.min(slot10, slot0.seasonInfo.score) / slot10
end

function slot0.updateRivals(slot0)
	slot0.rivalTFs = {}

	for slot4 = 1, 4, 1 do
		table.insert(slot0.rivalTFs, slot0.rivalList:GetChild(slot4 - 1))
	end

	for slot4 = 1, 4, 1 do
		setActive(slot0.rivalTFs[slot4], slot4 <= #slot0.rivalVOs)

		if slot4 <= #slot0.rivalVOs then
			slot0:updateRival(slot4)
		end
	end
end

function slot0.updateRival(slot0, slot1)
	slot4 = SeasonInfo.getMilitaryRank(slot0.rivalVOs[slot1].score, slot0.rivalVOs[slot1].rank)

	LoadImageSpriteAsync("emblem/" .. slot6, findTF(slot2, "medal"), true)
	LoadImageSpriteAsync("emblem/n_" .. slot6, findTF(slot2, "Text"), true)
	updateDrop(slot5, {
		type = DROP_TYPE_SHIP,
		id = slot0.rivalVOs[slot1].icon,
		skinId = slot0.rivalVOs[slot1].skinId,
		propose = slot0.rivalVOs[slot1].proposeTime,
		remoulded = slot0.rivalVOs[slot1].remoulded
	}, {
		initStar = true
	})
	setActive(findTF(slot5, "icon_bg/lv"), false)
	setText(findTF(slot2, "rank_bg/rank_container/name"), slot0.rivalVOs[slot1].rank)
	setText(findTF(slot2, "name_container/name"), slot0.rivalVOs[slot1].name)
	setText(findTF(slot2, "name_container/lv"), "Lv." .. slot0.rivalVOs[slot1].level)
	setText(findTF(slot2, "comprehensive_panel/comprehensive/main_fleet/value"), slot0.rivalVOs[slot1].GetGearScoreSum(slot3, TeamType.Main))
	setText(findTF(slot2, "comprehensive_panel/comprehensive/vanguard_fleet/value"), slot0.rivalVOs[slot1].GetGearScoreSum(slot3, TeamType.Vanguard))
	onButton(slot0, slot0.rivalTFs[slot1], function ()
		slot0:emit(MilitaryExerciseMediator.OPEN_RIVAL_INFO, slot0)
	end, SFX_PANEL)
end

function slot0.initAwards(slot0)
	setActive(slot0.awardPanel, true)
	onButton(slot0, slot0:findTF("top/btnBack", slot0.awardPanel), function ()
		slot0:closeAwards()
	end, SFX_CANCEL)
	setText(slot1, i18n("exercise_time_tip", "   " .. os.date("%Y.%m.%d", slot0.activity.data1) .. " — " .. os.date("%Y.%m.%d", slot0.activity.stopTime)))
	setText(slot2, i18n("exercise_rule_tip"))

	slot5 = slot0:getTpl("awards/equipmenttpl", slot4)
	slot6 = slot0:findTF("linetpl", slot3)

	setText(slot7, i18n("exercise_award_tip"))

	function slot8(slot0, slot1)
		slot2 = slot0:findTF("awards", slot0)

		setText(findTF(slot0, "Text"), slot0.rankCfg[slot1].name .. ":")

		for slot7, slot8 in ipairs(slot0.rankCfg[slot1].award_list) do
			slot9 = cloneTplTo(slot1, slot2)

			updateDrop(slot9, {
				type = slot8[1],
				id = slot8[2],
				count = slot8[3]
			})
			onButton(slot0, slot9:Find("icon_bg"), function ()
				slot0.emit(slot1, BaseUI.ON_ITEM, (slot1[1] == 1 and id2ItemId(slot1[2])) or slot1[2])
			end, SFX_PANEL)
		end

		setText(findTF(slot0, "upgrade_score_tip/level"), slot3.point)
		setText(findTF(slot0, "upgrade_rank_tip/level"), (slot3.order > 0 and slot3.order) or "-")
	end

	for slot12 = #slot0.rankCfg.all, 1, -1 do
		if #slot0.rankCfg[slot0.rankCfg.all[slot12]].award_list > 0 then
			slot8(cloneTplTo(slot4, slot3), slot13)
			cloneTplTo(slot6, slot3)
		end
	end
end

function slot0.closeAwards(slot0)
	if slot0.isOpenAwards then
		setActive(slot0.awardPanel, false)

		slot0.isOpenAwards = false

		pg.UIMgr.GetInstance():UnblurPanel(slot0.awardPanel, slot0._tf)
	end
end

function slot0.onBackPressed(slot0)
	if slot0.isOpenAwards then
		slot0:closeAwards()
	else
		playSoundEffect(SFX_CANCEL)
		slot0:emit(slot0.ON_BACK)
	end
end

function slot0.willExit(slot0)
	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	if slot0.leftTimeTimer then
		slot0.leftTimeTimer:Stop()

		slot0.leftTimeTimer = nil
	end

	if slot0.recoverTimer then
		slot0.recoverTimer:Stop()

		slot0.recoverTimer = nil
	end

	slot0:closeAwards()

	if slot0.resPanel then
		slot0.resPanel:exit()

		slot0.resPanel = nil
	end
end

return slot0
