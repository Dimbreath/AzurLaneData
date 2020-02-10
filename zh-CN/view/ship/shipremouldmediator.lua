slot0 = class("ShipRemouldMediator", import("..base.ContextMediator"))
slot0.REMOULD_SHIP = "ShipRemouldMediator:REMOULD_SHIP"
slot0.ON_SELECTE_SHIP = "ShipRemouldMediator:ON_SELECTE_SHIP"

function slot0.register(slot0)
	slot1 = getProxy(BayProxy)

	slot0.viewComponent:setShipVO(slot1:getShipById(slot0.contextData.shipId))
	slot0.viewComponent:setShips(slot1:getRawData())
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())

	slot0.bagProxy = getProxy(BagProxy)

	slot0.viewComponent:setItems(slot0.bagProxy:getData())
	slot0:bind(uv0.REMOULD_SHIP, function (slot0, slot1, slot2, slot3)
		if uv0.contextData.materialShipIds and table.getCount(uv0.contextData.materialShipIds) > 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("remould_ship_count_more"))

			return
		end

		slot4 = uv0

		slot4.sendNotification(slot4, GAME.REMOULD_SHIP, {
			shipId = slot1,
			remouldId = slot2,
			materialIds = uv0.contextData.materialShipIds or {}
		})
	end)
	slot0:bind(uv0.ON_SELECTE_SHIP, function (slot0, slot1)
		slot3 = pg.ship_data_template

		for slot8, slot9 in pairs(uv0) do
			if slot3[slot9.configId].group_type ~= slot3[slot1.configId].group_type and not slot9:isTestShip() or slot1.id == slot9.id or slot9:isTestShip() and not slot9:canUseTestShip(slot1:getConfig("rarity")) then
				table.insert({}, slot9.id)
			end
		end

		slot5 = uv1

		slot5.sendNotification(slot5, GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMin = 1,
			skipSelect = true,
			selectedMax = 1,
			flags = {
				inSham = true,
				inActivity = true
			},
			ignoredIds = slot2,
			selectedIds = uv1.contextData.materialShipIds or {},
			onShip = function (slot0, slot1)
				if slot0.inAdmiral then
					return false, i18n("confirm_unlock_ship_main")
				elseif slot0:GetLockState() == Ship.LOCK_STATE_LOCK then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						yseBtnLetf = true,
						content = i18n("confirm_unlock_lv", "Lv." .. slot0.level, slot0:getName()),
						onYes = function ()
							pg.m02:sendNotification(GAME.UPDATE_LOCK, {
								ship_id_list = {
									uv0.id
								},
								is_locked = Ship.LOCK_STATE_UNLOCK
							})
						end,
						yesText = i18n("msgbox_text_unlock")
					})

					return false, nil
				else
					return Ship.canDestroyShip(slot0, slot1)
				end
			end,
			onSelected = function (slot0)
				uv0.contextData.materialShipIds = slot0
			end,
			mode = DockyardScene.MODE_REMOULD,
			confirmSelect = function (slot0, slot1, slot2)
				if not _.all(function (slot0, slot1)
					function slot3(slot0, slot1)
						if not _.include(uv0, slot0) then
							uv0[slot1] = slot0
						end
					end

					_.each(slot0, function (slot0)
						if uv0[slot0].level > 1 then
							uv1(i18n("destroy_high_level_tip"), 2)
						end

						if slot1:getRarity() >= 4 then
							uv1(i18n("destroy_high_rarity_tip"), 1)
						end
					end)

					return {
						"",
						""
					}
				end(slot0, uv0), function (slot0)
					return slot0 == ""
				end) then
					slot6 = table.concat(slot4, "")
					slot6 = pg.MsgboxMgr.GetInstance()

					slot6:ShowMsgBox({
						content = i18n("destroy_eliteship_tip", string.gsub(slot6, "$1", slot4[1] == "" and "" or ",")),
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
