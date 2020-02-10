slot0 = class("DailyLevelScene", import("..base.BaseUI"))
slot1 = 3
slot2 = 4

function slot0.getUIName(slot0)
	return "dailylevelui"
end

function slot0.init(slot0)
	slot0.topPanel = slot0:findTF("blur_panel/adapt/top")
	slot0.backBtn = slot0:findTF("back_button", slot0.topPanel)
	slot0.resPanel = PlayerResource.New()

	SetParent(slot0.resPanel._go, slot0:findTF("res", slot0.topPanel), false)

	slot0.listPanel = slot0:findTF("list_panel")
	slot0.content = slot0:findTF("list", slot0.listPanel)

	setActive(slot0.content, true)

	slot0.dailylevelTpl = slot0:getTpl("list_panel/list/captertpl")
	slot0.descPanel = slot0:findTF("desc_panel")
	slot0.descMain = slot0:findTF("main_mask/main", slot0.descPanel)
	slot0.stageTpl = slot0:getTpl("scrollview/content/stagetpl", slot0.descMain)
	slot0.stageContain = slot0:findTF("scrollview/content", slot0.descMain)
	slot0.arrows = slot0:findTF("arrows")
	slot0.itemTpl = slot0:getTpl("item_tpl")
	slot0.descChallengeNum = slot0:findTF("challenge_count", slot0.descMain)
	slot0.descChallengeText = slot0:findTF("Text", slot0.descChallengeNum)
	slot0.challengeQuotaDaily = slot0:findTF("challenge_count/label", slot0.descMain)
	slot0.challengeQuotaWeekly = slot0:findTF("challenge_count/week_label", slot0.descMain)
	slot0.fleetEditView = slot0:findTF("fleet_edit")
	slot0.resource = slot0:findTF("resource")
	slot0.rightBtn = slot0:findTF("arrows/arrow1")
	slot0.leftBtn = slot0:findTF("arrows/arrow2")

	slot0:initItems()
end

function slot0.getWeek(slot0)
	return pg.TimeMgr.GetInstance():GetServerWeek()
end

function slot0.setDailyCounts(slot0, slot1)
	slot0.dailyCounts = slot1
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.updateRes(slot0, slot1)
	slot0.resPanel:setResources(slot1)

	slot0.player = slot1
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0:findTF("help_btn"), function ()
		slot2.type = MSGBOX_TYPE_HELP
		slot2.helps = pg.gametip.help_daily_task.tip

		pg.MsgboxMgr.GetInstance():ShowMsgBox({})
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		if uv0.descMode then
			uv0:enableDescMode(false)
		else
			uv0:emit(uv1.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.leftBtn, function ()
		uv0:flipToSpecificCard(uv0:getNextCardId(true))
	end)
	onButton(slot0, slot0.rightBtn, function ()
		uv0:flipToSpecificCard(uv0:getNextCardId(false))
	end)
	slot0:displayDailyLevels()

	if slot0.contextData.dailyLevelId then
		slot0:tryOpenDesc(slot0.contextData.dailyLevelId)
	else
		slot0:enableDescMode(false)
	end

	slot0:tryPlayGuide()
end

