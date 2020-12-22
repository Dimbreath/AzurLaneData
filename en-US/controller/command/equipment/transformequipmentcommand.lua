slot0 = class("TransformEquipmentCommand", pm.SimpleCommand)

function slot0.CheckEquipmentFormulasSucceed(slot0, slot1)
	slot2 = getProxy(PlayerProxy)
	slot3 = getProxy(BagProxy)
	slot4 = {}
	slot5 = slot1

	for slot9, slot10 in ipairs(slot0) do
		slot12 = Equipment.GetRevertRewardsStatic(slot5)
		slot5 = Equipment.GetEquipRootStatic(slot5)

		for slot17, slot18 in ipairs(pg.equip_upgrade_data[slot10].material_consume) do
			slot4[slot19] = (slot4[slot18[1]] or slot3:getItemCountById(slot19) or 0) - slot18[2]

			if slot4[slot19] < 0 then
				return false, pg.item_data_statistics[slot19] and slot22.name
			end
		end

		slot4.gold = (slot4.gold or slot2:getRawData().gold or 0) - slot11.coin_consume

		if slot4.gold < 0 then
			return false, pg.item_data_statistics[id2ItemId(1)].name
		end

		for slot17, slot18 in pairs(slot12) do
			slot4[slot17] = (slot4[slot17] or 0) + slot18
		end

		slot5 = slot11.target_id
	end

	return true
end

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot5 = slot2.equipmentId
	slot6 = slot2.formulaIds
	slot7 = nil

	if slot2.shipId then
		slot5 = getProxy(BayProxy):getShipById(slot3):getEquip(slot2.pos).id
	elseif slot5 ~= 0 then
		slot5 = getProxy(EquipmentProxy):getEquipmentById(slot5).id
	end

	slot8, slot9 = uv0.CheckEquipmentFormulasSucceed(slot6, slot5)

	if not slot8 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_x", slot9))

		return
	end

	slot10 = {}
	slot11 = {}

	function slot12()
		slot0 = getProxy(BagProxy)
		slot1 = getProxy(PlayerProxy)

		for slot5, slot6 in pairs(uv0) do
			if slot5 == "gold" then
				slot7 = slot1:getData()

				if slot6 > 0 then
					slot7:consume({
						gold = math.abs(slot6)
					})
					slot1:updatePlayer(slot7)
				elseif slot6 < 0 then
					slot7:addResources(slot8)
					slot1:updatePlayer(slot7)
				end
			elseif slot6 > 0 then
				slot0:removeItemById(slot5, slot6)
			elseif slot6 < 0 then
				slot0:addItemById(slot5, -slot6)
			end
		end

		table.clear(uv0)
	end

	slot13 = slot5

	function slot14()
		uv0()

		slot4 = ((not uv1 or getProxy(BayProxy):getShipById(uv1):getEquip(uv2)) and getProxy(EquipmentProxy):getEquipmentById(uv3)):MigrateTo(uv4)

		if nil then
			if not slot2:isForbiddenAtPos(slot4, uv2) then
				if slot3:hasSkin() then
					slot4:setSkinId(slot3:getSkinId())
				end

				slot2:updateEquip(uv2, slot4)
				slot0:updateShip(slot2)
			else
				if slot3:hasSkin() then
					slot2:updateEquipmentSkin(uv2, 0)
					slot1:addEquipmentSkin(slot3:getSkinId(), 1)
				end

				slot2:updateEquip(uv2, nil)
				slot0:updateShip(slot2)

				uv1 = nil

				slot1:addEquipment(slot4)
			end
		else
			slot1:removeEquipmentById(slot3.id, 1)
			slot1:addEquipmentById(slot4.id, 1)
		end

		return slot2, slot3, slot4
	end

	slot15, slot16, slot17 = nil

	table.eachAsync(slot6, function (slot0, slot1, slot2)
		seriesAsync({
			function (slot0)
				pg.ConnectionMgr.GetInstance():Send(uv0 and 14013 or 14015, uv0 and {
					ship_id = uv0,
					pos = uv1,
					upgrade_id = uv2
				} or {
					equip_id = uv3,
					upgrade_id = uv2
				}, uv0 and 14014 or 14016, slot0)
			end,
			function (slot0, slot1)
				if slot1.result == 0 then
					for slot7, slot8 in ipairs(pg.equip_upgrade_data[uv0].material_consume) do
						uv1[slot9] = (uv1[slot8[1]] or 0) + slot8[2]
					end

					uv1.gold = (uv1.gold or 0) + slot2.coin_consume

					for slot8, slot9 in pairs(Equipment.GetRevertRewardsStatic(uv2)) do
						if slot8 ~= "gold" then
							uv1[slot8] = (uv1[slot8] or 0) - slot9
							uv3[slot8] = (uv3[slot8] or 0) + slot9
						end
					end

					if pg.equip_data_template[uv2] then
						slot6 = slot5.destory_gold or 0
						uv1.gold = (uv1.gold or 0) - slot6
						uv3.gold = (uv3.gold or 0) + slot6
					end

					uv4 = uv2
					uv2 = slot2.target_id
					uv5, uv6, uv7 = uv8()

					uv9()
				else
					pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot1.result] .. slot1.result)
					uv10:sendNotification(GAME.TRANSFORM_EQUIPMENT_FAIL)
				end
			end
		})
	end, function ()
		if not uv0 and uv1.shipId then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_upgrade_equipped_unavailable", getProxy(BayProxy):getShipById(uv1.shipId):getName(), uv2.config.name))
		end

		uv5:sendNotification(GAME.TRANSFORM_EQUIPMENT_DONE, {
			ship = uv3,
			equip = uv4,
			newEquip = uv2
		})
		uv5.LoadLayer(Context.New({
			mediator = EquipmentTransformInfoMediator,
			viewComponent = EquipmentTransformInfoLayer,
			data = {
				equipVO = uv4
			},
			onRemoved = function ()
				if getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentInfoMediator) then
					pg.m02:retrieveMediator(slot2.mediator.__cname):getViewComponent():closeView()
				end

				slot4 = pg.m02:retrieveMediator(slot1.mediator.__cname):getViewComponent()

				seriesAsync({
					function (slot0)
						uv0:emit(BaseUI.ON_ACHIEVE, {
							{
								count = 1,
								id = uv1 and uv1.id or 0,
								type = DROP_TYPE_EQUIP
							}
						}, slot0)
					end,
					function (slot0)
						onNextTick(slot0)
					end,
					function (slot0)
						if not next(uv0) then
							slot0()

							return
						end

						slot1 = {}

						for slot5, slot6 in pairs(uv0) do
							if slot5 == "gold" then
								table.insert(slot1, {
									type = DROP_TYPE_RESOURCE,
									id = res2id(slot5),
									count = slot6
								})
							else
								table.insert(slot1, {
									type = DROP_TYPE_ITEM,
									id = slot5,
									count = slot6
								})
							end
						end

						uv1:emit(BaseUI.ON_AWARD, {
							items = slot1,
							title = AwardInfoLayer.TITLE.REVERT,
							removeFunc = slot0
						})
					end,
					function (slot0)
						uv0:sendNotification(GAME.TRANSFORM_EQUIPMENT_AWARD_FINISHED, uv1)
					end
				})
			end
		}), true)
	end)
end

function slot0.LoadLayer(slot0)
	pg.m02:sendNotification(GAME.LOAD_LAYERS, {
		parentContext = getProxy(ContextProxy):getCurrentContext(),
		context = slot0
	})
end

return slot0
