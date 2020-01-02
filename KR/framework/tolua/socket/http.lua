slot0 = require("socket")
slot1 = require("socket.url")
slot2 = require("ltn12")
slot3 = require("mime")
slot4 = require("string")
slot5 = require("socket.headers")
slot6 = _G
slot7 = require("table")
slot0.http = {
	TIMEOUT = 60,
	USERAGENT = slot0._VERSION
}
slot9 = {
	http = true
}

function slot11(slot0, slot1)
	slot2, slot3, slot4, slot5 = nil
	slot1 = slot1 or {}
	slot2, slot5 = slot0:receive()

	if slot7 then
		return nil, slot5
	end

	while slot2 ~= "" do
		slot3, slot4 = slot0.skip(2, slot1.find(slot2, "^(.-):%s*(.*)"))

		if not slot6 or not slot4 then
			return nil, "malformed reponse headers"
		end

		slot3 = slot1.lower(slot3)
		slot2, slot5 = slot0:receive()

		if slot7 then
			return nil, slot5
		end

		while slot1.find(slot2, "^%s") do
			slot4 = slot4 .. slot2
			slot2 = slot0:receive()

			if slot5 then
				return nil, slot5
			end
		end

		if slot1[slot3] then
			slot1[slot3] = slot1[slot3] .. ", " .. slot4
		else
			slot1[slot3] = slot4
		end
	end

	return slot1
end

slot0.sourcet["http-chunked"] = function (slot0, slot1)
	return slot0.setmetatable({
		getfd = function ()
			return slot0:getfd()
		end,
		dirty = function ()
			return slot0:dirty()
		end
	}, {
		__call = function ()
			slot0, slot1 = slot0:receive()

			if slot1 then
				return nil, slot1
			end

			if not slot1.tonumber(slot2.gsub(slot0, ";.*", ""), 16) then
				return nil, "invalid chunk size"
			end

			if slot2 > 0 then
				slot3, slot4, slot5 = slot0:receive(slot2)

				if slot3 then
					slot0:receive()
				end

				return slot3, slot4
			else
				slot3, slot1 = slot4(slot0, slot4)

				if not slot3 then
					return nil, slot1
				end
			end
		end
	})
end

slot0.sinkt["http-chunked"] = function (slot0)
	return slot0.setmetatable({
		getfd = function ()
			return slot0:getfd()
		end,
		dirty = function ()
			return slot0:dirty()
		end
	}, {
		__call = function (slot0, slot1, slot2)
			if not slot1 then
				return slot0:send("0\r\n\r\n")
			end

			return slot0:send(slot3 .. slot1 .. "\r\n")
		end
	})
end

function slot0.http.open(slot0, slot1, slot2)
	slot3 = slot0.try(slot2 or slot0.tcp())
	slot4 = slot1.setmetatable({
		c = slot3
	}, slot2)
	slot4.try = slot0.newtry(function ()
		slot0:close()
	end)

	slot4.try(slot3:settimeout(slot3.TIMEOUT))
	slot4.try(slot3:connect(slot0, slot1 or slot4))

	return slot4
end

({
	__index = {}
})["__index"].sendrequestline = function (slot0, slot1, slot2)
	return slot0.try(slot0.c:send(slot0.format("%s %s HTTP/1.1\r\n", slot1 or "GET", slot2)))
end

()["__index"].sendheaders = function (slot0, slot1)
	slot2 = slot0.canonic
	slot3 = "\r\n"

	for slot7, slot8 in slot1:pairs() do
		slot3 = (slot2[slot7] or slot7) .. ": " .. slot8 .. "\r\n" .. slot3
	end

	slot0.try(slot0.c:send(slot3))

	return 1
end

()["__index"].sendbody = function (slot0, slot1, slot2, slot3)
	slot2 = slot2 or slot0.source.empty()
	slot3 = slot3 or slot0.pump.step
	slot4 = "http-chunked"

	if slot1["content-length"] then
		slot4 = "keep-open"
	end

	return slot0.try(slot0.pump.all(slot2, slot1.sink(slot4, slot0.c), slot3))
end

()["__index"].receivestatusline = function (slot0)
	if slot0.try(slot0.c:receive(5)) ~= "HTTP/" then
		return nil, slot1
	end

	return slot0.try(slot2:tonumber(), slot0.try(slot0.c:receive("*l", slot1)))
end

()["__index"].receiveheaders = function (slot0)
	return slot0.try(slot0(slot0.c))
end

()["__index"].receivebody = function (slot0, slot1, slot2, slot3)
	slot2 = slot2 or slot0.sink.null()
	slot3 = slot3 or slot0.pump.step
	slot4 = slot1.tonumber(slot1["content-length"])
	slot6 = "default"

	if slot1["transfer-encoding"] and slot5 ~= "identity" then
		slot6 = "http-chunked"
	elseif slot1.tonumber(slot1["content-length"]) then
		slot6 = "by-length"
	end

	return slot0.try(slot0.pump.all(slot2.source(slot6, slot0.c, slot4), slot2, slot3))
end

()["__index"].receive09body = function (slot0, slot1, slot2, slot3)
	slot4(slot1)

	return slot0.try(slot0.pump.all(slot0.source.rewind(slot1.source("until-closed", slot0.c)), slot2, slot3))
end

()["__index"].close = function (slot0)
	return slot0.c:close()
