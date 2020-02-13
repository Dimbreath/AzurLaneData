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

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-44, warpins: 2 ---
		slot10 = EquipType.isDevice(slot1.configId) and slot9 == slot5

		setActive((EquipType.isDevice(slot1.configId) and slot9 == slot5 and slot2:Find("attr_skill")) or slot2:Find("attr_" .. slot9), true)

		slot12 = (EquipType.isDevice(slot1.configId) and slot9 == slot5 and slot2.Find("attr_skill")) or slot2.Find("attr_" .. slot9):Find("panel/tag")
		slot13 = (EquipType.isDevice(slot1.configId) and slot9 == slot5 and slot2.Find("attr_skill")) or slot2.Find("attr_" .. slot9):Find("panel")
		slot14 = (EquipType.isDevice(slot1.configId) and slot9 == slot5 and slot2.Find("attr_skill")) or slot2.Find("attr_" .. slot9):Find("panel/value")
		slot15 = (EquipType.isDevice(slot1.configId) and slot9 == slot5 and slot2.Find("attr_skill")) or slot2.Find("attr_" .. slot9):Find("lock")

		function slot16(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			setActive(slot0, not slot0)
			setActive(setActive, slot0)

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #1 45-46, warpins: 1 ---
		if slot9 ~= slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 47-48, warpins: 1 ---
			slot10 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 49-49, warpins: 1 ---
			slot10 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 50-51, warpins: 3 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #3 52-57, warpins: 1 ---
		if not slot2.Find("attr_skill") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 58-63, warpins: 2 ---
			slot11 = slot2.Find("attr_" .. slot9)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 64-90, warpins: 2 ---
		if findTF(slot0, "skill/value") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 91-94, warpins: 1 ---
			setText(slot17, "")
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 95-96, warpins: 2 ---
		if slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 97-98, warpins: 1 ---
			if slot12 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 99-104, warpins: 1 ---
				setText(slot12, i18n("skill"))
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 105-115, warpins: 2 ---
			slot16(not slot3.skill_id[1])

			slot19 = findTF(slot0, "skill/value")

			if slot3.skill_id[1] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 116-126, warpins: 1 ---
				slot20 = getSkillConfig(slot18)

				setText(slot14, getSkillName(slot18))

				if slot19 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 127-133, warpins: 1 ---
					setText(slot19, getSkillDescGet(slot18))
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 134-139, warpins: 1 ---
				setText(slot14, "")

				if slot19 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 140-144, warpins: 1 ---
					setText(slot19, "")
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 145-150, warpins: 1 ---
			slot16(not slot4[slot9])

			if slot4[slot9] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 151-156, warpins: 1 ---
				if not EquipType.isDevice(slot1.configId) and slot18.type == AttributeType.Reload and slot9 == 4 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 164-189, warpins: 1 ---
					setText(slot12, i18n("word_attr_cd"))
					setText(slot14, setColorStr(string.format("%0.2f", slot1:getWeaponCD()) .. "s", COLOR_YELLOW) .. i18n("word_secondseach"))
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 190-200, warpins: 3 ---
					setText(slot12, AttributeType.Type2Name(slot18.type))
					setText(slot14, slot18.value)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 201-202, warpins: 7 ---
		--- END OF BLOCK #6 ---



	end
end

function slot0.createDesign(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	slot2 = findTF(slot1, "info/count")
	slot3 = findTF(slot1, "mask")

	return {
		go = slot1,
		nameTxt = slot0:findTF("name_bg/mask/name", slot1),
		getItemById = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if not slot0.itemVOs[slot1] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-9, warpins: 1 ---
				slot2 = Item.New({
					count = 0,
					id = slot1
				})
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 10-10, warpins: 2 ---
			return slot2
			--- END OF BLOCK #1 ---



		end,
		update = function (slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-41, warpins: 1 ---
			slot0.designId = slot1
			slot0.itemVOs = slot2

			TweenItemAlphaAndWhite(slot0.go)
			setText(slot0.nameTxt, shortenString(pg.equip_data_statistics[pg.compose_data_template[slot1].equip_id].name, 6))
			updateEquipment(slot7, slot6)
			slot3(slot0, Equipment.New({
				id = pg.compose_data_template[slot1].equip_id
			}))

			-- Decompilation error in this vicinity:
			function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				if not slot0.itemVOs[slot1.material_id] then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 8-14, warpins: 1 ---
					slot0 = Item.New({
						count = 0,
						id = slot1.material_id
					})
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 15-24, warpins: 2 ---
				if slot1.material_num > slot0.count or not setColorStr(slot1, COLOR_WHITE) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 31-35, warpins: 2 ---
					slot1 = setColorStr(slot1, COLOR_RED)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 36-46, warpins: 2 ---
				setText(setText, slot1)

				slot2 = setActive
				slot3 = setText

				if slot0.count >= slot1.material_num then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 47-48, warpins: 1 ---
					slot4 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 49-49, warpins: 1 ---
					slot4 = true
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 50-51, warpins: 2 ---
				slot2(slot3, slot4)

				return
				--- END OF BLOCK #3 ---



			end()

			return
			--- END OF BLOCK #0 ---



		end
	}
	--- END OF BLOCK #0 ---



end

function slot0.initDesign(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	onButton(slot0, tf(slot0:createDesign(slot1).go):Find("info/make_btn"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:showDesignDesc(slot1.designId)

		return
		--- END OF BLOCK #0 ---



	end)

	slot0.desgins[slot1] = slot0.createDesign(slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateDesign(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not slot0.desgins[slot2] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-10, warpins: 1 ---
		slot0:initDesign(slot2)

		slot3 = slot0.desgins[slot2]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-19, warpins: 2 ---
	slot3:update(slot0.desginIds[slot1 + 1], slot0.itemVOs)

	return
	--- END OF BLOCK #1 ---



end

function slot0.filter(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot3 = {}
	slot4 = slot0.asc

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-26, warpins: 0 ---
	for slot8, slot9 in ipairs(pg.compose_data_template.all) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-19, warpins: 1 ---
		if slot0:getItemById(pg.compose_data_template[slot9].material_id).count > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-24, warpins: 1 ---
			table.insert(slot3, slot9)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-26, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-29, warpins: 1 ---
	function slot5(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-36, warpins: 1 ---
		return {
			equipmentCfg = pg.equip_data_statistics[slot0[slot0].equip_id],
			designCfg = slot0[slot0],
			id = slot0,
			itemCount = slot1:getItemById(slot0[slot0].material_id).count,
			canMakeCount = math.floor(slot1.getItemById(slot0[slot0].material_id).count / slot0[slot0].material_num),
			canMake = math.min(()["canMakeCount"], 1)
		}
		--- END OF BLOCK #0 ---



	end

	if slot1 == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-31, warpins: 1 ---
		if slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-37, warpins: 1 ---
			table.sort(slot3, function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-10, warpins: 1 ---
				if slot0(slot0).canMake == slot0(slot1).canMake then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 11-16, warpins: 1 ---
					if slot2.equipmentCfg.rarity == slot3.equipmentCfg.rarity then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 17-22, warpins: 1 ---
						if slot2.equipmentCfg.id >= slot3.equipmentCfg.id then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 23-24, warpins: 1 ---
							slot4 = false
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 25-25, warpins: 1 ---
							slot4 = true
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 26-27, warpins: 2 ---
						return slot4
						--- END OF BLOCK #1 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 28-33, warpins: 1 ---
						if slot3.equipmentCfg.rarity >= slot2.equipmentCfg.rarity then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 34-35, warpins: 1 ---
							slot4 = false
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 36-36, warpins: 1 ---
							slot4 = true
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 37-38, warpins: 2 ---
						return slot4
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 39-42, warpins: 1 ---
					if slot2.canMake >= slot3.canMake then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 43-44, warpins: 1 ---
						slot4 = false
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 45-45, warpins: 1 ---
						slot4 = true
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 46-46, warpins: 2 ---
					return slot4
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 47-47, warpins: 3 ---
				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-43, warpins: 1 ---
			table.sort(slot3, function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-10, warpins: 1 ---
				if slot0(slot0).canMake == slot0(slot1).canMake then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 11-16, warpins: 1 ---
					if slot2.equipmentCfg.rarity == slot3.equipmentCfg.rarity then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 17-22, warpins: 1 ---
						if slot2.equipmentCfg.id >= slot3.equipmentCfg.id then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 23-24, warpins: 1 ---
							slot4 = false
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 25-25, warpins: 1 ---
							slot4 = true
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 26-27, warpins: 2 ---
						return slot4
						--- END OF BLOCK #1 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 28-33, warpins: 1 ---
						if slot3.equipmentCfg.rarity >= slot2.equipmentCfg.rarity then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 34-35, warpins: 1 ---
							slot4 = false
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 36-36, warpins: 1 ---
							slot4 = true
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 37-38, warpins: 2 ---
						return slot4
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 39-42, warpins: 1 ---
					if slot3.canMake >= slot2.canMake then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 43-44, warpins: 1 ---
						slot4 = false
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 45-45, warpins: 1 ---
						slot4 = true
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 46-46, warpins: 2 ---
					return slot4
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 47-47, warpins: 3 ---
				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-45, warpins: 1 ---
		if slot1 == 2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-48, warpins: 1 ---
			if slot0.asc then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 49-54, warpins: 1 ---
				table.sort(slot3, function (slot0, slot1)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-12, warpins: 1 ---
					if slot0(slot0).equipmentCfg.rarity == slot0(slot1).equipmentCfg.rarity then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 13-18, warpins: 1 ---
						if slot2.equipmentCfg.id >= slot2.equipmentCfg.id then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 19-20, warpins: 1 ---
							slot4 = false
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 21-21, warpins: 1 ---
							slot4 = true
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 22-22, warpins: 2 ---
						return slot4
						--- END OF BLOCK #1 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 23-28, warpins: 2 ---
					if slot2.equipmentCfg.rarity >= slot3.equipmentCfg.rarity then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 29-30, warpins: 1 ---
						slot4 = false
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 31-31, warpins: 1 ---
						slot4 = true
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 32-32, warpins: 2 ---
					return slot4
					--- END OF BLOCK #2 ---



				end)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 55-60, warpins: 1 ---
				table.sort(slot3, function (slot0, slot1)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-12, warpins: 1 ---
					if slot0(slot0).equipmentCfg.rarity == slot0(slot1).equipmentCfg.rarity then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 13-18, warpins: 1 ---
						if slot2.equipmentCfg.id >= slot2.equipmentCfg.id then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 19-20, warpins: 1 ---
							slot4 = false
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 21-21, warpins: 1 ---
							slot4 = true
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 22-22, warpins: 2 ---
						return slot4
						--- END OF BLOCK #1 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 23-28, warpins: 2 ---
					if slot3.equipmentCfg.rarity >= slot2.equipmentCfg.rarity then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 29-30, warpins: 1 ---
						slot4 = false
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 31-31, warpins: 1 ---
						slot4 = true
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 32-32, warpins: 2 ---
					return slot4
					--- END OF BLOCK #2 ---



				end)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 61-62, warpins: 1 ---
			if slot1 == 3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 63-65, warpins: 1 ---
				if slot0.asc then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 66-71, warpins: 1 ---
					table.sort(slot3, function (slot0, slot1)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-10, warpins: 1 ---
						if slot0(slot0).itemCount == slot0(slot1).itemCount then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 11-16, warpins: 1 ---
							if slot2.equipmentCfg.id >= slot3.equipmentCfg.id then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 17-18, warpins: 1 ---
								slot4 = false
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 19-19, warpins: 1 ---
								slot4 = true
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 20-20, warpins: 2 ---
							return slot4
							--- END OF BLOCK #1 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 21-24, warpins: 2 ---
						if slot2.itemCount >= slot3.itemCount then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 25-26, warpins: 1 ---
							slot4 = false
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 27-27, warpins: 1 ---
							slot4 = true
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #1 ---

						FLOW; TARGET BLOCK #2



						-- Decompilation error in this vicinity:
						--- BLOCK #2 28-28, warpins: 2 ---
						return slot4
						--- END OF BLOCK #2 ---



					end)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 72-77, warpins: 1 ---
					table.sort(slot3, function (slot0, slot1)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-10, warpins: 1 ---
						if slot0(slot0).itemCount == slot0(slot1).itemCount then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 11-16, warpins: 1 ---
							if slot2.equipmentCfg.id >= slot3.equipmentCfg.id then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 17-18, warpins: 1 ---
								slot4 = false
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 19-19, warpins: 1 ---
								slot4 = true
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 20-20, warpins: 2 ---
							return slot4
							--- END OF BLOCK #1 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 21-24, warpins: 2 ---
						if slot3.itemCount >= slot2.itemCount then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 25-26, warpins: 1 ---
							slot4 = false
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 27-27, warpins: 1 ---
							slot4 = true
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #1 ---

						FLOW; TARGET BLOCK #2



						-- Decompilation error in this vicinity:
						--- BLOCK #2 28-28, warpins: 2 ---
						return slot4
						--- END OF BLOCK #2 ---



					end)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 78-79, warpins: 1 ---
				if slot1 == 4 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 80-82, warpins: 1 ---
					if slot0.asc then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 83-88, warpins: 1 ---
						table.sort(slot3, function (slot0, slot1)

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-12, warpins: 1 ---
							if slot0(slot1).equipmentCfg.id >= slot0(slot0).equipmentCfg.id then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 13-14, warpins: 1 ---
								slot4 = false
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 15-15, warpins: 1 ---
								slot4 = true
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 16-16, warpins: 2 ---
							return slot4
							--- END OF BLOCK #1 ---



						end)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 89-93, warpins: 1 ---
						table.sort(slot3, function (slot0, slot1)

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-12, warpins: 1 ---
							if slot0(slot0).equipmentCfg.id >= slot0(slot1).equipmentCfg.id then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 13-14, warpins: 1 ---
								slot4 = false
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 15-15, warpins: 1 ---
								slot4 = true
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 16-16, warpins: 2 ---
							return slot4
							--- END OF BLOCK #1 ---



						end)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 94-106, warpins: 9 ---
	slot0.desginIds = slot3

	slot0.scollRect:SetTotalCount(#slot3, 0)

	slot6 = setActive
	slot7 = slot0.listEmptyTF

	if #slot3 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 107-108, warpins: 1 ---
		slot8 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 109-109, warpins: 1 ---
		slot8 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 110-137, warpins: 2 ---
	slot6(slot7, slot8)
	Canvas.ForceUpdateCanvases()
	setImageSprite(slot0:findTF("Image", slot0.sortBtn), slot6)
	setActive(slot0.sortImgAsc, slot0.asc)
	setActive(slot0.sortImgDec, not slot0.asc)

	return
	--- END OF BLOCK #4 ---



end

function slot0.getItemById(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not slot0.itemVOs[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 1 ---
		slot2 = Item.New({
			count = 0,
			id = slot1
		})
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-10, warpins: 2 ---
	return slot2
	--- END OF BLOCK #1 ---



end

function slot0.showDesignDesc(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0.isShowDesc = true

	if IsNil(slot0.msgBoxTF) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-110, warpins: 1 ---
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

	if not slot5.config.tech then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 111-111, warpins: 1 ---
		slot10 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 112-116, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 117-129, warpins: 0 ---
	for slot14 = 0, slot9.childCount - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 117-124, warpins: 2 ---
		slot16 = setActive
		slot17 = slot9:GetChild(slot14)

		if slot14 ~= slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 125-126, warpins: 1 ---
			slot18 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 127-127, warpins: 1 ---
			slot18 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 128-129, warpins: 2 ---
		slot16(slot17, slot18)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 130-208, warpins: 1 ---
	slot12 = math.floor(slot0:getItemById(slot3.material_id).count / slot3.material_num)
	slot14 = slot0:findTF("bg/calc/values/Text", slot2)
	slot15 = slot3.gold_num
	slot16 = slot0:findTF("bg/calc/gold/Text", slot2)

	slot17(slot13)
	onButton(slot0, findTF(slot2, "bg/calc/minus"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0 <= 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-12, warpins: 2 ---
		slot0 = slot0 - 1

		slot1(slot1)

		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)
	onButton(slot0, findTF(slot2, "bg/calc/add"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0 == slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-12, warpins: 2 ---
		slot0 = slot0 + 1

		slot2(slot2)

		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)
	onButton(slot0, findTF(slot2, "bg/calc/max"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0 == slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-25, warpins: 2 ---

		-- Decompilation error in this vicinity:
		1(math.max(math.min(slot1, slot2.player.equip_bag_max - slot2.capacity), 
		-- Decompilation error in this vicinity:
		1))

		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)
	onButton(slot0, findTF(slot2, "bg/cancel_btn"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideMsgBox()

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	onButton(slot0, findTF(slot2, "bg/confirm_btn"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0:emit(EquipmentDesignMediator.MAKE_EQUIPMENT, slot0, )
		slot0.emit:hideMsgBox()

		return
		--- END OF BLOCK #0 ---



	end, SFX_CONFIRM)
	onButton(slot0, slot2, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideMsgBox()

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)

	return
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 209-209, warpins: 2 ---
	--- END OF BLOCK #5 ---



end

function slot3(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot3 = findTF(slot0, "name")
	slot4 = findTF(slot0, "value")

	if not EquipType.isDevice(slot2.configId) and slot1.type == AttributeType.Reload then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-45, warpins: 1 ---
		setText(slot3, i18n("word_attr_cd"))
		setText(slot4, setColorStr(string.format("%0.2f", slot2:getWeaponCD()) .. "s", COLOR_YELLOW) .. i18n("word_secondseach"))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-56, warpins: 2 ---
		setText(slot3, AttributeType.Type2Name(slot1.type))
		setText(slot4, slot1.value)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 57-57, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.updateDescAttrs(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-43, warpins: 1 ---
	setImageSprite(findTF(slot1, "name_bg/tag"), GetSpriteFromAtlas("equiptype", EquipType.type2Tag(slot2.config.type)))

	slot6 = findTF(slot5, "attr")
	slot7 = findTF(slot3, "skill")
	slot8 = slot2:GetProperties(true)
	slot9 = slot2:GetSkill()

	if not EquipType.isAircraft(slot2.configId) or not pg.aircraft_template[slot2.configId].weapon_ID then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 51-51, warpins: 2 ---
		slot11 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 52-57, warpins: 2 ---
	setActive(slot7, slot9)

	if slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 58-87, warpins: 1 ---
		setText(slot12, i18n("skill"))
		setText(slot13, setColorStr(slot9.name, "#FFDE00FF"))
		setText(findTF(slot7, "value/Text"), getSkillDescGet(slot9.id))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 88-96, warpins: 2 ---
	slot12 = 0

	eachChild(slot5, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		setActive(slot0, false)

		return
		--- END OF BLOCK #0 ---



	end)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 97-123, warpins: 0 ---
	for slot16, slot17 in pairs(slot8) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 97-100, warpins: 1 ---
		if slot12 + 1 > slot5.childCount or not slot5:GetChild(slot12 - 1) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 107-110, warpins: 2 ---
			slot18 = cloneTplTo(slot6, slot5)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 111-116, warpins: 2 ---
		setActive(slot18, slot17)

		if slot17 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 117-121, warpins: 1 ---
			slot0(slot18, slot17, slot2)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 122-123, warpins: 3 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 124-127, warpins: 1 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 128-178, warpins: 0 ---
	for slot16, slot17 in ipairs(slot11) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 128-131, warpins: 1 ---
		if slot12 + 1 > slot5.childCount or not slot5:GetChild(slot12 - 1) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 138-141, warpins: 2 ---
			slot18 = cloneTplTo(slot6, slot5)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 142-176, warpins: 2 ---
		setActive(slot18, true)
		setTextFont(slot20, pg.FontMgr.GetInstance().fonts.heiti)
		setText(slot19, "")
		setText(findTF(slot18, "value"), setColorStr(pg.weapon_property[slot17].name, COLOR_YELLOW))
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 177-178, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 179-179, warpins: 1 ---
	return
	--- END OF BLOCK #6 ---



end

function slot0.hideMsgBox(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if not IsNil(slot0.msgBoxTF) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-17, warpins: 1 ---
		slot0.isShowDesc = nil

		slot0.UIMgr:UnblurPanel(slot0.msgBoxTF, slot0._tf)
		setActive(slot0.msgBoxTF, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-18, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.isShowDesc then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot0:hideMsgBox()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-15, warpins: 1 ---
		playSoundEffect(SFX_CANCEL)
		slot0:emit(slot0.ON_BACK)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.leftEventTrigger then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		ClearEventTrigger(slot0.leftEventTrigger)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-9, warpins: 2 ---
	if slot0.rightEventTrigger then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-12, warpins: 1 ---
		ClearEventTrigger(slot0.rightEventTrigger)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 13-18, warpins: 2 ---
	setParent(slot0.sortBtn.parent, slot0._tf)

	return
	--- END OF BLOCK #2 ---



end

return slot0
