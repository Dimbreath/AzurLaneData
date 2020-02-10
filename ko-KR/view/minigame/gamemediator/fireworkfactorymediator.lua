slot0 = class("FireworkFactoryMediator", import(".MiniHubMediator"))

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == MiniGameProxy.ON_HUB_DATA_UPDATE then
		slot0.viewComponent:SetMGHubData(slot1:getBody())
	elseif slot2 == GAME.SEND_MINI_GAME_OP_DONE then
		slot4 = slot3.argList

		if slot3.cmd == 1 then
			slot6[1] = function (slot0)
				slot6.id = MiniGameDataCreator.ShrineGameID
				slot7.count = (getProxy(MiniGameProxy):GetMiniGameData(MiniGameDataCreator.ShrineGameID):GetRuntimeData("count") or 0) + 1
				slot6.map = {}

				uv0:sendNotification(GAME.MODIFY_MINI_GAME_DATA, {})
				slot0()
			end

			slot6[2] = function (slot0)
				if #uv0.awards > 0 then
					uv1.viewComponent:emit(BaseUI.ON_ACHIEVE, slot1, slot0)
				else
					slot0()
				end
			end

			slot6[3] = function (slot0)
				uv0.viewComponent:AfterResult()
			end

			seriesAsync({})
		end

		slot0.viewComponent:OnSendMiniGameOPDone(slot3)
	elseif slot2 == GAME.MODIFY_MINI_GAME_DATA_DONE then
		slot0.viewComponent:OnModifyMiniGameDataDone(slot3)
	end
end

return slot0
