slot0 = class("SwichSkinLayer", import("..base.BaseUI"))

function slot0.setShip(slot0, slot1)
	slot0.shipVO = slot1
end

function slot0.setShipSkin(slot0, slot1)
	slot0.shipVO.skinId = slot1
end

function slot0.setSkinList(slot0, slot1)
	slot0.skinList = slot1
	slot0.skins = slot0:getGroupSkinList(slot0.shipVO.groupId)
	slot0.owns = slot0:getGroupOwnSkins(slot0.shipVO.groupId)
end

function slot0.getUIName(slot0)
	return "SwichSkinLayer"
end

function slot0.back(slot0)
	slot0:emit(slot0.ON_CLOSE)
end

function slot0.init(slot0)
	return
end

function slot0.didEnter(slot0)
	slot0:initSelectSkinPanel()

	if slot0.shipVO and #slot0.skins > 1 then
		slot0:openSelectSkinPanel()
	end
end

function slot0.initSelectSkinPanel(slot0)
	slot0.skinPanel = slot0._tf

	onButton(slot0, slot1, function ()
		slot0:back()
	end)
	onButton(slot0, slot2, function ()
		slot0:back()
	end)

	slot0.skinScroll = slot0:findTF("select_skin/style_scroll", slot0.skinPanel)
	slot0.skinContainer = slot0:findTF("view_port", slot0.skinScroll)
	slot0.skinCard = slot0._go:GetComponent(typeof(ItemList)).prefabItem[0]

	setActive(slot0.skinCard, false)

	slot0.skinCardMap = {}
end

