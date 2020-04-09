slot1 = class("MapBuilderNormal", import(".MapBuilder"))

function slot1.Ctor(slot0, ...)
	slot0.super.Ctor(slot0, ...)

	slot0.mapItemTimer = {}
	slot0.chapterTFsById = {}
end

function slot1.GetType(slot0)
	return slot0.TYPENORMAL
end

function slot1.GetUIName(slot0)
	return "levels"
end

function slot1.Load(slot0, slot1)
	slot0.state = slot0.StateLoading
	slot0.tf = tf(slot2)

	slot0:Init()
	slot1()
end

function slot1.Destroy(slot0)
	if slot0.StateDestroy <= slot0.state then
		return
	end

	if slot0.StateInit <= slot0.state then
		slot0:Hide()
		slot0:OnDestroy()

		slot0.tf = nil
	end

	slot0.state = slot0.StateDestroy
end

function slot1.OnInit(slot0)
	slot0.tpl = slot0.tf:Find("level_tpl")

	setActive(slot0.tpl, false)

	slot0.itemHolder = slot0.tf:Find("items")
end

function slot1.OnHide(slot0)
	slot0:StopMapItemTimers()
end

function slot1.OnDestroy(slot0)
	slot0.mapItemTimer = nil
end

function slot1.StopMapItemTimers(slot0)
	for slot4, slot5 in pairs(slot0.mapItemTimer) do
		slot5:Stop()
	end

	table.clear(slot0.mapItemTimer)
end

function slot1.Update(slot0, slot1)
	slot0.map.pivot = Vector2(0.5, 0.5)
	slot0.float.pivot = Vector2(0.5, 0.5)
	slot0.float.localPosition = Vector2(0, 0)

	slot0.super.Update(slot0, slot1)
end

function slot1.UpdateMapItems(slot0)
	slot0.super.UpdateMapItems(slot0)

	slot1 = getProxy(ChapterProxy)
	slot2 = slot0.data

	table.clear(slot0.chapterTFsById)
	_.each(Chapter.bindConfigTable().all, function (slot0)
		if slot0:getChapter(slot0) and slot1:getConfig("map") == slot0.id and (slot1:isUnlock() or slot1:activeAlways()) and slot1:isValid() and (not slot1:ifNeedHide() or slot1:GetJustClearChapters(slot1.id)) then
			table.insert(table.insert, slot1)
		end
	end)
	slot0:StopMapItemTimers()
	UIItemList.StaticAlign(slot0.itemHolder, slot0.tpl, #{}, function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot1:UpdateMapItem(slot2, slot0[slot1 + 1])

			slot2.name = "Chapter_" .. slot0[slot1 + 1].id
			slot1.chapterTFsById[slot0[slot1 + 1].id] = slot2
		end
	end)

	slot5 = {}

	for slot9, slot10 in pairs(slot4) do
		slot5[slot10:getConfigTable().pos_x] = slot5[slot10.getConfigTable().pos_x] or {}
		slot10.getConfigTable().pos_x[slot11.pos_y] = slot5[slot11.pos_x][slot11.pos_y] or {}

		table.insert(slot10.getConfigTable().pos_x[slot11.pos_y], slot10)
	end

	for slot9, slot10 in pairs(slot5) do
		for slot14, slot15 in pairs(slot10) do
			slot16 = {}

			seriesAsync({
				function (slot0)
					slot1 = 0

					for slot5, slot6 in pairs(slot0) do
						if slot6:ifNeedHide() and slot1:GetJustClearChapters(slot6.id) then
							setActive(slot2.chapterTFsById[slot6.id], true)
							slot2:PlayChapterItemAnimationBackward(slot2.chapterTFsById[slot6.id], slot6, function ()
								slot0 = slot0 - 1

								setActive(slot1.chapterTFsById[slot2.id], false)

								if setActive <= 0 then
									slot3()
								end
							end)

							slot3[slot6.id] = true

							slot1:RecordJustClearChapters(slot6.id, nil)
						else
							setActive(slot2.chapterTFsById[slot6.id], false)
						end
					end

					if slot1 <= 0 then
						slot0()
					end
				end,
				function (slot0)
					slot1 = 0

					for slot5, slot6 in pairs(slot0) do
						if not slot1[slot6.id] then
							slot1 = slot1 + 1

							setActive(slot2.chapterTFsById[slot6.id], true)
							slot2:PlayChapterItemAnimation(slot2.chapterTFsById[slot6.id], slot6, function ()
								if slot0 - 1 <= 0 then
									slot1()
								end
							end)
						end
					end
				end
			})
		end
	end
end

