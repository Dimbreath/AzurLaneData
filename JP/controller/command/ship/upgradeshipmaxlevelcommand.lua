class("", pm.SimpleCommand).execute = function (slot0, slot1)
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

	pg.ConnectionMgr.GetInstance():Send(12038, {
		ship_id = slot3
	}, 12039, function (slot0)
		if slot0.result == 0 then
			slot0:updateMaxLevel(slot3)
			_.each(slot2, function (slot0)
				slot0:sendNotification(GAME.CONSUME_ITEM, slot0)
			end)
			slot0:addExp(0)
			slot1:sendNotification(GAME.UPGRADE_MAX_LEVEL_DONE, {
				oldShip = Clone(slot0),
				newShip = slot0,
				callback = function ()
					slot0:updateShip(slot0)
				end
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_buildShip_error", slot0.result))
		end
	end)
end

return class("", pm.SimpleCommand)
