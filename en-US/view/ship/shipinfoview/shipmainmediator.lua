slot0 = class("ShipMainMediator", import("...base.ContextMediator"))
slot0.ON_DESTROY_SHIP = "ShipMainMediator:ON_DESTROY_SHIP"
slot0.ON_LOCK = "ShipMainMediator:ON_LOCK"
slot0.ON_TAG = "ShipMainMediator:ON_TAG"
slot0.ON_UPGRADE = "ShipMainMediator:ON_UPGRADE"
slot0.ON_MOD = "ShipMainMediator:ON_MOD"
slot0.ON_SKILL = "ShipMainMediator:ON_SKILL"
slot0.OPEN_INTENSIFY = "ShipMainMediator:OPEN_INTENSIFY"
slot0.CLOSE_INTENSIFY = "ShipMainMediator:CLOSE_INTENSIFY"
slot0.OPEN_EVALUATION = "ShipMainMediator:OPEN_EVALUATION"
slot0.CLOSE_UPGRADE = "ShipMainMediator:CLOSE_UPGRADE"
slot0.CHANGE_SKIN = "ShipMainMediator:CHANGE_SKIN"
slot0.BUY_ITEM = "ShipMainMediator:BUY_ITEM"
slot0.UNEQUIP_FROM_SHIP_ALL = "ShipMainMediator:UNEQUIP_FROM_SHIP_ALL"
slot0.NEXTSHIP = "ShipMainMediator:NEXTSHIP"
slot0.OPEN_ACTIVITY = "ShipMainMediator:OPEN_ACTIVITY"
slot0.PROPOSE = "ShipMainMediator:PROPOSE"
slot0.RENAME_SHIP = "ShipMainMediator:RENAME_SHIP"
slot0.OPEN_REMOULD = "ShipMainMediator:OPEN_REMOULD"
slot0.CLOSE_REMOULD = "ShipMainMediator:CLOSE_REMOULD"
slot0.ON_RECORD_EQUIPMENT = "ShipMainMediator:ON_RECORD_EQUIPMENT"
slot0.ON_SELECT_EQUIPMENT = "ShipMainMediator:ON_SELECT_EQUIPMENT"
slot0.ON_SELECT_EQUIPMENT_SKIN = "ShipMainMediator:ON_SELECT_EQUIPMENT_SKIN"
slot0.ON_SKIN_INFO = "ShipMainMediator:ON_SKIN_INFO"
slot0.ON_UPGRADE_MAX_LEVEL = "ShipMainMediator:ON_UPGRADE_MAX_LEVEL"
slot0.ON_TECHNOLOGY = "ShipMainMediator:ON_TECHNOLOGY"
slot0.OPEN_SHIPPROFILE = "ShipMainMediator:OPEN_SHIPPROFILE"
slot0.ON_SEL_COMMANDER = "ShipMainMediator:ON_SEL_COMMANDER"
slot0.OPEN_EQUIP_UPGRADE = "ShipMainMediator:OPEN_EQUIP_UPGRADE"

