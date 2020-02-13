slot0 = setmetatable
slot1 = rawset
slot2 = rawget
slot3 = error
slot4 = ipairs
slot5 = pairs
slot6 = print
slot7 = table
slot8 = string
slot9 = tostring
slot10 = type
slot11 = require("pb")
slot12 = require("protobuf.wire_format")
slot13 = require("protobuf.type_checkers")
slot14 = require("protobuf.encoder")
slot15 = require("protobuf.decoder")
slot16 = require("protobuf.listener")
slot17 = require("protobuf.containers")
slot20 = require("protobuf.text_format")

module("protobuf.protobuf")
slot21("Descriptor", {}, {
	full_name = true,
	name = true,
	containing_type = true,
	is_extendable = true,
	extensions = true,
	fields = true,
	extension_ranges = true,
	nested_types = true,
	options = true,
	enum_types = true,
	filename = true
})
slot21("FieldDescriptor", slot19, {
	full_name = true,
	name = true,
	containing_type = true,
	type = true,
	index = true,
	label = true,
	default_value = true,
	number = true,
	extension_scope = true,
	is_extension = true,
	enum_type = true,
	has_default_value = true,
	message_type = true,
	cpp_type = true
})
slot21("EnumDescriptor", {}, {
	full_name = true,
	values = true,
	containing_type = true,
	name = true,
	options = true
})
slot21("EnumValueDescriptor", {}, {
	options = true,
	name = true,
	type = true,
	index = true,
	number = true
})

