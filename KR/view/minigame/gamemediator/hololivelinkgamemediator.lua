class("HoloLiveLinkGameMediator", import(".MiniHubMediator")).handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.SEND_MINI_GAME_OP_DONE and slot3.cmd == MiniGameOPCommand.CMD_COMPLETE then
		seriesAsync({
			function (slot0)
				if #slot0.awards > 0 then
					slot1.viewComponent:emit(BaseUI.ON_ACHIEVE, slot1, slot0)
				else
					slot0()
				end
			end,
			function (slot0)
				slot0.viewComponent:playStory()
			end
		})
	else
		slot0.super.handleNotification(slot0, slot1)
	end
end

return class("HoloLiveLinkGameMediator", import(".MiniHubMediator"))
