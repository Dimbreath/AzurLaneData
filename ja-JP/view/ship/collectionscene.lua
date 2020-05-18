slot0 = class("CollectionScene", import("..base.BaseUI"))
slot0.SHOW_DETAIL = "event show detail"
slot0.GET_AWARD = "event get award"
slot0.ACTIVITY_OP = "event activity op"
slot0.BEGIN_STAGE = "event begin state"
slot0.ON_INDEX = "event on index"
slot0.ShipOrderAsc = false
slot0.ShipIndex = {
	display = {
		index = IndexConst.FlagRange2Bits(IndexConst.IndexAll, IndexConst.IndexOther),
		camp = IndexConst.FlagRange2Bits(IndexConst.CampAll, IndexConst.CampOther),
		rarity = IndexConst.FlagRange2Bits(IndexConst.RarityAll, IndexConst.Rarity5)
	},
	index = IndexConst.Flags2Bits({
		IndexConst.IndexAll
	}),
	camp = IndexConst.Flags2Bits({
		IndexConst.CampAll
	}),
	rarity = IndexConst.Flags2Bits({
		IndexConst.RarityAll
	})
}

function slot0.getUIName(slot0)
	return "CollectionUI"
end

function slot0.setShipGroups(slot0, slot1)
	slot0.shipGroups = slot1
end

function slot0.setAwards(slot0, slot1)
	slot0.awards = slot1
end

function slot0.setCollectionRate(slot0, slot1, slot2, slot3)
	slot0.rate = slot1
	slot0.count = slot2
	slot0.totalCount = slot3
end

function slot0.setLinkCollectionCount(slot0, slot1)
	slot0.linkCount = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.setProposeList(slot0, slot1)
	slot0.proposeList = slot1
end

