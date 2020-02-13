slot0 = class("ShipSkinCard")

function slot0.Ctor(slot0, slot1)
	slot0.go = slot1
	slot0.tr = slot1.transform
	slot0.painting = findTF(slot0.tr, "bg/mask/painting")
	slot0.nameBar = findTF(slot0.tr, "bg/desc/name_bar")
	slot0.name = findTF(slot0.nameBar, "name")
	slot0.effectBar = findTF(slot0.tr, "bg/desc/effect_bar")
	slot0.effect = findTF(slot0.effectBar, "effect")
	slot0.bgUsing = findTF(slot0.tr, "bg/bg_using")
	slot0.bgMark = findTF(slot0.tr, "bg/bg_mark")
	slot0.picNotBuy = findTF(slot0.bgMark, "bg/pic_not_buy")
	slot0.picActivity = findTF(slot0.bgMark, "bg/pic_activity")
	slot0.picPropose = findTF(slot0.bgMark, "bg/pic_propose")
	slot0.outline = findTF(slot0.tr, "bg/outline")
	slot0.tags = findTF(slot0.tr, "bg/tags")
	slot0.timelimitTag = findTF(slot0.tr, "bg/timelimit")
	slot0.timelimitTimeTxt = findTF(slot0.tr, "bg/timelimit_time")

	setActive(slot0.timelimitTag, false)
	setActive(slot0.timelimitTimeTxt, false)

	slot0.hideObjToggleTF = findTF(slot0.tr, "hideObjToggle")

	setActive(slot0.hideObjToggleTF, false)

	slot0.hideObjToggle = GetComponent(slot0.hideObjToggleTF, typeof(Toggle))

	setText(findTF(slot0.hideObjToggleTF, "Label"), i18n("paint_hide_other_obj_tip"))
end

function slot0.updateSkin(slot0, slot1, slot2)
	if slot0.skin ~= slot1 or slot0.own ~= slot2 then
		slot0.skin = slot1
		slot0.own = slot2

		setActive(slot0.nameBar, true)
		setActive(slot0.effectBar, false)
		setText(slot0.name, shortenString(HXSet.hxLan(slot1.name), 7))
		setActive(slot0.bgMark, not slot2)

		if not slot2 then
			setActive(slot0.picNotBuy, false)
			setActive(slot0.picActivity, false)
			setActive(slot0.picPropose, false)

			if slot1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then
				setActive(slot0.picPropose, true)
			elseif slot0.skin.shop_id > 0 then
				setActive(slot0.picNotBuy, true)
			elseif _.any(pg.activity_shop_template.all, function (slot0)
				return pg.activity_shop_template[slot0].commodity_type == DROP_TYPE_SKIN and slot1.commodity_id == slot0.skin.id
			end) or _.any(pg.activity_shop_extra.all, function (slot0)
				return pg.activity_shop_extra[slot0].commodity_type == DROP_TYPE_SKIN and slot1.commodity_id == slot0.skin.id
			end) then
				setActive(slot0.picActivity, true)
			else
				setActive(slot0.picActivity, true)
			end
		end

		setActive(slot0.tags, true)

		for slot7 = 0, slot0.tags.childCount - 1, 1 do
			setActive(slot0.tags:GetChild(slot7), false)
		end

		_.each(slot1.tag, function (slot0)
			setActive(slot0.tags:Find("tag" .. slot0), true)
		end)
		slot0:flushSkin()
	end
end

