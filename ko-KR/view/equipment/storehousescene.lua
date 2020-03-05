slot0 = class("StoreHouseScene", import("..base.BaseUI"))
slot1 = 1
slot2 = 0
slot3 = 1

function slot0.getUIName(slot0)
	return "StoreHouseUI"
end

function slot0.setEquipments(slot0, slot1)
	slot0.equipmentVOs = slot1

	slot0:setEquipmentByIds(slot1)
end

function slot0.setEquipmentByIds(slot0, slot1)
	slot0.equipmentVOByIds = {}

	for slot5, slot6 in pairs(slot1) do
		if not slot6.isSkin then
			slot0.equipmentVOByIds[slot6.id] = slot6
		end
	end
end

slot4 = require("view.equipment.EquipmentSortCfg")

function slot0.init(slot0)
	slot1 = slot0.contextData
	slot0.topItems = slot0:findTF("topItems")
	slot0.equipmentView = slot0:findTF("equipment_scrollview")
	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0.topPanel = slot0:findTF("adapt/top", slot0.blurPanel)
	slot0.indexBtn = slot0:findTF("buttons/index_button", slot0.topPanel)
	slot0.indexPanel = slot0:findTF("index", slot0.topItems)
	slot0.indexContain = slot0:findTF("adapt/mask/panel", slot0.indexPanel)
	slot0.indexTpl = slot0:findTF("tpl", slot0.indexContain)

	setActive(slot0.indexTpl, false)

	slot0.sortBtn = slot0:findTF("buttons/sort_button", slot0.topPanel)
	slot0.sortPanel = slot0:findTF("sort", slot0.topItems)
	slot0.sortContain = slot0:findTF("adapt/mask/panel", slot0.sortPanel)
	slot0.sortTpl = slot0:findTF("tpl", slot0.sortContain)

	setActive(slot0.sortTpl, false)

	slot0.equipSkinFilteBtn = slot0:findTF("buttons/EquipSkinFilteBtn", slot0.topPanel)
	slot0.itemView = slot0:findTF("item_scrollview")
	slot2 = false
	slot3 = getProxy(SettingsProxy)

	if NotchAdapt.CheckNotchRatio == 2 or not slot3:CheckLargeScreen() then
		slot2 = slot0.itemView.rect.width > 2000
	else
		slot0.equipmentView:Find("equipment_grid"):GetComponent(typeof(GridLayoutGroup)).constraintCount = (NotchAdapt.CheckNotchRatio >= 2 and 8) or 7
		slot0.itemView:Find("item_grid"):GetComponent(typeof(GridLayoutGroup)).constraintCount = (NotchAdapt.CheckNotchRatio >= 2 and 8) or 7
		slot0.decBtn = findTF(slot0.topPanel, "buttons/dec_btn")
		slot0.sortImgAsc = findTF(slot0.decBtn, "asc")
		slot0.sortImgDec = findTF(slot0.decBtn, "desc")
		slot0.equipmentBtn = slot0:findTF("blur_panel/adapt/left_length/frame/toggle_root/equipment")
		slot0.equipmentSkinBtn = slot0:findTF("blur_panel/adapt/left_length/frame/toggle_root/skin")
		slot0.filterBusyToggle = slot0:findTF("blur_panel/adapt/left_length/frame/toggle_equip")

		setActive(slot0.filterBusyToggle, false)

		slot0.bottomBack = slot0:findTF("bottom_back", slot0.topItems)
		slot0.bottomPanel = slot0:findTF("types", slot0.bottomBack)
		slot0.materialToggle = slot0.bottomPanel:Find("material")
		slot0.weaponToggle = slot0.bottomPanel:Find("weapon")
		slot0.designToggle = slot0.bottomPanel:Find("design")
		slot0.capacityTF = slot0:findTF("bottom_left/tip/capcity/Text", slot0.bottomBack)
		slot0.tipTF = slot0:findTF("bottom_left/tip", slot0.bottomBack)
		slot0.tip = slot0.tipTF:Find("label")
		slot0.helpBtn = slot0:findTF("help_btn", slot0.topItems)

		setActive(slot0.helpBtn, true)

		slot0.backBtn = slot0:findTF("blur_panel/adapt/top/back_btn")
		slot0.selectedMin = defaultValue(slot1.selectedMin, 1)
		slot0.selectedMax = defaultValue(slot1.selectedMax, pg.gameset.equip_select_limit.key_value or 0)
		slot0.selectedIds = Clone(slot1.selectedIds or {})
		slot0.checkEquipment = slot1.onEquipment or function (slot0)
			return true
		end
		slot0.onSelected = slot1.onSelected or function ()
			warning("not implemented.")
		end
		slot0.BatchDisposeBtn = slot0:findTF("dispos", slot0.bottomPanel)
	end

	if not slot0.BatchDisposeBtn then
		slot0.BatchDisposeBtn = slot0:findTF("dispos", slot0.bottomBack)
	end

	slot0.selectPanel = slot0:findTF("select_panel", slot0.topItems)

	setActive(slot0.selectPanel, true)
	setAnchoredPosition(slot0.selectPanel, {
		y = -124
	})

	slot0.selectEnabled = false
	slot0.listEmptyTF = slot0:findTF("empty")

	setActive(slot0.listEmptyTF, false)

	slot0.listEmptyTxt = slot0:findTF("Text", slot0.listEmptyTF)
