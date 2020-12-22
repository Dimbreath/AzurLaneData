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
	slot0._tf:SetSiblingIndex(slot0.equipmentView:GetSiblingIndex())

	slot0.listEmptyTF = slot0:findTF("empty")

	setActive(slot0.listEmptyTF, false)

	slot0.listEmptyTxt = slot0:findTF("Text", slot0.listEmptyTF)

	setText(slot0.listEmptyTxt, i18n("list_empty_tip_equipmentdesignui"))
	pg.UIMgr.GetInstance():OverlayPanel(slot0.indexPanel, {
		groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
	})
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
			setActive(uv0.indexPanel, true)
		else
			setActive(uv0.indexPanel, false)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.indexPanel, function ()
		triggerToggle(uv0.sortBtn, false)
	end, SFX_PANEL)
	slot0:initTags()
end

function slot0.initTags(slot0)
	function slot4()
		uv0.asc = not uv0.asc
		uv0.contextData.asc = uv0.asc

		uv0:filter(uv0.contextData.index or 1)
	end

	onButton(slot0, slot0.decBtn, slot4)

	slot0.tagTFs = {}

	eachChild(slot0.tagContainer, function (slot0)
		setActive(slot0, false)
	end)

	for slot4, slot5 in ipairs(uv0) do
		slot6 = slot4 <= slot0.tagContainer.childCount and slot0.tagContainer:GetChild(slot4 - 1) or cloneTplTo(slot0.tagTpl, slot0.tagContainer)

		setActive(slot6, true)
		setImageSprite(findTF(slot6, "Image"), GetSpriteFromAtlas("ui/equipmentdesignui_atlas", slot5))
		onToggle(slot0, slot6, function (slot0)
			if slot0 then
				uv0:filter(uv1)
				triggerButton(uv0.indexPanel)

				uv0.contextData.index = uv1
			else
				triggerButton(uv0.indexPanel)
			end
		end, SFX_PANEL)
		table.insert(slot0.tagTFs, slot6)

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
		uv0:initDesign(slot0)
	end

	function slot0.scollRect.onUpdateItem(slot0, slot1)
		uv0:updateDesign(slot0, slot1)
	end

	slot0.desgins = {}
end

function slot2(slot0, slot1)
	slot3 = slot1.config

	setImageSprite(findTF(slot0, "name_bg/tag"), GetSpriteFromAtlas("equiptype", EquipType.type2Tag(slot3.type)))
	eachChild(findTF(slot0, "attrs"), function (slot0)
		setActive(slot0, false)
	end)

	slot4 = underscore.filter(slot1:GetPropertiesInfo().attrs, function (slot0)
		return not slot0.type or slot0.type ~= AttributeType.AntiSiren
	end)

	for slot10, slot11 in ipairs(slot3.skill_id[1] and slot1:isDevice() and {
		1,
		2,
		5
	} or {
		1,
		4,
		2,
		3
	}) do
		setActive(slot2:Find("attr_" .. slot11), true)

		if slot11 == 5 then
			setText(slot12:Find("value"), getSkillName(slot5))
		else
			slot13 = ""
			slot14 = ""

			if #slot4 > 0 then
				slot13, slot14 = Equipment.GetInfoTrans(table.remove(slot4, 1))
			end

			setText(slot12:Find("tag"), slot13)
			setText(slot12:Find("value"), slot14)
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
			slot4 = pg.compose_data_template[slot1].equip_id

			TweenItemAlphaAndWhite(slot0.go)
			setText(slot0.nameTxt, shortenString(pg.equip_data_statistics[slot4].name, 6))

			slot6 = Equipment.New({
				id = slot4
			})

			updateEquipment(findTF(uv0, "equipment/bg"), slot6)
			uv3(uv0, slot6)
			function ()
				slot0 = uv0.itemVOs[uv1.material_id] or Item.New({
					count = 0,
					id = uv1.material_id
				})
				slot1 = slot0.count .. "/" .. uv1.material_num

				setText(uv2, uv1.material_num <= slot0.count and setColorStr(slot1, COLOR_WHITE) or setColorStr(slot1, COLOR_RED))
				setActive(uv3, slot0.count < uv1.material_num)
			end()
		end
	}
