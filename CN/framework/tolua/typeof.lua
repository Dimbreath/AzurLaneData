slot0 = type
slot1 = {}
slot2 = tolua.typeof
slot3 = tolua.findtype

function typeof(slot0)
	slot2 = nil

	if slot0(slot0) == "table" then
		if slot1[slot0] == nil then
			slot1[slot0] = slot2(slot0)
		end
	elseif slot1 == "string" then
		if slot1[slot0] == nil then
			slot1[slot0] = slot3(slot0)
		end
	else
		error(debug.traceback("attemp to call typeof on type " .. slot1))
	end

	return slot2
end

return
