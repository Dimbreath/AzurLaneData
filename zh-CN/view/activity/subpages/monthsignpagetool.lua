slot0 = class("MonthSignPageTool")

function slot0.Ctor(slot0, slot1)
	slot0._event = slot1
end

function slot0.onAcheve(slot0, slot1, slot2)
	slot3 = nil
	slot3 = coroutine.create(function ()
		if table.getCount(table.getCount) > 0 then
			slot0 = getProxy(ActivityProxy):getActivityById(ActivityConst.MONTH_SIGN_ACTIVITY_ID)
			slot1 = pg.activity_month_sign[slot0.data2].resign_count
			slot3 = pg.TimeMgr.GetInstance():STimeDescS(slot2, "*t")

			if slot0:getSpecialData("reMonthSignDay") ~= nil then
				slot1.reMonthSignItems = (slot1.reMonthSignItems and slot1.reMonthSignItems) or {}

				for slot7, slot8 in pairs(slot0) do
					table.insert(slot1.reMonthSignItems, slot8)
				end

				if slot3.day > #slot0.data1_list and slot0.data3 < slot1 then
					Timer.New(function ()
						slot0()
					end, 0.3, 1):Start()

					return
				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 86-99, warpins: 2 ---
					slot1._event:emit(MonthSignPage.SHOW_RE_MONTH_SIGN, slot1.reMonthSignItems, slot3)

					slot0 = slot1.reMonthSignItems
					--- END OF BLOCK #0 ---



				end
			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 100-114, warpins: 1 ---
				slot1.reMonthSignItems = nil

				slot1._event:emit(BaseUI.ON_AWARD, {
					items = slot0,
					onYes = slot3
				})
				--- END OF BLOCK #0 ---



			end

			coroutine.yield()

			slot4 = #_.filter(slot0, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				return slot0.type == DROP_TYPE_SHIP
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 8-8, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end) + #_.filter(slot0, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				return slot0.type == DROP_TYPE_NPC_SHIP
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 8-8, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end)
			slot7 = getProxy(BayProxy).getNewShip(slot6, true)

			_.each(_.filter(slot0, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				return slot0.type == DROP_TYPE_NPC_SHIP
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 8-8, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end), function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-10, warpins: 1 ---
				table.insert(slot0, slot1:getShipById(slot0.id))

				return
				--- END OF BLOCK #0 ---



			end)

			slot8 = (pg.gameset.award_ship_limit and pg.gameset.award_ship_limit.key_value) or 20

			if slot4 <= slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 157-166, warpins: 1 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 167-191, warpins: 0 ---
				for slot12 = math.max(1, #slot7 - slot4 + 1), #slot7, 1 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 167-191, warpins: 2 ---
					slot1._event:emit(ActivityMediator.OPEN_LAYER, Context.New({
						mediator = NewShipMediator,
						viewComponent = NewShipLayer,
						data = {
							ship = slot7[slot12]
						},
						onRemoved = slot3
					}))
					coroutine.yield()
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---



			end

			for slot12, slot13 in pairs(slot0) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 196-199, warpins: 1 ---
				if slot13.type == DROP_TYPE_SKIN then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 200-208, warpins: 1 ---
					if pg.ship_skin_template[slot13.id].skin_type == ShipSkin.SKIN_TYPE_REMAKE then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 209-209, warpins: 1 ---
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 210-218, warpins: 1 ---
						if not getProxy(ShipSkinProxy):hasOldNonLimitSkin(slot13.id) then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 219-239, warpins: 1 ---
							slot1._event:emit(ActivityMediator.OPEN_LAYER, Context.New({
								mediator = NewSkinMediator,
								viewComponent = NewSkinLayer,
								data = {
									skinId = slot13.id
								},
								onRemoved = slot3
							}))
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 240-242, warpins: 3 ---
					coroutine.yield()
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 243-244, warpins: 3 ---
				--- END OF BLOCK #1 ---



			end
		end

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 249-250, warpins: 1 ---
			slot2()
			--- END OF BLOCK #0 ---



		end
	end)


	-- Decompilation error in this vicinity:
	function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 and coroutine.status(coroutine.status) == "suspended" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-13, warpins: 1 ---
			slot0, slot1 = coroutine.resume(coroutine.resume)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-14, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end()
end

return slot0
