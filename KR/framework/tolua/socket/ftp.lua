slot0 = _G
slot1 = require("table")
slot2 = require("string")
slot3 = require("math")
slot4 = require("socket")
slot5 = require("socket.url")
slot6 = require("socket.tp")
slot7 = require("ltn12")
slot4.ftp = {
	TIMEOUT = 60
}
slot9 = 21
slot4.ftp.USER = "ftp"
slot4.ftp.PASSWORD = "anonymous@anonymous.org"

function slot4.ftp.open(slot0, slot1, slot2)
	slot1.connect.setmetatable({
		tp = slot0.try(slot1.connect(slot0, slot1 or slot2, slot0.try.TIMEOUT, slot2))
	}, ).try = slot0.newtry(function ()
		slot0:close()
	end)

	return slot1.connect.setmetatable(, )
end

({
	__index = {}
})["__index"].portconnect = function (slot0)
	slot0.try(slot0.server:settimeout(slot0.TIMEOUT))

	slot0.data = slot0.try(slot0.server:accept())

	slot0.try(slot0.data:settimeout(slot0.TIMEOUT))
end

()["__index"].pasvconnect = function (slot0)
	slot0.data = slot0.try(slot0.tcp())

	slot0.try(slot0.data:settimeout(slot1.TIMEOUT))
	slot0.try(slot0.data:connect(slot0.pasvt.address, slot0.pasvt.port))
end

()["__index"].login = function (slot0, slot1, slot2)
	slot0.try(slot0.tp:command("user", slot1 or slot0.USER))

	slot3, slot4 = slot0.try(slot0.tp:check({
		"2..",
		331
	}))

	if slot3 == 331 then
		slot0.try(slot0.tp:command("pass", slot2 or slot0.PASSWORD))
		slot0.try(slot0.tp:check("2.."))
	end

	return 1
end

()["__index"].pasv = function (slot0)
	slot0.try(slot0.tp:command("pasv"))

	slot6, slot7 = slot0.try(slot0.tp:check("2.."))
	slot4, slot5, slot6, slot7, slot8, slot9 = slot0.skip(2, slot1.find(slot2, slot3))

	slot0.try(slot4 and slot5 and slot6 and slot7 and slot8 and slot9, slot2)

	slot0.pasvt = {
		address = slot1.format("%d.%d.%d.%d", slot4, slot5, slot6, slot7),
		port = slot8 * 256 + slot9
	}

	if slot0.server then
		slot0.server:close()

		slot0.server = nil
	end

	return slot0.pasvt.address, slot0.pasvt.port
end

()["__index"].epsv = function (slot0)
	slot0.try(slot0.tp:command("epsv"))

	slot1, slot5 = slot0.try(slot0.tp:check("229"))
	slot4, slot5, slot6, slot9 = slot0.match(slot2, slot3)

	slot0.try(slot7, "invalid epsv response")

	slot0.pasvt = {
		address = slot0.tp:getpeername(),
		port = slot7
	}

	if slot0.server then
		slot0.server:close()

		slot0.server = nil
	end

	return slot0.pasvt.address, slot0.pasvt.port
end

()["__index"].port = function (slot0, slot1, slot2)
	slot0.pasvt = nil

	if not slot1 then
		slot1, slot2 = slot0.try(slot0.tp:getsockname())
		slot0.server = slot0.try(slot0.bind(slot1, 0))
		slot1, slot2 = slot0.try(slot0.server:getsockname())

		slot0.try(slot0.server:settimeout(slot1.TIMEOUT))
	end

	slot0.try(slot0.tp:command("port", slot2.gsub(slot2.format("%s,%d,%d", slot1, slot4, slot3), "%.", ",")))
	slot0.try(slot0.tp:check("2.."))

	return 1
end

()["__index"].eprt = function (slot0, slot1, slot2, slot3)
	slot0.pasvt = nil

	if not slot2 then
		slot2, slot3 = slot0.try(slot0.tp:getsockname())
		slot0.server = slot0.try(slot0.bind(slot2, 0))
		slot2, slot3 = slot0.try(slot0.server:getsockname())

		slot0.try(slot0.server:settimeout(slot1.TIMEOUT))
	end

	slot0.try(slot0.tp:command("eprt", slot2.format("|%s|%s|%d|", slot1, slot2, slot3)))
	slot0.try(slot0.tp:check("2.."))

	return 1
end

()["__index"].send = function (slot0, slot1)
	slot0.try(slot0.pasvt or slot0.server, "need port or pasv first")

	if slot0.pasvt then
		slot0:pasvconnect()
	end

	if not slot1.argument then
		slot2 = slot0.unescape(slot1.gsub(slot1.path or "", "^[/\\]", ""))
	end

	if slot2 == "" then
		slot2 = nil
	end

	slot0.try(slot0.tp:command(slot1.command or "stor", slot2))

	slot4, slot5 = slot0.try(slot0.tp:check({
		"2..",
		"1.."
	}))

	if not slot0.pasvt then
		slot0:portconnect()
	end

	slot6 = slot1.step or slot2.pump.step
	slot7 = {
		slot0.tp
	}

	slot0.try(slot2.pump.all(slot1.source, slot3.sink("close-when-done", slot0.data), function (slot0, slot1)
		slot3 = slot0.select(slot1, nil, 0)[slot2] and slot4.try(slot4.tp:check("2.."))

		return slot5(slot0, slot1)
	end))

	if slot1.find(slot4, "1..") then
		slot0.try(slot0.tp:check("2.."))
	end

	slot0.data:close()

	slot0.data = nil

	return slot3.skip(1, slot0.data:getstats())
