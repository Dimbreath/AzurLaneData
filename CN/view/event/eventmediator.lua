EventConst = require("view/event/EventConst")
slot0 = class("EventMediator", import("..base.ContextMediator"))

function slot0.register(slot0)
	slot0:bind(EventConst.EVENT_LIST_UPDATE, function (slot0)
		slot0:updateEventList(true)
	end)
	slot0:bind(EventConst.EVENT_OPEN_DOCK, function (slot0, slot1)
		slot4 = {}

		for slot8, slot9 in pairs(slot3) do
			if not table.contains(slot1.template.ship_type, slot9:getShipType()) or slot9:isActivityNpc() then
				table.insert(slot4, slot8)
			end
		end

		getProxy(EventProxy).selectedEvent = slot1
		slot16.onShip, slot16.confirmSelect, slot16.onSelected, slot16.onPassShip, slot16.onRemoveShip = slot0:getDockCallbackFuncs()

		slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMin = 1,
			skipSelect = true,
			selectedMax = 6,
			ignoredIds = slot4,
			selectedIds = (getProxy(EventProxy).selectedEvent and slot5.selectedEvent.shipIds) or {},
			onShip = slot6,
			confirmSelect = slot7,
			onSelected = slot8,
			onRemoveShip = slot10,
			onPassShip = slot9,
			leftTopInfo = i18n("word_operation"),
			flags = {
				inExercise = true,
				inChapter = true,
				inPvp = true,
				inFleet = true,
				inClass = false,
				inTactics = false,
				inBackyard = false,
				inSham = true,
				inEvent = true,
				inAdmiral = true
			},
			blackBlockShipIds = slot2:getBlackBlackShipIds(slot0.__cname)
		})
	end)
	slot0:bind(EventConst.EVENT_FLUSH, function (slot0)
		if EventConst.MaxFlushTimes <= getProxy(EventProxy).flushTimes then
			pg.TipsMgr.GetInstance():ShowTips(i18n("event_flush_not_enough"))
		else
			slot2 = false

			for slot6, slot7 in ipairs(slot1.eventList) do
				if slot7.state ~= EventInfo.StateNone then
					slot2 = true

					break
				end
			end

			if slot2 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("event_confirm_flush"),
					onYes = function ()
						slot0:sendNotification(GAME.EVENT_FLUSH)
					end
				})
			else
				slot0:sendNotification(GAME.EVENT_FLUSH)
			end
		end
	end)
	slot0:bind(EventConst.EVENT_START, function (slot0, slot1)
		slot2 = getProxy(EventProxy)

		if not slot1:reachNum() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("event_minimus_ship_numbers", slot1.template.ship_num))
		elseif slot2.maxFleetNums <= slot2.busyFleetNums then
			pg.TipsMgr.GetInstance():ShowTips(i18n("event_fleet_busy"))
		elseif not slot1:reachLevel() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("event_level_unreached"))
		elseif not slot1:reachTypes() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("event_type_unreached"))
		else
			function slot3()
				slot0:sendNotification(GAME.EVENT_START, {
					id = slot1.id,
					shipIds = slot1.shipIds
				})
			end

			if slot1:getOilConsume() > 0 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("event_oil_consume", slot4),
					onYes = function ()
						slot0()
					end
				})
			else
				slot3()
			end
		end
	end)
	slot0:bind(EventConst.EVENT_GIVEUP, function (slot0, slot1)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("event_confirm_giveup"),
			onYes = function ()
				slot0:sendNotification(GAME.EVENT_GIVEUP, {
					id = slot1.id
				})
			end
		})
	end)
	slot0:bind(EventConst.EVENT_FINISH, function (slot0, slot1)
		slot0:sendNotification(GAME.EVENT_FINISH, {
			id = slot1.id
		})
	end)
	slot0:bind(EventConst.EVENT_RECOMMEND, function (slot0, slot1)
		getProxy(EventProxy).selectedEvent = slot1

		getProxy(EventProxy):fillRecommendShip(slot1)
		slot0:updateEventList(true, true)

		getProxy(EventProxy).selectedEvent = nil

		if not slot1:reachNum() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("event_recommend_fail"))
		end
	end)
	slot0:updateEventList(false)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.EVENT_LIST_UPDATE,
		GAME.EVENT_SHOW_AWARDS,
		EventProxy.EVENT_FLUSHTIMES_UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.EVENT_LIST_UPDATE then
		slot0:updateEventList(true)
	else
		if slot2 == GAME.EVENT_SHOW_AWARDS then
			slot4 = nil

			coroutine.wrap(function ()
				if #slot0.oldShips > 0 then
					slot1.viewComponent:emit(BaseUI.ON_SHIP_EXP, {
						title = pg.collection_template[slot0.eventId].title,
						oldShips = slot0.oldShips,
						newShips = slot0.newShips,
						isCri = slot0.isCri
					}, )
					coroutine.yield()
				end

				slot1.viewComponent:emit(BaseUI.ON_ACHIEVE, slot0.awards)
			end)()

			return
		end

		if EventProxy.EVENT_FLUSHTIMES_UPDATED == slot2 then
			slot4 = getProxy(EventProxy)

			slot0.viewComponent:updateFlushTimes(getProxy(EventProxy))
		end
	end
