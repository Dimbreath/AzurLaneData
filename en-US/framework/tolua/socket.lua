slot0 = _G
slot1 = require("string")
slot2 = require("math")

require("socket.core").connect4 = function (slot0, slot1, slot2, slot3)
	return slot0:connect(slot1, slot2, slot3, "inet")
end

require("socket.core").connect6 = function (slot0, slot1, slot2, slot3)
	return slot0:connect(slot1, slot2, slot3, "inet6")
end

require("socket.core").bind = function (slot0, slot1, slot2)
	if slot0 == "*" then
		slot0 = "0.0.0.0"
	end

	slot3, slot4 = slot0.dns.getaddrinfo(slot0)

	if not slot3 then
		return nil, slot4
	end

	slot5, slot6 = nil
	slot4 = "no info on address"

	for slot10, slot11 in slot1.ipairs(slot3) do
		if slot11.family == "inet" then
			slot5, slot4 = slot0.tcp4()
		else
			slot5, slot4 = slot0.tcp6()
		end

		if not slot5 then
			return nil, slot4
		end

		slot5:setoption("reuseaddr", true)

		slot6, slot4 = slot5:bind(slot11.addr, slot1)

		if not slot12 then
			slot5:close()
		else
			slot6, slot4 = slot5:listen(slot2)

			if not slot12 then
				slot5:close()
			else
				return slot5
			end
		end
	end

	return nil, slot4
end

require("socket.core").try = require("socket.core").newtry()

require("socket.core").choose = function (slot0)
	return function (slot0, slot1, slot2)
		if slot0:type() ~= "string" then
			slot2 = slot1
			slot1 = slot0
			slot0 = "default"
		end

		if not slot1[slot0 or "nil"] then
			slot0.error("unknown key (" .. slot0:tostring() .. ")", 3)
		else
			return slot3(slot1, slot2)
		end
	end
end

require("socket.core").sourcet = {
	["by-length"] = function (slot0, slot1)
		return slot0.setmetatable({
			getfd = function ()
				return slot0:getfd()
			end,
			dirty = function ()
				return slot0:dirty()
			end
		}, {
			__call = function ()
				if slot0 <= 0 then
					return nil
				end

				slot1, slot2 = slot3:receive(slot1.min(slot2.BLOCKSIZE, slot1.min))

				if slot2 then
					return nil, slot2
				end

				slot0 = slot0 - slot4.len(slot1)

				return slot1
			end
		})
	end,
	["until-closed"] = function (slot0)
		slot1 = nil

		return slot0.setmetatable({
			getfd = function ()
				return slot0:getfd()
			end,
			dirty = function ()
				return slot0:dirty()
			end
		}, {
			__call = function ()
				if slot0 then
					return nil
				end

				slot0, slot1, slot2 = slot1:receive(slot2.BLOCKSIZE)

				if not slot1 then
					return slot0
				elseif slot1 == "closed" then
					slot1:close()

					slot0 = 1

					return slot2
				else
					return nil, slot1
				end
			end
		})
	end,
	default = ()["until-closed"]
}
require("socket.core").sinkt = {
	["close-when-done"] = function (slot0)
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
					slot0:close()

					return 1
				else
					return slot0:send(slot1)
				end
			end
		})
	end,
	["keep-open"] = function (slot0)
		return slot0.setmetatable({
			getfd = function ()
				return slot0:getfd()
			end,
			dirty = function ()
				return slot0:dirty()
			end
		}, {
			__call = function (slot0, slot1, slot2)
				if slot1 then
					return slot0:send(slot1)
				else
					return 1
				end
			end
		})
	end,
	default = ()["keep-open"]
}
require("socket.core").BLOCKSIZE = 2048
require("socket.core").sink = require("socket.core").choose(slot6)
require("socket.core").source = require("socket.core").choose()

return require("socket.core")
