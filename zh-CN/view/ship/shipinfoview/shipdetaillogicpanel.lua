slot0 = class("ShipDetailLogicPanel", import("...base.BasePanel"))
slot1 = {
	durability = AttributeType.Durability,
	armor = AttributeType.Armor,
	reload = AttributeType.Reload,
	cannon = AttributeType.Cannon,
	torpedo = AttributeType.Torpedo,
	motion = AttributeType.Dodge,
	antiaircraft = AttributeType.AntiAircraft,
	air = AttributeType.Air,
	consume = AttributeType.Expend,
	antisub = AttributeType.AntiSub,
	oxy_max = AttributeType.OxyMax,
	ammo = AttributeType.Ammo,
	hunting_range = AttributeType.HuntingRange,
	luck = AttributeType.Luck
}
slot2 = 0.5
slot3 = Vector3(1, 1, 1)
slot4 = Vector3(1.3, 1.3, 1.3)
slot0.EQUIPMENT_ADDITION = 0
slot0.TECHNOLOGY_ADDITION = 1

function slot0.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1.gameObject)

	slot0.skillContainer = findTF(slot0._tf, "skills/content")
	slot0.skillContainerHz = slot0.skillContainer:GetComponent(typeof(HorizontalLayoutGroup))
	slot0.skillTpl = findTF(slot0.skillContainer, "skill_tpl")
	slot0.attrs = findTF(slot0._tf, "attrs/property")
	slot0.powerTxt = findTF(slot0.attrs, "power/value")
	slot0.levelTxt = findTF(slot0.attrs, "level_bg/level_label/Text")
	slot0.levelSlider = findTF(slot0.attrs, "level_bg/exp")
	slot0.expInfo = findTF(slot0.attrs, "level_bg/exp_info")
	slot0.outline = findTF(slot0.attrs, "level_bg/outline")
	slot0.levelTip = findTF(slot0.attrs, "level_bg/tip")
	slot0.levelBg = findTF(slot0.attrs, "level_bg")
	slot0.armorNameTxt = slot0.attrs:Find("icons"):GetChild(1):Find("name")
	slot0.worldToggle = findTF(slot0._tf, "switch_world_buff")
	slot0.worldBuff = findTF(slot0._tf, "world_buff")
	slot0.worldBuffContainer = findTF(slot0.worldBuff, "buff_list")
	slot0.worldBuffItem = findTF(slot0.worldBuffContainer, "item")
	slot0.masks = {}
end

function slot0.attach(slot0, slot1)
	slot0.super.attach(slot0, slot1)

	slot0.evalueToggle = slot0.attrs:Find("evalue_toggle")
	slot0.evalueIndex = slot0.EQUIPMENT_ADDITION

	onToggle(slot0.viewComponent, slot0.evalueToggle, function ()
		slot0.evalueIndex = 1 - slot0.evalueIndex

		slot0:updateEvalues()
	end)
end

function slot0.enableEvent(slot0, slot1)
	slot0:emit(ShipViewConst.SET_CLICK_ENABLE, slot1)
end

function slot0.flush(slot0, slot1)
	slot0.shipDataTemplate = pg.ship_data_template[slot1.configId]
	slot0.shipVO = slot1

	slot0:updateShipAttrs()
	slot0:updateSKills()
	slot0:updateLevelInfo()
	setActive(slot0.worldToggle, slot0.shipVO.bindingData and slot2.class == WorldMapShip)

	if slot2 and slot2.class == WorldMapShip then
		slot0:updateWorldBuffs()
	end

	if not slot1:isMaxStar() and slot0.evalueIndex == slot0.TECHNOLOGY_ADDITION then
		triggerToggle(slot0.evalueToggle, false)
	end

	setActive(slot0.evalueToggle, slot3)
end

function slot0.updateEvalues(slot0)
	if not slot0.additionValues then
		return
	end

	slot1 = table.contains(TeamType.SubShipType, slot0.shipVO:getShipType())

	for slot5, slot6 in pairs(slot0.additionValues.transforms) do
		if slot5 == AttributeType.Armor or slot5 == AttributeType.Expend or (slot5 == AttributeType.HuntingRange and slot1) then
			setText(slot6, "")
			setActive(slot6, false)
		else
			setText(slot6, ((slot0.additionValues[slot0.evalueIndex][slot5] or 0) == 0 and "") or setColorStr(" +" .. (slot0.additionValues[slot0.evalueIndex][slot5] or 0), (slot0.evalueIndex == slot0.EQUIPMENT_ADDITION and COLOR_GREEN) or COLOR_YELLOW))
			setActive(slot6, (slot0.additionValues[slot0.evalueIndex][slot5] or 0) ~= 0)
		end
	end
