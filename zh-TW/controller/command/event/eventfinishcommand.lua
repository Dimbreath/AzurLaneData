slot0 = class("EventFinishCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.callback
	slot5 = slot2.onConfirm

	if pg.collection_template[slot2.id] then
		if getProxy(PlayerProxy):getData():OilMax(slot6.drop_oil_max or 0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_event"))

			if slot4 then
				slot4()
			end

			return
		end

		if slot7:GoldMax(slot6.drop_gold_max or 0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_event"))

			if slot4 then
				slot4()
			end

			return
		end
	end

	slot10.id = slot3

	pg.ConnectionMgr.GetInstance():Send(13005, {}, 13006, function (slot0)
		if slot0.result == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("event_finish_success"))

			slot1 = getProxy(EventProxy)
			slot2 = {}
			slot3 = {}

			if slot0.exp > 0 then
				slot4 = getProxy(BayProxy)

				for slot9, slot10 in ipairs(slot1:findInfoById(uv0).shipIds) do
					if slot4:getShipById(slot10) then
						slot12 = Clone(slot11)

						slot12:addExp(slot0.exp)
						slot4:updateShip(slot12)
						table.insert(slot2, slot11)
						table.insert(slot3, slot12)
					end
				end
			end

			slot4 = {}

			for slot8, slot9 in ipairs(slot0.drop_list) do
				slot10.type = slot9.type
				slot10.id = slot9.id
				slot10.count = slot9.num

				if slot9.type ~= DROP_TYPE_SHIP then
					uv1:sendNotification(GAME.ADD_ITEM, Item.New({}))
				end

				table.insert(slot4, slot10)
			end

			slot5 = getProxy(PlayerProxy)
			slot6 = slot5:getData()
			slot6.collect_attack_count = slot6.collect_attack_count + 1

			slot5:updatePlayer(slot6)

			slot7, slot11 = slot1:findInfoById(uv0)

			table.remove(slot1.eventList, slot8)
			_.each(slot0.new_collection, function (slot0)
				table.insert(uv0.eventList, EventInfo.New(slot0))
			end)
			uv1:sendNotification(GAME.EVENT_LIST_UPDATE)

			if uv2 then
				uv2()
			end

			slot9 = uv1
			slot12.eventId = uv0
			slot12.oldShips = slot2
			slot12.newShips = slot3
			slot12.awards = slot4
			slot12.isCri = slot0.is_cri > 0
			slot12.onConfirm = uv3

			slot9.sendNotification(slot9, GAME.EVENT_SHOW_AWARDS, {})

			return
		end

		pg.TipsMgr.GetInstance():ShowTips(errorTip("event_finish_fail", slot0.result))

		if uv2 then
			uv2()
		end
	end)
end

return slot0
