slot0 = class("MiniHubMediator", import("..BaseMiniGameMediator"))

slot0.register = function (slot0)
	slot0.super.register(slot0)
	slot0.viewComponent:SetExtraData({})
end

slot0.OnMiniGameOPeration = function (slot0, slot1, slot2)
	slot0:sendNotification(GAME.SEND_MINI_GAME_OP, {
		hubid = slot0.miniGameProxy:GetHubByGameId(slot0.miniGameId).id,
		cmd = slot1,
		args1 = slot2
	})
end

slot0.OnMiniGameSuccess = function (slot0, slot1)
	if slot0.miniGameProxy:GetHubByGameId(slot0.miniGameId).count <= 0 then
		return
	end

	slot0:sendNotification(GAME.SEND_MINI_GAME_OP, {
		hubid = slot2.id,
		cmd = MiniGameOPCommand.CMD_COMPLETE,
		args1 = {
			slot1
		}
	})
end

slot0.OnMiniGameFailure = function (slot0, slot1)
	return
end

slot0.listNotificationInterests = function (slot0)
	table.insertto({}, slot0.super.listNotificationInterests(slot0))

	return 
end

slot0.handleNotification = function (slot0, slot1)
	slot0.super.handleNotification(slot0, slot1)
end

return slot0
