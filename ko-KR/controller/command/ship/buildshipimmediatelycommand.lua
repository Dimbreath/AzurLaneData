slot0 = class("BuildShipImmediatelyCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot4 = slot2.pos
	slot5 = slot2.anim
	slot7 = getProxy(BuildShipProxy):getBuildShip(slot4)
	slot8 = getProxy(BagProxy)
	slot12.type = slot1:getBody().type or 1
	slot12.pos = slot4

	pg.ConnectionMgr.GetInstance():Send(12008, {}, 12009, function (slot0)
		if slot0.result == 0 then
			uv0:removeItemById(ITEM_ID_EQUIP_QUICK_FINISH, 1)
			uv1:finish()
			uv2:finishBuildShip(uv3)

			slot4.buildShip = uv1
			slot4.index = uv3

			uv4:sendNotification(GAME.BUILD_SHIP_IMMEDIATELY_DONE, {})

			if uv5.isBatch then
				uv5.callBack()
			else
				slot4.pos = uv3
				slot4.anim = uv6

				uv4:sendNotification(GAME.GET_SHIP, {})
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_buildShipImmediately", slot0.result) .. "pos" .. uv3)
		end
	end)
end

return slot0
