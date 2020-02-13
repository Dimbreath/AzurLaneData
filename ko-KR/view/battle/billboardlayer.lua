slot0 = class("BillboardLayer", import("..base.BaseUI"))
slot0.PAGE_MILITARY = "military_btn"
slot0.PAGE_POWER = "fighting_btn"
slot0.PAGE_CHALLENGE = "challenge_btn"
slot0.PAGE_EXTRA_CHAPTER = "extra_chpater_btn"
slot0.PAGE_BOSS_BATTLE = "act_boss_battle_btn"
slot0.type2name = {
	"fighting",
	"collect",
	"pt",
	"pledge",
	"challenge",
	"extra_chpater",
	"act_boss_battle",
	military = "military"
}
slot0.type2pic = {
	"chara_battle",
	"chara_rank_collect",
	"chara_rank_pt",
	"chara_rank_collect",
	"challenge_rank",
	"title_extra_chapter",
	"title_extra_chapter",
	military = "chara_rank_mil"
}
slot0.tpye2titleWord = {
	{
		5,
		7,
		8,
		1
	},
	{
		5,
		7,
		8,
		2
	},
	{
		5,
		7,
		8,
		9
	},
	{
		5,
		7,
		8,
		3
	},
	{
		5,
		7,
		8,
		4
	},
	{
		5,
		7,
		8,
		4
	},
	{
		5,
		7,
		8,
		4
	},
	military = {
		5,
		6,
		8,
		9
	}
}

function slot0.getUIName(slot0)
	return "BillboardUI"
end

function slot0.getRankMsgList(slot0)
	if not slot0.rankMsgList then
		slot0.rankMsgList, slot0.rankMsgInfo = BillboardMediator:getRankMsg()
	end

	return slot0.rankMsgList
end

function slot0.getRankMsgInfo(slot0, slot1)
	if not slot0.rankMsgInfo then
		slot0:getRankMsgList()
	end

	return slot0.rankMsgInfo[slot1]
end

function slot0.getRankMsgId(slot0, slot1, slot2)
	for slot7, slot8 in ipairs(slot3) do
		if slot0.rankMsgInfo[slot8].type == slot1 and (not slot2 or slot2 == slot9.act_id) then
			return slot2 or slot1
		end
	end

	return nil
end

function slot0.setBillboard(slot0, slot1)
	slot0.billboard = slot1 or {}

	slot0:updateBillboard()
end

