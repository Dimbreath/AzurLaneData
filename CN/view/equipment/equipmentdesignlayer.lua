slot0 = class("EquipmentDesignLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "EquipmentDesignUI"
end

function slot0.setItems(slot0, slot1)
	slot0.itemVOs = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.setCapacity(slot0, slot1)
	slot0.capacity = slot1
end

function slot0.init(slot0)
	slot0.parentTF = GameObject.Find("/UICamera/Canvas/UIMain/StoreHouseUI(Clone)")
	slot0.equipmentView = slot0:findTF("equipment_scrollview", slot0.parentTF)
	slot0.designScrollView = slot0:findTF("equipment_scrollview")
	slot0.equipmentTpl = slot0:findTF("equipment_tpl")
	slot0.equipmentContainer = slot0:findTF("equipment_grid", slot0.designScrollView)
	slot0.msgBoxTF = slot0:findTF("msg_panel")

	setActive(slot0.msgBoxTF, false)

	slot0.top = slot0:findTF("top")
	slot0.sortBtn = slot0:findTF("sort_button", slot0.top)
	slot0.decBtn = slot0:findTF("dec_btn", slot0.sortBtn)
	slot0.sortImgAsc = slot0:findTF("asc", slot0.decBtn)
	slot0.sortImgDec = slot0:findTF("desc", slot0.decBtn)
	slot0.indexPanel = slot0:findTF("index")
	slot0.tagContainer = slot0:findTF("adapt/mask/panel", slot0.indexPanel)
	slot0.tagTpl = slot0:findTF("tpl", slot0.tagContainer)
	slot0.UIMgr = pg.UIMgr.GetInstance()

	setActive(slot0.equipmentView, false)
	setParent(slot0._tf, slot0.parentTF)
	slot0._tf:SetSiblingIndex(slot1)

	slot0.listEmptyTF = slot0:findTF("empty")

	setActive(slot0.listEmptyTF, false)

	slot0.listEmptyTxt = slot0:findTF("Text", slot0.listEmptyTF)

	setText(slot0.listEmptyTxt, i18n("list_empty_tip_equipmentdesignui"))
end

slot1 = {
	"sort_default",
	"sort_rarity",
	"sort_count",
	"sort_kind"
}

function slot0.didEnter(slot0)
	slot0.topPanel = GameObject.Find("/OverlayCamera/Overlay/UIMain/blur_panel/adapt/top")

	setParent(slot0.top, slot0.topPanel)
	slot0:initDesigns()
	onToggle(slot0, slot0.sortBtn, function (slot0)
		if slot0 then
			pg.UIMgr.GetInstance():OverlayPanel(slot0.indexPanel, {
				groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
			})
			setActive(slot0.indexPanel, true)
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(slot0.indexPanel, slot0._tf)
			setActive(slot0.indexPanel, false)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.indexPanel, function ()
		triggerToggle(slot0.sortBtn, false)
	end, SFX_PANEL)
	slot0:initTags()
end

function slot0.initTags(slot0)
	onButton(slot0, slot0.decBtn, function ()
		slot0.asc = not slot0.asc
		slot0.contextData.asc = slot0.asc

		slot0(slot0.contextData, slot0.contextData.index or 1)
	end)

	slot0.tagTFs = {}

	eachChild(slot0.tagContainer, function (slot0)
		setActive(slot0, false)
	end)

	for slot4, slot5 in ipairs(slot0) do
		setActive((slot4 <= slot0.tagContainer.childCount and slot0.tagContainer:GetChild(slot4 - 1)) or cloneTplTo(slot0.tagTpl, slot0.tagContainer), true)
		setImageSprite(findTF((slot4 <= slot0.tagContainer.childCount and slot0.tagContainer.GetChild(slot4 - 1)) or cloneTplTo(slot0.tagTpl, slot0.tagContainer), "Image"), GetSpriteFromAtlas("ui/equipmentdesignui_atlas", slot5))
		onToggle(slot0, (slot4 <= slot0.tagContainer.childCount and slot0.tagContainer.GetChild(slot4 - 1)) or cloneTplTo(slot0.tagTpl, slot0.tagContainer), function (slot0)
			if slot0 then
				slot0:filter(slot0.filter)
				triggerButton(slot0.indexPanel)

				slot0.contextData.index = slot0.contextData
			else
				triggerButton(slot0.indexPanel)
			end
		end, SFX_PANEL)
		table.insert(slot0.tagTFs, (slot4 <= slot0.tagContainer.childCount and slot0.tagContainer.GetChild(slot4 - 1)) or cloneTplTo(slot0.tagTpl, slot0.tagContainer))

		if not slot0.contextData.index then
			slot0.contextData.index = slot4
		end
	end

	triggerToggle(slot0.tagTFs[slot0.contextData.index], true)
end

function slot0.initDesigns(slot0)
	slot0.scollRect = slot0.designScrollView:GetComponent("LScrollRect")
	slot0.scollRect.decelerationRate = 0.07

	slot0:filter(slot0.contextData.index or 1)

	function slot0.scollRect.onInitItem(slot0)
		slot0:initDesign(slot0)
	end

	function slot0.scollRect.onUpdateItem(slot0, slot1)
		slot0:updateDesign(slot0, slot1)
	end

	slot0.desgins = {}
end

function slot2(slot0, slot1)
	setImageSprite(findTF(slot0, "name_bg/tag"), GetSpriteFromAtlas("equiptype", EquipType.type2Tag(slot1.config.type)))
	eachChild(slot2, function (slot0)
		setActive(slot0, false)
	end)

	slot4 = slot1:GetProperties()
	slot5 = (EquipType.isDevice(slot1.configId) and 3) or 4

	for slot9 = 1, slot5, 1 do
		setActive((EquipType.isDevice(slot1.configId) and slot9 == slot5 and slot2:Find("attr_skill")) or slot2:Find("attr_" .. slot9), true)

		slot12 = (EquipType.isDevice(slot1.configId) and slot9 == slot5 and slot2.Find("attr_skill")) or slot2.Find("attr_" .. slot9):Find("panel/tag")
		slot13 = (EquipType.isDevice(slot1.configId) and slot9 == slot5 and slot2.Find("attr_skill")) or slot2.Find("attr_" .. slot9):Find("panel")
		slot14 = (EquipType.isDevice(slot1.configId) and slot9 == slot5 and slot2.Find("attr_skill")) or slot2.Find("attr_" .. slot9):Find("panel/value")
		slot15 = (EquipType.isDevice(slot1.configId) and slot9 == slot5 and slot2.Find("attr_skill")) or slot2.Find("attr_" .. slot9):Find("lock")

		function slot16(slot0)
			setActive(slot0, not slot0)
			setActive(setActive, slot0)
		end

		if findTF(slot0, "skill/value") then
			setText(slot17, "")
		end

		if slot10 then
			if slot12 then
				setText(slot12, i18n("skill"))
			end

			slot16(not slot3.skill_id[1])

			slot19 = findTF(slot0, "skill/value")

			if slot3.skill_id[1] then
				slot20 = getSkillConfig(slot18)

				setText(slot14, getSkillName(slot18))

				if slot19 then
					setText(slot19, getSkillDescGet(slot18))
				end
			else
				setText(slot14, "")

				if slot19 then
					setText(slot19, "")
				end
			end
		else
			slot16(not slot4[slot9])

			if slot4[slot9] then
				if not EquipType.isDevice(slot1.configId) and slot18.type == AttributeType.Reload and slot9 == 4 then
					setText(slot12, i18n("word_attr_cd"))
					setText(slot14, setColorStr(string.format("%0.2f", slot1:getWeaponCD()) .. "s", COLOR_YELLOW) .. i18n("word_secondseach"))
				else
					setText(slot12, AttributeType.Type2Name(slot18.type))
					setText(slot14, slot18.value)
				end
			end
		end
	end
end

function slot0.createDesign(slot0, slot1)
	slot2 = findTF(slot1, "info/count")
	slot3 = findTF(slot1, "mask")

	return {
		go = slot1,
		nameTxt = slot0:findTF("name_bg/mask/name", slot1),
		getItemById = function (slot0, slot1)
			return slot0.itemVOs[slot1] or Item.New({
				count = 0,
				id = slot1
			})
		end,
		update = function (slot0, slot1, slot2)
			slot0.designId = slot1
			slot0.itemVOs = slot2

			TweenItemAlphaAndWhite(slot0.go)
			setText(slot0.nameTxt, shortenString(pg.equip_data_statistics[pg.compose_data_template[slot1].equip_id].name, 6))
			updateEquipment(slot7, slot6)
			slot3(slot0, Equipment.New({
				id = pg.compose_data_template[slot1].equip_id
			}))
			function ()
				setText(setText, (slot1.material_num <= slot0.itemVOs[slot1.material_id] or Item.New({
					count = 0,
					id = slot1.material_id
				}).count and setColorStr(slot1, COLOR_WHITE)) or setColorStr(slot1, COLOR_RED))
				setActive(setText, slot0.itemVOs[slot1.material_id] or Item.New().count < (slot1.material_num <= slot0.itemVOs[slot1.material_id] or Item.New().count and setColorStr(slot1, COLOR_WHITE)) or setColorStr(slot1, COLOR_RED).material_num)
			end()
		end
	}
end

function slot0.initDesign(slot0, slot1)
	onButton(slot0, tf(slot0:createDesign(slot1).go):Find("info/make_btn"), function ()
		slot0:showDesignDesc(slot1.designId)
	end)

	slot0.desgins[slot1] = slot0.createDesign(slot1)
end

function slot0.updateDesign(slot0, slot1, slot2)
	if not slot0.desgins[slot2] then
		slot0:initDesign(slot2)

		slot3 = slot0.desgins[slot2]
	end

	slot3:update(slot0.desginIds[slot1 + 1], slot0.itemVOs)
end

function slot0.filter(slot0, slot1)
	slot3 = {}
	slot4 = slot0.asc

	for slot8, slot9 in ipairs(pg.compose_data_template.all) do
		if slot0:getItemById(pg.compose_data_template[slot9].material_id).count > 0 then
			table.insert(slot3, slot9)
		end
	end

	function slot5(slot0)
		return {
			equipmentCfg = pg.equip_data_statistics[slot0[slot0].equip_id],
			designCfg = slot0[slot0],
			id = slot0,
			itemCount = slot1:getItemById(slot0[slot0].material_id).count,
			canMakeCount = math.floor(slot1.getItemById(slot0[slot0].material_id).count / slot0[slot0].material_num),
			canMake = math.min(()["canMakeCount"], 1)
		}
	end

	if slot1 == 1 then
		if slot4 then
			table.sort(slot3, function (slot0, slot1)
				if slot0(slot0).canMake == slot0(slot1).canMake then
					if slot2.equipmentCfg.rarity == slot3.equipmentCfg.rarity then
						return slot2.equipmentCfg.id < slot3.equipmentCfg.id
					else
						return slot3.equipmentCfg.rarity < slot2.equipmentCfg.rarity
					end
				else
					return slot2.canMake < slot3.canMake
				end
			end)
		else
			table.sort(slot3, function (slot0, slot1)
				if slot0(slot0).canMake == slot0(slot1).canMake then
					if slot2.equipmentCfg.rarity == slot3.equipmentCfg.rarity then
						return slot2.equipmentCfg.id < slot3.equipmentCfg.id
					else
						return slot3.equipmentCfg.rarity < slot2.equipmentCfg.rarity
					end
				else
					return slot3.canMake < slot2.canMake
				end
			end)
		end
	elseif slot1 == 2 then
		if slot0.asc then
			table.sort(slot3, function (slot0, slot1)
				if slot0(slot0).equipmentCfg.rarity == slot0(slot1).equipmentCfg.rarity then
					return slot2.equipmentCfg.id < slot2.equipmentCfg.id
				end

				return slot2.equipmentCfg.rarity < slot3.equipmentCfg.rarity
			end)
		else
			table.sort(slot3, function (slot0, slot1)
				if slot0(slot0).equipmentCfg.rarity == slot0(slot1).equipmentCfg.rarity then
					return slot2.equipmentCfg.id < slot2.equipmentCfg.id
				end

				return slot3.equipmentCfg.rarity < slot2.equipmentCfg.rarity
			end)
		end
	elseif slot1 == 3 then
		if slot0.asc then
			table.sort(slot3, function (slot0, slot1)
				if slot0(slot0).itemCount == slot0(slot1).itemCount then
					return slot2.equipmentCfg.id < slot3.equipmentCfg.id
				end

				return slot2.itemCount < slot3.itemCount
			end)
		else
			table.sort(slot3, function (slot0, slot1)
				if slot0(slot0).itemCount == slot0(slot1).itemCount then
					return slot2.equipmentCfg.id < slot3.equipmentCfg.id
				end

				return slot3.itemCount < slot2.itemCount
			end)
		end
	elseif slot1 == 4 then
		if slot0.asc then
			table.sort(slot3, function (slot0, slot1)
				return slot0(slot1).equipmentCfg.id < slot0(slot0).equipmentCfg.id
			end)
		else
			table.sort(slot3, function (slot0, slot1)
				return slot0(slot0).equipmentCfg.id < slot0(slot1).equipmentCfg.id
			end)
		end
	end

	slot0.desginIds = slot3

	slot0.scollRect:SetTotalCount(#slot3, 0)
	setActive(slot0.listEmptyTF, #slot3 <= 0)
	Canvas.ForceUpdateCanvases()
	setImageSprite(slot0:findTF("Image", slot0.sortBtn), setActive)
	setActive(slot0.sortImgAsc, slot0.asc)
	setActive(slot0.sortImgDec, not slot0.asc)
end

function slot0.getItemById(slot0, slot1)
	return slot0.itemVOs[slot1] or Item.New({
		count = 0,
		id = slot1
	})
end

function slot0.showDesignDesc(slot0, slot1)
	slot0.isShowDesc = true

	if IsNil(slot0.msgBoxTF) then
		return
	end

	slot0.UIMgr:BlurPanel(slot0.msgBoxTF)
	setActive(slot0.msgBoxTF, true)

	slot5 = Equipment.New({
		id = pg.compose_data_template[slot1].equip_id
	})

	slot0:updateDescAttrs(slot0.msgBoxTF.Find(slot2, "bg/attrs"), slot5)
	GetImageSpriteFromAtlasAsync("equips/" .. slot5.config.icon, "", slot6)
	setText(slot0.msgBoxTF.Find(slot2, "bg/name"), slot5.config.name)
	UIItemList.New(slot0.msgBoxTF.Find(slot2, "bg/frame/stars"), slot0.msgBoxTF.Find(slot2, "bg/frame/stars/sarttpl")).align(slot7, slot5.config.rarity)
	setImageSprite(findTF(slot2, "bg/frame/type"), GetSpriteFromAtlas("equiptype", EquipType.type2Tag(slot5.config.type)))

	slot0.msgBoxTF.Find(slot2, "bg/frame"):GetComponent(typeof(Image)).sprite = LoadSprite("bg/equipment_bg_" .. slot5.config.rarity)
	slot9 = findTF(slot2, "bg/frame/numbers")
	slot10 = slot5.config.tech or 1

	for slot14 = 0, slot9.childCount - 1, 1 do
		setActive(slot9:GetChild(slot14), slot14 == slot10)
	end

	slot12 = math.floor(slot0:getItemById(slot3.material_id).count / slot3.material_num)
	slot14 = slot0:findTF("bg/calc/values/Text", slot2)
	slot15 = slot3.gold_num
	slot16 = slot0:findTF("bg/calc/gold/Text", slot2)

	slot17(slot13)
	onButton(slot0, findTF(slot2, "bg/calc/minus"), function ()
		if slot0 <= 1 then
			return
		end

		slot0 = slot0 - 1

		slot1(slot1)
	end, SFX_PANEL)
	onButton(slot0, findTF(slot2, "bg/calc/add"), function ()
		if slot0 == slot1 then
			return
		end

		slot0 = slot0 + 1

		slot2(slot2)
	end, SFX_PANEL)
	onButton(slot0, findTF(slot2, "bg/calc/max"), function ()
		if slot0 == slot1 then
			return
		end

		1(math.max(math.min(slot1, slot2.player.equip_bag_max - slot2.capacity), 1))
	end, SFX_PANEL)
	onButton(slot0, findTF(slot2, "bg/cancel_btn"), function ()
		slot0:hideMsgBox()
	end, SFX_CANCEL)
	onButton(slot0, findTF(slot2, "bg/confirm_btn"), function ()
		slot0:emit(EquipmentDesignMediator.MAKE_EQUIPMENT, slot0, )
		slot0.emit:hideMsgBox()
	end, SFX_CONFIRM)
	onButton(slot0, slot2, function ()
		slot0:hideMsgBox()
	end, SFX_CANCEL)
end

function slot3(slot0, slot1, slot2)
	slot3 = findTF(slot0, "name")
	slot4 = findTF(slot0, "value")

	if not EquipType.isDevice(slot2.configId) and slot1.type == AttributeType.Reload then
		setText(slot3, i18n("word_attr_cd"))
		setText(slot4, setColorStr(string.format("%0.2f", slot2:getWeaponCD()) .. "s", COLOR_YELLOW) .. i18n("word_secondseach"))
	else
		setText(slot3, AttributeType.Type2Name(slot1.type))
		setText(slot4, slot1.value)
	end
end

function slot0.updateDescAttrs(slot0, slot1, slot2)
	setImageSprite(findTF(slot1, "name_bg/tag"), GetSpriteFromAtlas("equiptype", EquipType.type2Tag(slot2.config.type)))

	slot6 = findTF(slot5, "attr")
	slot8 = slot2:GetProperties(true)
	slot11 = (EquipType.isAircraft(slot2.configId) and pg.aircraft_template[slot2.configId].weapon_ID) or {}

	setActive(findTF(slot3, "skill"), slot2:GetSkill())

	if slot9 then
		setText(slot12, i18n("skill"))
		setText(slot13, setColorStr(slot9.name, "#FFDE00FF"))
		setText(findTF(slot7, "value/Text"), getSkillDescGet(slot9.id))
	end

	slot12 = 0

	eachChild(slot5, function (slot0)
		setActive(slot0, false)
	end)

	for slot16, slot17 in pairs(slot8) do
		setActive((slot12 + 1 <= slot5.childCount and slot5:GetChild(slot12 - 1)) or cloneTplTo(slot6, slot5), slot17)

		if slot17 then
			slot0(slot18, slot17, slot2)
		end
	end

	for slot16, slot17 in ipairs(slot11) do
		setActive((slot12 + 1 <= slot5.childCount and slot5:GetChild(slot12 - 1)) or cloneTplTo(slot6, slot5), true)
		setTextFont(slot20, pg.FontMgr.GetInstance().fonts.heiti)
		setText(slot19, "")
		setText(findTF((slot12 + 1 <= slot5.childCount and slot5.GetChild(slot12 - 1)) or cloneTplTo(slot6, slot5), "value"), setColorStr(pg.weapon_property[slot17].name, COLOR_YELLOW))
	end
end

function slot0.hideMsgBox(slot0)
	if not IsNil(slot0.msgBoxTF) then
		slot0.isShowDesc = nil

		slot0.UIMgr:UnblurPanel(slot0.msgBoxTF, slot0._tf)
		setActive(slot0.msgBoxTF, false)
	end
end

function slot0.onBackPressed(slot0)
	if slot0.isShowDesc then
		slot0:hideMsgBox()
	else
		playSoundEffect(SFX_CANCEL)
		slot0:emit(slot0.ON_BACK)
	end
end

function slot0.willExit(slot0)
	if slot0.leftEventTrigger then
		ClearEventTrigger(slot0.leftEventTrigger)
	end

	if slot0.rightEventTrigger then
		ClearEventTrigger(slot0.rightEventTrigger)
	end

	setParent(slot0.sortBtn.parent, slot0._tf)
end

return slot0