function slot0.init(slot0)
	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0.top = slot0:findTF("blur_panel/adapt/top")
	slot0.leftPanel = slot0:findTF("blur_panel/adapt/left_length")
	slot0.UIMgr = pg.UIMgr.GetInstance()
	slot0.backBtn = findTF(slot0.top, "back_btn")
	slot0.contextData.toggle = slot0.contextData.toggle or 2
	slot0.toggles = {
		slot0:findTF("frame/tagRoot/card", slot0.leftPanel),
		slot0:findTF("frame/tagRoot/display", slot0.leftPanel),
		slot0:findTF("frame/tagRoot/trans", slot0.leftPanel),
		slot0:findTF("frame/tagRoot/memory", slot0.leftPanel),
		slot0:findTF("frame/tagRoot/gallery", slot0.leftPanel),
		slot0:findTF("frame/tagRoot/music", slot0.leftPanel)
	}
	slot0.toggleUpdates = {
		"initCardPanel",
		"initDisplayPanel",
		"initCardPanel",
		"initMemoryPanel",
		"initGalleryPanel",
		"initMusicPanel"
	}
	slot0.cardList = slot0:findTF("main/list_card/scroll"):GetComponent("LScrollRect")

	function slot0.cardList.onInitItem(slot0)
		uv0:onInitCard(slot0)
	end

	function slot0.cardList.onUpdateItem(slot0, slot1)
		uv0:onUpdateCard(slot0, slot1)
	end

	function slot0.cardList.onReturnItem(slot0, slot1)
		uv0:onReturnCard(slot0, slot1)
	end

	slot0.cardItems = {}
	slot0.cardContent = slot0:findTF("ships", slot0.cardList)
	slot0.contextData.cardToggle = slot0.contextData.cardToggle or 1
	slot0.cardToggleGroup = slot0:findTF("main/list_card/types")
	slot0.cardToggles = {
		slot0:findTF("char", slot0.cardToggleGroup),
		slot0:findTF("link", slot0.cardToggleGroup),
		slot0:findTF("blueprint", slot0.cardToggleGroup)
	}
	slot0.cardList.decelerationRate = 0.07
	slot0.bonusPanel = slot0:findTF("bonus_panel")
	slot0.charTpl = slot0:getTpl("chartpl")
	slot0.tip = slot0:findTF("tip", slot0.toggles[2])
	slot0.favoriteVOs = {}

	for slot5, slot6 in ipairs(pg.storeup_data_template.all) do
		table.insert(slot0.favoriteVOs, Favorite.New({
			id = slot5
		}))
	end

	slot0.memoryGroups = _.map(pg.memory_group.all, function (slot0)
		return pg.memory_group[slot0]
	end)
	slot0.memories = nil
	slot0.memoryList = slot0:findTF("main/list_memory"):GetComponent("LScrollRect")

	function slot0.memoryList.onInitItem(slot0)
		uv0:onInitMemory(slot0)
	end

	function slot0.memoryList.onUpdateItem(slot0, slot1)
		uv0:onUpdateMemory(slot0, slot1)
	end

	function slot0.memoryList.onReturnItem(slot0, slot1)
		uv0:onReturnMemory(slot0, slot1)
	end

	slot0.memoryViewport = slot0:findTF("main/list_memory/viewport")
	slot0.memoriesGrid = slot0:findTF("main/list_memory/viewport/memories"):GetComponent(typeof(GridLayoutGroup))
	slot0.memoryItems = {}
	slot0.memoryMask = slot0:findTF("blur_panel/adapt/story_mask")

	setActive(slot0:findTF("memory", slot0.memoryList), false)
	setActive(slot0.memoryMask, false)

	slot0.memoryTogGroup = slot0:findTF("memory", slot0.top)

	setActive(slot0.memoryTogGroup, false)

	slot0.memoryToggles = {
		slot0:findTF("memory/0", slot0.top),
		slot0:findTF("memory/1", slot0.top),
		slot0:findTF("memory/2", slot0.top),
		slot0:findTF("memory/3", slot0.top)
	}
	slot0.memoryFilterIndex = {
		true,
		true,
		true
	}
	slot0.galleryPanelContainer = slot0:findTF("main/GalleryContainer")
	slot0.musicPanelContainer = slot0:findTF("main/MusicContainer")
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		uv0.contextData.cardScrollValue = 0

		if uv0.toggles[4]:GetComponent(typeof(Toggle)).isOn and uv0.memories then
			uv0:return2MemoryGroup()
		else
			uv0:emit(uv1.ON_BACK)
		end
	end, SFX_CANCEL)

	slot0.helpBtn = slot0:findTF("help_btn", slot0.leftPanel)

	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.collection_help.tip,
			weight = LayerWeightConst.THIRD_LAYER
		})
	end, SFX_PANEL)

	slot1 = slot0:findTF("stamp", slot0.top)

	setActive(slot1, getProxy(TaskProxy):mingshiTouchFlagEnabled())

	function slot5()
		getProxy(TaskProxy):dealMingshiTouchFlag(8)
	end

	slot6 = SFX_CONFIRM

	onButton(slot0, slot1, slot5, slot6)

	for slot5, slot6 in ipairs(slot0.toggles) do
		onToggle(slot0, slot6, function (slot0)
			if slot0 then
				if uv0 == 4 and uv1.memories then
					uv1:return2MemoryGroup()
				end

				if uv1.contextData.toggle ~= uv0 then
					if uv1.contextData.toggle == 1 and uv1.contextData.cardToggle == 1 then
						uv1.contextData.cardScrollValue = uv1.cardList.value
					end

					uv1.contextData.toggle = uv0

					if uv1.toggleUpdates[uv0] then
						uv1[uv1.toggleUpdates[uv0]](uv1)
						uv1:calFavoriteRate()
					end
				end

				setActive(uv1.helpBtn, uv0 == 1)

				if uv0 == 1 and not getProxy(SettingsProxy):IsShowCollectionHelp() then
					triggerButton(uv1.helpBtn)
					slot1:SetCollectionHelpFlag(true)
				end

				if uv0 ~= 6 then
					if uv1.musicView and uv1.musicView:CheckState(BaseSubView.STATES.INITED) then
						uv1.musicView:tryPauseMusic()
						uv1.musicView:closeSongListPanel()
					end

					pg.CriMgr:GetInstance():resumeNormalBGM()
				elseif uv0 == 6 and uv1.musicView and uv1.musicView:CheckState(BaseSubView.STATES.INITED) then
					pg.CriMgr:GetInstance():stopBGM()
					uv1.musicView:tryPlayMusic()
				end
			end
		end, SFX_UI_TAG)
	end

	for slot5, slot6 in ipairs(slot0.memoryToggles) do
		onToggle(slot0, slot6, function (slot0)
			if slot0 then
				if uv0 == 1 then
					uv1.memoryFilterIndex = {
						true,
						true,
						true
					}
				else
					for slot4 in ipairs(uv1.memoryFilterIndex) do
						uv1.memoryFilterIndex[slot4] = uv0 - 1 == slot4
					end
				end

				uv1:memoryFilter()
			end
		end, SFX_UI_TAG)
	end

	slot0.contextData.toggle = -1

	triggerToggle(slot0.toggles[slot0.contextData.toggle], true)

	if slot0.contextData.memoryGroup and pg.memory_group[slot3] then
		slot0:showSubMemories(pg.memory_group[slot3])
	else
		triggerToggle(slot0.memoryToggles[1], true)
	end

	for slot7, slot8 in ipairs(slot0.cardToggles) do
		triggerToggle(slot8, slot0.contextData.cardToggle == slot7)
		onToggle(slot0, slot8, function (slot0)
			if slot0 and uv0.contextData.cardToggle ~= uv1 then
				if uv0.contextData.cardToggle == 1 then
					uv0.contextData.cardScrollValue = uv0.cardList.value
				end

				uv0.contextData.cardToggle = uv1

				uv0:initCardPanel()
				uv0:calFavoriteRate()
			end
		end)
	end

	slot0:initIndexPanel()
	slot0:calFavoriteRate()
	pg.UIMgr.GetInstance():OverlayPanelPB(slot0.blurPanel, {
		groupName = LayerWeightConst.GROUP_COLLECTION
	})
	onButton(slot0, slot0.bonusPanel, function ()
		uv0:closeBonus()
	end, SFX_PANEL)
