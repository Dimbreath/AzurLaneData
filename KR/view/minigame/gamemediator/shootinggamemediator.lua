class("ShootingGameMediator", import(".MiniHubMediator")).handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.SEND_MINI_GAME_OP_DONE and slot3.cmd == MiniGameOPCommand.CMD_COMPLETE then
		slot4 = {
			function (slot0)
				if #slot0.awards > 0 then
					slot1.viewComponent:emit(BaseUI.ON_ACHIEVE, slot1, slot0)
				else
					slot0()
				end
			end
		}

		slot0.viewComponent:updateAfterFinish()
		slot0.viewComponent:showResultPanel(slot3.awards, function ()
			seriesAsync(seriesAsync)
			slot1.viewComponent:OnSendMiniGameOPDone(slot2.argList)
		end)

		return
	end

	slot0.super.handleNotification(slot0, slot1)
end

return class("ShootingGameMediator", import(".MiniHubMediator"))
