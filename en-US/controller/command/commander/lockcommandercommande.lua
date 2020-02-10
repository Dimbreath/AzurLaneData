slot0 = class("LockCommanderCommande", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()

	if not getProxy(CommanderProxy):getCommanderById(slot2.commanderId) or slot6:getLock() == slot2.flag then
		return
	end

	if slot4 == 0 then
		slot8 = pg.SecondaryPWDMgr.GetInstance()

		slot8:LimitedOperation(slot8.UNLOCK_COMMANDER, slot3, function ()
			slot3.commanderid = uv0
			slot3.flag = uv1

			pg.ConnectionMgr.GetInstance():Send(25016, {}, 25017, function (slot0)
				if slot0.result == 0 then
					uv0:setLock(uv1)
					uv2:updateCommander(uv0)

					slot4.commander = uv0
					slot4.flag = uv1

					uv3:sendNotification(GAME.COMMANDER_LOCK_DONE, {})
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("commander_lock_erro", slot0.result))
				end
			end)
		end)
	else
		slot7()
	end
end

return slot0
