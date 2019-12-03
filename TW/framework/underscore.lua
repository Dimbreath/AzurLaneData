({
	funcs = {},
	__index = ,
	__call = function (slot0, slot1)
		return slot0:new(slot1)
	end,
	new = function (slot0, slot1, slot2)
		return setmetatable({
			_val = slot1,
			chained = slot2 or false
		}, slot0)
	end,
	iter = function (slot0)
		if type(slot0) == "function" then
			return slot0
		end

		return coroutine.wrap(function ()
			for slot3 = 1, #slot0, 1 do
				coroutine.yield(slot0[slot3])
			end
		end)
	end,
	range = function (slot0, slot1, slot2)
		if slot1 == nil then
			slot1 = slot0
			slot0 = 1
		end

		slot2 = slot2 or 1

		return slot0:new(coroutine.wrap(function ()
			for slot3 = slot0, slot1, slot2 do
				coroutine.yield(slot3)
			end
		end))
	end,
	identity = function (slot0)
		return slot0
	end,
	chain = function (slot0)
		slot0.chained = true

		return slot0
	end,
	value = function (slot0)
		return slot0._val
	end,
	functions = function ()
		return slot0.keys(slot0.funcs)
	end,
	methods = ()["functions"]
})["funcs"].each = function (slot0, slot1)
	for slot5 in slot0:iter() do
		slot1(slot5)
	end

	return slot0
end