function slot0.register(slot0)
	slot0.bayProxy = getProxy(BayProxy)

	if not slot0.contextData.shipVOs then
		slot0.contextData.shipVOs = {}
	end

	slot0.viewComponent:setShipList(slot0.contextData.shipVOs)
	slot0.viewComponent:setSkinList(getProxy(ShipSkinProxy):getSkinList())

	slot1 = slot0.bayProxy:getShipById(slot0.contextData.shipId)
	slot0.contextData.index = 1

	for slot5 = 1, #slot0.contextData.shipVOs, 1 do
		if slot0.contextData.shipId == slot0.contextData.shipVOs[slot5].id then
			slot0.contextData.index = slot5
			slot1.bindingData = slot0.contextData.shipVOs[slot5].bindingData

			break
		end
	end

	slot0.viewComponent:setShip(slot1)

	slot0.showTrans = slot1:isRemoulded()

	slot0.bayProxy:setSelectShipId(slot0.contextData.shipId)
	slot0.viewComponent:setPlayer(slot3)

	slot4 = getProxy(ContextProxy)

	slot0:bind(slot0.OPEN_SHIPPROFILE, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIP_PROFILE, {
			showTrans = slot2,
			groupId = slot1
		})
	end)
	slot0:bind(slot0.ON_SKIN_INFO, function (slot0, slot1, slot2)
		slot0:addSubLayers(Context.New({
			viewComponent = EquipmentSkinLayer,
			mediator = EquipmentSkinMediator,
			data = {
				shipId = slot0.contextData.shipId,
				pos = slot1,
				mode = EquipmentSkinLayer.DISPLAY,
				skinId = slot2
			}
		}))
	end)
	slot0:bind(slot0.ON_DESTROY_SHIP, function (slot0)
		slot0:sendNotification(GAME.DESTROY_SHIPS, {
			destroyEquipment = destroyEquipment,
			shipIds = {
				slot0.contextData.shipId
			}
		})
	end)
	slot0:bind(slot0.ON_RECORD_EQUIPMENT, function (slot0, slot1, slot2, slot3)
		slot0:sendNotification(GAME.RECORD_SHIP_EQUIPMENT, {
			shipId = slot1,
			index = slot2,
			type = slot3
		})
	end)
	slot0:bind(slot0.OPEN_EVALUATION, function (slot0, slot1, slot2)
		if slot2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("npc_evaluation_tip"))

			return
		end

		slot0:sendNotification(GAME.FETCH_EVALUATION, slot1)
	end)
	slot0:bind(slot0.ON_SELECT_EQUIPMENT_SKIN, function (slot0, slot1)
		slot1:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
			equipmentVOs = slot0:getEquipmentSkins(slot1.viewComponent.shipVO, slot1),
			shipId = slot1.contextData.shipId,
			pos = slot1,
			warp = StoreHouseConst.WARP_TO_WEAPON,
			mode = StoreHouseConst.SKIN
		})
	end)
	slot0:bind(slot0.ON_SELECT_EQUIPMENT, function (slot0, slot1)
		slot4 = getProxy(BayProxy)
		slot6 = slot4:getEquipsInShips(slot5, slot1)

		for slot10, slot11 in ipairs(slot3) do
			if not slot5:isForbiddenAtPos(slot11, slot1) then
				table.insert(slot6, slot11)
			end
		end

		_.each(slot6, function (slot0)
			if not slot0:canEquipAtPos(slot0, slot0.canEquipAtPos) then
				slot0.mask = true
			end
		end)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
			lock = true,
			equipmentVOs = slot6,
			shipId = slot0.contextData.shipId,
			pos = slot1,
			warp = StoreHouseConst.WARP_TO_WEAPON,
			mode = StoreHouseConst.EQUIPMENT
		})
	end)
	slot0:bind(slot0.ON_UPGRADE, function (slot0, slot1)
		slot0:openUpgrade()
	end)
	slot0:bind(slot0.CLOSE_UPGRADE, function (slot0)
		slot0:closeUpgrade()
	end)
	slot0:bind(slot0.OPEN_INTENSIFY, function (slot0)
		slot0:openIntensify()
	end)
	slot0:bind(slot0.CLOSE_INTENSIFY, function (slot0)
		slot0:closeIntensify()
	end)
	slot0:bind(slot0.ON_LOCK, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.UPDATE_LOCK, {
			ship_id_list = slot1,
			is_locked = slot2
		})
	end)
	slot0:bind(slot0.ON_TAG, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.UPDATE_PREFERENCE, {
			shipId = slot1,
			tag = slot2
		})
	end)
	slot0:bind(slot0.ON_SKILL, function (slot0, slot1, slot2, slot3)
		slot0:addSubLayers(Context.New({
			mediator = SkillInfoMediator,
			viewComponent = SkillInfoLayer,
			data = {
				skillOnShip = slot2,
				skillId = slot1,
				shipId = slot0.contextData.shipId,
				index = slot3,
				LayerWeightMgr_groupName = LayerWeightConst.GROUP_SHIPINFOUI
			}
		}))
	end)
	slot0:bind(slot0.CHANGE_SKIN, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.SET_SHIP_SKIN, {
			shipId = slot1,
			skinId = slot2
		})
	end)
	slot0:bind(slot0.BUY_ITEM, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.SHOPPING, {
			id = slot1,
			count = slot2
		})
	end)
	slot0:bind(slot0.UNEQUIP_FROM_SHIP_ALL, function (slot0, slot1)
		slot0:sendNotification(GAME.UNEQUIP_FROM_SHIP_ALL, {
			shipId = slot1
		})
	end)
	slot0:bind(slot0.NEXTSHIP, function (slot0, slot1)
		slot0:nextPage(slot1)
	end)
	slot0:bind(slot0.OPEN_ACTIVITY, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = slot1
		})
	end)
	slot0:bind(slot0.OPEN_REMOULD, function (slot0)
		slot0:openRemould()
	end)
	slot0:bind(slot0.CLOSE_REMOULD, function (slot0)
		slot0:closeRemould()
	end)
	slot0:bind(slot0.PROPOSE, function (slot0, slot1, slot2)
		slot0:addSubLayers(Context.New({
			mediator = ProposeMediator,
			viewComponent = ProposeUI,
			data = {
				shipId = slot1,
				callback = slot2
			}
		}))
	end)
	slot0:bind(slot0.RENAME_SHIP, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.RENAME_SHIP, {
			shipId = slot1,
			name = slot2
		})
	end)
	slot0:bind(slot0.ON_SEL_COMMANDER, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDPOST, {
			selectedMin = 1,
			selectedMax = 1,
			mode = CommandPostScene.MODE_SELECT,
			onShip = function (slot0)
				if slot0.shipId == slot0.contextData.shipId then
					return false, i18n("commander_ship_already_equip")
				end

				return true
			end,
			onSelected = function (slot0)
				if #slot0 == 0 then
					slot0.contextData.unequipCommander = true
				else
					slot0.contextData.selectedId = slot0[1]
				end
			end,
			quitTeam = getProxy(BayProxy):getShipById(slot0.contextData.shipId):hasCommander()
		})
	end)
	slot0:bind(slot0.ON_UPGRADE_MAX_LEVEL, function (slot0, slot1)
		slot0:sendNotification(GAME.UPGRADE_MAX_LEVEL, {
			shipId = slot1
		})
	end)
	slot0:bind(slot0.ON_TECHNOLOGY, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPBLUEPRINT, {
			shipId = slot1.id
		})
	end)
	slot0:bind(slot0.OPEN_EQUIP_UPGRADE, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = EquipUpgradeMediator,
			viewComponent = EquipUpgradeLayer,
			data = {
				shipId = slot1
			}
		}))
	end)

	if slot0.contextData.selectedId then
		slot0:sendNotification(GAME.COMMANDER_EQUIP_TO_SHIP, {
			shipId = slot0.contextData.shipId,
			commanderId = slot0.contextData.selectedId
		})

		slot0.contextData.selectedId = nil
	elseif slot0.contextData.unequipCommander then
		slot0.contextData.unequipCommander = nil

		slot0:sendNotification(GAME.COMMANDER_EQUIP_TO_SHIP, {
			commanderId = 0,
			shipId = slot0.contextData.shipId
		})
	end

	slot0.viewComponent:setMaxLevelHelpFlag(getProxy(SettingsProxy):getMaxLevelHelp())
