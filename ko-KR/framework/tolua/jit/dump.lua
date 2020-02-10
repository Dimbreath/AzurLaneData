slot0 = require
slot1 = "jit"
slot0 = slot0(slot1)
slot1 = require
slot2 = "jit.util"
slot1 = slot1(slot2)
slot2 = require
slot3 = "jit.vmdef"
slot2 = slot2(slot3)
slot3 = slot1.funcinfo
slot4 = slot1.funcbc
slot5 = slot1.traceinfo
slot6 = slot1.traceir
slot7 = slot1.tracek
slot8 = slot1.tracemc
slot9 = slot1.tracesnap
slot10 = slot1.traceexitstub
slot11 = slot1.ircalladdr
slot12 = require
slot13 = "bit"
slot12 = slot12(slot13)
slot13 = slot12.band
slot14 = slot12.rshift
slot15 = slot12.tohex
slot16 = string
slot16 = slot16.sub
slot17 = string
slot17 = slot17.gsub
slot18 = string
slot18 = slot18.format
slot19 = string
slot19 = slot19.byte
slot20 = string
slot20 = slot20.rep
slot21 = type
slot22 = tostring
slot23 = io
slot23 = slot23.stdout
slot24 = io
slot24 = slot24.stderr
slot25, slot26, slot27, slot28, slot29 = nil
slot30 = {
	__index = false
}
slot31 = {}
slot32 = 0

function slot33(slot0, slot1)
	slot2 = {}
	slot3 = uv0
	slot3.__index = slot2
	slot3 = uv1
	slot3 = slot3.arch
	slot4 = slot3
	slot3 = slot3.sub
	slot5 = 1
	slot6 = 4
	slot3 = slot3(slot4, slot5, slot6)

	if slot3 == "mips" then
		slot3 = uv2
		slot4 = slot0
		slot5 = 0
		slot3 = slot3(slot4, slot5)
		slot4 = "exit"
		slot2[slot3] = slot4

		return
	end

	slot3 = 0
	slot4 = slot1 - 1
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot7 = uv2
		slot8 = slot0
		slot9 = slot6
		slot7 = slot7(slot8, slot9)
		slot8 = 0

		if slot7 < slot8 then
			slot7 = slot7 + 4294967296.0
		end

		slot8 = uv3
		slot9 = slot6
		slot8 = slot8(slot9)
		slot2[slot7] = slot8
	end

	slot3 = uv2
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)

	if slot3 then
		slot4 = "stack_check"
		slot2[slot3] = slot4
	end
end

function slot34(slot0, slot1)
	slot2 = uv0
	slot3 = uv1

	if slot3 == 0 then
		slot3 = uv2
		slot3 = slot3.ircall
		slot4 = 0
		slot5 = #slot3
		slot6 = 1

		for slot7 = slot4, slot5, slot6 do
			slot8 = uv3
			slot9 = slot7
			slot8 = slot8(slot9)

			if slot8 ~= 0 then
				slot9 = 0

				if slot8 < slot9 then
					slot8 = slot8 + 4294967296.0
				end

				slot9 = slot3[slot7]
				slot2[slot8] = slot9
			end
		end
	end

	slot3 = uv1

	if slot3 == 1000000 then
		slot3 = uv4
		slot4 = slot0
		slot5 = slot1

		slot3(slot4, slot5)
	else
		slot3 = uv1

		if slot3 < slot1 then
			slot3 = uv1
			slot4 = slot1 - 1
			slot5 = 1

			for slot6 = slot3, slot4, slot5 do
				slot7 = uv5
				slot8 = slot6
				slot7 = slot7(slot8)

				if slot7 == nil then
					slot8 = uv4
					slot9 = slot0
					slot10 = slot1

					slot8(slot9, slot10)

					slot8 = setmetatable
					slot9 = uv0
					slot10 = uv6

					slot8(slot9, slot10)

					slot1 = 1000000

					break
				end

				slot8 = 0

				if slot7 < slot8 then
					slot7 = slot7 + 4294967296.0
				end

				slot8 = uv7
				slot9 = slot6
				slot8 = slot8(slot9)
				slot2[slot7] = slot8
			end

			uv1 = slot1
		end
	end

	return slot2
end

function slot35(slot0)
	slot1 = uv0
	slot2 = slot1
	slot1 = slot1.write
	slot3 = slot0

	slot1(slot2, slot3)
end

function slot36(slot0)
	slot1 = uv0
	slot2 = slot0
	slot1 = slot1(slot2)

	if not slot1 then
		return
	end

	slot2 = uv1
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	if not slot2 then
		return
	end

	slot5 = uv2

	if not slot5 then
		slot5 = require
		slot6 = "jit.dis_"
		slot7 = uv3
		slot7 = slot7.arch
		slot6 = slot6 .. slot7
		slot5 = slot5(slot6)
		uv2 = slot5
	end

	slot5 = 0

	if slot3 < slot5 then
		slot3 = slot3 + 4294967296.0
	end

	slot5 = uv4
	slot6 = slot5
	slot5 = slot5.write
	slot7 = "---- TRACE "
	slot8 = slot0
	slot9 = " mcode "
	slot10 = #slot2
	slot11 = "\n"

	slot5(slot6, slot7, slot8, slot9, slot10, slot11)

	slot5 = uv2
	slot5 = slot5.create
	slot6 = slot2
	slot7 = slot3
	slot8 = uv5
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = 0
	slot5.hexdump = slot6
	slot6 = uv6
	slot7 = slot0
	slot8 = slot1.nexit
	slot6 = slot6(slot7, slot8)
	slot5.symtab = slot6

	if slot4 ~= 0 then
		slot6 = uv7
		slot7 = slot3 + slot4
		slot8 = "LOOP"
		slot6[slot7] = slot8
		slot7 = slot5
		slot6 = slot5.disass
		slot8 = 0
		slot9 = slot4

		slot6(slot7, slot8, slot9)

		slot6 = uv4
		slot7 = slot6
		slot6 = slot6.write
		slot8 = "->LOOP:\n"

		slot6(slot7, slot8)

		slot7 = slot5
		slot6 = slot5.disass
		slot8 = slot4
		slot9 = #slot2
		slot9 = slot9 - slot4

		slot6(slot7, slot8, slot9)

		slot6 = uv7
		slot7 = slot3 + slot4
		slot8 = nil
		slot6[slot7] = slot8
	else
		slot7 = slot5
		slot6 = slot5.disass
		slot8 = 0
		slot9 = #slot2

		slot6(slot7, slot8, slot9)
	end
