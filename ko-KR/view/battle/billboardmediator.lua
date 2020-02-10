slot0 = class("BillboardMediator", import("..base.ContextMediator"))
slot0.FETCH_RANKS = "BillboardMediator:FETCH_RANKS"
slot0.OPEN_RIVAL_INFO = "BillboardMediator:OPEN_RIVAL_INFO"

function slot0.register(slot0)
	slot1 = getProxy(BillboardProxy)

	if not slot0.contextData.act_id then
		slot3 = checkExist(PowerRank:getActivityByRankType(slot0.contextData.page or PowerRank.TYPE_POWER), {
			"id"
		})
	end

	slot0.viewComponent:updateRankList(slot2, slot1:getRankList(slot2, slot3), slot1:getPlayerRankData(slot2, slot3), slot3)
	slot0:bind(uv0.FETCH_RANKS, function (slot0, slot1, slot2)
		if uv0:canFetch(slot1, slot2) then
			slot6.type = slot1
			slot6.activityId = slot2

			uv1:sendNotification(GAME.GET_POWERRANK, {})
		else
			uv1.viewComponent:updateRankList(slot1, uv0:getRankList(slot1, slot2), uv0:getPlayerRankData(slot1, slot2), slot2)
			uv1.viewComponent:filter(slot1, slot2)
		end
	end)
	slot0:bind(uv0.OPEN_RIVAL_INFO, function (slot0, slot1)
		uv0:sendNotification(GAME.GET_RIVAL_INFO, slot1)
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.GET_POWERRANK_DONE
	slot1[2] = GAME.GET_RIVAL_INFO_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.GET_POWERRANK_DONE then
		slot0.viewComponent:updateRankList(slot3.type, slot3.list, slot3.playerRankinfo, slot3.activityId)
		slot0.viewComponent:filter(slot3.type, slot3.activityId)
	elseif slot2 == GAME.GET_RIVAL_INFO_DONE then
		slot7.viewComponent = RivalInfoLayer
		slot7.mediator = RivalInfoMediator
		slot8.rival = slot3.rival
		slot8.type = RivalInfoLayer.TYPE_DISPLAY
		slot7.data = {}

		slot0:addSubLayers(Context.New({}))
	end
end

return slot0
