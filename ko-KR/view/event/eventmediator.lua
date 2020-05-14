EventConst = require("view/event/EventConst")
slot0 = class("EventMediator", import("..base.ContextMediator"))

function slot0.register(slot0)
	slot0:bind(EventConst.EVEN_USE_PREV_FORMATION, function (slot0, slot1, slot2)
		slot3 = getProxy(EventProxy)
		slot6 = {}
		slot7 = false
		slot8 = false

		uv0:sendNotification(GAME.SET_SHIP_FLAG, {
			shipsById = getProxy(BayProxy):getData(),
			flags = uv0.contextData.flags or {},
			callback = function (slot0)
				for slot4, slot5 in ipairs(uv0) do
					if slot0[slot5] then
						slot7, slot8 = Ship.ShipStateConflict("inEvent", slot6)

						if slot7 == Ship.STATE_CHANGE_FAIL then
							uv1 = true
						elseif slot7 == Ship.STATE_CHANGE_CHECK then
							uv2 = true
						else
							table.insert(uv3, slot5)
						end
					end
				end

				if uv1 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("collect_tip"))
				end

				if uv2 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("collect_tip2"))
				end

				uv4.selectedEvent = uv5
				uv4.selectedEvent.shipIds = uv3

				uv6:updateEventList(true)

				uv4.selectedEvent = nil
			end
		})
	end)
	slot0:bind(EventConst.EVENT_LIST_UPDATE, function (slot0)
		uv0:updateEventList(true)
	end)
	slot0:bind(EventConst.EVENT_OPEN_DOCK, function (slot0, slot1)
		slot4 = {}

		for slot8, slot9 in pairs(getProxy(BayProxy):getRawData()) do
			if not table.contains(slot1.template.ship_type, slot9:getShipType()) or slot9:isActivityNpc() then
				table.insert(slot4, slot8)
			end
		end

		slot5 = getProxy(EventProxy)
		slot5.selectedEvent = slot1
		slot6, slot7, slot8, slot9, slot10 = uv0:getDockCallbackFuncs()

		uv0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMin = 1,
			skipSelect = true,
			selectedMax = 6,
			ignoredIds = slot4,
			selectedIds = slot5.selectedEvent and slot5.selectedEvent.shipIds or {},
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
			blackBlockShipIds = slot2:GetBlackBlockShipIDsForEvent()
		})
	end)
	slot0:bind(EventConst.EVENT_FLUSH_NIGHT, function (slot0)
		uv0:sendNotification(GAME.EVENT_FLUSH_NIGHT)
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
				uv0:sendNotification(GAME.EVENT_START, {
					id = uv1.id,
					shipIds = uv1.shipIds
				})
			end

			if slot1:getOilConsume() > 0 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("event_oil_consume", slot4),
					onYes = function ()
						uv0()
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
				uv0:sendNotification(GAME.EVENT_GIVEUP, {
					id = uv1.id
				})
			end
		})
	end)
	slot0:bind(EventConst.EVENT_FINISH, function (slot0, slot1)
		uv0:sendNotification(GAME.EVENT_FINISH, {
			id = slot1.id
		})
	end)
	slot0:bind(EventConst.EVENT_RECOMMEND, function (slot0, slot1)
		slot2 = getProxy(EventProxy)
		slot2.selectedEvent = slot1

		getProxy(EventProxy):fillRecommendShip(slot1)
		uv0:updateEventList(true, true)

		slot2.selectedEvent = nil

		if not slot1:reachNum() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("event_recommend_fail"))
		end
	end)
	slot0:updateEventList(false)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.EVENT_LIST_UPDATE,
		GAME.EVENT_SHOW_AWARDS
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.EVENT_LIST_UPDATE then
		slot0:updateEventList(true)
	elseif slot2 == GAME.EVENT_SHOW_AWARDS then
		slot4 = nil

		coroutine.wrap(function ()
			if #uv0.oldShips > 0 then
				uv1.viewComponent:emit(BaseUI.ON_SHIP_EXP, {
					title = pg.collection_template[uv0.eventId].title,
					oldShips = uv0.oldShips,
					newShips = uv0.newShips,
					isCri = uv0.isCri
				}, uv2)
				coroutine.yield()
			end

			uv1.viewComponent:emit(BaseUI.ON_ACHIEVE, uv0.awards)
		end)()
	end
end

function slot0.updateEventList(slot0, slot1, slot2)
	slot3 = getProxy(BayProxy)
	slot4 = getProxy(EventProxy)
	slot4.virgin = false
	slot5 = slot4.eventList

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

		for slot9, slot10 in ipairs(slot2) do
			if slot0:isSameKind(getProxy(BayProxy):getShipById(slot10)) then
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