end

slot37 = {
	[0] = "nil",
	"fal",
	"tru",
	"lud",
	"str",
	"p32",
	"thr",
	"pro",
	"fun",
	"p64",
	"cdt",
	"tab",
	"udt",
	"flt",
	"num",
	"i8 ",
	"u8 ",
	"i16",
	"u16",
	"int",
	"u32",
	"i64",
	"u64",
	"sfp"
}
slot38 = {
	[0] = "%s",
	"%s",
	"%s",
	"[36m%s[m",
	"[32m%s[m",
	"%s",
	"[1m%s[m",
	"%s",
	"[1m%s[m",
	"%s",
	"[33m%s[m",
	"[31m%s[m",
	"[36m%s[m",
	"[34m%s[m",
	"[34m%s[m",
	"[35m%s[m",
	"[35m%s[m",
	"[35m%s[m",
	"[35m%s[m",
	"[35m%s[m",
	"[35m%s[m",
	"[35m%s[m",
	"[35m%s[m",
	"[35m%s[m"
}

function slot39(slot0)
	return slot0
end

function slot40(slot0, slot1)
	slot2 = uv0
	slot3 = uv1
	slot3 = slot3[slot1]
	slot4 = slot0

	return slot2(slot3, slot4)
end

slot41 = setmetatable
slot42 = {}
slot43 = {}

function slot44(slot0, slot1)
	slot2 = uv0
	slot3 = uv1
	slot3 = slot3[slot1]
	slot4 = slot1
	slot2 = slot2(slot3, slot4)
	slot0[slot1] = slot2

	return slot2
end

slot43.__index = slot44
slot41 = slot41(slot42, slot43)
slot42 = {
	[">"] = "&gt;",
	["<"] = "&lt;",
	["&"] = "&amp;"
}

function slot43(slot0, slot1)
	slot2 = uv0
	slot3 = slot0
	slot4 = "[<>&]"
	slot5 = uv1
	slot2 = slot2(slot3, slot4, slot5)
	slot0 = slot2
	slot2 = uv2
	slot3 = "<span class=\"irt_%s\">%s</span>"
	slot4 = uv3
	slot4 = slot4[slot1]
	slot5 = slot0

	return slot2(slot3, slot4, slot5)
end

slot44 = setmetatable
slot45 = {}
slot46 = {}

function slot47(slot0, slot1)
	slot2 = uv0
	slot3 = uv1
	slot3 = slot3[slot1]
	slot4 = slot1
	slot2 = slot2(slot3, slot4)
	slot0[slot1] = slot2

	return slot2
end

