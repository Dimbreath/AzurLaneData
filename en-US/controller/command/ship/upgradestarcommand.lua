class("UpgradeStarCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().shipIds

	if pg.ship_data_breakout[getProxy(BayProxy).getShipById(slot5, slot3).configId].breakout_id == 0 then
		return
	end

	Clone(slot6).configId = slot8

	for slot13, slot14 in pairs(slot6.equipments) do
		if slot14 and slot9:isForbiddenAtPos(slot14, slot13) then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("ship_upgrade_unequip_tip", slot9:getConfig("name"), "#fad545"),
				onYes = function ()
					slot0:sendNotification(GAME.UNEQUIP_FROM_SHIP, {
						shipId = slot1.id,
						pos = GAME.UNEQUIP_FROM_SHIP
					})
				end
			})

			return
		end
	end

	slot10 = Clone(slot6)
	slot11 = {}

	for slot15, slot16 in ipairs(slot4) do
		if not slot5:getShipById(slot16) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_error_noShip", slot16))

			return
		end

		table.insert(slot11, slot17)
	end

	slot13 = getProxy(CollectionProxy).getShipGroup(slot12, slot10.groupId)

	pg.ConnectionMgr.GetInstance():Send(12027, {
		ship_id = slot3,
		material_id_list = slot4
	}, 12028, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(EquipmentProxy)

			for slot5, slot6 in ipairs(slot0) do
				for slot10, slot11 in ipairs(slot6.equipments) do
					if slot11 then
						if slot11:hasSkin() then
							slot1:addEquipmentSkin(slot11.skinId, 1)

							slot11.skinId = 0

							pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_unload"))
						end

						slot1:addEquipment(slot11)
					end
				end

				slot1:removeShip(slot6)
			end

			if pg.ship_data_breakout[slot2.configId].breakout_id ~= 0 then
				slot2.configId = slot2.breakout_id

				for slot7, slot8 in ipairs(pg.ship_data_template[slot2.configId].buff_list) do
					if not slot2.skills[slot8] then
						slot2.skills[slot8] = {
							exp = 0,
							level = 1,
							id = slot8
						}
					end
				end

				slot2:updateMaxLevel(slot3.max_level)

				for slot8, slot9 in ipairs(slot4) do
					if not table.contains(slot3.buff_list, slot9) then
						slot2.skills[slot9] = nil
					end
				end

				slot1:updateShip(slot2)
			end

			slot3 = getProxy(BagProxy)

			for slot7, slot8 in ipairs(slot2.use_item) do
				slot3:removeItemById(slot8[1], slot8[2])
			end

			slot4 = getProxy(PlayerProxy)
			slot5 = slot4:getData()

			slot5:consume({
				gold = slot2.use_gold
			})
			slot4:updatePlayer(slot5)
			slot4:sendNotification(GAME.UPGRADE_STAR_DONE, {
				newShip = slot2,
				oldShip = slot3
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_upgradeStar_error", slot0.result))
		end
	end)
end

return class("UpgradeStarCommand", pm.SimpleCommand)