end

function slot0.updateCollectNotices(slot0, slot1)
	setActive(slot0.tip, slot1)
end

function slot0.calFavoriteRate(slot0)
	slot1 = slot0.contextData.toggle == 1 and slot0.contextData.cardToggle == 2

	setActive(slot0:findTF("total/char", slot0.top), not slot1)
	setActive(slot0:findTF("total/link", slot0.top), slot1)
	setText(slot0:findTF("total/char/rate/Text", slot0.top), slot0.rate * 100 .. "%")
	setText(slot0:findTF("total/char/count/Text", slot0.top), slot0.count .. "/" .. slot0.totalCount)
	setText(slot0:findTF("total/link/count/Text", slot0.top), slot0.linkCount)
end

function slot0.initCardPanel(slot0)
	if slot0.contextData.toggle == 1 then
		setActive(slot0.cardToggleGroup, true)
		slot0:cardFilter()
	elseif slot0.contextData.toggle == 3 then
		setActive(slot0.cardToggleGroup, false)
		slot0:transFilter()
	end

	table.sort(slot0.codeShips, function (slot0, slot1)
		return slot0.index_id < slot1.index_id
	end)
	slot0.cardList:SetTotalCount(#slot0.codeShips, -1)
	Canvas.ForceUpdateCanvases()
	slot0.cardList:ScrollTo(slot0.contextData.cardScrollValue or 0)
end

function slot0.initIndexPanel(slot0)
	slot0.indexBtn = slot0:findTF("index_button", slot0.top)

	onButton(slot0, slot0.indexBtn, function ()
		slot0 = Clone(uv0.ShipIndex.display)

		if uv1.contextData.toggle == 1 and uv1.contextData.cardToggle == 2 then
			slot0.camp = nil
		end

		uv1:emit(uv0.ON_INDEX, {
			display = slot0,
			index = uv0.ShipIndex.index,
			camp = uv0.ShipIndex.camp,
			rarity = uv0.ShipIndex.rarity,
			callback = function (slot0)
				uv0.ShipIndex.index = slot0.index

				if slot0.camp then
					uv0.ShipIndex.camp = slot0.camp
				end

				uv0.ShipIndex.rarity = slot0.rarity

				uv1:initCardPanel()
			end
		})
	end, SFX_PANEL)
end

function slot0.onInitCard(slot0, slot1)
	if slot0.exited then
		return
	end

	slot2 = CollectionShipCard.New(slot1)

	onButton(slot0, slot2.go, function ()
		if uv0.state == ShipGroup.STATE_UNLOCK then
			LeanTween.delayedCall(0.2, System.Action(function ()
				uv0.contextData.cardScrollValue = uv0.cardList.value

				uv0:emit(uv1.SHOW_DETAIL, uv2.showTrans, uv2.shipGroup.id)
			end))
		elseif uv0.state == ShipGroup.STATE_NOTGET then
			if uv0.showTrans == true and uv0.shipGroup.trans == true then
				return
			end

			if uv0.config then
				uv1:showObtain(uv0.config.description, uv0.shipGroup:getShipConfigId())
			end
		end
	end, SOUND_BACK)

	slot0.cardItems[slot1] = slot2
end

function slot0.showObtain(slot0, slot1, slot2)
	slot0.contextData.cardScrollValue = slot0.cardList.value

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		type = MSGBOX_TYPE_OBTAIN,
		shipId = slot2,
		list = slot1,
		mediatorName = CollectionMediator.__cname
	})
