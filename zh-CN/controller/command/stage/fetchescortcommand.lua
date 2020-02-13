class("FetchEscortCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot0:sendNotification(GAME.ESCORT_FETCH_DONE)
end

return class("FetchEscortCommand", pm.SimpleCommand)
