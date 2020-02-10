slot0 = class("BackYardOpenAddExpCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot6.is_open = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(19015, {})
	slot0:sendNotification(GAME.OPEN_ADD_EXP_DONE)
end

return slot0
