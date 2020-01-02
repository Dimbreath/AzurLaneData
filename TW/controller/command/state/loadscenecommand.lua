class("LoadSceneCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot1:getBody().type = LOAD_TYPE_SCENE

	slot0:sendNotification(GAME.LOAD_CONTEXT, slot1.getBody())
end

return class("LoadSceneCommand", pm.SimpleCommand)