end

function slot0.setEquipment(slot0, slot1)
	slot0.equipmentVOByIds[slot1.id] = slot1
	slot2 = true

	for slot6, slot7 in pairs(slot0.equipmentVOs) do
		if slot7.id == slot1.id and not slot7.shipId then
			slot0.equipmentVOs[slot6] = slot1
			slot2 = false
		end
	end

	if slot2 then
		table.insert(slot0.equipmentVOs, slot1)
	end

	if slot0.contextData.warp == StoreHouseConst.WARP_TO_WEAPON then
		slot0:filterEquipment()
		slot0:updateCapacity()
	end
end

function slot0.removeEquipment(slot0, slot1)
	slot0.equipmentVOByIds[slot1] = nil

	for slot5 = #slot0.equipmentVOs, 1, -1 do
		if slot0.equipmentVOs[slot5].id == slot1 then
			table.remove(slot0.equipmentVOs, slot5)
		end
	end

	if slot0.contextData.warp == StoreHouseConst.WARP_TO_WEAPON then
		slot0:filterEquipment()
		slot0:updateCapacity()
	end
end

function slot0.setEquipmentSkin(slot0, slot1)
	slot2 = true

	for slot6, slot7 in pairs(slot0.equipmentVOs) do
		if slot7.id == slot1.id and slot7.isSkin then
			slot0.equipmentVOs[slot6] = {
				isSkin = true,
				id = slot1.id,
				count = slot1.count
			}
			slot2 = false
		end
	end

	if slot2 then
		table.insert(slot0.equipmentVOs, {
			isSkin = true,
			id = slot1.id,
			count = slot1.count
		})
	end

	if slot0.contextData.warp == StoreHouseConst.WARP_TO_WEAPON then
		slot0:filterEquipment()
		slot0:updateCapacity()
	end
end

