slot0 = class("VoteOrderBookMediator", import("..base.ContextMediator"))
slot0.ON_SUBMIT = "VoteOrderBookMediator:ON_SUBMIT"
slot0.SUCCESS_SOUND = "event:/ui/right"
slot0.FAILED_SOUND = "event:/ui/wrong"

function slot0.register(slot0)
	slot0:bind(slot0.ON_SUBMIT, function (slot0, slot1)
		slot4 = getProxy(VoteProxy).GetOrderBook(slot2).IsResult(slot3, slot1)

		seriesAsync({
			function (slot0)
				if slot0 then
					playSoundEffect(slot1.SUCCESS_SOUND)
				else
					playSoundEffect(slot1.FAILED_SOUND)
				end

				slot2:blockEvents()
				slot2.viewComponent:PlayAnim(slot0, slot0)
			end,
			function (slot0)
				slot0:unblockEvents()

				if slot0.unblockEvents then
					slot0:sendNotification(GAME.SUBMIT_VOTE_BOOK, {
						result = slot0,
						callback = slot0
					})
				else
					slot0()
				end
			end
		}, function ()
			slot0.viewComponent:emit(BaseUI.ON_CLOSE)
		end)
	end)
	slot0.viewComponent:setOrderBook(getProxy(VoteProxy).GetOrderBook(slot1))
end

function slot0.listNotificationInterests(slot0)
	return {
		VoteProxy.VOTE_ORDER_BOOK_DELETE,
		GAME.SUBMIT_VOTE_BOOK_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if VoteProxy.VOTE_ORDER_BOOK_DELETE == slot1:getName() then
		slot0.viewComponent:emit(BaseUI.ON_CLOSE)
	elseif slot2 == GAME.SUBMIT_VOTE_BOOK_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards, slot3.callback)
	end
end

return slot0