end

function slot0.initDesign(slot0, slot1)
	slot2 = slot0:createDesign(slot1)

	onButton(slot0, tf(slot2.go):Find("info/make_btn"), function ()
		uv0:showDesignDesc(uv1.designId)
	end)

	slot0.desgins[slot1] = slot2
end

function slot0.updateDesign(slot0, slot1, slot2)
	if not slot0.desgins[slot2] then
		slot0:initDesign(slot2)

		slot3 = slot0.desgins[slot2]
	end

	slot3:update(slot0.desginIds[slot1 + 1], slot0.itemVOs)
end

function slot0.filter(slot0, slot1)
	slot4 = slot0.asc

	for slot8, slot9 in ipairs(pg.compose_data_template.all) do
		if slot0:getItemById(pg.compose_data_template[slot9].material_id).count > 0 then
			table.insert({}, slot9)
		end
	end

	function slot5(slot0)
		slot1 = {
			equipmentCfg = pg.equip_data_statistics[uv0[slot0].equip_id],
			designCfg = uv0[slot0],
			id = slot0,
			itemCount = slot3,
			canMakeCount = math.floor(slot3 / uv0[slot0].material_num)
		}
		slot3 = uv1:getItemById(uv0[slot0].material_id).count
		slot1.canMake = math.min(slot1.canMakeCount, 1)

		return slot1
	end

	if slot1 == 1 then
		if slot4 then
			table.sort(slot3, function (slot0, slot1)
				if uv0(slot0).canMake == uv0(slot1).canMake then
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
				if uv0(slot0).canMake == uv0(slot1).canMake then
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
				if uv0(slot0).equipmentCfg.rarity == uv0(slot1).equipmentCfg.rarity then
					return slot2.equipmentCfg.id < slot2.equipmentCfg.id
				end

				return slot2.equipmentCfg.rarity < slot3.equipmentCfg.rarity
			end)
		else
			table.sort(slot3, function (slot0, slot1)
				if uv0(slot0).equipmentCfg.rarity == uv0(slot1).equipmentCfg.rarity then
					return slot2.equipmentCfg.id < slot2.equipmentCfg.id
				end

				return slot3.equipmentCfg.rarity < slot2.equipmentCfg.rarity
			end)
		end
	elseif slot1 == 3 then
		if slot0.asc then
			table.sort(slot3, function (slot0, slot1)
				if uv0(slot0).itemCount == uv0(slot1).itemCount then
					return slot2.equipmentCfg.id < slot3.equipmentCfg.id
				end

				return slot2.itemCount < slot3.itemCount
			end)
		else
			table.sort(slot3, function (slot0, slot1)
				if uv0(slot0).itemCount == uv0(slot1).itemCount then
					return slot2.equipmentCfg.id < slot3.equipmentCfg.id
				end

				return slot3.itemCount < slot2.itemCount
			end)
		end
	elseif slot1 == 4 then
		if slot0.asc then
			table.sort(slot3, function (slot0, slot1)
				return uv0(slot1).equipmentCfg.id < uv0(slot0).equipmentCfg.id
			end)
		else
			table.sort(slot3, function (slot0, slot1)
				return uv0(slot0).equipmentCfg.id < uv0(slot1).equipmentCfg.id
			end)
		end
	end

	slot0.desginIds = slot3

	slot0.scollRect:SetTotalCount(#slot3, 0)
	setActive(slot0.listEmptyTF, #slot3 <= 0)
	Canvas.ForceUpdateCanvases()
	setImageSprite(slot0:findTF("Image", slot0.sortBtn), GetSpriteFromAtlas("ui/equipmentdesignui_atlas", uv0[slot1]))
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

	slot2 = slot0.msgBoxTF
	slot5 = Equipment.New({
		id = pg.compose_data_template[slot1].equip_id
	})

	updateEquipInfo(slot2:Find("bg/attrs/content"), slot5:GetPropertiesInfo(), slot5:GetSkill())
	GetImageSpriteFromAtlasAsync("equips/" .. slot5.config.icon, "", slot2:Find("bg/frame/icon"))
	setText(slot2:Find("bg/name"), slot5.config.name)
	UIItemList.New(slot2:Find("bg/frame/stars"), slot2:Find("bg/frame/stars/sarttpl")):align(slot5.config.rarity)
	setImageSprite(findTF(slot2, "bg/frame/type"), GetSpriteFromAtlas("equiptype", EquipType.type2Tag(slot5.config.type)))
	setText(slot2:Find("bg/frame/speciality/Text"), slot5.config.speciality ~= "无" and slot5.config.speciality or i18n1("—"))

	slot2:Find("bg/frame"):GetComponent(typeof(Image)).sprite = LoadSprite("bg/equipment_bg_" .. slot5.config.rarity)
	slot9 = findTF(slot2, "bg/frame/numbers")

	for slot14 = 0, slot9.childCount - 1 do
		setActive(slot9:GetChild(slot14), slot14 == (slot5.config.tech or 1))
	end

	slot12 = math.floor(slot0:getItemById(slot3.material_id).count / slot3.material_num)
	slot14 = slot0:findTF("bg/calc/values/Text", slot2)
	slot15 = slot3.gold_num
	slot16 = slot0:findTF("bg/calc/gold/Text", slot2)

	function (slot0)
		setText(uv0, slot0)
		setText(uv1, slot0 * uv2)
	end(1)
	onButton(slot0, findTF(slot2, "bg/calc/minus"), function ()
		if uv0 <= 1 then
			return
		end

		uv0 = uv0 - 1

		uv1(uv0)
	end, SFX_PANEL)
	onButton(slot0, findTF(slot2, "bg/calc/add"), function ()
		if uv0 == uv1 then
			return
		end

		uv0 = uv0 + 1

		uv2(uv0)
	end, SFX_PANEL)
	onButton(slot0, findTF(slot2, "bg/calc/max"), function ()
		if uv0 == uv1 then
			return
		end

		uv0 = math.max(math.min(uv1, uv2.player:getMaxEquipmentBag() - uv2.capacity), 1)

		uv3(uv0)
	end, SFX_PANEL)
	onButton(slot0, findTF(slot2, "bg/cancel_btn"), function ()
		uv0:hideMsgBox()
	end, SFX_CANCEL)
	onButton(slot0, findTF(slot2, "bg/confirm_btn"), function ()
		uv0:emit(EquipmentDesignMediator.MAKE_EQUIPMENT, uv1, uv2)
		uv0:hideMsgBox()
	end, SFX_CONFIRM)
	onButton(slot0, slot2, function ()
		uv0:hideMsgBox()
	end, SFX_CANCEL)
end

function slot0.hideMsgBox(slot0)
	if not IsNil(slot0.msgBoxTF) then
		slot0.isShowDesc = nil

		slot0.UIMgr:UnblurPanel(slot0.msgBoxTF, slot0._tf)
		setActive(slot0.msgBoxTF, false)
	end
end

function slot0.onBackPressed(slot0)
	if isActive(slot0.indexPanel) then
		triggerButton(slot0.indexPanel)

		return
	end

	if slot0.isShowDesc then
		slot0:hideMsgBox()
	else
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
		slot0:emit(uv0.ON_BACK)
	end
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.indexPanel, slot0._tf)

	if slot0.leftEventTrigger then
		ClearEventTrigger(slot0.leftEventTrigger)
	end

	if slot0.rightEventTrigger then
		ClearEventTrigger(slot0.rightEventTrigger)
	end

	setParent(slot0.sortBtn.parent, slot0._tf)
end

return slot0