function slot0.openSelectSkinPanel(slot0)
	for slot4 = slot0.skinContainer.childCount, #slot0.skins - 1, 1 do
		cloneTplTo(slot0.skinCard, slot0.skinContainer)
	end

	for slot4 = #slot0.skins, slot0.skinContainer.childCount - 1, 1 do
		setActive(slot0.skinContainer:GetChild(slot4), false)
	end

	slot1 = slot0.skinContainer.childCount

	for slot5, slot6 in ipairs(slot0.skins) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-43, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 51-57, warpins: 2 ---
		if not slot0.skinCardMap[slot0.skinContainer:GetChild(slot5 - 1)] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 44-50, warpins: 1 ---
			slot0.skinCardMap[slot7] = ShipSkinCard.New(slot7.gameObject)
			--- END OF BLOCK #0 ---



		end

		slot9 = slot0.shipVO:getRemouldSkinId() == slot6.id and slot0.shipVO:isRemoulded()

		slot8:updateData(slot0.shipVO, slot6, slot0.shipVO:proposeSkinOwned(slot6) or table.contains(slot0.skinList, slot6.id) or (slot0.shipVO.getRemouldSkinId() == slot6.id and slot0.shipVO.isRemoulded()) or slot6.skin_type == ShipSkin.SKIN_TYPE_OLD)
		slot8:updateSkin(slot6, slot0.shipVO.proposeSkinOwned(slot6) or table.contains(slot0.skinList, slot6.id) or (slot0.shipVO.getRemouldSkinId() == slot6.id and slot0.shipVO.isRemoulded()) or slot6.skin_type == ShipSkin.SKIN_TYPE_OLD)
		slot8:updateUsing(slot0.shipVO.skinId == slot6.id)
		removeOnButton(slot7)

		slot14 = ((slot6.shop_id > 0 and pg.shop_template[slot6.shop_id]) or nil) and not pg.TimeMgr.GetInstance():inTime((slot6.shop_id > 0 and pg.shop_template[slot6.shop_id]) or nil.time)
		slot15 = slot6.id == slot0.shipVO.skinId
		slot16 = slot6.id == slot0.shipVO:getConfig("skin_id") or (((slot0.shipVO:proposeSkinOwned(slot6) or table.contains(slot0.skinList, slot6.id) or (slot0.shipVO:getRemouldSkinId() == slot6.id and slot0.shipVO:isRemoulded())) and 1) or 0) >= 1 or slot6.skin_type == ShipSkin.SKIN_TYPE_OLD

		onToggle(slot0, slot8.hideObjToggleTF, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			slot1 = PlayerPrefs.SetInt
			slot2 = "paint_hide_other_obj_" .. slot0.paintingName

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-10, warpins: 1 ---
				slot3 = 1
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-11, warpins: 1 ---
				slot3 = 0
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 12-26, warpins: 2 ---
			slot1(slot2, slot3)
			slot0:flushSkin()
			slot0.flushSkin:emit(SwichSkinMediator.UPDATE_SKINCONFIG, slot1.shipVO.skinId)

			return
			--- END OF BLOCK #1 ---



		end, SFX_PANEL)
		onButton(slot0, slot7, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-8, warpins: 1 ---
				slot1:back()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-11, warpins: 1 ---
				if slot2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 12-29, warpins: 1 ---
					slot0 = slot1.emit
					slot2 = SwichSkinMediator.CHANGE_SKIN

					if slot3.id == slot1.shipVO:getConfig("skin_id") then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 30-31, warpins: 1 ---
						slot4 = 0
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 32-33, warpins: 1 ---
						slot4 = slot3.id
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 34-39, warpins: 2 ---
					slot0(slot1, slot2, slot3, slot4)
					slot1:back()
					--- END OF BLOCK #1 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 40-42, warpins: 1 ---
					if slot4 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 43-45, warpins: 1 ---
						if slot5 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 46-56, warpins: 1 ---
							pg.TipsMgr.GetInstance():ShowTips(i18n("common_skin_out_of_stock"))
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 57-74, warpins: 1 ---
							slot0 = Goods.New({
								shop_id = slot4.id
							}, Goods.TYPE_SKIN)
							slot1 = slot0:getConfig("resource_num")

							if slot0:isDisCount() then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 75-81, warpins: 1 ---
								slot1 = slot1 * (100 - slot0:getConfig("discount")) / 100
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 82-101, warpins: 2 ---
							pg.MsgboxMgr.GetInstance():ShowMsgBox({
								content = i18n("text_buy_fashion_tip", slot1, HXSet.hxLan(slot3.name)),
								onYes = function ()

									-- Decompilation error in this vicinity:
									--- BLOCK #0 1-10, warpins: 1 ---
									slot0:emit(SwichSkinMediator.BUY_ITEM, slot1.id, 1)

									return
									--- END OF BLOCK #0 ---



								end
							})
							--- END OF BLOCK #1 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 102-102, warpins: 5 ---
			return
			--- END OF BLOCK #1 ---



		end)
		setActive(slot7, true)

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 58-62, warpins: 1 ---
		slot9 = slot0.shipVO.isRemoulded()

		if slot0.shipVO.isRemoulded() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 63-64, warpins: 1 ---
			slot9 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 65-65, warpins: 0 ---
				slot9 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 66-72, warpins: 3 ---
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #4 73-79, warpins: 1 ---
		if not table.contains(slot0.skinList, slot6.id) and not slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 82-86, warpins: 1 ---
			if slot6.skin_type ~= ShipSkin.SKIN_TYPE_OLD then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 87-88, warpins: 1 ---
				slot10 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 89-89, warpins: 1 ---
				slot10 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 90-107, warpins: 5 ---
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #6 108-109, warpins: 1 ---
		slot13 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 110-110, warpins: 1 ---
			slot13 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 111-121, warpins: 2 ---
		--- END OF BLOCK #7 ---

		FLOW; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #8 122-126, warpins: 1 ---
		slot11 = slot0.shipVO.isRemoulded()

		if slot0.shipVO.isRemoulded() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 127-128, warpins: 1 ---
			slot11 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 129-129, warpins: 0 ---
				slot11 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #8 ---

		FLOW; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #9 130-136, warpins: 3 ---
		--- END OF BLOCK #9 ---

		FLOW; TARGET BLOCK #11



		-- Decompilation error in this vicinity:
		--- BLOCK #10 137-143, warpins: 1 ---
		if table.contains(slot0.skinList, slot6.id) or slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 146-147, warpins: 3 ---
			slot12 = 1
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 148-148, warpins: 1 ---
			slot12 = 0
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #10 ---

		FLOW; TARGET BLOCK #11



		-- Decompilation error in this vicinity:
		--- BLOCK #11 149-152, warpins: 2 ---
		--- END OF BLOCK #11 ---

		FLOW; TARGET BLOCK #13



		-- Decompilation error in this vicinity:
		--- BLOCK #12 153-158, warpins: 1 ---
		if not pg.shop_template[slot6.shop_id] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 159-159, warpins: 2 ---
			slot13 = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #12 ---

		FLOW; TARGET BLOCK #13



		-- Decompilation error in this vicinity:
		--- BLOCK #13 160-161, warpins: 2 ---
		--- END OF BLOCK #13 ---

		FLOW; TARGET BLOCK #15



		-- Decompilation error in this vicinity:
		--- BLOCK #14 162-170, warpins: 1 ---
		slot14 = not pg.TimeMgr.GetInstance().inTime((slot6.shop_id > 0 and pg.shop_template[slot6.shop_id]) or nil.time)
		--- END OF BLOCK #14 ---

		FLOW; TARGET BLOCK #15



		-- Decompilation error in this vicinity:
		--- BLOCK #15 171-175, warpins: 2 ---
		--- END OF BLOCK #15 ---

		FLOW; TARGET BLOCK #17



		-- Decompilation error in this vicinity:
		--- BLOCK #16 176-177, warpins: 1 ---
		slot15 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 178-178, warpins: 1 ---
			slot15 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #16 ---

		FLOW; TARGET BLOCK #17



		-- Decompilation error in this vicinity:
		--- BLOCK #17 179-186, warpins: 2 ---
		--- END OF BLOCK #17 ---

		FLOW; TARGET BLOCK #19



		-- Decompilation error in this vicinity:
		--- BLOCK #18 187-189, warpins: 1 ---
		if slot12 < 1 and slot6.skin_type ~= ShipSkin.SKIN_TYPE_OLD then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 195-196, warpins: 1 ---
			slot16 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 197-197, warpins: 3 ---
			slot16 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #18 ---

		FLOW; TARGET BLOCK #19



		-- Decompilation error in this vicinity:
		--- BLOCK #19 198-214, warpins: 2 ---
		--- END OF BLOCK #19 ---

		FLOW; TARGET BLOCK #20



		-- Decompilation error in this vicinity:
		--- BLOCK #20 215-216, warpins: 2 ---
		--- END OF BLOCK #20 ---



	end
end

function slot0.isCurrentShipExistSkin(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-7, warpins: 1 ---
		if #slot0.skins > 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-10, warpins: 1 ---
			return true
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-14, warpins: 1 ---
			if #slot0.skins == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-16, warpins: 1 ---
				return false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-17, warpins: 4 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.getGroupSkinList(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	return getProxy(ShipSkinProxy):GetAllSkinForShip(slot0.shipVO)
	--- END OF BLOCK #0 ---



end

function slot0.getGroupOwnSkins(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot2 = {}
	slot3 = slot0.skinList

	if getProxy(CollectionProxy):getShipGroup(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-19, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 20-52, warpins: 0 ---
		for slot9, slot10 in ipairs(slot5) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-24, warpins: 1 ---
			if slot10.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(slot3, slot10.id) or (slot10.skin_type == ShipSkin.SKIN_TYPE_REMAKE and slot4.trans) or (slot10.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and slot4.married == 1) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 48-50, warpins: 4 ---
				slot2[slot10.id] = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 51-52, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 53-53, warpins: 2 ---
	return slot2
	--- END OF BLOCK #1 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.skinCardMap) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot5:clear()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-10, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

return slot0
