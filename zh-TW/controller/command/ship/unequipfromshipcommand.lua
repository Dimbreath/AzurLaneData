class("UnequipFromShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.pos
	slot5 = slot2.callback
	slot7 = getProxy(BayProxy).getShipById(slot6, slot3)

	if getProxy(PlayerProxy):getData().equip_bag_max <= getProxy(EquipmentProxy):getCapacity() then
		NoPosMsgBox(i18n("switch_to_shop_tip_noPos"), openDestroyEquip, gotoChargeScene)

		if slot5 then
			slot5()
		end

		return
	end

	if slot7 == nil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_error_noShip", slot3))

		if slot5 then
			slot5()
		end

		return
	end

	if not slot7:getEquip(slot4) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_unequipFromShip_error_noEquip"))

		if slot5 then
			slot5()
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(12006, {
		type = 0,
		equip_id = 0,
		ship_id = slot3,
		pos = slot4
	}, 12007, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(EquipmentProxy)

			if slot0:hasSkin() then
				slot1:updateEquipmentSkin(slot1.updateEquipmentSkin, 0)
				slot1:addEquipmentSkin(slot0.skinId, 1)

				slot0.skinId = 0

				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_unload"))
			end

			slot1:updateEquip(slot1.updateEquip, nil)
			slot1:updateShip(slot1)
			slot1:addEquipment(slot0)
			slot4:sendNotification(GAME.UNEQUIP_FROM_SHIP_DONE, slot1)
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_unequipFromShip_ok", slot0.config.name), "red")
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_unequipFromShip", slot0.result))
		end

		if slot5 then
			slot5()
		end
	end)
end

return class("UnequipFromShipCommand", pm.SimpleCommand)