()["funcs"].map = function (slot0, slot1)
	slot2 = {}

	for slot6 in slot0:iter() do
		slot2[#slot2 + 1] = slot1(slot6)
	end

	return slot2
end

()["funcs"].reduce = function (slot0, slot1, slot2)
	for slot6 in slot0:iter() do
		slot1 = slot2(slot1, slot6)
	end

	return slot1
end

()["funcs"].detect = function (slot0, slot1)
	for slot5 in slot0:iter() do
		if slot1(slot5) then
			return slot5
		end
	end

	return nil
end

()["funcs"].select = function (slot0, slot1)
	slot2 = {}

	for slot6 in slot0:iter() do
		if slot1(slot6) then
			slot2[#slot2 + 1] = slot6
		end
	end

	return slot2
end

()["funcs"].reject = function (slot0, slot1)
	slot2 = {}

	for slot6 in slot0:iter() do
		if not slot1(slot6) then
			slot2[#slot2 + 1] = slot6
		end
	end

	return slot2
end

()["funcs"].all = function (slot0, slot1)
	slot1 = slot1 or slot0.identity

	for slot5 in slot0:iter() do
		if not slot1(slot5) then
			return false
		end
	end

	return true
end

()["funcs"].any = function (slot0, slot1)
	slot1 = slot1 or slot0.identity

	for slot5 in slot0:iter() do
		if slot1(slot5) then
			return true
		end
	end

	return false
end

()["funcs"].include = function (slot0, slot1)
	for slot5 in slot0:iter() do
		if slot5 == slot1 then
			return true
		end
	end

	return false
end

()["funcs"].invoke = function (slot0, slot1, ...)
	slot2 = {
		...
	}

	slot0.funcs.each(slot0, function (slot0)
		slot0[slot0](slot0, unpack(slot0[slot0]))
	end)

	return slot0
end

()["funcs"].pluck = function (slot0, slot1)
	return slot0.funcs.map(slot0, function (slot0)
		return slot0[slot0]
	end)
end

()["funcs"].min = function (slot0, slot1)
	slot1 = slot1 or slot0.identity

	return slot0.funcs.reduce(slot0, {}, function (slot0, slot1)
		if slot0.item == nil then
			slot0.item = slot1
			slot0.value = slot0(slot1)
		elseif slot0(slot1) < slot0.value then
			slot0.item = slot1
			slot0.value = slot2
		end

		return slot0
	end).item
end

()["funcs"].max = function (slot0, slot1)
	slot1 = slot1 or slot0.identity

	return slot0.funcs.reduce(slot0, {}, function (slot0, slot1)
		if slot0.item == nil then
			slot0.item = slot1
			slot0.value = slot0(slot1)
		elseif slot0.value < slot0(slot1) then
			slot0.item = slot1
			slot0.value = slot2
		end

		return slot0
	end).item
end

()["funcs"].to_array = function (slot0)
	slot1 = {}

	for slot5 in slot0:iter() do
		slot1[#slot1 + 1] = slot5
	end

	return slot1
end

()["funcs"].reverse = function (slot0)
	slot1 = {}

	for slot5 in slot0:iter() do
		table.insert(slot1, 1, slot5)
	end

	return slot1
end

()["funcs"].sort = function (slot0, slot1)
	slot2 = slot0

	if type(slot0) == "function" then
		slot2 = slot0.funcs.to_array(slot0)
	end

	table.sort(slot2, slot1)

	return slot2
end

()["funcs"].first = function (slot0, slot1)
	if slot1 == nil then
		return slot0[1]
	else
		slot2 = {}

		for slot6 = 1, math.min(slot1, #slot0), 1 do
			slot2[slot6] = slot0[slot6]
		end

		return slot2
	end
end

()["funcs"].rest = function (slot0, slot1)
	slot1 = slot1 or 2
	slot2 = {}

	for slot6 = slot1, #slot0, 1 do
		slot2[#slot2 + 1] = slot0[slot6]
	end

	return slot2
end

()["funcs"].slice = function (slot0, slot1, slot2)
	slot3 = {}

	for slot8 = math.max(slot1, 1), math.min((math.max(slot1, 1) + slot2) - 1, #slot0), 1 do
		slot3[#slot3 + 1] = slot0[slot8]
	end

	return slot3
end

()["funcs"].flatten = function (slot0)
	slot1 = {}

	for slot5 in slot0:iter() do
		if type(slot5) == "table" then
			slot0.funcs.each(slot0.funcs.flatten(slot5), function (slot0)
				slot0[#slot0 + 1] = slot0
			end)
		else
			slot1[#slot1 + 1] = slot5
		end
	end

	return slot1
end

()["funcs"].push = function (slot0, slot1)
	table.insert(slot0, slot1)

	return slot0
end

()["funcs"].pop = function (slot0)
	return table.remove(slot0)
end

()["funcs"].shift = function (slot0)
	return table.remove(slot0, 1)
end

()["funcs"].unshift = function (slot0, slot1)
	table.insert(slot0, 1, slot1)

	return slot0
end

()["funcs"].join = function (slot0, slot1)
	return table.concat(slot0, slot1)
end

()["funcs"].keys = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0) do
		slot1[#slot1 + 1] = slot5
	end

	return slot1
end

()["funcs"].values = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0) do
		slot1[#slot1 + 1] = slot6
	end

	return slot1
end

()["funcs"].extend = function (slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end

	return slot0
end

()["funcs"].is_empty = function (slot0)
	return next(slot0) == nil
end

()["funcs"].is_equal = function (slot0, slot1, slot2)
	if type(slot0) ~= type(slot1) then
		return false
	end

	if slot3 ~= "table" then
		return slot0 == slot1
	end

	slot5 = getmetatable(slot0)

	if not slot2 and slot5 and slot5.__eq then
		return slot0 == slot1
	end

	slot6 = slot0.funcs.is_equal

	for slot10, slot11 in pairs(slot0) do
		if slot1[slot10] == nil or not slot6(slot11, slot12, slot2) then
			return false
		end
	end

	for slot10, slot11 in pairs(slot1) do
		if slot0[slot10] == nil then
			return false
		end
	end

	return true
end

()["funcs"].compose = function (...)
	function slot0(slot0, ...)
		if #slot0 > 1 then
			return slot0[1](slot0(_.rest(slot0), ...))
		else
			return slot0[1](...)
		end
	end

	slot1 = {
		...
	}

	return function (...)
		return slot0(slot1, ...)
	end
end

()["funcs"].wrap = function (slot0, slot1)
	return function (...)
		return slot0(slot1, ...)
	end
end

()["funcs"].curry = function (slot0, slot1)
	return function (...)
		return slot0(slot1, ...)
	end
end

()["funcs"].for_each = ()["funcs"].each
()["funcs"].collect = ()["funcs"].map
()["funcs"].inject = ()["funcs"].reduce
()["funcs"].foldl = ()["funcs"].reduce
()["funcs"].filter = ()["funcs"].select
()["funcs"].every = ()["funcs"].all
()["funcs"].some = ()["funcs"].any
()["funcs"].head = ()["funcs"].first
()["funcs"].tail = ()["funcs"].rest
()["funcs"].contains = ()["funcs"].include

slot1()

return :new()
