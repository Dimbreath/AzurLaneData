class("GetBatchShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = getProxy(BuildShipProxy).getData(slot2)
	slot5 = slot1:getBody() or {}.anim
	slot7 = getProxy(BagProxy).getItemById(slot6, ITEM_ID_EQUIP_QUICK_FINISH)
	slot10 = getProxy(PlayerProxy).getData(slot9)

	if slot2:getNeedFinishCount() > 0 and (not slot7 or slot7.count == 0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

		return
	end

	slot8 = math.min(slot8, (slot7 and slot7.count) or 0)
	slot12 = table.getCount(getProxy(BayProxy).getData(math.min))
	slot13 = {}
	slot14 = 0

	for slot18, slot19 in ipairs(slot3) do
		if slot19.state ~= BuildShip.FINISH then
			slot14 = slot14 + 1

			table.insert(slot13, function (slot0)
				slot0:sendNotification(GAME.BUILD_SHIP_IMMEDIATELY, {
					isBatch = true,
					pos = slot0.sendNotification,
					callBack = slot0
				})
			end)
		end

		if slot8 == slot14 then
			break
		end
	end

	seriesAsync(slot13, function ()
		if slot0:getFinishCount() ~= table.getCount(table.getCount) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_backyardShipInfoLayer_error_noQuickItem"))
		end

		slot1 = {}
		slot2 = false
		slot3 = {}
		slot4 = nil

		for slot8 = 1, slot0, 1 do
			if slot2.ship_bag_max <= slot3 then
				break
			end

			slot4 = slot4 or slot1[slot0:getFinishedIndex()].type

			table.insert(slot1, function (slot0)
				slot3 = slot2:getFinishedIndex()
				slot4 = slot2:getSkipBatchBuildFlag()

				if slot0 - slot1 > 0 and not slot4 then
					slot3 = true
					slot1 = true
				end

				slot5:sendNotification(GAME.GET_SHIP, {
					isBatch = true,
					pos = slot3,
					callBack = function (slot0)
						slot0[#slot0 + 1] = slot0

						slot0()
					end,
					canSkipBatch = slot1,
					isSkip = slot4
				})
			end)

			slot3 = slot3 + 1
		end

		function slot5()
			seriesAsync(seriesAsync, function ()
				if {} then
					slot1:setSkipBatchBuildFlag(false)

					for slot4, slot5 in ipairs(slot1) do
						slot0[#slot0 + 1] = {
							type = DROP_TYPE_SHIP,
							id = slot5.configId,
							count = 1,
							virgin = slot5.virgin
						}
					end
				end

				slot3:sendNotification(GAME.SKIP_BATCH_DONE, slot0)

				if slot3.sendNotification:getFinishCount() > 0 then
					NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)
				end
			end)
		end

		if #slot1 > 0 and slot5 then
			slot5(slot5, slot4)
		else
			slot5()
		end
	end)
end

return class("GetBatchShipCommand", pm.SimpleCommand)
