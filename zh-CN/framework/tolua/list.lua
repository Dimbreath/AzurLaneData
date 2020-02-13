function ilist(slot0)
	return slot0.next, slot0, slot0
end

function rilist(slot0)
	return slot0.prev, slot0, slot0
end

setmetatable({
	__index = ,
	new = function (slot0)
		return slot0({
			_next = 0,
			length = 0,
			_prev = 0,
			_prev = ,
			_next = 
		}, )
	end,
	clear = function (slot0)
		slot0._next = slot0
		slot0._prev = slot0
		slot0.length = 0
	end,
	push = function (slot0, slot1)
		slot0._prev._next = {
			_next = 0,
			removed = false,
			_prev = 0,
			value = slot1,
			_next = slot0,
			_prev = slot0._prev
		}
		slot0._prev = 
		slot0.length = slot0.length + 1

		return 
	end,
	pushnode = function (slot0, slot1)
		if not slot1.removed then
			return
		end

		slot0._prev._next = slot1
		slot1._next = slot0
		slot1._prev = slot0._prev
		slot0._prev = slot1
		slot1.removed = false
		slot0.length = slot0.length + 1
	end,
	pop = function (slot0)
		slot0:remove(slot0._prev)

		return slot0._prev.value
	end,
	unshift = function (slot0, slot1)
		slot0._next._prev = {
			_next = 0,
			removed = false,
			_prev = 0,
			value = slot1,
			_prev = slot0,
			_next = slot0._next
		}
		slot0._next = 
		slot0.length = slot0.length + 1

		return 
	end,
	shift = function (slot0)
		slot0:remove(slot0._next)

		return slot0._next.value
	end,
	remove = function (slot0, slot1)
		if slot1.removed then
			return
		end

		slot1._next._prev = slot1._prev
		slot1._prev._next = slot1._next
		slot0.length = math.max(0, slot0.length - 1)
		slot1.removed = true
	end,
	find = function (slot0, slot1, slot2)
		slot2 = slot2 or slot0

		repeat
			if slot1 == slot2.value then
				return slot2
			else
				slot2 = slot2._next
			end
		until slot2 == slot0

		return nil
	end,
	findlast = function (slot0, slot1, slot2)
		slot2 = slot2 or slot0

		repeat
			if slot1 == slot2.value then
				return slot2
			end
		until slot2._prev == slot0

		return nil
	end,
	next = function (slot0, slot1)
		if slot1._next ~= slot0 then
			return slot2, slot2.value
		end

		return nil
	end,
	prev = function (slot0, slot1)
		if slot1._prev ~= slot0 then
			return slot2, slot2.value
		end

		return nil
	end,
	erase = function (slot0, slot1)
		if slot0:find(slot1) then
			slot0:remove(slot2)
		end
	end,
	insert = function (slot0, slot1, slot2)
		if not slot2 then
			return slot0:push(slot1)
		end

		slot3 = {
			_next = 0,
			removed = false,
			_prev = 0,
			value = slot1
		}

		if slot2._next then
			slot2._next._prev = slot3
			slot3._next = slot2._next
		else
			slot0.last = slot3
		end

		slot3._prev = slot2
		slot2._next = slot3
		slot0.length = slot0.length + 1

		return slot3
	end,
	head = function (slot0)
		return slot0._next.value
	end,
	tail = function (slot0)
		return slot0._prev.value
	end,
	clone = function (slot0)
		slot1 = slot0:new()

		for slot5, slot6 in slot0.next, slot0, slot0 do
			slot1:push(slot6)
		end

		return slot1
	end
}, {
	__call = ()["new"]
})

return 
