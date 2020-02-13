slot0 = class("ShipModLayer", import("..base.BaseUI"))
slot1 = 12
slot0.IGNORE_ID = 4

function slot0.getUIName(slot0)
	return "ShipModUI"
end

function slot0.setShipVOs(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.init(slot0)
	slot0.blurPanelTF = slot0:findTF("blur_panel")
	slot0.mainPanel = slot0:findTF("blur_panel/main")
	slot0.shipContainer = slot0:findTF("bg/add_ship_panel/ships", slot0.mainPanel)
	slot0.attrsPanel = slot0:findTF("bg/property_panel/attrs", slot0.mainPanel)

	setText(slot0:findTF("bg/add_ship_panel/title/tip", slot0.mainPanel), i18n("ship_mod_exp_to_attr_tip"))
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0:findTF("ok_btn", slot0.mainPanel), function ()
		if slot0.shipVO:isActivityNpc() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("npc_strength_tip"),
				onYes = slot0
			})
		else
			slot0()
		end
	end, SFX_CONFIRM)
	onButton(slot0, slot0:findTF("cancel_btn", slot0.mainPanel), function ()
		if not slot0.contextData.materialShipIds or table.getCount(slot0) == 0 then
			return
		end

		slot0:clearAllShip()
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("select_btn", slot0.mainPanel), function ()
		slot0:emit(ShipModMediator.ON_AUTO_SELECT_SHIP)
	end, SFX_CANCEL)
	slot0:initAttrs()

	slot0.inited = true

	slot0:emit(ShipModMediator.LOADEND, slot0.mainPanel)
	slot0:blurPanel(true)
end

function slot0.blurPanel(slot0, slot1)
	slot2 = pg.UIMgr.GetInstance()

	if slot1 then
		slot2:OverlayPanelPB(slot0.blurPanelTF, {
			pbList = {
				slot0.mainPanel:Find("bg")
			},
			groupName = slot0:getGroupNameFromData(),
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
		})
	else
		slot2:UnOverlayPanel(slot0.blurPanelTF, slot0._tf)
	end
end

function slot0.startModShip(slot0)
	if not slot0.hasAddition then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("ship_mod_no_addition_tip"),
			onYes = function ()
				slot0:emit(ShipModMediator.MOD_SHIP, slot0.shipVO.id)
			end
		})
	else
		slot0:emit(ShipModMediator.MOD_SHIP, slot0.shipVO.id)
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

function slot0.setShip(slot0, slot1)
	if slot0.shipVO and slot0.shipVO.id ~= slot1.id then
		slot0:switchToPage()
	end

	slot0.shipVO = slot1

	slot0:initSelectedShips()

	if slot0.inited then
		slot0:initAttrs()
	end
end

function slot0.clearAllShip(slot0)
	for slot4 = 1, slot0, 1 do
		slot5 = slot0.shipContainer:GetChild(slot4 - 1)

		setActive(slot5:Find("IconTpl"), false)
		onButton(slot0, slot5:Find("add"), function ()
			slot0:emit(ShipModMediator.ON_SELECT_MATERIAL_SHIPS)
		end, SFX_PANEL)
	end

	slot0.contextData.materialShipIds = nil

	slot0:updateAttrs()
end

function slot0.initSelectedShips(slot0)
	slot2 = table.getCount(slot0.contextData.materialShipIds or {})

	for slot6 = 1, slot0, 1 do
		slot7 = slot0.shipContainer:GetChild(slot6 - 1)

		if slot6 <= slot2 then
			slot0:updateShip(slot7, slot1[slot6])
		else
			onButton(slot0, slot7:Find("add"), function ()
				slot0:emit(ShipModMediator.ON_SELECT_MATERIAL_SHIPS)
			end, SFX_PANEL)
		end

		setActive(slot7:Find("IconTpl"), slot6 <= slot2)
	end
end

function slot0.updateShip(slot0, slot1, slot2)
	onButton(slot0, slot1, function ()
		for slot3, slot4 in pairs(slot0.contextData.materialShipIds) do
			if slot1 == slot4 then
				setActive(slot2:Find("IconTpl"), false)
				onButton(slot0, slot5, function ()
					slot0:emit(ShipModMediator.ON_SELECT_MATERIAL_SHIPS)
				end, SFX_PANEL)
				table.remove(slot0.contextData.materialShipIds, slot3)
				slot0:updateAttrs()

				break
			end
		end
	end, SFX_PANEL)
	updateShip(slot0:findTF("IconTpl", slot1), slot3, {
		initStar = true
	})
	setText(slot1:Find("IconTpl/icon_bg/lv/Text"), slot0.shipVOs[slot2].level)
end