function slot0.didEnter(slot0)
	slot0.warp = slot0.contextData.warp or StoreHouseConst.WARP_TO_MATERIAL
	slot0.contextData.warp = nil

	setText(slot0:findTF("tip", slot0.selectPanel), i18n("equipment_select_device_destroy_tip"))
	setActive(slot0:findTF("stamp", slot0.topItems), getProxy(TaskProxy):mingshiTouchFlagEnabled())
	onButton(slot0, slot0:findTF("stamp", slot0.topItems), function ()
		getProxy(TaskProxy):dealMingshiTouchFlag(2)
	end, SFX_CONFIRM)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = (slot0.page ~=  or pg.gametip.help_equipment_skin.tip) and pg.gametip.help_equipment.tip
		})
	end, SFX_PANEL)

	slot0.page = (slot0.contextData.mode == StoreHouseConst.SKIN and slot0) or slot0.contextData.warp or StoreHouseConst.WARP_TO_MATERIAL

	onToggle(slot0, slot0.equipmentBtn, function (slot0)
		if slot0 then
			slot0.page = slot0

			slot0:updatePageFilterButtons(slot0.page)
			slot0:filterEquipment()
			slot1(slot0.BatchDisposeBtn, slot0.page == setActive)
			slot1(slot0.capacityTF.parent, slot0.page == setActive)
			setActive(slot0.indexBtn, true)
			setActive(slot0.sortBtn, true)
			setActive(slot0.equipSkinFilteBtn, false)
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.equipmentSkinBtn, function (slot0)
		if slot0 then
			slot0.page = slot0

			slot0:updatePageFilterButtons(slot0.page)
			slot0:filterEquipment()
			setActive(slot2, slot0.page == slot0.BatchDisposeBtn)
			setActive(slot2, slot0.page == slot0.capacityTF.parent)
			setActive(slot0.indexBtn, false)
			setActive(slot0.sortBtn, false)
			setActive(slot0.equipSkinFilteBtn, true)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		if slot0.selectEnabled then
			triggerButton(slot0.BatchDisposeBtn)

			return
		end

		GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).interactable = false

		slot0:emit(slot1.ON_BACK)
	end, SFX_CANCEL)
	onToggle(slot0, slot0.sortBtn, function (slot0)
		if slot0 then
			pg.UIMgr.GetInstance():OverlayPanel(slot0.sortPanel, {
				groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
			})
			setActive(slot0.sortPanel, true)
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(slot0.sortPanel, slot0.topItems)
			setActive(slot0.sortPanel, false)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.sortPanel, function ()
		triggerToggle(slot0.sortBtn, false)
	end, SFX_PANEL)
	onToggle(slot0, slot0.indexBtn, function (slot0)
		if slot0 then
			pg.UIMgr.GetInstance():OverlayPanel(slot0.indexPanel, {
				groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
			})
			setActive(slot0.indexPanel, true)
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(slot0.indexPanel, slot0.topItems)
			setActive(slot0.indexPanel, false)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.indexPanel, function ()
		triggerToggle(slot0.indexBtn, false)
	end, SFX_PANEL)
	onButton(slot0, slot0.equipSkinFilteBtn, function ()
		slot0.equipSkinSort = slot0.equipSkinSort or IndexConst.EquipSkinSortType
		slot0.equipSkinIndex = slot0.equipSkinIndex or IndexConst.Flags2Bits({
			IndexConst.EquipSkinIndexAll
		})
		slot0.equipSkinTheme = slot0.equipSkinTheme or IndexConst.Flags2Bits({
			IndexConst.EquipSkinThemeAll
		})

		function slot0.callback(slot0)
			slot0.equipSkinSort = slot0.equipSkinSort
			slot0.equipSkinIndex = slot0.equipSkinIndex
			slot0.equipSkinTheme = slot0.equipSkinTheme

			slot0:filterEquipment()
		end

		slot0:emit(EquipmentMediator.OPEN_EQUIPSKIN_INDEX_LAYER, slot0)
	end, SFX_PANEL)

	slot0.equipmetItems = {}
	slot0.itemCards = {}

	slot0:initItems()
	slot0:initEquipments()

	if not slot0.contextData.indexData then
		slot0.contextData.indexData = slot3.index[1]
	end

	slot0.asc = slot0.contextData.asc or false

	if not slot0.contextData.sortData then
		slot0.contextData.sortData = slot3.sort[1]
	end

	slot0:initSort()
	slot0:initEquipmentIndex()
	setActive(slot0.itemView, false)
	setActive(slot0.equipmentView, false)
	onToggle(slot0, slot0.materialToggle, function (slot0)
		slot0.inMaterial = slot0

		if slot0 and slot0.contextData.warp ~= StoreHouseConst.WARP_TO_MATERIAL then
			slot0.contextData.warp = StoreHouseConst.WARP_TO_MATERIAL

			setText(slot0.tip, i18n("equipment_select_materials_tip"))
			setActive(slot0.capacityTF.parent, false)
			setActive(slot0.tip, true)
			setActive(slot0.capacityTF.parent, false)
			slot0:sortItems()
		end

		setActive(slot0.helpBtn, not slot0)
	end, SFX_PANEL)
	onToggle(slot0, slot0.weaponToggle, function (slot0)
		if slot0 and slot0.contextData.warp ~= StoreHouseConst.WARP_TO_WEAPON then
			slot0.contextData.warp = StoreHouseConst.WARP_TO_WEAPON

			slot0:updateCapacity()
			setActive(slot0.tip, false)
			setActive(slot0.capacityTF.parent, true)

			if slot0.page ==  then
				triggerToggle(slot0.equipmentSkinBtn, true)
			elseif slot0.page == slot2 then
				triggerToggle(slot0.equipmentBtn, true)
			end
		end

		setActive(slot0.BatchDisposeBtn, slot0 and slot0.page == slot0.BatchDisposeBtn)
		setActive(slot0.filterBusyToggle, slot0)
		setActive(slot0.BatchDisposeBtn, slot0.page == slot0.indexBtn)
		setActive(slot0.BatchDisposeBtn, slot0.page == slot0.sortBtn)
		setActive(slot0.equipSkinFilteBtn, slot0.page == setActive)
	end, SFX_PANEL)
	onToggle(slot0, slot0.designToggle, function (slot0)
		if slot0 then
			if slot0.contextData.warp ~= StoreHouseConst.WARP_TO_DESIGN then
				slot0.contextData.warp = StoreHouseConst.WARP_TO_DESIGN

				slot0:updateCapacity()
				slot0:emit(EquipmentMediator.OPEN_DESIGN)
				setActive(slot0.tip, false)
				setActive(slot0.capacityTF.parent, false)
				setActive(slot0.listEmptyTF, false)
			end
		else
			slot0:emit(EquipmentMediator.CLOSE_DESIGN_LAYER)
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.filterBusyToggle, function (slot0)
		slot0.showBusyEquip = slot0

		if slot0.afterFirstTrigger then
			slot0:filterEquipment()
		end
	end, SFX_PANEL)
	triggerToggle(slot0.filterBusyToggle, slot0.shipVO)

	slot0.afterFirstTrigger = true

	if slot0.warp == StoreHouseConst.WARP_TO_DESIGN then
		triggerToggle(slot0.designToggle, true)
	elseif slot0.warp == StoreHouseConst.WARP_TO_MATERIAL then
		triggerToggle(slot0.materialToggle, true)
	elseif slot0.warp == StoreHouseConst.WARP_TO_WEAPON then
		triggerToggle(slot0.weaponToggle, true)
	end

	onButton(slot0, slot0.BatchDisposeBtn, function ()
		slot0.selectEnabled = not slot0.selectEnabled

		if slot0.selectEnabled then
			slot0.filterImportance = slot0.asc

			shiftPanel(slot0.bottomBack, nil, -124, nil, 0, true, true)
			shiftPanel(slot0.selectPanel, nil, 0, nil, 0, true, true)

			shiftPanel.asc = true
			shiftPanel.contextData.asc = slot0.asc
			shiftPanel.contextData.contextData.sortData = slot0.asc.sort[1]

			shiftPanel.contextData.contextData:filterEquipment()

			shiftPanel.contextData.contextData.filterEquipment.mode = StoreHouseConst.DESTORY
		else
			slot0.mode = StoreHouseConst.OVERVIEW
			slot0.asc = slot0.filterImportance
			slot0.filterImportance = nil

			shiftPanel(slot0.bottomBack, nil, 0, nil, 0, true, true)
			shiftPanel(slot0.selectPanel, nil, -124, nil, 0, true, true)
			shiftPanel:filterEquipment()
		end

		setActive(slot0.filterBusyToggle, not slot0.selectEnabled)
		slot0(slot0.equipmentBtn.parent, slot0.mode == StoreHouseConst.OVERVIEW)
	end, SFX_PANEL)

	if slot0.warp == StoreHouseConst.WARP_TO_WEAPON and slot0.mode == StoreHouseConst.DESTORY then
		triggerButton(slot0.BatchDisposeBtn)
	end

	onButton(slot0, findTF(slot0.selectPanel, "cancel_button"), function ()
		slot0:unselecteAllEquips()
		triggerButton(slot0.BatchDisposeBtn)
	end, SFX_CANCEL)
	onButton(slot0, findTF(slot0.selectPanel, "confirm_button"), function ()
		if not _.all(slot0:hasEliteEquips(slot0.selectedIds, slot0.equipmentVOByIds), function (slot0)
			return slot0 == ""
		end) then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("destroy_eliteequipment_tip", string.gsub(table.concat(slot1, ""), "$1", (slot1[1] == "" and "") or ",")),
				onYes = slot0
			})
		else
			slot0()
		end
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():OverlayPanel(slot0.blurPanel, {
		groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
	})
	pg.UIMgr.GetInstance():OverlayPanel(slot0.topItems, {
		groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
	})
	setActive(slot0.equipmentBtn.parent, slot0.mode == StoreHouseConst.OVERVIEW and slot0.warp == StoreHouseConst.WARP_TO_WEAPON)
	setImageSprite(slot0:findTF("Image", slot0.sortBtn), GetSpriteFromAtlas("ui/equipmentui_atlas", (sortData and sortData.spr) or "sort_rarity"), true)
	setImageSprite(slot0:findTF("Image", slot0.indexBtn), GetSpriteFromAtlas("ui/equipmentui_atlas", (indexData and indexData.spr) or "index_all"), true)
	setActive(slot0.sortImgAsc, slot0.asc)
	setActive(slot0.sortImgDec, not slot0.asc)
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)

	if slot0.destroyConfirmView and slot0.destroyConfirmView:GetLoaded() then
		slot0.destroyConfirmView:Destroy()

		return
	end

	if slot0.assignedItemView and slot0.assignedItemView:GetLoaded() then
		slot0.assignedItemView:Destroy()

		return
	end

	triggerButton(slot0.backBtn)
