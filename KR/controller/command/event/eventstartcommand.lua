class("EventStartCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().shipIds
	slot7 = pg.TimeMgr.GetInstance():GetServerTime()

	if getProxy(EventProxy).findInfoById(slot5, slot3).overTime > 0 and slot6.overTime < slot7 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("event_over_time_expired"))

		return
	end

	if getProxy(PlayerProxy).getData(slot8).oil < slot6:getOilConsume() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_oil"))

		return
	end

	if pg.collection_template[slot3] and slot9:OilMax(slot10.drop_oil_max or 0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_eventstart"))

		return

		if slot9:GoldMax(slot10.drop_gold_max or 0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_eventstart"))

			return
		end

		pg.ConnectionMgr.GetInstance():Send(13003, {
			id = slot3,
			ship_id_list = slot4
		}, 13004, function (slot0)
			if slot0.result == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("event_start_success"))

				slot0.finishTime = pg.TimeMgr.GetInstance():GetServerTime() + slot0.template.collect_time
				slot0.state = EventInfo.StateActive
				slot1 = slot0:getOilConsume()

				slot1:consume({
					oil = slot1
				})
				slot1.consume:updatePlayer(slot1)
				slot1.consume:sendNotification(GAME.EVENT_LIST_UPDATE)
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("event_start_fail", slot0.result))
			end
		end)

		return
	end
end

return class("EventStartCommand", pm.SimpleCommand)
