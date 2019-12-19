slot0 = class("DockyardScene", import("..base.BaseUI"))
slot1 = 2
slot2 = 0.2
slot3 = 1
slot0.MODE_OVERVIEW = "overview"
slot0.MODE_DESTROY = "destroy"
slot0.MODE_SELECT = "select"
slot0.MODE_MOD = "modify"
slot0.MODE_WORLD = "world"
slot0.MODE_REMOULD = "remould"
slot0.MODE_UPGRADE = "upgrade"
slot0.TITLE_CN_OVERVIEW = i18n("word_dockyard")
slot0.TITLE_CN_UPGRADE = i18n("word_dockyardUpgrade")
slot0.TITLE_CN_DESTROY = i18n("word_dockyardDestroy")
slot0.TITLE_EN_OVERVIEW = "dockyard"
slot0.TITLE_EN_UPGRADE = "modernization"
slot0.TITLE_EN_DESTROY = "retirement"
slot4 = {
	"index_all",
	"index_fleetfront",
	"index_fleetrear",
	"index_shipType_quZhu",
	"index_shipType_qinXun",
	"index_shipType_zhongXun",
	"index_shipType_zhanLie",
	"index_shipType_hangMu",
	"index_shipType_weiXiu",
	"index_shipType_qianTing",
	"index_other"
}
slot5 = {
	"word_shipNation_all",
	"word_shipNation_baiYing",
	"word_shipNation_huangJia",
	"word_shipNation_chongYing",
	"word_shipNation_tieXue",
	"word_shipNation_dongHuang",
	"word_shipNation_saDing",
	"word_shipNation_beiLian",
	"word_shipNation_ziyou",
	"word_shipNation_weixi",
	"word_shipNation_other"
}
slot6 = {
	"index_all",
	"index_rare2",
	"index_rare3",
	"index_rare4",
	"index_rare5",
	"index_rare6"
}
slot7 = {
	i18n("word_rarity"),
	i18n("word_lv"),
	i18n("word_synthesize_power"),
	i18n("word_achieved_item"),
	i18n("word_attr_durability"),
	i18n("word_attr_cannon"),
	i18n("word_attr_torpedo"),
	i18n("word_attr_air"),
	i18n("word_attr_antiaircraft"),
	i18n("word_attr_antisub")
}
slot8 = {
	"sort_rarity",
	"sort_lv",
	"sort_synthesize_power",
	"sort_achieved_item",
	"sort_attr_durability",
	"sort_attr_cannon",
	"sort_attr_torpedo",
	"sort_attr_air",
	"sort_attr_antiaircraft",
	"sort_attr_antisub"
}
slot9 = {
	1,
	2,
	3,
	4,
	4,
	5,
	5,
	7,
	8,
	8,
	8,
	6,
	8,
	nil,
	nil,
	nil,
	7,
	3
}
slot10 = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9
}
slot11 = {
	0,
	1,
	2,
	3,
	4,
	5
}
slot12 = {
	vanguard = 1,
	main = 2
}

function slot0.getUIName(slot0)
	return "DockyardUI"
end

function slot0.init(slot0)
	slot0.UIMgr = pg.UIMgr.GetInstance()

	slot0._tf:SetAsLastSibling()

	slot0.mode = defaultValue(slot0.contextData.mode, slot0.MODE_SELECT)
	slot0.contextData.prevFlag = defaultValue(slot0.contextData.prevFlag, false)
	slot0.contextData.displayAttr = defaultValue(slot0.contextData.displayAttr, true)
	slot0.teamTypeFilter = slot0.contextData.teamFilter
	slot0.selectedMin = slot0.contextData.selectedMin or 1
	slot0.leastLimitMsg = slot1.leastLimitMsg
	slot0.selectedMax = slot1.selectedMax or 0
	slot0.selectedIds = Clone(slot1.selectedIds or {})
	slot0.checkShip = slot1.onShip or function (slot0)
		return true
	end
	slot0.onCancelShip = slot1.onCancelShip or function (slot0)
		return true
	end
	slot0.onClick = slot1.onClick or function (slot0, slot1)
		slot0:emit(DockyardMediator.ON_SHIP_DETAIL, slot0, slot1)
	end
	slot0.onPassShip = slot1.onPassShip or function (slot0, slot1)
		return {}
	end
	slot0.onRemoveShip = slot1.onRemoveShip or function (slot0, slot1)
		return {}
	end
	slot0.confirmSelect = slot1.confirmSelect
	slot0.callbackQuit = slot1.callbackQuit
	slot0.onSelected = slot1.onSelected or function ()
		warning("not implemented.")
	end
	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0.topPanel = slot0:findTF("blur_panel/adapt/top")
	slot0.sortBtn = slot0:findTF("sort_button", slot0.topPanel)
	slot0.sortImgAsc = slot0:findTF("asc", slot0.sortBtn)
	slot0.sortImgDesc = slot0:findTF("desc", slot0.sortBtn)
	slot0.leftTipsText = findTF(slot0.topPanel, "capacity")
	slot0.bottomTipsText = slot0:findTF("select_panel/tip")
	slot0.preferenceBtn = findTF(slot0.topPanel, "preference_toggle")
	slot0.indexBtn = slot0:findTF("index_button", slot0.topPanel)
	slot0.attrBtn = slot0:findTF("attr_toggle", slot0.topPanel)
	slot0.modLockFilter = slot0:findTF("mod_flter_lock", slot0.topPanel)
	slot0.modLeveFilter = slot0:findTF("mod_flter_level", slot0.topPanel)
	slot0.selectPanel = slot0:findTF("select_panel")

	setActive(slot0.selectPanel, true)

	slot0.energyDescTF = slot0:findTF("energy_desc")
	slot0.energyDescTextTF = slot0:findTF("energy_desc/Text")
	slot0.awardTF = slot0:findTF("select_panel/bottom_info/bg_award")
	slot0.modAttrsTF = slot0:findTF("select_panel/bottom_info/bg_mod")
	slot0.isRemouldOrUpgradeMode = slot0.contextData.mode == slot0.MODE_REMOULD or slot0.contextData.mode == slot0.MODE_UPGRADE

	setActive(slot0.preferenceBtn, not slot0.isRemouldOrUpgradeMode)
	setActive(slot0.indexBtn, not slot0.isRemouldOrUpgradeMode)
	setActive(slot0.attrBtn, not slot0.isRemouldOrUpgradeMode)
	setActive(slot0.sortBtn, not slot0.isRemouldOrUpgradeMode)
	setActive(slot0.modLeveFilter, slot0.isRemouldOrUpgradeMode)
	setActive(slot0.modLockFilter, slot0.isRemouldOrUpgradeMode)

	if slot0.mode == slot0.MODE_OVERVIEW then
		slot0.selecteEnabled = false
	elseif slot0.mode == slot0.MODE_DESTROY then
		slot0.selecteEnabled = true
		slot0.goldTF = slot0:findTF("gold/Text", slot0.awardTF)
		slot0.medalTF = slot0:findTF("medal/Text", slot0.awardTF)
		slot0.oilTF = slot0:findTF("oil/Text", slot0.awardTF)
	elseif slot0.mode == slot0.MODE_MOD then
		slot0.selecteEnabled = true

		setText(slot0.modAttrsTF:Find("title/Text"), i18n("word_mod_value"))

		slot0.modAttrContainer = slot0.modAttrsTF:Find("attrs")
	elseif slot0.mode == slot0.MODE_WORLD then
		slot0.selecteEnabled = true
		slot0.worldPanel = slot0:findTF("world_port_panel")

		setActive(slot0.worldPanel, true)
		setActive(slot0.selectPanel, false)
	else
		slot0.selecteEnabled = true
	end

	slot0.shipContainer = (slot0.contextData.selectFriend and slot0:findTF("main/friend_container"):GetComponent("LScrollRect")) or slot0:findTF("main/ship_container"):GetComponent("LScrollRect")
	slot0.shipContainer.decelerationRate = 0.07

	setActive(slot0:findTF("main/ship_container"), not slot0.contextData.selectFriend)

	function slot0.shipContainer.onInitItem(slot0)
		slot0:onInitItem(slot0)
	end

	function slot0.shipContainer.onUpdateItem(slot0, slot1)
		slot0:onUpdateItem(slot0, slot1)
	end

	function slot0.shipContainer.onReturnItem(slot0, slot1)
		slot0:onReturnItem(slot0, slot1)
	end

	function slot0.shipContainer.onStart()
		slot0:updateSelected()
	end

	slot0.shipLayout = slot0:findTF("main/ship_container/ships")
	slot0.scrollItems = {}

	if _G[slot0.contextData.preView] then
		slot0.selectedSort = (slot2.dockSort and slot2.dockSort) or 2
		slot0.selectAsc = (slot2.selectAsc and slot2.selectAsc) or false
		slot0.indexFlag = (slot2.dockIndexFlag and slot2.dockIndexFlag) or {}
		slot0.indexFlag2 = (slot2.dockIndexFlag2 and slot2.dockIndexFlag2) or {}
		slot0.indexFlag3 = (slot2.dockIndexFlag3 and slot2.dockIndexFlag3) or {}
		slot0.filterTag = slot2.filterTag or Ship.PREFERENCE_TAG_NONE
	elseif slot0.contextData.sortData then
		slot0.selectedSort = slot0.contextData.sortData.sort or 2
		slot0.selectAsc = slot3.Asc or false
		slot0.indexFlag = slot3.indexFlag or {}
		slot0.indexFlag2 = slot3.indexFlag2 or {}
		slot0.indexFlag3 = slot3.indexFlag3 or {}
		slot0.filterTag = slot3.filterTag or Ship.PREFERENCE_TAG_NONE
	else
		slot0.selectAsc = DockyardScene.selectAsc or false
		slot0.selectedSort = DockyardScene.selectedSort or 2
		slot0.indexFlag = (DockyardScene.indexFlag and DockyardScene.indexFlag) or {}
		slot0.indexFlag2 = (DockyardScene.indexFlag2 and DockyardScene.indexFlag2) or {}
		slot0.indexFlag3 = (DockyardScene.indexFlag3 and DockyardScene.indexFlag3) or {}
		slot0.filterTag = DockyardScene.filterTag or Ship.PREFERENCE_TAG_NONE
	end

	triggerToggle(findTF(slot0.topPanel, "preference_toggle"), slot0.filterTag == Ship.PREFERENCE_TAG_COMMON)

	slot0.tmpSort = 2
	slot0.tmpAsc = false
	slot0.tmpIndexFlag = {}
	slot0.tmpIndexFlag2 = {}
	slot0.tmpIndexFlag3 = {}

	for slot6 = 1, #slot1 - 1, 1 do
		slot0.tmpIndexFlag[slot6] = false
		slot0.indexFlag[slot6] = (slot0.indexFlag[slot6] and true) or false
	end

	for slot6 = 1, #slot2 - 1, 1 do
		slot0.tmpIndexFlag2[slot6] = false
		slot0.indexFlag2[slot6] = (slot0.indexFlag2[slot6] and true) or false
	end

	for slot6 = 1, #slot3 - 1, 1 do
		slot0.tmpIndexFlag3[slot6] = false
		slot0.indexFlag3[slot6] = (slot0.indexFlag3[slot6] and true) or false
	end

	slot0:initIndexPanel()

	slot0.itemDetailType = -1
	slot0.listEmptyTF = slot0:findTF("empty")

	setActive(slot0.listEmptyTF, false)

	slot0.listEmptyTxt = slot0:findTF("Text", slot0.listEmptyTF)

	setText(slot0.listEmptyTxt, i18n("list_empty_tip_dockyardui"))
