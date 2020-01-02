slot0({
	__call = function (slot0, ...)
		if slot0.obj == nil then
			return slot0.func(...)
		else
			return slot0.func(slot0.obj, ...)
		end
	end,
	__eq = function (slot0, slot1)
		return slot0.func == slot1.func and slot0.obj == slot1.obj
	end
}, )

function slot(slot0, slot1)
	return slot0({
		func = slot0,
		obj = slot1
	}, slot1)
end

return
