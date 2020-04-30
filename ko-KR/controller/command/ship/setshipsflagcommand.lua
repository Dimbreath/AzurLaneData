slot0 = class("SetShipsFlagCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot0.shipsById = slot1:getBody().shipsById
	slot0.flags = slot1.getBody().flags or {}
	slot3 = slot2.blackBlockShipIds or {}
	slot4 = slot2.callback

	for slot8, slot9 in pairs(slot0.shipsById) do
		slot0:clearShipAllFlag(slot8)
	end

	if defaultValue(slot0.flags.inChapter, true) and getProxy(ChapterProxy):getActiveChapter() then
		_.each(slot7:getShips(), function (slot0)
			slot0:setShipFlag(slot0.id, "inChapter", true)
		end)
	end

	if defaultValue(slot0.flags.inSham, false) and getProxy(ChapterProxy):getShamChapter() and slot8:isOpen() and slot8.active then
		_.each(slot8:getShips(), function (slot0)
			slot0:setShipFlag(slot0.id, "inSham", true)
		end)
	end

	slot8 = defaultValue(slot0.flags.inPvp, true)

	if defaultValue(slot0.flags.inFleet, true) then
		slot0.fleetShipIds = getProxy(FleetProxy).getAllShipIds(slot9)

		for slot13, slot14 in ipairs(slot0.fleetShipIds) do
			if slot0.shipsById[slot14] and (slot15:getFleetId() ~= FleetProxy.PVP_FLEET_ID or not not slot8) then
				slot0:setShipFlag(slot14, "inFleet", true)
			end
		end
	end

	if slot0.flags.inElite then
		for slot15, slot16 in ipairs(slot11) do
			for slot20, slot21 in ipairs(slot16) do
				slot0:setShipFlag(slot21, "inElite", true)
			end
		end
	end

	if slot0.flags.inActivity then
		slot10 = getProxy(FleetProxy).getActivityFleets(slot9)

		if type(slot0.flags.inActivity) == "number" then
			for slot15, slot16 in pairs(slot11) do
				for slot21, slot22 in ipairs(slot17) do
					slot0:setShipFlag(slot22, "inActivity", true)
				end
			end
		elseif type(slot0.flags.inActivity) == "boolean" then
			for slot14, slot15 in pairs(slot10) do
				for slot19, slot20 in pairs(slot15) do
					for slot25, slot26 in ipairs(slot21) do
						slot0:setShipFlag(slot26, "inActivity", true)
					end
				end
			end
		end
	end

	if defaultValue(slot0.flags.inBackyard, true) then
		for slot15, slot16 in pairs(slot11) do
			slot0:setShipFlag(slot15, "inBackyard", true)
		end
	end

	if defaultValue(slot0.flags.inClass, true) then
		slot0._inClassShipList = getProxy(NavalAcademyProxy).GetShipIDs(slot11)

		for slot15, slot16 in ipairs(slot0._inClassShipList) do
			slot0:setShipFlag(slot16, "inClass", true)
		end
	end

	if defaultValue(slot0.flags.inTactics, true) then
		for slot17, slot18 in pairs(slot13) do
			slot0:setShipFlag(slot18.shipId, "inTactics", true)
		end
	end

	if defaultValue(slot0.flags.inEvent, true) then
		for slot18, slot19 in ipairs(slot14) do
			slot0:setShipFlag(slot19, "inEvent", true)
		end
	end

	if defaultValue(slot0.flags.inAdmiral, true) then
		for slot18, slot19 in ipairs(getProxy(PlayerProxy).getRawData(slot14).characters) do
			slot0:setShipFlag(slot19, "inAdmiral", true)
		end
	end

	if defaultValue(slot0.flags.inExercise, true) then
		for slot20, slot21 in pairs(getProxy(MilitaryExerciseProxy).getExerciseFleet(slot15).vanguardShips) do
			slot0:setShipFlag(slot21, "inExercise", true)
		end

		for slot20, slot21 in pairs(slot16.mainShips) do
			slot0:setShipFlag(slot21, "inExercise", true)
		end
	end

	for slot18, slot19 in pairs(slot3) do
		slot0:setShipBlackBlock(slot19)
	end

	if slot4 then
		slot4(slot0.shipsById)
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