end

function slot0.setShipsCount(slot0, slot1)
	slot0.shipsCount = slot1
end

function slot0.onInitItem(slot0, slot1)
	slot2 = nil

	(slot0.contextData.selectFriend or DockyardShipItem.New(slot1, slot0.contextData.showTagNoBlock)) and DockyardFriend.New(slot1, slot0.contextData.showTagNoBlock):updateDetail(slot0.itemDetailType)

	(slot0.contextData.selectFriend or DockyardShipItem.New(slot1, slot0.contextData.showTagNoBlock)) and DockyardFriend.New(slot1, slot0.contextData.showTagNoBlock).isLoading = true

	onButton(slot0, (slot0.contextData.selectFriend or DockyardShipItem.New(slot1, slot0.contextData.showTagNoBlock)) and DockyardFriend.New(slot1, slot0.contextData.showTagNoBlock).go, function ()
		if slot0.shipVO then
			if not slot1.selecteEnabled then
				playSoundEffect(SFX_UI_CLICK)

				DockyardScene.value = SFX_UI_CLICK.shipContainer.value

				slot1.onClick(slot0.shipVO, slot1.shipVOs)
			else
				slot0((table.contains(slot1.selectedIds, slot0.shipVO.id) and SFX_UI_CANCEL) or SFX_UI_FORMATION_SELECT)
				(table.contains(slot1.selectedIds, slot0.shipVO.id) and SFX_UI_CANCEL) or SFX_UI_FORMATION_SELECT:selectShip(slot0.shipVO)
			end
		else
			playSoundEffect(SFX_UI_CLICK)

			if slot1.callbackQuit then
				slot1.onSelected({}, function ()
					slot0:back()
				end)
			elseif not slot0.isLoading then
				slot1:back()
				slot1.onSelected({})
			end
		end
	end)

	slot0.scrollItems[slot1] = (slot0.contextData.selectFriend or DockyardShipItem.New(slot1, slot0.contextData.showTagNoBlock)) and DockyardFriend.New(slot1, slot0.contextData.showTagNoBlock)
end

function slot0.showEnergyDesc(slot0, slot1, slot2)
	if LeanTween.isTweening(go(slot0.energyDescTF)) then
		LeanTween.cancel(go(slot0.energyDescTF))

		slot0.energyDescTF.localScale = Vector3.one
	end

	setText(slot0.energyDescTextTF, i18n(slot2))

	slot0.energyDescTF.position = slot1

	setActive(slot0.energyDescTF, true)
	LeanTween.scale(slot0.energyDescTF, Vector3.zero, 0.2):setDelay(1):setFrom(Vector3.one):setOnComplete(System.Action(function ()
		slot0.energyDescTF.localScale = Vector3.one

		setActive(slot0.energyDescTF, false)
	end))
end

function slot0.onUpdateItem(slot0, slot1, slot2)
	if not slot0.scrollItems[slot2] then
		slot0:onInitItem(slot2)

		slot3 = slot0.scrollItems[slot2]
	end

	slot4 = slot0.shipVOs[slot1 + 1]

	if slot0.contextData.selectFriend then
		slot3:update(slot4, slot0.friends)
	else
		slot3:update(slot4)
	end

	slot5 = false

	if slot3.shipVO then
		for slot9, slot10 in ipairs(slot0.selectedIds) do
			if slot3.shipVO.id == slot10 then
				slot5 = true

				break
			end
		end
	end

	slot3:updateSelected(slot5)

	slot3.isLoading = false
end

function slot0.onReturnItem(slot0, slot1, slot2)
	if slot0.exited then
		return
	end

	if slot0.scrollItems[slot2] then
		slot3:clear()
	end