function slot0.initItems(slot0)
	slot0.dailyLevelTFs = {}
	slot0.dailyList = _.reverse(Clone(pg.expedition_daily_template.all))

	for slot5, slot6 in pairs(slot0.dailyList) do
		if table.contains(pg.expedition_daily_template[slot6].weekday, tonumber(slot0:getWeek())) then
			table.remove(slot0.dailyList, slot5)
			table.insert(slot0.dailyList, math.ceil(#slot1.all / 2), slot6)

			break
		end
	end

	if slot0.contextData.dailyLevelId then
		slot2 = slot0.contextData.dailyLevelId

		table.removebyvalue(slot0.dailyList, slot2)
		table.insert(slot0.dailyList, math.ceil(#slot1.all / 2), slot2)
	end

	for slot5, slot6 in pairs(slot0.dailyList) do
		slot0.dailyLevelTFs[slot6] = cloneTplTo(slot0.dailylevelTpl, slot0.content, slot6)
	end
end

function slot0.displayDailyLevels(slot0)
	for slot4, slot5 in pairs(slot0.dailyLevelTFs) do
		slot0:initDailyLevel(slot4)
	end

	slot0.content:GetComponent(typeof(EnhancelScrollView)).onCenterClick = function (slot0)
		uv0:tryOpenDesc(tonumber(slot0.name))
	end

	slot0.centerAniItem = nil
	slot0.centerCardId = nil
	slot0.checkAniTimer = Timer.New(function ()
		for slot3, slot4 in pairs(uv0.dailyLevelTFs) do
			if uv0.centerAniItem == slot4 and slot4.localScale.x >= 0.98 then
				return
			else
				if slot6 then
					uv0.centerAniItem = slot4
					uv0.centerCardId = slot3
				end

				slot7 = uv0

				if slot7:findTF("icon/card", slot4) then
					slot8 = uv0:findTF("mask/char", slot7)

					setActive(uv0:findTF("effect", slot7), slot6)

					if slot8:GetComponent(typeof(Animator)) then
						slot8.speed = slot6 and 1 or 0
					end
				end
			end
		end
	end, 0.2, -1)

	slot0.checkAniTimer:Start()
end

function slot0.tryOpenDesc(slot0, slot1)
	slot2 = slot0.dailyLevelTFs[slot1]

	if table.contains(pg.expedition_daily_template[slot1].weekday, tonumber(slot0:getWeek())) then
		slot0:openDailyDesc(slot1)
	else
		pg.TipsMgr.GetInstance():ShowTips(slot3.tips)
	end
end

function slot0.getNextCardId(slot0, slot1)
	slot2 = table.indexof(slot0.dailyList, slot0.centerCardId)

	if slot1 then
		if slot2 - 1 <= 0 then
			slot2 = #slot0.dailyList or slot2
		end
	elseif slot2 + 1 > #slot0.dailyList then
		slot2 = 1
	end

	return slot0.dailyList[slot2]
end

function slot0.initDailyLevel(slot0, slot1)
	slot3 = slot0.dailyLevelTFs[slot1]

	if table.contains(pg.expedition_daily_template[slot1].weekday, tonumber(slot0:getWeek())) then
		slot0.index = slot1
	end

	setActive(findTF(slot3, "lock"), not slot4 and not table.isEmpty(slot2.weekday))
	setText(findTF(slot3, "name"), slot2.title)
	setActive(findTF(slot3, "time"), false)

	slot5 = findTF(slot3, "icon")

	PoolMgr.GetInstance():GetPrefab("dailyui/" .. slot2.pic, "", true, function (slot0)
		slot0 = tf(slot0)

		slot0:SetParent(uv0, false)

		slot0.localPosition = Vector3.zero
		slot0.name = "card"
	end)
	setText(findTF(slot3, "Text"), "")

	slot7 = slot0.dailyCounts[slot1] or 0

	if slot2.limit_time == 0 then
		setText(findTF(slot3, "count"), "N/A")
	else
		setText(slot6, string.format("%d/%d", slot2.limit_time - slot7, slot2.limit_time))
	end

	setActive(slot6, slot2.limit_time > 0)
end

function slot0.openDailyDesc(slot0, slot1)
	slot0.curId = slot1

	slot0:enableDescMode(true)
	slot0:displayStageList(slot1)
end

function slot0.displayStageList(slot0, slot1)
	slot0.dailyLevelId = slot1
	slot0.contextData.dailyLevelId = slot0.dailyLevelId
	slot3 = slot0.dailyCounts[slot1] or 0

	if pg.expedition_daily_template[slot1].limit_time == 0 then
		setText(slot0.descChallengeText, i18n("challenge_count_unlimit"))
	else
		setText(slot0.descChallengeText, string.format("%d/%d", slot2.limit_time - slot3, slot2.limit_time))
	end

	setActive(slot0.challengeQuotaDaily, slot2.limit_type == 1)
	setActive(slot0.challengeQuotaWeekly, slot2.limit_type == 2)
	removeAllChildren(slot0.stageContain)

	slot0.stageTFs = {}

	for slot8, slot9 in ipairs(_.sort(slot2.expedition_and_lv_limit_list, function (slot0, slot1)
		slot2 = slot0[2] <= uv0.player.level and 1 or 0
		slot3 = slot1[2] <= uv0.player.level and 1 or 0

		if slot0[2] == slot1[2] then
			return slot0[1] < slot1[1]
		end

		if slot2 == slot3 then
			if slot2 == 1 then
				return slot1[2] < slot0[2]
			else
				return slot0[2] < slot1[2]
			end
		else
			return slot3 < slot2
		end
	end)) do
		slot10 = slot9[1]
		slot0.stageTFs[slot10] = cloneTplTo(slot0.stageTpl, slot0.stageContain)
		slot12.id = slot10
		slot12.level = slot9[2]

		if slot1 == CHALLENGE_CARD_ID then
			slot0:updateChallenge({})
		else
			slot0:updateStage(slot12)
		end
	end
end

function slot0.updateStage(slot0, slot1)
	slot3 = slot0.stageTFs[slot1.id]

	setText(findTF(slot3, "left_panel/name"), pg.expedition_data_template[slot1.id].name)
	setText(findTF(slot3, "left_panel/lv/Text"), "Lv." .. slot1.level)
	setActive(slot0:findTF("mask", slot3), slot0.player.level < slot1.level)

	if slot0.player.level < slot1.level then
		setText(slot0:findTF("msg/msg_contain/Text", slot4), "Lv." .. slot1.level .. " ")
	end

	for slot9, slot10 in ipairs(slot2.award_display) do
		slot14.type = slot10[1]
		slot14.id = slot10[2]
		slot14.count = slot10[3]

		updateDrop(cloneTplTo(slot0.itemTpl, slot0:findTF("scrollView/right_panel", slot3)), {})
	end

	setImageSprite(slot3, getImageSprite(findTF(slot0.resource, "normal_bg")))
	setActive(findTF(slot3, "score"), false)
	onButton(slot0, slot3, function ()
		if pg.expedition_daily_template[uv0.dailyLevelId].limit_time <= (uv0.dailyCounts[uv0.dailyLevelId] or 0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dailyLevel_restCount_notEnough"))

			return
		end

		uv0:emit(DailyLevelMediator.ON_STAGE, uv1)
	end, SFX_PANEL)
	onButton(slot0, slot4, function ()
		pg.TipsMgr.GetInstance():ShowTips(i18n("dailyLevel_unopened"))
	end, SFX_PANEL)
end

function slot0.enableDescMode(slot0, slot1)
	slot0.descMode = slot1

	setActive(slot0:findTF("help_btn"), not slot1)

	if slot1 then
		function ()
			setActive(uv0.listPanel, true)
			setActive(uv0.content, true)
			setActive(uv0.descPanel, uv1)
			setActive(uv0.arrows, not uv1)
		end()
		function ()
			for slot3, slot4 in pairs(uv0.dailyLevelTFs) do
				setButtonEnabled(slot4, not uv1)

				if slot3 ~= uv0.curId then
					if LeanTween.isTweening(go(slot4)) then
						LeanTween.cancel(go(slot4))
					end

					slot5 = GetComponent(slot4, typeof(CanvasGroup))

					if uv1 then
						LeanTween.value(go(slot4), 1, 0, 0.3):setOnUpdate(System.Action_float(function (slot0)
							uv0.alpha = slot0
						end))
					else
						LeanTween.value(go(slot4), 0, 1, 0.3):setOnUpdate(System.Action_float(function (slot0)
							uv0.alpha = slot0
						end))
					end
				end
			end
		end()
		function (slot0, slot1, slot2, slot3)
			if LeanTween.isTweening(go(slot0)) then
				LeanTween.cancel(go(slot0))
			end

			LeanTween.moveX(rtf(slot0), slot1, slot3 or 0.3):setEase(LeanTweenType.linear):setOnComplete(System.Action(function ()
				if uv0 then
					uv0()
				end
			end))
		end(slot0.listPanel, -622, function ()
			uv0(uv1.descMain, 0)
		end)
	else
		slot4()
		slot3()
		slot2(slot0.listPanel, 0)
		slot2(slot0.descMain, -1342)
	end
end

function slot0.flipToSpecificCard(slot0, slot1)
	for slot6, slot7 in pairs(slot0.dailyLevelTFs) do
		if slot1 == slot6 then
			slot0.content:GetComponent(typeof(EnhancelScrollView)):SetHorizontalTargetItemIndex(slot7:GetComponent(typeof(EnhanceItem)).scrollViewItemIndex)
		end
	end
end

function slot0.tryPlayGuide(slot0)
	pg.SystemGuideMgr.GetInstance():PlayDailyLevel(function ()
		triggerButton(uv0:findTF("help_btn"))
	end)
end

function slot0.clearTween(slot0)
	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	for slot5, slot6 in pairs(slot0.dailyLevelTFs) do
		function (slot0)
			if LeanTween.isTweening(go(slot0)) then
				LeanTween.cancel(go(slot0))
			end
		end(slot6)
	end

	slot1(slot0.listPanel)
	slot1(slot0.descMain)
end

function slot0.willExit(slot0)
	slot0:clearTween()

	if slot0.checkAniTimer then
		slot0.checkAniTimer:Stop()

		slot0.checkAniTimer = nil
	end

	if slot0.resPanel then
		slot0.resPanel:exit()

		slot0.resPanel = nil
	end
end

return slot0
