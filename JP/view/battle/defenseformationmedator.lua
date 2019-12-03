slot0 = class("DefenseFormationMedator", import("..base.ContextMediator"))
slot0.OPEN_SHIP_INFO = "DefenseFormationMedator:OPEN_SHIP_INFO"
slot0.ON_CHANGE_FLEET = "DefenseFormationMedator:ON_CHANGE_FLEET"
slot0.CHANGE_FLEET_NAME = "DefenseFormationMedator:CHANGE_FLEET_NAME"
slot0.CHANGE_FLEET_SHIP = "DefenseFormationMedator:CHANGE_FLEET_SHIP"
slot0.REMOVE_SHIP = "DefenseFormationMedator:REMOVE_SHIP"
slot0.CHANGE_FLEET_FORMATION = "DefenseFormationMedator:CHANGE_FLEET_FORMATION"
slot0.CHANGE_FLEET_SHIPS_ORDER = "DefenseFormationMedator:CHANGE_FLEET_SHIPS_ORDER"
slot0.COMMIT_FLEET = "DefenseFormationMedator:COMMIT_FLEET"

function slot0.register(slot0)
	slot1 = getProxy(BayProxy)

	slot1:setSelectShipId(nil)

	slot0.ships = slot1:getRawData()

	slot0.viewComponent:setShips(slot0.ships)

	slot5 = getProxy(FleetProxy).getFleetById(slot4, 1)

	slot0.viewComponent:SetFleet(slot3)
	slot0:bind(slot0.OPEN_SHIP_INFO, function (slot0, slot1, slot2, slot3)
		slot0.contextData.number = slot2.id
		slot0.contextData.toggle = slot3
		slot4 = {}

		for slot8, slot9 in ipairs(slot2:getShipIds()) do
			table.insert(slot4, slot0.ships[slot9])
		end

		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = slot1,
			shipVOs = slot4
		})
	end)
	slot0:bind(slot0.COMMIT_FLEET, function (slot0, slot1)
		slot0:save(nil, slot1)
	end)
	slot0:bind(slot0.CHANGE_FLEET_SHIPS_ORDER, function (slot0, slot1)
		slot0:save(slot1)
		slot0:refreshView()
	end)
	slot0:bind(slot0.REMOVE_SHIP, function (slot0, slot1, slot2)
		slot2:removeShip(slot1)
		slot0:save(slot2)
		slot0:refreshView()
	end)
	slot0:bind(slot0.CHANGE_FLEET_SHIP, function (slot0, slot1, slot2)
		slot4 = nil

		if ((slot1 and slot1.id) or 0) ~= 0 then
			slot4 = slot3
		end

		slot5 = slot0:getSeasonInfo()
		slot6 = slot5:getMainShipIds()
		slot7 = slot5:getVanguardShipIds()
		slot8 = {}

		function slot9(slot0)
			slot0 = Clone(slot0)

			if Clone(slot0) then
				for slot4, slot5 in ipairs(slot0) do
					if slot5 == slot1 then
						table.removebyvalue(slot0, slot1)
					end
				end
			end
		end

		if slot2 == TeamType.Main then
			slot9(slot6)
		elseif slot2 == TeamType.Vanguard then
			slot9(slot7)
		end

		for slot14, slot15 in pairs(slot10) do
			if slot15:isActivityNpc() and not table.contains(slot8, slot15.id) then
				table.insert(slot8, slot15.id)
			end
		end

		slot17.onSelected, slot17.onShip = slot1.configDockYardFunc(slot1.ships, slot6, slot7, slot4, slot2, function (slot0, slot1)
			slot0:sendNotification(GAME.UPDATE_EXERCISE_FLEET, {
				fleet = slot0,
				callback = slot1
			})

			slot0 = nil
		end)

		slot1:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			callbackQuit = true,
			selectedMax = 1,
			activeShipId = slot4,
			quitTeam = slot3 ~= 0,
			teamFilter = slot2,
			ignoredIds = slot8,
			flags = {
				inExercise = true,
				inChapter = false,
				inPvp = false,
				inFleet = false,
				inClass = false,
				inTactics = false,
				inBackyard = false,
				inSham = false,
				inEvent = false,
				inAdmiral = true
			},
			leftTopInfo = i18n("word_formation"),
			onShip = slot12,
			onSelected = slot11
		})
	end)
end

function slot0.refreshView(slot0, slot1)
	slot0.viewComponent:UpdateFleetView(slot1)
end

function slot0.save(slot0, slot1, slot2)
	if slot1 then
		slot0:sendNotification(GAME.UPDATE_EXERCISE_FLEET, {
			fleet = slot1,
			callback = slot2
		})
	elseif slot2 then
		slot2()
	end
end

function slot0.configDockYardFunc(slot0, slot1, slot2, slot3, slot4, slot5)
	return function (slot0, slot1)
		slot2 = {}

		function slot3(slot0)
			if not slot0 then
				for slot4, slot5 in ipairs(_.reverse(slot0)) do
					if not table.contains(slot1, slot5) then
						table.insert(slot1, 1, slot5)
					end
				end
			elseif slot0 and table.getCount(table.getCount) == 0 then
				for slot4, slot5 in ipairs(slot0) do
					if slot5 ~= slot0 and not table.contains(slot1, slot5) then
						table.insert(slot1, slot5)
					end
				end
			elseif slot0 then
				for slot4, slot5 in ipairs(slot0) do
					if slot5 == slot0 then
						slot0[slot4] = slot1[1]
					end
				end

				slot1 = slot0
			end
		end

		if #slot0 > 0 then
			if slot1 == TeamType.Main then
				slot3(slot2)

				slot2.mainShips = slot0
				slot2.vanguardShips = slot3
			elseif slot1 == TeamType.Vanguard then
				slot3(slot3)

				slot2.mainShips = slot2
				slot2.vanguardShips = slot0
			end

			if slot4 then
				slot4(slot2, slot1)
			end
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("exercise_clear_fleet_tip"),
				onYes = function ()
					if slot0 == TeamType.Main then
						slot1(slot2)

						slot3.mainShips = slot4
						slot3.vanguardShips = slot5
					elseif slot0 == TeamType.Vanguard then
						slot1(slot5)

						slot3.mainShips = slot2
						slot3.vanguardShips = slot4
					end

					if slot6 then
						slot6(slot3, slot7)
					end
				end,
				onNo = function ()
					slot0.mainShips = slot1
					slot0.vanguardShips = slot2

					if slot3 then
						slot3(slot3, slot4)
					end
				end
			})
		end
	end, function (slot0, slot1, slot2)
		slot3 = pg.ship_data_template[slot0.configId].group_type

		function slot4(slot0)
			for slot4, slot5 in ipairs(slot0) do
				slot6 = pg.ship_data_template[slot0[slot5].configId].group_type

				if (not slot1 or slot1 ~= slot5 or slot6 ~= slot2) and slot6 == slot2 then
					return false
				end
			end

			return true
		end

		if slot2 == TeamType.Main then
			if not slot4(slot3) then
				return false, i18n("ship_vo_mainFleet_exist_same_ship")
			end
		elseif slot2 == TeamType.Vanguard and not slot4(slot4) then
			return false, i18n("ship_vo_vanguardFleet_exist_same_ship")
		end

		return true
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.EXERCISE_FLEET_RESET
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if GAME.EXERCISE_FLEET_RESET == slot1:getName() then
		slot0.viewComponent:SetFleet(slot3)
		slot0.viewComponent:UpdateFleetView(true)
	end
end

return slot0
