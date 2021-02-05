slot0 = class("Activity", import(".BaseVO"))

function slot0.Create(slot0)
	if pg.activity_template[slot0.id].type == ActivityConst.ACTIVITY_TYPE_INSTAGRAM then
		return InstagramActivity.New(slot0)
	elseif slot1.type == ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN then
		return BeatMonterNianActivity.New(slot0)
	elseif slot1.type == ActivityConst.ACTIVITY_TYPE_COLLECTION_EVENT then
		return CollectionEventActivity.New(slot0)
	else
		return Activity.New(slot0)
	end
end

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.stopTime = slot1.stop_time
	slot0.data1 = defaultValue(slot1.data1, 0)
	slot0.data2 = defaultValue(slot1.data2, 0)
	slot0.data3 = defaultValue(slot1.data3, 0)
	slot0.data4 = defaultValue(slot1.data4, 0)
	slot0.data1_list = {}

	for slot5, slot6 in ipairs(slot1.data1_list) do
		table.insert(slot0.data1_list, slot6)
	end

	slot0.data2_list = {}

	for slot5, slot6 in ipairs(slot1.data2_list) do
		table.insert(slot0.data2_list, slot6)
	end

	slot0.data3_list = {}

	for slot5, slot6 in ipairs(slot1.data3_list) do
		table.insert(slot0.data3_list, slot6)
	end

	slot0.data1KeyValueList = {}

	for slot5, slot6 in ipairs(slot1.date1_key_value_list or {}) do
		slot0.data1KeyValueList[slot6.key] = {}

		for slot10, slot11 in ipairs(slot6.value_list or {}) do
			slot0.data1KeyValueList[slot6.key][slot11.key] = slot11.value
		end
	end

	slot0.clientData1 = 0
	slot0.clientList = {}
end

function slot0.setClientList(slot0, slot1)
	slot0.clientList = slot1
end

function slot0.getClientList(slot0)
	return slot0.clientList
end

function slot0.updateDataList(slot0, slot1)
	table.insert(slot0.data1_list, slot1)
end

function slot0.updateKVPList(slot0, slot1, slot2, slot3)
	if not slot0.data1KeyValueList[slot1] then
		slot0.data1KeyValueList[slot1] = {}
	end

	slot0.data1KeyValueList[slot1][slot2] = slot3
end

function slot0.getKVPList(slot0, slot1, slot2)
	if not slot0.data1KeyValueList[slot1] then
		slot0.data1KeyValueList[slot1] = {}
	end

	return slot0.data1KeyValueList[slot1][slot2] or 0
end

function slot0.getData1(slot0)
	return slot0.data1
end

function slot0.getData3(slot0)
	return slot0.data3
end

function slot0.getData1List(slot0)
	return slot0.data1_list
end

function slot0.bindConfigTable(slot0)
	return pg.activity_template
end

function slot0.getDataConfigTable(slot0)
	if slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MONOPOLY then
		return pg.activity_event_monopoly[tonumber(slot0:getConfig("config_id"))]
	elseif slot1 == ActivityConst.ACTIVITY_TYPE_PT_ACCUM or slot1 == ActivityConst.ACTIVITY_TYPE_PIZZA_PT or slot1 == ActivityConst.ACTIVITY_TYPE_PT_BUFF then
		return pg.activity_event_pt[tonumber(slot2)]
	end
end

function slot0.getDataConfig(slot0, slot1)
	return slot0:getDataConfigTable() and slot2[slot1]
end

function slot0.isEnd(slot0)
	return slot0.stopTime > 0 and slot0.stopTime <= pg.TimeMgr.GetInstance():GetServerTime()
end

function slot0.increaseUsedCount(slot0, slot1)
	if slot1 == 1 then
		slot0.data1 = slot0.data1 + 1
	elseif slot1 == 2 then
		slot0.data2 = slot0.data2 + 1
	end
end

