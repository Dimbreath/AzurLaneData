slot0 = class("EquipmentInfoLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "EquipmentInfoUI"
end

slot0.PANEL_DESTROY = "Destroy"
slot0.PANEL_REVERT = "Revert"
slot0.Left = 1
slot0.Middle = 2
slot0.Right = 3
slot0.pos = {
	{
		-353,
		30,
		0
	},
	{
		0,
		30,
		0
	},
	{
		353,
		30,
		0
	}
}

function slot0.init(slot0)
	slot0.toggles = {}

	for slot5, slot6 in ipairs({
		"default",
		"replace",
		"display",
		"destroy",
		"revert"
	}) do
		slot0[slot6 .. "Panel"] = slot0:findTF(slot6)
		slot0.toggles[slot6 .. "Panel"] = slot0:findTF("toggle_controll/" .. slot6)
	end

	slot0.destroyMsgBox = slot0:findTF("destroy_msgbox")

	setActive(slot0.destroyMsgBox, false)

	slot0.sample = slot0:findTF("sample")

	setActive(slot0.sample, false)
end

function slot0.setEquipment(slot0, slot1)
	slot0.equipmentVO = slot1
end

function slot0.setShip(slot0, slot1, slot2)
	slot0.shipVO = slot1
	slot0.oldShipVO = slot2
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.setRevertItem(slot0, slot1)
	slot0.revertItemVO = slot1 or Item.New({
		count = 0,
		id = Item.REVERT_EQUIPMENT_ID
	})
end

function slot0.checkOverGold(slot0, slot1)
	if slot0.player:GoldMax(_.detect(slot1, function (slot0)
		return slot0.type == DROP_TYPE_RESOURCE and slot0.id == 1
	end).count or 0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_destroy"))

		return false
	end

	return true
end

function slot0.setDestroyCount(slot0, slot1)
	if slot0.destroyCount ~= math.clamp(slot1, 1, slot0.equipmentVO.count) then
		slot0.destroyCount = slot1

		slot0:updateDestroyCount()
	end
end

function slot0.didEnter(slot0)
	slot1 = defaultValue(slot0.contextData.type, EquipmentInfoMediator.TYPE_DEFAULT)
	slot0.isShowUnique = table.contains(EquipmentInfoMediator.SHOW_UNIQUE, slot1)

	onButton(slot0, slot0._tf, function ()
		if isActive(uv0.destroyPanel) then
			triggerToggle(uv0.toggles.defaultPanel, true)

			return
		end

		uv0:emit(uv1.ON_CLOSE)
	end, SOUND_BACK)
	slot0:initAndSetBtn(slot1)

	if slot1 == EquipmentInfoMediator.TYPE_DEFAULT then
		slot0:updateOperation1()
	elseif slot1 == EquipmentInfoMediator.TYPE_SHIP then
		slot0:updateOperation2()
	elseif slot1 == EquipmentInfoMediator.TYPE_REPLACE then
		slot0:updateOperation3()
	elseif slot1 == EquipmentInfoMediator.TYPE_DISPLAY then
		slot0:updateOperation4()
	end

	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
		weight = slot0:getWeightFromData()
	})
end

