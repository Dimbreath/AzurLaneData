slot0 = class("SetShipsFlagCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot0.shipsById = slot2.shipsById
	slot0.flags = slot2.flags or {}
	slot3 = slot2.blackBlockShipIds or {}

	for slot7, slot8 in pairs(slot0.shipsById) do
		slot0:clearShipAllFlag(slot7)
	end

	if defaultValue(slot0.flags.inChapter, true) then
		if getProxy(ChapterProxy):getActiveChapter() then
			_.each(slot6:getShips(), function (slot0)
				uv0:setShipFlag(slot0.id, "inChapter", true)
			end)
		end
	end

	if defaultValue(slot0.flags.inSham, false) then
		if getProxy(ChapterProxy):getShamChapter() and slot7:isOpen() and slot7.active then
			_.each(slot7:getShips(), function (slot0)
				uv0:setShipFlag(slot0.id, "inSham", true)
			end)
		end
	end

	slot7 = defaultValue(slot0.flags.inPvp, true)

	if defaultValue(slot0.flags.inFleet, true) then
		slot0.fleetShipIds = getProxy(FleetProxy):getAllShipIds()

		for slot12, slot13 in ipairs(slot0.fleetShipIds) do
			if slot0.shipsById[slot13] and (slot14:getFleetId() ~= FleetProxy.PVP_FLEET_ID or not not slot7) then
				slot0:setShipFlag(slot13, "inFleet", true)
			end
		end
	end

	if slot0.flags.inElite then
		for slot14, slot15 in ipairs(getProxy(ChapterProxy):getChapterById(slot0.flags.inElite):getEliteFleetList()) do
			for slot19, slot20 in ipairs(slot15) do
				slot0:setShipFlag(slot20, "inElite", true)
			end
		end
	end

	if slot0.flags.inActivity then
		slot9 = getProxy(FleetProxy):getActivityFleets()

		if type(slot0.flags.inActivity) == "number" then
			for slot14, slot15 in pairs(slot9[slot0.flags.inActivity]) do
				for slot20, slot21 in ipairs(slot15.ships) do
					slot0:setShipFlag(slot21, "inActivity", true)
				end
			end
		elseif type(slot0.flags.inActivity) == "boolean" then
			for slot13, slot14 in pairs(slot9) do
				for slot18, slot19 in pairs(slot14) do
					for slot24, slot25 in ipairs(slot19.ships) do
						slot0:setShipFlag(slot25, "inActivity", true)
					end
				end
			end
		end
	end

	if defaultValue(slot0.flags.inBackyard, true) then
		for slot14, slot15 in pairs(getProxy(DormProxy):getBackYardShips()) do
			slot0:setShipFlag(slot14, "inBackyard", true)
		end
	end

	if defaultValue(slot0.flags.inClass, true) then
		slot0._inClassShipList = getProxy(NavalAcademyProxy):GetShipIDs()

		for slot14, slot15 in ipairs(slot0._inClassShipList) do
			slot0:setShipFlag(slot15, "inClass", true)
		end
	end

	if defaultValue(slot0.flags.inTactics, true) then
		for slot16, slot17 in pairs(getProxy(NavalAcademyProxy):getStudents()) do
			slot0:setShipFlag(slot17.shipId, "inTactics", true)
		end
	end

	if defaultValue(slot0.flags.inEvent, true) then
		for slot17, slot18 in ipairs(getProxy(EventProxy):getActiveShipIds()) do
			slot0:setShipFlag(slot18, "inEvent", true)
		end
	end

	if defaultValue(slot0.flags.inAdmiral, true) then
		for slot17, slot18 in ipairs(getProxy(PlayerProxy):getRawData().characters) do
			slot0:setShipFlag(slot18, "inAdmiral", true)
		end
	end

	if defaultValue(slot0.flags.inExercise, true) then
		for slot19, slot20 in pairs(getProxy(MilitaryExerciseProxy):getExerciseFleet().vanguardShips) do
			slot0:setShipFlag(slot20, "inExercise", true)
		end

		for slot19, slot20 in pairs(slot15.mainShips) do
			slot0:setShipFlag(slot20, "inExercise", true)
		end
	end

	for slot17, slot18 in pairs(slot3) do
		slot0:setShipBlackBlock(slot18)
	end

	slot0:sendNotification(GAME.SET_SHIP_FLAG_DONE, {
		shipsById = slot0.shipsById
	})
end

function slot0.setShipBlackBlock(slot0, slot1)
	if slot0.shipsById[slot1] then
		slot2.blackBlock = true
	end
end

function slot0.setShipFlag(slot0, slot1, slot2, slot3)
	if slot0.shipsById[slot1] then
		slot4[slot2] = slot3
	end
end

function slot0.clearShipAllFlag(slot0, slot1)
	if slot0.shipsById[slot1] then
		slot2.inFleet = nil
		slot2.inChapter = nil
		slot2.inWorld = nil
		slot2.inEvent = nil
		slot2.inBackyard = nil
		slot2.inClass = nil
		slot2.inTactics = nil
		slot2.inExercise = nil
		slot2.inAdmiral = nil
		slot2.inSham = nil
		slot2.inElite = nil
		slot2.blackBlock = nil
		slot2.inActivity = nil
	end
end

return slot0
