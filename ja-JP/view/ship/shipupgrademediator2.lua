slot0 = class("ShipUpgradeMediator2", import("..base.ContextMediator"))
slot0.UPGRADE_SHIP = "ShipUpgradeMediator2:UPGRADE_SHIP"
slot0.ON_SELECT_SHIP = "ShipUpgradeMediator2:ON_SELECT_SHIP"
slot0.NEXTSHIP = "ShipUpgradeMediator2:NEXTSHIP"

function slot0.register(slot0)
	slot0.bayProxy = getProxy(BayProxy)

	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())

	slot3 = slot0.bayProxy:getRawData()
	slot7.shipsById = slot3

	slot0:sendNotification(GAME.SET_SHIP_FLAG, {})
	slot0.viewComponent:setShips(slot3)
	slot0.viewComponent:setItems(getProxy(BagProxy):getData())
	slot0.viewComponent:setShip(slot0.bayProxy:getShipById(slot0.contextData.shipId))
	slot0:bind(uv0.UPGRADE_SHIP, function (slot0, slot1)
		slot5.shipId = uv0.contextData.shipId
		slot5.shipIds = slot1

		uv0:sendNotification(GAME.UPGRADE_STAR, {})
	end)
	slot0:bind(uv0.ON_SELECT_SHIP, function (slot0, slot1, slot2)
		slot5 = pg.ship_data_template

		for slot10, slot11 in pairs(uv1) do
			if slot5[slot11.configId].group_type ~= slot5[slot1.configId].group_type and not slot11:isTestShip() or slot1.id == slot11.id or slot11:isTestShip() and not slot11:canUseTestShip(slot1:getRarity()) or table.contains(uv0.bayProxy:fileterShips(ShipStatus.FILTER_SHIPS_FLAGS_3), slot11.id) then
				table.insert({}, slot11.id)
			end
		end

		slot7 = uv0
		slot11.leftTopInfo = i18n("word_upgrade")
		slot11.flags = {
			inSham = true,
			inActivity = true
		}
		slot11.mode = DockyardScene.MODE_UPGRADE
		slot11.selectedMax = slot2 or 1
		slot11.selectedMin = slot2 or 1
		slot11.ignoredIds = slot3
		slot11.selectedIds = uv0.contextData.materialShipIds or {}

		function slot11.onShip(slot0, slot1)
			if slot0.inAdmiral then
				return false, i18n("confirm_unlock_ship_main")
			elseif slot0:GetLockState() == Ship.LOCK_STATE_LOCK then
				slot4.content = i18n("confirm_unlock_lv", "Lv." .. slot0.level, slot0:getName())

				function slot4.onYes()
					slot4[1] = uv0.id
					slot3.ship_id_list = {}
					slot3.is_locked = Ship.LOCK_STATE_UNLOCK

					pg.m02:sendNotification(GAME.UPDATE_LOCK, {})
				end

				slot4.yesText = i18n("msgbox_text_unlock")

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					yseBtnLetf = true
				})

				return false, nil
			else
				return Ship.canDestroyShip(slot0, slot1)
			end
		end

		function slot11.onSelected(slot0)
			uv0.contextData.materialShipIds = slot0
		end

		function slot11.confirmSelect(slot0, slot1, slot2)
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
				slot8 = slot4[1] == "" and "" or "、"
				slot6 = pg.MsgboxMgr.GetInstance()
				slot8.content = i18n("destroy_eliteship_tip", string.gsub(slot6, "$1", slot8))
				slot8.onYes = slot1

				slot6:ShowMsgBox({})
			else
				slot1()
			end
		end

		slot7.sendNotification(slot7, GAME.GO_SCENE, SCENE.DOCKYARD, {
			skipSelect = true
		})
	end)
	slot0:bind(uv0.NEXTSHIP, function (slot0, slot1)
		uv0:sendNotification(uv1.NEXTSHIP, slot1)
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.UPGRADE_STAR_DONE
	slot1[2] = BagProxy.ITEM_UPDATED
	slot1[3] = BayProxy.SHIP_REMOVED
	slot1[4] = GAME.SET_SHIP_FLAG_DONE
	slot1[5] = PlayerProxy.UPDATED

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.SET_SHIP_FLAG_DONE then
		slot0.viewComponent:setShips(slot1:getBody().shipsById)
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == GAME.UPGRADE_STAR_DONE then
		slot0.contextData.materialShipIds = nil
		slot8 = slot0.bayProxy
		slot7.shipsById = slot8:getRawData()

		slot0:sendNotification(GAME.SET_SHIP_FLAG, {})
		slot0.viewComponent:setShip(slot3.newShip)
		slot0.viewComponent:updateStagesScrollView()

		slot7.viewComponent = ShipBreakResultLayer
		slot7.mediator = ShipBreakResultMediator
		slot8.newShip = slot3.newShip
		slot8.oldShip = slot3.oldShip
		slot7.data = {}

		slot0:addSubLayers(Context.New({}))
	elseif slot2 == BagProxy.ITEM_UPDATED then
		slot0.viewComponent:setItems(getProxy(BagProxy):getRawData())
	end
end

return slot0