function slot0.initAttrs(slot0)
	slot0.attrTFs = {}

	for slot4, slot5 in pairs(ShipModAttr.ID_TO_ATTR) do
		if slot0.IGNORE_ID ~= slot4 then
			slot0.attrTFs[slot4] = slot0.attrsPanel:Find("attr_" .. slot4)
		end
	end

	slot0:updateAttrs()
end

function slot0.updateAttrs(slot0)
	slot0.hasAddition = nil

	for slot4, slot5 in pairs(slot0.attrTFs) do
		slot0:updateAttr(slot4)
	end
end

function slot0.updateAttr(slot0, slot1)
	slot3 = slot0:findTF("info", slot2)
	slot4 = slot0.attrTFs[slot1].GetComponent(slot2, typeof(CanvasGroup))
	slot6 = slot0.shipVO:getModAttrTopLimit(slot5)
	slot7 = intProperties(slot0.shipVO:getShipProperties())
	slot10 = slot0.shipVO:getModExpRatio(slot5)
	slot11 = math.max(slot0.shipVO:getModExpRatio(ShipModAttr.ID_TO_ATTR[slot1]), 1)

	if slot0.getExpAddition(slot0.shipVO, slot8, slot5) ~= 0 then
		slot0.hasAddition = true
	end

	setText(slot0:findTF("info_container/addition", slot3), "+" .. slot14)
	setText(slot0:findTF("info_container/name", slot3), AttributeType.Type2Name(slot5))
	setText(slot0:findTF("max_container/Text", slot3), slot12)
	setText(slot0:findTF("info_container/value", slot3), slot7[slot5])

	slot4.alpha = (slot7[slot5] == 0 and 0.3) or 1

	slot0:setSliderValue((slot7[slot5] == 0 and 0.3) or 1, (slot9 + slot13) / slot11)

	slot16 = slot13 / slot11
	slot17 = slot13 + slot9 .. "/" .. slot10

	if slot12 == slot7[slot5] and slot7[slot5] ~= 0 then
		slot16 = 1
		slot17 = "MAX"
	end

	slot0:setSliderValue(slot18, slot16)
	setText(slot0:findTF("exp_container/Text", slot2), slot17)
end

function slot0.modAttrAnim(slot0, slot1, slot2, slot3)
	slot4 = slot3 or 0.3
	slot5 = intProperties(slot1:getShipProperties())
	slot6 = intProperties(slot2:getShipProperties())
	slot0.tweens = {}

	for slot10, slot11 in pairs(slot0.attrTFs) do
		slot14 = slot0.shipVO:getModAttrBaseMax(ShipModAttr.ID_TO_ATTR[slot10])

		if slot1:getModAttrTopLimit(slot12) == 0 then
			slot0:updateAttr(slot10)
		else
			slot16 = slot0:findTF("info", slot15)
			slot17 = slot0:findTF("info_container/value", slot16)
			slot22 = slot0:findTF("cur_slider", slot16).GetComponent(slot20, typeof(Slider))
			slot25 = slot0:findTF("info_container/addition", slot16)
			slot26 = slot0:findTF("exp_container/Text", slot15)

			slot0:setSliderValue(slot23, 0)
			setText(slot0:findTF("exp_container/Text", slot15), slot24 .. "/" .. math.max(slot1:getModExpRatio(slot12), 1))

			function slot27(slot0, slot1)
				setText(slot0, slot0)
				setText(slot1, "+" .. slot1)
			end

			if slot5[slot12] - slot6[slot12] >= 1 then
				slot28 = slot6[slot12]

				slot0:tweenValue(slot22, slot22.value, 1, slot4, nil, function (slot0)
					slot0:setSliderValue(slot0.setSliderValue, slot0)
				end, function ()
					playSoundEffect(SFX_BREAK_OUT_FULL)

					slot0 = playSoundEffect + 1

					SFX_BREAK_OUT_FULL(SFX_BREAK_OUT_FULL, slot2[slot3] - SFX_BREAK_OUT_FULL)

					if slot2[slot3] -  > 0 then
						slot4:tweenValue(slot5, 0, 1, slot6, nil, function (slot0)
							slot0:setSliderValue(slot0.setSliderValue, slot0)
						end, function ()
							playSoundEffect(SFX_BREAK_OUT_FULL)

							slot0 = playSoundEffect + 1

							SFX_BREAK_OUT_FULL(SFX_BREAK_OUT_FULL, slot2[slot3] - SFX_BREAK_OUT_FULL)

							if SFX_BREAK_OUT_FULL == slot2[slot3] - SFX_BREAK_OUT_FULL[SFX_BREAK_OUT_FULL] then
								slot4:tweenValue(slot5, 0, slot6 / slot7, slot8, nil, function (slot0)
									slot0:setSliderValue(slot0.setSliderValue, slot0)
								end, function ()
									if slot0 == slot1[slot2] then
										slot3:setSliderValue(slot4, 1)
										setText(slot5, "MAX")
									end
								end)
							end
						end, slot0)
					else
						slot4:tweenValue(slot5, 0, slot7 / slot8, slot8, nil, function (slot0)
							slot0:setSliderValue(slot0.setSliderValue, slot0)
						end, function ()
							if slot0 == slot1[slot2] then
								slot3:setSliderValue(slot4, 1)
								setText(slot5, "MAX")
							end
						end)
					end
				end)
			else
				slot0:tweenValue(slot22, slot22.value, slot24 / slot19, slot4, nil, function (slot0)
					slot0:setSliderValue(slot0.setSliderValue, slot0)
				end, function ()
					if slot0 == slot1[slot2] then
						slot3:setSliderValue(slot4, 1)
						setText(slot5, "MAX")
					end
				end)
			end
		end
	end
