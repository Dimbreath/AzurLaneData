slot0 = class("AttireProxy", import(".NetProxy"))
slot0.ATTIREFRAME_UPDATED = "AttireProxy:ATTIREFRAME_UPDATED"
slot0.ATTIREFRAME_ADDED = "AttireProxy:ATTIREFRAME_ADDED"
slot0.ATTIREFRAME_EXPIRED = "AttireProxy:ATTIREFRAME_EXPIRED"
slot1 = pg.item_data_frame
slot2 = pg.item_data_chat
slot3 = false

function slot0.register(slot0)
	slot0.data = {}
	slot0.timers = {}
	slot0.expiredChaces = {}
	slot0.data.iconFrames = {}
	slot0.data.chatFrames = {}

	for slot4, slot5 in ipairs(slot0.all) do
		if slot5 == 0 then
			slot0.data.iconFrames[slot5] = IconFrame.New({
				end_time = 0,
				id = slot5
			})
		else
			slot0.data.iconFrames[slot5] = IconFrame.New({
				id = slot5
			})
		end
	end

	for slot4, slot5 in ipairs(slot1.all) do
		if slot5 == 0 then
			slot0.data.chatFrames[slot5] = ChatFrame.New({
				end_time = 0,
				id = slot5
			})
		else
			slot0.data.chatFrames[slot5] = ChatFrame.New({
				id = slot5
			})
		end
	end

	slot0:on(11003, function (slot0)
		for slot4, slot5 in ipairs(slot0.icon_frame_list) do
			slot0.data.iconFrames[slot5.id].updateData(slot6, slot5)
			slot0:updateAttireFrame(slot6)
			slot0:addExpiredTimer(slot0.data.iconFrames[slot5.id])
		end

		slot1 = ipairs
		slot2 = slot0.chat_frame_list or {}

		for slot4, slot5 in slot1(slot2) do
			slot0.data.chatFrames[slot5.id].updateData(slot6, slot5)
			slot0:updateAttireFrame(slot6)
			slot0:addExpiredTimer(slot0.data.chatFrames[slot5.id])
		end
	end)

	if slot0 then
		slot0.timer = Timer.New(function ()
			slot0 = {}
			slot1 = {
				101,
				102,
				201,
				301
			}

			for slot5 = 1, 5, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-17, warpins: 2 ---
				slot6 = math.random(1, 4)
				slot7 = Item.New
				slot8 = {
					count = 1
				}
				slot9 = (slot5 % 2 == 0 and DROP_TYPE_ICON_FRAME) or DROP_TYPE_CHAT_FRAME
				slot8.type = slot9
				slot8.id = slot1[math.random(1, 4)]

				slot0:sendNotification(GAME.ADD_ITEM, Item.New(slot8))
				table.insert(slot0, Item.New(slot8))

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #1 18-20, warpins: 1 ---
				if not DROP_TYPE_ICON_FRAME then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 21-21, warpins: 2 ---
					slot9 = DROP_TYPE_CHAT_FRAME
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 22-38, warpins: 2 ---
				--- END OF BLOCK #2 ---



			end

			table.insert(slot0, slot2)
			slot0:sendNotification(GAME.ACT_NEW_PT_DONE, {
				awards = slot0
			})
		end, 10, 1)

		slot0.timer:Start()
	end
end

function slot0.getDataAndTrophys(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = slot0:getData()

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-8, warpins: 1 ---
		slot0:clearNew()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-16, warpins: 2 ---
	slot2.trophys = getProxy(CollectionProxy):getTrophys()

	return slot2
	--- END OF BLOCK #1 ---



end

function slot0.clearNew(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-10, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.data.iconFrames) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-8, warpins: 1 ---
		slot5:clearNew()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-10, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-15, warpins: 1 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 16-20, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.data.chatFrames) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-18, warpins: 1 ---
		slot5:clearNew()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-20, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 21-21, warpins: 1 ---
	return
	--- END OF BLOCK #4 ---



end

