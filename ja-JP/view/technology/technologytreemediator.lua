slot0 = class("TechnologyTreeMediator", import("..base.ContextMediator"))

function slot0.register(slot0)
	slot0:bind(TechnologyConst.OPEN_SHIP_BUFF_DETAIL, function (slot0, slot1, slot2, slot3)
		slot7.mediator = SingleBuffDetailMediator
		slot7.viewComponent = SingleBuffDetailLayer
		slot8.groupID = slot1
		slot8.maxLV = slot2
		slot8.star = slot3
		slot7.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(TechnologyConst.CLOSE_TECHNOLOGY_NATION_LAYER, function (slot0)
		uv0:sendNotification(TechnologyConst.CLOSE_TECHNOLOGY_NATION_LAYER_NOTIFICATION)
	end)
	slot0:bind(TechnologyConst.OPEN_TECHNOLOGY_NATION_LAYER, function (slot0)
		slot4.mediator = TechnologyTreeNationMediator
		slot4.viewComponent = TechnologyTreeNationScene
		slot4.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(TechnologyConst.OPEN_ALL_BUFF_DETAIL, function (slot0)
		slot4.mediator = AllBuffDetailMediator
		slot4.viewComponent = AllBuffDetailLayer
		slot5.LayerWeightMgr_weight = LayerWeightConst.TOP_LAYER
		slot4.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = TechnologyConst.UPDATE_REDPOINT_ON_TOP

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == TechnologyConst.UPDATE_REDPOINT_ON_TOP then
		slot0.viewComponent:refreshRedPoint(getProxy(TechnologyNationProxy):getShowRedPointTag())
	end
end

return slot0