function slot0.setRank(slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot0.rankList[slot0:getRankMsgId(slot4, slot5)] then
		slot0.rankList[slot6] = {}
	end

	slot0.rankList[slot6][slot3 or 1] = slot1 or {}
	slot0.nextTime[slot6] = slot2

	if slot3 < 5 and slot0.rankList[slot6][slot3] and #slot0.rankList[slot6][slot3] >= 20 then
		slot0:emit(BillboardMediator.GET_POWERRANK, slot4, slot3 + 1, slot5)
	else
		slot0:updateRankCount(slot6)
		slot0:addRefreshTimer(slot0.nextTime[slot6], slot6)
	end
end

function slot0.setPresonalPoint(slot0, slot1, slot2, slot3)
	slot0.myPoint[slot4] = (slot0.myPoint[slot0:getRankMsgId(slot2, slot3)] and math.max(slot0.myPoint[slot4], slot1)) or slot1
end

function slot0.setPlayerRank(slot0, slot1, slot2, slot3, slot4)
	slot0.myPoint[slot5] = (slot0.myPoint[slot0:getRankMsgId(slot3, slot4)] and math.max(slot0.myPoint[slot5], slot1)) or slot1
	slot0.myRank[slot5] = (slot0.myRank[slot5] and math.max(slot0.myRank[slot5], slot2)) or slot2

	slot0:updatePlayerRankInfo(slot5)
end

function slot0.setSeasonInfo(slot0, slot1)
	slot0.seasonInfo = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.setPlayerShip(slot0, slot1)
	slot0.playerShip = slot1
end

function slot0.init(slot0)
	slot0.rankList = {}
	slot0.myPoint = {}
	slot0.myRank = {}
	slot0.nextTime = {}
	slot0.initedRank = {}
	slot0.scroll = {}
	slot0.rankItems = {}
	slot0.rtPage = {}
	slot0.rtBtn = {}
	slot0.closeBtn = slot0:findTF("top/btnBack")
	slot0.res = slot0:findTF("frame/res")
	slot0.sortBtns = slot0:findTF("frame/table_panel")
	slot0.tableTpl = slot0:findTF("btn_tpl", slot0.sortBtns)
	slot0.tipText = slot0:findTF("tip", slot0.sortBtns)
	slot0.mainPanel = slot0:findTF("frame/main_panel")
	slot0.pageTpl = slot0:findTF("page_tpl", slot0.mainPanel)
	slot0.militaryPage = slot0:findTF("military_page", slot0.mainPanel)
	slot0.collectCountAll = getProxy(CollectionProxy):getCollectionTotal()
	slot1 = slot0:findTF("title/frame", slot0.militaryPage)

	for slot5 = 1, 4, 1 do
		setText(slot1:GetChild(slot5 - 1), i18n("ranking_word_" .. slot0.tpye2titleWord.military[slot5]))
	end

	setActive(slot0.tableTpl, false)
	setActive(slot0.pageTpl, false)
	SetParent(slot0.tipText, slot0.res)

	for slot6, slot7 in ipairs(slot2) do
		slot0.rtPage[slot7] = cloneTplTo(slot0.pageTpl, slot0.mainPanel, slot0.type2name[slot0.rankMsgInfo[slot7].type] .. "_page")

		setActive(slot0.rtPage[slot7], false)

		slot9 = slot0:findTF("title/frame", slot0.rtPage[slot7])

		for slot13 = 1, 4, 1 do
			setText(slot9:GetChild(slot13 - 1), i18n("ranking_word_" .. slot0.tpye2titleWord[slot8.type][slot13]))
		end

		if slot8.type == 3 then
			setText(slot9:GetChild(3), pg.gameset.activity_res_id.description)
		end

		slot0.scroll[slot7] = slot0:findTF("content/rank_list", slot0.rtPage[slot7]):GetComponent("LScrollRect")
		slot0.rankItems[slot7] = {}

		slot0.scroll[slot7].onInitItem = function (slot0)
			slot0.rankItems[][slot0] = slot0:createRankItem(slot0)
		end

		slot0.scroll[slot7].onUpdateItem = function (slot0, slot1)
			if not slot0.rankItems[slot1][slot1] then
				slot0.rankItems[slot1][slot1] = slot0:createPowerRankItem(slot1)
			end

			slot0.rankList[slot1][math.floor(slot0 / 20) + 1][slot0 % 20 + 1].medal_small = slot0:getRankMsgInfo(slot1).medal_small
			slot3.max = (slot0.getRankMsgInfo(slot1).type == 2 and slot0.collectCountAll) or nil
			slot3.isTypePower = slot4.type == 1

			slot0:updatePowerRankTF(slot2.tf, slot3)
		end

		slot0.rtBtn[slot7] = cloneTplTo(slot0.tableTpl, slot0.sortBtns, slot0.type2name[slot8.type] .. "_btn")

		GetImageSpriteFromAtlasAsync("ui/billboardui_atlas", slot0.type2pic[slot8.type], slot0:findTF("Image", slot0.rtBtn[slot7]), true)
		GetImageSpriteFromAtlasAsync("ui/billboardui_atlas", slot0.type2pic[slot8.type] .. "_sel", slot0:findTF("check_mark/Image", slot0.rtBtn[slot7]), true)
		onToggle(slot0, slot0.rtBtn[slot7], function (slot0)
			setActive(slot0.rtPage[slot1], slot0)
			setActive(slot0.tipText, slot0)
		end, SFX_UI_TAG)
	end

	SetParent(slot0.tipText, slot0.sortBtns)

	slot0.title = slot0:findTF("title", slot0.militaryPage)
	slot0.content = slot0:findTF("content", slot0.militaryPage)
	slot0.rankContainer = slot0:findTF("rank_list/content", slot0.content)
	slot0.rankTpl = slot0:getTpl("rank_list/ranktpl", slot0.content)
	slot0.starty = slot0.rankContainer.anchoredPosition.y
	slot0.height = slot0.rankTpl:GetComponent(typeof(LayoutElement)).preferredHeight + slot0.rankContainer:GetComponent(typeof(VerticalLayoutGroup)).spacing
	slot0.scrollRect = slot0:findTF("military_page/content/rank_list", slot0.mainPanel)
end

function slot0.didEnter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-24, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 25-42, warpins: 0 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 43-59, warpins: 1 ---
	onButton(slot0, slot0.closeBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:emit(slot1.ON_BACK)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)

	slot1 = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "BillboardMediator")

	for slot6, slot7 in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-29, warpins: 1 ---
		if slot0.rankMsgInfo[slot7].type == 1 or slot8.type == 2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-40, warpins: 2 ---
			setActive(slot0.sortBtns:GetChild(slot6), slot1)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 41-42, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	onToggle(slot0, slot0.sortBtns:Find("military_btn"), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		setActive(slot0.militaryPage, slot0)
		setActive(slot0.tipText, not slot0)

		return
		--- END OF BLOCK #0 ---



	end, SFX_UI_TAG)
	slot0:updatePlayerMilitaryRankInfo()

	slot3 = slot0.contextData.index or BillboardLayer.PAGE_MILITARY

	triggerToggle(slot0.sortBtns:Find(slot0.contextData.index or BillboardLayer.PAGE_MILITARY), true)
	setActive(slot0.sortBtns, not ((slot0.contextData.index or BillboardLayer.PAGE_MILITARY) == BillboardLayer.PAGE_EXTRA_CHAPTER and slot0.contextData.view == "LevelScene2"))
	setActive(slot0:findTF("frame/extra_chapter_bg"), (slot0.contextData.index or BillboardLayer.PAGE_MILITARY) == BillboardLayer.PAGE_EXTRA_CHAPTER and slot0.contextData.view == "LevelScene2")
	setActive(slot0.sortBtns:Find("pledge_btn"), false)

	return

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 60-61, warpins: 1 ---
	slot3 = BillboardLayer.PAGE_MILITARY

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 62-73, warpins: 2 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #5 74-77, warpins: 1 ---
	if slot0.contextData.view ~= "LevelScene2" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 78-79, warpins: 2 ---
		slot4 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 80-80, warpins: 1 ---
		slot4 = true
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 81-101, warpins: 2 ---
	--- END OF BLOCK #6 ---