slot46.__index = slot47
slot44 = slot44(slot45, slot46)
slot45 = [[
<style type="text/css">
background { background: #ffffff; color: #000000; }
pre.ljdump {
font-size: 10pt;
background: #f0f4ff;
color: #000000;
border: 1px solid #bfcfff;
padding: 0.5em;
margin-left: 2em;
margin-right: 2em;
}
span.irt_str { color: #00a000; }
span.irt_thr, span.irt_fun { color: #404040; font-weight: bold; }
span.irt_tab { color: #c00000; }
span.irt_udt, span.irt_lud { color: #00c0c0; }
span.irt_num { color: #4040c0; }
span.irt_int, span.irt_i8, span.irt_u8, span.irt_i16, span.irt_u16 { color: #b040b0; }
</style>
]]
slot46, slot47 = nil
slot48 = {}
slot49 = setmetatable
slot50 = {}
slot51 = {}

function slot52(slot0, slot1)
	slot2 = ""
	slot3 = uv0
	slot4 = slot1
	slot5 = 1
	slot3 = slot3(slot4, slot5)

	if slot3 ~= 0 then
		slot3 = slot2
		slot4 = "P"
		slot2 = slot3 .. slot4
	end

	slot3 = uv0
	slot4 = slot1
	slot5 = 2
	slot3 = slot3(slot4, slot5)

	if slot3 ~= 0 then
		slot3 = slot2
		slot4 = "F"
		slot2 = slot3 .. slot4
	end

	slot3 = uv0
	slot4 = slot1
	slot5 = 4
	slot3 = slot3(slot4, slot5)

	if slot3 ~= 0 then
		slot3 = slot2
		slot4 = "T"
		slot2 = slot3 .. slot4
	end

	slot3 = uv0
	slot4 = slot1
	slot5 = 8
	slot3 = slot3(slot4, slot5)

	if slot3 ~= 0 then
		slot3 = slot2
		slot4 = "C"
		slot2 = slot3 .. slot4
	end

	slot3 = uv0
	slot4 = slot1
	slot5 = 16
	slot3 = slot3(slot4, slot5)

	if slot3 ~= 0 then
		slot3 = slot2
		slot4 = "R"
		slot2 = slot3 .. slot4
	end

	slot3 = uv0
	slot4 = slot1
	slot5 = 32
	slot3 = slot3(slot4, slot5)

	if slot3 ~= 0 then
		slot3 = slot2
		slot4 = "I"
		slot2 = slot3 .. slot4
	end

	slot0[slot1] = slot2

	return slot2
end

slot51.__index = slot52
slot49 = slot49(slot50, slot51)
slot48["SLOAD "] = slot49
slot49 = {
	[0] = "",
	"R",
	"V",
	"RV",
	"U",
	"RU",
	"VU",
	"RVU"
}
slot48["XLOAD "] = slot49
slot49 = setmetatable
slot50 = {}
slot51 = {}

function slot52(slot0, slot1)
	slot2 = uv0
	slot3 = uv1
	slot4 = slot1
	slot5 = 31
	slot3 = slot3(slot4, slot5)
	slot2 = slot2[slot3]
	slot3 = uv0
	slot4 = uv1
	slot5 = uv2
	slot6 = slot1
	slot7 = 5
	slot5 = slot5(slot6, slot7)
	slot6 = 31
	slot4 = slot4(slot5, slot6)
	slot3 = slot3[slot4]
	slot4 = "."
	slot5 = slot2
	slot2 = slot3 .. slot4 .. slot5
	slot3 = uv1
	slot4 = slot1
	slot5 = 2048
	slot3 = slot3(slot4, slot5)

	if slot3 ~= 0 then
		slot3 = slot2
		slot4 = " sext"
		slot2 = slot3 .. slot4
	end

	slot3 = uv2
	slot4 = slot1
	slot5 = 14
	slot3 = slot3(slot4, slot5)

	if slot3 == 2 then
		slot4 = slot2
		slot5 = " index"
		slot2 = slot4 .. slot5
	elseif slot3 == 3 then
		slot4 = slot2
		slot5 = " check"
		slot2 = slot4 .. slot5
	end

	slot0[slot1] = slot2

	return slot2
end

slot51.__index = slot52
slot49 = slot49(slot50, slot51)
slot48["CONV  "] = slot49
slot49 = slot2.irfield
slot48["FLOAD "] = slot49
slot49 = slot2.irfield
slot48["FREF  "] = slot49
slot49 = slot2.irfpm
slot48.FPMATH = slot49
slot49 = {
	[0] = "RESET",
	"APPEND"
}
slot48.BUFHDR = slot49
slot49 = {
	[0] = "INT",
	"NUM",
	"CHAR"
}
slot48["TOSTR "] = slot49

function slot49(slot0)
	if slot0 == "\n" then
		slot1 = "\\n"

		return slot1
	elseif slot0 == "\r" then
		slot1 = "\\r"

		return slot1
	elseif slot0 == "\t" then
		slot1 = "\\t"

		return slot1
	else
		slot1 = uv0
		slot2 = "\\%03d"
		slot3 = uv1
		slot4 = slot0

		return slot1(slot2, slot3(slot4))
	end
end

function slot50(slot0, slot1)
	slot2 = uv0
	slot3 = slot0
	slot4 = slot1
	slot2 = slot2(slot3, slot4)
	slot3 = slot2.loc

	if slot3 then
		slot3 = slot2.loc

		return slot3
	else
		slot3 = slot2.ffid

		if slot3 then
			slot3 = uv1
			slot3 = slot3.ffnames
			slot4 = slot2.ffid
			slot3 = slot3[slot4]

			return slot3
		else
			slot3 = slot2.addr

			if slot3 then
				slot3 = uv2
				slot4 = "C:%x"
				slot5 = slot2.addr

				return slot3(slot4, slot5)
			else
				slot3 = "(?)"

				return slot3
			end
		end
	end
end

function slot51(slot0, slot1, slot2)
	slot3 = uv0
	slot4 = slot0
	slot5 = slot1
	slot3, slot4, slot5 = slot3(slot4, slot5)
	slot6 = uv1
	slot7 = slot3
	slot6 = slot6(slot7)
	slot7 = nil

	if slot6 == "number" then
		if uv2(slot2 or 0, 196608) ~= 0 then
			slot7 = uv2(slot2, 131072) ~= 0 and "contpc" or "ftsz"
		elseif slot3 == 6755399441055744.0 then
			slot7 = "bias"
		else
			slot8 = uv3
			slot9 = 0

			if slot3 > slot9 then
				slot7 = slot8(slot3 < 1.390671161567e-309 and "%+a" or "%+.14g", slot3)
			end
		end
	elseif slot6 == "string" then
		slot7 = uv3(#slot3 > 20 and "\"%.20s\"~" or "\"%s\"", uv4(slot3, "%c", uv5))
	elseif slot6 == "function" then
		slot8 = uv6
		slot9 = slot3
		slot8 = slot8(slot9)
		slot7 = slot8
	elseif slot6 == "table" then
		slot8 = uv3
		slot9 = "{%p}"
		slot10 = slot3
		slot8 = slot8(slot9, slot10)
		slot7 = slot8
	elseif slot6 == "userdata" then
		if slot4 == 12 then
			slot8 = uv3
			slot9 = "userdata:%p"
			slot10 = slot3
			slot8 = slot8(slot9, slot10)
			slot7 = slot8
		else
			slot8 = uv3
			slot9 = "[%p]"
			slot10 = slot3
			slot8 = slot8(slot9, slot10)
			slot7 = slot8

			if slot7 == "[NULL]" then
				slot7 = "NULL"
			end
		end
	elseif slot4 == 21 then
		slot8 = uv7
		slot9 = uv8
		slot10 = slot3
		slot9 = slot9(slot10)
		slot10 = 1
		slot11 = -3
		slot8 = slot8(slot9, slot10, slot11)
		slot7 = slot8
		slot8 = uv7
		slot9 = slot7
		slot10 = 1
		slot11 = 1
		slot8 = slot8(slot9, slot10, slot11)

		if slot8 ~= "-" then
			slot8 = "+"
			slot9 = slot7
			slot7 = slot8 .. slot9
		end
	elseif slot2 == 17137663 then
		slot8 = "----"

		return slot8
	else
		slot8 = uv8
		slot9 = slot3
		slot8 = slot8(slot9)
		slot7 = slot8
	end

	slot8 = uv9
	slot9 = uv3
	slot10 = "%-4s"
	slot11 = slot7
	slot9 = slot9(slot10, slot11)
	slot10 = slot4
	slot8 = slot8(slot9, slot10)
	slot7 = slot8

	if slot5 then
		slot8 = uv3
		slot9 = "%s @%d"
		slot10 = slot7
		slot11 = slot5
		slot8 = slot8(slot9, slot10, slot11)
		slot7 = slot8
	end

	return slot7
end

function slot52(slot0, slot1)
	slot2 = 2
	slot3 = 0
	slot4 = slot1[1]
	slot4 = slot4 - 1
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot7 = slot1[slot2]
		slot8 = uv0
		slot9 = slot7
		slot10 = 24
		slot8 = slot8(slot9, slot10)

		if slot8 == slot6 then
			slot2 = slot2 + 1
			slot8 = uv1
			slot9 = slot7
			slot10 = 65535
			slot8 = slot8(slot9, slot10)
			slot8 = slot8 - 32768
			slot9 = 0

			if slot8 < slot9 then
				slot9 = uv2
				slot10 = slot9
				slot9 = slot9.write
				slot11 = uv3
				slot12 = slot0
				slot13 = slot8
				slot14 = slot7

				slot9(slot10, slot11(slot12, slot13, slot14))
			else
				slot9 = uv1
				slot10 = slot7
				slot11 = 524288
				slot9 = slot9(slot10, slot11)

				if slot9 ~= 0 then
					slot9 = uv2
					slot10 = slot9
					slot9 = slot9.write
					slot11 = uv4
					slot12 = uv5
					slot13 = "%04d/%04d"
					slot14 = slot8
					slot15 = slot8 + 1
					slot12 = slot12(slot13, slot14, slot15)
					slot13 = 14

					slot9(slot10, slot11(slot12, slot13))
				else
					slot9 = uv6
					slot10 = slot0
					slot11 = slot8
					slot9, slot10, slot11, slot12 = slot9(slot10, slot11)
					slot13 = uv2
					slot14 = slot13
					slot13 = slot13.write
					slot15 = uv4
					slot16 = uv5
					slot17 = "%04d"
					slot18 = slot8
					slot16 = slot16(slot17, slot18)
					slot17 = uv1
					slot18 = slot10
					slot19 = 31

					slot13(slot14, slot15(slot16, slot17(slot18, slot19)))
				end
			end

			slot9 = uv2

			slot9.write(slot9, uv1(slot7, 65536) == 0 and " " or "|")
		else
			slot8 = uv2
			slot9 = slot8
			slot8 = slot8.write
			slot10 = "---- "

			slot8(slot9, slot10)
		end
	end

	slot3 = uv2
	slot4 = slot3
	slot3 = slot3.write
	slot5 = "]\n"

	slot3(slot4, slot5)
end

function slot53(slot0)
	slot1 = uv0
	slot2 = slot1
	slot1 = slot1.write
	slot3 = "---- TRACE "
	slot4 = slot0
	slot5 = " snapshots\n"

	slot1(slot2, slot3, slot4, slot5)

	slot1 = 0
	slot2 = 1000000000
	slot3 = 1

	for slot4 = slot1, slot2, slot3 do
		slot5 = uv1
		slot6 = slot0
		slot7 = slot4
		slot5 = slot5(slot6, slot7)

		if not slot5 then
			break
		end

		slot6 = uv0
		slot7 = slot6
		slot6 = slot6.write
		slot8 = uv2
		slot9 = "#%-3d %04d [ "
		slot10 = slot4
		slot11 = slot5[0]

		slot6(slot7, slot8(slot9, slot10, slot11))

		slot6 = uv3
		slot7 = slot0
		slot8 = slot5

		slot6(slot7, slot8)
	end
end

function slot54(slot0, slot1)
	slot2 = uv0

	if not slot2 then
		slot2 = require
		slot3 = "jit.dis_"
		slot4 = uv1
		slot4 = slot4.arch
		slot3 = slot3 .. slot4
		slot2 = slot2(slot3)
		uv0 = slot2
	end

	slot2 = uv2
	slot3 = slot0
	slot4 = 255
	slot2 = slot2(slot3, slot4)
	slot3 = uv3
	slot4 = slot0
	slot5 = 8
	slot3 = slot3(slot4, slot5)

	if slot2 == 253 or slot2 == 254 then
		if slot3 == 0 or slot3 == 255 then
			slot4 = " {sink"
		else
			slot4 = uv4
			slot5 = " {%04d"
			slot6 = slot1 - slot3
			slot4 = slot4(slot5, slot6)
		end

		return slot4
	end

	slot4 = 255

	if slot0 > slot4 then
		slot4 = uv4
		slot5 = "[%x]"
		slot6 = slot3 * 4

		return slot4(slot5, slot6)
	end

	slot4 = 128

	if slot2 < slot4 then
		slot4 = uv0
		slot4 = slot4.regname
		slot5 = slot2

		return slot4(slot5)
	end

	slot4 = ""

	return slot4
end

function slot55(slot0, slot1)
	slot2 = nil
	slot3 = 0

	if slot1 > slot3 then
		slot3 = uv0
		slot4 = slot0
		slot5 = slot1
		slot3, slot4, slot5, slot6 = slot3(slot4, slot5)
		slot7 = uv1
		slot8 = slot4
		slot9 = 31
		slot7 = slot7(slot8, slot9)

		if slot7 == 0 then
			slot1 = slot5
			slot7 = uv2
			slot8 = slot0
			slot9 = slot6
			slot7 = slot7(slot8, slot9)
			slot2 = slot7
		end
	end

	slot3 = 0

	if slot1 < slot3 then
		slot3 = uv3
		slot4 = slot3
		slot3 = slot3.write
		slot5 = uv4
		slot6 = "[0x%x]("
		slot7 = tonumber
		slot8 = uv5
		slot9 = slot0
		slot10 = slot1
		slot8 = slot8(slot9, slot10)

		slot3(slot4, slot5(slot6, slot7(slot8)))
	else
		slot3 = uv3
		slot4 = slot3
		slot3 = slot3.write
		slot5 = uv4
		slot6 = "%04d ("
		slot7 = slot1

		slot3(slot4, slot5(slot6, slot7))
	end

	return slot2
end

function slot56(slot0, slot1)
	slot2 = 0

	if slot1 < slot2 then
		slot2 = uv0
		slot3 = slot2
		slot2 = slot2.write
		slot4 = uv1
		slot5 = slot0
		slot6 = slot1

		slot2(slot3, slot4(slot5, slot6))
	else
		slot2 = uv2
		slot3 = slot0
		slot4 = slot1
		slot2, slot3, slot4, slot5 = slot2(slot3, slot4)
		slot6 = uv3
		slot7 = slot3
		slot8 = 8
		slot6 = slot6(slot7, slot8)
		slot6 = 6 * slot6
		slot7 = uv4
		slot8 = uv5
		slot8 = slot8.irnames
		slot9 = slot6 + 1
		slot10 = slot6 + 6
		slot7 = slot7(slot8, slot9, slot10)

		if slot7 == "CARG  " then
			slot8 = uv6
			slot9 = slot0
			slot10 = slot4

			slot8(slot9, slot10)

			slot8 = 0

			if slot5 < slot8 then
				slot8 = uv0
				slot9 = slot8
				slot8 = slot8.write
				slot10 = " "
				slot11 = uv1
				slot12 = slot0
				slot13 = slot5

				slot8(slot9, slot10, slot11(slot12, slot13))
			else
				slot8 = uv0
				slot9 = slot8
				slot8 = slot8.write
				slot10 = " "
				slot11 = uv7
				slot12 = "%04d"
				slot13 = slot5

				slot8(slot9, slot10, slot11(slot12, slot13))
			end
		else
			slot8 = uv0
			slot9 = slot8
			slot8 = slot8.write
			slot10 = uv7
			slot11 = "%04d"
			slot12 = slot1

			slot8(slot9, slot10(slot11, slot12))
		end
	end
end

function slot57(slot0, slot1, slot2)
	slot3 = uv0
	slot4 = slot0
	slot3 = slot3(slot4)

	if not slot3 then
		return
	end

	slot4 = slot3.nins
	slot5 = uv1
	slot6 = slot5
	slot5 = slot5.write
	slot7 = "---- TRACE "
	slot8 = slot0
	slot9 = " IR\n"

	slot5(slot6, slot7, slot8, slot9)

	slot5 = uv2
	slot5 = slot5.irnames
	slot6 = 65536
	slot7, slot8 = nil

	if slot1 then
		slot9 = uv3
		slot10 = slot0
		slot11 = 0
		slot9 = slot9(slot10, slot11)
		slot7 = slot9
		slot6 = slot7[0]
		slot8 = 0
	end

	slot9 = 1
	slot10 = slot4
	slot11 = 1

	for slot12 = slot9, slot10, slot11 do
		if slot6 <= slot12 then

			-- Decompilation error in this vicinity:
			if slot2 then
				slot13 = uv1
				slot14 = slot13
				slot13 = slot13.write
				slot15 = uv4
				slot16 = "....              SNAP   #%-3d [ "
				slot17 = slot8

				slot13(slot14, slot15(slot16, slot17))
			else
				slot13 = uv1
				slot14 = slot13
				slot13 = slot13.write
				slot15 = uv4
				slot16 = "....        SNAP   #%-3d [ "
				slot17 = slot8

				slot13(slot14, slot15(slot16, slot17))
			end

			slot13 = uv5
			slot14 = slot0
			slot15 = slot7

			slot13(slot14, slot15)

			slot8 = slot8 + 1
			slot13 = uv3
			slot14 = slot0
			slot15 = slot8
			slot13 = slot13(slot14, slot15)
			slot7 = slot13
			slot6 = slot7[0] or 65536
		end

		slot13 = uv6
		slot14 = slot0
		slot15 = slot12
		slot13, slot14, slot15, slot16, slot17 = slot13(slot14, slot15)
		slot18 = uv7
		slot19 = slot14
		slot20 = 8
		slot18 = slot18(slot19, slot20)
		slot18 = 6 * slot18
		slot19 = uv8
		slot20 = slot14
		slot21 = 31
		slot19 = slot19(slot20, slot21)
		slot20 = uv9
		slot21 = slot5
		slot22 = slot18 + 1
		slot23 = slot18 + 6
		slot20 = slot20(slot21, slot22, slot23)

		if slot20 == "LOOP  " then
			if slot2 then
				slot21 = uv1
				slot22 = slot21
				slot21 = slot21.write
				slot23 = uv4
				slot24 = "%04d ------------ LOOP ------------\n"
				slot25 = slot12

				slot21(slot22, slot23(slot24, slot25))
			else
				slot21 = uv1
				slot22 = slot21
				slot21 = slot21.write
				slot23 = uv4
				slot24 = "%04d ------ LOOP ------------\n"
				slot25 = slot12

				slot21(slot22, slot23(slot24, slot25))
			end
		elseif slot20 ~= "NOP   " and slot20 ~= "CARG  " and (slot2 or slot20 ~= "RENAME") then
			slot21 = uv8
			slot22 = slot17
			slot23 = 255
			slot21 = slot21(slot22, slot23)

			if slot2 then
				slot22 = uv1
				slot23 = slot22
				slot22 = slot22.write
				slot24 = uv4
				slot25 = "%04d %-6s"
				slot26 = slot12
				slot27 = uv10
				slot28 = slot17
				slot29 = slot12

				slot22(slot23, slot24(slot25, slot26, slot27(slot28, slot29)))
			else
				slot22 = uv1
				slot23 = slot22
				slot22 = slot22.write
				slot24 = uv4
				slot25 = "%04d "
				slot26 = slot12

				slot22(slot23, slot24(slot25, slot26))
			end

			slot22 = uv1
			slot23 = slot22
			slot22 = slot22.write
			slot24 = uv4
			slot25 = "%s%s %s %s "

			if slot21 == 254 or slot21 == 253 then
				slot26 = "}"
			else
				slot26 = uv8
				slot27 = slot14
				slot28 = 128
				slot26 = slot26(slot27, slot28)
				slot26 = slot26 == 0 and " " or ">"
			end

			slot22(slot23, slot24(slot25, slot26, uv8(slot14, 64) == 0 and " " or "+", uv11[slot19], slot20))

			slot22 = uv8(slot13, 3)
			slot23 = uv8(slot13, 12)

			if uv9(slot20, 1, 4) == "CALL" then
				slot24 = nil

				if slot23 == 4 then
					slot25 = uv1
					slot26 = slot25
					slot25 = slot25.write
					slot27 = uv4
					slot28 = "%-10s  ("
					slot29 = uv2
					slot29 = slot29.ircall
					slot29 = slot29[slot16]

					slot25(slot26, slot27(slot28, slot29))
				else
					slot25 = uv12
					slot26 = slot0
					slot27 = slot16
					slot25 = slot25(slot26, slot27)
					slot24 = slot25
				end

				if slot15 ~= -1 then
					slot25 = uv13
					slot26 = slot0
					slot27 = slot15

					slot25(slot26, slot27)
				end

				slot25 = uv1
				slot26 = slot25
				slot25 = slot25.write
				slot27 = ")"

				slot25(slot26, slot27)

				if slot24 then
					slot25 = uv1
					slot26 = slot25
					slot25 = slot25.write
					slot27 = " ctype "
					slot28 = slot24

					slot25(slot26, slot27, slot28)
				end
			elseif slot20 == "CNEW  " and slot16 == -1 then
				slot24 = uv1
				slot25 = slot24
				slot24 = slot24.write
				slot26 = uv14
				slot27 = slot0
				slot28 = slot15

				slot24(slot25, slot26(slot27, slot28))
			elseif slot22 ~= 3 then
				slot24 = 0

				if slot15 < slot24 then
					slot24 = uv1
					slot25 = slot24
					slot24 = slot24.write
					slot26 = uv14
					slot27 = slot0
					slot28 = slot15

					slot24(slot25, slot26(slot27, slot28))
				else
					slot24 = uv1

					slot24.write(slot24, uv4(slot22 == 0 and "%04d" or "#%-3d", slot15))
				end

				if slot23 ~= 12 then
					if slot23 == 4 then
						slot24 = uv15
						slot24 = slot24[slot20]

						if slot24 then
							slot25 = slot24[slot16]

							if slot25 then
								slot25 = uv1
								slot26 = slot25
								slot25 = slot25.write
								slot27 = "  "
								slot28 = slot24[slot16]

								slot25(slot26, slot27, slot28)
							end
						elseif slot20 == "UREFO " or slot20 == "UREFC " then
							slot25 = uv1
							slot26 = slot25
							slot25 = slot25.write
							slot27 = uv4
							slot28 = "  #%-3d"
							slot29 = uv7
							slot30 = slot16
							slot31 = 8

							slot25(slot26, slot27(slot28, slot29(slot30, slot31)))
						else
							slot25 = uv1
							slot26 = slot25
							slot25 = slot25.write
							slot27 = uv4
							slot28 = "  #%-3d"
							slot29 = slot16

							slot25(slot26, slot27(slot28, slot29))
						end
					else
						slot24 = 0

						if slot16 < slot24 then
							slot24 = uv1
							slot25 = slot24
							slot24 = slot24.write
							slot26 = "  "
							slot27 = uv14
							slot28 = slot0
							slot29 = slot16

							slot24(slot25, slot26, slot27(slot28, slot29))
						else
							slot24 = uv1
							slot25 = slot24
							slot24 = slot24.write
							slot26 = uv4
							slot27 = "  %04d"
							slot28 = slot16

							slot24(slot25, slot26(slot27, slot28))
						end
					end
				end
			end

			slot24 = uv1
			slot25 = slot24
			slot24 = slot24.write
			slot26 = "\n"

			slot24(slot25, slot26)
		end
	end

	if slot7 then
		if slot2 then
			slot9 = uv1
			slot10 = slot9
			slot9 = slot9.write
			slot11 = uv4
			slot12 = "....              SNAP   #%-3d [ "
			slot13 = slot8

			slot9(slot10, slot11(slot12, slot13))
		else
			slot9 = uv1
			slot10 = slot9
			slot9 = slot9.write
			slot11 = uv4
			slot12 = "....        SNAP   #%-3d [ "
			slot13 = slot8

			slot9(slot10, slot11(slot12, slot13))
		end

		slot9 = uv5
		slot10 = slot0
		slot11 = slot7

		slot9(slot10, slot11)
	end
end

slot58 = ""
slot59 = 0

function slot60(slot0, slot1)
	slot2 = uv0
	slot3 = slot0
	slot2 = slot2(slot3)

	if slot2 == "number" then
		slot2 = uv0
		slot3 = slot1
		slot2 = slot2(slot3)

		if slot2 == "function" then
			slot2 = uv1
			slot3 = slot1
			slot2 = slot2(slot3)
			slot1 = slot2
		end

		slot2 = uv2
		slot3 = uv3
		slot3 = slot3.traceerr
		slot3 = slot3[slot0]
		slot4 = slot1
		slot2 = slot2(slot3, slot4)
		slot0 = slot2
	end

	return slot0
end

function slot61(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0 ~= "stop" and slot0 == "abort" then
		slot6 = uv0
		slot6 = slot6.a

		if slot6 then
			slot6 = uv0
			slot6 = slot6.i

			if slot6 then
				uv1(slot1, uv0.s, uv0.r and slot0 == "stop")
			else
				slot6 = uv0
				slot6 = slot6.s

				if slot6 then
					slot6 = uv2
					slot7 = slot1

					slot6(slot7)
				end
			end

			slot6 = uv0
			slot6 = slot6.m

			if slot6 then
				slot6 = uv3
				slot7 = slot1

				slot6(slot7)
			end
		end
	end

	if slot0 == "start" then
		slot6 = uv0
		slot6 = slot6.H

		if slot6 then
			slot6 = uv4
			slot7 = slot6
			slot6 = slot6.write
			slot8 = "<pre class=\"ljdump\">\n"

			slot6(slot7, slot8)
		end

		slot6 = uv4
		slot7 = slot6
		slot6 = slot6.write
		slot8 = "---- TRACE "
		slot9 = slot1
		slot10 = " "
		slot11 = slot0

		slot6(slot7, slot8, slot9, slot10, slot11)

		if slot4 then
			slot6 = uv4

			slot6.write(slot6, " ", slot4, "/", slot5 == -1 and "stitch" or slot5)
		end

		slot6 = uv4
		slot7 = slot6
		slot6 = slot6.write
		slot8 = " "
		slot9 = uv5
		slot10 = slot2
		slot11 = slot3
		slot9 = slot9(slot10, slot11)
		slot10 = "\n"

		slot6(slot7, slot8, slot9, slot10)
	elseif slot0 == "stop" or slot0 == "abort" then
		slot6 = uv4
		slot7 = slot6
		slot6 = slot6.write
		slot8 = "---- TRACE "
		slot9 = slot1
		slot10 = " "
		slot11 = slot0

		slot6(slot7, slot8, slot9, slot10, slot11)

		if slot0 == "abort" then
			slot6 = uv4
			slot7 = slot6
			slot6 = slot6.write
			slot8 = " "
			slot9 = uv5
			slot10 = slot2
			slot11 = slot3
			slot9 = slot9(slot10, slot11)
			slot10 = " -- "
			slot11 = uv6
			slot12 = slot4
			slot13 = slot5
			slot11 = slot11(slot12, slot13)
			slot12 = "\n"

			slot6(slot7, slot8, slot9, slot10, slot11, slot12)
		else
			slot6 = uv7
			slot7 = slot1
			slot6 = slot6(slot7)
			slot7 = slot6.link
			slot8 = slot6.linktype

			if slot7 == slot1 or slot7 == 0 then
				slot9 = uv4
				slot10 = slot9
				slot9 = slot9.write
				slot11 = " -> "
				slot12 = slot8
				slot13 = "\n"

				slot9(slot10, slot11, slot12, slot13)
			elseif slot8 == "root" then
				slot9 = uv4
				slot10 = slot9
				slot9 = slot9.write
				slot11 = " -> "
				slot12 = slot7
				slot13 = "\n"

				slot9(slot10, slot11, slot12, slot13)
			else
				slot9 = uv4
				slot10 = slot9
				slot9 = slot9.write
				slot11 = " -> "
				slot12 = slot7
				slot13 = " "
				slot14 = slot8
				slot15 = "\n"

				slot9(slot10, slot11, slot12, slot13, slot14, slot15)
			end
		end

		slot6 = uv0
		slot6 = slot6.H

		if slot6 then
			slot6 = uv4
			slot7 = slot6
			slot6 = slot6.write
			slot8 = "</pre>\n\n"

			slot6(slot7, slot8)
		else
			slot6 = uv4
			slot7 = slot6
			slot6 = slot6.write
			slot8 = "\n"

			slot6(slot7, slot8)
		end
	else
		if slot0 == "flush" then
			slot6 = {}
			uv9 = 0
			uv8 = slot6
		end

		slot6 = uv4
		slot7 = slot6
		slot6 = slot6.write
		slot8 = "---- TRACE "
		slot9 = slot0
		slot10 = "\n\n"

		slot6(slot7, slot8, slot9, slot10)
	end

	slot6 = uv4
	slot7 = slot6
	slot6 = slot6.flush

	slot6(slot7)
end

function slot62(slot0, slot1, slot2, slot3, slot4)
	slot5 = uv0

	if slot3 ~= slot5 then
		uv0 = slot3
		slot5 = uv2
		slot6 = " ."
		slot7 = slot3
		slot5 = slot5(slot6, slot7)
		uv1 = slot5
	end

	slot5 = nil
	slot6 = 0

	if slot2 >= slot6 then
		slot6 = uv3
		slot7 = slot1
		slot8 = slot2
		slot9 = uv1
		slot6 = slot6(slot7, slot8, slot9)
		slot5 = slot6
		slot6 = uv4
		slot6 = slot6.H

		if slot6 then
			slot6 = uv5
			slot7 = slot5
			slot8 = "[<>&]"
			slot9 = uv6
			slot6 = slot6(slot7, slot8, slot9)
			slot5 = slot6
		end
	else
		slot6 = "0000 "
		slot7 = uv1
		slot8 = " FUNCC      \n"
		slot5 = slot6 .. slot7 .. slot8
		slot4 = slot1
	end

	slot6 = 0

	if slot2 <= slot6 then
		slot6 = uv7
		slot7 = slot6
		slot6 = slot6.write
		slot8 = uv8
		slot9 = slot5
		slot10 = 1
		slot11 = -2
		slot8 = slot8(slot9, slot10, slot11)
		slot9 = "         ; "
		slot10 = uv9
		slot11 = slot1
		slot10 = slot10(slot11)
		slot11 = "\n"

		slot6(slot7, slot8, slot9, slot10, slot11)
	else
		slot6 = uv7
		slot7 = slot6
		slot6 = slot6.write
		slot8 = slot5

		slot6(slot7, slot8)
	end

	slot6 = 0

	if slot2 >= slot6 then
		slot6 = uv10
		slot7 = uv11
		slot8 = slot1
		slot9 = slot2
		slot7 = slot7(slot8, slot9)
		slot8 = 255
		slot6 = slot6(slot7, slot8)
		slot7 = 16

		if slot6 < slot7 then
			slot6 = uv7
			slot7 = slot6
			slot6 = slot6.write
			slot8 = uv3
			slot9 = slot1
			slot10 = slot2 + 1
			slot11 = uv1

			slot6(slot7, slot8(slot9, slot10, slot11))
		end
	end
end

function slot63(slot0, slot1, slot2, slot3, ...)
	slot4 = uv0
	slot5 = slot4
	slot4 = slot4.write
	slot6 = "---- TRACE "
	slot7 = slot0
	slot8 = " exit "
	slot9 = slot1
	slot10 = "\n"

	slot4(slot5, slot6, slot7, slot8, slot9, slot10)

	slot4 = uv1
	slot4 = slot4.X

	if slot4 then
		slot4 = {
			...
		}
		slot4[MULTRES] = ...
		slot5 = uv2
		slot5 = slot5.arch

		if slot5 == "x64" then
			slot5 = 1
			slot6 = slot2
			slot7 = 1

			for slot8 = slot5, slot6, slot7 do
				slot9 = uv0
				slot10 = slot9
				slot9 = slot9.write
				slot11 = uv3
				slot12 = " %016x"
				slot13 = slot4[slot8]

				slot9(slot10, slot11(slot12, slot13))

				slot9 = slot8 % 4

				if slot9 == 0 then
					slot9 = uv0
					slot10 = slot9
					slot9 = slot9.write
					slot11 = "\n"

					slot9(slot10, slot11)
				end
			end
		else
			slot5 = 1
			slot6 = slot2
			slot7 = 1

			for slot8 = slot5, slot6, slot7 do
				slot9 = uv0
				slot10 = slot9
				slot9 = slot9.write
				slot11 = " "
				slot12 = uv4
				slot13 = slot4[slot8]

				slot9(slot10, slot11, slot12(slot13))

				slot9 = slot8 % 8

				if slot9 == 0 then
					slot9 = uv0
					slot10 = slot9
					slot9 = slot9.write
					slot11 = "\n"

					slot9(slot10, slot11)
				end
			end
		end

		slot5 = uv2
		slot5 = slot5.arch

		if slot5 ~= "mips" then
			slot5 = uv2
			slot5 = slot5.arch

			if slot5 == "mipsel" then
				slot5 = 1
				slot6 = slot3
				slot7 = 2

				for slot8 = slot5, slot6, slot7 do
					slot9 = uv0
					slot10 = slot9
					slot9 = slot9.write
					slot11 = uv3
					slot12 = " %+17.14g"
					slot13 = slot2 + slot8
					slot13 = slot4[slot13]

					slot9(slot10, slot11(slot12, slot13))

					slot9 = slot8 % 8

					if slot9 == 7 then
						slot9 = uv0
						slot10 = slot9
						slot9 = slot9.write
						slot11 = "\n"

						slot9(slot10, slot11)
					end
				end
			else
				slot5 = 1
				slot6 = slot3
				slot7 = 1

				for slot8 = slot5, slot6, slot7 do
					slot9 = uv0
					slot10 = slot9
					slot9 = slot9.write
					slot11 = uv3
					slot12 = " %+17.14g"
					slot13 = slot2 + slot8
					slot13 = slot4[slot13]

					slot9(slot10, slot11(slot12, slot13))

					slot9 = slot8 % 4

					if slot9 == 0 then
						slot9 = uv0
						slot10 = slot9
						slot9 = slot9.write
						slot11 = "\n"

						slot9(slot10, slot11)
					end
				end
			end
		end
	end
end

function slot64()
	slot0 = uv0

	if slot0 then
		uv0 = false
		slot0 = uv1
		slot0 = slot0.attach
		slot1 = uv2

		slot0(slot1)

		slot0 = uv1
		slot0 = slot0.attach
		slot1 = uv3

		slot0(slot1)

		slot0 = uv1
		slot0 = slot0.attach
		slot1 = uv4

		slot0(slot1)

		slot0 = uv5

		if slot0 then
			slot0 = uv5
			slot1 = uv6

			if slot0 ~= slot1 then
				slot0 = uv5
				slot1 = uv7

				if slot0 ~= slot1 then
					slot0 = uv5
					slot1 = slot0
					slot0 = slot0.close

					slot0(slot1)
				end
			end
		end

		uv5 = nil
	end
end

function slot65(slot0, slot1)
	slot2 = uv0

	if slot2 then
		slot2 = uv1

		slot2()
	end

	slot2 = os
	slot2 = slot2.getenv
	slot3 = "TERM"
	slot2 = slot2(slot3)

	if slot2 then
		slot4 = slot2
		slot3 = slot2.match
		slot5 = "color"
		slot3 = slot3(slot4, slot5)

		if not slot3 then
			slot3 = os.getenv("COLORTERM") and "A" or "T"

			if slot0 then
				slot4 = uv2
				slot5 = slot0
				slot6 = "[TAH]"

				function slot7(slot0)
					uv0 = slot0
					slot1 = ""

					return slot1
				end

				slot4 = slot4(slot5, slot6, slot7)
				slot0 = slot4
			end
		end
	end

	slot4 = {
		b = true,
		i = true,
		m = true,
		t = true
	}

	if slot0 and slot0 ~= "" then
		slot5 = uv3
		slot6 = slot0
		slot7 = 1
		slot8 = 1
		slot5 = slot5(slot6, slot7, slot8)

		if slot5 ~= "+" and slot5 ~= "-" then
			slot4 = {}
		end

		slot6 = 1
		slot7 = #slot0
		slot8 = 1

		for slot9 = slot6, slot7, slot8 do
			slot4[uv3(slot0, slot9, slot9)] = slot5 ~= "-"
		end
	end

	uv4 = slot4
	slot5 = slot4.t

	if not slot5 then
		slot5 = slot4.b

		if not slot5 then
			slot5 = slot4.i

			if not slot5 then
				slot5 = slot4.s

				if not slot5 then
					slot5 = slot4.m

					if slot5 then
						slot5 = uv5
						slot5 = slot5.attach
						slot6 = uv6
						slot7 = "trace"

						slot5(slot6, slot7)
					end
				end
			end
		end
	end

	slot5 = slot4.b

	if slot5 then
		slot5 = uv5
		slot5 = slot5.attach
		slot6 = uv7
		slot7 = "record"

		slot5(slot6, slot7)

		slot5 = uv8

		if not slot5 then
			slot5 = require
			slot6 = "jit.bc"
			slot5 = slot5(slot6)
			slot5 = slot5.line
			uv8 = slot5
		end
	end

	slot5 = slot4.x

	if not slot5 then
		slot5 = slot4.X

		if slot5 then
			slot5 = uv5
			slot5 = slot5.attach
			slot6 = uv9
			slot7 = "texit"

			slot5(slot6, slot7)
		end
	end

	if not slot1 then
		slot5 = os
		slot5 = slot5.getenv
		slot6 = "LUAJIT_DUMPFILE"
		slot5 = slot5(slot6)
		slot1 = slot5
	end

	if slot1 then
		if slot1 == "-" then
			slot5 = uv11

			if not slot5 then
				slot5 = assert
				slot6 = io
				slot6 = slot6.open
				slot7 = slot1
				slot8 = "w"
				slot5 = slot5(slot6(slot7, slot8))
			end
		end

		uv10 = slot5
	else
		slot5 = uv11
		uv10 = slot5
	end

	slot5 = true
	slot4[slot3] = slot5

	if slot3 == "A" then
		slot5 = uv13
		uv12 = slot5
		slot5 = uv15
		uv14 = slot5
	elseif slot3 == "H" then
		slot5 = uv16
		uv12 = slot5
		slot5 = uv17
		uv14 = slot5
		slot5 = uv10
		slot6 = slot5
		slot5 = slot5.write
		slot7 = uv18

		slot5(slot6, slot7)
	else
		slot5 = uv19
		uv12 = slot5
		slot5 = uv20
		uv14 = slot5
	end

	uv0 = true
end

slot66 = {
	on = slot65,
	off = slot64,
	start = slot65
}

return slot66
