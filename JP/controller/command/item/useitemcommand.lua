class("UseItemCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot5 = slot2.arg
	slot8 = getProxy(BagProxy).getItemById(slot6, slot3).getTempCfgTable(slot7)
	slot9 = slot2.skip_check
	slot10 = slot2.callback

	if slot2.count == 0 then
		return
	end

	if slot7.count < slot4 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

		return
	end

	if slot8.usage == ItemUsage.DROP then
		if slot7:getConfig("type") ~= Item.EQUIPMENT_SKIN_BOX then
			slot12 = getProxy(EquipmentProxy).getCapacity(slot11)
			slot14 = getProxy(PlayerProxy):getData()

			if not slot9 and slot14.equip_bag_max < slot12 + slot4 then
				NoPosMsgBox(i18n("switch_to_shop_tip_noPos"), openDestroyEquip, gotoChargeScene)

				return
			end
		end
	elseif slot8.usage == ItemUsage.SOS then
		if not getProxy(ChapterProxy):getChapterById(304) or not slot12:isClear() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("sos_lock"))

			return
		end

		if slot4 > math.min(slot11.subProgress, #_.filter(pg.expedition_data_by_map.all, function (slot0)
			return type(pg.expedition_data_by_map[slot0].drop_by_map_display) == "table" and #slot1 > 0
		end)) - slot11.subRefreshCount - #_.filter(_.values(slot11:getRawData()), function (slot0)
			return slot0:getPlayType() == ChapterConst.TypeMainSub and slot0:isValid()
		end) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_use_item_sos_max"))

			return
		end
	end

	pg.ConnectionMgr.GetInstance():Send(15002, {
		id = slot3,
		count = slot4,
		arg = slot5
	}, 15003, function (slot0)
		if slot0.result == 0 then
			slot0:removeItemById({}, slot0.removeItemById)

			if slot3.usage == ItemUsage.FOOD then
				slot4:sendNotification(GAME.ADD_FOOD, {
					id = slot1,
					count = slot4.sendNotification
				})
			elseif slot3.usage == ItemUsage.DROP or slot3.usage == ItemUsage.DROP_APPOINTED then
				for slot5, slot6 in ipairs(slot0.drop_list) do
					table.insert(slot1, slot7)
					slot4:sendNotification(GAME.ADD_ITEM, Item.New({
						type = slot6.type,
						id = slot6.id,
						count = slot6.number
					}))
				end
			elseif slot3.usage == ItemUsage.DORM_LV_UP then
				slot4:sendNotification(GAME.EXTEND_BACKYARD_AREA)
			elseif slot3.usage == ItemUsage.SOS then
				slot2 = getProxy(ChapterProxy)
				slot2.subRefreshCount = slot2.subRefreshCount + slot2

				pg.TipsMgr.GetInstance():ShowTips(i18n("common_use_item_sos_used", slot2))
			end

			if QRJ_ITEM_ID_RANGE[1] <= slot1 and slot1 <= slot2[2] then
				table.sort(slot1, function (slot0, slot1)
					return slot0.count < slot1.count
				end)
			end

			if slot5 then
				slot5(slot1)
			end

			if not slot3.open_ui or slot3.open_ui[2] ~= 1 then
				slot4:sendNotification(GAME.USE_ITEM_DONE, slot1)
			end
		else
			if slot5 then
				slot5({})
			end

			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return class("UseItemCommand", pm.SimpleCommand)