function slot0.getExpiredChaces(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-12, warpins: 0 ---
	for slot5, slot6 in ipairs(slot0.expiredChaces) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-10, warpins: 1 ---
		table.insert(slot1, slot6)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-12, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 13-15, warpins: 1 ---
	slot0.expiredChaces = {}

	return slot1
	--- END OF BLOCK #2 ---



end

function slot0.getAttireFrame(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = nil

	if slot1 == AttireConst.TYPE_ICON_FRAME then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-9, warpins: 1 ---
		slot3 = slot0.data.iconFrames[slot2]
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-13, warpins: 1 ---
		if slot1 == AttireConst.TYPE_CHAT_FRAME then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-16, warpins: 1 ---
			slot3 = slot0.data.chatFrames[slot2]
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-17, warpins: 3 ---
	return slot3
	--- END OF BLOCK #1 ---



end

function slot0.addAttireFrame(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot3 = slot0:getAttireFrame(slot2, slot1.id)

	if slot1:expiredType() and slot3 and not slot3:isExpired() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-32, warpins: 1 ---
		slot1:updateEndTime(slot3:getExpiredTime() + slot1:getConfig("time_second"))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-36, warpins: 4 ---
	if slot2 == AttireConst.TYPE_ICON_FRAME then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-41, warpins: 1 ---
		slot0.data.iconFrames[slot1.id] = slot1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 42-45, warpins: 1 ---
		if slot2 == AttireConst.TYPE_CHAT_FRAME then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-49, warpins: 1 ---
			slot0.data.chatFrames[slot1.id] = slot1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 50-62, warpins: 3 ---
	slot0:addExpiredTimer(slot1)
	slot0:sendNotification(slot0.ATTIREFRAME_ADDED, slot1:clone())

	return
	--- END OF BLOCK #2 ---



end

function slot0.updateAttireFrame(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if slot1:getType() == AttireConst.TYPE_ICON_FRAME then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-12, warpins: 1 ---
		slot0.data.iconFrames[slot1.id] = slot1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-16, warpins: 1 ---
		if slot2 == AttireConst.TYPE_CHAT_FRAME then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-20, warpins: 1 ---
			slot0.data.chatFrames[slot1.id] = slot1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-29, warpins: 3 ---
	slot0:sendNotification(slot0.ATTIREFRAME_UPDATED, slot1:clone())

	return
	--- END OF BLOCK #1 ---



end

function slot0.addExpiredTimer(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if not slot1:expiredType() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-21, warpins: 1 ---
	function slot2()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-18, warpins: 1 ---
		slot0 = getProxy(PlayerProxy)

		if slot0:getData().getAttireByType(slot1, slot0:getType()) == slot0.id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-27, warpins: 1 ---
			slot1:updateAttireFrame(slot2, 0)
			slot0:updatePlayer(slot1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 28-44, warpins: 2 ---
		table.insert(slot1.expiredChaces, slot0)
		slot1:sendNotification(slot2.ATTIREFRAME_EXPIRED, slot0:clone())

		return
		--- END OF BLOCK #1 ---



	end

	if slot1:getExpiredTime() - pg.TimeMgr.GetInstance():GetServerTime() > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-38, warpins: 1 ---
		slot0.timers[slot1:getTimerKey()] = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			slot0()
			slot1:removeExpiredTimer(slot2)

			return
			--- END OF BLOCK #0 ---



		end, slot4, 1)

		slot0.timers[slot1.getTimerKey()]:Start()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-40, warpins: 1 ---
		slot2()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 41-42, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 43-43, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

function slot0.removeExpiredTimer(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if slot0.timers[slot1:getTimerKey()] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-15, warpins: 1 ---
		slot0.timers[slot2]:Stop()

		slot0.timers[slot2] = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.remove(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.timers) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot5:Stop()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-12, warpins: 1 ---
	slot0.timers = nil

	return
	--- END OF BLOCK #2 ---



end

function slot0.needTip(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot1 = {}
	slot2 = slot0:getDataAndTrophys()

	function slot4(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot1 = false

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-14, warpins: 0 ---
		for slot5, slot6 in pairs(slot0) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-10, warpins: 1 ---
			if slot6:isNew() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-12, warpins: 1 ---
				slot1 = true

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 13-13, warpins: 1 ---
				break
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 13-14, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 15-15, warpins: 2 ---
		return slot1
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-35, warpins: 0 ---
	for slot8, slot9 in ipairs(slot3) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-18, warpins: 1 ---
		if slot8 == 1 or slot8 == 2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-28, warpins: 2 ---
			table.insert(slot1, slot4(slot9))
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-33, warpins: 1 ---
			table.insert(slot1, false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 34-35, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 36-37, warpins: 1 ---
	return slot1
	--- END OF BLOCK #2 ---



end

return slot0
