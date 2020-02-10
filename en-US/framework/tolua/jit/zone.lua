slot0 = table.remove

function slot2.flush(slot0)
	for slot4 = #slot0, 1, -1 do
		slot0[slot4] = nil
	end
end

function slot2.get(slot0)
	return slot0[#slot0]
end

function slot3.__call(slot0, slot1)
	if slot1 then
		slot0[#slot0 + 1] = slot1
	else
		return assert(uv0(slot0), "empty zone stack")
	end
end

return setmetatable({}, {})