end

function slot0.initIndexPanel(slot0)
	onButton(slot0, slot0.indexBtn, function ()
		if not slot0.indexPanel then
			slot0.indexPanel = findTF(slot0._tf, "index_panel")

			if not slot0.indexPanel then
				PoolMgr.GetInstance():GetPrefab("ui/indexui", "", false, function (slot0)
					slot0.indexPanelParent = slot0
					slot0.indexPanel = findTF(slot0, "index_panel")

					setParent(slot0, slot0._tf, false)
					setActive(slot0.indexPanelParent, false)
				end)
			end

			slot0.greySprite = slot0:findTF("resource/grey", slot0.indexPanel):GetComponent(typeof(Image)).sprite
			slot0.blueSprite = slot0:findTF("resource/blue", slot0.indexPanel):GetComponent(typeof(Image)).sprite
			slot0.yellowSprite = slot0:findTF("resource/yellow", slot0.indexPanel):GetComponent(typeof(Image)).sprite

			slot0:initIndex()
			slot0.initIndex:initSort()
			slot0.initIndex.initSort:animationOut()
			setActive(slot0.indexPanel, true)

			setActive.indexPanel.localScale = Vector3.zero

			LeanTween.scale(slot0.indexPanel, Vector3(1, 1, 1), 0.2)
			LeanTween.scale:updateIndex()
			LeanTween.scale.updateIndex.UIMgr:BlurPanel(slot0.indexPanel)
			onButton(onButton, findTF(slot0.indexPanel, "layout/btns/ok"), function ()
				slot0.selectAsc = slot0.tmpAsc
				slot0.selectedSort = slot0.tmpSort
				slot1 = slot0.tmpIndexFlag or {}

				for slot3, slot4 in slot0(slot1) do
					slot0.indexFlag[slot3] = slot4
				end

				slot1 = slot0.tmpIndexFlag2 or {}

				for slot3, slot4 in slot0(slot1) do
					slot0.indexFlag2[slot3] = slot4
				end

				slot1 = slot0.tmpIndexFlag3 or {}

				for slot3, slot4 in slot0(slot1) do
					slot0.indexFlag3[slot3] = slot4
				end

				slot0:filter()
				triggerButton(slot0.indexBtn)
				triggerButton.UIMgr:UnblurPanel(slot0.indexPanel, slot0._tf)
			end, SFX_CONFIRM)
			onButton(onButton, findTF(slot0.indexPanel, "layout/btns/cancel"), function ()
				triggerButton(slot0.indexBtn)
			end, SFX_CANCEL)
			onButton(onButton, findTF(slot0.indexPanel, "btn"), function ()
				triggerButton(slot0.indexBtn)
			end, SFX_CANCEL)
		elseif slot0.indexPanel.gameObject.activeSelf then
			LeanTween.scale(slot0.indexPanel, Vector3(0, 0, 0), 0.2):setOnComplete(System.Action(function ()
				setActive(slot0.indexPanel, false)
			end))
			slot0:animationIn()
			slot0.UIMgr:UnblurPanel(slot0.indexPanel, slot0._tf)
		else
			slot0:animationOut()
			setActive(slot0.indexPanel, true)

			slot0.indexPanel.localScale = Vector3.zero

			LeanTween.scale(slot0.indexPanel, Vector3(1, 1, 1), 0.2)
			slot0:updateIndex()
			slot0.UIMgr:BlurPanel(slot0.indexPanel)
		end
	end, SFX_PANEL)
	onToggle(slot0, findTF(slot0.topPanel, "preference_toggle"), function (slot0)
		if slot0 then
			slot0.filterTag = Ship.PREFERENCE_TAG_COMMON
		else
			slot0.filterTag = Ship.PREFERENCE_TAG_NONE
		end

		slot0:filter()
	end)
end

