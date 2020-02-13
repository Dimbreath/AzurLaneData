slot1 = setmetatable
slot2 = slot0("Framework.notify.double-queue")
slot5 = {
	__index = {
		disconnect = function (slot0, slot1)
			slot0.handlers:remove(slot1)

			slot0.handlers_block[slot1] = nil
		end,
		connect = function (slot0, slot1)
			if not slot0.handlers_block[slot1] then
				slot0.handlers_block[slot1] = 0

				slot0.handlers:push_back(slot1)
			end
		end,
		block = function (slot0, slot1)
			if slot0.handlers_block[slot1] then
				slot0.handlers_block[slot1] = slot0.handlers_block[slot1] + 1
			end
		end,
		unblock = function (slot0, slot1)
			if slot0.handlers_block[slot1] and slot0.handlers_block[slot1] > 0 then
				slot0.handlers_block[slot1] = slot0.handlers_block[slot1] - 1
			end
		end,
		emit = function (slot0, ...)
			slot0.signal_stopped = false

			for slot4 in slot0.pre_emit_funcs:get_iterator() do
				slot4()
			end

			for slot4 in slot0.handlers:get_iterator() do
				if slot0.signal_stopped then
					break
				end

				if slot0.handlers_block[slot4] == 0 then
					slot4(...)
				end
			end

			for slot4 in slot0.post_emit_funcs:get_iterator() do
				slot4()
			end
		end,
		emit_with_accumulator = function (slot0, slot1, ...)
			slot0.signal_stopped = false

			for slot5 in slot0.pre_emit_funcs:get_iterator() do
				slot5()
			end

			for slot5 in slot0.handlers:get_iterator() do
				if slot0.signal_stopped then
					break
				end

				if slot0.handlers_block[slot5] == 0 then
					slot1(slot5(...))
				end
			end

			for slot5 in slot0.post_emit_funcs:get_iterator() do
				slot5()
			end
		end,
		add_pre_emit = function (slot0, slot1)
			slot0.pre_emit_funcs:push_back(slot1)
		end,
		remove_pre_emit = function (slot0, slot1)
			slot0.pre_emit_funcs:remove(slot1)
		end,
		add_post_emit = function (slot0, slot1)
			slot0.post_emit_funcs:push_front(slot1)
		end,
		remove_post_emit = function (slot0, slot1)
			slot0.post_emit_funcs:remove(slot1)
		end,
		stop = function (slot0)
			slot0.signal_stopped = true
		end
	}
}

return {
	New = function ()
		slot0({
			handlers_block = {},
			handlers = slot2.New(),
			pre_emit_funcs = slot2.New(),
			post_emit_funcs = slot2.New(),
			signal_stopped = false
		}, slot0)

		return 
	end
}
