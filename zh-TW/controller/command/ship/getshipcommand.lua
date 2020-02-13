class("GetShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().type or 1
	slot5 = slot2.callBack
	slot6 = slot2.isBatch
	slot7 = slot2.canSkipBatch
	slot8 = slot2.isSkip
	slot9 = slot2.anim

	if not getProxy(BuildShipProxy):getBuildShip(slot2.pos) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_getShip_error_noShip"))

		if slot5 then
			slot5()
		end

		return
	end

	if not slot11:isFinish() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_getShip_error_notFinish"))

		if slot5 then
			slot5()
		end

		return
	end

	slot12 = getProxy(BayProxy)

	if not slot6 and getProxy(PlayerProxy).getData(slot14).ship_bag_max <= #slot12:getShips() then
		NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)

		if slot5 then
			slot5()
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(12025, {
		type = slot3,
		pos = slot4
	}, 12026, function (slot0)
		if slot0.result == 0 then
			function slot1()
				slot0:removeBuildShipByIndex(slot0)

				slot0 = Ship.New(slot2.ship)

				slot3:addShip(slot0)
				slot0:setBuildShipState()

				slot2 = getProxy(PlayerProxy).getData(slot1)

				if slot0:getRarity() >= 4 and not slot2:GetCommonFlag(GAME_RESTOREVIEW_ALREADY) then
					pg.SdkMgr.GetInstance():StoreReview()
					pg.SdkMgr.GetInstance():sendNotification(GAME.COMMON_FLAG, {
						flagID = GAME_RESTOREVIEW_ALREADY
					})
				end

				if slot5 and not slot0.virgin and slot0:getRarity() < 4 then
					slot4:sendNotification(GAME.SKIP_SHIP_DONE)
					slot6(slot0)
				else
					slot4:sendNotification(GAME.GET_SHIP_DONE, {
						ship = slot0,
						quitCallBack = slot6,
						canSkipBatch = slot6,
						isBatch = slot8
					})
				end
			end

			if slot8 then
				slot8(slot1, slot9.type)
			else
				slot1()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_getShip", slot0.result))
		end
	end)
end

return class("GetShipCommand", pm.SimpleCommand)
