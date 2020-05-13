slot0 = class("ShamFleet", import(".ChapterFleet"))

function slot0.Ctor(slot0)
	slot0.id = 1
	slot0[TeamType.Vanguard] = {}
	slot0[TeamType.Main] = {}
	slot0.ships = {}
	slot0.stgPicked = {}
	slot0.stgId = 0
	slot0.line = {
		row = 0,
		column = 0
	}
	slot0.mirrors = nil
end

function slot0.fetchShipVO(slot0, slot1)
	if slot0.friendAssistShip and slot0.friendAssistShip.id == slot1 then
		return Clone(slot0.friendAssistShip)
	elseif slot0.mirrors then
		return Clone(slot0.mirrors[slot1])
	else
		return getProxy(BayProxy):getShipById(slot1)
	end
end

function slot0.updateShipMirrors(slot0, slot1)
	slot0.mirrors = slot1
end

function slot0.updateFriendShip(slot0, slot1)
	slot0.friendAssistShip = slot1
end

function slot0.update(slot0, slot1)
	_.each(slot1.strategy_list, function (slot0)
		uv0[slot0.id] = slot0.count
	end)

	slot0.stgPicked = {}
	slot0.stgIds = {
		slot1.strategy_id == 0 and 1 or slot1.strategy_id
	}
	slot0.line = {
		row = slot1.pos.row,
		column = slot1.pos.column
	}

	slot0:updateShips(slot1.ship_list)
end

function slot0.retreat(slot0)
	for slot4, slot5 in pairs(slot0.ships) do
		slot5.hpRant = 10000
		slot5.strategies = {}
	end

	slot0.mirrors = nil
end

function slot0.flushShips(slot0)
	for slot5, slot6 in ipairs(_.keys(slot0.ships)) do
		if slot0:fetchShipVO(slot6) then
			slot7.hpRant = slot0.ships[slot6].hpRant
			slot7.strategies = slot0.ships[slot6].strategies
		end

		slot0.ships[slot6] = slot7
	end

	_.each(slot0[TeamType.Vanguard], function (slot0)
		if uv0.ships[slot0.id] then
			table.insert(uv1, uv0.ships[slot0.id])
		end
	end)

	slot0[TeamType.Vanguard] = {}

	_.each(slot0[TeamType.Main], function (slot0)
		if uv0.ships[slot0.id] then
			table.insert(uv1, uv0.ships[slot0.id])
		end
	end)

	slot0[TeamType.Main] = {}
end

function slot0.getShipRemainStrategies(slot0)
	slot2 = slot0:getShips(false)

	_.each(slot2, function (slot0)
		_.each(slot0:getConfig("strategy_list"), function (slot0)
			uv0[slot0[1]] = (uv0[slot0[1]] or 0) + slot0[2]
		end)
	end)
	_.each(slot2, function (slot0)
		_.each(slot0.strategies, function (slot0)
			uv0[slot0.id] = (uv0[slot0.id] or 0) - slot0.count
			uv0[slot0.id] = math.max(uv0[slot0.id], 0)
		end)
	end)

	return {}
end

function slot0.getStrategies(slot0)
	slot1 = slot0:getShipRemainStrategies()

	for slot5, slot6 in pairs(slot0.stgPicked) do
		slot1[slot5] = (slot1[slot5] or 0) + slot6
	end

	for slot5, slot6 in pairs(pg.strategy_data_template) do
		if slot6.type == ChapterConst.StgTypeForm or slot6.type == ChapterConst.StgTypeConsume and table.contains(ChapterConst.StrategyPresents, slot6.id) then
			slot1[slot5] = slot1[slot5] or 0
		end
	end

	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		table.insert(slot2, {
			id = slot6,
			count = slot7
		})
	end

	return _.sort(slot2, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
end

function slot0.consumeOneStrategy(slot0, slot1)
end

function slot0.getNextStgUser(slot0, slot1)
	if pg.strategy_data_template[strategy.id].type == ChapterConst.StgTypeForm then
		return slot0.id
	elseif slot2.type == ChapterConst.StgTypeConsume then
		return slot0:getStgConsume(slot1)
	end
end

function slot0.getStgConsume(slot0, slot1)
	slot2, slot3, slot4 = nil

	for slot9, slot10 in ipairs(slot0:getShips(false)) do
		if _.detect(slot10:getConfig("strategy_list"), function (slot0)
			return slot0[1] == uv0
		end) and _.detect(slot10.strategies, function (slot0)
			return slot0.id == uv0
		end).count < slot12[2] then
			slot2 = slot10.id
			slot3 = slot12[2]
			slot4 = slot13.count

			break
		end
	end

	return slot2, slot3, slot4
end

return slot0
