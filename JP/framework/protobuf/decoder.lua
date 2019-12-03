slot1 = table
slot2 = assert
slot3 = ipairs
slot4 = error
slot5 = print
slot6 = require("pb")
slot7 = require("encoder")
slot8 = require("wire_format")

module("decoder")

slot10 = slot6.signed_varint_decoder
ReadTag = slot6.read_tag
Int32Decoder = slot15(slot8.WIRETYPE_VARINT, slot12)
EnumDecoder = Int32Decoder
Int64Decoder = slot15(slot8.WIRETYPE_VARINT, slot14)
UInt32Decoder = slot15(slot8.WIRETYPE_VARINT, slot11)
UInt64Decoder = slot15(slot8.WIRETYPE_VARINT, slot13)
SInt32Decoder = slot16(slot8.WIRETYPE_VARINT, slot11, slot8.ZigZagDecode32)
SInt64Decoder = slot16(slot8.WIRETYPE_VARINT, slot13, slot8.ZigZagDecode64)
Fixed32Decoder = slot17(slot8.WIRETYPE_FIXED32, 4, string.byte("I"))
Fixed64Decoder = slot17(slot8.WIRETYPE_FIXED64, 8, string.byte("Q"))
SFixed32Decoder = slot17(slot8.WIRETYPE_FIXED32, 4, string.byte("i"))
SFixed64Decoder = slot17(slot8.WIRETYPE_FIXED64, 8, string.byte("q"))
FloatDecoder = slot17(slot8.WIRETYPE_FIXED32, 4, string.byte("f"))
DoubleDecoder = slot17(slot8.WIRETYPE_FIXED64, 8, string.byte("d"))
BoolDecoder = slot16(slot8.WIRETYPE_VARINT, slot6.varint_decoder, function (slot0)
	return slot0 ~= 0
end)

function StringDecoder(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0
	slot6 = slot1.sub

	if slot1 then
		slot8 = #slot2.TagBytes(slot0, slot3.WIRETYPE_LENGTH_DELIMITED)

		return function (slot0, slot1, slot2, slot3, slot4)
			if slot4[slot0] == nil then
				slot4[slot0] = slot1(slot3)
			end

			while true do
				slot6, slot7 = nil
				slot6, slot1 = slot2(slot0, slot1)

				if slot2 < slot9 + slot8 then
					slot3("Truncated string.")
				end

				slot5:append(slot4(slot0, slot1 + 1, slot7))

				if slot4(slot0, slot7 + 1, slot7 + slot5) ~= slot6 or slot7 == slot2 then
					return slot7
				end
			end
		end
		return
	end

	return function (slot0, slot1, slot2, slot3, slot4)
		slot5, slot6 = nil
		slot5, slot1 = slot0(slot0, slot1)

		if slot2 < slot8 + slot7 then
			slot1("Truncated string.")
		end

		slot4[slot2] = slot3(slot0, slot1 + 1, slot6)

		return slot6
	end
end

function BytesDecoder(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0
	slot6 = slot1.sub

	if slot1 then
		slot8 = #slot2.TagBytes(slot0, slot3.WIRETYPE_LENGTH_DELIMITED)

		return function (slot0, slot1, slot2, slot3, slot4)
			if slot4[slot0] == nil then
				slot4[slot0] = slot1(slot3)
			end

			while true do
				slot6, slot7 = nil
				slot6, slot1 = slot2(slot0, slot1)

				if slot2 < slot9 + slot8 then
					slot3("Truncated string.")
				end

				slot5:append(slot4(slot0, slot1 + 1, slot7))

				if slot4(slot0, slot7 + 1, slot7 + slot5) ~= slot6 or slot7 == slot2 then
					return slot7
				end
			end
		end
		return
	end

	return function (slot0, slot1, slot2, slot3, slot4)
		slot5, slot6 = nil
		slot5, slot1 = slot0(slot0, slot1)

		if slot2 < slot8 + slot7 then
			slot1("Truncated string.")
		end

		slot4[slot2] = slot3(slot0, slot1 + 1, slot6)

		return slot6
	end
end

function MessageDecoder(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0
	slot6 = slot1.sub

	if slot1 then
		slot8 = #slot2.TagBytes(slot0, slot3.WIRETYPE_LENGTH_DELIMITED)

		return function (slot0, slot1, slot2, slot3, slot4)
			if slot4[slot0] == nil then
				slot4[slot0] = slot1(slot3)
			end

			while true do
				slot6, slot7 = nil
				slot6, slot1 = slot2(slot0, slot1)

				if slot2 < slot9 + slot8 then
					slot3("Truncated message.")
				end

				if slot5:add():_InternalParse(slot0, slot1, slot7) ~= slot7 then
					slot3("Unexpected end-group tag.")
				end

				if slot5(slot0, slot7 + 1, slot7 + slot4) ~= slot6 or slot7 == slot2 then
					return slot7
				end
			end
		end
		return
	end

	return function (slot0, slot1, slot2, slot3, slot4)
		if slot4[slot0] == nil then
			slot4[slot0] = slot1(slot3)
		end

		slot6, slot7 = nil
		slot6, slot1 = slot2(slot0, slot1)

		if slot2 < slot9 + slot8 then
			slot3("Truncated message.")
		end

		if slot5:_InternalParse(slot0, slot1, slot7) ~= slot7 then
			slot3("Unexpected end-group tag.")
		end

		return slot7
	end
end

function _SkipVarint(slot0, slot1, slot2)
	slot3 = nil
	slot3, slot1 = slot0(slot0, slot1)

	return slot5
end

function _SkipFixed64(slot0, slot1, slot2)
	if slot2 < slot1 + 8 then
		slot0("Truncated message.")
	end

	return slot1
end

function _SkipLengthDelimited(slot0, slot1, slot2)
	slot3 = nil
	slot3, slot1 = slot0(slot0, slot1)

	if slot2 < slot5 + slot4 then
		slot1("Truncated message.")
	end

	return slot1
end

function _SkipFixed32(slot0, slot1, slot2)
	if slot2 < slot1 + 4 then
		slot0("Truncated message.")
	end

	return slot1
end

function _RaiseInvalidWireType(slot0, slot1, slot2)
	slot0("Tag had invalid wire type.")
end

function _FieldSkipper()
	slot1 = slot0.byte
	slot2 = slot0.sub

	return function (slot0, slot1, slot2, slot3)
		return slot2[slot0(slot1(slot3, 1, 1)) % 8 + 1](slot0, slot1, slot2)
	end
end

SkipField = _FieldSkipper()

return
