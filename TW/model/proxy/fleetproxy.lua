slot0 = class("FleetProxy", import(".NetProxy"))
slot0.FLEET_ADDED = "fleet added"
slot0.FLEET_UPDATED = "fleet updated"
slot0.FLEET_RENAMED = "fleet renamed"
slot0.PVP_FLEET_ID = 101

slot0.register = function (slot0)
	slot0.activityFleetData = {}

	slot0:on(12101, function (slot0)
		slot0.data = {}

		for slot4, slot5 in ipairs(slot0.group_list) do
			slot6 = Fleet.New(slot5)

			slot6:display("loaded")

			slot0.data[slot6.id] = slot6
		end

		for slot4 = 1, FormationUI.MAX_FLEET_NUM, 1 do
			if not slot0.data[slot4] then
				slot0.data[slot4] = Fleet.New({
					name = "",
					id = slot4,
					ship_list = {},
					commanders = {}
				})
			end
		end

		if not slot0.data[slot1.PVP_FLEET_ID] then
			slot0.data[slot1.PVP_FLEET_ID] = Fleet.New({
				name = "",
				id = slot1.PVP_FLEET_ID,
				ship_list = {},
				commanders = {}
			})
		end

		if LOCK_SUBMARINE then
			for slot4, slot5 in pairs(slot0.data) do
				if slot5.id == 11 or slot5.id == 12 then
					slot0.data[slot4] = nil
				end
			end
		end
	end)
	slot0:on(12106, function (slot0)
		if slot0.data[Fleet.New(slot0.group).id] then
			slot0:updateFleet(slot1)
		else
			slot0:addFleet(slot1)
		end
	end)
end

slot0.addFleet = function (slot0, slot1)
	slot0.data[slot1.id] = slot1:clone()

	slot0.data[slot1.id]:display("added")
	slot0.facade:sendNotification(slot0.FLEET_ADDED, slot1:clone())
end

slot0.updateFleet = function (slot0, slot1)
	slot0.data[slot1.id] = slot1:clone()

	slot0.data[slot1.id]:display("updated")
	slot0.facade:sendNotification(slot0.FLEET_UPDATED, slot1.id)
end

slot0.saveEdittingFleet = function (slot0)
	if slot0.editSrcCache == nil then
		slot0.editSrcCache = Clone(slot0.data)
	end

	if slot0.EdittingFleet ~= nil then
		slot0.data[slot0.EdittingFleet.id] = slot0.EdittingFleet
	end
end

slot0.commitEdittingFleet = function (slot0, slot1)
	if slot0.EdittingFleet ~= nil then
		slot0.facade:sendNotification(GAME.UPDATE_FLEET, {
			fleet = slot0.EdittingFleet,
			callback = function ()
				slot0.editSrcCache = nil
				slot0.EdittingFleet = nil

				if nil then
					slot1()
				end
			end
		})
	elseif slot1 then
		slot1()
	end
end

slot0.abortEditting = function (slot0)
	if slot0.editSrcCache then
		slot0.data = slot0.editSrcCache
		slot0.editSrcCache = nil
	end

	slot0.EdittingFleet = nil
end

slot0.syncFleet = function (slot0)
	for slot4, slot5 in ipairs(slot0.data) do
		slot0.facade:sendNotification(GAME.UPDATE_FLEET, {
			fleet = slot5
		})
	end
end

slot0.getCount = function (slot0)
	return table.getCount(slot0.data)
end

slot0.getFleetById = function (slot0, slot1)
	if slot0.data[slot1] ~= nil then
		return slot0.data[slot1]:clone()
	end

	return nil
end

slot0.getAllShipIds = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		for slot10, slot11 in ipairs(slot6.ships) do
			table.insert(slot1, slot11)
		end
	end

	return slot1
end

slot0.getFirstFleetShipCount = function (slot0)
	slot1 = 0

	for slot5, slot6 in ipairs(slot0.data[1].ships) do
		slot1 = slot1 + 1
	end

	return slot1
end

