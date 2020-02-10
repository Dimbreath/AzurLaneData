slot0 = class("EventStartCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.shipIds

	if getProxy(EventProxy):findInfoById(slot2.id).overTime > 0 and slot6.overTime < pg.TimeMgr.GetInstance():GetServerTime() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("event_over_time_expired"))

		return
	end

	if getProxy(PlayerProxy):getData().oil < slot6:getOilConsume() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_oil"))

		return
	end

	if pg.collection_template[slot3] then
		if slot9:OilMax(slot10.drop_oil_max or 0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_eventstart"))

			return
		end

		if slot9:GoldMax(slot10.drop_gold_max or 0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_eventstart"))

			return
		end
	end

	slot14.id = slot3
	slot14.ship_id_list = slot4

	pg.ConnectionMgr.GetInstance():Send(13003, {}, 13004, function (slot0)
		if slot0.result == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("event_start_success"))

			uv0.finishTime = pg.TimeMgr.GetInstance():GetServerTime() + uv0.template.collect_time
			uv0.state = EventInfo.StateActive
			slot4.oil = uv0:getOilConsume()

			uv1:consume({})
			uv2:updatePlayer(uv1)
			uv3:sendNotification(GAME.EVENT_LIST_UPDATE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("event_start_fail", slot0.result))
		end
	end)
end

return slot0