end

function slot0.hasEliteEquips(slot0, slot1, slot2)
	function slot4(slot0, slot1)
		if not _.include(slot0, slot0) then
			slot0[slot1] = slot0
		end
	end

	_.each(slot1, function (slot0)
		if slot0[slot0[1]].config.level > 1 then
			slot1(i18n("destroy_high_intensify_tip"), 2)
		end

		if slot2.config.rarity >= 4 then
			slot1(i18n("destroy_high_rarity_tip"), 1)
		end
	end)

	return {
		"",
		""
	}
end

function slot0.updateCapacity(slot0)
	if slot0.contextData.warp == StoreHouseConst.WARP_TO_DESIGN or slot0.contextData.warp == StoreHouseConst.WARP_TO_MATERIAL then
		return
	end

	setText(slot0.tip, "")
	setText(slot0.capacityTF, slot0.capacity .. "/" .. slot0.player.equip_bag_max)
end

function slot0.setCapacity(slot0, slot1)
	slot0.capacity = slot1
end

function slot0.setShip(slot0, slot1)
	slot0.mode = slot0.contextData.mode or StoreHouseConst.OVERVIEW
	slot0.shipVO = slot1

	if slot1 then
		if slot0.mode == StoreHouseConst.EQUIPMENT then
			slot0.contextData.qiutBtn = defaultValue(slot1:getEquip(slot0.contextData.pos), nil)
		elseif slot0.mode == StoreHouseConst.SKIN then
			slot0.contextData.qiutBtn = slot1:getEquip(slot0.contextData.pos).hasSkin(slot2)
		end

		setActive(slot0.bottomPanel, false)
	end
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1

	if not slot0.inMaterial then
		slot0:updateCapacity()
	end
