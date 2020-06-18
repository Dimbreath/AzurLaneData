pg = pg or {}
slot0 = pg
slot0.ShipFlagMgr = singletonClass("ShipFlagMgr")
slot1 = slot0.ShipFlagMgr

function slot1.Init(slot0, slot1)
	slot0.flagDic = {}

	table.foreachi(ShipStatus.flagList, function (slot0, slot1)
		uv0.flagDic[slot1] = {}
	end)
	print("initializing ShipFlagMgr manager...")
	slot1()
end

slot2 = {
	inChapter = function ()
		return getProxy(ChapterProxy):getActiveChapter() and _.map(slot1:getShips(), function (slot0)
			return slot0.id
		end) or {}
	end,
	inFleet = function ()
		return getProxy(FleetProxy):getAllShipIds(true)
	end,
	inElite = function ()
		slot1 = {}
		slot2 = {}

		for slot6, slot7 in pairs(getProxy(ChapterProxy).mapEliteFleetCache) do
			for slot11, slot12 in ipairs(_.flatten(slot7)) do
				table.insert(slot1, slot12)
				table.insert(slot2, slot6)
			end
		end

		return slot1, slot2
	end,
	inActivity = function ()
		slot2 = {}
		slot3 = {}

		for slot7, slot8 in pairs(getProxy(FleetProxy):getActivityFleets()) do
			slot12 = _.values(slot8)

			function slot13(slot0)
				return slot0.ships
			end

			for slot12, slot13 in ipairs(_.flatten(_.map(slot12, slot13))) do
				table.insert(slot2, slot13)
				table.insert(slot3, slot7)
			end
		end

		return slot2, slot3
	end,
	inPvP = function ()
		return getProxy(FleetProxy):getFleetById(FleetProxy.PVP_FLEET_ID) and slot1:getShipIds() or {}
	end,
	inExercise = function ()
		return getProxy(MilitaryExerciseProxy):getExerciseFleet():getShipIds()
	end,
	inEvent = function ()
		return getProxy(EventProxy):getActiveShipIds()
	end,
	inClass = function ()
		return getProxy(NavalAcademyProxy):GetShipIDs()
	end,
	inTactics = function ()
		return _.map(getProxy(NavalAcademyProxy):getStudents(), function (slot0)
			return slot0.shipId
		end)
	end,
	inBackyard = function ()
		return getProxy(DormProxy):getRawData().shipIds
	end,
	inAdmiral = function ()
		return getProxy(PlayerProxy):getRawData().characters
	end,
	inWorld = function ()
		return _.map(getProxy(WorldProxy):GetWorld():GetShips(), function (slot0)
			return slot0.id
		end)
	end,
	isActivityNpc = function ()
		return getProxy(BayProxy).activityNpcShipIds
	end
}

function slot1.MarkShipsFlag(slot0, slot1, slot2, slot3)
	for slot7, slot8 in ipairs(slot2) do
		slot0.flagDic[slot1][slot8] = (slot3 or {})[slot7] or true
	end
end

function slot1.GetShipFlag(slot0, slot1, slot2)
	return slot0.flagDic[slot2][slot1]
end

function slot1.FilterShips(slot0, slot1, slot2)
	slot2 = slot2 or getProxy(BayProxy):getRawData()
	slot3 = {}

	for slot7, slot8 in pairs(slot1) do
		if slot8 then
			if type(slot8) == "boolean" then
				for slot12, slot13 in pairs(slot0.flagDic[slot7]) do
					if slot2[slot12] and slot13 then
						slot3[slot12] = true
					end
				end
			elseif type(slot8) == "number" then
				for slot12, slot13 in pairs(slot0.flagDic[slot7]) do
					if slot2[slot12] and slot8 == slot13 then
						slot3[slot12] = true
					end
				end
			end
		end
	end

	return _.keys(slot3)
end

function slot1.UpdateFlagShips(slot0, slot1)
	slot0.flagDic[slot1] = {}

	slot0:MarkShipsFlag(slot1, uv0[slot1]())
end

return slot1
