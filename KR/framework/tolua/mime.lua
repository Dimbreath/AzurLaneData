slot0 = _G
slot1 = require("ltn12")
slot3 = require("io")
slot4 = require("string")
require("mime.core").encodet = {
	base64 = function ()
		return slot0.filter.cycle(slot1.b64, "")
	end,
	["quoted-printable"] = function (slot0)
		return slot1(slot1.qp, "", (slot0 == "binary" and "=0D=0A") or "\r\n")
	end
}
require("mime.core").decodet = {
	base64 = function ()
		return slot0.filter.cycle(slot1.unb64, "")
	end,
	["quoted-printable"] = function ()
		return slot0.filter.cycle(slot1.unqp, "")
	end
}
require("mime.core").wrapt = {
	text = function (slot0)
		return slot0 or 76.filter.cycle(slot1.wrp, slot0 or 76, )
	end,
	base64 = ()["text"],
	default = ()["text"],
	["quoted-printable"] = function ()
		return slot0.filter.cycle(slot1.qpwrp, 76, 76)
	end
}

function slot10(slot0)
	if slot0 then
		if slot0 == "" then
			return "''"
		else
			return slot0:len()
		end
	else
		return "nil"
	end
end

require("mime.core").encode = slot9(slot6)
require("mime.core").decode = slot9(slot7)
require("mime.core").wrap = slot9()

require("mime.core").normalize = function (slot0)
	return slot0.filter.cycle(slot1.eol, 0, slot0)
end

require("mime.core").stuff = function ()
	return slot0.filter.cycle(slot1.dot, 2)
end

return require("mime.core")