end

function slot13(slot0)
	slot1 = slot0

	if not slot0.proxy and not slot0.PROXY then
		slot1 = {
			path = slot1.try(slot0.path, "invalid path 'nil'"),
			params = slot0.params,
			query = slot0.query,
			fragment = slot0.fragment
		}
	end

	return slot2.build(slot1)
end

function slot14(slot0)
	if slot0.proxy or slot0.PROXY then
		return slot1:parse().host, slot1.parse().port or 3128
	else
		return slot0.host, slot0.port
	end
end

function slot15(slot0)
	slot2 = {
		te = "trailers",
		connection = "close, TE",
		["user-agent"] = slot1.USERAGENT,
		host = slot0.gsub(slot0.authority, "^.-@", "")
	}

	if slot0.user and slot0.password then
		slot2.authorization = "Basic " .. slot2.b64(slot0.user .. ":" .. slot0.password)
	end

	if (slot0.proxy or slot1.PROXY) and slot3:parse().user and slot3.password then
		slot2["proxy-authorization"] = "Basic " .. slot2.b64(slot3.user .. ":" .. slot3.password)
	end

	slot4 = slot4.pairs
	slot5 = slot0.headers or slot2

	for slot7, slot8 in slot4(slot5) do
		slot2[slot0.lower(slot7)] = slot8
	end

	return slot2
end

slot16 = {
	scheme = "http",
	path = "/",
	host = "",
	port = 80
}

function slot17(slot0)
	slot1 = (slot0.url and slot0.parse(slot0.url, slot0.parse)) or {}

	for slot5, slot6 in slot2.pairs(slot0) do
		slot1[slot5] = slot6
	end

	if slot1.port == "" then
		slot1.port = slot3
	end

	if not slot1.host or slot1.host == "" then
		slot4.try(nil, "invalid host '" .. slot2.tostring(slot1.host) .. "'")
	end

	slot1.uri = slot0.uri or slot5(slot1)
	slot1.headers = slot6(slot1)
	slot1.host, slot1.port = slot7(slot1)

	return slot1
end

function slot18(slot0, slot1, slot2)
	if not slot2.location then
		return false
	end

	if slot0.gsub(slot3, "%s", "") == "" then
		return false
	end

	if slot0.match(slot3, "^([%w][%w%+%-%.]*)%:") and not slot1[slot4] then
		return false
	end

	return slot0.redirect ~= false and (slot1 == 301 or slot1 == 302 or slot1 == 303 or slot1 == 307) and (not slot0.method or slot0.method == "GET" or slot0.method == "HEAD") and (not slot0.nredirects or slot0.nredirects < 5)
end

function slot19(slot0, slot1)
	if slot0.method == "HEAD" then
		return nil
	end

	if slot1 == 204 or slot1 == 304 then
		return nil
	end

	if slot1 >= 100 and slot1 < 200 then
		return nil
	end

	return 1
end

slot20, slot21 = nil

function slot21(slot0, slot1)
	slot2 = slot0
	slot3 = {
		url = slot1.absolute(slot0.url, slot1),
		source = slot0.source,
		sink = slot0.sink,
		headers = slot0.headers,
		proxy = slot0.proxy,
		nredirects = (slot0.nredirects or 0) + 1,
		create = slot0.create
	}
	slot2, slot3, slot4, slot5 = slot2(slot3)
	slot4 or {}.location = slot4 or .location or slot1

	return slot2, slot3, slot4 or , slot5
end

function slot20(slot0)
	slot1 = slot0(slot0)
	slot2 = slot1.open(slot1.host, slot1.port, slot1.create)

	slot2:sendrequestline(slot1.method, slot1.uri)
	slot2:sendheaders(slot1.headers)

	if slot1.source then
		slot2:sendbody(slot1.headers, slot1.source, slot1.step)
	end

	slot3, slot4 = slot2:receivestatusline()

	if not slot3 then
		slot2:receive09body(slot4, slot1.sink, slot1.step)

		return 1, 200
	end

	slot5 = nil

	while slot3 == 100 do
		slot5 = slot2:receiveheaders()
		slot3, slot4 = slot2:receivestatusline()
	end

	if slot2(slot1, slot3, slot2:receiveheaders()) and not slot1.source then
		slot2:close()

		return slot3(slot0, slot5.location)
	end

	if slot4(slot1, slot3) then
		slot2:receivebody(slot5, slot1.sink, slot1.step)
	end

	slot2:close()

	return 1, slot3, slot5, slot4
end

function slot0.http.genericform(slot0, slot1)
	slot3 = {
		url = slot0,
		sink = slot0.sink.table({}),
		target = 
	}

	if slot1 then
		slot3.source = slot0.source.string(slot1)
		slot3.headers = {
			["content-type"] = "application/x-www-form-urlencoded",
			["content-length"] = slot1:len()
		}
		slot3.method = "POST"
	end

	return slot3
end

function slot23(slot0, slot1)
	slot2 = slot0(slot0, slot1)
	slot3, slot8, slot9, slot10 = slot1(slot2)

	return slot2.concat(slot2.target), slot4, slot5, slot6
end

slot0.http.request = slot0.protect(function (slot0, slot1)
	if slot0:type() == "string" then
		return slot1(slot0, slot1)
	else
		return slot2(slot0)
	end
end)

return slot0.http