function slot0.updateIndex(slot0)
	for slot4, slot5 in ipairs(slot0.indexTFs) do
		triggerToggle(slot0.indexTFs[slot4], slot0.indexFlag[slot4])
	end

	for slot4, slot5 in ipairs(slot0.indexTFs2) do
		triggerToggle(slot0.indexTFs2[slot4], slot0.indexFlag2[slot4])
	end

	for slot4, slot5 in ipairs(slot0.indexTFs3) do
		triggerToggle(slot0.indexTFs3[slot4], slot0.indexFlag3[slot4])
	end

	if slot0:selectNone(slot0.indexFlag, #slot0 - 1) then
		triggerButton(slot0.indexTFAll)
	end

	if slot0:selectNone(slot0.indexFlag2, #slot1 - 1) then
		triggerButton(slot0.indexTFAll2)
	end

	if slot0:selectNone(slot0.indexFlag3, #slot2 - 1) then
		triggerButton(slot0.indexTFAll3)
	end

	triggerToggle(slot0.sortTFs[slot0.selectedSort], true)
end

function slot0.initIndex(slot0)
	slot0.indexs = findTF(slot0.indexPanel, "layout/index/panel")
	slot0.indexTpl = slot0:findTF("tpl", slot0.indexs)

	setActive(slot0.indexTpl, false)

	slot0.indexTFs = {}

	for slot4, slot5 in ipairs(slot0) do
		if slot4 == 1 then
			slot0.indexTFAll = slot0:findTF("all", slot0.indexs)

			setText(findTF(slot0.indexTFAll, "Image"), i18n(slot0[slot4]))
			onButton(slot0, slot0.indexTFAll, function ()
				for slot3, slot4 in pairs(slot0.indexTFs) do
					triggerToggle(slot4, false)
					setImageSprite(slot0.indexTFs[slot3], slot0.greySprite)
				end

				setImageSprite(slot0.indexTFAll, slot0.yellowSprite)
			end, SFX_UI_TAG)
		else
			setText(findTF(slot0.indexs:Find("index_" .. slot5) or cloneTplTo(slot0.indexTpl, slot0.indexs, slot6), "Image"), i18n(slot0[slot4]))
			GetOrAddComponent(slot0.indexs.Find("index_" .. slot5) or cloneTplTo(slot0.indexTpl, slot0.indexs, slot6), typeof(Toggle))
			onToggle(slot0, slot0.indexs.Find("index_" .. slot5) or cloneTplTo(slot0.indexTpl, slot0.indexs, slot6), function (slot0)
				slot0.tmpIndexFlag[slot1 - 1] = slot0

				if slot0:selectAll(slot0.tmpIndexFlag, #slot2 - 1) then
					triggerButton(slot0.indexTFAll)
					setImageSprite(slot0.indexTFAll, slot0.yellowSprite)
					setImageSprite(slot0.yellowSprite, slot0.greySprite)
				elseif slot0:selectNone(slot0.tmpIndexFlag, #slot2 - 1) then
					setImageSprite(slot0.indexTFAll, slot0.yellowSprite)
					setImageSprite(slot0.yellowSprite, slot0.greySprite)
				else
					setImageSprite(slot0.indexTFAll, slot0.greySprite)
					setImageSprite(slot0.greySprite, (slot0 and slot0.yellowSprite) or slot0.greySprite)
				end
			end, SFX_UI_TAG, SFX_UI_TAG)

			slot0.indexTFs[slot4 - 1] = slot0.indexs.Find("index_" .. slot5) or cloneTplTo(slot0.indexTpl, slot0.indexs, slot6)
		end
	end

	slot0.indexs2 = findTF(slot0.indexPanel, "layout/camp/panel")
	slot0.indexTpl2 = slot0:findTF("tpl", slot0.indexs2)

	setActive(slot0.indexTpl2, false)

	slot0.indexTFs2 = {}

	for slot4, slot5 in ipairs(ipairs) do
		if slot4 == 1 then
			slot0.indexTFAll2 = slot0:findTF("all", slot0.indexs2)

			setText(findTF(slot0.indexTFAll2, "Image"), i18n(slot1[slot4]))
			onButton(slot0, slot0.indexTFAll2, function ()
				for slot3, slot4 in pairs(slot0.indexTFs2) do
					triggerToggle(slot4, false)
					setImageSprite(slot0.indexTFs2[slot3], slot0.greySprite)
				end

				setImageSprite(slot0.indexTFAll2, slot0.blueSprite)
			end, SFX_UI_TAG)
		else
			setText(findTF(slot0.indexs2:Find("index_" .. slot5) or cloneTplTo(slot0.indexTpl2, slot0.indexs2, slot6), "Image"), i18n(slot1[slot4]))
			GetOrAddComponent(slot0.indexs2.Find("index_" .. slot5) or cloneTplTo(slot0.indexTpl2, slot0.indexs2, slot6), typeof(Toggle))
			onToggle(slot0, slot0.indexs2.Find("index_" .. slot5) or cloneTplTo(slot0.indexTpl2, slot0.indexs2, slot6), function (slot0)
				slot0.tmpIndexFlag2[slot1 - 1] = slot0

				if slot0 and slot0:selectAll(slot0.tmpIndexFlag2, #slot2 - 1) then
					triggerButton(slot0.indexTFAll2)
					setImageSprite(slot0.indexTFAll2, slot0.blueSprite)
					setImageSprite(slot0.blueSprite, slot0.greySprite)
				elseif slot0:selectNone(slot0.tmpIndexFlag2, #slot2 - 1) then
					setImageSprite(slot0.indexTFAll2, slot0.blueSprite)
					setImageSprite(slot0.blueSprite, slot0.greySprite)
				else
					setImageSprite(slot0.indexTFAll2, slot0.greySprite)
					setImageSprite(slot0.greySprite, (slot0 and slot0.blueSprite) or slot0.greySprite)
				end
			end, SFX_UI_TAG, SFX_UI_TAG)

			slot0.indexTFs2[slot4 - 1] = slot0.indexs2.Find("index_" .. slot5) or cloneTplTo(slot0.indexTpl2, slot0.indexs2, slot6)
		end
	end

	slot0.indexs3 = findTF(slot0.indexPanel, "layout/rarity/panel")
	slot0.indexTpl3 = slot0:findTF("tpl", slot0.indexs3)

	setActive(slot0.indexTpl3, false)

	slot0.indexTFs3 = {}

	for slot4, slot5 in ipairs(slot0.indexTpl3) do
		if slot4 == 1 then
			slot0.indexTFAll3 = slot0:findTF("all", slot0.indexs3)

			setText(findTF(slot0.indexTFAll3, "Image"), i18n(slot2[slot4]))
			onButton(slot0, slot0.indexTFAll3, function ()
				for slot3, slot4 in pairs(slot0.indexTFs3) do
					triggerToggle(slot4, false)
					setImageSprite(slot0.indexTFs3[slot3], slot0.greySprite)
				end

				setImageSprite(slot0.indexTFAll3, slot0.blueSprite)
			end, SFX_UI_TAG)
		else
			setText(findTF(slot0.indexs3:Find("index_" .. slot5) or cloneTplTo(slot0.indexTpl3, slot0.indexs3, slot6), "Image"), i18n(slot2[slot4]))
			GetOrAddComponent(slot0.indexs3.Find("index_" .. slot5) or cloneTplTo(slot0.indexTpl3, slot0.indexs3, slot6), typeof(Toggle))
			onToggle(slot0, slot0.indexs3.Find("index_" .. slot5) or cloneTplTo(slot0.indexTpl3, slot0.indexs3, slot6), function (slot0)
				slot0.tmpIndexFlag3[slot1 - 1] = slot0

				if slot0 and slot0:selectAll(slot0.tmpIndexFlag3, #slot2 - 1) then
					triggerButton(slot0.indexTFAll3)
					setImageSprite(slot0.indexTFAll3, slot0.blueSprite)
					setImageSprite(slot0.blueSprite, slot0.greySprite)
				elseif slot0:selectNone(slot0.tmpIndexFlag3, #slot2 - 1) then
					setImageSprite(slot0.indexTFAll3, slot0.blueSprite)
					setImageSprite(slot0.blueSprite, slot0.greySprite)
				else
					setImageSprite(slot0.indexTFAll3, slot0.greySprite)
					setImageSprite(slot0.greySprite, (slot0 and slot0.blueSprite) or slot0.greySprite)
				end
			end, SFX_UI_TAG, SFX_UI_TAG)

			slot0.indexTFs3[slot4 - 1] = slot0.indexs3.Find("index_" .. slot5) or cloneTplTo(slot0.indexTpl3, slot0.indexs3, slot6)
		end
	end
end

function slot0.initSort(slot0)
	slot0.sorts = findTF(slot0.indexPanel, "layout/sort/panel")
	slot0.sortTpl = slot0:findTF("tpl", slot0.sorts)

	setActive(slot0.sortTpl, false)

	slot0.sortsToggleGroup = GetOrAddComponent(slot0.sorts, typeof(ToggleGroup))
	slot0.sortTFs = {}

	for slot4, slot5 in ipairs(slot0) do
		setText(findTF(slot0.sorts:Find(slot5) or cloneTplTo(slot0.sortTpl, slot0.sorts, slot6), "Image"), slot5)

		GetOrAddComponent(slot0.sorts.Find(slot5) or cloneTplTo(slot0.sortTpl, slot0.sorts, slot6), typeof(Toggle)).group = slot0.sortsToggleGroup

		onToggle(slot0, slot0.sorts.Find(slot5) or cloneTplTo(slot0.sortTpl, slot0.sorts, slot6), function (slot0)
			if slot0 then
				slot0.tmpSort = slot0

				setImageSprite(slot0, slot0.yellowSprite)
			else
				setImageSprite(slot2, slot0.greySprite)
			end
		end, SFX_UI_TAG, SFX_UI_TAG)

		slot0.sortTFs[slot4] = slot0.sorts.Find(slot5) or cloneTplTo(slot0.sortTpl, slot0.sorts, slot6)
	end
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOsById = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1

	slot0:updateBarInfo()
end

function slot0.setFriends(slot0, slot1)
	slot0.friends = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.friends[slot6.id] = slot6
	end
end

function slot0.setWorld(slot0, slot1)
	slot0.world = slot1
end

function slot0.updateBarInfo(slot0)
	if slot0.contextData.mode == slot0.MODE_WORLD then
		setActive(slot0.leftTipsText, false)
	elseif slot0.contextData.leftTopInfo then
		setText(slot0.bottomTipsText, i18n("dock_yard_left_tips", slot0.contextData.leftTopInfo))
		setActive(slot0.leftTipsText, false)
	else
		setText(slot0.bottomTipsText, "")
		setActive(slot0.leftTipsText, true)
		setText(slot0.leftTipsText:Find("label"), i18n("ship_dockyardScene_capacity"))
		setText(slot0.leftTipsText:Find("Text"), slot0.shipsCount .. "/" .. slot0.player.ship_bag_max)
	end
end

function slot0.initWorldPanel(slot0)
	onButton(slot0, slot0.worldPanel:Find("repair_all_button"), function ()
		slot1 = 0

		for slot5, slot6 in pairs(slot0.shipVOsById) do
			if slot6.bindingData:IsBroken() or not slot7:IsHpFull() then
				table.insert(slot0, slot7.id)

				slot1 = slot1 + slot0.world:CalcRepairCost(slot7)
			end
		end

		if #slot0 == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_ship_repair_no_need"))
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("world_ship_repair_all", slot1),
				onYes = function ()
					slot0:emit(DockyardMediator.ON_SHIP_REPAIR, slot0, )
				end
			})
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.worldPanel:Find("toggle_list/repair_toggle"), function (slot0)
		if slot0 then
		end

		if #slot0.selectedIds > 0 then
			slot0:repairWorldShip(slot0.shipVOsById[slot0.selectedIds[1]])
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.worldPanel:Find("toggle_list/formation_toggle"), function (slot0)
		if slot0 then
			slot0:emit(DockyardMediator.ON_WORLD_FORMATION)
		end
	end, SFX_PANEL)
	triggerToggle(slot0.worldPanel:Find("toggle_list/repair_toggle"), true)
end

function slot0.repairWorldShip(slot0, slot1)
	slot3 = slot0.world:CalcRepairCost(slot2)

	if slot1.bindingData:IsBroken() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("world_ship_repair_2", slot1:getName(), slot3),
			onYes = function ()
				slot0:emit(DockyardMediator.ON_SHIP_REPAIR, {
					slot1.id
				}, )
			end
		})
	elseif not slot2:IsHpFull() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("world_ship_repair_1", slot1:getName(), slot3),
			onYes = function ()
				slot0:emit(DockyardMediator.ON_SHIP_REPAIR, {
					slot1.id
				}, )
			end
		})
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_ship_repair_no_need"))
	end
end

function slot0.selectNone(slot0, slot1, slot2)
	for slot6 = 1, slot2, 1 do
		if slot1[slot6] then
			return false
		end
	end

	return true
end

function slot0.selectAll(slot0, slot1, slot2)
	for slot6 = 1, slot2, 1 do
		if not slot1[slot6] then
			return false
		end
	end

	return true
end

function slot0.filter(slot0)
	if slot0.isRemouldOrUpgradeMode then
		slot0:filterForRemouldAndUpgrade()
	else
		slot0:filterCommon()
	end
end

function slot0.filterForRemouldAndUpgrade(slot0)
	slot0.shipVOs = {}
	slot1 = slot0.isFilterLockForMod
	slot2 = slot0.isFilterLevelForMod

	function slot3(slot0)
		slot1 = true

		if not slot0 and slot0.lockState == Ship.LOCK_STATE_LOCK then
			slot1 = false
		end

		if not slot1 and slot0.level > 1 then
			slot1 = false
		end

		return slot1
	end

	for slot7, slot8 in pairs(slot0.shipVOsById) do
		if slot3(slot8) then
			table.insert(slot0.shipVOs, slot8)
		end
	end

	table.sort(slot0.shipVOs, function (slot0, slot1)
		slot2 = (slot0:isTestShip() and 1) or 0
		slot3 = (slot1:isTestShip() and 1) or 0

		if slot0.level == slot1.level then
			return slot3 < slot2
		else
			return slot0.level < slot1.level
		end
	end)
	slot0:updateShipCount(0)
end

function slot0.filterCommon(slot0)
	slot0.shipVOs = {}
	slot1 = slot0.selectedSort

	for slot5, slot6 in pairs(slot0.shipVOsById) do
		if slot0.contextData.blockLock and slot6:GetLockState() == Ship.LOCK_STATE_LOCK then
		elseif slot0.teamTypeFilter and slot6:getTeamType() ~= slot0.teamTypeFilter then
		elseif (slot0:selectNone(slot0.indexFlag, #slot0 - 1) or slot0.indexFlag[slot1[slot6:getShipType()] + 2] or slot0.indexFlag[slot2[slot6:getTeamType()]]) and (slot0:selectNone(slot0.indexFlag2, #slot3 - 1) or slot0.indexFlag2[slot4[slot6:getConfig("nationality")]] or ((slot6:getConfig("nationality") == 0 or Nation.IsLinkType(slot6:getNation())) and slot0.indexFlag2[#slot0.indexFlag2])) and (slot0:selectNone(slot0.indexFlag3, #slot5 - 1) or slot0.indexFlag3[slot6[slot6:getRarity()]]) and (slot0.filterTag == Ship.PREFERENCE_TAG_NONE or slot0.filterTag == slot6:GetPreferenceTag()) then
			table.insert(slot0.shipVOs, slot6)
		end
	end

	slot2 = nil

	if slot1 == 3 then
		IndexConst.combatPowerCaches = {}
		slot2 = (slot0.selectAsc and IndexConst.sortByCombatPowerAsc) or IndexConst.sortByCombatPower
	elseif slot1 == 1 then
		slot2 = (slot0.selectAsc and IndexConst.sortByCfgAsc("rarity")) or IndexConst.sortByCfg("rarity")
	elseif slot1 == 2 or slot1 == 4 then
		slot2 = (slot0.selectAsc and IndexConst.sortByFieldAsc(({
			"",
			"level",
			"",
			"createTime"
		})[slot1])) or IndexConst.sortByField(()[slot1])
	else
		slot2 = (slot0.selectAsc and IndexConst.sortByPropertyAsc(({
			"durability",
			"cannon",
			"torpedo",
			"air",
			"antiaircraft",
			"antisub"
		})[slot1 - 4])) or IndexConst.sortByProperty(()[slot1 - 4])
	end

	if slot2 then
		table.sort(slot0.shipVOs, function (slot0, slot1)
			if pg.GuideMgr.GetInstance():isRuning() then
				return IndexConst.sortForGuider(slot0, slot1)
			elseif slot0.isFormTactics then
				return IndexConst.sortByPriorityFullSkill(slot0, slot1, slot1)
			elseif slot0.mode == slot2.MODE_OVERVIEW or slot0.mode == slot2.MODE_SELECT then
				if slot0.activityNpc == slot1.activityNpc then
					return slot1(slot0, slot1)
				else
					return slot1.activityNpc < slot0.activityNpc
				end
			else
				return slot1(slot0, slot1)
			end
		end)
	end

	if slot0.contextData.quitTeam then
		table.insert(slot0.shipVOs, 1, false)
	end

	if slot7.MODE_OVERVIEW == slot0.mode and DockyardScene.value then
		slot0:updateShipCount(DockyardScene.value or 0)

		DockyardScene.value = nil
	else
		slot0:updateShipCount(0)
	end

	slot0:updateSelected()
	setActive(slot0.sortImgAsc, slot0.selectAsc)
	setActive(slot0.sortImgDesc, not slot0.selectAsc)
	setText(slot0:findTF("Image", slot0.sortBtn), slot8[slot1])
end

function slot0.didEnter(slot0)
	setActive(go(slot0.shipContainer).transform:Find("ships"), true)
	pg.UIMgr.GetInstance():OverlayPanel(slot0.blurPanel)
	setActive(slot0:findTF("stamp", slot0.topPanel), getProxy(TaskProxy):mingshiTouchFlagEnabled())
	onButton(slot0, slot0:findTF("stamp", slot0.topPanel), function ()
		getProxy(TaskProxy):dealMingshiTouchFlag(1)
	end, SFX_CONFIRM)
	onButton(slot0, slot0:findTF("back", slot0.topPanel), function ()
		slot0:back()
	end, SFX_CANCEL)
	onButton(slot0, slot0.sortBtn, function ()
		slot0.selectAsc = not slot0.selectAsc

		slot0:filter()
	end, SFX_UI_CLICK)
	eachChild(slot0:findTF("attr_toggle", slot0.topPanel):GetComponent("Button"), function (slot0)
		setActive(slot0, false)
	end)

	slot0.isFormTactics = slot0.contextData.prevPage == "NavalTacticsMediator"
	slot2 = slot0:findTF("off", slot1):GetComponent("Image")
	slot3 = slot0:findTF("on", slot1):GetComponent("Image")

	if slot0.isFormTactics then
		GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "skill_off", slot2)
		GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "skill_on", slot3)
	else
		GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "attr_off", slot2)
		GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "attr_on", slot3)
	end

	if slot0.isRemouldOrUpgradeMode then
		slot4 = getProxy(SettingsProxy)
		slot0.isFilterLevelForMod = slot4:GetDockYardLevelBtnFlag()

		slot0:OnSwitch(slot0.modLeveFilter, slot0.isFilterLevelForMod, function (slot0)
			slot0.isFilterLevelForMod = slot0

			slot0:filterForRemouldAndUpgrade()
		end)

		slot0.isFilterLockForMod = slot4:GetDockYardLockBtnFlag()

		slot0:OnSwitch(slot0.modLockFilter, slot0.isFilterLockForMod, function (slot0)
			slot0.isFilterLockForMod = slot0

			slot0:filterForRemouldAndUpgrade()
		end)
	end

	onButton(slot0, slot1, function ()
		if not slot0.isFormTactics then
			slot0.itemDetailType = (slot0.itemDetailType + 1) % 4
		else
			slot0.itemDetailType = (slot0.itemDetailType == DockyardShipItem.DetailType0 and DockyardShipItem.DetailType3) or DockyardShipItem.DetailType0
		end

		slot0(slot1, slot0.itemDetailType ~= DockyardShipItem.DetailType0)
		slot0(slot0.itemDetailType ~= DockyardShipItem.DetailType0, slot0.itemDetailType == DockyardShipItem.DetailType0)

		slot0.targetGraphic = (slot0.itemDetailType == DockyardShipItem.DetailType0 and slot0.itemDetailType == DockyardShipItem.DetailType0) or slot0.itemDetailType ~= DockyardShipItem.DetailType0

		slot0:updateItemDetailType()
	end, SFX_PANEL)
	triggerButton(slot1)
	onButton(slot0, findTF(slot0.selectPanel, "cancel_button"), function ()
		if slot0.animating then
			return
		end

		if slot0.mode == slot1.MODE_DESTROY then
			if #slot0.selectedIds > 0 then
				slot0:unselecteAllShips()
				slot0.unselecteAllShips:back()
			else
				slot0:back()
			end
		else
			slot0:back()

			return
		end
	end, SFX_CANCEL)
	onButton(slot0, findTF(slot0.selectPanel, "confirm_button"), function ()
		if slot0.animating then
			return
		end

		if #slot0.selectedIds < slot0.selectedMin then
			if slot0.leastLimitMsg then
				pg.TipsMgr.GetInstance():ShowTips(slot0.leastLimitMsg)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_dockyardScene_error_choiseRoleMore", slot0.selectedMin))
			end

			return
		end

		if slot0.mode == slot1.MODE_DESTROY then
			slot0:displayDestroyPanel()
		else
			if not slot0.confirmSelect then
				if slot0.callbackQuit then
					slot0.onSelected(slot0.selectedIds, function ()
						slot0:back()
					end)
				else
					slot0.onSelected(slot0.selectedIds)
					slot0.onSelected:back()
				end
			else
				slot0.confirmSelect(slot0.selectedIds, function ()
					slot0.onSelected(slot0.selectedIds)
					slot0.onSelected:back()
				end, function ()
					slot0:back()
				end)
			end

			return
		end
	end, SFX_CONFIRM)
	slot0:filter()
	slot0:updateBarInfo()

	if slot0.contextData.mode == slot0.MODE_WORLD then
		slot0:initWorldPanel()
	end

	if not slot0.contextData.selectFriend then
		if slot0.contextData.prevFlag then
			if not slot0.lastActiveShip then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_dockyardScene_noRole"))

				return
			end

			slot0.shipContainer:BeginLayout()

			rtf(slot0.shipContainer).offsetMin = Vector2.New(520, 0)
			slot0.shipContainer:GetComponentInChildren(typeof(GridLayoutGroup)).constraintCount = 4

			slot0.shipContainer:EndLayout()
		else
			slot0.shipContainer:BeginLayout()

			rtf(slot0.shipContainer).offsetMin = Vector2.New(0, 0)
			slot0.shipContainer:GetComponentInChildren(typeof(GridLayoutGroup)).constraintCount = 7

			slot0.shipContainer:EndLayout()
		end
	end

	setAnchoredPosition(slot0.topPanel, {
		y = slot0.topPanel.rect.height
	})
	setAnchoredPosition(slot0.selectPanel, {
		y = -1 * slot0.selectPanel.rect.height
	})
	onNextTick(function ()
		if slot0.exited then
			return
		end

		slot0:uiStartAnimating()
	end)

	if slot0.contextData.selectShipId then
		slot0.selectedIds = {}

		table.insert(slot0.selectedIds, slot0.contextData.selectShipId)
		slot0:updateSelected()
	end
end

function slot0.OnSwitch(slot0, slot1, slot2, slot3)
	onButton(slot0, slot1, function ()
		slot0 = not slot0

		if slot1 then
			slot1(slot1)
		end

		slot2()
	end, SFX_PANEL)
	function ()
		setActive(slot0:Find("off"), not slot1)
		setActive(slot0:Find("on"), )
	end()
end

function slot0.onBackPressed(slot0)
	if slot0.indexPanel and LeanTween.isTweening(go(slot0.indexPanel)) then
		return
	end

	if slot0.destoryPanel and isActive(slot0.destoryPanel) then
		slot0:closeDestroyPanel()

		return
	end

	if slot0.indexPanel and slot0.indexPanel.gameObject.activeSelf then
		playSoundEffect(SFX_CANCEL)
		triggerButton(slot0.indexBtn)
	else
		playSoundEffect(SFX_CANCEL)
		slot0:back()
	end
end

function slot0.hasEliteShips(slot0, slot1, slot2)
	function slot4(slot0, slot1)
		if not _.include(slot0, slot0) then
			slot0[slot1] = slot0
		end
	end

	_.each(slot1, function (slot0)
		if slot0[slot0].level > 1 then
			slot1(i18n("destroy_high_level_tip"), 2)
		end

		if slot1:getRarity() >= 4 then
			slot1(i18n("destroy_high_rarity_tip"), 1)
		end
	end)

	return {
		"",
		""
	}
end

function slot0.updateShipStatusById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.scrollItems) do
		if slot6.shipVO and slot6.shipVO.id == slot1 then
			slot6:flush()
		end
	end
