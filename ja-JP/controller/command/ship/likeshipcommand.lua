slot0 = class("LikeShipCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot6.ship_group_id = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(17107, {}, 17108, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(CollectionProxy)

			if slot1:getShipGroup(uv0) then
				slot2.iheart = true
				slot2.hearts = slot2.hearts + 1
				slot2.evaluation.hearts = slot2.evaluation.hearts + 1

				slot1:updateShipGroup(slot2)
				uv1:sendNotification(CollectionProxy.GROUP_INFO_UPDATE, uv0)
			end

			pg.TipsMgr.GetInstance():ShowTips(i18n("like_ship_success"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("like_ship", slot0.result))
		end
	end)
end

return slot0
