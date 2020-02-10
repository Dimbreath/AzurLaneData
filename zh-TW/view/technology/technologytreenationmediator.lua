slot0 = class("TechnologyTreeNationMediator", import("..base.ContextMediator"))

function slot0.register(slot0)
	slot0:bind(TechnologyConst.CLICK_UP_TEC_BTN, function (slot0, slot1, slot2)
		slot6.tecID = slot1
		slot6.levelID = slot2

		uv0:sendNotification(GAME.START_CAMP_TEC, {})
	end)
	slot0:bind(TechnologyConst.FINISH_UP_TEC, function (slot0, slot1, slot2)
		slot6.tecID = slot1
		slot6.levelID = slot2

		uv0:sendNotification(GAME.FINISH_CAMP_TEC, {})
	end)
	slot0:bind(TechnologyConst.OPEN_ALL_BUFF_DETAIL, function ()
		slot3.mediator = AllBuffDetailMediator
		slot3.viewComponent = AllBuffDetailLayer
		slot3.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = TechnologyConst.START_TEC_BTN_SUCCESS
	slot1[2] = TechnologyConst.FINISH_TEC_SUCCESS
	slot1[3] = TechnologyConst.CLOSE_TECHNOLOGY_NATION_LAYER_NOTIFICATION

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == TechnologyConst.START_TEC_BTN_SUCCESS then
		slot0.viewComponent:updateTecListData()
		slot0.viewComponent:updateTecItem(slot1:getBody())
	elseif slot2 == TechnologyConst.FINISH_TEC_SUCCESS then
		slot0.viewComponent:updateTecListData()
		slot0.viewComponent:updateTecItem(slot3)
	elseif slot2 == TechnologyConst.CLOSE_TECHNOLOGY_NATION_LAYER_NOTIFICATION then
		slot0.viewComponent:closeMyself()
	end
end

return slot0