end

function slot0.checkDestroyGold(slot0, slot1)
	slot2 = 0
	slot3 = 0

	for slot7, slot8 in ipairs(slot0.selectedIds) do
		slot10, slot11 = slot0.shipVOsById[slot8].calReturnRes(slot9)
		slot2 = slot2 + slot10
		slot3 = slot3 + slot11
	end

	if slot1 then
		slot4, slot5 = slot1:calReturnRes()
		slot2 = slot2 + slot4
		slot3 = slot3 + slot5
	end

	slot4 = slot0.player:OilMax(slot3)

	if slot0.player:GoldMax(slot2) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_retire"))

		return false, not slot4
	end

	return true, not slot4
end

function slot0.selectShip(slot0, slot1)
	function slot2()
		slot1 = nil

		for slot5, slot6 in ipairs(slot0.selectedIds) do
			if slot6 == slot1.id then
				slot0 = true
				slot1 = slot5

				break
			end
		end

		return slot0, slot1
	end

	function slot3()
		slot0, slot1 = slot0()

		if not slot0 then
			slot2, slot3 = slot1.checkShip(slot1.checkShip, function ()
				if not slot0.exited then
					slot0:selectShip(slot0)
				end
			end, slot1.selectedIds)

			if not slot2 then
				if slot3 then
					pg.TipsMgr.GetInstance():ShowTips(slot3)
				end

				return
			end

			if slot1.selectedMax == 0 or #slot1.selectedIds < slot1.selectedMax then
				slot1:updateBlackBlocks(slot1.onPassShip(slot2, slot1.shipVOsById))
				table.insert(slot1.selectedIds, slot2.id)
			elseif slot1.selectedMax == 1 then
				slot1:updateBlackBlocks(slot1.onPassShip(slot2, slot1.shipVOsById))

				slot1.selectedIds[1] = slot2.id
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_dockyardScene_error_choiseRoleLess", slot1.selectedMax))

				return
			end
		else
			slot2, slot3 = slot1.onCancelShip(slot1.onCancelShip, function ()
				if not slot0.exited then
					slot0:selectShip(slot0)
				end
			end, slot1.selectedIds)

			if not slot2 then
				if slot3 then
					pg.TipsMgr.GetInstance():ShowTips(slot3)
				end

				return
			end

			slot1:updateBlackBlocks(slot1.onRemoveShip(slot2, slot1.shipVOsById))
			table.remove(slot1.selectedIds, slot1)
		end

		slot1:updateSelected()

		if slot1.mode == slot1.MODE_DESTROY then
			slot1:updateDestroyRes()
		elseif slot1.mode == slot3.MODE_MOD then
			slot1:updateModAttr()
		end
	end

	if slot0.mode == slot0.MODE_DESTROY then
		slot4, slot5 = slot0:checkDestroyGold(slot1)

		if not slot4 then
			return
		end

		if not slot5 and not slot2() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("oil_max_tip_title") .. i18n("resource_max_tip_retire_1"),
				onYes = function ()
					slot0()
				end
			})

			return
		end
	end

	slot3()