end

function slot0.getEquipmentSkins(slot0, slot1, slot2)
	if not slot1 then
		return {}
	end

	if not slot1:getEquip(slot2) then
		return {}
	end

	slot7 = _.map(slot4, function (slot0)
		return {
			isSkin = true,
			id = slot0.id,
			count = slot0.count
		}
	end)
	slot8 = ipairs
	slot9 = _.map(slot5, function (slot0)
		return {
			isSkin = true,
			count = 1,
			id = slot0.id,
			shipId = slot0.shipId,
			shipPos = slot0.shipPos
		}
	end) or {}

	for slot11, slot12 in slot8(slot9) do
		table.insert(slot7, slot12)
	end

	return slot7
end

function slot0.nextPage(slot0, slot1, slot2)
	if #slot0.contextData.shipVOs == 0 then
		return
	end

	slot3 = 1
	slot4 = 1
	slot5 = 1

	if slot1 then
		slot3 = slot0.contextData.index + 1
		slot4 = #slot0.contextData.shipVOs
	else
		slot3 = slot0.contextData.index - 1
		slot5 = -1
	end

	slot6 = nil

	for slot10 = slot3, slot4, slot5 do
		if slot0.contextData.shipVOs[slot10] and slot0.bayProxy:getShipById(slot11.id) then
			slot6.bindingData = slot11.bindingData
			slot0.contextData.index = slot10
			slot0.contextData.shipId = slot6.id

			break
		end
	end

	if slot6 == nil then
		if slot2 == nil then
			return
		end

		slot0.bayProxy:getShipById(slot0.contextData.shipVOs[slot0.contextData.index].id).bindingData = slot0.contextData.shipVOs[slot0.contextData.index].bindingData
		slot0.contextData.shipId = slot0.bayProxy.getShipById(slot0.contextData.shipVOs[slot0.contextData.index].id).id
	end

	if slot6 then
		slot0.viewComponent:setPreOrNext(slot1)

		slot0.viewComponent.fashionGroup = 0
		slot0.viewComponent.fashionSkinId = 0

		slot0.viewComponent:setShip(slot6)
		slot0.viewComponent:updatePreferenceTag()
		slot0.viewComponent:displayShipWord("detail", true)
		slot0.bayProxy:setSelectShipId(slot6.id)
		slot0.viewComponent:closeRecordPanel()

		if ShipViewConst.currentPage == ShipViewConst.PAGE.UPGRADE then
			slot0:closeUpgrade()
		elseif slot7 == ShipViewConst.PAGE.INTENSIFY and not slot0.intensifyContext then
			slot0:closeIntensify()
		elseif slot7 == ShipViewConst.PAGE.EQUIPMENT and slot0.contextData.isInEquipmentSkinPage and (not slot6:hasEquipEquipmentSkin() or not slot6:canModifyShip()) then
			slot0.viewComponent:switch2EquipmentSkinPage()
		end

		slot0.viewComponent:switchToPage(slot7, true)
	end

	return slot6
