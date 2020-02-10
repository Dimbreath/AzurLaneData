slot0 = class("ResolveEquipmentMediator", import("..base.ContextMediator"))
slot0.ON_RESOLVE = "ResolveEquipmentMediator:ON_RESOLVE"

function slot0.register(slot0)
	slot0:bind(uv0.ON_RESOLVE, function (slot0, slot1)
		slot5.equipments = slot1

		uv0:sendNotification(GAME.DESTROY_EQUIPMENTS, {})
	end)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
	slot0.viewComponent:setEquipments(slot0.contextData.Equipments)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.DESTROY_EQUIPMENTS_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.DESTROY_EQUIPMENTS_DONE and table.getCount(slot3) ~= 0 then
		slot7.items = slot3

		slot0.viewComponent:emit(BaseUI.ON_AWARD, {}, AwardInfoLayer.TITLE.ITEM, function ()
			uv0.viewComponent:emit(BaseUI.ON_CLOSE)
		end)
	end
end

return slot0
