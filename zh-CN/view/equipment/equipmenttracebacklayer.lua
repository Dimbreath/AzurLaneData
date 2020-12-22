slot0 = class("EquipmentTraceBackLayer", import("view.base.BaseUI"))

function slot0.GetTracebackResultFuncCreator()
	slot0 = {}

	for slot5, slot6 in pairs(getProxy(EquipmentProxy):GetEquipmentsRaw()) do
		slot0[slot6.id] = slot0[slot6.id] or {}

		table.insert(slot0[slot6.id], CreateShell(slot6))
	end

	for slot5, slot6 in pairs(getProxy(BayProxy):GetEquipsInShipsRaw()) do
		slot0[slot6.id] = slot0[slot6.id] or {}

		table.insert(slot0[slot6.id], slot6)
	end

	slot3 = nil

	function slot3(slot0, slot1, slot2)
		if #EquipmentProxy.GetTransformSources(slot0) == 0 then
			table.insert(slot2 or {}, slot1 or {
				slot0
			})
		end

		for slot7, slot8 in ipairs(slot3) do
			slot9 = pg.equip_upgrade_data[slot8].upgrade_from
			slot10 = slot7 == #slot3 and slot1 or Clone(slot1)

			table.insert(slot10, slot9)

			slot10.formulas = slot10.formulas or {}

			table.insert(slot10.formulas, 1, slot8)

			if #uv0(slot9) > 0 then
				slot10.candicates = slot11

				table.insert(slot2, slot10)
			elseif slot9 == 0 then
				slot10.candicates = {
					setmetatable({
						id = 0
					}, Equipment)
				}

				table.insert(slot2, slot10)
			else
				uv1(slot9, slot10, slot2)
			end
		end

		return slot2
	end

	function slot5(slot0, slot1)
		return slot0.id == slot1.id and slot0.shipId == slot1.shipId and slot0.shipPos == slot1.shipPos
	end

	return {
		traceback = function (...)
			slot0 = uv0(...)

			table.sort(slot0, function (slot0, slot1)
				if #slot0 ~= #slot1 then
					return #slot0 < #slot1
				else
					for slot5 = 1, #slot0 do
						if slot0[slot5] ~= slot1[1] then
							return slot0[slot5] < slot1[slot5]
						end
					end

					return false
				end
			end)

			return slot0
		end,
		getSameEquipTypeInDict = function (slot0)
			slot1 = {}

			while slot0 ~= nil do
				if uv0[slot0] then
					table.insertto(slot1, uv0[slot0])
				end

				slot0 = pg.equip_data_template[slot0] and pg.equip_data_template[slot0].next
			end

			return slot1
		end,
		findEquip = function (slot0)
			if not slot0 or not uv0[slot0.id] then
				return
			end

			for slot4, slot5 in ipairs(uv0[slot0.id]) do
				if uv1(slot0, slot5) then
					return slot4, slot5
				end
			end
		end,
		addEquip = function (slot0)
			uv0[slot0.id] = uv0[slot0.id] or {}
			uv0[slot0.id][uv1(slot0) or #uv0[slot0.id] + 1] = slot0
		end,
		removeEquip = function (slot0)
			if not slot0 or not uv0[slot0.id] then
				return
			end

			if not uv1(slot0) then
				return
			end

			table.remove(uv0[slot0.id], slot1)
		end,
		updateEquip = function (slot0)
			if slot0.count == 0 then
				uv0(slot0)
			else
				uv1(slot0)
			end
		end
	}
end

function slot0.getUIName(slot0)
	return "EquipmentTraceBackUI"
end

function slot0.init(slot0)
	slot1 = slot0._tf:Find("Adapt/Left/Operation")
	slot0.sortOrderBtn = slot1:Find("Bar1")
	slot0.orderText = slot1:Find("OrderText")
	slot0.sortBarBtn = slot1:Find("Bar2")
	slot0.sortImg = slot1:Find("SortImg")
	slot0.sortBar = slot0._tf:Find("Adapt/Left/SortBar")

	setActive(slot0.sortBar, false)

	slot0.equipLayout = slot0._tf:Find("Adapt/Left/Scroll View")
	slot0.equipLayoutContent = slot0.equipLayout:Find("Viewport/Content")
	slot0.equipLayoutContent:GetComponent(typeof(GridLayoutGroup)).constraintCount = 6
	slot3 = slot0._tf:Find("Adapt/Right")
	slot0.sourceEquip = slot3:Find("Source")
	slot0.sourceEquipStatus = slot3:Find("Status")
	slot0.formulaWire = slot3:Find("Wire")
	slot0.targetEquip = slot3:Find("Target")
	slot0.confirmBtn = slot3:Find("ConfirmBtn")
	slot0.cancelBtn = slot3:Find("CancelBtn")
	slot0.materialLayout = slot3:Find("Scroll View")
	slot0.materialLayoutContent = slot0.materialLayout:Find("Viewport/Content")
	slot0.goldText = slot3:Find("GoldText")

	setText(slot1:Find("Field/Text"), i18n("equipment_upgrade_quick_interface_source_chosen"))
	setText(slot3:Find("Text"), i18n("equipment_upgrade_quick_interface_materials_consume"))

	slot0.loader = AutoLoader.New()
end

slot0.SortType = {
	Rarity = "rarity",
	Strengthen = "level",
	Type = "type"
}
slot1 = {
	slot0.SortType.Rarity,
	slot0.SortType.Type,
	slot0.SortType.Strengthen
}
slot2 = {
	[slot0.SortType.Rarity] = "rarity",
	[slot0.SortType.Type] = "type",
	[slot0.SortType.Strengthen] = "strengthen"
}
slot0.SortOrder = {
	Descend = 0,
	Ascend = 1
}
slot3 = {
	[slot0.SortOrder.Descend] = "word_desc",
	[slot0.SortOrder.Ascend] = "word_asc"
}

function slot0.SetEnv(slot0, slot1)
	slot0.env = slot1
end

function slot0.GetAllPaths(slot0, slot1)
	slot2 = {}
	slot3 = {
		{
			slot1
		}
	}

	while #slot3 > 0 do
		for slot9, slot10 in ipairs(EquipmentProxy.GetTransformSources(table.remove(slot3, 1)[1])) do
			slot11 = pg.equip_upgrade_data[slot10].upgrade_from
			slot12 = slot4[2] and Clone(slot4[2]) or {}

			table.insert(slot12, 1, slot10)
			table.insert(slot3, {
				slot11,
				slot12
			})

			if #slot0.env.GetSameTypeInEquips(slot11) > 0 then
				table.insertto(slot2, _.map(slot13, function (slot0)
					return {
						equipment = slot0,
						formulas = uv0
					}
				end))
			end
		end
	end

	return slot2
end

function slot0.UpdateSourceEquipmentPaths(slot0)
	slot0.totalPaths = slot0:GetAllPaths(slot0.contextData.TargetEquipmentId)

	if slot0.contextData.sourceEquipmentInstance then
		slot0.contextData.sourceEquipmentInstance = _.detect(slot0.totalPaths, function (slot0)
			return EquipmentTransformLayer.SameEquip(slot0.equipment, uv0.contextData.sourceEquipmentInstance)
		end) and slot1.equipment or nil
	end
end

function slot0.UpdateSort(slot0)
	for slot4, slot5 in ipairs(slot0.totalPaths) do
		slot5.isMaterialEnough = TransformEquipmentCommand.CheckEquipmentFormulasSucceed(slot5.formulas, slot5.equipment.id)
	end

	table.sort(slot0.totalPaths, function (slot0, slot1)
		if slot0.isMaterialEnough ~= slot1.isMaterialEnough then
			return slot0.isMaterialEnough
		else
			slot2 = uv0.contextData.sortType

			return (slot0.equipment.config[slot2] - slot1.equipment.config[slot2] ~= 0 and slot6 or slot0.equipment.id - slot1.equipment.id) * (uv0.contextData.sortOrder == uv1.SortOrder.Descend and 1 or -1) > 0
		end
	end)
	setText(slot0.orderText, i18n(uv1[slot0.contextData.sortOrder]))
	slot0.loader:GetSprite("ui/equipmenttracebackui_atlas", uv2[slot0.contextData.sortType], slot0.sortImg)
end

function slot0.didEnter(slot0)
	function slot4()
		setActive(uv0.sortBar, not isActive(uv0.sortBar))
	end

	onButton(slot0, slot0.sortBarBtn, slot4, SFX_PANEL)

	for slot4 = 1, slot0.sortBar.childCount do
		onButton(slot0, slot0.sortBar:GetChild(slot4 - 1), function ()
			uv0.contextData.sortType = uv1[uv2]

			uv0:UpdateSort()
			uv0:UpdateSourceList()
			setActive(uv0.sortBar, false)
		end, SFX_PANEL)
	end

	onButton(slot0, slot0.sortOrderBtn, function ()
		uv0.contextData.sortOrder = uv1.SortOrder.Ascend - uv0.contextData.sortOrder

		uv0:UpdateSort()
		uv0:UpdateSourceList()
	end, SFX_PANEL)
	onButton(slot0, slot0.cancelBtn, function ()
		uv0:closeView()
	end, SFX_CANCEL)
	onButton(slot0, slot0.confirmBtn, function ()
		if not uv0.contextData.sourceEquipmentInstance then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_upgrade_quick_interface_feedback_source_chosen"))

			return
		end

		if slot0.count == 0 or not TransformEquipmentCommand.CheckEquipmentFormulasSucceed(uv0.contextData.sourceEquipmentFormulaList, slot0.id) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_upgrade_feedback_lack_of_materials"))

			return
		end

		if slot0.shipId ~= nil then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("equipment_upgrade_feedback_equipment_consume", getProxy(BayProxy):getShipById(slot0.shipId).name, slot0.config.name),
				onYes = function ()
					uv0:emit(EquipmentTraceBackMediator.TRANSFORM_EQUIP, uv1, uv0.contextData.sourceEquipmentFormulaList)
				end
			})

			return
		end

		uv0:emit(EquipmentTraceBackMediator.TRANSFORM_EQUIP, slot0, uv0.contextData.sourceEquipmentFormulaList)
	end, SFX_PANEL)

	slot0.contextData.sortOrder = slot0.contextData.sortOrder or uv1.SortOrder.Descend
	slot0.contextData.sortType = slot0.contextData.sortType or uv1.SortType.Rarity

	slot0:UpdateSourceEquipmentPaths()
	slot0:UpdateSort()
	slot0:UpdateSourceList()
	slot0:UpdateFormula()
	updateDrop(slot0.targetEquip, {
		type = DROP_TYPE_EQUIP,
		id = slot0.contextData.TargetEquipmentId
	})
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, true)
end

