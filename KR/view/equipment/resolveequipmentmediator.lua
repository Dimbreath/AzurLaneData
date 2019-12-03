slot0 = class("ResolveEquipmentMediator", import("..base.ContextMediator"))
slot0.ON_RESOLVE = "ResolveEquipmentMediator:ON_RESOLVE"

function slot0.register(slot0)
	slot0:bind(slot0.ON_RESOLVE, function (slot0, slot1)
		slot0:sendNotification(GAME.DESTROY_EQUIPMENTS, {
			equipments = slot1
		})
	end)
	slot0.viewComponent:setPlayer(slot1)
	slot0.viewComponent:setEquipments(slot0.contextData.Equipments)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.DESTROY_EQUIPMENTS_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.DESTROY_EQUIPMENTS_DONE and table.getCount(slot3) ~= 0 then
		slot0.viewComponent:emit(BaseUI.ON_AWARD, {
			items = slot3
		}, AwardInfoLayer.TITLE.ITEM, function ()
			slot0.viewComponent:emit(BaseUI.ON_CLOSE)
		end)
	end
end

return slot0
