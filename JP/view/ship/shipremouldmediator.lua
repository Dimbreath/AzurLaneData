slot0 = class("ShipRemouldMediator", import("..base.ContextMediator"))
slot0.REMOULD_SHIP = "ShipRemouldMediator:REMOULD_SHIP"
slot0.ON_SELECTE_SHIP = "ShipRemouldMediator:ON_SELECTE_SHIP"

function slot0.register(slot0)
	slot1 = getProxy(BayProxy)

	slot0.viewComponent:setShipVO(slot2)
	slot0.viewComponent:setShips(slot3)
	slot0.viewComponent:setPlayer(slot5)

	slot0.bagProxy = getProxy(BagProxy)

	slot0.viewComponent:setItems(slot0.bagProxy:getData())
	slot0:bind(slot0.REMOULD_SHIP, function (slot0, slot1, slot2, slot3)
		if slot0.contextData.materialShipIds and table.getCount(slot0.contextData.materialShipIds) > 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("remould_ship_count_more"))

			return
		end

		slot0:sendNotification(GAME.REMOULD_SHIP, {
			shipId = slot1,
			remouldId = slot2,
			materialIds = slot0.contextData.materialShipIds or {}
		})
	end)
	slot0:bind(slot0.ON_SELECTE_SHIP, function (slot0, slot1)
		slot2 = {}
		slot3 = pg.ship_data_template
		slot4 = slot1:getConfig("rarity")

		for slot8, slot9 in pairs(slot0) do
			if (slot3[slot9.configId].group_type ~= slot3[slot1.configId].group_type and not slot9:isTestShip()) or slot1.id == slot9.id or (slot9:isTestShip() and not slot9:canUseTestShip(slot4)) then
				table.insert(slot2, slot9.id)
			end
		end

		slot1:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMin = 1,
			skipSelect = true,
			selectedMax = 1,
			flags = {
				inSham = true,
				inActivity = true
			},
			ignoredIds = slot2,
			selectedIds = slot1.contextData.materialShipIds or {},
			onShip = Ship.canDestroyShip,
			onSelected = function (slot0)
				slot0.contextData.materialShipIds = slot0
			end,
			mode = DockyardScene.MODE_REMOULD,
			confirmSelect = function (slot0, slot1, slot2)
				if not _.all(slot3(slot0, slot0), function (slot0)
					return slot0 == ""
				end) then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("destroy_eliteship_tip", string.gsub(table.concat(slot4, ""), "$1", (slot4[1] == "" and "") or "、")),
						onYes = slot1
					})
				else
					slot1()
				end
			end
		})
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.REMOULD_SHIP_DONE,
		PlayerProxy.UPDATED,
		BagProxy.ITEM_UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.REMOULD_SHIP_DONE then
		slot0.viewComponent:setShipVO(slot3.ship)
		slot0.viewComponent:updateGridTF(slot3.id)
		slot0.viewComponent:updateLines()

		if table.getCount(slot3.awards or {}) ~= 0 then
			slot0:addSubLayers(Context.New({
				mediator = NewShipMediator,
				viewComponent = NewShipLayer,
				data = {
					fromRemould = true,
					ship = slot3.ship
				}
			}))
			slot0.viewComponent:initShipModel()
		end

		slot0.contextData.materialShipIds = nil

		slot0.viewComponent:updateInfo(slot3.id)
		pg.TipsMgr.GetInstance():ShowTips(i18n("remould_ship_ok"))
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == BagProxy.ITEM_UPDATED then
		slot0.viewComponent:setItems(slot0.bagProxy:getData())
	end
end

return slot0
