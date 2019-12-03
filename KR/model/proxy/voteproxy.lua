slot0 = class("VoteProxy", import(".NetProxy"))
slot0.VOTEGROUP_UPDATE = "VoteProxy:VOTEGROUP_UPDATE"
slot0.VOTE_ORDER_BOOK_UPDATE = "VoteProxy:VOTE_ORDER_BOOK_UPDATE"
slot0.VOTE_ORDER_BOOK_DELETE = "VoteProxy:VOTE_ORDER_BOOK_DELETE"
slot0.VOTES_COUNT_UPDATE = "VoteProxy:VOTES_COUNT_UPDATE"

slot0.register = function (slot0)
	slot0.orderBook = nil
	slot0.voteGroup = nil
	slot0.webVoteGroup = nil
	slot0.votes = 0
	slot0.lastRequestTime = 0
	slot0.lastWebRequestTime = 0
end

slot0.InitWebGroup = function (slot0, slot1, slot2)
	slot0.webVoteGroup = VoteGroup.New({
		onWeb = true,
		id = slot2,
		list = _.map(slot3, function (slot0)
			return VoteShip.New(slot0)
		end)
	})
end

slot0.GetWebGroup = function (slot0)
	return Clone(slot0.webVoteGroup)
end

slot0.initVoteGroup = function (slot0, slot1, slot2, slot3)
	slot0.votes = slot3
	slot0.voteGroup = VoteGroup.New({
		id = slot2,
		list = _.map(slot4, function (slot0)
			return VoteShip.New(slot0)
		end)
	})
end

slot0.UpdateVotes = function (slot0, slot1)
	slot0.votes = slot0.votes - slot1

	slot0:sendNotification(slot0.VOTES_COUNT_UPDATE, slot0.votes)
end

slot0.getVoteGroup = function (slot0)
	return Clone(slot0.voteGroup)
end

slot0.updateVoteGroup = function (slot0, slot1)
	slot0.voteGroup = slot1

	slot0:sendNotification(slot0.VOTEGROUP_UPDATE, slot0:getVoteGroup())
end

slot0.SetOrderBook = function (slot0, slot1)
	slot0.orderBook = slot1

	slot0:RemoveOrderBookTimer()

	if slot0.orderBook then
		slot0:AddOrderBookTimer(slot0.orderBook)
		slot0:sendNotification(slot0.VOTE_ORDER_BOOK_UPDATE, slot1)
	else
		slot0:sendNotification(slot0.VOTE_ORDER_BOOK_DELETE)
	end
end

slot0.GetOrderBook = function (slot0)
	return slot0.orderBook
end

slot0.IsNewOrderBook = function (slot0)
	slot1 = slot0.orderBook and slot0.orderBook.isNew

	if slot0.orderBook then
		slot0.orderBook:SetIsNew(false)
	end

	return slot1
end

slot0.AddOrderBookTimer = function (slot0, slot1)
	if slot1:GetEndTime() - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
		slot0.timer = Timer.New(function ()
			slot0:RemoveOrderBook()
		end, slot3, 1)

		slot0.timer:Start()
	end
end

slot0.RemoveOrderBookTimer = function (slot0)
	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end
end

slot0.RemoveOrderBook = function (slot0)
	slot0:RemoveOrderBookTimer()
	slot0:SetOrderBook(nil)
end

slot0.remove = function (slot0)
	slot0:RemoveOrderBookTimer()
end

return slot0