end

function slot0.tweenValue(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	slot0.tweens[slot1] = slot1
	slot10 = LeanTween.value(go(slot1), slot2, slot3, slot4):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-7, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end))
	slot9 = LeanTween.value(go(slot1), slot2, slot3, slot4).setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-7, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)).setDelay
	slot11 = slot5 or 0
	slot9 = LeanTween.value(go(slot1), slot2, slot3, slot4).setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-7, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)).setDelay(slot10, slot11):setOnComplete(System.Action(function ()

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



	end))
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 23-23, warpins: 1 ---
	slot11 = 0

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 24-33, warpins: 2 ---
	if slot8 and slot8 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-40, warpins: 1 ---
		slot9:setRepeat(slot8)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 41-42, warpins: 3 ---
	return
	--- END OF BLOCK #3 ---



end

function slot0.getModExpAdditions(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot3 = pg.ship_data_template[slot0.configId].group_type
	slot4 = pg.ship_data_strengthen
	slot5 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-39, warpins: 0 ---
	for slot9, slot10 in pairs(ShipModAttr.ID_TO_ATTR) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-18, warpins: 1 ---
		slot11 = 0

		if slot9 ~= ShipModLayer.IGNORE_ID then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-22, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 23-36, warpins: 0 ---
			for slot15, slot16 in pairs(slot1) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-32, warpins: 1 ---
				slot19 = slot4[slot2[slot16.configId].strengthen_id].attr_exp[slot9 - 1]

				if slot2[slot16.configId].group_type == slot3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 33-33, warpins: 1 ---
					slot19 = slot19 * 2
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 34-34, warpins: 2 ---
				slot11 = slot11 + slot19
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 35-36, warpins: 2 ---
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 37-37, warpins: 2 ---
		slot5[slot10] = slot11
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 38-39, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 40-40, warpins: 1 ---
	return slot5
	--- END OF BLOCK #2 ---



end

function slot0.getMaterialShips(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot2 = {}
	slot3 = ipairs

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		slot4 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-7, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-15, warpins: 0 ---
	for slot6, slot7 in slot3(slot4) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		table.insert(slot2, slot0.shipVOs[slot7])
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-15, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 16-16, warpins: 1 ---
	return slot2
	--- END OF BLOCK #3 ---



end

function slot0.getExpAddition(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot3 = slot0:getModExpAdditions(slot1)

	if slot0:getModAttrTopLimit(slot2) == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-15, warpins: 1 ---
		return 0, 0
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-33, warpins: 1 ---
		slot4 = Clone(slot0)

		slot4:addModAttrExp(slot2, slot3[slot2])

		return slot4:getModProperties(slot2) - slot0:getModProperties(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 34-34, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.getRemainExp(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	return slot0:getModProperties(slot1) % math.max(slot0:getModExpRatio(slot1), 1)
	--- END OF BLOCK #0 ---



end

function slot0.setSliderValue(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot2 ~= 0 or not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 2 ---
		slot3 = math.max(slot2, 0.08)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-11, warpins: 2 ---
	slot1.value = slot3

	return
	--- END OF BLOCK #1 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0:blurPanel(false)

	slot1 = pairs

	if not slot0.tweens then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		slot2 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-11, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-27, warpins: 0 ---
	for slot4, slot5 in slot1(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-19, warpins: 1 ---
		if LeanTween.isTweening(go(slot5)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-25, warpins: 1 ---
			LeanTween.cancel(go(slot5))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-27, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 28-30, warpins: 1 ---
	slot0.tweens = nil

	return
	--- END OF BLOCK #3 ---



end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0:emit(BaseUI.ON_BACK_PRESSED, true)

	return
	--- END OF BLOCK #0 ---



end

return slot0
