slot0 = class("CommanderPlayPanel", import("...base.BasePanel"))

function slot0.init(slot0)
	slot0.skillTF = slot0:findTF("skill/frame")
	slot0.skillNameTxt = slot0:findTF("skill_desc/line/name", slot0.skillTF):GetComponent(typeof(Text))
	slot0.skillDescTF = slot0:findTF("skill_desc/intro_view/Viewport/introTF", slot0.skillTF)
	slot0.skillDescContent = slot0:findTF("skill_desc/intro_view/Viewport/content", slot0.skillTF)
	slot0.skillIcon = slot0:findTF("skill_desc/icon/Image", slot0.skillTF)
	slot0.skilllvTxt = slot0:findTF("skill_desc/line/level", slot0.skillTF):GetComponent(typeof(Text))
	slot0.skillAdditionTxt = slot0:findTF("skill_desc/line/addition", slot0.skillTF):GetComponent(typeof(Text))
	slot0.expTxt = slot0:findTF("skill_desc/line/exp/Text", slot0.skillTF):GetComponent(typeof(Text))
	slot0.commanderLvTxt = slot0:findTF("exp_bg/level_bg/Text", slot0.skillTF):GetComponent(typeof(Text))
	slot0.levelAdditonTxt = slot0:findTF("exp_bg/level_bg/addition", slot0.skillTF):GetComponent(typeof(Text))
	slot0.preExpSlider = slot0:findTF("exp_bg/slider", slot0.skillTF):GetComponent(typeof(Slider))
	slot0.expSlider = slot0:findTF("exp_bg/slider/exp", slot0.skillTF):GetComponent(typeof(Slider))
	slot0.sliderExpTxt = slot0:findTF("exp_bg/slider/Text", slot0.skillTF):GetComponent(typeof(Text))
	slot0.uilist = UIItemList.New(slot0:findTF("select_panel/frame/list"), slot0:findTF("select_panel/frame/list/commandeTF"))
	slot0.consumeTxt = slot0:findTF("select_panel/consume/Text"):GetComponent(typeof(Text))
	slot0.confirmBtn = slot0:findTF("select_panel/confirm_btn")
end

function slot0.update(slot0, slot1, slot2)
	slot0.commanderVO = slot1
	slot0.detailPage = slot2

	slot0:updateMatrtials(slot0.parent.contextData.materialIds or {}, skill)
end