end

function slot0.skipIn(slot0, slot1, slot2)
	slot0.contextData.displayGroupId = slot2

	triggerToggle(slot0.toggles[slot1], true)
end

function slot0.onUpdateCard(slot0, slot1, slot2)
	if slot0.exited then
		return
	end

	if not slot0.cardItems[slot2] then
		slot0:onInitCard(slot2)

		slot3 = slot0.cardItems[slot2]
	end

	slot6 = false

	if slot0.codeShips[slot1 + 1].group then
		slot6 = slot0.proposeList[slot5.group.id]
	end

	slot3:update(slot5.code, slot5.group, slot5.showTrans, slot6, slot5.id)
end

function slot0.onReturnCard(slot0, slot1, slot2)
	if slot0.exited then
		return
	end

	if slot0.cardItems[slot2] then
		slot3:clear()
	end
end

function slot0.cardFilter(slot0)
	slot0.codeShips = {}
	slot1 = _.filter(pg.ship_data_group.all, function (slot0)
		return pg.ship_data_group[slot0].handbook_type == uv0.contextData.cardToggle - 1
	end)
	slot2 = _.min(slot1)
	slot3 = _.max(slot1)

	if uv0.ShipIndex.index == bit.lshift(1, IndexConst.IndexAll) and uv0.ShipIndex.rarity == bit.lshift(1, IndexConst.RarityAll) and slot0.contextData.cardToggle == 1 and uv0.ShipIndex.camp == bit.lshift(1, IndexConst.CampAll) then
		for slot7 = slot2, slot3 do
			slot8 = false
			slot10 = false

			if pg.ship_data_group[slot7] then
				if slot0.contextData.cardToggle == 1 and not Nation.IsLinkType(ShipGroup.getDefaultShipConfig(slot9.group_type).nationality) then
					slot0.codeShips[#slot0.codeShips + 1] = {
						showTrans = false,
						id = slot7,
						code = slot7,
						group = slot0.shipGroups[slot9.group_type],
						index_id = slot9.index_id
					}
				elseif slot0.contextData.cardToggle == 2 and slot10 then
					slot0.codeShips[#slot0.codeShips + 1] = {
						showTrans = false,
						id = slot7,
						code = slot7 - 10000,
						group = slot8,
						index_id = slot9.index_id
					}
				elseif slot0.contextData.cardToggle == 3 then
					slot0.codeShips[#slot0.codeShips + 1] = {
						showTrans = false,
						id = slot7,
						code = slot7 - 20000,
						group = slot8,
						index_id = slot9.index_id
					}
				end
			end
		end
	else
		for slot7 = slot2, slot3 do
			if pg.ship_data_group[slot7] then
				slot9 = ShipGroup.New({
					id = slot8.group_type
				})

				if ShipGroup.getState(slot7, slot0.shipGroups[slot8.group_type], false) ~= ShipGroup.STATE_LOCK and slot9 and IndexConst.filterByIndex(slot9, uv0.ShipIndex.index) and IndexConst.filterByRarity(slot9, uv0.ShipIndex.rarity) then
					if slot0.contextData.cardToggle == 1 and not Nation.IsLinkType(slot9:getNation()) and IndexConst.filterByCamp(slot9, uv0.ShipIndex.camp) then
						slot0.codeShips[#slot0.codeShips + 1] = {
							showTrans = false,
							id = slot7,
							code = slot7,
							group = slot0.shipGroups[slot8.group_type],
							index_id = slot8.index_id
						}
					elseif slot0.contextData.cardToggle == 2 and slot12 then
						slot0.codeShips[#slot0.codeShips + 1] = {
							showTrans = false,
							id = slot7,
							code = slot7 - 10000,
							group = slot10,
							index_id = slot8.index_id
						}
					elseif slot0.contextData.cardToggle == 3 and IndexConst.filterByCamp(slot9, uv0.ShipIndex.camp) then
						slot0.codeShips[#slot0.codeShips + 1] = {
							showTrans = false,
							id = slot7,
							code = slot7 - 20000,
							group = slot10,
							index_id = slot8.index_id
						}
					end
				end
			end
		end
	end
