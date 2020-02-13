class("UpdateShipLockCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.ship_id_list
	slot5 = slot2.callback

	function slot6()
		pg.ConnectionMgr.GetInstance():Send(12022, {
			ship_id_list = slot0,
			is_locked = slot1
		}, 12023, function (slot0)
			if slot0.result == 0 then
				slot1 = getProxy(BayProxy)
				slot2 = nil

				if slot0 == Ship.LOCK_STATE_LOCK then
					slot2 = "ship_updateShipLock_ok_lock"
				elseif slot0 == Ship.LOCK_STATE_UNLOCK then
					slot2 = "ship_updateShipLock_ok_unlock"
				end

				for slot6, slot7 in ipairs(slot1) do
					slot8 = slot1:getShipById(slot7)

					slot8:SetLockState(slot0)
					slot1:updateShip(slot8)
					slot2:sendNotification(GAME.UPDATE_LOCK_DONE, slot8)
					pg.TipsMgr.GetInstance():ShowTips(i18n(slot2, slot8:getName()))
				end

				if slot3 then
					slot3()
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_updateShipLock", slot0.result))
			end
		end)
	end

	if slot2.is_locked == Ship.LOCK_STATE_UNLOCK then
		pg.SecondaryPWDMgr:LimitedOperation(pg.SecondaryPWDMgr.UNLOCK_SHIP, slot2.ship_id_list, slot6)
	else
		slot6()
	end
end

return class("UpdateShipLockCommand", pm.SimpleCommand)
