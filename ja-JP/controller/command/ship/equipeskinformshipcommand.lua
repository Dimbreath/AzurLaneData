slot0 = class("EquipESkinFormShipCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
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
		slot0 = uv0

		if not slot0:getEquipmnentSkinById(uv1) or slot0.count == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_count_noenough"))

			return
		end

		slot4.ship_id = uv2
		slot4.equip_skin_id = uv1
		slot4.pos = uv3

		pg.ConnectionMgr.GetInstance():Send(12036, {}, 12037, function (slot0)
			if slot0.result == 0 then
				uv1:updateEquipmentSkin(uv2, uv3)
				uv4:updateShip(uv1)

				if uv0.skinId ~= 0 then
					uv5:addEquipmentSkin(slot1, 1)
					pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_unload"))
				end

				uv5:useageEquipmnentSkin(uv3)
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_replace_done"))
				uv6:sendNotification(GAME.EQUIP_EQUIPMENTSKIN_FROM_SHIP_DONE)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_unload_failed" .. slot0.result))
			end
		end)
	end

	slot18.ship_id = slot3
	slot18.pos = slot4

	pg.ConnectionMgr.GetInstance():Send(12036, {
		equip_skin_id = 0
	}, 12037, function (slot0)
		if slot0.result == 0 then
			uv0:updateEquipmentSkin(uv1, 0)
			uv2:updateShip(uv0)
			uv3:addEquipmentSkin(uv4, 1)
			uv5()
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_unload_failed" .. slot0.result))
		end
	end)
end

return slot0