slot22 = {
	[require("protobuf.descriptor").FieldDescriptor.TYPE_DOUBLE] = slot12.WIRETYPE_FIXED64,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FLOAT] = slot12.WIRETYPE_FIXED32,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_INT64] = slot12.WIRETYPE_VARINT,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_UINT64] = slot12.WIRETYPE_VARINT,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_INT32] = slot12.WIRETYPE_VARINT,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FIXED64] = slot12.WIRETYPE_FIXED64,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FIXED32] = slot12.WIRETYPE_FIXED32,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_BOOL] = slot12.WIRETYPE_VARINT,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_STRING] = slot12.WIRETYPE_LENGTH_DELIMITED,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_GROUP] = slot12.WIRETYPE_START_GROUP,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_MESSAGE] = slot12.WIRETYPE_LENGTH_DELIMITED,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_BYTES] = slot12.WIRETYPE_LENGTH_DELIMITED,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_UINT32] = slot12.WIRETYPE_VARINT,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_ENUM] = slot12.WIRETYPE_VARINT,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SFIXED32] = slot12.WIRETYPE_FIXED32,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SFIXED64] = slot12.WIRETYPE_FIXED64,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SINT32] = slot12.WIRETYPE_VARINT,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SINT64] = slot12.WIRETYPE_VARINT
}
slot23 = {
	[require("protobuf.descriptor").FieldDescriptor.TYPE_STRING] = true,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_GROUP] = true,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_MESSAGE] = true,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_BYTES] = true
}
slot24 = {
	[require("protobuf.descriptor").FieldDescriptor.CPPTYPE_INT32] = slot13.Int32ValueChecker(),
	[require("protobuf.descriptor").FieldDescriptor.CPPTYPE_INT64] = slot13.TypeChecker({
		string = true,
		number = true
	}),
	[require("protobuf.descriptor").FieldDescriptor.CPPTYPE_UINT32] = slot13.Uint32ValueChecker(),
	[require("protobuf.descriptor").FieldDescriptor.CPPTYPE_UINT64] = slot13.TypeChecker({
		string = true,
		number = true
	}),
	[require("protobuf.descriptor").FieldDescriptor.CPPTYPE_DOUBLE] = slot13.TypeChecker({
		number = true
	}),
	[require("protobuf.descriptor").FieldDescriptor.CPPTYPE_FLOAT] = slot13.TypeChecker({
		number = true
	}),
	[require("protobuf.descriptor").FieldDescriptor.CPPTYPE_BOOL] = slot13.TypeChecker({
		boolean = true,
		int = true,
		bool = true
	}),
	[require("protobuf.descriptor").FieldDescriptor.CPPTYPE_ENUM] = slot13.Int32ValueChecker(),
	[require("protobuf.descriptor").FieldDescriptor.CPPTYPE_STRING] = slot13.TypeChecker({
		string = true
	})
}
slot25 = {
	[require("protobuf.descriptor").FieldDescriptor.TYPE_DOUBLE] = slot12.DoubleByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FLOAT] = slot12.FloatByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_INT64] = slot12.Int64ByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_UINT64] = slot12.UInt64ByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_INT32] = slot12.Int32ByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FIXED64] = slot12.Fixed64ByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FIXED32] = slot12.Fixed32ByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_BOOL] = slot12.BoolByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_STRING] = slot12.StringByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_GROUP] = slot12.GroupByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_MESSAGE] = slot12.MessageByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_BYTES] = slot12.BytesByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_UINT32] = slot12.UInt32ByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_ENUM] = slot12.EnumByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SFIXED32] = slot12.SFixed32ByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SFIXED64] = slot12.SFixed64ByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SINT32] = slot12.SInt32ByteSize,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SINT64] = slot12.SInt64ByteSize
}
slot26 = {
	[require("protobuf.descriptor").FieldDescriptor.TYPE_DOUBLE] = slot14.DoubleEncoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FLOAT] = slot14.FloatEncoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_INT64] = slot14.Int64Encoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_UINT64] = slot14.UInt64Encoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_INT32] = slot14.Int32Encoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FIXED64] = slot14.Fixed64Encoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FIXED32] = slot14.Fixed32Encoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_BOOL] = slot14.BoolEncoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_STRING] = slot14.StringEncoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_GROUP] = slot14.GroupEncoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_MESSAGE] = slot14.MessageEncoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_BYTES] = slot14.BytesEncoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_UINT32] = slot14.UInt32Encoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_ENUM] = slot14.EnumEncoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SFIXED32] = slot14.SFixed32Encoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SFIXED64] = slot14.SFixed64Encoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SINT32] = slot14.SInt32Encoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SINT64] = slot14.SInt64Encoder
}
slot27 = {
	[require("protobuf.descriptor").FieldDescriptor.TYPE_DOUBLE] = slot14.DoubleSizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FLOAT] = slot14.FloatSizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_INT64] = slot14.Int64Sizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_UINT64] = slot14.UInt64Sizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_INT32] = slot14.Int32Sizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FIXED64] = slot14.Fixed64Sizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FIXED32] = slot14.Fixed32Sizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_BOOL] = slot14.BoolSizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_STRING] = slot14.StringSizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_GROUP] = slot14.GroupSizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_MESSAGE] = slot14.MessageSizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_BYTES] = slot14.BytesSizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_UINT32] = slot14.UInt32Sizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_ENUM] = slot14.EnumSizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SFIXED32] = slot14.SFixed32Sizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SFIXED64] = slot14.SFixed64Sizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SINT32] = slot14.SInt32Sizer,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SINT64] = slot14.SInt64Sizer
}
slot28 = {
	[require("protobuf.descriptor").FieldDescriptor.TYPE_DOUBLE] = slot15.DoubleDecoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FLOAT] = slot15.FloatDecoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_INT64] = slot15.Int64Decoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_UINT64] = slot15.UInt64Decoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_INT32] = slot15.Int32Decoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FIXED64] = slot15.Fixed64Decoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FIXED32] = slot15.Fixed32Decoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_BOOL] = slot15.BoolDecoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_STRING] = slot15.StringDecoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_GROUP] = slot15.GroupDecoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_MESSAGE] = slot15.MessageDecoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_BYTES] = slot15.BytesDecoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_UINT32] = slot15.UInt32Decoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_ENUM] = slot15.EnumDecoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SFIXED32] = slot15.SFixed32Decoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SFIXED64] = slot15.SFixed64Decoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SINT32] = slot15.SInt32Decoder,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SINT64] = slot15.SInt64Decoder
}
slot29 = {
	[require("protobuf.descriptor").FieldDescriptor.TYPE_DOUBLE] = slot12.WIRETYPE_FIXED64,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FLOAT] = slot12.WIRETYPE_FIXED32,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_INT64] = slot12.WIRETYPE_VARINT,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_UINT64] = slot12.WIRETYPE_VARINT,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_INT32] = slot12.WIRETYPE_VARINT,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FIXED64] = slot12.WIRETYPE_FIXED64,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_FIXED32] = slot12.WIRETYPE_FIXED32,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_BOOL] = slot12.WIRETYPE_VARINT,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_STRING] = slot12.WIRETYPE_LENGTH_DELIMITED,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_GROUP] = slot12.WIRETYPE_START_GROUP,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_MESSAGE] = slot12.WIRETYPE_LENGTH_DELIMITED,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_BYTES] = slot12.WIRETYPE_LENGTH_DELIMITED,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_UINT32] = slot12.WIRETYPE_VARINT,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_ENUM] = slot12.WIRETYPE_VARINT,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SFIXED32] = slot12.WIRETYPE_FIXED32,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SFIXED64] = slot12.WIRETYPE_FIXED64,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SINT32] = slot12.WIRETYPE_VARINT,
	[require("protobuf.descriptor").FieldDescriptor.TYPE_SINT64] = slot12.WIRETYPE_VARINT
}