function slot0.readyToAchieve()
	error("Decompilation failed")
	-- Exception in function building!
	-- Traceback (most recent call last):
	-- File "utils/luajit/ljd/ast/builder.py", line 856, in _build_function
	--     return _build_function_definition(prototype, state.header)
	-- File "utils/luajit/ljd/ast/builder.py", line 54, in _build_function_definition
	--     node.statements.contents = _build_function_blocks(state, instructions)
	-- File "utils/luajit/ljd/ast/builder.py", line 75, in _build_function_blocks
	--     _blockenize(state, instructions)
	-- File "utils/luajit/ljd/ast/builder.py", line 143, in _blockenize
	--     _fix_broken_unary_expressions(state, instructions)
	-- File "utils/luajit/ljd/ast/builder.py", line 1242, in _fix_broken_unary_expressions
	--     _remove_instruction(state, instructions, i + 1)
	-- File "utils/luajit/ljd/ast/builder.py", line 1265, in _remove_instruction
	--     state.debuginfo.addr_to_line_map.pop(index)
	-- IndexError: pop from empty list
end

function slot0.isShow(slot0)
	if slot0.configId == ActivityConst.UR_TASK_ACT_ID then
		return not _.all(slot0:getConfig("config_data")[1], function (slot0)
			slot1 = getProxy(TaskProxy):getTaskById(slot0) or getProxy(TaskProxy):getFinishTaskById(slot0)

			return slot1 and slot1:isReceive()
		end)
	elseif slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_RETURN_AWARD then
		return slot0:getConfig("is_show") > 0 and slot0.data1 ~= 0
	else
		return slot0:getConfig("is_show") > 0
	end
end

function slot0.getShowPriority(slot0)
	return slot0:getConfig("is_show")
end

function slot0.left4Day(slot0)
	if slot0.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 345600 then
		return true
	end

	return false
end

function slot0.getAwardInfos(slot0)
	return slot0.data1KeyValueList or {}
end

function slot0.updateData(slot0, slot1, slot2)
	if slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		if not slot0:getAwardInfos()[slot1] then
			slot0.data1KeyValueList[slot1] = {}
		end

		for slot8, slot9 in ipairs(slot2) do
			if slot0.data1KeyValueList[slot1][slot9] then
				slot0.data1KeyValueList[slot1][slot9] = slot0.data1KeyValueList[slot1][slot9] + 1
			else
				slot0.data1KeyValueList[slot1][slot9] = 1
			end
		end
	end
end

function slot0.getTaskShip(slot0)
	return slot0:getConfig("config_client")[1]
end

function slot0.getNotificationMsg(slot0)
	slot2 = ActivityProxy.ACTIVITY_SHOW_AWARDS

	if slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_SHOP then
		slot2 = ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS
	elseif slot1 == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		slot2 = ActivityProxy.ACTIVITY_LOTTERY_SHOW_AWARDS
	elseif slot1 == ActivityConst.ACTIVITY_TYPE_REFLUX then
		slot2 = ActivityProxy.ACTIVITY_SHOW_REFLUX_AWARDS
	elseif slot1 == ActivityConst.ACTIVITY_TYPE_RED_PACKETS then
		slot2 = ActivityProxy.ACTIVITY_SHOW_RED_PACKET_AWARDS
	end

	return slot2
end

function slot0.getDayIndex(slot0)
	slot2 = pg.TimeMgr.GetInstance()

	return slot2:DiffDay(pg.TimeMgr.GetInstance():parseTimeFromConfig(slot0:getConfig("time")[2]), slot2:GetServerTime()) + 1
end

function slot0.getStartTime(slot0)
	return pg.TimeMgr.GetInstance():parseTimeFromConfig(slot0:getConfig("time")[2])
end

function slot0.setSpecialData(slot0, slot1, slot2)
	slot0.speciaData = slot0.speciaData and slot0.speciaData or {}
	slot0.speciaData[slot1] = slot2
end

function slot0.getSpecialData(slot0, slot1)
	return slot0.speciaData and slot0.speciaData[slot1] and slot0.speciaData[slot1] or nil
end

return slot0
