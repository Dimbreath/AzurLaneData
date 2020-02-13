class("EquipFromShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.equipmentId
	slot5 = slot2.pos
	slot6 = slot2.oldShipId
	slot7 = slot2.oldPos

	if getProxy(BayProxy):getShipById(slot2.shipId) == nil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_error_noShip", slot4))

		return
	end

	if slot9:getEquip(slot5) and getProxy(PlayerProxy):getData().equip_bag_max <= getProxy(EquipmentProxy):getCapacity() then
		NoPosMsgBox(i18n("switch_to_shop_tip_noPos"), openDestroyEquip, gotoChargeScene)

		return
	end

	if slot8:getShipById(slot6) == nil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_error_noShip", slot6))

		return
	end

	if not slot10:getEquip(slot7) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_equipToShip_error_noEquip"))

		return
	end

	slot12, slot13 = slot9:canEquipAtPos(slot11, slot5)

	if not slot12 then
		pg.TipsMgr.GetInstance():ShowTips(slot13)

		return
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("ship_equip_exchange_tip", slot10:getName(), slot11.config.name, slot9:getName()),
		onYes = function ()
			function slot0(slot0, slot1, slot2, slot3)
				slot5 = getProxy(EquipmentProxy).getEquipmentById(slot4, slot1)
				slot5.count = 1

				pg.ConnectionMgr.GetInstance():Send(12006, {
					equip_id = slot1,
					ship_id = slot2,
					pos = slot3,
					type = slot5:GetCategory()
				}, 12007, function (slot0)
					if slot0.result == 0 then
						slot2 = pg.equip_skin_template

						if slot0:getEquip(slot0.getEquip) then
							if slot1:hasSkin() then
								if _.any(slot2[slot1.skinId].equip_type, function (slot0)
									return slot0.config.type == slot0
								end) then
									slot2.skinId = slot1.skinId
								else
									slot3:addEquipmentSkin(slot1.skinId, 1)
									pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_unmatch_equipment"))
								end

								slot1.skinId = 0
							end

							slot3:addEquipment(slot1)
						end

						slot0:updateEquip(slot1, slot2)
						slot0:updateShip(slot0)
						slot0.updateShip:removeEquipmentById(slot0, 1)
						slot6:sendNotification(GAME.EQUIP_TO_SHIP_DONE, slot0)
						pg.TipsMgr.GetInstance():ShowTips(i18n("ship_equipToShip_ok", pg.equip_data_statistics[i18n].name), "green")
					else
						pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_equipToShip", slot0.result))
					end
				end)
			end

			pg.ConnectionMgr.GetInstance():Send(12006, {
				type = 0,
				equip_id = 0,
				ship_id = slot2,
				pos = slot3
			}, 12007, function (slot0)
				if slot0.result == 0 then
					if slot0:getEquip(getProxy(EquipmentProxy)) and slot2:hasSkin() then
						slot1:addEquipmentSkin(slot2.skinId, 1)

						slot2.skinId = 0

						pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_unload"))
					end

					slot0:updateEquip(slot1, nil)
					slot2:updateShip(slot0)
					slot1:addEquipment(slot2)
					slot1:addEquipment(slot2, nil, slot7)
				else
					pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_unequipFromShip", slot0.result))
				end
			end)
		end
	})
end

return class("EquipFromShipCommand", pm.SimpleCommand)