function slot30(slot0)
	return slot0[slot0] == nil
end

function slot31(slot0, slot1)
	if slot0 == slot0.CPPTYPE_STRING and slot1 == slot0.TYPE_STRING then
		return slot1.UnicodeValueChecker()
	end

	return slot2[slot0]
end

function slot32(slot0)
	if slot0.label == slot0.LABEL_REPEATED then
		if slot1(slot0.default_value) ~= "table" or #slot0.default_value ~= 0 then
			slot2("Repeated field default value not empty list:" .. slot3(slot0.default_value))
		end

		if slot0.cpp_type == slot0.CPPTYPE_MESSAGE then
			slot1 = slot0.message_type

			return function (slot0)
				return slot0.RepeatedCompositeFieldContainer(slot0._listener_for_children, slot0.RepeatedCompositeFieldContainer)
			end
		else
			slot1 = slot5(slot0.cpp_type, slot0.type)

			return function (slot0)
				return slot0.RepeatedScalarFieldContainer(slot0._listener_for_children, slot0.RepeatedScalarFieldContainer)
			end
		end
	end

	if slot0.cpp_type == slot0.CPPTYPE_MESSAGE then
		slot1 = slot0.message_type

		return function (slot0)
			result = slot0._concrete_class()

			result._SetListener(slot0._listener_for_children)

			return result
		end
	end

	return function (slot0)
		return slot0.default_value
	end
end

function slot33(slot0, slot1)
	slot1(slot1, "_encoder", slot1.label == slot0.LABEL_REPEATED[slot1.type](slot1.number, slot1.label == slot0.LABEL_REPEATED, slot1.has_options and slot1.GetOptions().packed))
	slot1(slot1, "_sizer", slot1.has_options and slot1.GetOptions().packed[slot1.type](slot1.number, slot1.label == slot0.LABEL_REPEATED, slot1.has_options and slot1.GetOptions().packed))
	slot1(slot1, "_default_constructor", slot1(slot1))

	-- Decompilation error in this vicinity:
	function (slot0, slot1)
		slot2._decoders_by_tag[slot0.TagBytes(slot1.number, slot0)] = slot3[slot1.type](slot1.number, slot3[slot1.type], slot1, slot1, slot1._default_constructor)
	end(slot1[slot1.type], False)

	if slot2 and slot8(slot1.type) then
		slot4(slot9.WIRETYPE_LENGTH_DELIMITED, True)
	end
end

function slot34(slot0, slot1)
	for slot5, slot6 in slot0(slot0.enum_types) do
		for slot10, slot11 in slot0(slot6.values) do
			slot1._member[slot11.name] = slot11.number
		end
	end
end

function slot35(slot0)
	return function ()
		return 
		-- Decompilation error in this vicinity:
		slot0:Listener()({
			_cached_byte_size = 0,
			_cached_byte_size_dirty = false,
			_fields = {},
			_is_present_in_parent = false,
			_listener = slot0.NullMessageListener(),
			_listener_for_children = 
			-- Decompilation error in this vicinity:
			slot0.Listener()
		}, )
	end
end

function slot36(slot0, slot1)
	slot1._getter[slot0.name] = function (slot0)
		if slot0._fields[slot0] == nil then
			slot0._fields[slot0] = slot0:_default_constructor()

			if not slot0._cached_byte_size_dirty then
				slot1._member._Modified(slot0)
			end
		end

		return slot1
	end

	slot1._setter[slot0.name] = function (slot0)
		slot0("Assignment not allowed to repeated field \"" .. slot0 .. "\" in protocol message object.")
	end
end