function slot0.initAndSetBtn(slot0, slot1)
	if slot1 == EquipmentInfoMediator.TYPE_DEFAULT or slot1 == EquipmentInfoMediator.TYPE_SHIP then
		slot0.defaultEquipTF = slot0:findTF("equipment", slot0.defaultPanel) or slot0:cloneSampleTo(slot0.defaultPanel, uv0.Middle, "equipment")
		slot0.defaultReplaceBtn = slot0:findTF("actions/action_button_3", slot0.defaultPanel)
		slot0.defaultDestroyBtn = slot0:findTF("actions/action_button_1", slot0.defaultPanel)
		slot0.defaultEnhanceBtn = slot0:findTF("actions/action_button_2", slot0.defaultPanel)
		slot0.defaultUnloadBtn = slot0:findTF("actions/action_button_4", slot0.defaultPanel)
		slot0.defaultRevertBtn = slot0:findTF("info/equip/revert_btn", slot0.defaultEquipTF)

		onButton(slot0, slot0.defaultReplaceBtn, function ()
			slot0, slot1 = Ship.canModifyShip(uv0.shipVO)

			if not slot0 then
				pg.TipsMgr.GetInstance():ShowTips(slot1)

				return
			end

			uv0:emit(EquipmentInfoMediator.ON_CHANGE)
		end, SFX_PANEL)
		onButton(slot0, slot0.defaultEnhanceBtn, function ()
			if uv0.shipVO then
				slot0, slot1 = Ship.canModifyShip(uv0.shipVO)

				if not slot0 then
					pg.TipsMgr.GetInstance():ShowTips(slot1)

					return
				end
			end

			uv0:emit(EquipmentInfoMediator.ON_INTENSIFY)
		end, SFX_PANEL)
		onButton(slot0, slot0.defaultUnloadBtn, function ()
			slot0, slot1 = Ship.canModifyShip(uv0.shipVO)

			if not slot0 then
				pg.TipsMgr.GetInstance():ShowTips(slot1)

				return
			end

			uv0:emit(EquipmentInfoMediator.ON_UNEQUIP)
		end, SFX_UI_DOCKYARD_EQUIPOFF)
		onButton(slot0, slot0.defaultDestroyBtn, function ()
			triggerToggle(uv0.toggles.destroyPanel, true)

			if not uv0.initDestroyPanel then
				uv0:initAndSetBtn(uv1.PANEL_DESTROY)
			end

			uv0:updateEquipmentPanel(uv0.destroyEquipTF, uv0.equipmentVO)

			if uv0.equipmentVO.count > 0 then
				uv0:setDestroyCount(1)
			end
		end, SFX_PANEL)
		onButton(slot0, slot0.defaultRevertBtn, function ()
			triggerToggle(uv0.toggles.revertPanel, true)

			if not uv0.initRevertPanel then
				uv0:initAndSetBtn(uv1.PANEL_REVERT)
			end

			uv0:updateRevertPanel()
		end, SFX_PANEL)
	elseif slot1 == EquipmentInfoMediator.TYPE_REPLACE then
		slot0.replaceSrcEquipTF = slot0:findTF("equipment", slot0.replacePanel) or slot0:cloneSampleTo(slot0.replacePanel, uv0.Left, "equipment")
		slot0.replaceDstEquipTF = slot0:findTF("equipment_on_ship", slot0.replacePanel) or slot0:cloneSampleTo(slot0.replacePanel, uv0.Right, "equipment_on_ship")
		slot0.replaceCancelBtn = slot0:findTF("actions/cancel_button", slot0.replacePanel)
		slot0.replaceConfirmBtn = slot0:findTF("actions/action_button_2", slot0.replacePanel)

		onButton(slot0, slot0.replaceCancelBtn, function ()
			if isActive(uv0.destroyPanel) then
				triggerToggle(uv0.toggles.defaultPanel, true)

				return
			end

			uv0:emit(uv1.ON_CLOSE)
		end, SFX_CANCEL)
		onButton(slot0, slot0.replaceConfirmBtn, function ()
			slot0, slot1 = uv0.shipVO:canEquipAtPos(uv0.equipmentVO, uv0.contextData.pos)

			if not slot0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_equipmentInfoLayer_error_canNotEquip", slot1))

				return
			end

			uv0:emit(EquipmentInfoMediator.ON_EQUIP)
		end, SFX_UI_DOCKYARD_EQUIPADD)
	elseif slot1 == EquipmentInfoMediator.TYPE_DISPLAY then
		slot0.displayEquipTF = slot0:findTF("equipment", slot0.displayPanel) or slot0:cloneSampleTo(slot0.displayPanel, uv0.Middle, "equipment")
		slot0.displayMoveBtn = slot0:findTF("actions/move_button", slot0.displayPanel)

		onButton(slot0, slot0.displayMoveBtn, function ()
			uv0:emit(EquipmentInfoMediator.ON_MOVE, uv0.shipVO.id)
		end)
	elseif slot1 == uv0.PANEL_DESTROY then
		slot0.initDestroyPanel = true
		slot0.destroyEquipTF = slot0:findTF("equipment", slot0.destroyPanel) or slot0:cloneSampleTo(slot0.destroyPanel, uv0.Left, "equipment")
		slot0.destroyCounter = slot0:findTF("destroy", slot0.destroyPanel)
		slot0.destroyValue = slot0:findTF("count/number_panel/value", slot0.destroyCounter)
		slot0.destroyLeftButton = slot0:findTF("count/number_panel/left", slot0.destroyCounter)
		slot0.destroyRightButton = slot0:findTF("count/number_panel/right", slot0.destroyCounter)
		slot0.destroyBonusList = slot0:findTF("got/list", slot0.destroyCounter)
		slot0.destroyBonusItem = slot0:findTF("got/item", slot0.destroyCounter)
		slot0.destroyCancelBtn = slot0:findTF("actions/cancel_button", slot0.destroyPanel)
		slot0.destroyConfirmBtn = slot0:findTF("actions/destroy_button", slot0.destroyPanel)

		onButton(slot0, slot0.destroyLeftButton, function ()
			uv0:setDestroyCount(uv0.destroyCount - 1)
		end, SFX_PANEL)
		onButton(slot0, slot0.destroyRightButton, function ()
			uv0:setDestroyCount(uv0.destroyCount + 1)
		end, SFX_PANEL)
		onButton(slot0, slot0:findTF("count/max", slot0.destroyCounter), function ()
			uv0:setDestroyCount(uv0.equipmentVO.count)
		end, SFX_PANEL)
		onButton(slot0, slot0.destroyCancelBtn, function ()
			triggerToggle(uv0.toggles.defaultPanel, true)
		end, SFX_CANCEL)
		onButton(slot0, slot0.destroyConfirmBtn, function ()
			if not uv0:checkOverGold(uv0.awards) then
				return
			end

			if uv0.equipmentVO:isImportance() then
				uv0:showDestoryMsgbox(slot0)
			else
				uv0:emit(EquipmentInfoMediator.ON_DESTROY, uv0.destroyCount)
			end
		end, SFX_UI_EQUIPMENT_RESOLVE)
	elseif slot1 == uv0.PANEL_REVERT then
		slot0.initRevertPanel = true
		slot0.revertEquipTF = slot0:findTF("equipment", slot0.revertPanel) or slot0:cloneSampleTo(slot0.revertPanel, uv0.Left, "equipment")
		slot0.revertAwardContainer = slot0:findTF("item_panel/got/list", slot0.revertPanel)
		slot0.revertCancelBtn = slot0:findTF("actions/cancel_button", slot0.revertPanel)
		slot0.revertConfirmBtn = slot0:findTF("actions/revert_button", slot0.revertPanel)
		slot0.itemTpl = slot0:getTpl("item_panel/got/item", slot0.revertPanel)

		onButton(slot0, slot0.revertCancelBtn, function ()
			triggerToggle(uv0.toggles.defaultPanel, true)
		end, SFX_CANCEL)
		onButton(slot0, slot0.revertConfirmBtn, function ()
			if not uv0:checkOverGold(uv0.awards) then
				return
			end

			uv0:emit(EquipmentInfoMediator.ON_REVERT, uv0.equipmentVO.id)
		end, SFX_UI_EQUIPMENT_RESOLVE)
	end