end

function slot0.filter(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

function slot0.updateBillboard(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.isInitBillboard then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-13, warpins: 1 ---
		eachChild(slot0.rankContainer, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(slot0, false)

			return
			--- END OF BLOCK #0 ---



		end)

		slot0.rankTFs = {}

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-46, warpins: 0 ---
		for slot4, slot5 in ipairs(slot0.billboard) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-17, warpins: 1 ---
			slot6 = nil

			if slot4 > 3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 18-23, warpins: 1 ---
				slot6 = cloneTplTo(slot0.rankTpl, slot0.rankContainer)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-26, warpins: 1 ---
				if slot4 > 0 and slot4 <= 3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 30-41, warpins: 1 ---
					setActive(slot0.rankContainer:Find("ranktpl_" .. slot4), true)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 42-44, warpins: 4 ---
			slot0.rankTFs[slot5.id] = slot6
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 45-46, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 47-70, warpins: 1 ---
		slot0.loadRanks = Clone(slot0.billboard)
		slot1 = getBounds(slot0.scrollRect)

		onScroll(slot0, slot0.scrollRect, throttle(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if not slot0._isLoaded then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 6-11, warpins: 2 ---
			slot1 = {}

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 12-43, warpins: 0 ---
			for slot5, slot6 in pairs(slot0.loadRanks) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-24, warpins: 1 ---
				if getBounds(slot8):Intersects(slot1) and go(slot8).activeSelf then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 31-36, warpins: 1 ---
					slot0:updateRankInfo(slot6)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 37-41, warpins: 2 ---
					table.insert(slot1, slot6)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 42-43, warpins: 3 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 44-46, warpins: 1 ---
			slot0.loadRanks = slot1

			return
			--- END OF BLOCK #3 ---



		end, 0.01, true))
		scrollTo(slot0.scrollRect, 0, 1)

		slot0.isInitBillboard = true
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 71-72, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.updateRankTF(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot4 = setActive
	slot5 = findTF(slot1, "rank")

	if slot2.rank > 3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-11, warpins: 1 ---
		slot6 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-12, warpins: 1 ---
		slot6 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-22, warpins: 2 ---
	slot4(slot5, slot6)

	slot4 = setActive
	slot5 = findTF(slot1, "rank_num")

	if slot2.rank <= 3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-24, warpins: 1 ---
		slot6 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-25, warpins: 1 ---
		slot6 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 26-30, warpins: 2 ---
	slot4(slot5, slot6)

	if slot2.rank > 3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-38, warpins: 1 ---
		setText(findTF(slot1, "rank_num"), slot2.rank)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-49, warpins: 1 ---
		slot0:setSpriteTo("resources/" .. slot2.rank, findTF(slot1, "rank"), true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 50-87, warpins: 2 ---
	setText(findTF(slot1, "name_bg/Text"), slot2.name)
	setText(findTF(slot1, "score_bg/Text"), slot2.score)
	setText(findTF(slot1, "medal/Text"), "")
	LoadImageSpriteAsync("emblem/" .. slot4, findTF(slot1, "medal"))

	if slot2.icon and slot2.icon ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 91-107, warpins: 1 ---
		updateDrop(findTF(slot1, "shiptpl"), {
			type = DROP_TYPE_SHIP,
			id = slot2.icon,
			skinId = slot2.skinId,
			remoulded = slot2.remoulded,
			propose = slot2.proposeTime
		})
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 108-115, warpins: 3 ---
	setText(findTF(slot1, "shiptpl/icon_bg/lv/Text"), slot2.level)

	return
	--- END OF BLOCK #4 ---



end

function slot0.updateRankInfo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot0:updateRankTF(slot2, slot1)
	onButton(slot0, slot0.rankTFs[slot1.id], function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0:emit(BillboardMediator.OPEN_RIVAL_INFO, slot1.id)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updatePlayerMilitaryRankInfo(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-44, warpins: 1 ---
	slot0:updateRankTF(slot1, {
		rank = slot0.seasonInfo.rank,
		name = slot0.player.name,
		score = slot0.seasonInfo.score,
		icon = slot0.playerShip.configId,
		skinId = slot0.playerShip.skinId,
		level = slot0.player.level,
		remoulded = slot0.playerShip:isRemoulded(),
		proposeTime = slot0.playerShip.proposeTime
	})
	onButton(slot0, slot0:findTF("military_page/content/player_info", slot0.mainPanel), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0:scroll2PlayerRank(slot0.seasonInfo.rank)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

function slot0.scroll2PlayerRank(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	if math.min(#slot0.billboard - 2, slot1) > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-25, warpins: 1 ---
		rtf(slot0.rankContainer).anchoredPosition = Vector3(0, slot0.starty + slot0.height * (slot1 - 1), 0)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-26, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if GameObject.Find("/UICamera/Canvas/UIMain/MilitaryExerciseUI(Clone)/bottom/buttons/rank_btn") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-10, warpins: 1 ---
		triggerToggle(slot1, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-11, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.addRefreshTimer(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	slot3()

	slot4 = slot0:getRankMsgInfo(slot2)
	slot0.refreshTimer[slot2] = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		if (slot0 + 1) - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-26, warpins: 1 ---
			slot1()
			slot2:emit(BillboardMediator.GET_POWERRANK, slot3.type, 1, slot3.act_id)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 27-27, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end, 1, -1)

	slot0.refreshTimer[slot2]:Start()
	slot0.refreshTimer[slot2].func()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updatePowerRankTF(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot2.id then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-11, warpins: 1 ---
		slot3 = setActive
		slot4 = findTF(slot1, "bg_1")

		if slot2.rank ~= 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-13, warpins: 1 ---
			slot5 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-14, warpins: 1 ---
			slot5 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-23, warpins: 2 ---
		slot3(slot4, slot5)

		slot3 = setActive
		slot4 = findTF(slot1, "bg_2")

		if slot2.rank ~= 2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-25, warpins: 1 ---
			slot5 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-26, warpins: 1 ---
			slot5 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-35, warpins: 2 ---
		slot3(slot4, slot5)

		slot3 = setActive
		slot4 = findTF(slot1, "bg_3")

		if slot2.rank ~= 3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-37, warpins: 1 ---
			slot5 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-38, warpins: 1 ---
			slot5 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 39-48, warpins: 2 ---
		slot3(slot4, slot5)

		slot3 = setActive
		slot4 = findTF(slot1, "bg_nor")

		if slot2.rank <= 3 and slot2.rank ~= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 52-53, warpins: 1 ---
			slot5 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 54-54, warpins: 2 ---
			slot5 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 55-64, warpins: 2 ---
		slot3(slot4, slot5)

		slot3 = findTF(slot1, "medal").transform

		if slot2.rank > 3 or not Vector3(0.45, 0.45, 1) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 72-76, warpins: 2 ---
			slot4 = Vector3(0.34, 0.34, 1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 77-77, warpins: 2 ---
		slot3.localScale = slot4
		--- END OF BLOCK #5 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 78-86, warpins: 2 ---
	slot3 = setActive
	slot4 = findTF(slot1, "rank")

	if slot2.rank > 3 or slot2.rank <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 91-92, warpins: 2 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 93-93, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 94-103, warpins: 2 ---
	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = findTF(slot1, "rank_num")

	if slot2.rank <= 3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 104-105, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 106-106, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 107-115, warpins: 2 ---
	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = findTF(slot1, "rank_none")

	if slot2.rank ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 116-117, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 118-118, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 119-129, warpins: 2 ---
	slot3(slot4, slot5)
	setActive(findTF(slot1, "medal_small"), slot2.medal_small)

	if slot2.medal_small then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 130-136, warpins: 1 ---
		LoadImageSpriteAsync(slot2.medal_small, findTF(slot1, "medal_small"))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 137-140, warpins: 2 ---
	if slot2.rank <= 3 and slot2.rank > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 145-156, warpins: 1 ---
		slot0:setSpriteTo("resources/" .. slot2.rank, findTF(slot1, "rank"), true)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 157-163, warpins: 2 ---
		setText(findTF(slot1, "rank_num"), slot2.rank)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 164-173, warpins: 2 ---
	setText(findTF(slot1, "nameText"), slot2.name)

	if slot2.max and slot2.max > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 178-194, warpins: 1 ---
		setText(findTF(slot1, "scoreText"), string.format("%0.01f", slot2.power / slot2.max * 100) .. "%")
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 195-197, warpins: 2 ---
		if not slot2.isTypePower or not math.floor(slot2.power^0.667) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 206-206, warpins: 2 ---
			slot3 = slot2.power
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 207-213, warpins: 2 ---
		setText(findTF(slot1, "scoreText"), slot3)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 214-219, warpins: 2 ---
	if findTF(slot1, "medal") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 220-229, warpins: 1 ---
		if math.max(slot2.arenaRank, 1) > 14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 230-230, warpins: 1 ---
			slot3 = 14
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 231-239, warpins: 2 ---
		LoadImageSpriteAsync("emblem/" .. slot3, findTF(slot1, "medal"))
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 240-242, warpins: 2 ---
	if slot2.icon and slot2.icon ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 246-262, warpins: 1 ---
		updateDrop(findTF(slot1, "shiptpl"), {
			type = DROP_TYPE_SHIP,
			id = slot2.icon,
			skinId = slot2.skinId,
			remoulded = slot2.remoulded,
			propose = slot2.proposeTime
		})
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 263-270, warpins: 3 ---
	setText(findTF(slot1, "shiptpl/icon_bg/lv/Text"), slot2.lv)

	return
	--- END OF BLOCK #9 ---



end

function slot0.updatePlayerRankInfo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot2 = slot0:findTF("content/player_info", slot0.rtPage[slot1])
	slot3 = slot0:getRankMsgInfo(slot1)

	if not slot0.collectCountAll then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-20, warpins: 1 ---
		slot0.collectCountAll = getProxy(CollectionProxy):getCollectionTotal()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-28, warpins: 2 ---
	slot5 = slot0
	slot4 = slot0.updatePowerRankTF
	slot6 = slot2
	slot7 = {}

	if not slot0.myRank[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-29, warpins: 1 ---
		slot8 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 30-61, warpins: 2 ---
	slot7.rank = slot8
	slot7.power = slot0.myPoint[slot1]
	slot7.icon = slot0.playerShip.configId
	slot7.skinId = slot0.playerShip.skinId
	slot7.lv = slot0.player.level
	slot7.arenaRank = slot0.player.maxRank
	slot7.name = slot0.player.name
	slot7.remoulded = slot0.playerShip:isRemoulded()
	slot7.proposeTime = slot0.playerShip.proposeTime
	slot7.medal_small = slot3.medal_small

	if slot3.type ~= 2 or not slot0.collectCountAll then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 65-65, warpins: 2 ---
		slot8 = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 66-69, warpins: 2 ---
	slot7.max = slot8

	if slot3.type ~= 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 70-71, warpins: 1 ---
		slot8 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 72-72, warpins: 1 ---
		slot8 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 73-75, warpins: 2 ---
	slot7.isTypePower = slot8

	slot4(slot5, slot6, slot7)

	return
	--- END OF BLOCK #4 ---



end

function slot0.updateRankCount(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not slot0.initedRank[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-18, warpins: 1 ---
		slot0.scroll[slot1]:SetTotalCount(slot0:getRankCount(slot1), -1)

		slot0.initedRank[slot1] = true
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-28, warpins: 1 ---
		slot0.scroll[slot1]:SetTotalCount(slot0:getRankCount(slot1), -1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 29-29, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.getRankCount(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot2 = 0

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-13, warpins: 0 ---
	for slot6 = 1, #slot0.rankList[slot1], 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 2 ---
		slot2 = slot2 + #slot0.rankList[slot1][slot6]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-14, warpins: 1 ---
	return slot2
	--- END OF BLOCK #2 ---



end

function slot0.createRankItem(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	return {
		go = slot1,
		tf = tf(slot1)
	}
	--- END OF BLOCK #0 ---



end

return slot0