end

function slot0.transFilter(slot0)
	slot0.codeShips = {}
	slot1 = _.filter(pg.ship_data_group.all, function (slot0)
		return pg.ship_data_group[slot0].handbook_type == 0
	end)
	slot2 = _.min(slot1)
	slot3 = _.max(slot1)

	if uv0.ShipIndex.index == bit.lshift(1, IndexConst.IndexAll) and uv0.ShipIndex.rarity == bit.lshift(1, IndexConst.RarityAll) and uv0.ShipIndex.camp == bit.lshift(1, IndexConst.CampAll) then
		for slot7 = slot2, slot3 do
			slot8 = false

			if pg.ship_data_group[slot7] and pg.ship_data_trans[slot9.group_type] then
				if slot0.shipGroups[slot9.group_type] and not slot10.trans then
					slot10 = nil
				end

				slot0.codeShips[#slot0.codeShips + 1] = {
					showTrans = true,
					id = slot7,
					code = 3000 + slot7,
					group = slot10,
					index_id = slot9.index_id
				}
			end
		end
	else
		for slot7 = slot2, slot3 do
			if pg.ship_data_group[slot7] then
				if slot0.shipGroups[slot8.group_type] and slot9.trans and IndexConst.filterByIndex(slot9, uv0.ShipIndex.index) and IndexConst.filterByRarity(slot9, uv0.ShipIndex.rarity) and IndexConst.filterByCamp(slot9, uv0.ShipIndex.camp) then
					slot0.codeShips[#slot0.codeShips + 1] = {
						showTrans = true,
						id = slot7,
						code = 3000 + slot7,
						group = slot9,
						index_id = slot8.index_id
					}
				elseif pg.ship_data_trans[slot8.group_type] and IndexConst.filterByIndex(ShipGroup.New({
					id = slot8.group_type
				}), uv0.ShipIndex.index) and IndexConst.filterByRarity(slot10, uv0.ShipIndex.rarity) and IndexConst.filterByCamp(slot10, uv0.ShipIndex.camp) then
					slot0.codeShips[#slot0.codeShips + 1] = {
						showTrans = true,
						id = slot7,
						code = 3000 + slot7,
						index_id = slot8.index_id
					}
				end
			end
		end
	end
end

