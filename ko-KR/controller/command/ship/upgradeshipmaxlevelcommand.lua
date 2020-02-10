slot0 = class("", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if not slot1:getBody().shipId then
		return
	end

	if not getProxy(BayProxy):getShipById(slot3) then
		return
	end

	slot6, slot7 = slot5:canUpgradeMaxLevel()

	if not slot6 then
		pg.TipsMgr.GetInstance():ShowTips(slot7)

		return
	end

	slot11.ship_id = slot3

	pg.ConnectionMgr.GetInstance():Send(12038, {}, 12039, function (slot0)
		if slot0.result == 0 then
			uv0:updateMaxLevel(uv0:getNextMaxLevel())
			_.each(uv0:getNextMaxLevelConsume(), function (slot0)
				uv0:sendNotification(GAME.CONSUME_ITEM, slot0)
			end)
			uv0:addExp(0)

			slot7.oldShip = Clone(uv0)
			slot7.newShip = uv0

			function slot7.callback()
				uv0:updateShip(uv1)
			end

			uv1:sendNotification(GAME.UPGRADE_MAX_LEVEL_DONE, {})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_buildShip_error", slot0.result))
		end
	end)
end

return slot0
