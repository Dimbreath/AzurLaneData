slot0 = class("AwardInfoMediator", import("..base.ContextMediator"))
slot0.ON_DROP = "AwardInfoMediator:ON_DROP"

function slot0.register(slot0)
	slot0:bind(uv0.ON_DROP, function (slot0, slot1, slot2)
		if slot1.type == DROP_TYPE_EQUIP then
			slot6.mediator = EquipmentInfoMediator
			slot6.viewComponent = EquipmentInfoLayer
			slot7.equipmentId = slot1.cfg.id
			slot7.type = EquipmentInfoMediator.TYPE_DISPLAY
			slot7.onRemoved = slot2
			slot7.LayerWeightMgr_weight = LayerWeightConst.THIRD_LAYER
			slot6.data = {}

			uv0:addSubLayers(Context.New({}))
		else
			slot5.type = MSGBOX_TYPE_SINGLE_ITEM
			slot5.drop = slot1
			slot5.onNo = slot2
			slot5.onYes = slot2
			slot5.weight = LayerWeightConst.THIRD_LAYER

			pg.MsgboxMgr.GetInstance():ShowMsgBox({})
		end
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
