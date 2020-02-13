slot0 = class("NewYearFestivalMediator", import("view.base.ContextMediator"))
slot0.MINI_GAME_OPERATOR = "MINI_GAME_OPERATOR"
slot0.GO_SCENE = "GO_SCENE"
slot0.GO_SUBLAYER = "GO_SUBLAYER"
slot0.MINIGAME_OPERATION = "MINIGAME_OPERATION"
slot0.ON_OPEN_PILE_SIGNED = "ON_OPEN_PILE_SIGNED"

function slot0.register(slot0)
	slot0:BindEvent()
end

function slot0.BindEvent(slot0)
	slot0:bind(slot0.ON_OPEN_PILE_SIGNED, function ()
		slot0:addSubLayers(Context.New({
			viewComponent = PileGameSignedLayer,
			mediator = PileGameSignedMediator
		}))
	end)
	slot0:bind(slot0.MINI_GAME_OPERATOR, function (slot0, ...)
		slot0:sendNotification(GAME.SEND_MINI_GAME_OP, ...)
	end)
	slot0:bind(slot0.GO_SCENE, function (slot0, slot1, ...)
		slot0:sendNotification(GAME.GO_SCENE, slot1, ...)
	end)
	slot0:bind(slot0.GO_SUBLAYER, function (slot0, slot1, slot2)
		slot0:addSubLayers(slot1, nil, slot2)
	end)
	slot0:bind(slot0.MINIGAME_OPERATION, function (slot0, slot1, slot2, slot3)
		slot0:sendNotification(GAME.SEND_MINI_GAME_OP, {
			hubid = slot1,
			cmd = slot2,
			args1 = slot3
		})
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.SEND_MINI_GAME_OP_DONE,
		ActivityProxy.ACTIVITY_UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.SEND_MINI_GAME_OP_DONE then
		seriesAsync(slot4)
		slot0:OnSendMiniGameOPDone(slot3)
	elseif slot2 == ActivityProxy.ACTIVITY_UPDATED then
		slot0.viewComponent:UpdateView()
	end
end

function slot0.OnSendMiniGameOPDone(slot0, slot1)
	slot4 = slot1.argList[2]

	if slot1.argList[1] == 3 and slot4 == 1 then
		slot0.viewComponent:UpdateView()
	end
end

return slot0
