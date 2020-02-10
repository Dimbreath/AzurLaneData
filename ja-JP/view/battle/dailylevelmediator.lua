slot0 = class("DailyLevelMediator", import("..base.ContextMediator"))
slot0.ON_STAGE = "DailyLevelMediator:ON_STAGE"
slot0.ON_CHALLENGE = "DailyLevelMediator:ON_CHALLENGE"
slot0.ON_RESET_CHALLENGE = "DailyLevelMediator:ON_RESET_CHALLENGE"
slot0.ON_CONTINUE_CHALLENGE = "DailyLevelMediator:ON_CONTINUE_CHALLENGE"
slot0.ON_CHALLENGE_EDIT_FLEET = "DailyLevelMediator:ON_CHALLENGE_EDIT_FLEET"
slot0.ON_REQUEST_CHALLENGE = "DailyLevelMediator:ON_REQUEST_CHALLENGE"
slot0.ON_CHALLENGE_FLEET_CLEAR = "DailyLevelMediator.ON_CHALLENGE_FLEET_CLEAR"
slot0.ON_CHALLENGE_FLEET_RECOMMEND = "DailyLevelMediator.ON_CHALLENGE_FLEET_RECOMMEND"
slot0.ON_CHALLENGE_OPEN_DOCK = "DailyLevelMediator:ON_CHALLENGE_OPEN_DOCK"
slot0.ON_CHALLENGE_OPEN_RANK = "DailyLevelMediator:ON_CHALLENGE_OPEN_RANK"

function slot0.register(slot0)
	slot0.viewComponent:setDailyCounts(getProxy(DailyLevelProxy):getRawData())

	slot2 = getProxy(BayProxy)

	slot2:setSelectShipId(nil)

	slot0.ships = slot2:getRawData()

	slot0.viewComponent:setShips(slot0.ships)
	slot0.viewComponent:updateRes(getProxy(PlayerProxy):getData())
	slot0:bind(uv0.ON_STAGE, function (slot0, slot1)
		uv0.dailyLevelId = uv1.contextData.dailyLevelId
		slot2 = PreCombatLayer
		slot3 = SYSTEM_ROUTINE

		if pg.expedition_data_template[slot1.id].type == Stage.SubmarinStage then
			slot2 = PreCombatLayerSubmarine
			slot3 = SYSTEM_SUB_ROUTINE
		end

		slot8.mediator = PreCombatMediator
		slot8.viewComponent = slot2
		slot9.stageId = slot1.id
		slot9.system = slot3
		slot8.data = {}

		uv1:addSubLayers(Context.New({}))
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = PlayerProxy.UPDATED

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:updateRes(slot1:getBody())
	end
end

return slot0
