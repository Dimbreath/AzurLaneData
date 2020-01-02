slot0 = {}

if module then
	mbox = slot0
end

function slot0.split_message(slot0)
	string.gsub(slot0, "^(.-\n)\n", function (slot0)
		slot0.headers = slot0
	end)
	string.gsub(string.gsub(slot0, "\r\n", "\n"), "^.-\n\n(.*)", function (slot0)
		slot0.body = slot0
	end)

	if not ({})["body"] then
		string.gsub(slot0, "^\n(.*)", function (slot0)
			slot0.body = slot0
		end)
	end

	if not slot1.headers and not slot1.body then
		slot1.headers = slot0
	end

	return slot1.headers or "", slot1.body or ""
end

function slot0.split_headers(slot0)
	string.gsub("\n" .. slot0, "\n([^\n]+)", function (slot0)
		table.insert(slot0, slot0)
	end)

	return {}
end

function slot0.parse_header(slot0)
	slot1, slot2, slot5, slot6 = string.find(slot0, "([^%s:]-):%s*(.*)")

	return slot3, slot4
end

function slot0.parse_headers(slot0)
	slot2 = {}

	for slot6 = 1, #slot0:split_headers(), 1 do
		slot7, slot8 = slot0.parse_header(slot1[slot6])

		if slot7 then
			if slot2[string.lower(slot7)] then
				slot2[slot7] = slot2[slot7] .. ", " .. slot8
			else
				slot2[slot7] = slot8
			end
		end
	end

	return slot2
end

function slot0.parse_from(slot0)
	slot1, slot2, slot3, slot4 = string.find(slot0, "^%s*(.-)%s*%<(.-)%>")

	if not slot4 then
		slot1, slot2, slot4 = string.find(slot0, "%s*(.+)%s*")
	end

	slot3 = slot3 or ""
	slot4 = slot4 or ""

	if slot3 == "" then
		slot3 = slot4
	end

	return string.gsub(slot3, "\"", ""), slot4
end

function slot0.split_mbox(slot0)
	slot1 = {}
	slot0 = string.gsub(slot0, "\r\n", "\n") .. [[


From 
]]
	slot2 = 1
	slot3 = 1
	slot4 = 1

	while true do
		slot3, slot2 = string.find(slot0, [[


From .-
]], slot4)

		if not slot5 then
			break
		end

		table.insert(slot1, string.sub(slot0, slot4, slot3 - 1))

		slot4 = slot2 + 1
	end

	return slot1
end

function slot0.parse(slot0)
	for slot5 = 1, #slot0:split_mbox(), 1 do
		slot1[slot5] = slot0.parse_message(slot1[slot5])
	end

	return slot1
end

function slot0.parse_message(slot0)
	slot1.headers, slot1.body = slot0:split_message()

	return {
		body = slot3,
		headers = slot2,
		headers = slot0.parse_headers(()["headers"])
	}
end

return slot0