end

function slot0.updateEventList(slot0, slot1, slot2)
	slot3 = getProxy(BayProxy)
	getProxy(EventProxy).virgin = false

	table.sort(slot5, function (slot0, slot1)
		if slot0.state ~= slot1.state then
			return slot1.state < slot0.state
		elseif slot0.template.type ~= slot1.template.type then
			return slot1.template.type < slot0.template.type
		elseif slot0.template.lv ~= slot1.template.lv then
			return slot1.template.lv < slot0.template.lv
		else
			return slot1.id < slot0.id
		end
	end)

	for slot9, slot10 in ipairs(slot5) do
		slot10.ships = {}

		if slot10.state == EventInfo.StateNone and slot10 ~= slot4.selectedEvent then
			slot10.shipIds = {}
		else
			for slot14 = #slot10.shipIds, 1, -1 do
				if slot3:getShipById(slot10.shipIds[slot14]) then
					table.insert(slot10.ships, 1, slot15)
				else
					table.remove(slot10.shipIds, slot14)
				end
			end
		end
	end

	slot4.busyFleetNums = slot4:countBusyFleetNums()

	slot0.viewComponent:updateAll(slot4, slot1, slot2)
end

function slot0.getDockCallbackFuncs(slot0)
	return function (slot0, slot1, slot2)
		slot3, slot4 = Ship.ShipStateConflict("inEvent", slot0)

		if slot3 == Ship.STATE_CHANGE_FAIL then
			return false, i18n(slot4)
		elseif slot3 == Ship.STATE_CHANGE_CHECK then
			return Ship.ChangeStateCheckBox(slot4, slot0, slot1)
		end

		slot5 = getProxy(BayProxy)

		for slot9, slot10 in ipairs(slot2) do
			if slot0:isSameKind(slot5:getShipById(slot10)) then
				return false, i18n("event_same_type_not_allowed")
			end
		end

		return true
	end, function (slot0, slot1, slot2)
		slot1()
	end, function (slot0)
		getProxy(EventProxy).selectedEvent.shipIds = slot0
	end, function (slot0, slot1)
		slot2 = {}

		for slot6, slot7 in pairs(slot1) do
			if slot0.id ~= slot7.id and slot7:isSameKind(slot0) then
				slot7.blackBlock = true

				table.insert(slot2, slot7.id)
			end
		end

		return slot2
	end, function (slot0, slot1)
		slot2 = {}

		for slot6, slot7 in pairs(slot1) do
			if slot0.id ~= slot7.id and not slot7.inEvent and slot7:isSameKind(slot0) and slot7.blackBlock then
				table.insert(slot2, slot7.id)

				slot7.blackBlock = nil
			end
		end

		return slot2
	end
end

return slot0