end

function slot0.updateOperation1(slot0)
	triggerToggle(slot0.toggles.defaultPanel, true)
	slot0:updateEquipmentPanel(slot0.defaultEquipTF, slot0.equipmentVO)
	setActive(slot0.defaultRevertBtn, slot0.fromEquipmentView and slot0.equipmentVO.config.level > 1 and slot0.revertItemVO.count > 0)
	setActive(slot0.defaultReplaceBtn, false)
	setActive(slot0.defaultUnloadBtn, false)
	setActive(slot0.defaultDestroyBtn, slot0.contextData.destroy and slot0.equipmentVO.count > 0)
end

function slot0.updateOperation2(slot0)
	triggerToggle(slot0.toggles.defaultPanel, true)
	slot0:updateEquipmentPanel(slot0.defaultEquipTF, slot0.shipVO:getEquip(slot0.contextData.pos))
	setActive(slot0.defaultDestroyBtn, false)
	setActive(slot0.defaultReplaceBtn, true)
	setActive(slot0.defaultUnloadBtn, true)
	setActive(slot0.defaultRevertBtn, false)
	setActive(slot0:findTF("head", slot0.defaultEquipTF), slot0.shipVO)

	if slot0.shipVO then
		setImageSprite(findTF(slot1, "Image"), LoadSprite("qicon/" .. slot0.shipVO:getPainting()))
	end
