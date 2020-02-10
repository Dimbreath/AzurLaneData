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

	slot5 = getProxy(FleetProxy):getFleetById(1)

	slot0.viewComponent:SetFleet(getProxy(MilitaryExerciseProxy):getExerciseFleet())
	slot0:bind(uv0.OPEN_SHIP_INFO, function (slot0, slot1, slot2, slot3)
		uv0.contextData.number = slot2.id
		uv0.contextData.toggle = slot3

		for slot8, slot9 in ipairs(slot2:getShipIds()) do
			table.insert({}, uv0.ships[slot9])
		end

		uv0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = slot1,
			shipVOs = slot4
		})
	end)
	slot0:bind(uv0.COMMIT_FLEET, function (slot0, slot1)
		uv0:save(nil, slot1)
	end)
	slot0:bind(uv0.CHANGE_FLEET_SHIPS_ORDER, function (slot0, slot1)
		uv0:save(slot1)
		uv0:refreshView()
	end)
	slot0:bind(uv0.REMOVE_SHIP, function (slot0, slot1, slot2)
		slot2:removeShip(slot1)
		uv0:save(slot2)
		uv0:refreshView()
	end)
	slot0:bind(uv0.CHANGE_FLEET_SHIP, function (slot0, slot1, slot2)
		slot4 = nil

		if (slot1 and slot1.id or 0) ~= 0 then
			slot4 = slot3
		end

		slot5 = uv0:getSeasonInfo()
		slot7 = slot5:getVanguardShipIds()
		slot8 = {}

		if slot2 == TeamType.Main then
			function (slot0)
				uv0 = Clone(slot0)

				if uv1 then
					for slot4, slot5 in ipairs(uv0) do
						if slot5 == uv1 then
							table.removebyvalue(uv0, uv1)
						end
					end
				end
			end(slot5:getMainShipIds())
		elseif slot2 == TeamType.Vanguard then
			slot9(slot7)
		end

		for slot14, slot15 in pairs(getProxy(BayProxy):getRawData()) do
			if slot15:isActivityNpc() and not table.contains(slot8, slot15.id) then
				table.insert(slot8, slot15.id)
			end
		end

		slot17.onSelected, slot17.onShip = uv1.configDockYardFunc(uv1.ships, slot6, slot7, slot4, slot2, function (slot0, slot1)
			uv0:sendNotification(GAME.UPDATE_EXERCISE_FLEET, {
				fleet = slot0,
				callback = slot1
			})

			slot0 = nil
		end)
		slot13 = uv1

		slot13.sendNotification(slot13, GAME.GO_SCENE, SCENE.DOCKYARD, {
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
		slot2 = {
			mainShips = slot0,
			vanguardShips = uv3
		}

		if #slot0 > 0 then
			if uv1 == TeamType.Main then
				function (slot0)
					if not uv0 then
						for slot4, slot5 in ipairs(_.reverse(slot0)) do
							if not table.contains(uv1, slot5) then
								table.insert(uv1, 1, slot5)
							end
						end
					elseif uv0 and table.getCount(uv1) == 0 then
						for slot4, slot5 in ipairs(slot0) do
							if slot5 ~= uv0 and not table.contains(uv1, slot5) then
								table.insert(uv1, slot5)
							end
						end
					elseif uv0 then
						for slot4, slot5 in ipairs(slot0) do
							if slot5 == uv0 then
								slot0[slot4] = uv1[1]
							end
						end

						uv1 = slot0
					end
				end(uv2)
			elseif uv1 == TeamType.Vanguard then
				slot3(uv3)

				slot2.mainShips = uv2
				slot2.vanguardShips = slot0
			end

			if uv4 then
				uv4(slot2, slot1)
			end
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("exercise_clear_fleet_tip"),
				onYes = function ()
					if uv0 == TeamType.Main then
						uv1(uv2)

						uv3.mainShips = uv4
						uv3.vanguardShips = uv5
					elseif uv0 == TeamType.Vanguard then
						uv1(uv5)

						uv3.mainShips = uv2
						uv3.vanguardShips = uv4
					end

					if uv6 then
						uv6(uv3, uv7)
					end
				end,
				onNo = function ()
					uv0.mainShips = uv1
					uv0.vanguardShips = uv2

					if uv3 then
						uv3(uv0, uv4)
					end
				end
			})
		end
	end, function (slot0, slot1, slot2)
		slot3 = pg.ship_data_template[slot0.configId].group_type

		if uv2 == TeamType.Main then
			if not function (slot0)
				for slot4, slot5 in ipairs(slot0) do
					slot6 = pg.ship_data_template[uv0[slot5].configId].group_type

					if (not uv1 or uv1 ~= slot5 or slot6 ~= uv2) and slot6 == uv2 then
						return false
					end
				end

				return true
			end(uv3) then
				return false, i18n("ship_vo_mainFleet_exist_same_ship")
			end
		elseif uv2 == TeamType.Vanguard and not slot4(uv4) then
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
	if GAME.EXERCISE_FLEET_RESET == slot1:getName() then
		slot0.viewComponent:SetFleet(slot1:getBody())
		slot0.viewComponent:UpdateFleetView(true)
	end
end

return slot0