end

function slot0.initSort(slot0)
	onButton(slot0, slot0.decBtn, function ()
		slot0.asc = not slot0.asc
		slot0.contextData.asc = slot0.asc

		slot0.contextData:filterEquipment()
	end)

	slot0.sortButtons = {}

	eachChild(slot0.sortContain, function (slot0)
		setActive(slot0, false)
	end)

	for slot4, slot5 in ipairs(slot0.sort) do
		setActive((slot4 <= slot0.sortContain.childCount and slot0.sortContain:GetChild(slot4 - 1)) or cloneTplTo(slot0.sortTpl, slot0.sortContain), true)
		setImageSprite(findTF((slot4 <= slot0.sortContain.childCount and slot0.sortContain.GetChild(slot4 - 1)) or cloneTplTo(slot0.sortTpl, slot0.sortContain), "Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", slot5.spr), true)
		onToggle(slot0, (slot4 <= slot0.sortContain.childCount and slot0.sortContain.GetChild(slot4 - 1)) or cloneTplTo(slot0.sortTpl, slot0.sortContain), function (slot0)
			if slot0 then
				slot0.contextData.sortData = slot0.contextData

				slot0:filterEquipment()
				triggerToggle(slot0.sortBtn, false)
			end
		end, SFX_PANEL)

		slot0.sortButtons[slot4] = (slot4 <= slot0.sortContain.childCount and slot0.sortContain.GetChild(slot4 - 1)) or cloneTplTo(slot0.sortTpl, slot0.sortContain)
	end

	slot0.contextData.sortData = slot0.sort[1]
end

function slot0.initEquipmentIndex(slot0)
	slot0.indexButtons = {}

	eachChild(slot0.indexContain, function (slot0)
		setActive(slot0, false)
	end)

	for slot4, slot5 in ipairs(slot0.index) do
		setActive((slot4 <= slot0.indexContain.childCount and slot0.indexContain:GetChild(slot4 - 1)) or cloneTplTo(slot0.indexTpl, slot0.indexContain), true)
		setImageSprite(findTF((slot4 <= slot0.indexContain.childCount and slot0.indexContain.GetChild(slot4 - 1)) or cloneTplTo(slot0.indexTpl, slot0.indexContain), "Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", slot5.spr), true)
		onToggle(slot0, (slot4 <= slot0.indexContain.childCount and slot0.indexContain.GetChild(slot4 - 1)) or cloneTplTo(slot0.indexTpl, slot0.indexContain), function (slot0)
			if slot0 then
				slot0.contextData.indexData = slot0.contextData

				slot0:filterEquipment()
				triggerToggle(slot0.indexBtn, false)
			end
		end, SFX_PANEL)

		slot0.indexButtons[slot4] = (slot4 <= slot0.indexContain.childCount and slot0.indexContain.GetChild(slot4 - 1)) or cloneTplTo(slot0.indexTpl, slot0.indexContain)
	end

	slot0.contextData.indexData = slot0.index[1]
end

function slot0.updatePageFilterButtons(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.index) do
		triggerToggle(slot0.indexButtons[slot5], false)
		setActive(slot0.indexButtons[slot5], table.contains(slot6.pages, slot1))
	end

	for slot5, slot6 in ipairs(slot0.sort) do
		triggerToggle(slot0.sortButtons[slot5], false)
		setActive(slot0.sortButtons[slot5], table.contains(slot6.pages, slot1))
	end
end

function slot0.initEquipments(slot0)
	slot0.isInitWeapons = true
	slot0.equipmentRect = slot0.equipmentView:GetComponent("LScrollRect")

	function slot0.equipmentRect.onInitItem(slot0)
		slot0:initEquipment(slot0)
	end

	slot0.equipmentRect.decelerationRate = 0.07

	function slot0.equipmentRect.onUpdateItem(slot0, slot1)
		slot0:updateEquipment(slot0, slot1)
	end

	function slot0.equipmentRect.onStart()
		slot0:updateSelected()
	end

	function slot0.equipmentRect.onItemsUpdated()
		onNextTick(function ()
			slot0:ExecuteAnimDoneCallback()
		end)
	end

	slot0.equipmentRect:ScrollTo(0)
end