end

function slot0.updateWorldBuffs(slot0)
	onToggle(slot0, slot0.worldToggle, function (slot0)
		setActive(slot0.worldBuff, slot0)
		setActive(slot0.attrs, not slot0)
	end, SFX_PANEL)

	slot3 = UIItemList.New(slot0.worldBuffContainer, slot0.worldBuffItem)

	slot3:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot2:Find("level"), slot0[slot1 + 1].level .. "/" .. slot0[slot1 + 1]:GetMaxLevel())

			slot4 = slot0[slot1 + 1].config.buff_effect[1] * slot0[slot1 + 1].level

			if slot0[slot1 + 1].config.percent[1] == 1 then
				slot4 = slot4 / 100 .. "%"
			end

			setText(slot2:Find("value"), slot4)
		end
	end)
	slot3:align(#slot0.shipVO.bindingData.GetBuffList(slot1))

	slot4 = slot0.shipVO.bindingData.GetBuffLevel(slot1)

	setText(slot0.worldBuff:Find("level_bg/level_label/Text"), slot4)
	setText(slot0.worldBuff:Find("level_bg/exp_info"), slot4 .. "/" .. slot5)
	setSlider(slot0.worldBuff:Find("level_bg/exp"), slot4, 0, slot0.shipVO.bindingData.GetBuffMaxLevel(slot1))
end

function slot0.updateShipAttrs(slot0)
	slot0.additionValues = {
		[slot0.EQUIPMENT_ADDITION] = {},
		[slot0.TECHNOLOGY_ADDITION] = {},
		transforms = {}
	}
	slot2 = table.contains(TeamType.SubShipType, slot0.shipVO.getShipType(slot1))
	slot3 = intProperties(slot0.shipVO.getShipProperties(slot1))
	slot7, slot7 = slot0.shipVO.getEquipmentProperties(slot1)
	slot4 = intProperties(slot4)
	slot5 = intProperties(slot5)

	FormationUI.tweenNumText(slot0.powerTxt, slot6)

	for slot10, slot11 in pairs(slot1) do
		slot13 = findTF(slot0.attrs, "icons/" .. slot10)

		setText(findTF(slot12, "value"), slot3[slot11] or 0)

		slot0.additionValues.transforms[slot11] = findTF(slot12, "add")
		slot0.additionValues[0][slot11] = calcFloor(((slot4[slot11] or 0) + (slot3[slot11] or 0)) * (slot5[slot11] or 1)) - (slot3[slot11] or 0)
		slot0.additionValues[1][slot11] = slot1:getTechNationAddition(slot11)

		if slot11 == AttributeType.Armor then
			setActive(slot14, false)
			setActive(slot15, false)
			setText(slot0.armorNameTxt, slot1:getShipArmorName())
		elseif slot11 == AttributeType.Expend then
			setText(findTF(slot12, "value"), slot1:getBattleTotalExpend())
			setActive(slot15, false)
		elseif slot11 == AttributeType.HuntingRange then
			setActive(slot13, slot2)
			setActive(slot12, slot2)

			if slot2 then
				setActive(slot14, false)
				setActive(slot15, false)
			end
		elseif slot11 == AttributeType.AntiSub then
			setActive(slot13, not slot2)
			setActive(slot12, not slot2)
		elseif slot11 == AttributeType.OxyMax or slot11 == AttributeType.Ammo then
			setActive(slot13, slot2)
			setActive(slot12, slot2)

			if slot11 == AttributeType.Ammo then
				setText(slot14, slot1:getShipAmmo())
			end
		end
	end

	slot0:updateEvalues()
end

function slot0.updateSKills(slot0)
	slot1 = slot0.shipVO

	for slot6 = #Clone(slot0.shipDataTemplate.buff_list_display) + 1, 3, 1 do
		table.insert(slot2, false)
	end

	setActive(slot0.skillTpl, false)

	slot3 = UIItemList.New(slot0.skillContainer, slot0.skillTpl)

	slot3:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			if slot0[slot1 + 1] then
				slot4 = getSkillConfig(slot3)

				if slot1.skills[slot1:fateSkillChange(slot3)] and slot5.id == 11720 and not slot1.transforms[3612] then
					slot5 = nil
				end

				slot2:updateSkillTF(slot2, slot4, slot5)
				onButton(slot2, slot2, function ()
					slot0:emit(ShipMainMediator.ON_SKILL, slot1.id, , slot3 + 1)
				end, SFX_PANEL)

				return
			end

			slot2:updateSkillTF(slot2)
			RemoveComponent(slot2, "Button")
		end
	end)
	slot3:align(#slot2)
end

function slot0.updateSkillTF(slot0, slot1, slot2, slot3)
	slot4 = findTF(slot1, "skill")
	slot5 = findTF(slot1, "lock")
	slot6 = findTF(slot1, "unknown")

	if slot2 then
		setActive(slot4, true)
		setActive(slot6, false)
		setActive(slot5, not slot3)
		LoadImageSpriteAsync("skillicon/" .. slot2.icon, findTF(slot4, "icon"))

		slot7 = slot2.color or "blue"
		slot8 = ScrollTxt.New(findTF(slot4, "mask"), findTF(slot4, "mask/name"))

		slot8:setText(getSkillName(slot2.id))
		table.insert(slot0.masks, slot8)
		setText(findTF(slot4, "level"), "LEVEL: " .. ((slot3 and slot3.level) or "??"))
	else
		setActive(slot4, false)
		setActive(slot6, true)
		setActive(slot5, false)
	end
end

function slot0.updateLevelInfo(slot0)
	setText(slot0.levelTxt, slot0.shipVO.level)

	slot2 = slot0.shipVO.getLevelExpConfig(slot1)

	if slot0.shipVO.level ~= slot0.shipVO:getMaxLevel() then
		setSlider(slot0.levelSlider, 0, slot2.exp_interval, slot1.exp)
		setText(slot0.expInfo, slot1.exp .. "/" .. slot2.exp_interval)
	else
		setSlider(slot0.levelSlider, 0, 1, 1)
		setText(slot0.expInfo, slot1.exp .. "/Max")
	end

	slot0:updateMaxLevel(slot1)
end

function slot0.updateMaxLevel(slot0, slot1)
	if slot1:isReachNextMaxLevel() then
		SetActive(slot0.outline, true)
		setActive(slot0.levelTip, true)
		blinkAni(slot0.outline, 1.5, -1, 0.1):setFrom(1)
		blinkAni(slot0.levelTip, 1.5, -1, 0.1):setFrom(1)

		slot3 = slot1:getNextMaxLevelConsume()
		slot4 = slot1:getMaxLevel()
		slot5 = slot1:getNextMaxLevel()

		onButton(slot0, slot0.levelBg, function ()
			if slot0:isActivityNpc() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("npc_upgrade_max_level"))

				return
			end

			slot1:emit(ShipViewConst.SHOW_CUSTOM_MSG, {
				content = i18n("upgrade_to_next_maxlevel_tip"),
				content1 = slot2 .. "->" .. ,
				items = slot2 .. "->" .. ,
				onYes = function ()
					slot0, slot1 = slot0:canUpgradeMaxLevel()

					if slot0 then
						slot1:emit(ShipViewConst.HIDE_CUSTOM_MSG)
						slot1:emit(ShipMainMediator.ON_UPGRADE_MAX_LEVEL, slot0.id)
					else
						pg.TipsMgr.GetInstance():ShowTips(slot1)
					end
				end
			})
		end, SFX_PANEL)

		return
	end

	slot0:removeLevelUpTip()
