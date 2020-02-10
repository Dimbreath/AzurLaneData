slot1 = class("MapBuilderNormal", import(".MapBuilder"))

function slot1.Ctor(slot0, ...)
	uv0.super.Ctor(slot0, ...)

	slot0.mapItemTimer = {}
	slot0.chapterTFsById = {}
end

function slot1.GetType(slot0)
	return uv0.TYPENORMAL
end

function slot1.GetUIName(slot0)
	return "levels"
end

function slot1.Load(slot0, slot1)
	slot0.state = slot0.StateLoading
	slot0.tf = tf(slot0.float:Find("levels").gameObject)

	slot0:Init()
	slot1()
end

function slot1.Destroy(slot0)
	if uv0.StateDestroy <= slot0.state then
		return
	end

	if uv0.StateInit <= slot0.state then
		slot0:Hide()
		slot0:OnDestroy()

		slot0.tf = nil
	end

	slot0.state = uv0.StateDestroy
end

function slot1.OnInit(slot0)
	slot0.tpl = slot0.tf:Find("level_tpl")

	setActive(slot0.tpl, false)

	slot0.itemHolder = slot0.tf:Find("items")
end

function slot1.OnHide(slot0)
	for slot4, slot5 in pairs(slot0.mapItemTimer) do
		if slot5 then
			slot5:Stop()
		end
	end

	slot0.mapItemTimer = {}
end

function slot1.OnDestroy(slot0)
	slot0.mapItemTimer = nil
end

function slot1.Update(slot0, slot1)
	slot0.map.pivot = Vector2(0.5, 0.5)
	slot0.float.pivot = Vector2(0.5, 0.5)
	slot0.float.localPosition = Vector2(0, 0)

	uv0.super.Update(slot0, slot1)
end

