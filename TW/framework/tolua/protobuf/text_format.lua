slot0 = string
slot1 = math
slot2 = print
slot3 = getmetatable
slot4 = table
slot5 = ipairs
slot6 = tostring

module("protobuf.text_format")

function format(slot0)
	for slot5 = 1, slot0:len(), 16 do
		slot6 = ""

		for slot10 = slot5, slot1.min((slot5 + 16) - 1, slot1), 1 do
			slot6 = slot0.format("%s  %02x", slot6, slot0:byte(slot10))
		end

		slot2(slot6)
	end
end

slot8 = require("protobuf.descriptor").FieldDescriptor

function msg_format_indent(slot0, slot1, slot2)
	for slot6, slot7 in slot1:ListFields() do
		function slot8(slot0)
			slot1(slot2.rep(" ", slot2.rep))

			if slot0.type == slot4.TYPE_MESSAGE then
				if slot5(slot6)._extensions_by_name[slot0.full_name] then
					slot1("[" .. slot1 .. "] {\n")
				else
					slot1(slot1 .. " {\n")
				end

				msg_format_indent(slot1, slot0, slot3 + 4)
				slot1(slot2.rep(" ", slot1))
				slot1("}\n")
			else
				slot1(slot2.format("%s: %s\n", slot1, slot7(slot0)))
			end
		end

		if slot6.label == slot1.LABEL_REPEATED then
			for slot12, slot13 in slot4(slot7) do
				slot8(slot13)
			end
		else
			slot8(slot7)
		end
	end
end

function msg_format(slot0)
	msg_format_indent(slot2, slot0, 0)

	return slot0.concat({})
end

return