end

function slot0.removeLevelUpTip(slot0)
	SetActive(slot0.outline, false)
	setActive(slot0.levelTip, false)

	if LeanTween.isTweening(go(slot0.outline)) then
		LeanTween.cancel(go(slot0.outline))
	end

	if LeanTween.isTweening(go(slot0.levelTip)) then
		LeanTween.cancel(go(slot0.levelTip))
	end

	removeOnButton(slot0.levelBg)
end

function slot0.doLeveUpAnim(slot0, slot1, slot2, slot3)
	slot0:removeLevelUpTip()
	slot0:enableEvent(false)

	slot4 = {}

	if slot1.level < slot2.level then
		slot6 = slot1:getLevelExpConfig()

		for slot10 = 1, slot2.level - slot1.level, 1 do
			table.insert(slot4, function (slot0)
				TweenValue(slot0.levelSlider, 0, slot1.exp_interval, , 0, function (slot0)
					setSlider(slot0.levelSlider, 0, slot1.exp_interval, slot0)
					setText(slot0.expInfo, math.floor(slot0) .. "/" .. slot1.exp_interval)
				end, function ()
					slot0 = Clone(Clone)
					slot0.level = slot0.level + 1
					slot1 = slot0:getLevelExpConfig()

					slot0:scaleAnim(slot2.levelTxt, , , slot5 / 2, function ()
						if slot0.level == slot1.level then
							slot2:doAttrAnim(slot3, slot2, function ()
								TweenValue(slot0.levelSlider, 0, slot1.exp, , 0, function (slot0)
									setSlider(slot0.levelSlider, 0, slot1.exp_interval, slot0)
									setText(slot0.expInfo, math.floor(slot0) .. "/" .. slot1.exp_interval)
								end, )
							end)
						else
							slot2:doAttrAnim(slot3, slot2.doAttrAnim, slot6)
						end
					end, function ()
						setText(slot0.levelTxt, slot1.level)
					end)
				end)
			end)
		end
	else
		slot5 = slot2:getLevelExpConfig()

		if slot1.exp < slot2.exp then
			table.insert(slot4, function (slot0)
				TweenValue(slot0.levelSlider, slot1.exp, slot2.exp, , 0, function (slot0)
					setSlider(slot0.levelSlider, 0, slot1.exp_interval, slot0)
					setText(slot0.expInfo, math.floor(slot0) .. "/" .. slot1.exp_interval)
				end, slot0)
			end)
		end
	end

	seriesAsync(slot4, function ()
		if slot0 then
			slot0()
		end

		slot1:enableEvent(true)
	end)
