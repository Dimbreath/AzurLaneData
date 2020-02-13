slot0 = class("ModBluePrintCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().count

	if not getProxy(TechnologyProxy):getBluePrintById(slot1.getBody().id) then
		return
	end

	if not slot6:isUnlock() then
		return
	end

	if getProxy(BagProxy):getItemCountById(slot6:getConfig("strengthen_item")) < slot3 then
		return
	end

	if slot3 == 0 then
		return
	end

	if slot6:isMaxLevel() and slot6:isMaxFateLevel() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("blueprint_max_level_tip"))

		return
	end

	slot11 = Clone(slot6)

	slot11:addExp(slot10)

	if getProxy(BayProxy).getShipById(slot13, slot6.shipId).level < slot11:getStrengthenConfig(math.max(slot11.level, 1)).need_lv then
		pg.TipsMgr.GetInstance():ShowTips(i18n("buleprint_need_level_tip", slot12.need_lv))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(63204, {
		ship_id = slot6.shipId,
		count = slot3
	}, 63205, function (slot0)
		if slot0.result == 0 then
			slot0:sendNotification(GAME.CONSUME_ITEM, Item.New({
				count = slot1,
				id = slot2,
				type = DROP_TYPE_ITEM
			}))
			GAME.CONSUME_ITEM:addExp(GAME.CONSUME_ITEM:getItemExp() * slot1)

			if Clone(slot3).level < GAME.CONSUME_ITEM.addExp.level then
				for slot6 = slot1.level + 1, slot3.level, 1 do
					if slot3:getStrengthenConfig(slot6).special == 1 and type(slot7.special_effect) == "table" then
						for slot12, slot13 in ipairs(slot8) do
							if slot13[1] == ShipBluePrint.STRENGTHEN_TYPE_SKILL then
								slot17 = getProxy(BayProxy).getShipById(slot16, slot3.shipId)

								for slot21, slot22 in ipairs(slot15) do
									slot17.skills[slot4] = {
										exp = 0,
										level = 1,
										id = slot22
									}

									pg.TipsMgr.GetInstance():ShowTips(slot13[3])
								end

								slot16:updateShip(slot17)
							elseif slot14 == ShipBluePrint.STRENGTHEN_TYPE_SKIN then
								getProxy(ShipSkinProxy).addSkin(slot15, ShipSkin.New({
									id = slot13[2]
								}))

								slot16 = pg.ship_skin_template[slot13[2]].name

								pg.TipsMgr.GetInstance():ShowTips(slot13[3])
							elseif slot14 == ShipBluePrint.STRENGTHEN_TYPE_BREAKOUT then
								slot0:upgradeStar(getProxy(BayProxy).getShipById(slot15, slot3.shipId))
							end
						end
					end
				end
			elseif slot1.fateLevel < slot3.fateLevel then
				for slot6 = slot1.fateLevel + 1, slot3.fateLevel, 1 do
					if slot3:getFateStrengthenConfig(slot6).special == 1 and type(slot7.special_effect) == "table" then
						for slot12, slot13 in ipairs(slot8) do
							if slot13[1] == ShipBluePrint.STRENGTHEN_TYPE_CHANGE_SKILL then
								slot15 = getProxy(BayProxy)
								slot16 = slot15:getShipById(slot3.shipId)
								Clone(slot16.skills[slot13[2][1]]).id = slot13[2][2]
								slot16.skills[slot13[2][1]] = nil
								slot16.skills[slot13[2][2]] = Clone(slot16.skills[slot13[2][1]])

								pg.TipsMgr.GetInstance():ShowTips(slot13[3])
								slot15:updateShip(slot16)

								if getProxy(NavalAcademyProxy):getStudentByShipId(slot16.id) and slot21.skillId == slot17 then
									slot21.skillId = slot18

									slot20:updateStudent(slot21)
								end
							end
						end
					end
				end
			end

			slot3 = slot5:getShipById(slot3.shipId)
			slot3.strengthList = {}

			table.insert(slot3.strengthList, {
				level = slot3.level + math.max(slot3.fateLevel, 0),
				exp = slot3.exp
			})
			slot3.strengthList:updateShip(slot3)
			slot0:sendNotification(GAME.MOD_BLUEPRINT_ANIM_LOCK)
			slot6:updateBluePrint(slot3)
			slot0:sendNotification(GAME.MOD_BLUEPRINT_DONE, {
				oldBluePrint = slot1,
				newBluePrint = slot3
			})
			pg.TipsMgr.GetInstance():ShowTips(i18n("blueprint_mod_success"))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("blueprint_mod_erro") .. slot0.result)
		end
	end)
end

function slot0.upgradeStar(slot0, slot1)
	slot4 = getProxy(CollectionProxy).getShipGroup(slot3, Clone(slot1).groupId)

	if pg.ship_data_breakout[slot1.configId].breakout_id ~= 0 then
		slot1.configId = slot5.breakout_id

		for slot10, slot11 in ipairs(pg.ship_data_template[slot1.configId].buff_list) do
			if not slot1.skills[slot11] then
				slot1.skills[slot11] = {
					exp = 0,
					level = 1,
					id = slot11
				}
			end
		end

		slot1:updateMaxLevel(slot6.max_level)

		for slot11, slot12 in ipairs(slot7) do
			if not table.contains(slot6.buff_list, slot12) then
				slot1.skills[slot12] = nil
			end
		end

		getProxy(BayProxy):updateShip(slot1)
	end
end

return slot0
