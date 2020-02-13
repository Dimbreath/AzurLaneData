slot0 = class("EquipmentSkinMediator", import("..base.ContextMediator"))
slot0.ON_EQUIP = "EquipmentSkinMediator:ON_EQUIP"
slot0.ON_UNEQUIP = "EquipmentSkinMediator:ON_UNEQUIP"
slot0.ON_SELECT = "EquipmentSkinMediator:ON_SELECT"
slot0.ON_PREVIEW = "EquipmentSkinMediator:ON_PREVIEW"
slot0.ON_EQUIP_FORM_SHIP = "EquipmentSkinMediator:ON_EQUIP_FORM_SHIP"

function slot0.register(slot0)
	slot0:bind(slot0.ON_EQUIP, function (slot0)
		slot0:sendNotification(EquipmentMediator.NO_UPDATE)
		slot0:sendNotification(GAME.EQUIP_EQUIPMENTSKIN_TO_SHIP, {
			shipId = slot0.contextData.shipId,
			pos = slot0.contextData.pos,
			equipmentSkinId = slot0.contextData.skinId
		})
	end)
	slot0:bind(slot0.ON_EQUIP_FORM_SHIP, function (slot0)
		if not slot0.contextData.oldShipInfo then
			return
		end

		slot2, slot3 = getProxy(BayProxy):getShipById(slot0.contextData.oldShipInfo.id):canModifyShip()

		if not slot2 then
			pg.TipsMgr.GetInstance():ShowTips(slot3)

			return
		end

		slot0:sendNotification(EquipmentMediator.NO_UPDATE)
		slot0:sendNotification(GAME.EQUIP_EQUIPMENTSKIN_FROM_SHIP, {
			oldShipId = slot0.contextData.oldShipInfo.id,
			oldShipPos = slot0.contextData.oldShipInfo.pos,
			newShipId = slot0.contextData.shipId,
			newShipPos = slot0.contextData.pos
		})
	end)
	slot0:bind(slot0.ON_UNEQUIP, function (slot0)
		slot0:sendNotification(GAME.EQUIP_EQUIPMENTSKIN_TO_SHIP, {
			equipmentSkinId = 0,
			shipId = slot0.contextData.shipId,
			pos = slot0.contextData.pos
		})
	end)

	if slot0.contextData.shipId then
		slot0.viewComponent:setShip(getProxy(BayProxy):getShipById(slot0.contextData.shipId))
	end

	slot0:bind(slot0.ON_SELECT, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
			equipmentVOs = ShipMainMediator:getEquipmentSkins(ship, slot1),
			shipId = slot0.contextData.shipId,
			pos = slot1,
			warp = StoreHouseConst.WARP_TO_WEAPON,
			mode = StoreHouseConst.SKIN
		})
	end)
	slot0:bind(slot0.ON_PREVIEW, function (slot0, slot1)
		slot4 = {}

		slot0:addSubLayers(Context.New({
			viewComponent = ShipPreviewLayer,
			mediator = ShipPreviewMediator,
			data = (pg.equip_skin_template[slot1].ship_skin_id == 0 or {
				equipSkinId = 0,
				shipVO = Ship.New({
					id = pg.equip_skin_template[slot1].ship_config_id,
					configId = pg.equip_skin_template[slot1].ship_config_id,
					skin_id = pg.equip_skin_template[slot1].ship_skin_id
				}),
				weaponIds = {}
			}) and {
				shipVO = Ship.New(),
				weaponIds = Clone(slot2.weapon_ids),
				equipSkinId = slot1
			}
		}))
	end)
end

function slot0.listNotificationInterests(slot0)
	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot2 = slot1:getName()
	slot3 = slot1:getBody()
end

return slot0
