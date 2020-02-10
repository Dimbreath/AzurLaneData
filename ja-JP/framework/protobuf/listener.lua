slot0 = setmetatable

module("listener")

slot1 = {
	Modified = function ()
	end
}

function NullMessageListener()
	return uv0
end

slot2 = {
	Modified = function (slot0)
		if slot0.dirty then
			return
		end

		if slot0._parent_message then
			slot0._parent_message:_Modified()
		end
	end,
	__index = slot2
}

function Listener(slot0)
	slot1.__mode = "v"
	slot1._parent_message = slot0
	slot1.dirty = false

	return uv0({}, uv1)
end
