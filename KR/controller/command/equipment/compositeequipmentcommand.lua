class("CompositeEquipmentCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot6 = getProxy(BagProxy).getData(slot5)
	slot10 = pg.equip_data_statistics[pg.compose_data_template[slot1:getBody().id].equip_id]

	if getProxy(PlayerProxy).getData(slot7).equip_bag_max < getProxy(EquipmentProxy).getCapacity(slot11) + slot1.getBody().count then
		NoPosMsgBox(i18n("switch_to_shop_tip_noPos"), openDestroyEquip, gotoChargeScene)

		return
	end

	if slot8.gold < slot9.gold_num * slot3 then
		GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
			{
				59001,
				slot9.gold_num * slot3 - slot8.gold,
				slot9.gold_num * slot3
			}
		})

		return
	end

	if not slot6[slot9.material_id] then
		pg.TipsMgr.GetInstance():ShowTips(i18n("word_materal_no_enough"))

		return
	end

	if slot6[slot9.material_id].count < slot9.material_num * slot3 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("word_materal_no_enough"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(14006, {
		id = slot4,
		num = slot3
	}, 14007, function (slot0)
		if slot0.result == 0 then
			slot0:addEquipmentById(slot1.equip_id, slot0)
			slot3:consume({
				gold = slot1.gold_num * slot3
			})
			slot4:updatePlayer()
			slot5:removeItemById(slot1.material_id, slot1.material_num * slot5)
			slot6:sendNotification(GAME.COMPOSITE_EQUIPMENT_DONE, {
				equipment = Equipment.New({
					id = slot1.equip_id
				}),
				count = slot2,
				composeId = slot1.equip_id
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("equipment_compositeEquipment", slot0.result))
		end
	end)
end

return class("CompositeEquipmentCommand", pm.SimpleCommand)