function slot37(slot0, slot1)
	slot3 = slot0.message_type

	slot1._getter[slot0.name] = function (slot0)
		if slot0._fields[slot0] == nil then
			slot1._concrete_class()._SetListener(slot1, slot0._listener_for_children)

			slot0._fields[slot0] = slot1._concrete_class()

			if not slot0._cached_byte_size_dirty then
				slot2._member._Modified(slot0)
			end
		end

		return slot1
	end

	slot1._setter[slot0.name] = function (slot0, slot1)
		slot0("Assignment not allowed to composite field" .. slot1 .. "in protocol message object.")
	end
end

function slot38(slot0, slot1)
	slot3 = slot0(slot0.cpp_type, slot0.type)
	slot4 = slot0.default_value

	slot1._getter[slot0.name] = function (slot0)
		if slot0._fields[slot0] ~= nil then
			return slot0._fields[slot0]
		else
			return slot1
		end
	end

	slot1._setter[slot0.name] = function (slot0, slot1)
		slot0(slot1)

		slot0._fields[slot1] = slot1

		if not slot0._cached_byte_size_dirty then
			slot2._member._Modified(slot0)
		end
	end
end

function slot39(slot0, slot1)
	constant_name = slot0.name:upper() .. "_FIELD_NUMBER"
	slot1._member[constant_name] = slot0.number

	if slot0.label == slot0.LABEL_REPEATED then
		slot1(slot0, slot1)
	elseif slot0.cpp_type == slot0.CPPTYPE_MESSAGE then
		slot2(slot0, slot1)
	else
		slot3(slot0, slot1)
	end
end

slot40 = {
	__index = function (slot0, slot1)
		if slot0(slot0, "_extended_message")._fields[slot1] ~= nil then
			return slot3
		end

		if slot1.label == slot1.LABEL_REPEATED then
			slot3 = slot1._default_constructor(slot0._extended_message)
		elseif slot1.cpp_type == slot1.CPPTYPE_MESSAGE then
			slot1.message_type._concrete_class():_SetListener(slot2._listener_for_children)
		else
			return slot1.default_value
		end

		slot2._fields[slot1] = slot3

		return slot3
	end,
	__newindex = function (slot0, slot1, slot2)
		slot3 = slot0(slot0, "_extended_message")

		if slot1.label == slot1.LABEL_REPEATED or slot1.cpp_type == slot1.CPPTYPE_MESSAGE then
			slot2("Cannot assign to extension \"" .. slot1.full_name .. "\" because it is a repeated or composite type.")
		end

		slot3(slot1.cpp_type, slot1.type).CheckValue(slot2)

		slot3._fields[slot1] = slot2

		slot3._Modified()
	end
}

function slot41(slot0)
	return slot0({
		_extended_message = slot0
	}, )
end

function slot42(slot0, slot1)
	for slot5, slot6 in slot0(slot0.fields) do
		slot1(slot6, slot1)
	end

	if slot0.is_extendable then
		function slot1._getter.Extensions(slot0)
			return slot0(slot0)
		end
	end
end

function slot43(slot0, slot1)
	for slot6, slot7 in slot0(slot2) do
		slot1._member[slot1.upper(slot6) .. "_FIELD_NUMBER"] = slot7.number
	end
end

function slot44(slot0)
	function slot0._member.RegisterExtension(slot0)
		slot0.containing_type = slot0._descriptor

		slot0:_descriptor(slot0)

		if slot0._extensions_by_number[slot0.number] == nil then
			slot0._extensions_by_number[slot0.number] = slot0
		else
			slot2(slot3.format("Extensions \"%s\" and \"%s\" both try to extend message type \"%s\" with field number %d.", slot0.full_name, actual_handle.full_name, slot0._descriptor.full_name, slot0.number))
		end

		slot0._extensions_by_name[slot0.full_name] = slot0
	end

	function slot0._member.FromString(slot0)
		slot0._member.__call().MergeFromString(slot0)

		return slot0._member.__call()
	end
end

function slot45(slot0, slot1)
	if slot0.label == slot0.LABEL_REPEATED then
		return slot1
	elseif slot0.cpp_type == slot0.CPPTYPE_MESSAGE then
		return slot1._is_present_in_parent
	else
		return true
	end
end

function sortFunc(slot0, slot1)
	return slot0.index < slot1.index
end

