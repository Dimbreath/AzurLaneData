slot0 = class("FetchEscortCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot0:sendNotification(GAME.ESCORT_FETCH_DONE)
end

return slot0
