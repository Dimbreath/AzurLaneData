slot0 = class("SummerFeastMediator", import("view.base.ContextMediator"))
slot0.MINI_GAME_OPERATOR = "SummerFeastMediator:MINI_GAME_OPERATOR"

slot0.register = function (slot0)
	slot0:bind(slot0.MINI_GAME_OPERATOR, function (slot0, ...)
		slot0:sendNotification(GAME.SEND_MINI_GAME_OP, ...)
	end)
end

slot0.listNotificationInterests = function (slot0)
	return {
		GAME.SEND_MINI_GAME_OP_DONE
	}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.SEND_MINI_GAME_OP_DONE then
		seriesAsync({
			function (slot0)
				if #slot0.awards > 0 then
					slot1.viewComponent:emit(BaseUI.ON_ACHIEVE, slot1, slot0)
				else
					slot0()
				end
			end,
			function (slot0)
				slot0.viewComponent:UpdateView()
			end
		})
	end
end

return slot0