function pairsByKeys(slot0, slot1)
	slot2 = {}

	for slot6 in slot0(slot0) do
		slot1.insert(slot2, slot6)
	end

	slot1.sort(slot2, slot1)

	slot3 = 0

	return function ()
		slot0 = slot0 + 1

		if slot1[] == nil then
			return nil
		else
			return slot1[], slot2[slot1[slot1[]]]
		end
	end
end

function slot46(slot0, slot1)
	function slot1._member.ListFields(slot0)
		return 
		-- Decompilation error in this vicinity:
		function (slot0)
			slot1, slot6, slot7 = pairsByKeys(slot0._fields, sortFunc)

			return function (slot0, slot1)
				while true do
					slot2, slot3 = slot0(slot0, slot1)

					if slot2 == nil then
						return
					end
				end
			end, slot2, slot3
		end(slot0._fields)
	end
end

function slot47(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in slot0(slot0.fields) do
		if slot7.label ~= slot1.LABEL_REPEATED then
			slot2[slot7.name] = slot7
		end
	end

	function slot1._member.HasField(slot0, slot1)
		field = slot0[slot1]

		if field == nil then
			slot1("Protocol message has no singular \"" .. slot1 .. "\" field.")
		end

		if field.cpp_type == slot2.CPPTYPE_MESSAGE then
			value = slot0._fields[field]

			return value ~= nil and value._is_present_in_parent
		else
			return slot0._fields[field] ~= nil
		end
	end
end

function slot48(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in slot0(slot0.fields) do
		if slot7.label ~= slot1.LABEL_REPEATED then
			slot2[slot7.name] = slot7
		end
	end

	function slot1._member.ClearField(slot0, slot1)
		field = slot0[slot1]

		if field == nil then
			slot1("Protocol message has no singular \"" .. slot1 .. "\" field.")
		end

		if slot0._fields[field] then
			slot0._fields[field] = nil
		end

		slot2._member._Modified(slot0)
	end
end

function slot49(slot0)
	function slot0._member.ClearExtension(slot0, slot1)
		if slot0._fields[slot1] == nil then
			slot0._fields[slot1] = nil
		end

		slot0._member._Modified(slot0)
	end
end

function slot50(slot0, slot1)
	function slot1._member.Clear(slot0)
		slot0._fields = {}

		slot0._member._Modified(slot0)
	end
end

function slot51(slot0)
	slot1 = slot0.msg_format

	function slot0.__tostring(slot0)
		return slot0(slot0)
	end
end

function slot52(slot0)
	function slot0._member.HasExtension(slot0, slot1)
		if slot1.label == slot0.LABEL_REPEATED then
			slot1(slot1.full_name .. " is repeated.")
		end

		if slot1.cpp_type == slot0.CPPTYPE_MESSAGE then
			value = slot0._fields[slot1]

			return value ~= nil and value._is_present_in_parent
		else
			return slot0._fields[slot1]
		end
	end
end

function slot53(slot0)
	function slot0._member._SetListener(slot0, slot1)
		if slot1 ~= nil then
			slot0._listener = slot0.NullMessageListener()
		else
			slot0._listener = slot1
		end
	end
end

function slot54(slot0, slot1)
	function slot1._member.ByteSize(slot0)
		if not slot0._cached_byte_size_dirty and slot0._cached_byte_size > 0 then
			return slot0._cached_byte_size
		end

		slot1 = 0

		for slot5, slot6 in slot0._member.ListFields(slot0) do
			slot1 = slot5._sizer(slot6) + slot1
		end

		slot0._cached_byte_size = slot1
		slot0._cached_byte_size_dirty = false
		slot0._listener_for_children.dirty = false

		return slot1
	end
end

function slot55(slot0, slot1)
	function slot1._member.SerializeToString(slot0)
		if not slot0._member.IsInitialized(slot0) then
			slot1("Message is missing required fields: " .. slot2.concat(slot0._member.FindInitializationErrors(slot0), ","))
		end

		return slot0._member.SerializePartialToString(slot0)
	end

	function slot1._member.SerializeToIOString(slot0, slot1)
		if not slot0._member.IsInitialized(slot0) then
			slot1("Message is missing required fields: " .. slot2.concat(slot0._member.FindInitializationErrors(slot0), ","))
		end

		return slot0._member.SerializePartialToIOString(slot0, slot1)
	end
end

function slot56(slot0, slot1)
	slot2 = slot0.concat

	function slot1._member._InternalSerialize(slot0, slot1)
		for slot5, slot6 in slot0._member.ListFields(slot0) do
			slot5._encoder(slot1, slot6)
		end
	end

	function slot1._member.SerializePartialToIOString(slot0, slot1)
		slot2 = slot1.write

		slot0(slot0, function (slot0)
			slot0(slot0, slot0)
		end)
	end

	function slot1._member.SerializePartialToString(slot0)
		slot0(slot0, function (slot0)
			slot0[#slot0 + 1] = slot0
		end)

		return 
		-- Decompilation error in this vicinity:
		{}(
		-- Decompilation error in this vicinity:
		)
	end
end

function slot57(slot0, slot1)
	slot2 = slot0.ReadTag
	slot3 = slot0.SkipField
	slot4 = slot1._decoders_by_tag

	function slot1._member._InternalParse(slot0, slot1, slot2, slot3)
		slot0._member._Modified(slot0)

		slot4 = slot0._fields
		slot5, slot6, slot7 = nil

		while slot2 ~= slot3 do
			slot5, slot6 = slot1(slot1, slot2)

			if slot2[slot8] == nil then
				if slot3(slot1, slot6, slot3, slot5) == -1 then
					return slot2
				end

				slot2 = slot6
			else
				slot2 = slot7(slot1, slot6, slot3, slot0, slot4)
			end
		end

		return slot2
	end

	function slot1._member.MergeFromString(slot0, slot1)
		if slot0(slot0, slot1, 0, #slot1) ~= #slot1 then
			slot1("Unexpected end-group tag.")
		end

		return slot2
	end

	function slot1._member.ParseFromString(slot0, slot1)
		slot0._member.Clear(slot0)
		slot1(slot0, slot1)
	end
end

function slot58(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in slot0(slot0.fields) do
		if slot7.label == slot1.LABEL_REQUIRED then
			slot2[#slot2 + 1] = slot7
		end
	end

	function slot1._member.IsInitialized(slot0, slot1)
		for slot5, slot6 in slot0(slot1) do
			if slot0._fields[slot6] == nil or (slot6.cpp_type == slot2.CPPTYPE_MESSAGE and not slot0._fields[slot6]._is_present_in_parent) then
				if slot1 ~= nil then
					slot1[#slot1 + 1] = slot3._member.FindInitializationErrors(slot0)
				end

				return false
			end
		end

		for slot5, slot6 in slot4(slot0._fields) do
			if slot5.cpp_type == slot2.CPPTYPE_MESSAGE then
				if slot5.label == slot2.LABEL_REPEATED then
					for slot10, slot11 in slot0(slot6) do
						if not slot11:IsInitialized() then
							if slot1 ~= nil then
								slot1[#slot1 + 1] = slot3._member.FindInitializationErrors(slot0)
							end

							return false
						end
					end
				elseif slot6._is_present_in_parent and not slot6:IsInitialized() then
					if slot1 ~= nil then
						slot1[#slot1 + 1] = slot3._member.FindInitializationErrors(slot0)
					end

					return false
				end
			end
		end

		return true
	end

	function slot1._member.FindInitializationErrors(slot0)
		for slot5, slot6 in slot0(slot1) do
			if not slot2._member.HasField(slot0, slot6.name) then
				slot1[#slot1 + 1] = slot6.name
			end
		end

		for slot5, slot6 in slot2._member.ListFields(slot0) do
			if slot5.cpp_type == slot3.CPPTYPE_MESSAGE then
				if slot5.is_extension then
					name = slot4.format("(%s)", slot5.full_name)
				else
					name = slot5.name
				end

				if slot5.label == slot3.LABEL_REPEATED then
					for slot10, slot11 in slot0(slot6) do
						prefix = slot4.format("%s[%d].", name, slot10)
						sub_errors = slot11:FindInitializationErrors()

						for slot15, slot16 in slot0(sub_errors) do
							slot1[#slot1 + 1] = prefix .. slot16
						end
					end
				else
					prefix = name .. "."
					sub_errors = slot6:FindInitializationErrors()

					for slot10, slot11 in slot0(sub_errors) do
						slot1[#slot1 + 1] = prefix .. slot11
					end
				end
			end
		end

		return slot1
	end
end

function slot59(slot0)
	slot1 = slot0.LABEL_REPEATED
	slot2 = slot0.CPPTYPE_MESSAGE

	function slot0._member.MergeFrom(slot0, slot1)
		slot0._member._Modified(slot0)

		slot2 = slot0._fields

		for slot6, slot7 in slot1(slot1._fields) do
			if slot6.label == slot2 or slot6.cpp_type == slot3 then
				field_value = slot2[slot6]

				if field_value == nil then
					field_value = slot6._default_constructor(slot0)
					slot2[slot6] = field_value
				end

				field_value:MergeFrom(slot7)
			else
				slot0._fields[slot6] = slot7
			end
		end
	end
end

function slot60(slot0, slot1)
	slot0(slot0, slot1)
	slot1(slot0, slot1)
	slot1(slot0, slot1)

	if slot0.is_extendable then
		slot3(slot1)
		slot4(slot1)
	end

	slot5(slot0, slot1)
	slot6(slot1)
	slot7(slot1)
	slot8(slot0, slot1)
	slot9(slot0, slot1)
	slot10(slot0, slot1)
	slot11(slot0, slot1)
	slot12(slot0, slot1)
	slot13(slot1)
end

function slot61(slot0)
	function slot0._member._Modified(slot0)
		if not slot0._cached_byte_size_dirty then
			slot0._cached_byte_size_dirty = true
			slot0._listener_for_children.dirty = true
			slot0._is_present_in_parent = true

			slot0._listener:Modified()
		end
	end

	function slot0._member.SetInParent(slot0)
		if not slot0._cached_byte_size_dirty then
			slot0._cached_byte_size_dirty = true
			slot0._listener_for_children.dirty = true
			slot0._is_present_in_parent = true

			slot0._listener.Modified()
		end
	end
end

function slot62(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = slot0._getter
	slot2 = slot0._member

	return function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0[slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-8, warpins: 1 ---
			return slot2(slot0)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-11, warpins: 1 ---
			return slot1[slot1]
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-12, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end
	--- END OF BLOCK #0 ---



end

function slot63(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot1 = slot0._setter

	return function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0[slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-9, warpins: 1 ---
			slot3(slot0, slot2)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-14, warpins: 1 ---
			slot1(slot1 .. " not found")
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-15, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end
	--- END OF BLOCK #0 ---



end

function _AddClassAttributesForNestedExtensions(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-9, warpins: 0 ---
	for slot6, slot7 in slot0(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		slot1._member[slot6] = slot7
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-10, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function _M.Message(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot0(slot0, "_extensions_by_name", {})

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-17, warpins: 0 ---
	for slot5, slot6 in slot1(slot0.extensions) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-15, warpins: 1 ---
		slot0._extensions_by_name[slot6.name] = slot6
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-17, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-26, warpins: 1 ---
	slot0(slot0, "_extensions_by_number", {})

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 27-31, warpins: 0 ---
	for slot5, slot6 in slot1(slot0.extensions) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-29, warpins: 1 ---
		slot0._extensions_by_number[slot6.number] = slot6
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 30-31, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 32-62, warpins: 1 ---
	slot1._descriptor = slot0
	slot1._extensions_by_name = {}
	slot1._extensions_by_number = {}
	slot1._getter = {}
	slot1._setter = {}
	slot1._member = 
	-- Decompilation error in this vicinity:
	{}
	slot1._member.__call = slot3(slot1)
	slot1._member.__index = slot1._member
	slot1._member.type = 
	-- Decompilation error in this vicinity:
	({}, slot1._member)

	if slot1._member(slot0, "_concrete_class") == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 63-71, warpins: 1 ---
		slot0(slot0, "_concrete_class", slot2)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 72-77, warpins: 0 ---
		for slot6, slot7 in slot1(slot0.fields) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 72-75, warpins: 1 ---
			slot5(slot1, slot7)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 76-77, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 78-112, warpins: 2 ---
	slot6(slot0, slot1)
	_AddClassAttributesForNestedExtensions(slot0, slot1)
	slot7(slot0, slot1)
	slot8(slot0, slot1)
	slot9(slot1)
	slot10(slot0, slot1)
	slot11(slot1)

	slot1.__index = slot12(slot1)
	slot1.__newindex = slot13(slot1)

	return slot2
	--- END OF BLOCK #5 ---



end

return