slot0.inPvpFleet = function (slot0, slot1)
	if slot0.data[FleetProxy.PVP_FLEET_ID]:containShip(slot1) then
		return true
	end

	return false
end

slot0.getFleetByShip = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.data) do
		if slot6:containShip(slot1) then
			return slot6:clone()
		end
	end

	return nil
end

slot0.renameFleet = function (slot0, slot1, slot2)
	slot3 = slot0:getFleetById(slot1)
	slot3.name = slot2

	slot0:updateFleet(slot3)
	slot0.facade:sendNotification(slot0.FLEET_RENAMED, slot3:clone())
end

slot0.getCommandersInFleet = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		for slot10, slot11 in pairs(slot6:getCommanders()) do
			table.insert(slot1, slot11.id)
		end
	end

	return slot1
end

slot0.getCommanders = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		for slot10, slot11 in pairs(slot6:getCommanders()) do
			table.insert(slot1, {
				fleetId = slot6.id,
				pos = slot10,
				commanderId = slot11.id
			})
		end
	end

	return slot1
end

slot0.getActivityFleets = function (slot0)
	return slot0.activityFleetData
end

slot0.addActivityFleet = function (slot0, slot1, slot2)
	if not slot0.activityFleetData[slot1] then
		slot0.activityFleetData[slot1] = {}
	end

	slot3 = slot0.activityFleetData[slot1]
	slot4 = getProxy(BayProxy)
	slot5 = nil

	for slot9, slot10 in ipairs(slot2) do
		slot3[Fleet.New(slot10).id] = Fleet.New(slot10)

		for slot15, slot16 in ipairs(slot10.ship_list) do
			if not slot4:getShipById(slot16) then
				slot5 = true

				break
			end
		end
	end

	if slot5 then
		slot0:commitActivityFleet(slot1)
	end

	slot6, slot7 = nil

	if pg.activity_template[slot1].type == ActivityConst.ACTIVITY_TYPE_CHALLENGE then
		slot6 = 2
		slot7 = 2
	else
		slot6 = pg.activity_event_worldboss[slot8.config_id].group_num
		slot7 = pg.activity_event_worldboss[slot8.config_id].submarine_num
	end

	slot9 = 0

	while slot6 > slot9 do
		if slot3[slot9 + 1] == nil then
			slot3[slot9] = Fleet.New({
				id = slot9,
				ship_list = {}
			})
		end
	end

	slot9 = 0

	while slot7 > slot9 do
		if slot3[Fleet.SUBMARINE_FLEET_ID + slot9] == nil then
			slot3[slot10] = Fleet.New({
				id = slot10,
				ship_list = {}
			})
		end

		slot9 = slot9 + 1
	end
end

slot0.updateActivityFleet = function (slot0, slot1, slot2, slot3)
	slot0.activityFleetData[slot1][slot2] = slot3
end

slot0.commitActivityFleet = function (slot0, slot1)
	slot0.editSrcCache = nil
	slot0.EdittingFleet = nil

	slot0.facade:sendNotification(GAME.EDIT_ACTIVITY_FLEET, {
		actID = slot1,
		fleets = slot0.activityFleetData[slot1]
	})
end

slot0.checkActivityFleet = function (slot0, slot1)
	for slot6, slot7 in pairs(slot2) do
		if slot6 < Fleet.SUBMARINE_FLEET_ID and slot7:isLegalToFight() == true then
			return true
		end
	end

	return false
end

slot0.removeActivityFleetCommander = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.activityFleetData) do
		for slot10, slot11 in pairs(slot6) do
			slot12 = false

			for slot17, slot18 in pairs(slot13) do
				if slot1 == slot18.id then
					slot11:updateCommanderByPos(slot17, nil)
					slot11:updateCommanderSkills()
					slot0:updateActivityFleet(slot5, slot10, slot11)
					slot0:commitActivityFleet(slot5)

					slot12 = true

					break
				end
			end

			if slot12 then
				break
			end
		end
	end
end

return slot0