function slot0.initEquipment(slot0, slot1)
	slot2 = EquipmentItem.New(slot1)

	onButton(slot0, slot2.go, function ()
		if slot0.equipmentVO == nil then
			return
		end

		if slot0.equipmentVO.isSkin then
			if not slot0.equipmentVO.shipId then
				slot1:emit(EquipmentMediator.ON_EQUIPMENT_SKIN_INFO, slot0.equipmentVO.id, slot1.contextData.pos)
			else
				slot1:emit(EquipmentMediator.ON_EQUIPMENT_SKIN_INFO, slot0.equipmentVO.id, slot1.contextData.pos, {
					id = slot0.equipmentVO.shipId,
					pos = slot0.equipmentVO.shipPos
				})
			end
		else

			-- Decompilation error in this vicinity:
			if slot0.equipmentVO.mask then
				return
			end

			if slot1.selectEnabled then
				slot1:selectEquip(slot0.equipmentVO, slot0.equipmentVO.count)

				return
			end

			slot1:emit(slot2.ON_EQUIPMENT, slot0)
		end
	end, SFX_PANEL)
	onButton(slot0, slot2.unloadBtn, function ()
		if slot0.mode and slot0.mode == StoreHouseConst.SKIN then
			slot0:emit(EquipmentMediator.ON_UNEQUIP_EQUIPMENT_SKIN)
		elseif slot0.mode and slot0.mode == StoreHouseConst.EQUIPMENT then
			slot0:emit(EquipmentMediator.ON_UNEQUIP_EQUIPMENT)
		end
	end, SFX_PANEL)
	onButton(slot0, slot2.reduceBtn, function ()
		slot0:selectEquip(slot1.equipmentVO, 1)
	end, SFX_PANEL)

	slot0.equipmetItems[slot1] = slot2
end

function slot0.updateEquipment(slot0, slot1, slot2)
	if not slot0.equipmetItems[slot2] then
		slot0:initEquipment(slot2)

		slot3 = slot0.equipmetItems[slot2]
	end

	slot3:update(slot0.loadEquipmentVOs[slot1 + 1])

	slot5 = false
	slot6 = 0

	if slot0.loadEquipmentVOs[slot1 + 1] then
		for slot10, slot11 in ipairs(slot0.selectedIds) do
			if slot4.id == slot11[1] then
				slot5 = true
				slot6 = slot11[2]

				break
			end
		end
	end

	slot3:updateSelected(slot5, slot6)
end

