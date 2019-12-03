slot0 = class("VoteOrderBook")
slot0.TYPE_POSITIVE = 1
slot0.TYPE_NEGATIVE = 2
slot1 = pg.ship_data_group
slot2 = pg.ship_skin_template

slot0.Ctor = function (slot0, slot1, slot2, slot3)
	slot0.activityId = slot1.id
	slot0.durTime = slot1.data2
	slot0.endTime = slot0.durTime
	slot0.encode = slot0:ToBitCode(slot1.data3)
	slot0.decode = slot0:ToBitCode(slot1.data4)
	slot0.awardCnt = slot1.data1_list[1] or 0
	slot0.isSubmit = false
	slot0.isNew = slot2 and slot3
	slot4 = _.map(_.select(slot0.all, function (slot0)
		return slot0[slot0].handbook_type ~= 1
	end), function (slot0)
		return slot0[slot0].group_type
	end)
	slot5 = {}

	while #slot5 < 7 do
		if not table.contains(slot5, slot4[math.random(1, #slot4)]) then
			table.insert(slot5, slot7)
		end
	end

	slot0.ships = _.map(slot5, function (slot0)
		return Ship.New({
			configId = ShipGroup.getDefaultShipConfig(slot0).id
		})
	end)
end

slot0.GetAwardCnt = function (slot0)
	return slot0.awardCnt
end

slot0.SetIsNew = function (slot0, slot1)
	slot0.isNew = slot1
end

slot0.GetShips = function (slot0)
	return slot0.ships
end

slot0.ToBitCode = function (slot0, slot1)
	slot4 = ""

	for slot8 = 1, 7 - string.len(slot2), 1 do
		slot4 = slot4 .. "0"
	end

	return String2Table(slot4 .. slot2)
end

slot0.GetBitEncode = function (slot0)
	return slot0.encode
end

slot0.GetBitDecode = function (slot0)
	return slot0.decode
end

slot0.GetIntByBit = function (slot0, slot1)
	return ConvertStr2Dec(slot1, 2)
end

slot0.IsExpired = function (slot0)
	slot1 = getProxy(ActivityProxy):getActivityById(slot0.activityId)

	return slot0.endTime <= pg.TimeMgr.GetInstance():GetServerTime() or not slot1 or slot1:isEnd()
end

slot0.GetDir = function (slot0)
	return (_.any(slot0:GetBitDecode(), function (slot0)
		return slot0 == "1"
	end) and slot0.TYPE_NEGATIVE) or slot0.TYPE_POSITIVE
end

slot0.GetResult = function (slot0)
	slot1 = slot0:GetBitEncode()
	slot2 = ""

	if slot0:GetDir() == slot0.TYPE_POSITIVE then
		slot2 = table.concat(slot1, "")
	else
		for slot6, slot7 in ipairs(slot1) do
			if slot7 == "0" then
				slot2 = slot2 .. "1"
			elseif slot7 == "1" then
				slot2 = slot2 .. "0"
			end
		end
	end

	return slot2
end

slot0.IsResult = function (slot0, slot1)
	return slot0:GetResult() == slot1
end

slot0.GetEndTime = function (slot0)
	return slot0.endTime
end

slot0.Submit = function (slot0)
	slot0.isSubmit = true
end

slot0.canSubmit = function (slot0)
	return slot0.isSubmit == false
end

slot0.GetCDTime = function (slot0, slot1)
	if slot0.endTime - pg.TimeMgr.GetInstance():GetServerTime() >= 0 then
		slot7 = string.split(slot5, ":")[2] .. ":" .. string.split(slot5, ":")[3]

		if slot4 <= 120 then
			slot5 = setColorStr(slot7, COLOR_RED)
		else
			slot5 = setColorStr(slot7, slot1 or COLOR_WHITE)
		end

		return slot5
	else
		return setColorStr("00:00", slot1 or COLOR_WHITE)
	end
end

return slot0
