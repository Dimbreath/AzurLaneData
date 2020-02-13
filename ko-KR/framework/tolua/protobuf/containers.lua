slot0 = setmetatable
slot1 = table
slot2 = rawset
slot3 = error

module("protobuf.containers")

function RepeatedCompositeFieldContainer(slot0, slot1)
	return slot0({
		_listener = slot0,
		_message_descriptor = slot1
	}, slot1)
end

function RepeatedScalarFieldContainer(slot0, slot1)
	return slot0({
		_listener = slot0,
		_type_checker = slot1
	}, slot1)
end

return
