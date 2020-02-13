class("EquipToShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.equipmentId
	slot5 = slot2.pos
	slot6 = slot2.callback

	if getProxy(BayProxy):getShipById(slot2.shipId) == nil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_error_noShip", slot4))

		if slot6 then
			slot6(100)
		end

		return
	end

	slot11, slot12 = slot8:canEquipAtPos(getProxy(EquipmentProxy).getEquipmentById(slot9, slot3), slot5)

	if not slot11 then
		pg.TipsMgr.GetInstance():ShowTips(slot12)

		return
	end

	if not slot10 or slot10.count == 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_equipToShip_error_noEquip"))

		if slot6 then
			slot6(101)
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(12006, {
		equip_id = slot3,
		ship_id = slot4,
		pos = slot5,
		type = slot10:GetCategory()
	}, 12007, function (slot0)
		if slot0.result == 0 then
			slot0:getEquipmentById(slot0).count = 1

			if slot0:getEquip(slot0.getEquip) then
				slot3 = pg.equip_skin_template

				if slot1:hasSkin() then
					if _.any(slot3[slot1.skinId].equip_type, function (slot0)
						return slot0 == slot0.config.type
					end) then
						slot2.skinId = slot1.skinId
					else
						slot2:addEquipmentSkin(slot1.skinId, 1)
						pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_unmatch_equipment"))
					end

					slot1.skinId = 0
				end

				slot2:addEquipment(slot1)
			end

			slot0:updateEquip(slot1, slot2)
			slot0:updateShip(slot0)
			slot2:removeEquipmentById(slot2.removeEquipmentById, 1)
			slot5:sendNotification(GAME.EQUIP_TO_SHIP_DONE, slot0)
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_equipToShip_ok", slot2.config.name), "green")
			playSoundEffect(SFX_UI_DOCKYARD_EQUIPON)

			if "green" then
				slot6()
			end

			return
		end

		pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_equipToShip", slot0.result))

		if slot6 then
			slot6()
		end
	end)
end

return class("EquipToShipCommand", pm.SimpleCommand)
