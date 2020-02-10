slot0 = class("UpGradeEquipmentCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot5 = slot2.equipmentId
	slot6 = nil

	if slot2.shipId then
		slot6 = getProxy(BayProxy):getShipById(slot3):getEquip(slot2.pos)
	else
		slot6 = getProxy(EquipmentProxy):getEquipmentById(slot5)
	end

	if not Equipment.canUpgrade(slot6.configId) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_max_level"))

		return
	end

	slot7 = slot3 and 14002 or 14004
	slot8 = slot3 and 14003 or 14005

	if slot3 then
		slot9.ship_id = slot3
		slot9.pos = slot4

		if not {} then
			slot9 = {
				equip_id = slot5,
				type = slot6:GetCategory()
			}
		end
	end

	pg.ConnectionMgr.GetInstance():Send(slot7, slot9, slot8, function (slot0)
		if slot0.result == 0 then
			slot2 = getProxy(BagProxy)
			slot3 = getProxy(EquipmentProxy)
			slot4 = getProxy(PlayerProxy)
			slot5, slot6 = nil

			if uv0 then
				slot6 = getProxy(BayProxy):getShipById(uv0):getEquip(uv1)
			else
				slot6 = slot3:getEquipmentById(uv2)
			end

			slot7 = slot4:getData()
			slot11.gold = slot6.config.trans_use_gold

			slot7:consume({})
			slot4:updatePlayer(slot7)

			for slot13, slot14 in ipairs(slot6.config.trans_use_item) do
				slot2:removeItemById(slot14[1], slot14[2])
			end

			if slot5 then
				if slot6:hasSkin() then
					slot6:MigrateTo(slot6.config.next):setSkinId(slot6:getSkinId())
				end

				slot5:updateEquip(uv1, slot10)
				slot1:updateShip(slot5)
			elseif slot6 then
				slot3:removeEquipmentById(slot6.id, 1)
				slot3:addEquipmentById(slot10.id, 1, true)
			end

			slot14.ship = slot5
			slot14.equip = slot6
			slot14.newEquip = slot10

			uv3:sendNotification(GAME.UPGRADE_EQUIPMENTS_DONE, {})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("equipment_upgrade_erro", slot0.result))
		end
	end)
end

return slot0
