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
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_daily_task.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		if slot0.descMode then
			slot0:enableDescMode(false)
		else
			slot0:emit(slot1.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.leftBtn, function ()
		slot0:flipToSpecificCard(slot0:getNextCardId(true))
	end)
	onButton(slot0, slot0.rightBtn, function ()
		slot0:flipToSpecificCard(slot0:getNextCardId(false))
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
		table.removebyvalue(slot0.dailyList, slot2)
		table.insert(slot0.dailyList, math.ceil(#slot1.all / 2), slot0.contextData.dailyLevelId)
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
		slot0:tryOpenDesc(tonumber(slot0.name))
	end

	slot0.centerAniItem = nil
	slot0.centerCardId = nil
	slot0.checkAniTimer = Timer.New(function ()
		for slot3, slot4 in pairs(slot0.dailyLevelTFs) do
			slot6 = slot4.localScale.x >= 0.98

			if slot0.centerAniItem == slot4 and slot6 then
				return
			else
				if slot6 then
					slot0.centerAniItem = slot4
					slot0.centerCardId = slot3
				end

				if slot0:findTF("icon/card", slot4) then
					setActive(slot0:findTF("effect", slot7), slot6)

					if slot0:findTF("mask/char", slot7):GetComponent(typeof(Animator)) then
						slot8.speed = (slot6 and 1) or 0
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
		tf(slot0):SetParent(tf(slot0), false)

		tf(slot0).localPosition = Vector3.zero
		tf(slot0).name = "card"
	end)
	setText(findTF(slot3, "Text"), "")

	slot6 = findTF(slot3, "count")
	slot7 = slot0.dailyCounts[slot1] or 0

	if slot2.limit_time == 0 then
		setText(slot6, "N/A")
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
	slot2 = pg.expedition_daily_template[slot1]
	slot3 = slot0.dailyCounts[slot1] or 0

	if slot2.limit_time == 0 then
		setText(slot0.descChallengeText, i18n("challenge_count_unlimit"))
	else
		setText(slot0.descChallengeText, string.format("%d/%d", slot2.limit_time - slot3, slot2.limit_time))
	end

	setActive(slot0.challengeQuotaDaily, slot2.limit_type == 1)
	setActive(slot0.challengeQuotaWeekly, slot2.limit_type == 2)
	removeAllChildren(slot0.stageContain)

	slot0.stageTFs = {}

	for slot8, slot9 in ipairs(slot4) do
		slot0.stageTFs[slot9[1]] = cloneTplTo(slot0.stageTpl, slot0.stageContain)
		slot12 = {
			id = slot9[1],
			level = slot9[2]
		}

		if slot1 == CHALLENGE_CARD_ID then
			slot0:updateChallenge(slot12)
		else
			slot0:updateStage(slot12)
		end
	end
end

function slot0.updateStage(slot0, slot1)
	setText(findTF(slot3, "left_panel/name"), pg.expedition_data_template[slot1.id].name)
	setText(findTF(slot3, "left_panel/lv/Text"), "Lv." .. slot1.level)
	setActive(slot0:findTF("mask", slot3), slot0.player.level < slot1.level)

	if slot0.player.level < slot1.level then
		setText(slot0:findTF("msg/msg_contain/Text", slot4), "Lv." .. slot1.level .. " ")
	end

	slot5 = slot0:findTF("scrollView/right_panel", slot3)

	for slot9, slot10 in ipairs(slot2.award_display) do
		updateDrop(cloneTplTo(slot0.itemTpl, slot5), {
			type = slot10[1],
			id = slot10[2],
			count = slot10[3]
		})
	end

	setImageSprite(slot3, getImageSprite(findTF(slot0.resource, "normal_bg")))
	setActive(findTF(slot3, "score"), false)
	onButton(slot0, slot3, function ()
		if slot0.limit_time <= (slot0.dailyCounts[slot0.dailyLevelId] or 0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dailyLevel_restCount_notEnough"))

			return
		end

		slot0:emit(DailyLevelMediator.ON_STAGE, slot0.emit)
	end, SFX_PANEL)
	onButton(slot0, slot4, function ()
		pg.TipsMgr.GetInstance():ShowTips(i18n("dailyLevel_unopened"))
	end, SFX_PANEL)
end

function slot0.enableDescMode(slot0, slot1)
	slot0.descMode = slot1

	setActive(slot0:findTF("help_btn"), not slot1)

	function slot2(slot0, slot1, slot2, slot3)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-22, warpins: 2 ---
		if LeanTween.isTweening(go(slot0)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-14, warpins: 1 ---
			LeanTween.cancel(go(slot0))
			--- END OF BLOCK #0 ---



		end

		slot4 = LeanTween.moveX
		slot5 = rtf(slot0)
		slot6 = slot1
		slot7 = slot3 or 0.3

		LeanTween.moveX(slot5, slot6, slot7):setEase(LeanTweenType.linear):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-5, warpins: 1 ---
				slot0()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 6-6, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end))

		return

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 23-23, warpins: 1 ---
		slot7 = 0.3
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 24-38, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	function slot3()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-73, warpins: 0 ---
		for slot3, slot4 in pairs(slot0.dailyLevelTFs) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-14, warpins: 1 ---
			setButtonEnabled(slot4, not slot1)

			if slot3 ~= slot0.curId then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-22, warpins: 1 ---
				if LeanTween.isTweening(go(slot4)) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 23-28, warpins: 1 ---
					LeanTween.cancel(go(slot4))
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 29-37, warpins: 2 ---
				slot5 = GetComponent(slot4, typeof(CanvasGroup))

				if slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 38-54, warpins: 1 ---
					LeanTween.value(go(slot4), 1, 0, 0.3):setOnUpdate(System.Action_float(function (slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-3, warpins: 1 ---
						slot0.alpha = slot0

						return
						--- END OF BLOCK #0 ---



					end))
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 55-70, warpins: 1 ---
					LeanTween.value(go(slot4), 0, 1, 0.3):setOnUpdate(System.Action_float(function (slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-3, warpins: 1 ---
						slot0.alpha = slot0

						return
						--- END OF BLOCK #0 ---



					end))
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 71-71, warpins: 2 ---
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 72-73, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 74-74, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end

	function slot4()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-22, warpins: 1 ---
		setActive(slot0.listPanel, true)
		setActive(slot0.content, true)
		setActive(slot0.descPanel, )
		setActive(slot0.arrows, not slot1)

		return
		--- END OF BLOCK #0 ---



	end

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-23, warpins: 1 ---
		slot4()
		slot3()
		slot2(slot0.listPanel, -622, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0(slot1.descMain, 0)

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-35, warpins: 1 ---
		slot4()
		slot3()
		slot2(slot0.listPanel, 0)
		slot2(slot0.descMain, -1342)
		--- END OF BLOCK #0 ---



	end
end

function slot0.flipToSpecificCard(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot2 = slot0.content:GetComponent(typeof(EnhancelScrollView))

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-25, warpins: 0 ---
	for slot6, slot7 in pairs(slot0.dailyLevelTFs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-13, warpins: 1 ---
		if slot1 == slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-23, warpins: 1 ---
			slot2:SetHorizontalTargetItemIndex(slot7:GetComponent(typeof(EnhanceItem)).scrollViewItemIndex)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 24-25, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 26-26, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.tryPlayGuide(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	pg.SystemGuideMgr.GetInstance():PlayDailyLevel(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		triggerButton(slot0:findTF("help_btn"))

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.clearTween(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.tweens then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		cancelTweens(slot0.tweens)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-11, warpins: 2 ---
	function slot1(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		if LeanTween.isTweening(go(slot0)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-14, warpins: 1 ---
			LeanTween.cancel(go(slot0))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-15, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-16, warpins: 0 ---
	for slot5, slot6 in pairs(slot0.dailyLevelTFs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-14, warpins: 1 ---
		slot1(slot6)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-16, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 17-23, warpins: 1 ---
	slot1(slot0.listPanel)
	slot1(slot0.descMain)

	return
	--- END OF BLOCK #3 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0:clearTween()

	if slot0.checkAniTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-12, warpins: 1 ---
		slot0.checkAniTimer:Stop()

		slot0.checkAniTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-15, warpins: 2 ---
	if slot0.resPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-21, warpins: 1 ---
		slot0.resPanel:exit()

		slot0.resPanel = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-22, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

return slot0