end

function slot0.updateOperation3(slot0)
	triggerToggle(slot0.toggles.replacePanel, true)

	slot1 = slot0.shipVO:getEquip(slot0.contextData.pos)

	slot0:updateEquipmentPanel(slot0.replaceSrcEquipTF, slot1)
	slot0:updateEquipmentPanel(slot0.replaceDstEquipTF, slot0.equipmentVO, slot1)
	setActive(slot0:findTF("head", slot0.replaceDstEquipTF), slot0.oldShipVO)

	if slot0.oldShipVO then
		setImageSprite(findTF(slot3, "Image"), LoadSprite("qicon/" .. slot0.oldShipVO:getPainting()))
	end
end

function slot0.updateOperation4(slot0)
	triggerToggle(slot0.toggles.displayPanel, true)
	slot0:updateEquipmentPanel(slot0.displayEquipTF, slot0.equipmentVO)
	setActive(slot0.displayMoveBtn, slot0.shipVO)
	setActive(slot0:findTF("head", slot0.displayEquipTF), slot0.shipVO)

	if slot0.shipVO then
		setImageSprite(findTF(slot1, "Image"), LoadSprite("qicon/" .. slot0.shipVO:getPainting()))
	end
end

function slot0.updateRevertPanel(slot0)
	slot1 = slot0.equipmentVO

	slot0:updateEquipmentPanel(slot0.revertEquipTF, slot1:GetRootEquipment(), slot1, true)
	slot0:updateOperationAward(slot0.revertAwardContainer, slot0.itemTpl, slot1:getRevertAwards())
end

function slot0.updateDestroyCount(slot0)
	setText(slot0.destroyValue, slot0.destroyCount)

	slot2 = {}

	if pg.equip_data_template[slot0.equipmentVO.config.id] then
		slot3 = 0 + (slot4.destory_gold or 0) * slot1

		for slot10, slot11 in ipairs(slot4.destory_item or {}) do
			table.insert(slot2, {
				type = DROP_TYPE_ITEM,
				id = slot11[1],
				count = slot11[2] * slot1
			})
		end

		table.insert(slot2, {
			id = 1,
			type = DROP_TYPE_RESOURCE,
			count = slot3
		})
	end

	slot0:updateOperationAward(slot0.destroyBonusList, slot0.destroyBonusItem, slot2)
end

function slot0.updateOperationAward(slot0, slot1, slot2, slot3)
	slot0.awards = slot3

	if slot1.childCount == 0 then
		for slot7 = 1, #slot3 do
			cloneTplTo(slot2, slot1)
		end
	end

	for slot7 = 1, #slot3 do
		slot8 = slot1:GetChild(slot7 - 1)

		updateDrop(slot8, slot3[slot7])
		onButton(slot0, slot8, function ()
			uv0:emit(uv1.ON_DROP, uv2)
		end, SFX_PANEL)
		setText(findTF(slot8, "name_panel/name"), getText(findTF(slot8, "name")))
		setText(findTF(slot8, "name_panel/number"), " x " .. getText(findTF(slot8, "icon_bg/count")))
		setActive(findTF(slot8, "icon_bg/count"), false)
	end
end