end

function slot0.openRemould(slot0)
	if getProxy(ContextProxy).getCurrentContext(slot1):getContextByMediator(ShipRemouldMediator) then
		return
	end

	slot0:addSubLayers(Context.New({
		viewComponent = ShipRemouldLayer,
		mediator = ShipRemouldMediator,
		data = {
			shipId = slot0.contextData.shipId,
			LayerWeightMgr_groupName = LayerWeightConst.GROUP_SHIPINFOUI
		}
	}))
end

function slot0.closeRemould(slot0)
	if getProxy(ContextProxy).getCurrentContext(slot1):getContextByMediator(ShipRemouldMediator) then
		slot0:sendNotification(GAME.REMOVE_LAYERS, {
			context = slot3
		})
	end
end

function slot0.openUpgrade(slot0)
	if getProxy(ContextProxy):getCurrentContext():getContextByMediator(ShipUpgradeMediator2) then
		return
	end

	slot0:addSubLayers(Context.New({
		mediator = ShipUpgradeMediator2,
		viewComponent = ShipUpgradeLayer2,
		data = {
			shipId = slot0.contextData.shipId,
			shipVOs = slot0.contextData.shipVOs,
			index = slot0.contextData.index,
			LayerWeightMgr_groupName = LayerWeightConst.GROUP_SHIPINFOUI
		}
	}))
end

function slot0.closeUpgrade(slot0)
	if getProxy(ContextProxy):getCurrentContext():getContextByMediator(ShipUpgradeMediator2) then
		slot0:sendNotification(GAME.REMOVE_LAYERS, {
			context = slot2
		})
	end
end

function slot0.openIntensify(slot0)
	if slot0.intensifyContext ~= nil then
		slot0.intensifyContext.data.shipId = slot0.contextData.shipId

		return
	end

	if getProxy(ContextProxy).getCurrentContext(slot1):getContextByMediator(ShipModMediator) then
		return
	end

	slot0.intensifyContext = Context.New({
		mediator = ShipModMediator,
		viewComponent = ShipModLayer,
		data = {
			shipId = slot0.contextData.shipId,
			LayerWeightMgr_groupName = LayerWeightConst.GROUP_SHIPINFOUI
		}
	})

	slot0:addSubLayers(slot0.intensifyContext, false, function ()
		slot0.intensifyContext = nil
	end)
end

