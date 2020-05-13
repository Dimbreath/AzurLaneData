slot0 = class("ProposeCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if not getProxy(BayProxy):getShipById(slot1:getBody().shipId) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_error_noShip", slot3))

		return
	end

	if getProxy(BagProxy):getItemById(ITEM_ID_FOR_PROPOSE).count < 1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(12032, {
		ship_id = slot3
	}, 12033, function (slot0)
		if slot0.result == 0 then
			pg.TrackerMgr.GetInstance():Tracking(TRACKING_PROPOSE_SHIP, uv0.groupId)
			uv1:removeItemById(ITEM_ID_FOR_PROPOSE, 1)

			uv0.propose = true
			uv0.proposeTime = pg.TimeMgr.GetInstance():GetServerTime()

			uv2:updateShip(uv0)
			getProxy(CollectionProxy).shipGroups[uv0.groupId]:updateMarriedFlag()
			uv3:sendNotification(GAME.PROPOSE_SHIP_DONE, {
				ship = uv0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_proposeShip", slot0.result))
		end
	end)
end

return slot0