function slot0.updateEquipmentPanel(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot3 and slot3:GetProperties(true) or nil

	setActive(slot0:findTF("info", slot1), slot2)
	setActive(slot0:findTF("empty", slot1), not slot2)

	if slot2 then
		slot8 = findTF(slot6, "name")

		setText(slot8, slot2.config.name)
		setActive(findTF(slot8, "unique"), slot2:isUnique() and slot0.isShowUnique)

		slot9 = findTF(slot6, "equip")

		updateEquipment(slot9, slot2, {
			noIconColorful = true
		})
		setActive(findTF(slot9, "revert_btn"), false)
		setText(findTF(slot9, "slv/Text"), slot2.config.level - 1)
		setActive(findTF(slot9, "slv/next"), slot4)

		if slot4 then
			setText(findTF(slot9, "slv/Text"), slot3.config.level - 1)
			setText(findTF(slot9, "slv/next/Text"), slot2.config.level - 1)
		end

		setActive(findTF(slot9, "slv"), slot4 or slot2.config.level > 1)
		setImageSprite(findTF(slot9, "title"), GetSpriteFromAtlas("equiptype", EquipType.type2Tag(slot2.config.type)))
		setImageSprite(findTF(slot9, "bg"), GetSpriteFromAtlas("ui/equipmentinfoui_atlas", "equip_bg_" .. EquipmentRarity.Rarity2Print(slot2.config.rarity)))
		setActive(slot0:findTF("tier", slot9), slot2)

		slot11 = slot2.config.tech or 1

		eachChild(slot10, function (slot0)
			setActive(slot0, tostring(uv0) == slot0.gameObject.name)
		end)
		setText(slot9:Find("speciality/Text"), slot2.config.speciality ~= "无" and slot2.config.speciality or i18n1("—"))

		slot14 = findTF(findTF(slot6, "attributes"), "panel/view/infomation")
		slot16 = findTF(findTF(slot14, "attrs"), "attr")
		slot18 = slot2:GetProperties(true)
		slot19 = slot2:GetSkill()
		slot21 = EquipType.isAircraft(slot2.configId) and pg.aircraft_template[slot2.configId].weapon_ID or {}

		setActive(findTF(slot14, "skill"), slot19)

		if slot19 then
			setText(findTF(slot17, "attr/name"), i18n("skill"))
			setText(findTF(slot17, "attr/value"), setColorStr(slot19.name, "#FFDE00FF"))
			setText(findTF(slot17, "value/Text"), getSkillDescGet(slot19.id))
		end

		eachChild(slot15, function (slot0)
			setActive(slot0, false)
			removeOnButton(slot0)
		end)

		for slot26, slot27 in pairs(slot18) do
			slot28 = 0 + 1 <= slot15.childCount and slot15:GetChild(slot22 - 1) or cloneTplTo(slot16, slot15)
			slot29 = findTF(slot28, "name")
			slot30 = findTF(slot28, "value")
			slot32 = findTF(slot30, "down")

			if findTF(slot30, "up") and slot32 then
				setActive(slot31, false)
				setActive(slot32, false)
			end

			setActive(slot28, slot27)
			setActive(slot29:Find("tip"), false)

			if slot27 then
				if EquipType.isDevice(slot2.configId) then
					setText(slot29, AttributeType.Type2Name(slot27.type))
					setText(slot30, slot27.value)

					if slot5 then
						slot33 = false

						for slot37 = 1, 3 do
							if slot5[slot37] and slot27.type == slot5[slot37].type then
								if slot27.type == AttributeType.SonarInterval then
									setActive(slot31, slot27.value < slot5[slot37].value)
									setActive(slot32, slot5[slot37].value < slot27.value)

									break
								end

								if slot27.type == AttributeType.Damage then
									slot38 = 0
									slot39 = 0

									if string.match(slot27.value, i18n("word_secondseach")) == string.match(slot5[slot37].value, i18n("word_secondseach")) then
										if slot40 == i18n("word_secondseach") then
											slot38 = string.gsub(slot27.value, slot40, "")
											slot39 = string.gsub(slot5[slot37].value, slot40, "")
										else
											slot42, slot43 = string.match(string.gsub(slot27.value, " ", ""), "(%d+)x(%d+)")
											slot38 = (slot42 or 0) * (slot43 or 0)
											slot44, slot45 = string.match(string.gsub(slot5[slot37].value, " ", ""), "(%d+)x(%d+)")
											slot39 = (slot44 or 0) * (slot45 or 0)
										end

										setActive(slot31, tonumber(slot39) < tonumber(slot38))
										setActive(slot32, tonumber(slot38) < tonumber(slot39))
									end

									break
								end

								setActive(slot31, slot5[slot37].value < slot27.value)
								setActive(slot32, slot27.value < slot5[slot37].value)

								break
							end
						end
					end
				else
					setTextFont(slot30, pg.FontMgr.GetInstance().fonts.number)

					if slot27.type == AttributeType.Reload then
						slot33 = 0

						if slot0.shipVO then
							setText(slot29, AttributeType.Type2Name(AttributeType.CD))

							slot33 = slot0.shipVO:calcWeaponCD(slot2)
						else
							setText(slot29, i18n("cd_normal"))

							slot33 = slot2:getWeaponCD()
						end

						setText(slot30, setColorStr(slot33 .. "s", COLOR_YELLOW) .. i18n("word_secondseach"))

						if slot5 and slot26 < #slot5 and slot5[slot26] then
							slot34 = slot0.shipVO and slot0.shipVO:calcWeaponCD(slot3) or slot3:getWeaponCD()

							setActive(slot31, slot33 - slot34 < 0)
							setActive(slot32, slot33 - slot34 > 0)
						end
					else
						setText(slot29, AttributeType.Type2Name(slot27.type))

						slot33 = slot27.value

						if slot27.type == "dodge_limit" then
							setActive(slot29:Find("tip"), true)
							onButton(slot0, slot28, function ()
								pg.MsgboxMgr.GetInstance():ShowMsgBox({
									type = MSGBOX_TYPE_HELP,
									helps = i18n("help_attribute_dodge_limit"),
									weight = uv0:getWeightFromData()
								})
							end, SFX_PANEL)
						end

						if slot27.type == AttributeType.Ammo then
							slot33 = setColorStr(slot27.value, COLOR_YELLOW)
						end

						setText(slot30, slot33)

						if slot5 and slot26 < #slot5 then
							if not slot5[slot26] then
								setActive(slot31, true)
							elseif slot27.type == AttributeType.Damage then
								slot34 = 0
								slot35 = 0

								if string.match(slot27.value, i18n("word_secondseach")) == string.match(slot5[slot26].value, i18n("word_secondseach")) then
									if slot36 == i18n("word_secondseach") then
										slot34 = string.gsub(slot27.value, slot36, "")
										slot35 = string.gsub(slot5[slot26].value, slot36, "")
									else
										slot38, slot39 = string.match(string.gsub(slot27.value, " ", ""), "(%d+)x(%d+)")
										slot34 = (slot38 or 0) * (slot39 or 0)
										slot40, slot41 = string.match(string.gsub(slot5[slot26].value, " ", ""), "(%d+)x(%d+)")
										slot35 = (slot40 or 0) * (slot41 or 0)
									end

									setActive(slot31, tonumber(slot35) < tonumber(slot34))
									setActive(slot32, tonumber(slot34) < tonumber(slot35))
								end
							elseif slot27.type == AttributeType.SonarInterval then
								setActive(slot31, type(slot5[slot26].value) == "number" and slot27.value < slot5[slot26].value)
								setActive(slot32, type(slot5[slot26].value) == "number" and slot5[slot26].value < slot27.value)
							elseif slot27.type ~= AttributeType.Scatter and slot27.type ~= AttributeType.Angle then
								setActive(slot31, type(slot5[slot26].value) == "number" and slot5[slot26].value < slot27.value)
								setActive(slot32, type(slot5[slot26].value) == "number" and slot27.value < slot5[slot26].value)
							end
						end
					end
				end
			end
		end

		for slot26, slot27 in ipairs(slot21) do
			slot28 = slot22 + 1 <= slot15.childCount and slot15:GetChild(slot22 - 1) or cloneTplTo(slot16, slot15)
			slot29 = findTF(slot28, "name")
			slot30 = findTF(slot28, "value")
			slot32 = findTF(slot30, "down")

			if findTF(slot30, "up") and slot32 then
				setActive(slot31, false)
				setActive(slot32, false)
			end

			setActive(slot28, true)
			setTextFont(slot30, pg.FontMgr.GetInstance().fonts.heiti)
			setText(slot29, "")
			setText(slot30, setColorStr(pg.weapon_property[slot27].name, COLOR_YELLOW))
		end

		setActive(slot14, true)
		setActive(findTF(slot13, "panel/view/adaptation"), false)

		slot25 = slot2.config.part_main and #slot2.config.part_main or 0
		slot26 = slot2.config.part_sub and #slot2.config.part_sub or 0
		slot28 = findTF(slot23, "attrs/attr_2")

		setActive(findTF(slot23, "attrs/attr_1"), slot25 > 0)

		if slot25 > 0 then
			setText(slot0:findTF("name", slot27), i18n("equip_part_title"))
			setText(slot0:findTF("value", slot27), function (slot0)
				for slot5, slot6 in ipairs(slot0) do
					slot7 = pg.ship_data_by_type[slot6]
					slot1 = (nil or slot7.type_name) and slot7.type_name .. "  " .. slot7.type_name
				end

				return slot1
			end(slot2.config.part_main))
		end

		setActive(slot28, slot26 > 0)

		if slot26 > 0 then
			setText(slot0:findTF("name", slot27), i18n("equip_part_main_title"))
			setText(slot0:findTF("name", slot28), i18n("equip_part_sub_title"))
			setText(slot0:findTF("value", slot28), slot24(slot2.config.part_sub))
		end

		setActive(findTF(slot13, "panel/part_btn"), slot25 > 0 or slot26 > 0)
		setText(findTF(slot29, "Text"), i18n("equip_part_tip"))

		if not slot0.showPart then
			slot0.showPart = {}
		end

		slot0.showPart[slot29] = false

		if slot25 > 0 or slot26 > 0 then
			onButton(slot0, findTF(slot13, "panel/view"), function ()
				uv0.showPart[uv1] = not uv0.showPart[uv1]

				setActive(uv2, not uv0.showPart[uv1])
				setActive(uv3, uv0.showPart[uv1])
			end)
		end

		slot30 = findTF(slot13, "affix")
	end
end

function slot0.showDestoryMsgbox(slot0, slot1)
	slot0.isOpenDestoryMsgbox = true

	setActive(slot0.destroyMsgBox, true)

	if not slot0.isInitDestoryMsgBox then
		slot0.isInitDestoryMsgBox = true
		slot0.destroyMsgboxIntro = slot0.destroyMsgBox:Find("window/info/intro")
		slot0.destroyMsgBoxConfirmBtn = slot0.destroyMsgBox:Find("window/button_container/confirm_btn")
		slot0.destroyMsgBoxCancelBtn = slot0.destroyMsgBox:Find("window/button_container/cancel_btn")
		slot0.destroyMsgBoxInput = slot0.destroyMsgBox:Find("window/info/InputField")
		slot0.destoryMsgboxBackBtn = slot0.destroyMsgBox:Find("window/top/btnBack")
	end

	setText(slot0.destroyMsgboxIntro, i18n("destory_important_equipment_tip", slot1.config.name))
	onButton(slot0, slot0.destroyMsgBoxConfirmBtn, function ()
		if not getInputText(uv0.destroyMsgBoxInput) or slot0 == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_should_input"))

			return
		end

		if slot0 ~= uv1.config.name then
			pg.TipsMgr.GetInstance():ShowTips(i18n("destory_important_equipment_input_erro"))

			return
		end

		uv0:emit(EquipmentInfoMediator.ON_DESTROY, 1)
		uv0:closeDestoryMsgbox()
	end, SFX_PANEL)
	onButton(slot0, slot0.destroyMsgBoxCancelBtn, function ()
		uv0:closeDestoryMsgbox()
	end, SFX_PANEL)
	onButton(slot0, slot0.destoryMsgboxBackBtn, function ()
		uv0:closeDestoryMsgbox()
	end, SFX_PANEL)
end

function slot0.closeDestoryMsgbox(slot0)
	slot0.isOpenDestoryMsgbox = nil

	setActive(slot0.destroyMsgBox, false)
end

function slot0.cloneSampleTo(slot0, slot1, slot2, slot3, slot4)
	cloneTplTo(slot0.sample, slot1, slot3).localPosition = Vector3.New(uv0.pos[slot2][1], uv0.pos[slot2][2], uv0.pos[slot2][3])

	if slot4 then
		slot5:SetSiblingIndex(slot4)
	end

	return slot5
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
end

function slot0.onBackPressed(slot0)
	if slot0.isOpenDestoryMsgbox then
		slot0:closeDestoryMsgbox()

		return
	end

	if isActive(slot0.destroyPanel) then
		triggerToggle(slot0.toggles.defaultPanel, true)

		return
	end

	slot0:emit(uv0.ON_CLOSE)
end

return slot0