end

()["__index"].receive = function (slot0, slot1)
	slot0.try(slot0.pasvt or slot0.server, "need port or pasv first")

	if slot0.pasvt then
		slot0:pasvconnect()
	end

	if not slot1.argument then
		slot2 = slot0.unescape(slot1.gsub(slot1.path or "", "^[/\\]", ""))
	end

	if slot2 == "" then
		slot2 = nil
	end

	slot0.try(slot0.tp:command(slot1.command or "retr", slot2))

	slot4, slot5 = slot0.try(slot0.tp:check({
		"1..",
		"2.."
	}))

	if slot4 >= 200 and slot4 <= 299 then
		slot1.sink(slot5)

		return 1
	end

	if not slot0.pasvt then
		slot0:portconnect()
	end

	slot0.try(slot3.pump.all(slot2.source("until-closed", slot0.data), slot1.sink, slot1.step or slot3.pump.step))

	if slot1.find(slot4, "1..") then
		slot0.try(slot0.tp:check("2.."))
	end

	slot0.data:close()

	slot0.data = nil

	return 1
end

()["__index"].cwd = function (slot0, slot1)
	slot0.try(slot0.tp:command("cwd", slot1))
	slot0.try(slot0.tp:check(250))

	return 1
end

()["__index"].type = function (slot0, slot1)
	slot0.try(slot0.tp:command("type", slot1))
	slot0.try(slot0.tp:check(200))

	return 1
end

()["__index"].greet = function (slot0)
	if slot0.find(slot0.try(slot0.tp:check({
		"1..",
		"2.."
	})), "1..") then
		slot0.try(slot0.tp:check("2.."))
	end

	return 1
end

()["__index"].quit = function (slot0)
	slot0.try(slot0.tp:command("quit"))
	slot0.try(slot0.tp:check("2.."))

	return 1
end

()["__index"].close = function (slot0)
	if slot0.data then
		slot0.data:close()
	end

	if slot0.server then
		slot0.server:close()
	end

	return slot0.tp:close()
end

function slot11(slot0)
	if slot0.url then
		for slot5, slot6 in slot1.pairs(slot0) do
			slot1[slot5] = slot6
		end

		return slot1
	else
		return slot0
	end
end

function slot12(slot0)
	slot0(slot0).try(slot0(slot0).host, "missing hostname")

	slot1 = slot2.open(slot0(slot0).host, slot0(slot0).port, slot0(slot0).create)

	slot1:greet()
	slot1:login(slot0(slot0).user, slot0(slot0).password)

	if slot0(slot0).type then
		slot1:type(slot0.type)
	end

	slot1:epsv()
	slot1:quit()
	slot1:close()

	return slot1:send(slot0)
end

slot13 = {
	scheme = "ftp",
	path = "/"
}

function slot4.ftp.genericform(slot0)
	slot0.try(slot0.try(slot1.parse(slot0, slot1.parse)).scheme == "ftp", "wrong scheme '" .. slot1.scheme .. "'")
	slot0.try(slot1.host, "missing hostname")

	slot2 = "^type=(.)$"

	if slot1.params then
		slot1.type = slot0.skip(2, slot3.find(slot1.params, slot2))

		slot0.try(slot1.type == "a" or slot1.type == "i", "invalid type '" .. slot1.type .. "'")
	end

	return slot1
end

function slot15(slot0, slot1)
	slot2 = slot0(slot0)
	slot2.source = slot1.source.string(slot1)

	return slot2(slot2)
end

slot4.ftp.put = slot4.protect(function (slot0, slot1)
	if slot0:type() == "string" then
		return slot1(slot0, slot1)
	else
		return slot2(slot0)
	end
end)

function slot16(slot0)
	slot0(slot0).try(slot0(slot0).host, "missing hostname")

	slot1 = slot2.open(slot0(slot0).host, slot0(slot0).port, slot0(slot0).create)

	slot1:greet()
	slot1:login(slot0(slot0).user, slot0(slot0).password)

	if slot0(slot0).type then
		slot1:type(slot0.type)
	end

	slot1:epsv()
	slot1:receive(slot0)
	slot1:quit()

	return slot1:close()
end

function slot17(slot0)
	slot1 = slot0(slot0)
	slot1.sink = slot1.sink.table(slot2)

	slot2(slot1)

	return slot2.concat({})
end

slot4.ftp.command = slot4.protect(function (slot0)
	slot0(slot0).try(slot0(slot0).host, "missing hostname")
	slot0(slot0).try.try(slot0(slot0).command, "missing command")

	slot1 = slot2.open(slot0(slot0).host, slot0(slot0).port, slot0(slot0).create)

	slot1:greet()
	slot1:login(slot0(slot0).user, slot0(slot0).password)

	if type(slot0(slot0).command) == "table" then
		slot2 = slot0.argument or {}
		slot3 = slot0.check or {}

		for slot7, slot8 in ipairs(slot0.command) do
			slot1.try(slot1.tp:command(slot8, slot2[slot7]))

			if slot3[slot7] then
				slot1.try(slot1.tp:check(slot3[slot7]))
			end
		end
	else
		slot1.try(slot1.tp:command(slot0.command, slot0.argument))

		if slot0.check then
			slot1.try(slot1.tp:check(slot0.check))
		end
	end

	slot1:quit()

	return slot1:close()
end)
slot4.ftp.get = slot4.protect(function (slot0)
	if slot0:type() == "string" then
		return slot1(slot0)
	else
		return slot2(slot0)
	end
end)

return slot4.ftp