function slot0.closeIntensify(slot0)
	if getProxy(ContextProxy).getCurrentContext(slot1):getContextByMediator(ShipModMediator) then
		slot0:sendNotification(GAME.REMOVE_LAYERS, {
			context = slot3
		})
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.DESTROY_SHIP_DONE,
		BayProxy.SHIP_UPDATED,
		GAME.UPDATE_LOCK_DONE,
		GAME.UPDATE_PREFERENCE_DONE,
		PlayerProxy.UPDATED,
		GAME.FETCH_EVALUATION_DONE,
		GAME.MOD_SHIP_DONE,
		ShipSkinProxy.SHIP_SKINS_UPDATE,
		ShipUpgradeMediator2.NEXTSHIP,
		GAME.REMOVE_LAYERS,
		ShipModMediator.LOADEND,
		GAME.RENAME_SHIP_DONE,
		GAME.RECORD_SHIP_EQUIPMENT_DONE,
		GAME.SHOPPING_DONE,
		GAME.UPGRADE_MAX_LEVEL_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == BayProxy.SHIP_UPDATED then
		if slot3.id == slot0.contextData.shipId then
			slot0.showTrans = slot3:isRemoulded()

			slot0.viewComponent:setShip(slot3)
		end
	elseif slot2 == GAME.DESTROY_SHIP_DONE then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_shipInfoMediator_destory"))
		slot0.viewComponent.event:emit(BaseUI.ON_CLOSE)
	elseif slot2 == GAME.UPDATE_LOCK_DONE then
		if slot3.id == slot0.contextData.shipId then
			slot0.viewComponent:updateLock()
		end
	elseif slot2 == GAME.UPDATE_PREFERENCE_DONE then
		if slot3.id == slot0.contextData.shipId then
			slot0.viewComponent:updatePreferenceTag()
		end
	elseif slot2 == GAME.MOD_SHIP_DONE then
		slot0.viewComponent:displayShipWord("upgrade", true)
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(getProxy(PlayerProxy).getData(slot4))
	elseif slot2 == GAME.FETCH_EVALUATION_DONE then
		slot0:addSubLayers(Context.New({
			mediator = ShipEvaluationMediator,
			viewComponent = ShipEvaluationLayer,
			data = {
				groupId = slot3,
				showTrans = slot0.showTrans
			}
		}))
	elseif slot2 == ShipSkinProxy.SHIP_SKINS_UPDATE then
		slot0.viewComponent:setSkinList(getProxy(ShipSkinProxy):getSkinList())

		slot0.viewComponent.fashionGroup = 0

		slot0.viewComponent.shipFashionView:UpdateFashion(true)
	elseif slot2 == ShipUpgradeMediator2.NEXTSHIP then
		slot4 = slot0:nextPage(slot3, 3)
	elseif slot2 == ShipModMediator.LOADEND then
		slot0.viewComponent:setModPanel(slot3)
	elseif slot2 == GAME.RENAME_SHIP_DONE then
		slot0.viewComponent:DisplayRenamePanel(false)
	elseif slot2 == GAME.RECORD_SHIP_EQUIPMENT_DONE then
		if slot3.shipId == slot0.contextData.shipId and slot3.type == 1 then
			slot0.viewComponent:updateRecordEquipments(slot3.index)
		end
	elseif slot2 == GAME.SHOPPING_DONE then
		if slot3.awards and #slot3.awards > 0 then
			slot0.viewComponent:emit(BaseUI.ON_AWARD, {
				items = slot3.awards
			})
		end

		if pg.shop_template[slot3.id] and slot4.genre == ShopArgs.SkinShop then
			slot0:addSubLayers(Context.New({
				mediator = NewSkinMediator,
				viewComponent = NewSkinLayer,
				data = {
					skinId = slot4.effect_args[1]
				}
			}))
		end
	elseif slot2 == GAME.UPGRADE_MAX_LEVEL_DONE then
		slot0.viewComponent:doUpgradeMaxLeveAnim(slot3.oldShip, slot3.newShip, function ()
			slot0.viewComponent:showAwakenCompleteAni(i18n("upgrade_to_next_maxlevel_succeed", slot1.newShip:getMaxLevel()))
			slot1.callback()
		end)
	end
end

return slot0