function slot0.UpdateSourceList(slot0)
	slot0.lastSourceItem = nil

	UIItemList.StaticAlign(slot0.equipLayoutContent, slot0.equipLayoutContent:GetChild(0), #slot0.totalPaths, function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			uv0:UpdateSourceListItem(slot1, slot2)
		end
	end)
	Canvas.ForceUpdateCanvases()

	slot1 = slot0.equipLayoutContent.rect.height < slot0.equipLayout.rect.height
	slot0.equipLayout:GetComponent(typeof(ScrollRect)).enabled = not slot1

	setActive(slot0.equipLayout:Find("Scrollbar"), not slot1)

	if slot1 then
		slot0.equipLayoutContent.anchoredPosition = Vector2.zero
	end
end

function slot0.UpdateSourceListItem(slot0, slot1, slot2)
	slot3 = slot0.totalPaths[slot1 + 1].equipment

	updateDrop(slot2:Find("Item"), {
		type = DROP_TYPE_EQUIP,
		id = slot3.id,
		count = slot3.count
	})
	setText(slot2:Find("Item/icon_bg/count"), slot3.count)
	setActive(slot2:Find("EquipShip"), slot3.shipId)
	setActive(slot2:Find("Selected"), false)

	if slot3 == slot0.contextData.sourceEquipmentInstance then
		slot0.lastSourceItem = slot2

		setActive(slot2:Find("Selected"), true)
	end

	if slot3.shipId then
		slot0.loader:GetSprite("qicon/" .. getProxy(BayProxy):getShipById(slot3.shipId):getPainting(), "", slot2:Find("EquipShip/Image"))
	end

	slot2:Find("Mask/NameText"):GetComponent(typeof(ScrollText)):SetText(slot3.config.name)
	onButton(slot0, slot2:Find("Item"), function ()
		if uv0.lastSourceItem then
			setActive(uv0.lastSourceItem:Find("Selected"), false)
		end

		uv0.lastSourceItem = uv1

		setActive(uv1:Find("Selected"), true)

		uv0.contextData.sourceEquipmentInstance = uv2
		uv0.contextData.sourceEquipmentFormulaList = uv0.totalPaths[uv3 + 1].formulas

		uv0:UpdateFormula()
	end, SFX_PANEL)
