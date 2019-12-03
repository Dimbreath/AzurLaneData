class("BuildShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot5, slot6, slot7 = BuildShip.canBuildShipByBuildId(slot1:getBody().buildId, slot1.getBody().count or 1)

	if not slot5 then
		if slot7 then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_1"), ChargeScene.TYPE_ITEM, slot7)
		else
			pg.TipsMgr.GetInstance():ShowTips(slot6)
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(12002, {
		id = slot3,
		count = slot4
	}, 12003, function (slot0)
		if slot0.result == 0 then
			pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_SHIP, slot0)
			getProxy(BagProxy).removeItemById(slot2, pg.ship_data_create_material[].use_item, pg.ship_data_create_material[].number_1 * slot0)

			slot3 = getProxy(PlayerProxy)
			slot4 = slot3:getData()

			slot4:consume({
				gold = pg.ship_data_create_material[].use_gold * slot0
			})
			slot3:updatePlayer(slot4)

			slot5 = getProxy(BuildShipProxy)

			for slot9, slot10 in ipairs(slot0.build_info) do
				slot5:addBuildShip(BuildShip.New(slot10))
			end

			slot2:sendNotification(GAME.BUILD_SHIP_DONE)
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_buildShipMediator_startBuild"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_buildShip_error", slot0.result))
		end
	end)
end

return class("BuildShipCommand", pm.SimpleCommand)
