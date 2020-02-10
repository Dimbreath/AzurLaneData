slot0 = class("ItemInfoMediator", import("..base.ContextMediator"))
slot0.USE_ITEM = "ItemInfoMediator:USE_ITEM"
slot0.COMPOSE_ITEM = "ItemInfoMediator:COMPOSE_ITEM"
slot0.ON_BLUEPRINT_SCENE = "ItemInfoMediator:ON_BLUEPRINT_SCENE"
slot0.SELL_BLUEPRINT = "sell blueprint"

function slot0.register(slot0)
	slot0:bind(uv0.ON_BLUEPRINT_SCENE, function ()
		uv0:sendNotification(GAME.GO_SCENE, SCENE.SHIPBLUEPRINT)
	end)
	slot0:bind(uv0.SELL_BLUEPRINT, function (slot0, slot1, slot2, slot3)
		slot8.id = slot2
		slot8.count = slot3
		slot8.type = slot1
		slot7[1] = {}

		uv0:sendNotification(GAME.FRAG_SELL, {})
	end)

	slot2 = slot0.contextData.mine

	if slot0.contextData.info.type == DROP_TYPE_SHIP then
		slot0.viewComponent:setShipId(slot1.id)
	elseif slot1.type == DROP_TYPE_ITEM then
		slot0:updateItem()

		if slot2 then
			slot0:bind(uv0.USE_ITEM, function (slot0, slot1, slot2)
				slot3 = getProxy(BagProxy):getItemById(slot1)

				if slot3:getTempCfgTable().usage == ItemUsage.DROP and slot3:getConfig("type") ~= Item.EQUIPMENT_SKIN_BOX then
					if getProxy(PlayerProxy):getData().equip_bag_max < getProxy(EquipmentProxy):getCapacity() + slot2 then
						NoPosMsgBox(i18n("switch_to_shop_tip_noPos"), openDestroyEquip, gotoChargeScene)
						uv0.viewComponent:doClose()

						return
					end
				end

				uv0.viewComponent:PlayOpenBox(slot3:getTempConfig("display_effect"), function ()
					if table.contains(ITEM_ID_FUDAIS, uv0) then
						slot5.id = uv0
						slot5.type = DROP_TYPE_ITEM
						slot5.count = uv2
						slot4[1] = {}
						slot3.items = {}

						uv1:sendNotification(GAME.OPEN_MAIL_ATTACHMENT, {})
					else
						slot3.id = uv0
						slot3.count = uv2

						uv1:sendNotification(GAME.USE_ITEM, {})
					end
				end)
			end)
			slot0:bind(uv0.COMPOSE_ITEM, function (slot0, slot1, slot2)
				slot6.id = slot1
				slot6.count = slot2

				uv0:sendNotification(GAME.COMPOSE_ITEM, {})
			end)
		end
	end
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = BagProxy.ITEM_UPDATED
	slot1[2] = GAME.USE_ITEM_DONE
	slot1[3] = GAME.OPEN_MAIL_ATTACHMENT_DONE
	slot1[4] = GAME.FRAG_SELL_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == BagProxy.ITEM_UPDATED then
		if slot0.contextData.mine and slot0:updateItem().count <= 0 then
			slot0.viewComponent:doClose()
		end
	elseif slot2 == GAME.USE_ITEM_DONE then
		slot0.viewComponent:SetOperateCount(1)
	elseif slot2 == GAME.FRAG_SELL_DONE then
		slot0.viewComponent:SetOperateCount(1)
	elseif slot2 == GAME.OPEN_MAIL_ATTACHMENT_DONE and slot3.items and #slot4 > 0 then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot4, function ()
			if uv0.callback then
				uv0.callback()
			end
		end)
	end
end

function slot0.updateItem(slot0)
	slot1 = slot0.contextData.info
	slot4 = nil

	if slot0.contextData.mine then
		if not getProxy(BagProxy):getItemById(slot1.id) then
			slot6.id = slot1.id
			slot4 = Item.New({
				count = 0
			})
		end
	else
		slot6.id = slot1.id
		slot6.count = defaultValue(slot1.count, 0)
		slot4 = Item.New({})
	end

	slot0.viewComponent:setItem(slot4)

	return slot4
end

return slot0