function slot0.updateEquipmentCount(slot0, slot1)
	slot0.equipmentRect:SetTotalCount(slot1 or #slot0.loadEquipmentVOs, -1)
	setActive(slot0.listEmptyTF, (slot1 or #slot0.loadEquipmentVOs) <= 0)
	setText(slot0.listEmptyTxt, i18n("list_empty_tip_storehouseui_equip"))
	Canvas.ForceUpdateCanvases()
end

function slot0.filterEquipment(slot0)
	if slot0.page == slot0 then
		slot0:filterEquipSkin()

		return
	end

	slot2 = slot0.contextData.indexData.types
	slot4 = slot0.contextData.sortData
	slot0.pageEquipments = {}
	slot0.loadEquipmentVOs = {}

	if slot0.page == slot0 then
		for slot8, slot9 in pairs(slot0.equipmentVOs) do
			if slot9.isSkin and slot9.count > 0 then
				table.insert(slot0.pageEquipments, slot9)
			end
		end
	elseif slot3 == slot1 then
		for slot8, slot9 in pairs(slot0.equipmentVOs) do
			if not slot9.isSkin then
				table.insert(slot0.pageEquipments, slot9)
			end
		end
	end

	if slot2 then
		if slot3 == slot0 then
			slot5 = pg.equip_skin_template

			function slot6(slot0, slot1)
				for slot5, slot6 in pairs(slot0) do
					if _.any(slot1, function (slot0)
						return slot0 == slot0
					end) then
						return true
					end
				end

				return false
			end

			for slot10, slot11 in pairs(slot0.pageEquipments) do
				if slot11.count > 0 and slot11.isSkin and slot6(slot5[slot11.id].equip_type, slot2) and slot0:checkFitBusyCondition(slot11) then
					table.insert(slot0.loadEquipmentVOs, slot11)
				end
			end
		elseif slot3 == slot1 then
			for slot8, slot9 in pairs(slot0.pageEquipments) do
				if (slot9.count > 0 or slot9.shipId) and not slot9.isSkin and table.contains(slot2, slot9.config.type) and slot0:checkFitBusyCondition(slot9) then
					table.insert(slot0.loadEquipmentVOs, slot9)
				end
			end
		end
	else
		for slot8, slot9 in pairs(slot0.pageEquipments) do
			if (slot9.count > 0 or slot9.shipId) and slot0:checkFitBusyCondition(slot9) then
				table.insert(slot0.loadEquipmentVOs, slot9)
			end
		end
	end

	if slot0.filterImportance ~= nil then
		for slot8 = #slot0.loadEquipmentVOs, 1, -1 do
			if slot0.loadEquipmentVOs[slot8].isSkin or (not slot9.isSkin and slot9:isImportance()) then
				table.remove(slot0.loadEquipmentVOs, slot8)
			end
		end
	end

	if slot4 then
		slot5 = slot0.asc

		table.sort(slot0.loadEquipmentVOs, function (slot0, slot1)
			return slot0:sortFunc(slot1, slot1, slot0.sortFunc)
		end)
	end

	if slot0.contextData.qiutBtn then
		table.insert(slot0.loadEquipmentVOs, 1, nil)

		if #slot0.loadEquipmentVOs == 0 then
			slot0:updateEquipmentCount(1)

			return
		end
	end

	slot0:updateSelected()
	slot0:updateEquipmentCount()
	setImageSprite(slot0:findTF("Image", slot0.sortBtn), GetSpriteFromAtlas("ui/equipmentui_atlas", slot4.spr), true)
	setImageSprite(slot0:findTF("Image", slot0.indexBtn), GetSpriteFromAtlas("ui/equipmentui_atlas", slot1.spr), true)
	setActive(slot0.sortImgAsc, slot0.asc)
	setActive(slot0.sortImgDec, not slot0.asc)
end

function slot0.filterEquipSkin(slot0, slot1)
	slot2 = slot0.equipSkinIndex
	slot3 = slot0.equipSkinTheme
	slot5 = slot0.contextData.sortData
	slot0.pageEquipments = {}
	slot0.loadEquipmentVOs = {}

	if slot0.page == slot0 then
		for slot9, slot10 in pairs(slot0.equipmentVOs) do
			if slot10.isSkin and slot10.count > 0 then
				table.insert(slot0.pageEquipments, slot10)
			end
		end
	elseif slot4 == slot1 then
	end

	if slot4 == slot0 then
		for slot9, slot10 in pairs(slot0.pageEquipments) do
			if IndexConst.filterEquipSkinByIndex(slot10, slot2) and IndexConst.filterEquipSkinByTheme(slot10, slot3) and slot0:checkFitBusyCondition(slot10) then
				table.insert(slot0.loadEquipmentVOs, slot10)
			end
		end
	elseif slot4 == slot1 then
	end

	if slot0.filterImportance ~= nil then
		for slot9 = #slot0.loadEquipmentVOs, 1, -1 do
			if slot0.loadEquipmentVOs[slot9].isSkin or (not slot10.isSkin and slot10:isImportance()) then
				table.remove(slot0.loadEquipmentVOs, slot9)
			end
		end
	end

	if slot5 then
		slot6 = slot0.asc

		table.sort(slot0.loadEquipmentVOs, function (slot0, slot1)
			return slot0:sortFunc(slot1, slot1, slot0.sortFunc)
		end)
	end

	if slot0.contextData.qiutBtn then
		table.insert(slot0.loadEquipmentVOs, 1, nil)

		if #slot0.loadEquipmentVOs == 0 then
			slot0:updateEquipmentCount(1)

			return
		end
	end

	slot0:updateSelected()
	slot0:updateEquipmentCount()
	setActive(slot0.sortImgAsc, slot0.asc)
	setActive(slot0.sortImgDec, not slot0.asc)
end

function slot0.checkFitBusyCondition(slot0, slot1)
	return (not slot0.selectEnabled and slot0.showBusyEquip) or not slot1.shipId
end

function slot0.onUIAnimEnd(slot0, slot1)
	slot0.onAnimDoneCallback = slot1
end

function slot0.ExecuteAnimDoneCallback(slot0)
	if slot0.onAnimDoneCallback then
		slot0.onAnimDoneCallback()

		slot0.onAnimDoneCallback = nil
	end
end

function slot0.setItems(slot0, slot1)
	slot0.itemVOs = slot1

	if slot0.isInitItems and slot0.contextData.warp == StoreHouseConst.WARP_TO_MATERIAL then
		slot0:sortItems()
	end
end

function slot0.initItems(slot0)
	slot0.isInitItems = true
	slot0.itemRect = slot0.itemView:GetComponent("LScrollRect")

	function slot0.itemRect.onInitItem(slot0)
		slot0:initItem(slot0)
	end

	function slot0.itemRect.onUpdateItem(slot0, slot1)
		slot0:updateItem(slot0, slot1)
	end

	function slot0.itemRect.onItemsUpdated()
		slot0:ExecuteAnimDoneCallback()
	end

	slot0.itemRect.decelerationRate = 0.07

	slot0.itemRect:ScrollTo(0)
end

function slot0.sortItems(slot0)
	table.sort(slot0.itemVOs, function (slot0, slot1)
		if slot0:getConfig("rarity") == slot1:getConfig("rarity") then
			return slot0.id < slot1.id
		else
			return slot3 < slot2
		end
	end)
	slot0.itemRect:SetTotalCount(#slot0.itemVOs, -1)
	setActive(slot0.listEmptyTF, #slot0.itemVOs <= 0)
	setText(slot0.listEmptyTxt, i18n("list_empty_tip_storehouseui_item"))
	Canvas.ForceUpdateCanvases()
end

function slot0.initItem(slot0, slot1)
	onButton(slot0, ItemCard.New(slot1).go, function ()
		if slot0.itemVO == nil then
			return
		end

		if slot0.itemVO:getTempCfgTable().open_ui[1] > 0 then
			slot1:emit(EquipmentMediator.ITEM_GO_SCENE, SCENE.ITEM_ORIGIN_PAGE, {
				itemVO = slot0.itemVO,
				open_ui = slot0.itemVO:getTempCfgTable().open_ui[1]
			})
		elseif slot0.itemVO:getConfig("type") == Item.ASSIGNED_TYPE then
			slot1.assignedItemView = AssignedItemView.New(slot1.topItems, slot1.event)

			slot1.assignedItemView:Load()
			slot1.assignedItemView:ActionInvoke("update", slot0.itemVO)
		else
			slot1:emit(slot2.ON_ITEM, slot0.itemVO.id)
		end
	end, SFX_PANEL)

	slot0.itemCards[slot1] = ItemCard.New(slot1)
end

function slot0.updateItem(slot0, slot1, slot2)
	if not slot0.itemCards[slot2] then
		slot0:initItem(slot2)

		slot3 = slot0.itemCards[slot2]
	end

	slot3:update(slot0.itemVOs[slot1 + 1])
end

function slot0.selectCount(slot0)
	slot1 = 0

	for slot5, slot6 in ipairs(slot0.selectedIds) do
		slot1 = slot1 + slot6[2]
	end

	return slot1
end

function slot0.selectEquip(slot0, slot1, slot2)
	if not slot0:checkDestroyGold(slot1, slot2) then
		return
	end

	if not slot0.selectEnabled then
	else
		slot3 = false
		slot4 = nil
		slot5 = 0

		for slot9, slot10 in pairs(slot0.selectedIds) do
			if slot10[1] == slot1.id then
				slot3 = true
				slot4 = slot9
				slot5 = slot10[2]

				break
			end
		end

		if not slot3 then
			slot6, slot7 = slot0.checkEquipment(slot1, function ()
				slot0:selectEquip(slot0, )
			end, slot0.selectedIds)

			if not slot6 then
				if slot7 then
					pg.TipsMgr.GetInstance():ShowTips(slot7)
				end

				return
			end

			if slot0.selectedMax < slot0:selectCount() + slot2 then
				slot2 = slot0.selectedMax - slot8
			end

			if slot0.selectedMax == 0 or slot8 < slot0.selectedMax then
				table.insert(slot0.selectedIds, {
					slot1.id,
					slot2
				})
			elseif slot0.selectedMax == 1 then
				slot0.selectedIds[1] = {
					slot1.id,
					slot2
				}
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_equipmentScene_selectError_more", slot0.selectedMax))

				return
			end
		elseif slot5 - slot2 > 0 then
			slot0.selectedIds[slot4][2] = slot5 - slot2
		else
			table.remove(slot0.selectedIds, slot4)
		end
	end

	slot0:updateSelected()
end

function slot0.unselecteAllEquips(slot0)
	slot0.selectedIds = {}

	slot0:updateSelected()
end

function slot0.checkDestroyGold(slot0, slot1, slot2)
	slot3 = 0
	slot4 = false

	for slot8, slot9 in pairs(slot0.selectedIds) do
		slot10 = slot9[2]

		if pg.equip_data_template[slot9[1]] then
			slot3 = slot3 + (slot11.destory_gold or 0) * slot10
		end

		if slot1 and slot9[1] == slot1.configId then
			slot4 = true
		end
	end

	if not slot4 and slot1 and slot2 > 0 then
		slot3 = slot3 + (pg.equip_data_template[slot1.configId].destory_gold or 0) * slot2
	end

	if slot0.player:GoldMax(slot3) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_destroy"))

		return false
	end

	return true
end

function slot0.updateSelected(slot0)
	for slot4, slot5 in pairs(slot0.equipmetItems) do
		if slot5.equipmentVO then
			slot6 = false
			slot7 = 0

			for slot11, slot12 in pairs(slot0.selectedIds) do
				if slot5.equipmentVO.id == slot12[1] then
					slot6 = true
					slot7 = slot12[2]

					break
				end
			end

			slot5:updateSelected(slot6, slot7)
		end
	end

	slot1 = slot0:selectCount()

	if slot0.selectedMax == 0 then
		setText(findTF(slot0.selectPanel, "bottom_info/bg_input/count"), slot1)
	else
		setText(findTF(slot0.selectPanel, "bottom_info/bg_input/count"), slot1 .. "/" .. slot0.selectedMax)
	end

	if #slot0.selectedIds < slot0.selectedMin then
		setActive(findTF(slot0.selectPanel, "confirm_button/mask"), true)
	else
		setActive(findTF(slot0.selectPanel, "confirm_button/mask"), false)
	end
end

function slot0.SwitchToDestroy(slot0)
	triggerToggle(slot0.weaponToggle, true)

	slot0.selectEnabled = false

	triggerButton(slot0.BatchDisposeBtn)
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.blurPanel, slot0._tf)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.topItems, slot0._tf)

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end
end

return slot0
