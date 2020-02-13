slot0 = class("ShipModMediator", import("..base.ContextMediator"))
slot0.ON_SELECT_MATERIAL_SHIPS = "ShipModMediator:ON_SELECT_MATERIAL_SHIPS"
slot0.ON_AUTO_SELECT_SHIP = "ShipModMediator:ON_AUTO_SELECT_SHIP"
slot0.MOD_SHIP = "ShipModMediator:MOD_SHIP"
slot0.ON_SKILL = "ShipModMediator:ON_SKILL"
slot0.LOADEND = "ShipModMediator:LOADEND"

function slot0.register(slot0)
	slot1 = getProxy(BayProxy)

	slot0.viewComponent:setShipVOs(slot2)
	slot0.viewComponent:setShip(slot3)
	slot0:bind(slot0.ON_SELECT_MATERIAL_SHIPS, function (slot0)
		slot1 = slot0:fileterShips(ShipStatus.FILTER_SHIPS_FLAGS_1)

		table.insert(slot1, 1, slot1.contextData.shipId)
		slot1:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMin = 0,
			skipSelect = true,
			blockLock = true,
			prevFlag = false,
			selectedMax = 12,
			leftTopInfo = i18n("word_equipment_intensify"),
			mode = DockyardScene.MODE_MOD,
			onShip = Ship.canDestroyShip,
			ignoredIds = slot1,
			selectedIds = slot1.contextData.materialShipIds,
			onSelected = function (slot0)
				slot0.contextData.materialShipIds = slot0
			end,
			sortData = {
				Asc = true,
				sort = 1
			}
		})
	end)
	slot0:bind(slot0.ON_AUTO_SELECT_SHIP, function (slot0)
		if #slot0:autoSelectShip() > 0 then
			slot0.contextData.materialShipIds = slot1

			slot0.viewComponent:initSelectedShips()
			slot0.viewComponent:initAttrs()
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("without_selected_ship"))
		end
	end)
	slot0:bind(slot0.MOD_SHIP, function (slot0, slot1)
		slot0:sendNotification(GAME.MOD_SHIP, {
			shipId = slot1,
			shipIds = slot0.contextData.materialShipIds
		})
	end)
	slot0:bind(slot0.ON_SKILL, function (slot0, slot1, slot2)
		slot0:addSubLayers(Context.New({
			mediator = SkillInfoMediator,
			viewComponent = SkillInfoLayer,
			data = {
				skillOnShip = slot2,
				skillId = slot1
			}
		}))
	end)
	slot0:bind(slot0.LOADEND, function (slot0, slot1)
		slot0:sendNotification(slot1.LOADEND, slot1)
	end)
end

function slot0.autoSelectShip(slot0)
	slot1 = slot0.viewComponent.shipVO
	slot2 = slot0.contextData.materialShipIds or {}
	slot3 = getProxy(BayProxy):fileterShips(ShipStatus.FILTER_SHIPS_FLAGS_2)

	function slot4(slot0)
		return slot0.level == 1 and slot0:getRarity() <= ShipRarity.Gray and slot0:GetLockState() ~= Ship.LOCK_STATE_LOCK and not table.contains(slot0, slot0.id) and slot1.id ~= slot0.id and not table.contains(slot2, slot0.id)
	end

	slot6 = {}

	for slot10, slot11 in pairs(slot5) do
		if slot4(slot11) then
			table.insert(slot6, slot11)
		end
	end

	slot9 = pg.ship_data_by_type[slot1:getConfig("type")].strengthen_choose_type

	table.sort(slot6, function (slot0, slot1)
		if ((slot0:isSameKind(slot0) and 1) or 0) == ((slot1:isSameKind(slot0) and 1) or 0) then
			return table.indexof(slot1, slot4) < table.indexof(slot1, slot1:getConfig("type"))
		else
			return slot3 < slot2
		end
	end)

	slot10 = {}

	for slot14, slot15 in pairs(slot2) do
		table.insert(slot10, slot5[slot15])
	end

	for slot14, slot15 in ipairs(slot6) do
		if #slot10 == 12 then
			break
		end

		for slot21, slot22 in pairs(slot17) do
			slot16:addModAttrExp(slot21, slot22)
		end

		slot19 = {}

		for slot23, slot24 in pairs(slot18) do
			if slot24 > 0 then
				table.insert(slot19, {
					attrName = slot23,
					value = slot24
				})
			end
		end

		if not _.all(slot19, function (slot0)
			return slot0:leftModAdditionPoint(slot0.attrName) == 0
		end) then
			table.insert(slot10, slot15)
		end
	end

	return _.map(slot10, function (slot0)
		return slot0.id
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.MOD_SHIP_DONE,
		ShipMainMediator.NEXTSHIP
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.MOD_SHIP_DONE then
		slot0.contextData.materialShipIds = nil

		slot0.viewComponent:setShip(slot3.newShip)
		slot0.viewComponent:modAttrAnim(slot3.newShip, slot3.oldShip)
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_shipModLayer_modSuccess"))

		if table.getCount(slot3.equipments) > 0 then
			slot4 = {}

			for slot8, slot9 in pairs(slot3.equipments) do
				table.insert(slot4, slot9)
			end

			slot0:addSubLayers(Context.New({
				viewComponent = ResolveEquipmentLayer,
				mediator = ResolveEquipmentMediator,
				data = {
					Equipments = slot4
				}
			}))
		end
	elseif slot2 == ShipMainMediator.NEXTSHIP then
		slot0.viewComponent:setShip(getProxy(BayProxy).getShipById(slot4, slot3))
	end
end

return slot0