function slot0.sortDisplay(slot0)
	table.sort(slot0.favoriteVOs, function (slot0, slot1)
		if slot0:getState(uv0.shipGroups, uv0.awards) == slot1:getState(uv0.shipGroups, uv0.awards) then
			return slot0.id < slot1.id
		else
			return slot2 < slot3
		end
	end)
	slot0.displayRect:SetTotalCount(#slot0.favoriteVOs)

	slot1 = 0

	for slot6, slot7 in ipairs(slot0.favoriteVOs) do
		if slot7:containShipGroup(slot0.contextData.displayGroupId) then
			slot1 = slot6

			break
		end
	end

	slot0.displayRect:ScrollTo(slot0.displayRect:HeadIndexToValue(slot1 - 1))
end

function slot0.initDisplayPanel(slot0)
	if not slot0.isInitDisplay then
		slot0.isInitDisplay = true
		slot0.displayRect = slot0:findTF("main/list_display"):GetComponent("LScrollRect")
		slot0.displayRect.decelerationRate = 0.07

		function slot0.displayRect.onInitItem(slot0)
			uv0:initFavoriteCard(slot0)
		end

		function slot0.displayRect.onUpdateItem(slot0, slot1)
			uv0:updateFavoriteCard(slot0, slot1)
		end

		slot0.favoriteCards = {}
	end

	slot0:sortDisplay()
end

function slot0.initFavoriteCard(slot0, slot1)
	if slot0.exited then
		return
	end

	slot2 = FavoriteCard.New(slot1, slot0.charTpl)

	onButton(slot0, slot2.awardTF, function ()
		if uv0.state == Favorite.STATE_AWARD then
			uv1:emit(uv2.GET_AWARD, uv0.favoriteVO.id, uv0.favoriteVO:getNextAwardIndex(uv0.awards))
		elseif uv0.state == Favorite.STATE_LOCK then
			pg.TipsMgr.GetInstance():ShowTips(i18n("collection_lock"))
		elseif uv0.state == Favorite.STATE_FETCHED then
			pg.TipsMgr.GetInstance():ShowTips(i18n("collection_fetched"))
		elseif uv0.state == Favorite.STATE_STATE_WAIT then
			pg.TipsMgr.GetInstance():ShowTips(i18n("collection_nostar"))
		end
	end, SFX_PANEL)
	onButton(slot0, slot2.box, function ()
		uv0:openBonus(uv1.favoriteVO)
	end, SFX_PANEL)

	slot0.favoriteCards[slot1] = slot2
end

function slot0.updateFavoriteCard(slot0, slot1, slot2)
	if slot0.exited then
		return
	end

	if not slot0.favoriteCards[slot2] then
		slot0:initFavoriteCard(slot2)

		slot3 = slot0.favoriteCards[slot2]
	end

	slot3:update(slot0.favoriteVOs[slot1 + 1], slot0.shipGroups, slot0.awards)
end

function slot0.openBonus(slot0, slot1)
	if not slot0.isInitBound then
		slot0.isInitBound = true
		slot0.boundName = findTF(slot0.bonusPanel, "frame/name/Text"):GetComponent(typeof(Text))
		slot0.progressSlider = findTF(slot0.bonusPanel, "frame/process"):GetComponent(typeof(Slider))
	end

	pg.UIMgr.GetInstance():BlurPanel(slot0.bonusPanel)
	setActive(slot0.bonusPanel, true)

	slot0.boundName.text = slot1:getConfig("name")

	for slot7, slot8 in ipairs(slot1:getConfig("level")) do
		slot10 = findTF(slot0.bonusPanel, "frame/awards/award" .. slot7)

		setText(findTF(slot10, "process"), slot8)
		setActive(findTF(slot10, "item_tpl/unfinish"), slot1:getAwardState(slot0.shipGroups, slot0.awards, slot7) == Favorite.STATE_WAIT)
		setActive(findTF(slot10, "item_tpl/get"), slot11 == Favorite.STATE_AWARD)
		setActive(findTF(slot10, "item_tpl/got"), slot11 == Favorite.STATE_FETCHED)
		setActive(findTF(slot10, "item_tpl/lock"), slot11 == Favorite.STATE_LOCK)
		setActive(findTF(slot10, "item_tpl/icon_bg"), slot11 ~= Favorite.STATE_LOCK)
		setActive(findTF(slot10, "item_tpl/bg"), slot11 ~= Favorite.STATE_LOCK)

		if slot1:getConfig("award_display")[slot7] then
			updateDrop(findTF(slot10, "item_tpl"), {
				count = 0,
				type = slot9[1],
				id = slot9[2]
			})
			onButton(slot0, slot10, function ()
				if uv0[1] == DROP_TYPE_RESOURCE then
					uv1:emit(uv2.ON_ITEM, id2ItemId(uv0[2]))
				elseif uv0[1] == DROP_TYPE_ITEM then
					uv1:emit(uv2.ON_DROP, {
						type = uv0[1],
						id = uv0[2],
						count = uv0[3]
					})
				elseif uv0[1] == DROP_TYPE_SHIP then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						hideNo = true,
						type = MSGBOX_TYPE_SINGLE_ITEM,
						drop = {
							type = uv0[1],
							id = uv0[2],
							count = uv0[3]
						}
					})
				elseif uv0[1] == DROP_TYPE_FURNITURE then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						yesText = "text_confirm",
						hideNo = true,
						content = "",
						type = MSGBOX_TYPE_SINGLE_ITEM,
						drop = {
							type = DROP_TYPE_FURNITURE,
							id = uv0[2],
							cfg = pg.furniture_data_template[uv0[2]]
						}
					})
				elseif uv0[1] == DROP_TYPE_EQUIP then
					uv1:emit(uv2.ON_EQUIPMENT, {
						equipmentId = uv0[2],
						type = EquipmentInfoMediator.TYPE_DISPLAY
					})
				end
			end, SFX_PANEL)
		else
			GetOrAddComponent(slot10, typeof(Button)).onClick:RemoveAllListeners()
		end
	end

	slot0.progressSlider.value = slot1:getStarCount(slot0.shipGroups) / slot3[#slot3]
end

function slot0.closeBonus(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.bonusPanel, slot0._tf)
	setActive(slot0.bonusPanel, false)
end

function slot0.showSubMemories(slot0, slot1)
	slot0.contextData.memoryGroup = slot1.id
	slot0.memories = _.map(slot1.memories, function (slot0)
		return pg.memory_template[slot0]
	end)

	for slot5 in ipairs(slot0.memories) do
		slot0.memories[slot5].index = slot5
	end

	slot0.memoryList:SetTotalCount(#slot0.memories, 0)
	setActive(slot0:findTF("memory", slot0.top), false)
end

slot1 = 3

function slot0.return2MemoryGroup(slot0)
	slot0.contextData.memoryGroup = nil
	slot0.memories = nil
	slot2 = 0

	if slot0.contextData.memoryGroup then
		slot3 = 0

		for slot7, slot8 in ipairs(slot0.memoryGroups) do
			if slot8.id == slot1 then
				slot3 = slot7

				break
			end
		end

		if slot3 >= 0 then
			slot5 = slot0.memoriesGrid.cellSize.y + slot0.memoriesGrid.spacing.y
			slot2 = Mathf.Clamp01((slot5 * math.floor((slot3 - 1) / uv0) + slot0.memoryList.paddingFront) / (slot5 * math.floor((#slot0.memoryGroups - 1) / uv0 + 1) - slot0.memoryViewport.rect.height))
		end
	end

	slot0.memoryList:SetTotalCount(#slot0.memoryGroups, slot2)
	setActive(slot0:findTF("memory", slot0.top), true)
end

function slot0.initMemoryPanel(slot0)
	if getProxy(ActivityProxy):getActivityById(ActivityConst.QIXI_ACTIVITY_ID) and not slot2:isEnd() then
		slot4 = _.flatten(slot2:getConfig("config_data"))

		if getProxy(TaskProxy):getTaskById(slot4[#slot4]) and not slot7:isFinish() then
			pg.StoryMgr.GetInstance():Play("HOSHO8", function ()
				uv0:emit(CollectionScene.ACTIVITY_OP, {
					cmd = 2,
					activity_id = uv1.id
				})
			end, true)
		end
	end

	slot0:memoryFilter()
end

function slot0.onInitMemory(slot0, slot1)
	if slot0.exited then
		return
	end

	slot2 = MemoryCard.New(slot1)

	onButton(slot0, slot2.go, function ()
		if uv0.info then
			if uv0.isGroup then
				uv1:showSubMemories(uv0.info)
			elseif uv0.info.is_open == 1 or pg.StoryMgr.GetInstance():IsPlayed(uv0.info.story, true) then
				uv1:playMemory(uv0.info)
			end
		end
	end, SOUND_BACK)

	slot0.memoryItems[slot1] = slot2
end

function slot0.onUpdateMemory(slot0, slot1, slot2)
	if slot0.exited then
		return
	end

	if not slot0.memoryItems[slot2] then
		slot0:onInitMemory(slot2)

		slot3 = slot0.memoryItems[slot2]
	end

	if slot0.memories then
		slot3:update(false, slot0.memories[slot1 + 1])
	else
		slot3:update(true, slot0.memoryGroups[slot1 + 1])
	end

	_.any({
		slot3.lock,
		slot3.normal,
		slot3.group
	}, function (slot0)
		if isActive(slot0) then
			uv0.go:GetComponent(typeof(Button)).targetGraphic = slot0:GetComponent(typeof(Image))
		end

		return slot1
	end)
end

function slot0.onReturnMemory(slot0, slot1, slot2)
	if slot0.exited then
		return
	end

	if slot0.memoryItems[slot2] then
		slot3:clear()
	end
end

function slot0.playMemory(slot0, slot1)
	if slot1.type == 1 then
		slot2 = findTF(slot0.memoryMask, "pic")

		if string.len(slot1.mask) > 0 then
			setActive(slot2, true)

			slot2:GetComponent(typeof(Image)).sprite = LoadSprite(slot1.mask)
		else
			setActive(slot2, false)
		end

		setActive(slot0.memoryMask, true)
		pg.StoryMgr.GetInstance():Play(slot1.story, function ()
			setActive(uv0.memoryMask, false)
		end, true)
	elseif slot1.type == 2 then
		slot3 = 0

		for slot7, slot8 in pairs(pg.StoryMgr.GetInstance():GetStoryByName("index")) do
			if slot1.story == slot8 then
				slot3 = slot7

				break
			end
		end

		slot0:emit(uv0.BEGIN_STAGE, {
			memory = true,
			system = SYSTEM_PERFORM,
			stageId = slot3
		})
	end
end

function slot0.memoryFilter(slot0)
	slot0.memoryGroups = {}

	for slot4, slot5 in pairs(pg.memory_group) do
		if slot0.memoryFilterIndex[slot5.type] then
			table.insert(slot0.memoryGroups, slot5)
		end
	end

	table.sort(slot0.memoryGroups, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0.memoryList:SetTotalCount(#slot0.memoryGroups, 0)
end

function slot0.willExit(slot0)
	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.blurPanel, slot0._tf)

	if slot0.bonusPanel.gameObject.activeSelf then
		slot0:closeBonus()
	end

	Destroy(slot0.bonusPanel)

	slot0.bonusPanel = nil

	for slot4, slot5 in pairs(slot0.cardItems) do
		slot5:clear()
	end

	if slot0.resPanel then
		slot0.resPanel:exit()

		slot0.resPanel = nil
	end

	if slot0.galleryView then
		slot0.galleryView:Destroy()

		slot0.galleryView = nil
	end

	if slot0.musicView then
		slot0.musicView:Destroy()

		slot0.musicView = nil
	end
end

function slot0.initGalleryPanel(slot0)
	if not slot0.galleryView then
		slot0.galleryView = GalleryView.New(slot0.galleryPanelContainer, slot0.event, slot0.contextData)

		slot0.galleryView:Reset()
		slot0.galleryView:Load()
	end
end

function slot0.initMusicPanel(slot0)
	if not slot0.musicView then
		slot0.musicView = MusicCollectionView.New(slot0.musicPanelContainer, slot0.event, slot0.contextData)

		slot0.musicView:Reset()
		slot0.musicView:Load()
		pg.CriMgr:GetInstance():stopBGM()
	end
end

function slot0.onBackPressed(slot0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if slot0.bonusPanel.gameObject.activeSelf then
		slot0:closeBonus()

		return
	end

	if slot0.galleryView then
		if slot0.galleryView:onBackPressed() == true then
			slot0.galleryView:Destroy()

			slot0.galleryView = nil
		else
			return
		end
	end

	if slot0.musicView then
		if slot0.musicView:onBackPressed() == true then
			slot0.musicView:Destroy()

			slot0.musicView = nil
		else
			return
		end
	end

	triggerButton(slot0.backBtn)
end

return slot0