end

function slot0.UpdatePlayer(slot0, slot1)
	slot0.player = slot1

	slot0:UpdateConsumeComparer()
end

function slot0.UpdateConsume(slot0, slot1)
	slot0.consumeGold = slot1

	slot0:UpdateConsumeComparer()
end

function slot0.UpdateConsumeComparer(slot0)
	slot0.goldText:GetComponent(typeof(Text)).text = setColorStr(slot0.consumeGold or 0, (slot0.player.gold or 0) >= (slot0.consumeGold or 0) and COLOR_WHITE or COLOR_RED)
end

function slot0.UpdateFormula(slot0)
	slot1 = slot0.contextData.sourceEquipmentInstance

	setActive(slot0.sourceEquipStatus, not slot1)
	setActive(slot0.sourceEquip, slot1)
	setActive(slot0.materialLayout, slot1)

	if slot1 then
		updateDrop(slot0.sourceEquip, {
			type = DROP_TYPE_EQUIP,
			id = slot1.id
		})
		slot0.loader:GetSprite("ui/equipmenttracebackui_atlas", (not slot0.contextData.sourceEquipmentFormulaList or #slot2 <= 1) and "wire" or "wire2", slot0.formulaWire)
		slot0:UpdateFormulaMaterials()
	else
		slot0:UpdateConsume(0)
	end
end

function slot0.UpdateFormulaMaterials(slot0)
	if not slot0.contextData.sourceEquipmentFormulaList then
		return
	end

	slot1 = {}
	slot2 = 0

	for slot6, slot7 in ipairs(slot0.contextData.sourceEquipmentFormulaList) do
		for slot12, slot13 in ipairs(pg.equip_upgrade_data[slot7].material_consume) do
			slot1[slot13[1]] = (slot1[slot13[1]] or 0) + slot13[2]
		end

		slot2 = slot2 + slot8.coin_consume
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot1) do
		table.insert(slot3, {
			id = slot7,
			count = slot8
		})
	end

	table.sort(slot3, function (slot0, slot1)
		return slot1.id < slot0.id
	end)

	slot0.consumeMaterials = slot3

	UIItemList.StaticAlign(slot0.materialLayoutContent, slot0.materialLayoutContent:GetChild(0), #slot0.consumeMaterials, function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			uv0:UpdateFormulaMaterialItem(slot1, slot2)
		end
	end)
	Canvas.ForceUpdateCanvases()

	slot4 = slot0.materialLayoutContent.rect.height < slot0.materialLayout.rect.height
	slot0.materialLayout:GetComponent(typeof(ScrollRect)).enabled = not slot4

	setActive(slot0.materialLayout:Find("Scrollbar"), not slot4)

	if slot4 then
		slot0.materialLayoutContent.anchoredPosition = Vector2.zero
	end

	slot0:UpdateConsume(slot2)
end

function slot0.UpdateFormulaMaterialItem(slot0, slot1, slot2)
	slot3 = slot0.consumeMaterials[slot1 + 1]

	updateDrop(slot2:Find("Item"), {
		type = DROP_TYPE_ITEM,
		id = slot3.id
	})
	setText(slot2:Find("Count"), setColorStr(slot3.count, slot3.count <= getProxy(BagProxy):getItemCountById(slot3.id) and COLOR_GREEN or COLOR_RED) .. "/" .. slot5)
	onButton(slot0, slot2:Find("Item"), function ()
		uv0:emit(uv1.ON_DROP, uv2)
	end)
end

function slot0.willExit(slot0)
	slot0.loader:Clear()
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
end

return slot0