function slot1.UpdateMapItem(slot0, slot1, slot2)
	setAnchoredPosition(slot1, {
		x = slot0.mapWidth * slot2:getConfigTable().pos_x,
		y = slot0.mapHeight * slot2.getConfigTable().pos_y
	})

	slot4 = findTF(slot1, "main")
	slot5 = findTF(slot1, "sub")

	if slot2:getPlayType() == ChapterConst.TypeMainSub then
		setActive(slot4, false)
		setActive(slot5, true)

		slot6 = findTF(slot5, "mask/count_down")
		slot0.mapItemTimer[slot1] = Timer.New(slot7, 1, -1)

		slot0.mapItemTimer[slot1]:Start()
		slot7()
		slot0:DeleteTween("fighting" .. slot2.id)
		setText(findTF(slot8, "Text"), i18n("tag_level_fighting"))
		setText(findTF(slot9, "Text"), i18n("tag_level_oni"))
		setText(findTF(slot10, "Text"), i18n("tag_level_narrative"))
		setActive(slot8, false)
		setActive(slot9, false)
		setActive(slot10, false)

		slot11, slot12 = nil

		if slot2:getConfig("chapter_tag") == 1 then
			slot11 = slot10
		end

		if slot2.active then
			slot11 = slot8

			if slot2:existOni() then
				slot11 = slot9
			end
		end

		if slot11 then
			setActive(slot11, true)

			GetOrAddComponent(slot11, "CanvasGroup").alpha = 1

			slot0:RecordTween("fighting" .. slot2.id, LeanTween.alphaCanvas(slot12, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
		end
	else
		setActive(slot4, true)
		setActive(slot5, false)
		setActive(findTF(slot4, "circle/fordark"), slot3.icon_outline == 1)
		setActive(findTF(slot4, "info/bk/fordark"), slot3.icon_outline == 1)

		slot8 = findTF(slot4, "circle/clear_flag")

		setText(findTF(slot4, "info/bk/title_form/title_index"), slot3.chapter_name .. "  ")
		setText(findTF(slot4, "info/bk/title_form/title"), string.split(slot3.name, "|")[1])
		setText(findTF(slot4, "info/bk/title_form/title_en"), string.split(slot3.name, "|")[2] or "")
		setFillAmount(findTF(slot4, "circle/progress"), slot2.progress / 100)
		setText(findTF(slot4, "circle/progress_text"), string.format("%d%%", slot2.progress))
		setActive(findTF(slot4, "circle/stars"), slot2:existAchieve())

		if slot2:existAchieve() then
			for slot16, slot17 in ipairs(slot2.achieves) do
				setActive(slot11:Find("star" .. slot16 .. "/light"), ChapterConst.IsAchieved(slot17))
			end
		end

		setActive(slot8, not slot2.active and slot2:isClear())
		setActive(slot10, not (not slot2.active and slot2.isClear()))
		slot0:DeleteTween("fighting" .. slot2.id)
		setText(findTF(slot14, "Text"), i18n("tag_level_fighting"))
		setText(findTF(slot15, "Text"), i18n("tag_level_oni"))
		setText(findTF(slot16, "Text"), i18n("tag_level_narrative"))
		setActive(slot14, false)
		setActive(slot15, false)
		setActive(slot16, false)

		slot17, slot18 = nil

		if slot2:getConfig("chapter_tag") == 1 then
			slot17 = slot16
		end

		if (slot2:existOni() and slot15) or slot14 then
			setActive(slot17, true)

			GetOrAddComponent(slot17, "CanvasGroup").alpha = 1

			slot0:RecordTween("fighting" .. slot2.id, LeanTween.alphaCanvas(slot18, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
		end

		setActive(slot19, false)

		if slot2:isTriesLimit() then
			slot21 = slot2:getConfig("count")

			setText(slot19:Find("label"), i18n("levelScene_chapter_count_tip"))
			setText(slot19:Find("Text"), setColorStr(slot21 - slot2:getTodayDefeatCount() .. "/" .. slot21, (slot21 <= slot2:getTodayDefeatCount() and COLOR_RED) or COLOR_GREEN))
		end

		slot22 = 0

		for slot26, slot27 in ipairs(slot21) do
			slot22 = math.max(slot22, (pg.expedition_activity_template[slot27] and slot28.bonus_time) or 0)
		end

		if pg.chapter_defense[slot2.id] then
			slot22 = math.max(slot22, slot23.bonus_time or 0)
		end

		slot24 = findTF(slot4, "mark")

		setActive(slot24:Find("bonus"), not slot0.data:isRemaster() and slot22 > 0 and math.max(slot22 - slot2.todayDefeatCount, 0) > 0)
		setActive(slot24, not slot0.data.isRemaster() and slot22 > 0 and math.max(slot22 - slot2.todayDefeatCount, 0) > 0)

		if slot26 then
			slot0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", (slot0.sceneParent.contextData.map:getConfig("type") == Map.ACTIVITY_HARD and "bonus_us_hard") or "bonus_us", slot24:Find("bonus"))

			slot30 = slot24.anchoredPosition.y
			slot24:GetComponent(typeof(CanvasGroup)).alpha = 0

			LeanTween.cancel(go(slot24))
			LeanTween.value(go(slot24), 0, 1, 0.2):setOnUpdate(System.Action_float(function (slot0)
				slot0.alpha = slot0
				slot0.anchoredPosition.y = slot2 * slot0
				slot0.anchoredPosition.anchoredPosition = slot0.anchoredPosition
			end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
		end
	end

	onButton(slot0.sceneParent, (isActive(slot4) and slot4) or slot5, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if slot0:InvokeParent("isfrozen") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-8, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-14, warpins: 2 ---
		if not slot1:isUnlock() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-30, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_tracking_error_pre", slot1:getPrevChapterName()))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 31-41, warpins: 2 ---
		if slot0.sceneParent.player.level < slot1:getConfig("unlocklevel") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-53, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_chapter_level_limit", slot0))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 54-60, warpins: 2 ---
		slot1 = nil

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 61-69, warpins: 0 ---
		for slot5, slot6 in pairs(slot0.sceneParent.maps) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 61-66, warpins: 1 ---
			if slot6:getActiveChapter() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 67-67, warpins: 1 ---
				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 68-69, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 70-71, warpins: 2 ---
		if slot1 and slot1 ~= slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 75-82, warpins: 1 ---
			slot0:InvokeParent("emit", LevelMediator2.ON_STRATEGYING_CHAPTER)

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 83-86, warpins: 3 ---
		if slot1.active then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 87-93, warpins: 1 ---
			slot0:InvokeParent("switchToChapter", slot1)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 94-107, warpins: 1 ---
			slot0:InvokeParent("displayChapterPanel", slot1, Vector3(slot2.localPosition.x - 10, slot2.localPosition.y + 150))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 108-108, warpins: 2 ---
		return
		--- END OF BLOCK #7 ---



	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function slot1.PlayChapterItemAnimation(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot4 = findTF(slot1, "main")
	slot5 = findTF(slot1, "sub")

	if slot2:getPlayType() == ChapterConst.TypeMainSub then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-30, warpins: 1 ---
		slot5:GetComponent("Animator").enabled = true

		slot5:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0.enabled = false

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-8, warpins: 1 ---
				slot1()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 9-9, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 31-81, warpins: 1 ---
	slot7 = findTF(slot4, "circle")

	LeanTween.cancel(go(slot7))

	slot7.localScale = Vector3.zero

	LeanTween.scale(slot7, Vector3.one, 0.3):setDelay(0.3)
	setAnchoredPosition(slot8, {
		x = -1 * slot4:Find("info").rect.width
	})
	shiftPanel(findTF(slot4, "info/bk"), 0, nil, 0.4, 0.4, true, true, nil, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0:isTriesLimit() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-13, warpins: 1 ---
			setActive(findTF(findTF, "triesLimit"), true)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-16, warpins: 2 ---
		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-18, warpins: 1 ---
			slot2()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 19-19, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end)
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 82-83, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot1.PlayChapterItemAnimationBackward(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot4 = findTF(slot1, "main")
	slot5 = findTF(slot1, "sub")

	if slot2:getPlayType() == ChapterConst.TypeMainSub then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-17, warpins: 1 ---
		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-20, warpins: 1 ---
			slot3()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-74, warpins: 1 ---
		slot7 = findTF(slot4, "circle")

		LeanTween.cancel(go(slot7))

		slot7.localScale = Vector3.one

		LeanTween.scale(slot7, Vector3.zero, 0.3):setDelay(0.3)
		setAnchoredPosition(slot8, {
			x = 0
		})
		shiftPanel(slot8, -1 * slot4:Find("info").rect.width, nil, 0.4, 0.4, true, true, nil, function ()

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



		end)

		if slot2:isTriesLimit() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 75-81, warpins: 1 ---
			setActive(findTF(slot4, "triesLimit"), true)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 82-83, warpins: 4 ---
	return
	--- END OF BLOCK #1 ---



end

function slot1.UpdateChapterTF(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot3 = slot0.data:getChapter(slot1)

	if slot0.chapterTFsById[slot1] and slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-21, warpins: 1 ---
		slot0:UpdateMapItem(slot2, slot3)
		slot0:PlayChapterItemAnimation(slot2, slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-22, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

function slot1.TryOpenChapter(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.chapterTFsById[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-18, warpins: 1 ---
		triggerButton((isActive(slot2:Find("main")) and slot3) or slot2:Find("sub"))
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 22-22, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 23-23, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

return slot1
