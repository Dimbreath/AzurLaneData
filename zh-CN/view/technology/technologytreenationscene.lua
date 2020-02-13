slot0 = class("TechnologyTreeNationScene", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "TechnologyTreeCampUI"
end

function slot0.init(slot0)
	slot0:initData()
	slot0:findUI()
end

function slot0.didEnter(slot0)
	slot0:addListener()
	slot0:updateTecItemList()
end

function slot0.willExit(slot0)
	for slot4, slot5 in pairs(slot0.timerList) do
		slot5:Stop()
	end
end

function slot0.initData(slot0)
	slot0.nationProxy = getProxy(TechnologyNationProxy)
	slot0.nationToPoint = slot0.nationProxy:getNationPointList()
	slot0.tecList = slot0.nationProxy:GetTecList()
	slot0.panelList = {}
	slot0.timerList = {}
end

function slot0.calculateCurBuff(slot0, slot1, slot2)
	slot3 = nil

	if slot1 == 0 then
		return {}, {}, {}
	else
		slot3 = pg.fleet_tech_group[slot2].techs[slot1]
	end

	slot5 = {}
	slot6 = {}

	for slot10, slot11 in ipairs(slot4) do
		slot12 = slot11[3]
		slot13 = slot11[4]

		for slot18, slot19 in ipairs(slot14) do
			if slot5[slot19] then
				table.insert(slot5[slot19], {
					attr = slot12,
					value = slot13
				})
			else
				slot5[slot19] = {
					{
						attr = slot12,
						value = slot13
					}
				}
				slot6[#slot6 + 1] = slot19
			end
		end
	end

	slot7 = {}
	slot8 = {}

	for slot12, slot13 in pairs(slot5) do
		if not slot7[slot12] then
			slot7[slot12] = {}
			slot8[slot12] = {}
		end

		for slot17, slot18 in ipairs(slot13) do
			slot20 = slot18.value

			if not slot7[slot12][slot18.attr] then
				slot7[slot12][slot19] = slot20
				slot8[slot12][#slot8[slot12] + 1] = slot19
			else
				slot7[slot12][slot19] = slot7[slot12][slot19] + slot20
			end
		end
	end

	table.sort(slot6, function (slot0, slot1)
		return slot0 < slot1
	end)

	for slot12, slot13 in pairs(slot8) do
		table.sort(slot13, function (slot0, slot1)
			return slot0 < slot1
		end)
	end

	return slot6, slot8, slot7
end

function slot0.findUI(slot0)
	slot0.scrollRect = slot0:findTF("Scroll View")
	slot0.tecItemContainer = slot0:findTF("Scroll View/Viewport/Content")
	slot0.scrollRectCom = GetComponent(slot0.scrollRect, "ScrollRect")
	slot0.tecItemTpl = slot0:findTF("CampTecItem")
	slot0.typeItemTpl = slot0:findTF("TypeItem")
	slot0.buffItemTpl = slot0:findTF("BuffItem")
	slot0.tecItemTplOriginWidth = slot0.tecItemTpl.rect.width
end

function slot0.onBackPressed(slot0)
	slot0:emit(slot0.ON_BACK)
end

function slot0.closeMyself(slot0)
	slot0:emit(slot0.ON_CLOSE)
end

function slot0.addListener(slot0)
	return
end

function slot0.updateTecItemList(slot0)
	slot1 = UIItemList.New(slot0.tecItemContainer, slot0.tecItemTpl)

	slot1:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot0.panelList[slot1 + 1] = slot2

			slot0:updateTecItem(slot1 + 1)
		end
	end)
	slot1:align(#pg.fleet_tech_group.all)
end

function slot0.updateTecItem(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-138, warpins: 1 ---
	slot3 = slot0:findTF("BaseInfo", slot2)
	slot5 = slot0:findTF("BG/UpLevelColor", slot3)
	slot10 = slot0:findTF("UpLevelBtn", slot9)
	slot11 = slot0:findTF("FinishBtn", slot9)
	slot13 = slot0:findTF("Text", slot12)
	slot15 = slot0:findTF("ProgressBarBG/Progress", slot3)
	slot17 = slot0:findTF("LevelText/Text", slot3)
	slot18 = slot0:findTF("PointTextBar", slot3)

	setImageSprite(slot6, GetSpriteFromAtlas("TecNation", "camptec_nation_bar_" .. slot20))
	setImageSprite(slot8, GetSpriteFromAtlas("TecNation", "camptec_nation_text_" .. slot20), true)
	setImageSprite(slot14, GetSpriteFromAtlas("TecNation", "camp_tec_english_" .. slot20), true)
	setImageSprite(slot16, GetSpriteFromAtlas("TecNation", "camptec_logo_" .. pg.fleet_tech_group[slot1].nation[1]))
	setText(slot4, slot19)

	slot21, slot22 = nil
	slot21 = (not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0
	slot24 = nil

	BaseUI:setImageAmount(slot0.findTF("ProgressBarBG/Progress", slot3), 0.1 + (0.8 * slot0.nationToPoint[slot20]) / ((((not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0) ~= 0 or pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[1]].pt) and (((not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0) ~= #pg.fleet_tech_group[slot1].techs or pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[(not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0]].pt) and pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[((not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0) + 1]].pt))
	setText(slot0.findTF("LevelText/Text", slot3), (not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0)
	setText(slot0.findTF("PointTextBar", slot3), slot0.nationToPoint[slot20] .. "/" .. ((((not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0) ~= 0 or pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[1]].pt) and (((not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0) ~= #pg.fleet_tech_group[slot1].techs or pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[(not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0]].pt) and pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[((not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0) + 1]].pt))

	function slot25(slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-21, warpins: 1 ---
		setActive(slot0, slot0)
		setActive(slot1, slot1)
		setActive(slot2, slot1)
		setActive(setActive, slot1)
		setActive(setActive, slot2)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 139-140, warpins: 1 ---
	if 0 or not table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 154-154, warpins: 1 ---
		slot21 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 155-159, warpins: 3 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 160-169, warpins: 1 ---
	slot24 = pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[1]].pt

	if pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[1]].pt then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 170-176, warpins: 1 ---
		if slot21 == #pg.fleet_tech_group[slot1].techs then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 177-186, warpins: 1 ---
			slot24 = pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[(not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0]].pt
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 187-196, warpins: 1 ---
			slot24 = pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[((not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0) + 1]].pt
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 197-220, warpins: 3 ---
	if not slot0.tecList[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 221-222, warpins: 1 ---
		if slot24 <= slot23 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 223-228, warpins: 1 ---
			slot25(false, true, false)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 229-234, warpins: 1 ---
			slot25(true, false, false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 235-241, warpins: 1 ---
		if slot21 == #pg.fleet_tech_group[slot1].techs then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 242-247, warpins: 1 ---
			slot25(true, false, false)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 248-252, warpins: 1 ---
			if slot0.tecList[slot1].studyID ~= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 253-261, warpins: 1 ---
				slot25(false, false, true)

				if slot0.timerList[slot1] then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 262-266, warpins: 1 ---
					slot0.timerList[slot1]:Stop()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 267-295, warpins: 2 ---
				setText(slot13, pg.TimeMgr.GetInstance():DescCDTime(slot26))

				slot0.timerList[slot1] = Timer.New(function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-17, warpins: 1 ---
					slot0 = slot0 - 1

					setText(slot1, pg.TimeMgr.GetInstance():DescCDTime(setText))

					if setText == 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 18-24, warpins: 1 ---
						slot2.timerList[slot3]:Stop()
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 25-25, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end, 1, -1)

				slot0.timerList[slot1]:Start()
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 296-297, warpins: 1 ---
				if slot24 <= slot23 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 298-303, warpins: 1 ---
					slot25(false, true, false)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 304-308, warpins: 1 ---
					slot25(true, false, false)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 309-347, warpins: 6 ---
	onButton(slot0, slot10, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0:emit(TechnologyConst.CLICK_UP_TEC_BTN, slot0, )

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	slot27 = GetComponent(slot2, "LayoutElement")
	slot28 = slot0:findTF("Toggle", slot26)

	slot0:updateDetailPanel(slot26, slot21, slot1, slot20, false)
	onToggle(slot0, slot0:findTF("BG", slot3), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 3-36, warpins: 1 ---
			triggerToggle(slot0, false)

			slot2 = go(slot1)

			LeanTween.value(slot2, slot2.tecItemTplOriginWidth, slot2.tecItemTplOriginWidth + slot3.rect.width, 0.25):setOnUpdate(System.Action_float(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-9, warpins: 1 ---
				slot0.preferredWidth = slot0

				if slot0 == #pg.fleet_tech_group.all then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 10-13, warpins: 1 ---
					slot2.scrollRectCom.horizontalNormalizedPosition = 1
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 14-14, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end)):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				if slot0 == #pg.fleet_tech_group.all then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 8-11, warpins: 1 ---
					slot1.scrollRectCom.horizontalNormalizedPosition = 1
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 12-12, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end))
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 37-61, warpins: 1 ---
			LeanTween.cancel(go(LeanTween.cancel))
			LeanTween.value(go(slot1), slot1, slot2.tecItemTplOriginWidth, 0.25):setOnUpdate(System.Action_float(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-3, warpins: 1 ---
				slot0.preferredWidth = slot0

				return
				--- END OF BLOCK #0 ---



			end))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 62-62, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return
	--- END OF BLOCK #5 ---



end

function slot0.updateDetailPanel(slot0, slot1, slot2, slot3, slot4, slot5)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-31, warpins: 1 ---
	slot6 = slot0:findTF("TypeItemContainer", slot1)

	setImageSprite(slot7, GetSpriteFromAtlas("TecNation", "camptec_logo_" .. slot4))

	slot8 = slot0:findTF("Toggle", slot1)

	if slot2 == #pg.fleet_tech_group[slot3].techs and slot5 == false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-37, warpins: 1 ---
		setActive(slot8, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 38-46, warpins: 3 ---
	function slot9(slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot3 = UIItemList.New(slot0, slot1.typeItemTpl)
		slot4 = nil

		if slot0 == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-14, warpins: 1 ---
			slot3:align(0)

			return
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-15, warpins: 0 ---
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			slot4 = pg.fleet_tech_group[slot1].techs[slot0]
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-29, warpins: 2 ---
		slot5, slot6, slot7 = nil
		slot8 = Color.New(1, 0.9333333333333333, 0.19215686274509805)

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-38, warpins: 1 ---
			slot5, slot6, slot7 = slot1:calculateCurBuff(slot0 - 1, slot1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 39-48, warpins: 2 ---
		slot10 = {}
		slot11 = {}

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 49-126, warpins: 0 ---
		for slot15, slot16 in ipairs(slot9) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 49-55, warpins: 1 ---
			slot17 = slot16[3]
			slot18 = slot16[4]

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 56-124, warpins: 0 ---
			for slot23, slot24 in ipairs(slot19) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 56-58, warpins: 1 ---
				slot25 = nil

				if slot2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 59-66, warpins: 1 ---
					if not table.indexof(slot5, slot24, 1) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 67-73, warpins: 1 ---
						slot25 = {
							attr = slot17,
							value = slot18,
							attrColor = slot8,
							valueColor = slot8
						}
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 74-81, warpins: 1 ---
						if not table.indexof(slot6[slot24], slot17, 1) then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 82-88, warpins: 1 ---
							slot25 = {
								attr = slot17,
								value = slot18,
								attrColor = slot8,
								valueColor = slot8
							}
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 89-92, warpins: 1 ---
							if slot18 ~= slot7[slot24][slot17] then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 93-98, warpins: 1 ---
								slot25 = {
									attr = slot17,
									value = slot18,
									valueColor = slot8
								}
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 99-103, warpins: 1 ---
								slot25 = {
									attr = slot17,
									value = slot18
								}
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 104-107, warpins: 1 ---
					slot25 = {
						attr = slot17,
						value = slot18
					}
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 108-110, warpins: 5 ---
				if slot10[slot24] then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 111-116, warpins: 1 ---
					table.insert(slot10[slot24], slot25)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 117-122, warpins: 1 ---
					slot10[slot24] = {
						slot25
					}
					slot11[#slot11 + 1] = slot24
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 123-124, warpins: 3 ---
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 125-126, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 127-136, warpins: 1 ---
		slot3:make(function (slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0 == UIItemList.EventUpdate then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-35, warpins: 1 ---
				slot4 = slot0:findTF("BuffItemContainer", slot2)

				setImageSprite(slot3, GetSpriteFromAtlas("ShipType", "buffitem_tec_" .. slot1[slot1 + 1]))
				slot0:upBuffList(slot2, slot2[slot1[slot1 + 1]])
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 36-36, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		slot3:align(#slot11)

		return
		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 137-137, warpins: 2 ---
		--- END OF BLOCK #5 ---



	end

	onToggle(slot0, slot8, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		if slot0 == true then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 3-9, warpins: 1 ---
			slot0(slot1 + 1, , true)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-13, warpins: 1 ---
			slot0(slot0, )
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-14, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)

	if slot5 == false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-50, warpins: 1 ---
		triggerToggle(slot8, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 51-52, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.upBuffList(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot4 = UIItemList.New(slot3, slot0.buffItemTpl)

	slot4:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-50, warpins: 1 ---
			slot8 = slot1[slot1 + 1].valueColor

			setText(slot3, AttributeType.Type2Name(pg.attribute_info_by_type[slot1[slot1 + 1].attr].name))
			setText(slot0:findTF("ValueText", slot2), "+" .. slot1[slot1 + 1].value)

			if slot1[slot1 + 1].attrColor then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 51-55, warpins: 1 ---
				setTextColor(slot3, slot7)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 56-60, warpins: 1 ---
				setTextColor(slot3, Color.white)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 61-62, warpins: 2 ---
			if slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 63-67, warpins: 1 ---
				setTextColor(slot4, slot8)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 68-72, warpins: 1 ---
				setTextColor(slot4, Color.green)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 73-73, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end)
	slot4:align(#slot2)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateTecListData(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0.tecList = getProxy(TechnologyNationProxy):GetTecList()

	return
	--- END OF BLOCK #0 ---



end

return slot0
