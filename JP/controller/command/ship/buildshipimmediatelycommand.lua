class("BuildShipImmediatelyCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot5 = slot2.anim
	slot7 = getProxy(BuildShipProxy).getBuildShip(slot6, slot4)
	slot8 = getProxy(BagProxy)

	pg.ConnectionMgr.GetInstance():Send(12008, {
		type = slot1:getBody().type or 1,
		pos = slot2.pos
	}, 12009, function (slot0)
		if slot0.result == 0 then
			slot0:removeItemById(ITEM_ID_EQUIP_QUICK_FINISH, 1)
			slot0.removeItemById:finish()
			slot0.removeItemById:finishBuildShip(ITEM_ID_EQUIP_QUICK_FINISH)
			slot4:sendNotification(GAME.BUILD_SHIP_IMMEDIATELY_DONE, {
				buildShip = slot1,
				index = GAME.BUILD_SHIP_IMMEDIATELY_DONE
			})

			if slot5.isBatch then
				slot5.callBack()
			else
				slot4:sendNotification(GAME.GET_SHIP, {
					pos = slot3,
					anim = slot6
				})
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_buildShipImmediately", slot0.result) .. "pos" .. errorTip("ship_buildShipImmediately", slot0.result))
		end
	end)
end

return class("BuildShipImmediatelyCommand", pm.SimpleCommand)
