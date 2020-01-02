class("UpdateShipEquipmentSkinCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.shipId
	slot4 = slot2.pos
	slot6 = getProxy(EquipmentProxy)

	if slot2.equipmentSkinId ~= 0 and (not slot6:getEquipmnentSkinById(slot5) or slot7.count == 0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_count_noenough"))

		return
	end

	if not getProxy(BayProxy):getShipById(slot3) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_no_new_ship"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(12036, {
		ship_id = slot3,
		equip_skin_id = slot5,
		pos = slot4
	}, 12037, function (slot0)
		if slot0.result == 0 then
			slot0:updateEquipmentSkin(slot1, slot0.updateEquipmentSkin)
			slot0:updateShip(slot0)

			if slot0.updateShip ~= 0 then
				if slot1 ~= 0 then
					slot4:addEquipmentSkin(slot1, 1)
				end

				slot4:useageEquipmnentSkin(slot4.useageEquipmnentSkin)
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_replace_done"))
			else
				slot4:addEquipmentSkin(slot1, 1)
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_unload"))
			end

			slot5:sendNotification(GAME.EQUIP_EQUIPMENTSKIN_TO_SHIP_DONE, {
				ship = slot0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return class("UpdateShipEquipmentSkinCommand", pm.SimpleCommand)
