slot0 = class("ShipUpgradeMediator2", import("..base.ContextMediator"))
slot0.UPGRADE_SHIP = "ShipUpgradeMediator2:UPGRADE_SHIP"
slot0.ON_SELECT_SHIP = "ShipUpgradeMediator2:ON_SELECT_SHIP"
slot0.NEXTSHIP = "ShipUpgradeMediator2:NEXTSHIP"

function slot0.register(slot0)
	slot0.bayProxy = getProxy(BayProxy)

	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())

	slot3 = slot0.bayProxy:getRawData()

	slot0:sendNotification(GAME.SET_SHIP_FLAG, {
		shipsById = slot3
	})
	slot0.viewComponent:setShips(slot3)
	slot0.viewComponent:setItems(getProxy(BagProxy):getData())
	slot0.viewComponent:setShip(slot0.bayProxy:getShipById(slot0.contextData.shipId))
	slot0:bind(uv0.UPGRADE_SHIP, function (slot0, slot1)
		uv0:sendNotification(GAME.UPGRADE_STAR, {
			shipId = uv0.contextData.shipId,
			shipIds = slot1
		})
	end)
	slot0:bind(uv0.ON_SELECT_SHIP, function (slot0, slot1, slot2)
		slot3 = {}
		slot5 = pg.ship_data_template

		for slot10, slot11 in pairs(uv1) do
			if slot5[slot11.configId].group_type ~= slot5[slot1.configId].group_type and not slot11:isTestShip() or slot1.id == slot11.id or slot11:isTestShip() and not slot11:canUseTestShip(slot1:getRarity()) or table.contains(uv0.bayProxy:fileterShips(ShipStatus.FILTER_SHIPS_FLAGS_3), slot11.id) then
				table.insert(slot3, slot11.id)
			end
		end

		uv0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			skipSelect = true,
			leftTopInfo = i18n("word_upgrade"),
			flags = {
				inSham = true,
				inActivity = true
			},
			mode = DockyardScene.MODE_UPGRADE,
			selectedMax = slot2 or 1,
			selectedMin = slot2 or 1,
			ignoredIds = slot3,
			selectedIds = uv0.contextData.materialShipIds or {},
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
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("destroy_eliteship_tip", string.gsub(table.concat(slot4, ""), "$1", slot4[1] == "" and "" or ",")),
						onYes = slot1
					})
				else
					slot1()
				end
			end
		})
	end)
	slot0:bind(uv0.NEXTSHIP, function (slot0, slot1)
		uv0:sendNotification(uv1.NEXTSHIP, slot1)
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.UPGRADE_STAR_DONE,
		BagProxy.ITEM_UPDATED,
		BayProxy.SHIP_REMOVED,
		GAME.SET_SHIP_FLAG_DONE,
		PlayerProxy.UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.SET_SHIP_FLAG_DONE then
		slot0.viewComponent:setShips(slot1:getBody().shipsById)
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == GAME.UPGRADE_STAR_DONE then
		slot0.contextData.materialShipIds = nil

		slot0:sendNotification(GAME.SET_SHIP_FLAG, {
			shipsById = slot0.bayProxy:getRawData()
		})
		slot0.viewComponent:setShip(slot3.newShip)
		slot0.viewComponent:updateStagesScrollView()
		slot0:addSubLayers(Context.New({
			viewComponent = ShipBreakResultLayer,
			mediator = ShipBreakResultMediator,
			data = {
				newShip = slot3.newShip,
				oldShip = slot3.oldShip
			}
		}))
	elseif slot2 == BagProxy.ITEM_UPDATED then
		slot0.viewComponent:setItems(getProxy(BagProxy):getRawData())
	end
end

return slot0
