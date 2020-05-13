slot0 = class("SubmitVoteBookCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.callback
	slot6 = getProxy(VoteProxy):GetOrderBook()

	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 3,
		arg3 = 0,
		arg2 = 0,
		activity_id = slot6.activityId,
		arg1 = slot6:GetIntByBit(slot2.result)
	}, 11203, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			for slot5, slot6 in ipairs(slot0.award_list) do
				slot7 = {
					type = slot6.type,
					id = slot6.id,
					count = slot6.number
				}

				uv0:sendNotification(GAME.ADD_ITEM, Item.New(slot7))
				table.insert(slot1, slot7)
			end

			uv0:sendNotification(GAME.SUBMIT_VOTE_BOOK_DONE, {
				awards = slot1,
				callback = function ()
					uv0:RemoveOrderBook()
					uv1()
				end
			})
		elseif uv2 then
			uv2()
		end
	end)
end

return slot0