end

function slot0.doAttrAnim(slot0, slot1, slot2, slot3)
	slot4 = intProperties(slot1:getShipProperties())
	slot11, slot11 = slot1:getEquipmentProperties()
	slot7 = intProperties(slot2:getShipProperties())
	slot11, slot11 = slot2:getEquipmentProperties()
	slot5 = intProperties(slot5)
	slot6 = intProperties(slot6)
	slot8 = intProperties(slot8)
	slot9 = intProperties(slot9)
	slot10 = {}

	if math.floor(slot1:getShipCombatPower()) ~= math.floor(slot2:getShipCombatPower()) then
		table.insert(slot10, function (slot0)
			TweenValue(slot0.powerTxt, TweenValue, , , 0, function (slot0)
				setText(slot0.powerTxt, math.floor(slot0))
			end, slot0)
		end)
	end

	for slot16, slot17 in pairs(slot1) do
		slot19 = findTF(slot0.attrs, "icons/" .. slot16) or findTF(slot0.attrs, "icon_" .. slot16)
		slot20 = findTF(findTF(slot0.attrs, "props/" .. slot16) or findTF(slot0.attrs, "prop_" .. slot16), "value")
		slot21 = findTF(findTF(slot0.attrs, "props/" .. slot16) or findTF(slot0.attrs, "prop_" .. slot16), "add")
		slot22 = slot4[slot17] or 0
		slot23 = slot6[slot17] or 1
		slot24 = slot7[slot17] or 0
		slot25 = slot9[slot17] or 1
		slot26, slot27 = nil

		if slot0.evalueIndex == slot2.EQUIPMENT_ADDITION then
			slot26 = calcFloor(((slot5[slot17] or 0) + slot22) * slot23) - slot22
			slot27 = calcFloor(((slot8[slot17] or 0) + slot24) * slot25) - slot24
		elseif slot0.evalueIndex == slot2.TECHNOLOGY_ADDITION then
			slot26 = slot1:getTechNationAddition(slot17)
			slot27 = slot2:getTechNationAddition(slot17)
		end

		if slot22 ~= 0 then
			table.insert(slot10, function (slot0)
				TweenValue(slot0, TweenValue, , , 0, function (slot0)
					setText(slot0, math.floor(slot0))
				end, slot0)
				slot4:scaleAnim(slot0, TweenValue, 0, slot3 / 2)
			end)
		end

		if slot26 < slot27 then
			slot28 = (slot0.evalueIndex == slot2.EQUIPMENT_ADDITION and COLOR_GREEN) or COLOR_YELLOW

			table.insert(slot10, function (slot0)
				TweenValue(slot0, TweenValue, , , 0, function (slot0)
					setText(slot0, setColorStr("+" .. math.floor(slot0), setText))
				end, slot0)
				slot5:scaleAnim(slot0, 0, function (slot0)
					setText(slot0, setColorStr("+" .. math.floor(slot0), setText))
				end, slot3 / 2)
			end)
		end

		setActive(slot21, slot27 ~= 0)

		if slot17 == AttributeType.Armor then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 185-199, warpins: 1 ---
			setActive(slot20, false)
			setActive(slot21, false)
			setText(slot0.armorNameTxt, slot2:getShipArmorName())
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 200-203, warpins: 1 ---
			if slot17 == AttributeType.Expend then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 204-215, warpins: 1 ---
				slot30 = findTF(slot18, "value")

				if slot1:getBattleTotalExpend() ~= slot2:getBattleTotalExpend() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 216-220, warpins: 1 ---
					table.insert(slot10, function (slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-19, warpins: 1 ---
						TweenValue(slot0, TweenValue, , , 0, function (slot0)

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-8, warpins: 1 ---
							setText(slot0, math.floor(slot0))

							return
							--- END OF BLOCK #0 ---



						end, slot0)
						slot4:scaleAnim(slot0, TweenValue, 0, slot3 / 2)

						return
						--- END OF BLOCK #0 ---



					end)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 221-225, warpins: 2 ---
				setActive(slot21, false)
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 226-229, warpins: 1 ---
				if slot17 == AttributeType.OxyMax or slot17 == AttributeType.Tactics then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 234-251, warpins: 2 ---
					slot28 = table.contains(TeamType.SubShipType, slot2:getShipType())

					setActive(slot19, slot28)
					setActive(slot18, slot28)

					if slot28 and slot17 == AttributeType.Tactics then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 256-272, warpins: 1 ---
						slot29, slot34 = slot2:getTactics()

						setActive(slot20, false)
						setActive(slot21, true)
						setText(slot21, i18n(slot30))
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
	end

	parallelAsync(slot10, function ()

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



	end)
end

function slot0.scaleAnim(slot0, slot1, slot2, slot3, slot4, slot5, slot6)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	LeanTween.scale(go(slot1), slot3, slot4):setFrom(slot2):setOnComplete(System.Action(function ()

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
		--- BLOCK #1 6-25, warpins: 2 ---
		LeanTween.scale(go(go), go, slot3):setFrom(slot4):setOnComplete(System.Action(slot5))

		return
		--- END OF BLOCK #1 ---



	end))

	return
	--- END OF BLOCK #0 ---



end

function slot0.clear(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	triggerToggle(slot0.evalueToggle, false)

	if LeanTween.isTweening(go(slot0.levelSlider)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-18, warpins: 1 ---
		LeanTween.cancel(go(slot0.levelSlider))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-26, warpins: 2 ---
	if LeanTween.isTweening(go(slot0.powerTxt)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-32, warpins: 1 ---
		LeanTween.cancel(go(slot0.powerTxt))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 33-40, warpins: 2 ---
	if LeanTween.isTweening(go(slot0.expInfo)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-46, warpins: 1 ---
		LeanTween.cancel(go(slot0.expInfo))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 47-53, warpins: 2 ---
	slot0:removeLevelUpTip()

	slot1 = ipairs
	slot2 = slot0.masks or {}

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 55-56, warpins: 2 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 57-63, warpins: 0 ---
	for slot4, slot5 in slot1(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 57-58, warpins: 1 ---
		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 59-61, warpins: 1 ---
			slot5:destroy()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 62-63, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 64-66, warpins: 1 ---
	slot0.additionValues = nil

	return
	--- END OF BLOCK #6 ---



end

return slot0