end

function slot0.updateBlackBlocks(slot0, slot1)
	if not slot1 or #slot1 < 0 then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		if slot0.shipVOsById[slot6] then
			for slot10, slot11 in pairs(slot0.scrollItems) do
				if slot11.shipVO and slot11.shipVO.id == slot6 then
					slot11:update(slot0.shipVOsById[slot6])
					slot11:updateBlackBlock()

					break
				end
			end
		end
	end
end

function slot0.unselecteAllShips(slot0)
	slot0.selectedIds = {}

	slot0:updateSelected()
end

function slot0.initBlackBlocks(slot0)
	for slot4, slot5 in ipairs(slot0.selectedIds) do
		slot0:updateBlackBlocks(slot0.onPassShip(slot0.shipVOsById[slot5], slot0.shipVOsById))
	end
end

function slot0.updateSelected(slot0)
	for slot4, slot5 in pairs(slot0.scrollItems) do
		if slot5.shipVO then
			slot6 = false

			for slot10, slot11 in ipairs(slot0.selectedIds) do
				if slot5.shipVO.id == slot11 then
					slot6 = true

					break
				end
			end

			slot5:updateSelected(slot6)
		end
	end

	if slot0.selectedMax == 0 then
		setText(findTF(slot0.selectPanel, "bottom_info/bg_input/count"), #slot0.selectedIds)
	else
		slot1 = #slot0.selectedIds

		if slot0.contextData.mode ~= slot0.MODE_DESTROY or #slot0.selectedIds == 0 then
			slot1 = setColorStr(#slot0.selectedIds, COLOR_WHITE)
		elseif slot0.contextData.mode == slot0.MODE_DESTROY then
			setText(findTF(slot0.selectPanel, "bottom_info/bg_input/count"), ((#slot0.selectedIds == 10 and setColorStr(#slot0.selectedIds, COLOR_RED)) or setColorStr(#slot0.selectedIds, COLOR_GREEN)) .. "/" .. slot0.selectedMax)
		end
	end

	if #slot0.selectedIds < slot0.selectedMin then
		setActive(findTF(slot0.selectPanel, "confirm_button/mask"), true)
	else
		setActive(findTF(slot0.selectPanel, "confirm_button/mask"), false)
	end

	if slot0.contextData.mode == slot0.MODE_MOD then
		slot0:updateModAttr()
	end
end

function slot0.updateItemDetailType(slot0)
	for slot4, slot5 in pairs(slot0.scrollItems) do
		slot5:updateDetail(slot0.itemDetailType)
	end

	slot0.shipLayout.anchoredPosition = slot0.shipLayout.anchoredPosition + Vector3(0, 0.001, 0)
end

function slot0.closeDestroyMode(slot0)
	setActive(slot0.awardTF, false)
	setActive(slot0.bottomTipsText, true)
end

function slot0.updateDestroyRes(slot0, slot1)
	if table.getCount(slot0.selectedIds) == 0 then
		slot0:closeDestroyMode()
	else
		setActive(slot0.awardTF, true)
		setActive(slot0.bottomTipsText, false)
	end

	slot2 = 0
	slot3 = 0
	slot4 = 0

	for slot8, slot9 in ipairs(slot0.selectedIds) do
		slot11, slot12, slot13 = slot0.shipVOsById[slot9].calReturnRes(slot10)
		slot2 = slot2 + slot11
		slot3 = slot3 + slot12
		slot4 = slot4 + slot13
	end

	if not slot1 then
		setText(slot0.goldTF, slot2)
		setText(slot0.oilTF, slot3)
		setText(slot0.medalTF, slot4)
	else
		setText(slot0.destoryGoldText, slot2)
		setText(slot0.destoryMedalText, slot4)
		setText(slot0.destoryOilText, slot3)
	end
end

function slot0.setModShip(slot0, slot1)
	slot0.modShip = slot1
end

function slot0.updateModAttr(slot0)
	if table.getCount(slot0.selectedIds) == 0 then
		slot0:closeModAttr()
	else
		setActive(slot0.modAttrsTF, true)
		setActive(slot0.bottomTipsText, false)
	end

	slot1 = slot0.contextData.ignoredIds[1]
	slot2 = {}

	for slot6, slot7 in ipairs(slot0.selectedIds) do
		table.insert(slot2, slot0.shipVOsById[slot7])
	end

	slot3 = ShipModLayer.getModExpAdditions(slot0.modShip, slot2)

	for slot7, slot8 in pairs(ShipModAttr.ID_TO_ATTR) do
		if slot7 ~= ShipModLayer.IGNORE_ID then
			slot9 = slot0.modAttrContainer:Find("attr_" .. slot7)

			setText(slot9:Find("value"), slot3[slot8])
			setText(slot9:Find("name"), ShipModAttr.id2Name(slot7))
		end
	end
end

function slot0.closeModAttr(slot0)
	setActive(slot0.modAttrsTF, false)
	setActive(slot0.bottomTipsText, true)
end

function slot0.removeShip(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.selectedIds) do
		if slot6 == slot1 then
			table.remove(slot0.selectedIds, slot5)

			break
		end
	end

	for slot5 = #slot0.shipVOs, 1, -1 do
		if slot0.shipVOs[slot5].id == slot1 then
			table.remove(slot0.shipVOs, slot5)

			break
		end
	end

	slot0.shipVOsById[slot1] = nil
end

function slot0.updateShipCount(slot0, slot1)
	slot0.shipContainer:SetTotalCount(#slot0.shipVOs, defaultValue(slot1, -1))
	setActive(slot0.listEmptyTF, #slot0.shipVOs <= 0)
end

function slot0.unPartialBlur(slot0)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.blurPanel, slot0._tf)
end

function slot0.ClearShipsBlackBlock(slot0)
	if not slot0.shipVOsById then
		return
	end

	for slot4, slot5 in pairs(slot0.shipVOsById) do
		slot5.blackBlock = false
	end
end

function slot0.willExit(slot0)
	slot0:closeDestroyMode()
	slot0:closeDestroyPanel()
	slot0:closeModAttr()
	slot0:ClearShipsBlackBlock()

	if slot0.mode == slot0.MODE_MOD then
	elseif not slot0.contextData.sortData then
		if _G[slot0.contextData.preView] then
			_G[slot0.contextData.preView].dockSort = slot0.selectedSort
			_G[slot0.contextData.preView].dockAsc = slot0.selectAsc
			_G[slot0.contextData.preView].dockIndexFlag = slot0.indexFlag
			_G[slot0.contextData.preView].dockIndexFlag2 = slot0.indexFlag2
			_G[slot0.contextData.preView].dockIndexFlag3 = slot0.indexFlag3
			_G[slot0.contextData.preView].filterTag = slot0.filterTag
		else
			DockyardScene.selectedSort = slot0.selectedSort
			DockyardScene.selectAsc = slot0.selectAsc
			DockyardScene.indexFlag = slot0.indexFlag
			DockyardScene.indexFlag2 = slot0.indexFlag2
			DockyardScene.indexFlag3 = slot0.indexFlag3
			DockyardScene.filterTag = slot0.filterTag
		end
	end

	for slot4, slot5 in pairs(slot0.scrollItems) do
		slot5:clear()
	end

	if LeanTween.isTweening(go(slot0.energyDescTF)) then
		setActive(slot0.energyDescTF, false)
		LeanTween.cancel(go(slot0.energyDescTF))
	end

	slot0:cancelAnimating()

	if slot0.isRemouldOrUpgradeMode then
		slot1 = getProxy(SettingsProxy)

		slot1:SetDockYardLockBtnFlag(slot0.isFilterLockForMod)
		slot1:SetDockYardLevelBtnFlag(slot0.isFilterLevelForMod)
	end
end

function slot0.animationOut(slot0)
	if slot0.onSelect then
		shiftPanel(slot0.selectPanel, nil, -1 * slot0.selectPanel.rect.height, 0.3, 0, true, true)
	end

	shiftPanel(slot0.topPanel, nil, slot0.topPanel.rect.height, 0.3, 0, true, true)
end

function slot0.animationIn(slot0)
	if slot0.onSelect then
		shiftPanel(slot0.selectPanel, nil, 0, 0.3, 0, true, true)
	end

	shiftPanel(slot0.topPanel, nil, 0, 0.3, 0, true, true)
end

function slot0.uiStartAnimating(slot0)
	slot1 = slot0:findTF("back", slot0.topPanel)
	slot2 = 0
	slot3 = 0.3

	if slot0.mode == slot0.MODE_OVERVIEW then
	else
		slot0.onSelect = true

		shiftPanel(slot0.selectPanel, nil, 0, slot3, slot2, true, true)
	end

	if not slot0.contextData.leftTopInfo and not slot0.contextData.mode == slot0.MODE_WORLD then
		setActive(slot0.leftTipsText, false)

		for slot7 = 1, 3, 1 do
			LeanTween.delayedCall(0.4 + 0.1 * slot7, System.Action(function ()
				if slot0.leftTipsText then
					setActive(slot0.leftTipsText, not go(slot0.leftTipsText).activeSelf)
				end
			end))
		end
	end
end

function slot0.uiExitAnimating(slot0)
	if slot0.mode == slot0.MODE_OVERVIEW then
	else
		shiftPanel(slot0.selectPanel, nil, -1 * slot0.selectPanel.rect.height, 0.3, 0, true, true)
	end
end

function slot0.back(slot0)
	if slot0.exited then
		return
	end

	slot0:closeView()
end

function slot0.cancelAnimating(slot0)
	if LeanTween.isTweening(go(slot0.topPanel)) then
		LeanTween.cancel(go(slot0.topPanel))
	end

	if LeanTween.isTweening(go(slot0.selectPanel)) then
		LeanTween.cancel(go(slot0.selectPanel))
	end

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end
end

function slot0.displayDestroyPanel(slot0)
	if not slot0.destoryPanel then
		slot0.destoryPanel = slot0:findTF("DestoryInfoUI")

		if not slot0.destoryPanel then
			PoolMgr.GetInstance():GetPrefab("ui/destoryinfoui", "", false, function (slot0)
				setName(slot0, "DestoryInfoUI")
				setParent(slot0, slot0._tf, false)

				slot0.destoryPanel = slot0
			end)
		end
	end

	onButton(slot0, slot0:findTF("DestoryInfoUI/frame/confirm_button"), function ()
		slot1, slot2 = slot0:checkDestroyGold()

		if not slot2 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("oil_max_tip_title") .. i18n("resource_max_tip_retire_1"),
				onYes = function ()
					slot0()
				end
			})

			return
		end

		slot0()
	end, SFX_UI_BUILDING_RETIRE)
	onButton(slot0, slot0:findTF("DestoryInfoUI/frame/cancel_button"), function ()
		slot0:closeDestroyPanel()
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("DestoryInfoUI/frame/top/btnBack"), function ()
		slot0:closeDestroyPanel()
	end, SFX_CANCEL)

	slot0.destoryShipContent = slot0:findTF("DestoryInfoUI/frame/sliders/content")
	slot0.destoryGoldText = slot0:findTF("DestoryInfoUI/frame/bg_award/gold/Text")
	slot0.destoryMedalText = slot0:findTF("DestoryInfoUI/frame/bg_award/medal/Text")
	slot0.destoryOilText = slot0:findTF("DestoryInfoUI/frame/bg_award/oil/Text")

	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.blurPanel, slot0._tf)
	slot0.UIMgr:BlurPanel(tf(slot0.destoryPanel))
	slot0:initDestoryShips()
	setActive(slot0.destoryPanel, true)

	slot0.isOpenDestory = true

	slot0:updateDestroyRes(true)
end

function slot0.initDestoryShips(slot0)
	if not slot0.selectedIds or table.getCount(slot0.selectedIds) == 0 then
		return
	end

	for slot5 = slot0.destoryShipContent.childCount, #slot0.selectedIds - 1, 1 do
		cloneTplTo(slot0.shipContainer.prefabItem, slot0.destoryShipContent)
	end

	for slot5 = 1, slot0.destoryShipContent.childCount, 1 do
		slot6 = slot0.selectedIds[slot5]

		setActive(slot0.destoryShipContent:GetChild(slot5 - 1), slot5 <= #slot0.selectedIds)

		if slot5 <= #slot0.selectedIds then
			slot8 = DockyardShipItem.New(slot7.gameObject)

			slot8:update(slot0.shipVOsById[slot6])
			onButton(slot0, slot8.tr, function ()
				for slot3, slot4 in ipairs(slot0.selectedIds) do
					if slot1.shipVO.id == slot4 then
						slot1:clear()
						setActive(slot1.go, false)
						table.remove(slot0.selectedIds, slot3)
						slot0:updateDestroyRes(true)
						slot0:updateDestroyRes()
						slot0:updateSelected()

						if table.getCount(slot0.selectedIds) == 0 then
							slot0:closeDestroyPanel()
						end

						break
					end
				end
			end)
		end
	end
end

function slot0.closeDestroyPanel(slot0)
	if slot0.isOpenDestory then
		pg.UIMgr.GetInstance():OverlayPanel(slot0.blurPanel)
		pg.UIMgr.GetInstance():UnblurPanel(tf(slot0.destoryPanel), slot0._tf)
		setActive(slot0.destoryPanel, false)

		slot0.isOpenDestory = nil
	end
end

return slot0
