slot0 = class("BillboardMediator", import("..base.ContextMediator"))
slot0.FETCH_RANKS = "BillboardMediator:FETCH_RANKS"
slot0.OPEN_RIVAL_INFO = "BillboardMediator:OPEN_RIVAL_INFO"

function slot0.register(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = getProxy(BillboardProxy)
	slot2 = slot0.contextData.page or PowerRank.TYPE_POWER

	slot0.viewComponent:updateRankList(slot0.contextData.page or PowerRank.TYPE_POWER, slot4, getProxy(BillboardProxy):getPlayerRankData(slot0.contextData.page or PowerRank.TYPE_POWER, slot0.contextData.act_id or checkExist(PowerRank:getActivityByRankType(slot0.contextData.page or PowerRank.TYPE_POWER), {
		"id"
	})), slot0.contextData.act_id or checkExist(PowerRank.getActivityByRankType(slot0.contextData.page or PowerRank.TYPE_POWER), ))
	slot0:bind(slot0.FETCH_RANKS, function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		if slot0:canFetch(slot1, slot2) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-18, warpins: 1 ---
			slot1:sendNotification(GAME.GET_POWERRANK, {
				type = slot1,
				activityId = slot2
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-46, warpins: 1 ---
			slot1.viewComponent:updateRankList(slot1, slot3, slot0:getPlayerRankData(slot1, slot2), slot2)
			slot1.viewComponent:filter(slot1, slot2)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 47-47, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)
	slot0:bind(slot0.OPEN_RIVAL_INFO, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0:sendNotification(GAME.GET_RIVAL_INFO, slot1)

		return
		--- END OF BLOCK #0 ---



	end)

	return

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-9, warpins: 1 ---
	slot2 = PowerRank.TYPE_POWER
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-13, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 14-21, warpins: 1 ---
	slot3 = checkExist(PowerRank.getActivityByRankType(slot0.contextData.page or PowerRank.TYPE_POWER), )
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 22-53, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

function slot0.listNotificationInterests(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	return {
		GAME.GET_POWERRANK_DONE,
		GAME.GET_RIVAL_INFO_DONE
	}
	--- END OF BLOCK #0 ---



end

function slot0.handleNotification(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.GET_POWERRANK_DONE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-25, warpins: 1 ---
		slot0.viewComponent:updateRankList(slot3.type, slot3.list, slot3.playerRankinfo, slot3.activityId)
		slot0.viewComponent:filter(slot3.type, slot3.activityId)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-29, warpins: 1 ---
		if slot2 == GAME.GET_RIVAL_INFO_DONE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-47, warpins: 1 ---
			slot0:addSubLayers(Context.New({
				viewComponent = RivalInfoLayer,
				mediator = RivalInfoMediator,
				data = {
					rival = slot3.rival,
					type = RivalInfoLayer.TYPE_DISPLAY
				}
			}))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 48-48, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

return slot0
