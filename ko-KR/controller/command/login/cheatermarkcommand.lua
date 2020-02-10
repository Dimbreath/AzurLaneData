slot0 = class("CheaterMarkCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot6.type = slot1:getBody().reason

	pg.ConnectionMgr.GetInstance():Send(10994, {}, 10995, function (slot0)
		pg.m02:sendNotification(GAME.LOGOUT, {
			code = 7
		})
	end)
end

return slot0
