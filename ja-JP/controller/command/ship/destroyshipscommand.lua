slot0 = class("DestroyShipsCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.destroyEquipment or false
	slot6 = {}

	for slot10, slot11 in ipairs(slot2.shipIds) do
		if getProxy(BayProxy):getShipById(slot11) == nil then
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_error_noShip", slot11))

			return
		end

		table.insert(slot6, slot12)
	end

	slot10.ship_id_list = slot3

	pg.ConnectionMgr.GetInstance():Send(12004, {}, 12005, function (slot0)
		if slot0.result == 0 then
			slot4 = getProxy(EquipmentProxy)
			slot5 = {}
			slot6 = {}

			for slot10, slot11 in ipairs(uv0) do
				uv1:removeShip(slot11)

				slot12, slot13, slot14 = slot11:calReturnRes()
				slot1 = 0 + slot12
				slot2 = 0 + slot13
				slot3 = 0 + slot14

				for slot18, slot19 in ipairs(slot11.equipments) do
					if slot19 then
						if slot19:hasSkin() then
							slot4:addEquipmentSkin(slot19.skinId, 1)

							slot19.skinId = 0

							pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_skin_unload"))
						end

						slot4:addEquipment(slot19)

						if not slot5[slot19.id] then
							slot5[slot19.id] = slot19:clone()
						else
							slot5[slot19.id].count = slot5[slot19.id].count + 1
						end
					end
				end

				table.insert(slot6, slot11.id)
			end

			slot7 = getProxy(PlayerProxy)
			slot8 = slot7:getData()
			slot11.gold = slot1
			slot11.oil = slot2

			slot8:addResources({})

			slot10.type = DROP_TYPE_RESOURCE
			slot10.count = slot1
			slot9[1] = {
				id = 1
			}
			slot10.type = DROP_TYPE_RESOURCE
			slot10.count = slot2
			slot9[2] = {
				id = 2
			}

			slot7:updatePlayer(slot8)

			if slot3 > 0 then
				getProxy(BagProxy):addItemById(15001, slot3)

				slot13.type = DROP_TYPE_ITEM
				slot13.count = slot3

				table.insert({}, {
					id = 15001
				})
			end

			slot13.destroiedShipIds = slot6
			slot13.bonus = slot9
			slot13.equipments = slot5

			uv2:sendNotification(GAME.DESTROY_SHIP_DONE, {})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_destoryShips", slot0.result))
		end
	end)
end

return slot0
