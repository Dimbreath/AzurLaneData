class("UpdateShipPreferenceTagCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(12040, {
		ship_id = slot1:getBody().shipId,
		flag = slot1.getBody().tag
	}, 12041, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(BayProxy)
			slot2 = nil

			if slot0 == Ship.PREFERENCE_TAG_COMMON then
				slot2 = "ship_preference_common"
			elseif slot0 == Ship.PREFERENCE_TAG_NONE then
				slot2 = "ship_preference_non"
			end

			slot3 = slot1:getShipById(slot1)

			slot3:SetPreferenceTag(slot0)
			slot1:updateShip(slot3)
			slot2:sendNotification(GAME.UPDATE_PREFERENCE_DONE, slot3)
			pg.TipsMgr.GetInstance():ShowTips(i18n(slot2, slot3:getName()))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_updateShipLock", slot0.result))
		end
	end)
end

return class("UpdateShipPreferenceTagCommand", pm.SimpleCommand)
