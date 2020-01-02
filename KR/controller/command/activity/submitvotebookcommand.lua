class("SubmitVoteBookCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().callback
	slot6 = getProxy(VoteProxy).GetOrderBook(slot5)

	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 3,
		arg3 = 0,
		arg2 = 0,
		activity_id = slot6.activityId,
		arg1 = slot6:GetIntByBit(slot3)
	}, 11203, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			for slot5, slot6 in ipairs(slot0.award_list) do
				slot0:sendNotification(GAME.ADD_ITEM, Item.New({
					type = slot6.type,
					id = slot6.id,
					count = slot6.number
				}))
				table.insert(slot1, )
			end

			slot0:sendNotification(GAME.SUBMIT_VOTE_BOOK_DONE, {
				awards = slot1,
				callback = function ()
					slot0:RemoveOrderBook()
					slot0()
				end
			})
		elseif slot2 then
			slot2()
		end
	end)
end

return class("SubmitVoteBookCommand", pm.SimpleCommand)