function slot0.updateMatrtials(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-35, warpins: 1 ---
	slot0.uilist:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-17, warpins: 1 ---
			slot4 = slot2:Find("add")
			slot5 = slot2:Find("icon")

			if slot0[slot1 + 1] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 18-66, warpins: 1 ---
				onButton(slot1, slot5, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-16, warpins: 1 ---
					slot0 = table.indexof(table.indexof, )

					table.remove(slot0, slot0)
					slot0:updateMatrtials(slot0)

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)

				slot6 = getProxy(CommanderProxy):getCommanderById(slot3)

				GetImageSpriteFromAtlasAsync("commandericon/" .. slot6:getPainting(), "", slot5)
				setActive(slot5:Find("up"), slot1.commanderVO:isSameGroup(slot6.groupId))
				setActive(slot5:Find("formation"), slot6.inFleet)
				setText(slot5:Find("level_bg/Text"), slot6.level)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 67-72, warpins: 1 ---
				onButton(slot1, slot4, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-11, warpins: 1 ---
					if not slot0.commanderVO:getSkills()[1]:isMaxLevel() or not slot0.commanderVO:isMaxLevel() then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 19-25, warpins: 2 ---
						slot0.parent:emit(CommanderInfoMediator.ON_SELECT)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 26-26, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end, SFX_PANEL)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 73-81, warpins: 2 ---
			setActive(slot4, not slot3)
			setActive(slot5, slot3)
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 82-82, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)
	slot0.uilist:align(CommanderConst.PLAY_MAX_COUNT)

	slot6, slot6 = slot0.getSkillExpAndCommanderExp(slot0.commanderVO, slot1)

	slot0:updateSkillTF(slot3)
	slot0:updateCommanderTF(slot2)
	slot0:updateConsume(slot1)

	slot4 = setActive
	slot5 = go(slot0.skillAdditionTxt)
	slot6 = #slot1 > 0

	slot4(slot5, slot6)
	setActive(go(slot0.levelAdditonTxt), #slot1 > 0)

	return

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 36-37, warpins: 1 ---
	slot6 = false

	if false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-38, warpins: 1 ---
		slot6 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 39-47, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 48-49, warpins: 1 ---
	slot6 = false

	if false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 50-50, warpins: 1 ---
		slot6 = true
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 51-53, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

function slot0.getSkillExpAndCommanderExp(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot2 = slot0
	slot3 = 0
	slot4 = 0
	slot5 = getProxy(CommanderProxy)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-26, warpins: 0 ---
	for slot9, slot10 in pairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-24, warpins: 1 ---
		slot11 = slot5:getCommanderById(slot10)
		slot4 = slot4 + slot11:getDestoryedExp(slot2.groupId)
		slot3 = slot3 + slot11:getDestoryedSkillExp(slot2.groupId)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-26, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-35, warpins: 1 ---
	return math.floor(slot4), math.floor(slot3)
	--- END OF BLOCK #2 ---



end

function slot0.updateSkillTF(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	Clone(slot4).addExp(slot5, slot1)

	slot6 = slot0.commanderVO.getSkills(slot2)[1].getConfig(slot4, "lv")
	slot0.skillNameTxt.text = slot0.commanderVO.getSkills(slot2)[1].getConfig(slot4, "name")

	setActive(slot0.skillDescTF, false)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-41, warpins: 0 ---
	for slot10 = 0, slot0.skillDescContent.childCount - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-41, warpins: 2 ---
		setActive(slot0.skillDescContent:GetChild(slot10), false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 42-48, warpins: 1 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 49-106, warpins: 0 ---
	for slot10, slot11 in ipairs(slot4:getConfig("desc")) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 49-53, warpins: 1 ---
		slot12 = nil

		if slot10 <= slot0.skillDescContent.childCount then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 54-60, warpins: 1 ---
			slot12 = slot0.skillDescContent:GetChild(slot10 - 1)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 61-65, warpins: 1 ---
			slot12 = cloneTplTo(slot0.skillDescTF, slot0.skillDescContent)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 66-77, warpins: 2 ---
		setActive(slot12, true)

		slot13 = setText
		slot14 = findTF(slot12, "Lv")

		if slot6 >= slot11[1] or not ("<color=#a3a2a2>" .. "Lv." .. slot11[1] .. "</color>") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 85-87, warpins: 2 ---
			slot15 = "Lv." .. slot11[1]
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 88-96, warpins: 2 ---
		slot13(slot14, slot15)

		slot13 = setText
		slot14 = findTF(slot12, "Desc")

		if slot6 >= slot11[1] or not ("<color=#a3a2a2>" .. slot11[2] .. "</color>") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 103-103, warpins: 2 ---
			slot15 = slot11[2]
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 104-104, warpins: 2 ---
		slot13(slot14, slot15)
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 105-106, warpins: 2 ---
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 107-139, warpins: 1 ---
	GetImageSpriteFromAtlasAsync("CommanderSkillIcon/" .. slot4:getConfig("icon"), "", slot0.skillIcon)

	slot0.skilllvTxt.text = "Lv." .. slot4:getLevel()
	slot0.skillAdditionTxt.text = "+" .. slot5:getLevel() - slot4:getLevel()

	if slot4:isMaxLevel() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 140-143, warpins: 1 ---
		slot0.expTxt.text = "0/0"
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 144-147, warpins: 1 ---
		slot7 = slot0.expTxt
		slot8 = slot4.exp

		if slot1 == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 148-149, warpins: 1 ---
			slot9 = ""
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 150-153, warpins: 1 ---
			slot9 = "<color=#A9F548FF>(+" .. slot1 .. ")</color>"
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 154-159, warpins: 2 ---
		slot7.text = slot8 .. slot9 .. "/" .. slot4:getNextLevelExp()
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 160-166, warpins: 2 ---
	slot0.expOverflow = false

	if slot5:isMaxLevel() and slot5.exp > 0 and not slot4:isMaxLevel() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 176-177, warpins: 1 ---
		slot0.expOverflow = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 178-178, warpins: 4 ---
	return
	--- END OF BLOCK #6 ---



end

function slot0.updateCommanderTF(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-24, warpins: 1 ---
	slot3 = Clone(slot2)

	slot3:addExp(slot1)
	slot0.detailPage:ActionInvoke("updatePreView", slot3)

	slot0.commanderLvTxt.text = "LV." .. slot0.commanderVO.level

	if slot0.commanderVO:isMaxLevel() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-37, warpins: 1 ---
		slot0.expSlider.value = 1
		slot0.sliderExpTxt.text = "EXP: +0/MAX"
		slot0.preExpSlider.value = 1
		slot0.levelAdditonTxt.text = "+0"
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-47, warpins: 1 ---
		slot0.expSlider.value = slot2.exp / slot2:getNextLevelExp()

		if slot1 <= 0 or not ("<color=#A9F548FF>" .. slot2.exp + slot1 .. "</color>") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 55-55, warpins: 2 ---
			slot4 = slot2.exp
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 56-69, warpins: 2 ---
		slot0.sliderExpTxt.text = "EXP: " .. slot4 .. "/" .. slot2:getNextLevelExp()

		if slot3:isMaxLevel() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 70-73, warpins: 1 ---
			slot0.preExpSlider.value = 1
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 74-80, warpins: 1 ---
			slot0.preExpSlider.value = slot3.exp / slot3:getNextLevelExp()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 81-87, warpins: 2 ---
		slot0.levelAdditonTxt.text = "+" .. slot3.level - slot2.level
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 88-88, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.updateConsume(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot0.total = slot0:calcConsume(slot1)
	slot3 = slot0.consumeTxt

	if slot0.parent.playerVO.gold >= slot0.total or not ("<color=" .. COLOR_RED .. ">" .. slot0.total .. "</color>") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-21, warpins: 2 ---
		slot4 = slot0.total
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-33, warpins: 2 ---
	slot3.text = slot4

	function slot3()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		if _.any(getProxy(CommanderProxy), function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-11, warpins: 1 ---
			if slot0:getCommanderById(slot0).getRarity(slot1) < 5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-13, warpins: 1 ---
				slot2 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-14, warpins: 1 ---
				slot2 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-15, warpins: 2 ---
			return slot2
			--- END OF BLOCK #1 ---



		end) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-13, warpins: 1 ---
			return true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-16, warpins: 2 ---
		return false
		--- END OF BLOCK #1 ---



	end

	function slot4()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		if slot0.parent.playerVO.gold < slot0.total then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-30, warpins: 1 ---
			GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
				{
					59001,
					slot0.total - slot0.gold,
					slot0.total
				}
			})

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 31-49, warpins: 2 ---
		slot0.parent:emit(CommanderInfoMediator.ON_UPGRADE, slot0.commanderVO.id, slot0.commanderVO:getSkills(), slot0.commanderVO.getSkills()[1].id)

		return
		--- END OF BLOCK #1 ---



	end

	function slot5()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		if slot0() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-12, warpins: 1 ---
			table.insert(slot0, i18n("commander_material_is_rarity"))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-16, warpins: 2 ---
		if slot1.expOverflow then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-23, warpins: 1 ---
			table.insert(slot0, i18n("commander_exp_overflow_tip"))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 24-30, warpins: 2 ---
		if slot1.commanderVO:isMaxLevel() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-37, warpins: 1 ---
			table.insert(slot0, i18n("commander_material_is_maxLevel"))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 38-38, warpins: 2 ---
		return slot0
		--- END OF BLOCK #3 ---



	end

	onButton(slot0, slot0.confirmBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 and #slot0 > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-15, warpins: 1 ---
			slot1 = {}

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 16-23, warpins: 0 ---
			for slot5, slot6 in ipairs(slot0) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 16-21, warpins: 1 ---
				table.insert(slot1, function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-12, warpins: 1 ---
					slot0.parent:openMsgBox({
						content = slot1,
						onYes = function ()

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-4, warpins: 1 ---
							onNextTick(onNextTick)

							return
							--- END OF BLOCK #0 ---



						end
					})

					return
					--- END OF BLOCK #0 ---



				end)
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 22-23, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 24-27, warpins: 1 ---
			seriesAsync(slot1, )
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 28-28, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #1 ---



end

function slot0.calcConsume(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot2 = getProxy(CommanderProxy)
	slot3 = 0

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-18, warpins: 0 ---
	for slot7, slot8 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-16, warpins: 1 ---
		slot3 = slot3 + slot2:getCommanderById(slot8):getUpgradeConsume()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-18, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-19, warpins: 1 ---
	return slot3
	--- END OF BLOCK #2 ---



end

slot1 = 0.3

function slot0.playAnim(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot0.preExpSlider.value = 0

	function slot5()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		TweenValue(go(slot1.expSlider), 0, slot0.exp, , 0, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0.expSlider.value = slot0 / slot1

			return
			--- END OF BLOCK #0 ---



		end, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			slot0:update(slot0, slot0.detailPage)

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-12, warpins: 1 ---
				slot2()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 13-13, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end

	if slot2.level - slot1.level > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-25, warpins: 1 ---
		TweenValue(go(slot0.expSlider), slot1.exp, slot1:getNextLevelExp(), slot0, 0, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			slot0.expSlider.value = slot0

			return
			--- END OF BLOCK #0 ---



		end, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			if slot0 - 1 > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-21, warpins: 1 ---
				TweenValue(go(slot1.expSlider), 0, 1, , 0, function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-4, warpins: 1 ---
					slot0.expSlider.value = slot0

					return
					--- END OF BLOCK #0 ---



				end, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-6, warpins: 1 ---
					if slot0 - 1 == 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 7-8, warpins: 1 ---
						slot1()
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 9-9, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end, TweenValue)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 22-23, warpins: 1 ---
				slot3()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 24-24, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-40, warpins: 1 ---
		slot6 = slot1:getNextLevelExp()

		TweenValue(go(slot0.expSlider), slot1.exp, slot2.exp, slot0, 0, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0.expSlider.value = slot0 / slot1

			return
			--- END OF BLOCK #0 ---



		end, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			slot0:update(slot0, slot0.detailPage)

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-12, warpins: 1 ---
				slot2()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 13-13, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 41-42, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.exit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

return slot0
