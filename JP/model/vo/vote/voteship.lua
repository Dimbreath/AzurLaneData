slot0 = class("VoteShip", import("..BaseVO"))

slot0.Ctor = function (slot0, slot1)
	slot0.group = slot1.key
	slot0.totalVotes = slot1.value1
	slot0.votes = slot1.value2
	slot0.netVotes = slot1.value3

	for slot5 = 4, 1, -1 do
		if pg.ship_data_statistics[tonumber(slot0.group .. slot5)] then
			slot0.configId = slot6

			break
		end
	end

	slot0.shipVO = Ship.New({
		id = slot0.configId,
		configId = slot0.configId
	})
end

slot0.bindConfigTable = function (slot0)
	return pg.ship_data_statistics
end

slot0.UpdateVoteCnt = function (slot0, slot1)
	slot0.votes = slot0.votes + slot1
	slot0.totalVotes = slot0.totalVotes + slot1
end

slot0.getDockSortValue = function (slot0)
	return 0
end

slot0.getRarity = function (slot0)
	return slot0.shipVO:getRarity()
end

slot0.getShipName = function (slot0)
	if slot0.group == 30507 then
		slot1, slot2 = HXSet.hxLan(i18n("name_zhanliejahe"))

		return slot1
	end

	return slot0.shipVO:getName()
end

slot0.getEnName = function (slot0)
	return slot0.shipVO:getConfig("english_name")
end

slot0.getPainting = function (slot0)
	return slot0.shipVO:getPainting()
end

slot0.GetDesc = function (slot0)
	return Ship.getShipWords(slot0.shipVO:getConfig("skin_id")).profile
end

slot0.getScore = function (slot0)
	return slot0.votes
end

slot0.getShipType = function (slot0)
	return pg.ship_data_by_type[slot0.shipVO:getConfig("type")].type_name
end

slot0.getNationality = function (slot0)
	return slot0.shipVO:getConfig("nationality")
end

slot0.isSamaGroup = function (slot0, slot1)
	return slot0.group == slot1
end

slot0.getSkinId = function (slot0)
	return slot0.group * 10
end

slot0.getNetVotes = function (slot0)
	if slot0.netVotes >= 100000 then
		return math.floor(slot0.netVotes / 1000) .. "K"
	else
		return slot0.netVotes
	end
end

slot0.GetGameVotes = function (slot0)
	if slot0.votes >= 100000 then
		return math.floor(slot0.votes / 1000) .. "K"
	else
		return slot0.votes
	end
end

slot0.getTotalVotes = function (slot0)
	if slot0.totalVotes >= 100000 then
		return math.floor(slot0.totalVotes / 1000) .. "K"
	else
		return slot0.totalVotes
	end
end

return slot0