function slot0.updateData(slot0, slot1, slot2, slot3)
	if slot0.ship == slot1 and slot0.skin == slot2 and slot0.own ~= slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-39, warpins: 3 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 50-55, warpins: 3 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 115-124, warpins: 5 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 125-133, warpins: 0 ---
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 134-151, warpins: 1 ---
		if slot0.skin.id ~= slot0.ship:getConfig("skin_id") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 40-41, warpins: 1 ---
			slot4 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-42, warpins: 1 ---
			slot4 = true
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 43-44, warpins: 2 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #2 45-46, warpins: 1 ---
			slot5 = not slot3

			if not slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 47-48, warpins: 1 ---
				slot5 = false

				if false then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 49-49, warpins: 0 ---
					slot5 = true
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #2 ---



		end

		slot0.ship = slot1
		slot0.skin = slot2
		slot0.own = slot3

		setActive(slot0.nameBar, true)
		setActive(slot0.effectBar, false)
		setText(slot0.name, shortenString(HXSet.hxLan(slot2.name), 7))

		slot4 = slot0.skin.id == slot0.ship:getConfig("skin_id")

		setActive(slot0.bgMark, not (slot0.skin.id == slot0.ship.getConfig("skin_id")) and not slot3)

		if not (slot0.skin.id == slot0.ship.getConfig("skin_id")) and not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 56-72, warpins: 1 ---
			setActive(slot0.picNotBuy, false)
			setActive(slot0.picActivity, false)
			setActive(slot0.picPropose, false)

			if slot2.skin_type == ShipSkin.SKIN_TYPE_PROPOSE then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 73-77, warpins: 1 ---
				setActive(slot0.picPropose, true)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 78-82, warpins: 1 ---
				if slot0.skin.shop_id > 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 83-87, warpins: 1 ---
					setActive(slot0.picNotBuy, true)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 88-96, warpins: 1 ---
					if _.any(pg.activity_shop_template.all, function (slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-7, warpins: 1 ---
						if pg.activity_shop_template[slot0].commodity_type ~= DROP_TYPE_SKIN or slot1.commodity_id ~= slot0.skin.id then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 14-15, warpins: 2 ---
							slot2 = false
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 16-16, warpins: 1 ---
							slot2 = true
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 17-17, warpins: 2 ---
						return slot2
						--- END OF BLOCK #1 ---



					end) or _.any(pg.activity_shop_extra.all, function (slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-7, warpins: 1 ---
						if pg.activity_shop_extra[slot0].commodity_type ~= DROP_TYPE_SKIN or slot1.commodity_id ~= slot0.skin.id then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 14-15, warpins: 2 ---
							slot2 = false
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 16-16, warpins: 1 ---
							slot2 = true
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 17-17, warpins: 2 ---
						return slot2
						--- END OF BLOCK #1 ---



					end) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 106-110, warpins: 2 ---
						setActive(slot0.picActivity, true)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 111-114, warpins: 1 ---
						setActive(slot0.picActivity, true)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		setActive(slot0.tags, true)

		for slot9 = 0, slot0.tags.childCount - 1, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 125-133, warpins: 2 ---
			setActive(slot0.tags:GetChild(slot9), false)
			--- END OF BLOCK #0 ---



		end

		_.each(slot2.tag, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-12, warpins: 1 ---
			setActive(slot0.tags:Find("tag" .. slot0), true)

			return
			--- END OF BLOCK #0 ---



		end)
		slot0:flushSkin()
		setActive(slot0.timelimitTag, getProxy(ShipSkinProxy):getSkinById(slot0.skin.id) and slot6:isExpireType() and not slot6:isExpired())
		setActive(slot0.timelimitTimeTxt, getProxy(ShipSkinProxy).getSkinById(slot0.skin.id) and slot6.isExpireType() and not slot6.isExpired())

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #5 152-156, warpins: 1 ---
		if slot6.isExpireType() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 157-160, warpins: 1 ---
			slot7 = not slot6.isExpired()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 161-171, warpins: 3 ---
		if slot0.skinTimer then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 172-175, warpins: 1 ---
			slot0.skinTimer:Stop()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 176-177, warpins: 2 ---
		if slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 178-191, warpins: 1 ---
			slot0.skinTimer = Timer.New(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-16, warpins: 1 ---
				setText(slot1.timelimitTimeTxt:Find("Text"), skinTimeStamp(slot0:getRemainTime()))

				return
				--- END OF BLOCK #0 ---



			end, 1, -1)

			slot0.skinTimer:Start()
			slot0.skinTimer.func()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #7 ---

		FLOW; TARGET BLOCK #8



		-- Decompilation error in this vicinity:
		--- BLOCK #8 192-192, warpins: 2 ---
		--- END OF BLOCK #8 ---



	end
end

function slot0.updateSelected(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.selected ~= slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-10, warpins: 1 ---
		slot0.selected = slot1

		setActive(slot0.outline, tobool(slot0.selected))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-11, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.updateUsing(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.using ~= slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-8, warpins: 1 ---
		slot0.using = slot1

		setActive(slot0.bgUsing, slot0.using)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-9, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.flushSkin(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0:clearPainting()
	slot0:loadPainting()

	return
	--- END OF BLOCK #0 ---



end

function slot0.clearPainting(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.paintingName then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		retPaintingPrefab(slot0.painting, slot0.paintingName)

		slot0.paintingName = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-10, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.loadPainting(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.skin or not slot0.skin.painting then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 2 ---
		slot1 = "unknown"
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-33, warpins: 2 ---
	slot0.paintingName = slot1

	setActive(slot0.hideObjToggle, slot1)

	slot2 = slot0.hideObjToggle

	if PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot0.paintingName, 0) == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-35, warpins: 1 ---
		slot3 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-36, warpins: 1 ---
		slot3 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 37-43, warpins: 2 ---
	slot2.isOn = slot3

	setPaintingPrefabAsync(slot0.painting, slot0.paintingName, "pifu")

	return
	--- END OF BLOCK #2 ---



end

function slot0.clear(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot0:clearPainting()

	slot0.skin = nil
	slot0.selected = nil
	slot0.using = nil

	if slot0.skinTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-18, warpins: 1 ---
		slot0.skinTimer:Stop()

		slot0.skinTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

return slot0
