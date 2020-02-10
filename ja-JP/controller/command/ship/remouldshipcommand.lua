slot0 = class("RemouldShipCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot5 = slot2.materialIds or {}

	if not slot2.shipId or not slot2.remouldId then
		return
	end

	if getProxy(PlayerProxy):getData().gold < pg.transform_data_template[slot4].use_gold then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	slot13 = 0

	if getProxy(BayProxy):getShipById(slot3).transforms[slot4] and slot11.transforms[slot4].level == #slot8.effect then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_remould_max_level"))

		return
	end

	for slot19, slot20 in ipairs(slot8.use_item[slot13 + 1] or {}) do
		if getProxy(BagProxy):getItemCountById(slot20[1]) < slot20[2] then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

			return
		end
	end

	if slot8.use_ship ~= 0 then
		if table.getCount(slot5) ~= slot8.use_ship then
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_remould_material_ship_no_enough"))

			return
		end

		for slot19, slot20 in ipairs(slot5) do
			if not slot10:getShipById(slot20) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_remould_material_ship_on_exist"))

				return
			end
		end
	end

	for slot19, slot20 in ipairs(slot8.ship_id) do
		if slot20[1] == slot11.configId then
			if slot7.equip_bag_max <= getProxy(EquipmentProxy):getCapacity() then
				Clone(slot11).configId = slot20[2]

				for slot26, slot27 in ipairs(slot22.equipments) do
					if slot27 and slot22:isForbiddenAtPos(slot27, slot26) then
						pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_cant_unload"))

						return
					end
				end
			end
		end
	end

	slot19.ship_id = slot3
	slot19.remould_id = slot4
	slot19.material_id = slot5

	pg.ConnectionMgr.GetInstance():Send(12011, {}, 12012, function (slot0)
		if slot0.result == 0 then
			pg.TrackerMgr.GetInstance():Tracking(TRACKING_REMOULD_SHIP, uv0.groupId)

			if uv1 then
				uv0.transforms[uv2].level = uv0.transforms[uv2].level + 1
			else
				slot3.id = uv2
				uv0.transforms[uv2] = {
					level = 1
				}
			end

			slot2 = getProxy(NavalAcademyProxy):getStudentByShipId(uv3)

			_.each(uv4.ship_id, function (slot0)
				if slot0[1] == uv0.configId then
					slot2 = uv0.skills
					uv0.configId = slot0[2]
					uv0.skills = {}
					slot3 = pg.ship_data_template[uv0.configId].buff_list

					if uv1 then
						slot4 = uv1:getSkillId(uv0)
						slot6 = slot3[table.indexof(pg.ship_data_template[uv0.configId].buff_list, slot4)]

						if not table.contains(slot3, slot4) and slot6 ~= slot4 then
							uv1:updateSkillId(slot6)
							uv2:updateStudent(uv1)
						end
					end

					for slot7, slot8 in ipairs(slot3) do
						if not slot2[slot8] then
							slot10.id = slot8
							slot9 = {
								exp = 0,
								level = 1
							}

							if slot2[slot1[slot7]] then
								slot9.level = slot10.level
								slot9.exp = slot10.exp
							end

							pg.TipsMgr.GetInstance():ShowTips(i18n("ship_remould_material_unlock_skill", pg.skill_data_template[slot8].name))
						end

						uv0.skills[slot9.id] = slot9
					end

					if slot2[11720] and not uv0.skills[11720] then
						uv0.skills[11720] = slot2[11720]
					end
				end
			end)

			for slot6, slot7 in pairs(uv4.use_item[uv5] or {}) do
				uv6:removeItemById(slot7[1], slot7[2])
			end

			slot3 = getProxy(PlayerProxy)
			slot4 = slot3:getData()
			slot7.gold = uv4.use_gold

			slot4:consume({})
			slot3:updatePlayer(slot4)

			if uv4.skin_id ~= 0 then
				uv0:updateSkinId(uv4.skin_id)

				slot8.type = DROP_TYPE_SKIN
				slot8.id = uv4.skin_id

				table.insert({}, {
					count = 1
				})

				slot6 = getProxy(CollectionProxy)

				if slot6:getShipGroup(uv0.groupId) and not slot7.trans then
					slot7.trans = true

					slot6:updateShipGroup(slot7)
				end
			end

			if uv4.skill_id ~= 0 and not uv0.skills[uv4.skill_id] then
				slot8.id = uv4.skill_id
				uv0.skills[uv4.skill_id] = {
					exp = 0,
					level = 1
				}

				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_remould_material_unlock_skill", HXSet.hxLan(pg.skill_data_template[uv4.skill_id].name)))
			end

			uv0:updateName()
			uv7:updateShip(uv0)

			for slot9, slot10 in ipairs(uv8 or {}) do
				uv7:removeShipById(slot10)
			end

			slot6 = nil
			slot6 = coroutine.create(function ()
				for slot3, slot4 in ipairs(uv0.equipments) do
					if slot4 then
						if not uv0:canEquipAtPos(slot4, slot3) then
							slot8.shipId = uv0.id
							slot8.pos = slot3
							slot8.callback = uv2

							uv1:sendNotification(GAME.UNEQUIP_FROM_SHIP, {})
							coroutine.yield()
						end
					end
				end

				slot3.ship = uv3:getShipById(uv4)
				slot3.id = uv5
				slot3.awards = uv6

				uv1:sendNotification(GAME.REMOULD_SHIP_DONE, {})
			end)

			function ()
				if uv0 and coroutine.status(uv0) == "suspended" then
					slot0, slot1 = coroutine.resume(uv0)
				end
			end()

			return
		end

		pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_remouldShip", slot0.result))
	end)
end

return slot0
