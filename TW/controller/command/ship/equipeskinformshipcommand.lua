class("EquipESkinFormShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.oldShipPos
	slot5 = slot2.newShipId
	slot6 = slot2.newShipPos
	slot7 = getProxy(EquipmentProxy)

	if not getProxy(BayProxy):getShipById(slot2.oldShipId) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_no_old_ship"))

		return
	end

	if not slot9:getEquip(slot4) or not slot10:hasSkin() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_no_old_skinorequipment"))

		return
	end

	if not slot8:getShipById(slot5) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_no_new_ship"))

		return
	end

	if not slot11:getEquip(slot6) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_no_new_equipment"))

		return
	end

	slot13 = slot10.skinId

	function slot14()
		if not slot0:getEquipmnentSkinById(slot0) or slot0.count == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_count_noenough"))

			return
		end

		pg.ConnectionMgr.GetInstance():Send(12036, {
			ship_id = slot2,
			equip_skin_id = slot1,
			pos = slot3
		}, 12037, function (slot0)
			if slot0.result == 0 then
				slot1:updateEquipmentSkin(slot1.updateEquipmentSkin, slot1)
				slot4:updateShip(slot0.skinId)

				if slot0.skinId ~= 0 then
					slot5:addEquipmentSkin(slot1, 1)
					pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_unload"))
				end

				slot5:useageEquipmnentSkin(slot5)
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_replace_done"))
				slot6:sendNotification(GAME.EQUIP_EQUIPMENTSKIN_FROM_SHIP_DONE)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_unload_failed" .. slot0.result))
			end
		end)
	end

	pg.ConnectionMgr.GetInstance():Send(12036, {
		equip_skin_id = 0,
		ship_id = slot3,
		pos = slot4
	}, 12037, function (slot0)
		if slot0.result == 0 then
			slot0:updateEquipmentSkin(slot0.updateEquipmentSkin, 0)
			slot0:updateShip(slot0)
			slot3:addEquipmentSkin(0, 1)
			slot5()
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_unload_failed" .. slot0.result))
		end
	end)
end

return class("EquipESkinFormShipCommand", pm.SimpleCommand)
