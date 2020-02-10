slot0 = class("EquipmentSkinMediator", import("..base.ContextMediator"))
slot0.ON_EQUIP = "EquipmentSkinMediator:ON_EQUIP"
slot0.ON_UNEQUIP = "EquipmentSkinMediator:ON_UNEQUIP"
slot0.ON_SELECT = "EquipmentSkinMediator:ON_SELECT"
slot0.ON_PREVIEW = "EquipmentSkinMediator:ON_PREVIEW"
slot0.ON_EQUIP_FORM_SHIP = "EquipmentSkinMediator:ON_EQUIP_FORM_SHIP"

function slot0.register(slot0)
	slot0:bind(uv0.ON_EQUIP, function (slot0)
		uv0:sendNotification(EquipmentMediator.NO_UPDATE)

		slot4.shipId = uv0.contextData.shipId
		slot4.pos = uv0.contextData.pos
		slot4.equipmentSkinId = uv0.contextData.skinId

		uv0:sendNotification(GAME.EQUIP_EQUIPMENTSKIN_TO_SHIP, {})
	end)
	slot0:bind(uv0.ON_EQUIP_FORM_SHIP, function (slot0)
		if not uv0.contextData.oldShipInfo then
			return
		end

		slot2, slot3 = getProxy(BayProxy):getShipById(uv0.contextData.oldShipInfo.id):canModifyShip()

		if not slot2 then
			pg.TipsMgr.GetInstance():ShowTips(slot3)

			return
		end

		slot4 = uv0.contextData.oldShipInfo

		uv0:sendNotification(EquipmentMediator.NO_UPDATE)

		slot8.oldShipId = slot4.id
		slot8.oldShipPos = slot4.pos
		slot8.newShipId = uv0.contextData.shipId
		slot8.newShipPos = uv0.contextData.pos

		uv0:sendNotification(GAME.EQUIP_EQUIPMENTSKIN_FROM_SHIP, {})
	end)
	slot0:bind(uv0.ON_UNEQUIP, function (slot0)
		slot4.shipId = uv0.contextData.shipId
		slot4.pos = uv0.contextData.pos

		uv0:sendNotification(GAME.EQUIP_EQUIPMENTSKIN_TO_SHIP, {
			equipmentSkinId = 0
		})
	end)

	if slot0.contextData.shipId then
		slot0.viewComponent:setShip(getProxy(BayProxy):getShipById(slot0.contextData.shipId))
	end

	slot0:bind(uv0.ON_SELECT, function (slot0, slot1)
		slot7.equipmentVOs = ShipMainMediator:getEquipmentSkins(ship, slot1)
		slot7.shipId = uv0.contextData.shipId
		slot7.pos = slot1
		slot7.warp = StoreHouseConst.WARP_TO_WEAPON
		slot7.mode = StoreHouseConst.SKIN

		uv0:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {})
	end)
	slot0:bind(uv0.ON_PREVIEW, function (slot0, slot1)
		slot2 = pg.equip_skin_template[slot1]
		slot4.id = slot2.ship_config_id
		slot4.configId = slot2.ship_config_id
		slot4.skin_id = slot2.ship_skin_id
		slot4 = {}

		if slot2.ship_skin_id ~= 0 then
			slot5.shipVO = Ship.New({})
			slot5.weaponIds = {}
			slot4 = {
				equipSkinId = 0
			}
		else
			slot5.shipVO = slot3
			slot5.weaponIds = Clone(slot2.weapon_ids)
			slot5.equipSkinId = slot1
			slot4 = {}
		end

		slot8.viewComponent = ShipPreviewLayer
		slot8.mediator = ShipPreviewMediator
		slot8.data = slot4

		uv0:addSubLayers(Context.New({}))
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
