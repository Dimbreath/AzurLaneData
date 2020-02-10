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

function slot0.register(slot0)
	slot0.bayProxy = getProxy(BayProxy)

	if not slot0.contextData.shipVOs then
		slot0.contextData.shipVOs = {}
	end

	slot0.viewComponent:setShipList(slot0.contextData.shipVOs)
	slot0.viewComponent:setSkinList(getProxy(ShipSkinProxy):getSkinList())

	slot0.contextData.index = 1

	for slot5 = 1, #slot0.contextData.shipVOs, 1 do
		if slot0.contextData.shipId == slot0.contextData.shipVOs[slot5].id then
			slot0.contextData.index = slot5
			slot0.bayProxy:getShipById(slot0.contextData.shipId).bindingData = slot0.contextData.shipVOs[slot5].bindingData

			break
		end
	end

	slot0.viewComponent:setShip(slot1)

	slot0.showTrans = slot1:isRemoulded()

	slot0.bayProxy:setSelectShipId(slot0.contextData.shipId)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())

	slot4 = getProxy(ContextProxy)

	slot0:bind(uv0.OPEN_SHIPPROFILE, function (slot0, slot1, slot2)
		slot7.showTrans = slot2
		slot7.groupId = slot1

		uv0:sendNotification(GAME.GO_SCENE, SCENE.SHIP_PROFILE, {})
	end)
	slot0:bind(uv0.ON_SKIN_INFO, function (slot0, slot1, slot2)
		slot6.viewComponent = EquipmentSkinLayer
		slot6.mediator = EquipmentSkinMediator
		slot7.shipId = uv0.contextData.shipId
		slot7.pos = slot1
		slot7.mode = EquipmentSkinLayer.DISPLAY
		slot7.skinId = slot2
		slot6.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.ON_DESTROY_SHIP, function (slot0)
		slot4.destroyEquipment = destroyEquipment
		slot5[1] = uv0.contextData.shipId
		slot4.shipIds = {}

		uv0:sendNotification(GAME.DESTROY_SHIPS, {})
	end)
	slot0:bind(uv0.ON_RECORD_EQUIPMENT, function (slot0, slot1, slot2, slot3)
		slot7.shipId = slot1
		slot7.index = slot2
		slot7.type = slot3

		uv0:sendNotification(GAME.RECORD_SHIP_EQUIPMENT, {})
	end)
	slot0:bind(uv0.OPEN_EVALUATION, function (slot0, slot1, slot2)
		if slot2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("npc_evaluation_tip"))

			return
		end

		uv0:sendNotification(GAME.FETCH_EVALUATION, slot1)
	end)
	slot0:bind(uv0.ON_SELECT_EQUIPMENT_SKIN, function (slot0, slot1)
		slot7.equipmentVOs = uv0:getEquipmentSkins(uv1.viewComponent.shipVO, slot1)
		slot7.shipId = uv1.contextData.shipId
		slot7.pos = slot1
		slot7.warp = StoreHouseConst.WARP_TO_WEAPON
		slot7.mode = StoreHouseConst.SKIN

		uv1:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {})
	end)
	slot0:bind(uv0.ON_SELECT_EQUIPMENT, function (slot0, slot1)
		slot4 = getProxy(BayProxy)

		for slot10, slot11 in ipairs(getProxy(EquipmentProxy):getEquipments(true)) do
			if not slot5:isForbiddenAtPos(slot11, slot1) then
				table.insert(slot4:getEquipsInShips(slot4:getShipById(uv0.contextData.shipId), slot1), slot11)
			end
		end

		_.each(slot6, function (slot0)
			if not uv0:canEquipAtPos(slot0, uv1) then
				slot0.mask = true
			end
		end)

		slot11.equipmentVOs = slot6
		slot11.shipId = uv0.contextData.shipId
		slot11.pos = slot1
		slot11.warp = StoreHouseConst.WARP_TO_WEAPON
		slot11.mode = StoreHouseConst.EQUIPMENT

		uv0:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
			lock = true
		})
	end)
	slot0:bind(uv0.ON_UPGRADE, function (slot0, slot1)
		uv0:openUpgrade()
	end)
	slot0:bind(uv0.CLOSE_UPGRADE, function (slot0)
		uv0:closeUpgrade()
	end)
	slot0:bind(uv0.OPEN_INTENSIFY, function (slot0)
		uv0:openIntensify()
	end)
	slot0:bind(uv0.CLOSE_INTENSIFY, function (slot0)
		uv0:closeIntensify()
	end)
	slot0:bind(uv0.ON_LOCK, function (slot0, slot1, slot2)
		slot6.ship_id_list = slot1
		slot6.is_locked = slot2

		uv0:sendNotification(GAME.UPDATE_LOCK, {})
	end)
	slot0:bind(uv0.ON_TAG, function (slot0, slot1, slot2)
		slot6.shipId = slot1
		slot6.tag = slot2

		uv0:sendNotification(GAME.UPDATE_PREFERENCE, {})
	end)
	slot0:bind(uv0.ON_SKILL, function (slot0, slot1, slot2, slot3)
		slot7.mediator = SkillInfoMediator
		slot7.viewComponent = SkillInfoLayer
		slot8.skillOnShip = slot2
		slot8.skillId = slot1
		slot8.shipId = uv0.contextData.shipId
		slot8.index = slot3
		slot8.LayerWeightMgr_groupName = LayerWeightConst.GROUP_SHIPINFOUI
		slot7.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.CHANGE_SKIN, function (slot0, slot1, slot2)
		slot6.shipId = slot1
		slot6.skinId = slot2

		uv0:sendNotification(GAME.SET_SHIP_SKIN, {})
	end)
	slot0:bind(uv0.BUY_ITEM, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.count = slot2

		uv0:sendNotification(GAME.SHOPPING, {})
	end)
	slot0:bind(uv0.UNEQUIP_FROM_SHIP_ALL, function (slot0, slot1)
		slot5.shipId = slot1

		uv0:sendNotification(GAME.UNEQUIP_FROM_SHIP_ALL, {})
	end)
	slot0:bind(uv0.NEXTSHIP, function (slot0, slot1)
		uv0:nextPage(slot1)
	end)
	slot0:bind(uv0.OPEN_ACTIVITY, function (slot0, slot1)
		slot6.id = slot1

		uv0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {})
	end)
	slot0:bind(uv0.OPEN_REMOULD, function (slot0)
		uv0:openRemould()
	end)
	slot0:bind(uv0.CLOSE_REMOULD, function (slot0)
		uv0:closeRemould()
	end)
	slot0:bind(uv0.PROPOSE, function (slot0, slot1, slot2)
		slot6.mediator = ProposeMediator
		slot6.viewComponent = ProposeUI
		slot7.shipId = slot1
		slot7.callback = slot2
		slot6.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.RENAME_SHIP, function (slot0, slot1, slot2)
		slot6.shipId = slot1
		slot6.name = slot2

		uv0:sendNotification(GAME.RENAME_SHIP, {})
	end)
	slot0:bind(uv0.ON_SEL_COMMANDER, function (slot0)
		slot6.mode = CommandPostScene.MODE_SELECT

		function slot6.onShip(slot0)
			if slot0.shipId == uv0.contextData.shipId then
				return false, i18n("commander_ship_already_equip")
			end

			return true
		end

		function slot6.onSelected(slot0)
			if #slot0 == 0 then
				uv0.contextData.unequipCommander = true
			else
				uv0.contextData.selectedId = slot0[1]
			end
		end

		slot6.quitTeam = getProxy(BayProxy):getShipById(uv0.contextData.shipId):hasCommander()

		uv0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDPOST, {
			selectedMin = 1,
			selectedMax = 1
		})
	end)
	slot0:bind(uv0.ON_UPGRADE_MAX_LEVEL, function (slot0, slot1)
		slot5.shipId = slot1

		uv0:sendNotification(GAME.UPGRADE_MAX_LEVEL, {})
	end)
	slot0:bind(uv0.ON_TECHNOLOGY, function (slot0, slot1)
		slot6.shipId = slot1.id

		uv0:sendNotification(GAME.GO_SCENE, SCENE.SHIPBLUEPRINT, {})
	end)

	if slot0.contextData.selectedId then
		slot8.shipId = slot0.contextData.shipId
		slot8.commanderId = slot0.contextData.selectedId

		slot0:sendNotification(GAME.COMMANDER_EQUIP_TO_SHIP, {})

		slot0.contextData.selectedId = nil
	elseif slot0.contextData.unequipCommander then
		slot0.contextData.unequipCommander = nil
		slot8.shipId = slot0.contextData.shipId

		slot0:sendNotification(GAME.COMMANDER_EQUIP_TO_SHIP, {
			commanderId = 0
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

	for slot11, slot12 in ipairs(_.map(getProxy(BayProxy):getEquipmentSkinInShips(slot1, slot3.config.type), function (slot0)
		slot1.id = slot0.id
		slot1.shipId = slot0.shipId
		slot1.shipPos = slot0.shipPos

		return {
			isSkin = true,
			count = 1
		}
	end) or {}) do
		table.insert(_.map(getProxy(EquipmentProxy):getSkinsByType(slot3.config.type), function (slot0)
			slot1.id = slot0.id
			slot1.count = slot0.count

			return {
				isSkin = true
			}
		end), slot12)
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
		if slot0.contextData.shipVOs[slot10] then
			if slot0.bayProxy:getShipById(slot11.id) then
				slot6.bindingData = slot11.bindingData
				slot0.contextData.index = slot10
				slot0.contextData.shipId = slot6.id

				break
			end
		end
	end

	if slot6 == nil then
		if slot2 == nil then
			return
		end

		slot7 = slot0.contextData.shipVOs[slot0.contextData.index]
		slot6 = slot0.bayProxy:getShipById(slot7.id)
		slot6.bindingData = slot7.bindingData
		slot0.contextData.shipId = slot6.id
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
	if getProxy(ContextProxy):getCurrentContext():getContextByMediator(ShipRemouldMediator) then
		return
	end

	slot7.viewComponent = ShipRemouldLayer
	slot7.mediator = ShipRemouldMediator
	slot8.shipId = slot0.contextData.shipId
	slot8.LayerWeightMgr_groupName = LayerWeightConst.GROUP_SHIPINFOUI
	slot7.data = {}

	slot0:addSubLayers(Context.New({}))
end

function slot0.closeRemould(slot0)
	if getProxy(ContextProxy):getCurrentContext():getContextByMediator(ShipRemouldMediator) then
		slot7.context = slot3

		slot0:sendNotification(GAME.REMOVE_LAYERS, {})
	end
end

function slot0.openUpgrade(slot0)
	if getProxy(ContextProxy):getCurrentContext():getContextByMediator(ShipUpgradeMediator2) then
		return
	end

	slot6.mediator = ShipUpgradeMediator2
	slot6.viewComponent = ShipUpgradeLayer2
	slot7.shipId = slot0.contextData.shipId
	slot7.shipVOs = slot0.contextData.shipVOs
	slot7.index = slot0.contextData.index
	slot7.LayerWeightMgr_groupName = LayerWeightConst.GROUP_SHIPINFOUI
	slot6.data = {}

	slot0:addSubLayers(Context.New({}))
end

function slot0.closeUpgrade(slot0)
	if getProxy(ContextProxy):getCurrentContext():getContextByMediator(ShipUpgradeMediator2) then
		slot6.context = slot2

		slot0:sendNotification(GAME.REMOVE_LAYERS, {})
	end
end

function slot0.openIntensify(slot0)
	if slot0.intensifyContext ~= nil then
		slot0.intensifyContext.data.shipId = slot0.contextData.shipId

		return
	end

	if getProxy(ContextProxy):getCurrentContext():getContextByMediator(ShipModMediator) then
		return
	end

	slot5.mediator = ShipModMediator
	slot5.viewComponent = ShipModLayer
	slot6.shipId = slot0.contextData.shipId
	slot6.LayerWeightMgr_groupName = LayerWeightConst.GROUP_SHIPINFOUI
	slot5.data = {}
	slot0.intensifyContext = Context.New({})

	slot0:addSubLayers(slot0.intensifyContext, false, function ()
		uv0.intensifyContext = nil
	end)
end

function slot0.closeIntensify(slot0)
	if getProxy(ContextProxy):getCurrentContext():getContextByMediator(ShipModMediator) then
		slot7.context = slot3

		slot0:sendNotification(GAME.REMOVE_LAYERS, {})
	end
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.DESTROY_SHIP_DONE
	slot1[2] = BayProxy.SHIP_UPDATED
	slot1[3] = GAME.UPDATE_LOCK_DONE
	slot1[4] = GAME.UPDATE_PREFERENCE_DONE
	slot1[5] = PlayerProxy.UPDATED
	slot1[6] = GAME.FETCH_EVALUATION_DONE
	slot1[7] = GAME.MOD_SHIP_DONE
	slot1[8] = ShipSkinProxy.SHIP_SKINS_UPDATE
	slot1[9] = ShipUpgradeMediator2.NEXTSHIP
	slot1[10] = GAME.REMOVE_LAYERS
	slot1[11] = ShipModMediator.LOADEND
	slot1[12] = GAME.RENAME_SHIP_DONE
	slot1[13] = GAME.RECORD_SHIP_EQUIPMENT_DONE
	slot1[14] = GAME.SHOPPING_DONE
	slot1[15] = GAME.UPGRADE_MAX_LEVEL_DONE

	return {}
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
		slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
	elseif slot2 == GAME.FETCH_EVALUATION_DONE then
		slot7.mediator = ShipEvaluationMediator
		slot7.viewComponent = ShipEvaluationLayer
		slot8.groupId = slot3
		slot8.showTrans = slot0.showTrans
		slot7.data = {}

		slot0:addSubLayers(Context.New({}))
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
			slot7.items = slot3.awards

			slot0.viewComponent:emit(BaseUI.ON_AWARD, {})
		end

		if pg.shop_template[slot3.id] and slot4.genre == ShopArgs.SkinShop then
			slot8.mediator = NewSkinMediator
			slot8.viewComponent = NewSkinLayer
			slot9.skinId = slot4.effect_args[1]
			slot8.data = {}

			slot0:addSubLayers(Context.New({}))
		end
	elseif slot2 == GAME.UPGRADE_MAX_LEVEL_DONE then
		slot0.viewComponent:doUpgradeMaxLeveAnim(slot3.oldShip, slot3.newShip, function ()
			uv0.viewComponent:showAwakenCompleteAni(i18n("upgrade_to_next_maxlevel_succeed", uv1.newShip:getMaxLevel()))
			uv1.callback()
		end)
	end
end

return slot0
