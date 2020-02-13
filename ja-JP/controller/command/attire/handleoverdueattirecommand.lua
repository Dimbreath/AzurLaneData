class("HandleOverDueAttireCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if #getProxy(AttireProxy).getExpiredChaces(slot2) > 0 then
		slot0:sendNotification(GAME.HANDLE_OVERDUE_ATTIRE_DONE, slot3)
	end
end

return class("HandleOverDueAttireCommand", pm.SimpleCommand)
