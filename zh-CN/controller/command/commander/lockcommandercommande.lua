class("LockCommanderCommande", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().flag

	if not getProxy(CommanderProxy):getCommanderById(slot1.getBody().commanderId) or slot6:getLock() == slot4 then
		return
	end

	function slot7()
		pg.ConnectionMgr.GetInstance():Send(25016, {
			commanderid = slot0,
			flag = slot1
		}, 25017, function (slot0)
			if slot0.result == 0 then
				slot0:setLock(slot0.setLock)
				slot0:updateCommander(slot0)
				slot3:sendNotification(GAME.COMMANDER_LOCK_DONE, {
					commander = slot0,
					flag = slot3.sendNotification
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("commander_lock_erro", slot0.result))
			end
		end)
	end

	if slot4 == 0 then
		slot8 = pg.SecondaryPWDMgr.GetInstance()

		slot8:LimitedOperation(slot8.UNLOCK_COMMANDER, slot3, slot7)
	else
		slot7()
	end
end

return class("LockCommanderCommande", pm.SimpleCommand)