function slot1.UpdateMapItems(slot0)
	uv0.super.UpdateMapItems(slot0)

	slot1 = slot0.data
	slot0.chapterTFsById = {}

	_.each(Chapter.bindConfigTable().all, function (slot0)
		slot1 = uv0

		if slot1:getChapter(slot0) and slot1:getConfig("map") == uv0.id and slot1:isValid() and not slot1:ifNeedHide() then
			table.insert(uv1, slot1)
		end
	end)

	slot4 = UIItemList.New(slot0.itemHolder, slot0.tpl)

	slot4:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = uv0[slot1 + 1]

			uv1:UpdateMapItem(slot2, slot3)

			slot2.name = "Chapter_" .. slot3.id
			uv1.chapterTFsById[slot3.id] = slot2
		elseif slot0 == UIItemList.EventExcess and uv1.mapItemTimer[slot2] then
			uv1.mapItemTimer[slot2]:Stop()

			uv1.mapItemTimer[slot2] = nil
		end
	end)
	slot4:align(#{})
end

function slot1.UpdateMapItem(slot0, slot1, slot2, slot3)
	slot4 = slot2:getConfigTable()

	setAnchoredPosition(slot1, {
		x = slot0.mapWidth * slot4.pos_x,
		y = slot0.mapHeight * slot4.pos_y
	})

	if slot0.mapItemTimer[slot1] then
		slot0.mapItemTimer[slot1]:Stop()

		slot0.mapItemTimer[slot1] = nil
	end

	slot6 = findTF(slot1, "sub")

	if slot2:getPlayType() == ChapterConst.TypeMainSub then
		setActive(findTF(slot1, "main"), false)
		setActive(slot6, true)

		slot7 = findTF(slot6, "mask/count_down")

		function slot8()
			if uv0 then
				slot0 = pg.TimeMgr.GetInstance()

				if math.max(uv1.expireTime - slot0:GetServerTime(), 0) > 0 then
					setText(uv0, slot0:DescCDTime(slot1))
				elseif not uv1.active then
					uv1:clearSubChapter()
					getProxy(ChapterProxy):updateChapter(uv1)
				end
			end
		end

		slot0.mapItemTimer[slot1] = Timer.New(slot8, 1, -1)

		slot0.mapItemTimer[slot1]:Start()
		slot8()

		slot9 = findTF(slot6, "fighting")

		setText(findTF(slot9, "Text"), i18n("tag_level_fighting"))

		slot10 = findTF(slot6, "oni")

		setText(findTF(slot10, "Text"), i18n("tag_level_oni"))

		slot11 = findTF(slot6, "narrative")

		setText(findTF(slot11, "Text"), i18n("tag_level_narrative"))
		setActive(slot9, false)
		setActive(slot10, false)
		setActive(slot11, false)
		slot0:DeleteTween("fighting" .. slot2.id)

		slot6:GetComponent("Animator").enabled = true

		slot6:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
			uv0.enabled = false
			slot1, slot2 = nil

			if uv1:getConfig("chapter_tag") == 1 then
				slot1 = uv2
			end

			if uv1.active then
				slot1 = uv3

				if uv1:existOni() then
					slot1 = uv4
				end
			end

			if slot1 then
				setActive(slot1, true)

				slot2 = GetOrAddComponent(slot1, "CanvasGroup")
				slot2.alpha = 1

				uv5:RecordTween("fighting" .. uv1.id, LeanTween.alphaCanvas(slot2, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
			end
		end)
	else
		setActive(slot5, true)
		setActive(slot6, false)
		setActive(findTF(slot5, "circle/fordark"), slot4.icon_outline == 1)
		setActive(findTF(slot5, "info/bk/fordark"), slot4.icon_outline == 1)

		slot9 = findTF(slot5, "circle/clear_flag")

		setText(findTF(findTF(slot5, "circle/fighting"), "Text"), i18n("tag_level_fighting"))
		setText(findTF(findTF(slot5, "circle/oni"), "Text"), i18n("tag_level_oni"))
		setText(findTF(findTF(slot5, "circle/narrative"), "Text"), i18n("tag_level_narrative"))

		slot16 = string.split(slot4.name, "|")

		setText(findTF(slot5, "info/bk/title_form/title_index"), slot4.chapter_name .. "  ")
		setText(findTF(slot5, "info/bk/title_form/title"), slot16[1])
		setText(findTF(slot5, "info/bk/title_form/title_en"), slot16[2] or "")
		setFillAmount(findTF(slot5, "circle/progress"), slot2.progress / 100)
		setText(findTF(slot5, "circle/progress_text"), string.format("%d%%", slot2.progress))
		setActive(findTF(slot5, "circle/stars"), slot2:existAchieve())

		if slot2:existAchieve() then
			for slot20, slot21 in ipairs(slot2.achieves) do
				setActive(slot15:Find("star" .. slot20 .. "/light"), ChapterConst.IsAchieved(slot21))
			end
		end

		slot0:DeleteTween("fighting" .. slot2.id)
		setActive(slot10, false)
		setActive(slot11, false)
		setActive(slot12, false)
		setActive(slot9, false)
		setActive(slot14, true)

		if not slot2:isUnlock() and not slot2:activeAlways() then
			setActive(slot5, false)
		else
			setActive(slot5, true)

			slot17, slot18 = nil

			if slot2:getConfig("chapter_tag") == 1 then
				slot17 = slot12
			end

			if slot2.active then
				slot17 = slot10

				if slot2:existOni() then
					slot17 = slot11
				end
			elseif slot2:isClear() then
				setActive(slot9, true)
				setActive(slot14, false)
			end

			if slot17 then
				setActive(slot17, true)

				slot18 = GetOrAddComponent(slot17, "CanvasGroup")
				slot18.alpha = 1

				slot0:RecordTween("fighting" .. slot2.id, LeanTween.alphaCanvas(slot18, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
			end
		end

		setActive(findTF(slot5, "triesLimit"), false)

		slot20 = findTF(slot5, "circle")
		slot21 = findTF(slot5, "info/bk")

		LeanTween.cancel(go(slot20))

		slot20.localScale = Vector3.zero

		LeanTween.scale(slot20, Vector3(1, 1, 1), 0.2):setDelay(0.3)
		setAnchoredPosition(slot21, {
			x = -1 * slot5:Find("info").rect.width
		})
		shiftPanel(slot21, 0, nil, 0.4, 0.4, true, true, nil, function ()
			if uv0 then
				setActive(uv1, true)
			end

			if uv2 then
				uv2()
			end
		end)

		if slot2:isTriesLimit() then
			slot22 = slot2:getConfig("count")

			setText(slot17:Find("label"), i18n("levelScene_chapter_count_tip"))
			setText(slot17:Find("Text"), setColorStr(slot22 - slot2:getTodayDefeatCount() .. "/" .. slot22, slot22 <= slot2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))
		end

		for slot27, slot28 in ipairs(slot2:getConfig("boss_expedition_id")) do
			slot23 = math.max(0, pg.expedition_activity_template[slot28] and slot29.bonus_time or 0)
		end

		if pg.chapter_defense[slot2.id] then
			slot23 = math.max(slot23, slot24.bonus_time or 0)
		end

		slot25 = findTF(slot5, "mark")
		slot27 = not slot0.data:isRemaster() and slot23 > 0 and math.max(slot23 - slot2.todayDefeatCount, 0) > 0
		slot28 = slot2:getOniChapterInfo()

		setActive(slot25:Find("bonus"), slot27)
		setActive(slot25, slot27)

		if slot27 then
			slot30 = slot25.anchoredPosition.y
			slot25:GetComponent(typeof(CanvasGroup)).alpha = 0

			LeanTween.cancel(go(slot25))
			LeanTween.value(go(slot25), 0, 1, 0.2):setOnUpdate(System.Action_float(function (slot0)
				uv0.alpha = slot0
				slot1 = uv1.anchoredPosition
				slot1.y = uv2 * slot0
				uv1.anchoredPosition = slot1
			end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
		end
	end

	onButton(slot0.sceneParent, isActive(slot5) and slot5 or slot6, function ()
		if uv0:InvokeParent("isfrozen") then
			return
		end

		if not uv1:isUnlock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_tracking_error_pre", uv1:getPrevChapterName()))

			return
		end

		if uv0.sceneParent.player.level < uv1:getConfig("unlocklevel") then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_chapter_level_limit", slot0))

			return
		end

		slot1 = nil

		for slot5, slot6 in pairs(uv0.sceneParent.maps) do
			if slot6:getActiveChapter() then
				break
			end
		end

		if slot1 and slot1 ~= uv1 then
			uv0:InvokeParent("emit", LevelMediator2.ON_STRATEGYING_CHAPTER)

			return
		end

		if uv1.active then
			uv0:InvokeParent("switchToChapter", uv1)
		else
			slot2 = uv2.localPosition

			uv0:InvokeParent("displayChapterPanel", uv1, Vector3(slot2.x - 10, slot2.y + 150))
		end
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function slot1.RefreshMapItems(slot0)
	if not slot0.chapterTFsById then
		return
	end

	for slot5, slot6 in pairs(slot0.chapterTFsById) do
		if slot0.data:getChapter(slot5) and (slot7:isUnlock() or slot7:activeAlways()) and not slot7:ifNeedHide() then
			setActive(slot6, true)
		else
			setActive(slot6, false)
		end
	end
end

function slot1.UpdateChapterTF(slot0, slot1)
	slot3 = slot0.data:getChapter(slot1)

	if slot0.chapterTFsById[slot1] and slot3 then
		slot0:UpdateMapItem(slot2, slot3)
	end
end

function slot1.TryOpenChapter(slot0, slot1)
	if slot0.chapterTFsById[slot1] then
		triggerButton(isActive(slot2:Find("main")) and slot3 or slot2:Find("sub"))
	end
end

return slot1
