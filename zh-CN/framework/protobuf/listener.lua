slot0 = setmetatable

module("listener")

slot1 = {
	Modified = function ()
		return
	end
}

function NullMessageListener()
	return slot0
end

function Listener(slot0)
	return slot0({
		__mode = "v",
		_parent_message = slot0,
		dirty = false
	}, )
end

return
