slot0 = class("BackYardMediator", import("..base.ContextMediator"))
slot0.GO_SHOP = "BackYardMediator:GO_SHOP"
slot0.GO_GRANARY = "BackYardMediator:GO_GRANARY"
slot0.GO_SHIPINFO = "BackYardMediator:GO_SHIPINFO"
slot0.OPEN_ADD_EXP = "BackYardMediator:OPEN_ADD_EXP"
slot0.RENAME = "BackYardMediator:RENAME"
slot0.OPEN_NOFOOD = "BackYardMediator:OPEN_NOFOOD"
slot0.ON_SWITCH_FLOOR = "BackYardMediator:ON_SWITCH_FLOOR"
slot0.ON_SHOPPING = "BackYardMediator:ON_SHOPPING"
slot0.ITEM_UPDATED = "BackYardMediator:ITEM_UPDATED"

function slot0.register(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot0.backyardPoolMgr = BackyardPoolMgr.New()
	slot2 = slot0
	slot1 = slot0.startUpBackyard
	slot3 = slot0.contextData.floor or 1
	slot5, slot5 = slot1(slot2, slot3)

	slot0:bind(slot0.GO_GRANARY, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		BackYardMediator.isInitAddExpPanel = true

		slot0:addSubLayers(Context.New({
			mediator = BackyardGranaryMediator,
			viewComponent = BackyardGranaryLayer
		}))

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:bind(slot0.ON_SHOPPING, function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		slot0:sendNotification(GAME.SHOPPING, {
			id = slot1,
			count = slot2
		})

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:bind(slot0.OPEN_ADD_EXP, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		if mode == BackYardConst.MODE_VISIT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-6, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-14, warpins: 2 ---
		slot0:sendNotification(GAME.OPEN_ADD_EXP, slot1)

		return
		--- END OF BLOCK #1 ---



	end)
	slot0:bind(slot0.GO_SHOP, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		BackYardMediator.isInitAddExpPanel = true

		slot0:addSubLayers(Context.New({
			mediator = BackYardShopMediator,
			viewComponent = BackYardShopLayer
		}))

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:bind(slot0.GO_SHIPINFO, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-25, warpins: 1 ---
		BackYardMediator.isInitAddExpPanel = true

		slot0.viewComponent:closeNofoodBox(true)
		slot0:addSubLayers(Context.New({
			mediator = BackYardShipInfoMediator,
			viewComponent = BackYardShipInfoLayer,
			data = {
				type = slot1
			}
		}))

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:bind(slot0.RENAME, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0:sendNotification(GAME.BACKYARD_RENAME, slot1)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:bind(slot0.ON_SWITCH_FLOOR, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		slot0:quitBackYard()
		slot0:startUpBackyard(slot1)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.viewComponent:setPlayerVO(slot1)
	slot0.viewComponent:setDormVO(slot2)

	return

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-11, warpins: 1 ---
	slot3 = 1
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-66, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot0.startUpBackyard(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if not getProxy(DormProxy) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-9, warpins: 1 ---
	if not slot0.backyardPoolMgr then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-20, warpins: 1 ---
	playBGM(slot0.viewComponent:getBGM())

	if not slot0.contextData.mode then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-22, warpins: 1 ---
		slot2 = BackYardConst.MODE_DEFAULT
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 23-74, warpins: 2 ---
	slot0.contextData.floor = slot1

	slot0.viewComponent:updateFloor()

	pg.backyard = pm.Facade.getInstance("m02.backyard")

	pg.backyard:registerCommand(BACKYARD.START_UP, StartUpBackYardCommand)
	pg.backyard:registerCommand(BACKYARD.COMMAND_BACKYARD_BOAT, BYBoatCommand)
	pg.backyard:registerCommand(BACKYARD.COMMAND_BACKYARD_FURNITURE, BYFurnitureCommand)
	pg.backyard:registerCommand(BACKYARD.COMMAND_BACKYARD_HOUSE, BYHouseCommand)

	slot3 = {}
	slot4 = {}
	slot5 = nil

	if slot2 == BackYardConst.MODE_VISIT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 75-76, warpins: 1 ---
		if slot1 ~= 1 or not Ship.STATE_TRAIN then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 81-82, warpins: 2 ---
			slot6 = Ship.STATE_REST
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 83-87, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 88-94, warpins: 0 ---
		for slot10, slot11 in pairs(slot0.contextData.ships) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 88-90, warpins: 1 ---
			if slot11.state == slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 91-92, warpins: 1 ---
				slot3[slot11.id] = slot11
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 93-94, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 95-100, warpins: 1 ---
		slot5 = slot0.contextData.dorm
		player = slot0.contextData.player
		--- END OF BLOCK #3 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 101-104, warpins: 1 ---
		if slot2 == BackYardConst.MODE_DEFAULT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 105-127, warpins: 1 ---
			slot0.dormProxy = getProxy(DormProxy)
			slot5 = slot0.dormProxy:getData()
			slot6 = slot0.dormProxy:getShipsByState(Ship.STATE_TRAIN)
			slot7 = slot0.dormProxy:getShipsByState(Ship.STATE_REST)

			if slot1 ~= 1 or not slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 130-130, warpins: 2 ---
				slot3 = slot7
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 131-143, warpins: 2 ---
			player = getProxy(PlayerProxy).getData(slot8)

			slot0.viewComponent:setShipIds(slot6, slot7)
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 144-184, warpins: 3 ---
	slot6 = pg.backyard.sendNotification

	function pg.backyard.sendNotification(slot0, slot1, slot2, slot3)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		if BackYardConst.MODE_VISIT == slot0 and (BACKYARD.BOAT_ADDITION_DONE == slot1 or slot1 == BACKYARD.BOAT_ADDITION_DONE) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-14, warpins: 2 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-21, warpins: 3 ---
		slot1(slot0, slot1, slot2, slot3)

		return
		--- END OF BLOCK #1 ---



	end

	pg.backyard:sendNotification(BACKYARD.START_UP, {
		ships = slot3,
		furnitures = slot5:getFurnitrues(slot1),
		level = slot5.level
	})

	slot0.viewComponent.isLoadedMainUI = false
	slot7 = nil

	function slot8(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if pg.backyard and not IsNil(slot0.viewComponent._tf) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-69, warpins: 1 ---
			slot0.viewComponent.isLoadedMainUI = true
			slot0.name = BackYardConst.MAIN_UI_NAME

			slot0.viewComponent:setBlackyardView(slot1)
			setActive(slot0, true)
			setParent(slot0, slot0.viewComponent._tf)
			tf(slot0):SetSiblingIndex(1)
			pg.backyard:registerMediator(BackyardMainMediator.New(slot1))
			slot1:init()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 70-70, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end

	if not IsNil(slot0.viewComponent._tf:Find(BackYardConst.MAIN_UI_NAME)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 185-188, warpins: 1 ---
		slot8(slot9)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 189-198, warpins: 1 ---
		PoolMgr.GetInstance():GetUI(BackYardConst.MAIN_UI_NAME, true, slot8)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 199-208, warpins: 2 ---
	getProxy(DormProxy).floor = slot0.contextData.floor

	return player, slot5
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 209-209, warpins: 2 ---
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 210-210, warpins: 2 ---
	--- END OF BLOCK #7 ---



end

function slot0.quitBackYard(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-51, warpins: 1 ---
	pg.backyard:removeMediator(BackyardMainMediator.__cname)
	pg.backyard:removeProxy(BackYardHouseProxy.__cname)
	pg.backyard:removeCommand(StartUpBackYardCommand.__cname)
	pg.backyard:removeCommand(BYBoatCommand.__cname)
	pg.backyard:removeCommand(BYFurnitureCommand.__cname)
	pg.backyard:removeCommand(BYHouseCommand.__cname)
	pm.Facade.removeCore("m02.backyard")

	pg.backyard = nil

	return
	--- END OF BLOCK #0 ---



end

function slot0.remove(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	if not IsNil(slot0.viewComponent._tf:Find(BackYardConst.MAIN_UI_NAME)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-21, warpins: 1 ---
		PoolMgr.GetInstance():ReturnUI(BackYardConst.MAIN_UI_NAME, slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-38, warpins: 2 ---
	slot0.viewComponent:emit(BackYardMediator.OPEN_ADD_EXP, 0)
	slot0:quitBackYard()
	slot0.backyardPoolMgr:clear()

	slot0.backyardPoolMgr = nil

	return
	--- END OF BLOCK #1 ---



end

function slot0.listNotificationInterests(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-38, warpins: 1 ---
	return {
		DormProxy.DORM_UPDATEED,
		DormProxy.SHIPS_EXP_ADDED,
		PlayerProxy.UPDATED,
		GAME.PUT_FURNITURE_DONE,
		GAME.OPEN_BACKYARD_GARNARY,
		GAME.BACKYARD_RENAME_DONE,
		BackYardMediator.OPEN_NOFOOD,
		GAME.OPEN_BACKYARD_SHOP,
		BagProxy.ITEM_UPDATED,
		BagProxy.ITEM_ADDED,
		GAME.ADD_SHIP_DONE,
		GAME.EXIT_SHIP_DONE
	}
	--- END OF BLOCK #0 ---



end

function slot0.handleNotification(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot2 = slot1:getName()
	slot3 = slot1:getBody()

	if slot0.contextData.mode == BackYardConst.MODE_VISIT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-13, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-17, warpins: 1 ---
	if slot2 == DormProxy.DORM_UPDATEED then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-44, warpins: 1 ---
		slot0.viewComponent:setShipIds(slot4, slot5)
		slot0.viewComponent:setDormVO(slot0.dormProxy:getData())
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-48, warpins: 1 ---
		if slot2 == GAME.PUT_FURNITURE_DONE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 49-57, warpins: 1 ---
			slot0.viewComponent:setDormVO(slot0.dormProxy:getData())
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 58-61, warpins: 1 ---
			if slot2 == BagProxy.ITEM_UPDATED or slot2 == BagProxy.ITEM_ADDED then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 66-69, warpins: 2 ---
				if pg.backyard then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 70-77, warpins: 1 ---
					pg.backyard:sendNotification(slot0.ITEM_UPDATED)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 78-81, warpins: 1 ---
				if slot2 == PlayerProxy.UPDATED then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 82-86, warpins: 1 ---
					if getProxy(PlayerProxy) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 87-94, warpins: 1 ---
						slot0.viewComponent:setPlayerVO(slot4:getData())
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 95-98, warpins: 1 ---
					if slot2 == BackYardMediator.OPEN_NOFOOD then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 99-103, warpins: 1 ---
						slot0.viewComponent:openNofoodBox()
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 104-107, warpins: 1 ---
						if slot2 == DormProxy.SHIPS_EXP_ADDED then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 108-111, warpins: 1 ---
							if not BackYardMediator.isInitAddExpPanel then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 112-132, warpins: 1 ---
								BackYardMediator.isInitAddExpPanel = true
								slot7 = slot0.dormProxy:getData().load_exp * table.getCount(slot4)

								if table.getCount(slot4) ~= 0 and (slot7 ~= 0 or slot6.food ~= 0) then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 138-160, warpins: 2 ---
									slot0.viewComponent:closeNofoodBox(true)
									slot0:addSubLayers(Context.New({
										mediator = BackYardSettlementMediator,
										viewComponent = BackYardSettlementLayer,
										data = {
											oldShips = slot3.oldShips,
											newShips = slot3.newShips
										}
									}))
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 161-163, warpins: 2 ---
									if slot6.food == 0 and slot5 > 0 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 167-171, warpins: 1 ---
										slot0.viewComponent:openNofoodBox()
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 172-175, warpins: 1 ---
							if slot2 == GAME.BACKYARD_RENAME_DONE then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 176-180, warpins: 1 ---
								slot0.viewComponent:closeRenameBox()
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 181-184, warpins: 1 ---
								if slot2 == GAME.OPEN_BACKYARD_GARNARY then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 185-198, warpins: 1 ---
									slot0:addSubLayers(Context.New({
										mediator = BackYardGarnitureMediator,
										viewComponent = BackYardGarnitureLayer
									}), nil, function ()

										-- Decompilation error in this vicinity:
										--- BLOCK #0 1-3, warpins: 1 ---
										if slot0 and slot0.callback then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 8-10, warpins: 1 ---
											slot0.callback()
											--- END OF BLOCK #0 ---



										end

										--- END OF BLOCK #0 ---

										FLOW; TARGET BLOCK #1



										-- Decompilation error in this vicinity:
										--- BLOCK #1 11-11, warpins: 3 ---
										return
										--- END OF BLOCK #1 ---



									end)
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 199-202, warpins: 1 ---
									if slot2 == GAME.OPEN_BACKYARD_SHOP then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 203-214, warpins: 1 ---
										slot0:addSubLayers(Context.New({
											mediator = BackYardShopMediator,
											viewComponent = BackYardShopLayer
										}))
										--- END OF BLOCK #0 ---



									else

										-- Decompilation error in this vicinity:
										--- BLOCK #0 215-218, warpins: 1 ---
										if slot2 == GAME.ADD_SHIP_DONE then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 219-222, warpins: 1 ---
											if not pg.backyard then

												-- Decompilation error in this vicinity:
												--- BLOCK #0 223-224, warpins: 1 ---
												return
												--- END OF BLOCK #0 ---



											end

											--- END OF BLOCK #0 ---

											FLOW; TARGET BLOCK #1



											-- Decompilation error in this vicinity:
											--- BLOCK #1 225-229, warpins: 2 ---
											if slot0.contextData.floor ~= slot3.type then

												-- Decompilation error in this vicinity:
												--- BLOCK #0 230-231, warpins: 1 ---
												return
												--- END OF BLOCK #0 ---



											end

											--- END OF BLOCK #1 ---

											FLOW; TARGET BLOCK #2



											-- Decompilation error in this vicinity:
											--- BLOCK #2 232-245, warpins: 2 ---
											pg.backyard:sendNotification(BACKYARD.COMMAND_BACKYARD_BOAT, {
												name = BACKYARD.SHIP_ADDED,
												id = slot3.id
											})
											--- END OF BLOCK #2 ---



										else

											-- Decompilation error in this vicinity:
											--- BLOCK #0 246-249, warpins: 1 ---
											if slot2 == GAME.EXIT_SHIP_DONE then

												-- Decompilation error in this vicinity:
												--- BLOCK #0 250-253, warpins: 1 ---
												if not pg.backyard then

													-- Decompilation error in this vicinity:
													--- BLOCK #0 254-255, warpins: 1 ---
													return
													--- END OF BLOCK #0 ---



												end

												--- END OF BLOCK #0 ---

												FLOW; TARGET BLOCK #1



												-- Decompilation error in this vicinity:
												--- BLOCK #1 256-264, warpins: 2 ---
												if not getBackYardProxy(BackYardHouseProxy):existShip(slot3.id) then

													-- Decompilation error in this vicinity:
													--- BLOCK #0 265-266, warpins: 1 ---
													return
													--- END OF BLOCK #0 ---



												end

												--- END OF BLOCK #1 ---

												FLOW; TARGET BLOCK #2



												-- Decompilation error in this vicinity:
												--- BLOCK #2 267-279, warpins: 2 ---
												pg.backyard:sendNotification(BACKYARD.COMMAND_BACKYARD_BOAT, {
													name = BACKYARD.SHIP_EXITED,
													id = slot3.id
												})
												--- END OF BLOCK #2 ---



											end
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

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 280-281, warpins: 18 ---
	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 282-282, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

return slot0
