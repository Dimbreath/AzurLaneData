slot0 = class("ShipAddInimacyCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot6.id = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(19011, {}, 19012, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(BayProxy)
			slot2 = slot1:getShipById(uv0)
			slot3 = slot2.state_info_3

			slot2:addLikability(slot3)

			slot2.state_info_3 = 0

			slot1:updateShip(slot2)

			if slot3 == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_getResource_emptry"))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_shipAddInimacy_ok", slot2:getName()))
			end

			uv1:sendNotification(GAME.BACKYARD_ADD_INTIMACY_DONE)

			if pg.backyard then
				slot7.name = BACKYARD.BOAT_HARVEST
				slot7.ship = slot2:clone()

				pg.backyard:sendNotification(BACKYARD.COMMAND_BACKYARD_BOAT, {})

				slot7.type = BackYardConst.ADDITION_TYPE_INTIMACY
				slot7.id = slot2:clone().id
				slot7.exp = slot3

				pg.backyard:sendNotification(BACKYARD.BOAT_ADDITION_DONE, {})
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("backyard_shipAddInimacy", slot0.result))
		end
	end)
end

return slot0
