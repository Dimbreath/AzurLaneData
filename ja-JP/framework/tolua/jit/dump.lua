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
	slot3 = slot0
	slot3.__index = slot2
	slot3 = slot1
	slot3 = slot3.arch
	slot4 = slot3
	slot3 = slot3.sub
	slot5 = 1
	slot6 = 4
	slot3 = slot3(slot4, slot5, slot6)

	if slot3 == "mips" then
		slot3 = slot2
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
		slot7 = slot2
		slot8 = slot0
		slot9 = slot6
		slot7 = slot7(slot8, slot9)
		slot8 = 0

		if slot7 < slot8 then
			slot7 = slot7 + 4294967296.0
		end

		slot8 = slot3
		slot9 = slot6
		slot8 = slot8(slot9)
		slot2[slot7] = slot8
	end

	slot3 = slot2
	slot4 = slot0
	slot5 = slot1
	slot3 = slot3(slot4, slot5)

	if slot3 then
		slot4 = "stack_check"
		slot2[slot3] = slot4
	end
end

function slot34(slot0, slot1)
	slot2 = slot0
	slot3 = slot1

	if slot3 == 0 then
		slot3 = slot2
		slot3 = slot3.ircall
		slot4 = 0
		slot5 = #slot3
		slot6 = 1

		for slot7 = slot4, slot5, slot6 do
			slot8 = slot3
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

	slot3 = slot1

	if slot3 == 1000000 then
		slot3 = slot4
		slot4 = slot0
		slot5 = slot1

		slot3(slot4, slot5)
	else
		slot3 = slot1

		if slot3 < slot1 then
			slot3 = slot1
			slot4 = slot1 - 1
			slot5 = 1

			for slot6 = slot3, slot4, slot5 do
				slot7 = slot5
				slot8 = slot6
				slot7 = slot7(slot8)

				if slot7 == nil then
					slot8 = slot4
					slot9 = slot0
					slot10 = slot1

					slot8(slot9, slot10)

					slot8 = setmetatable
					slot9 = slot0
					slot10 = slot6

					slot8(slot9, slot10)

					slot1 = 1000000

					break
				end

				slot8 = 0

				if slot7 < slot8 then
					slot7 = slot7 + 4294967296.0
				end

				slot8 = slot7
				slot9 = slot6
				slot8 = slot8(slot9)
				slot2[slot7] = slot8
			end

			slot1 = slot1
		end
	end

	return slot2
end

function slot35(slot0)
	slot1 = slot0
	slot2 = slot1
	slot1 = slot1.write
	slot3 = slot0

	slot1(slot2, slot3)
end

function slot36(slot0)
	slot1 = slot0
	slot2 = slot0
	slot1 = slot1(slot2)

	if not slot1 then
		return
	end

	slot2 = slot1
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	if not slot2 then
		return
	end

	slot5 = slot2

	if not slot5 then
		slot5 = require
		slot6 = "jit.dis_"
		slot7 = slot3
		slot7 = slot7.arch
		slot6 = slot6 .. slot7
		slot5 = slot5(slot6)
		slot2 = slot5
	end

	slot5 = 0

	if slot3 < slot5 then
		slot3 = slot3 + 4294967296.0
	end

	slot5 = slot4
	slot6 = slot5
	slot5 = slot5.write
	slot7 = "---- TRACE "
	slot8 = slot0
	slot9 = " mcode "
	slot10 = #slot2
	slot11 = "\n"

	slot5(slot6, slot7, slot8, slot9, slot10, slot11)

	slot5 = slot2
	slot5 = slot5.create
	slot6 = slot2
	slot7 = slot3
	slot8 = slot5
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = 0
	slot5.hexdump = slot6
	slot6 = slot6
	slot7 = slot0
	slot8 = slot1.nexit
	slot6 = slot6(slot7, slot8)
	slot5.symtab = slot6

	if slot4 ~= 0 then
		slot6 = slot7
		slot7 = slot3 + slot4
		slot8 = "LOOP"
		slot6[slot7] = slot8
		slot7 = slot5
		slot6 = slot5.disass
		slot8 = 0
		slot9 = slot4

		slot6(slot7, slot8, slot9)

		slot6 = slot4
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

		slot6 = slot7
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
	slot2 = slot0
	slot3 = slot1
	slot3 = slot3[slot1]
	slot4 = slot0

	return slot2(slot3, slot4)
end

slot41 = setmetatable
slot42 = {}
slot43 = {}

function slot44(slot0, slot1)
	slot2 = slot0
	slot3 = slot1
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
	slot2 = slot0
	slot3 = slot0
	slot4 = "[<>&]"
	slot5 = slot1
	slot2 = slot2(slot3, slot4, slot5)
	slot0 = slot2
	slot2 = slot2
	slot3 = "<span class=\"irt_%s\">%s</span>"
	slot4 = slot3
	slot4 = slot4[slot1]
	slot5 = slot0

	return slot2(slot3, slot4, slot5)
end

slot44 = setmetatable
slot45 = {}
slot46 = {}

function slot47(slot0, slot1)
	slot2 = slot0
	slot3 = slot1
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
	slot3 = slot0
	slot4 = slot1
	slot5 = 1
	slot3 = slot3(slot4, slot5)

	if slot3 ~= 0 then
		slot3 = slot2
		slot4 = "P"
		slot2 = slot3 .. slot4
	end

	slot3 = slot0
	slot4 = slot1
	slot5 = 2
	slot3 = slot3(slot4, slot5)

	if slot3 ~= 0 then
		slot3 = slot2
		slot4 = "F"
		slot2 = slot3 .. slot4
	end

	slot3 = slot0
	slot4 = slot1
	slot5 = 4
	slot3 = slot3(slot4, slot5)

	if slot3 ~= 0 then
		slot3 = slot2
		slot4 = "T"
		slot2 = slot3 .. slot4
	end

	slot3 = slot0
	slot4 = slot1
	slot5 = 8
	slot3 = slot3(slot4, slot5)

	if slot3 ~= 0 then
		slot3 = slot2
		slot4 = "C"
		slot2 = slot3 .. slot4
	end

	slot3 = slot0
	slot4 = slot1
	slot5 = 16
	slot3 = slot3(slot4, slot5)

	if slot3 ~= 0 then
		slot3 = slot2
		slot4 = "R"
		slot2 = slot3 .. slot4
	end

	slot3 = slot0
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
	slot2 = slot0
	slot3 = slot1
	slot4 = slot1
	slot5 = 31
	slot3 = slot3(slot4, slot5)
	slot2 = slot2[slot3]
	slot3 = slot0
	slot4 = slot1
	slot5 = slot2
	slot6 = slot1
	slot7 = 5
	slot5 = slot5(slot6, slot7)
	slot6 = 31
	slot4 = slot4(slot5, slot6)
	slot3 = slot3[slot4]
	slot4 = "."
	slot5 = slot2
	slot2 = slot3 .. slot4 .. slot5
	slot3 = slot1
	slot4 = slot1
	slot5 = 2048
	slot3 = slot3(slot4, slot5)

	if slot3 ~= 0 then
		slot3 = slot2
		slot4 = " sext"
		slot2 = slot3 .. slot4
	end

	slot3 = slot2
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
		slot1 = slot0
		slot2 = "\\%03d"
		slot3 = slot1
		slot4 = slot0

		return slot1(slot2, slot3(slot4))
	end
end

function slot50(slot0, slot1)
	slot2 = slot0
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
			slot3 = slot1
			slot3 = slot3.ffnames
			slot4 = slot2.ffid
			slot3 = slot3[slot4]

			return slot3
		else
			slot3 = slot2.addr

			if slot3 then
				slot3 = slot2
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
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot3, slot4, slot5 = slot3(slot4, slot5)
	slot6 = slot1
	slot7 = slot3
	slot6 = slot6(slot7)
	slot7 = nil

	if slot6 == "number" then
		slot8 = slot2(slot2 or 0, 196608)

		if slot8 ~= 0 then
			slot7 = (slot2(slot2, 131072) ~= 0 and "contpc") or "ftsz"
		elseif slot3 == 6755399441055744.0 then
			slot7 = "bias"
		else
			slot8 = slot3
			slot9 = 0

			if slot3 > slot9 then
				slot7 = slot8((slot3 < 1.390671161567e-309 and "%+a") or "%+.14g", slot3)
			end
		end
	elseif slot6 == "string" then
		slot7 = slot3((#slot3 > 20 and "\"%.20s\"~") or "\"%s\"", slot4(slot3, "%c", slot5))
	elseif slot6 == "function" then
		slot8 = slot6
		slot9 = slot3
		slot8 = slot8(slot9)
		slot7 = slot8
	elseif slot6 == "table" then
		slot8 = slot3
		slot9 = "{%p}"
		slot10 = slot3
		slot8 = slot8(slot9, slot10)
		slot7 = slot8
	elseif slot6 == "userdata" then
		if slot4 == 12 then
			slot8 = slot3
			slot9 = "userdata:%p"
			slot10 = slot3
			slot8 = slot8(slot9, slot10)
			slot7 = slot8
		else
			slot8 = slot3
			slot9 = "[%p]"
			slot10 = slot3
			slot8 = slot8(slot9, slot10)
			slot7 = slot8

			if slot7 == "[NULL]" then
				slot7 = "NULL"
			end
		end
	elseif slot4 == 21 then
		slot8 = slot7
		slot9 = slot8
		slot10 = slot3
		slot9 = slot9(slot10)
		slot10 = 1
		slot11 = -3
		slot8 = slot8(slot9, slot10, slot11)
		slot7 = slot8
		slot8 = slot7
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
		slot8 = slot8
		slot9 = slot3
		slot8 = slot8(slot9)
		slot7 = slot8
	end

	slot8 = slot9
	slot9 = slot3
	slot10 = "%-4s"
	slot11 = slot7
	slot9 = slot9(slot10, slot11)
	slot10 = slot4
	slot8 = slot8(slot9, slot10)
	slot7 = slot8

	if slot5 then
		slot8 = slot3
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
		slot8 = slot0
		slot9 = slot7
		slot10 = 24
		slot8 = slot8(slot9, slot10)

		if slot8 == slot6 then
			slot2 = slot2 + 1
			slot8 = slot1
			slot9 = slot7
			slot10 = 65535
			slot8 = slot8(slot9, slot10)
			slot8 = slot8 - 32768
			slot9 = 0

			if slot8 < slot9 then
				slot9 = slot2
				slot10 = slot9
				slot9 = slot9.write
				slot11 = slot3
				slot12 = slot0
				slot13 = slot8
				slot14 = slot7

				slot9(slot10, slot11(slot12, slot13, slot14))
			else
				slot9 = slot1
				slot10 = slot7
				slot11 = 524288
				slot9 = slot9(slot10, slot11)

				if slot9 ~= 0 then
					slot9 = slot2
					slot10 = slot9
					slot9 = slot9.write
					slot11 = slot4
					slot12 = slot5
					slot13 = "%04d/%04d"
					slot14 = slot8
					slot15 = slot8 + 1
					slot12 = slot12(slot13, slot14, slot15)
					slot13 = 14

					slot9(slot10, slot11(slot12, slot13))
				else
					slot9 = slot6
					slot10 = slot0
					slot11 = slot8
					slot9, slot10, slot11, slot12 = slot9(slot10, slot11)
					slot13 = slot2
					slot14 = slot13
					slot13 = slot13.write
					slot15 = slot4
					slot16 = slot5
					slot17 = "%04d"
					slot18 = slot8
					slot16 = slot16(slot17, slot18)
					slot17 = slot1
					slot18 = slot10
					slot19 = 31

					slot13(slot14, slot15(slot16, slot17(slot18, slot19)))
				end
			end

			slot2:write((slot1(slot7, 65536) == 0 and " ") or "|")
		else
			slot8 = slot2
			slot9 = slot8
			slot8 = slot8.write
			slot10 = "---- "

			slot8(slot9, slot10)
		end
	end

	slot3 = slot2
	slot4 = slot3
	slot3 = slot3.write
	slot5 = "]\n"

	slot3(slot4, slot5)
end

function slot53(slot0)
	slot1 = slot0
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
		slot5 = slot1
		slot6 = slot0
		slot7 = slot4
		slot5 = slot5(slot6, slot7)

		if not slot5 then
			break
		end

		slot6 = slot0
		slot7 = slot6
		slot6 = slot6.write
		slot8 = slot2
		slot9 = "#%-3d %04d [ "
		slot10 = slot4
		slot11 = slot5[0]

		slot6(slot7, slot8(slot9, slot10, slot11))

		slot6 = slot3
		slot7 = slot0
		slot8 = slot5

		slot6(slot7, slot8)
	end
end

function slot54(slot0, slot1)
	slot2 = slot0

	if not slot2 then
		slot2 = require
		slot3 = "jit.dis_"
		slot4 = slot1
		slot4 = slot4.arch
		slot3 = slot3 .. slot4
		slot2 = slot2(slot3)
		slot0 = slot2
	end

	slot2 = slot2
	slot3 = slot0
	slot4 = 255
	slot2 = slot2(slot3, slot4)
	slot3 = slot3
	slot4 = slot0
	slot5 = 8
	slot3 = slot3(slot4, slot5)

	if slot2 == 253 or slot2 == 254 then
		if slot3 == 0 or slot3 == 255 then
			slot4 = " {sink"
		else
			slot4 = slot4
			slot5 = " {%04d"
			slot6 = slot1 - slot3
			slot4 = slot4(slot5, slot6)
		end

		return slot4
	end

	slot4 = 255

	if slot0 > slot4 then
		slot4 = slot4
		slot5 = "[%x]"
		slot6 = slot3 * 4

		return slot4(slot5, slot6)
	end

	slot4 = 128

	if slot2 < slot4 then
		slot4 = slot0
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
		slot3 = slot0
		slot4 = slot0
		slot5 = slot1
		slot3, slot4, slot5, slot6 = slot3(slot4, slot5)
		slot7 = slot1
		slot8 = slot4
		slot9 = 31
		slot7 = slot7(slot8, slot9)

		if slot7 == 0 then
			slot1 = slot5
			slot7 = slot2
			slot8 = slot0
			slot9 = slot6
			slot7 = slot7(slot8, slot9)
			slot2 = slot7
		end
	end

	slot3 = 0

	if slot1 < slot3 then
		slot3 = slot3
		slot4 = slot3
		slot3 = slot3.write
		slot5 = slot4
		slot6 = "[0x%x]("
		slot7 = tonumber
		slot8 = slot5
		slot9 = slot0
		slot10 = slot1
		slot8 = slot8(slot9, slot10)

		slot3(slot4, slot5(slot6, slot7(slot8)))
	else
		slot3 = slot3
		slot4 = slot3
		slot3 = slot3.write
		slot5 = slot4
		slot6 = "%04d ("
		slot7 = slot1

		slot3(slot4, slot5(slot6, slot7))
	end

	return slot2
end

function slot56(slot0, slot1)
	slot2 = 0

	if slot1 < slot2 then
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.write
		slot4 = slot1
		slot5 = slot0
		slot6 = slot1

		slot2(slot3, slot4(slot5, slot6))
	else
		slot2 = slot2
		slot3 = slot0
		slot4 = slot1
		slot2, slot3, slot4, slot5 = slot2(slot3, slot4)
		slot6 = slot3
		slot7 = slot3
		slot8 = 8
		slot6 = slot6(slot7, slot8)
		slot6 = 6 * slot6
		slot7 = slot4
		slot8 = slot5
		slot8 = slot8.irnames
		slot9 = slot6 + 1
		slot10 = slot6 + 6
		slot7 = slot7(slot8, slot9, slot10)

		if slot7 == "CARG  " then
			slot8 = slot6
			slot9 = slot0
			slot10 = slot4

			slot8(slot9, slot10)

			slot8 = 0

			if slot5 < slot8 then
				slot8 = slot0
				slot9 = slot8
				slot8 = slot8.write
				slot10 = " "
				slot11 = slot1
				slot12 = slot0
				slot13 = slot5

				slot8(slot9, slot10, slot11(slot12, slot13))
			else
				slot8 = slot0
				slot9 = slot8
				slot8 = slot8.write
				slot10 = " "
				slot11 = slot7
				slot12 = "%04d"
				slot13 = slot5

				slot8(slot9, slot10, slot11(slot12, slot13))
			end
		else
			slot8 = slot0
			slot9 = slot8
			slot8 = slot8.write
			slot10 = slot7
			slot11 = "%04d"
			slot12 = slot1

			slot8(slot9, slot10(slot11, slot12))
		end
	end
end

function slot57(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot3 = slot3(slot4)

	if not slot3 then
		return
	end

	slot4 = slot3.nins
	slot5 = slot1
	slot6 = slot5
	slot5 = slot5.write
	slot7 = "---- TRACE "
	slot8 = slot0
	slot9 = " IR\n"

	slot5(slot6, slot7, slot8, slot9)

	slot5 = slot2
	slot5 = slot5.irnames
	slot6 = 65536
	slot7, slot8 = nil

	if slot1 then
		slot9 = slot3
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
			if slot2 then
				slot13 = slot1
				slot14 = slot13
				slot13 = slot13.write
				slot15 = slot4
				slot16 = "....              SNAP   #%-3d [ "
				slot17 = slot8

				slot13(slot14, slot15(slot16, slot17))
			else
				slot13 = slot1
				slot14 = slot13
				slot13 = slot13.write
				slot15 = slot4
				slot16 = "....        SNAP   #%-3d [ "
				slot17 = slot8

				slot13(slot14, slot15(slot16, slot17))
			end

			slot13 = slot5
			slot14 = slot0
			slot15 = slot7

			slot13(slot14, slot15)

			slot8 = slot8 + 1
			slot13 = slot3
			slot14 = slot0
			slot15 = slot8
			slot13 = slot13(slot14, slot15)
			slot7 = slot13

			if slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 65-67, warpins: 1 ---
				slot13 = slot7[0]
				slot6 = slot13 or 65536
				slot13 = slot6
				slot14 = slot0
				slot15 = slot12
				slot13, slot14, slot15, slot16, slot17 = slot13(slot14, slot15)
				slot18 = slot7
				slot19 = slot14
				slot20 = 8
				slot18 = slot18(slot19, slot20)
				slot18 = 6 * slot18
				slot19 = slot8
				slot20 = slot14
				slot21 = 31
				slot19 = slot19(slot20, slot21)
				slot20 = slot9
				slot21 = slot5
				slot22 = slot18 + 1
				slot23 = slot18 + 6
				slot20 = slot20(slot21, slot22, slot23)
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 68-68, warpins: 2 ---
				slot6 = 65536
				--- END OF BLOCK #1 ---



			end
		end

		if slot20 == "LOOP  " then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 89-90, warpins: 1 ---
			if slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 91-99, warpins: 1 ---
				slot21 = slot1
				slot22 = slot21
				slot21 = slot21.write
				slot23 = slot4
				slot24 = "%04d ------------ LOOP ------------\n"
				slot25 = slot12

				slot21(slot22, slot23(slot24, slot25))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 100-108, warpins: 1 ---
				slot21 = slot1
				slot22 = slot21
				slot21 = slot21.write
				slot23 = slot4
				slot24 = "%04d ------ LOOP ------------\n"
				slot25 = slot12

				slot21(slot22, slot23(slot24, slot25))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 109-110, warpins: 1 ---
			if slot20 ~= "NOP   " and slot20 ~= "CARG  " and (slot2 or slot20 ~= "RENAME") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 117-122, warpins: 2 ---
				slot21 = slot8
				slot22 = slot17
				slot23 = 255
				slot21 = slot21(slot22, slot23)

				if slot2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 123-135, warpins: 1 ---
					slot22 = slot1
					slot23 = slot22
					slot22 = slot22.write
					slot24 = slot4
					slot25 = "%04d %-6s"
					slot26 = slot12
					slot27 = slot10
					slot28 = slot17
					slot29 = slot12

					slot22(slot23, slot24(slot25, slot26, slot27(slot28, slot29)))
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 136-143, warpins: 1 ---
					slot22 = slot1
					slot23 = slot22
					slot22 = slot22.write
					slot24 = slot4
					slot25 = "%04d "
					slot26 = slot12

					slot22(slot23, slot24(slot25, slot26))
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 144-150, warpins: 2 ---
				slot22 = slot1
				slot23 = slot22
				slot22 = slot22.write
				slot24 = slot4
				slot25 = "%s%s %s %s "

				if slot21 == 254 or slot21 == 253 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 153-154, warpins: 2 ---
					slot26 = "}"
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 155-160, warpins: 1 ---
					slot22(slot23, slot24(slot25, (slot8(slot14, 128) == 0 and " ") or ">", (slot8(slot14, 64) == 0 and " ") or "+", slot11[slot19], slot20))

					slot22 = slot8(slot13, 3)
					slot23 = slot8(slot13, 12)
					slot24 = slot9
					slot25 = slot20
					slot26 = 1
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #1 161-162, warpins: 1 ---
					slot26 = " "

					if " " then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 163-163, warpins: 1 ---
						slot26 = ">"
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 164-169, warpins: 3 ---
				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #4



				-- Decompilation error in this vicinity:
				--- BLOCK #3 170-171, warpins: 1 ---
				slot27 = " "

				if " " then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 172-172, warpins: 1 ---
					slot27 = "+"
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #3 ---

				FLOW; TARGET BLOCK #4



				-- Decompilation error in this vicinity:
				--- BLOCK #4 173-192, warpins: 2 ---
				slot27 = 4
				slot24 = slot24(slot25, slot26, slot27)

				if slot24 == "CALL" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 193-195, warpins: 1 ---
					slot24 = nil

					if slot23 == 4 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 196-206, warpins: 1 ---
						slot25 = slot1
						slot26 = slot25
						slot25 = slot25.write
						slot27 = slot4
						slot28 = "%-10s  ("
						slot29 = slot2
						slot29 = slot29.ircall
						slot29 = slot29[slot16]

						slot25(slot26, slot27(slot28, slot29))
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 207-211, warpins: 1 ---
						slot25 = slot12
						slot26 = slot0
						slot27 = slot16
						slot25 = slot25(slot26, slot27)
						slot24 = slot25
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 212-213, warpins: 2 ---
					if slot15 ~= -1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 214-217, warpins: 1 ---
						slot25 = slot13
						slot26 = slot0
						slot27 = slot15

						slot25(slot26, slot27)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 218-224, warpins: 2 ---
					slot25 = slot1
					slot26 = slot25
					slot25 = slot25.write
					slot27 = ")"

					slot25(slot26, slot27)

					if slot24 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 225-231, warpins: 1 ---
						slot25 = slot1
						slot26 = slot25
						slot25 = slot25.write
						slot27 = " ctype "
						slot28 = slot24

						slot25(slot26, slot27, slot28)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #2 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 232-233, warpins: 1 ---
					if slot20 == "CNEW  " and slot16 == -1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 236-244, warpins: 1 ---
						slot24 = slot1
						slot25 = slot24
						slot24 = slot24.write
						slot26 = slot14
						slot27 = slot0
						slot28 = slot15

						slot24(slot25, slot26(slot27, slot28))
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 245-246, warpins: 2 ---
						if slot22 ~= 3 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 247-249, warpins: 1 ---
							slot24 = 0

							if slot15 < slot24 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 250-258, warpins: 1 ---
								slot24 = slot1
								slot25 = slot24
								slot24 = slot24.write
								slot26 = slot14
								slot27 = slot0
								slot28 = slot15

								slot24(slot25, slot26(slot27, slot28))
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 259-264, warpins: 1 ---
								slot1:write(slot4((slot22 == 0 and "%04d") or "#%-3d", slot15))

								--- END OF BLOCK #0 ---

								FLOW; TARGET BLOCK #2



								-- Decompilation error in this vicinity:
								--- BLOCK #1 265-266, warpins: 1 ---
								slot27 = "%04d"

								if "%04d" then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 267-267, warpins: 1 ---
									slot27 = "#%-3d"
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #1 ---

								FLOW; TARGET BLOCK #2



								-- Decompilation error in this vicinity:
								--- BLOCK #2 268-270, warpins: 2 ---
								--- END OF BLOCK #2 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 271-272, warpins: 2 ---
							if slot23 ~= 12 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 273-274, warpins: 1 ---
								if slot23 == 4 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 275-278, warpins: 1 ---
									slot24 = slot15
									slot24 = slot24[slot20]

									if slot24 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 279-281, warpins: 1 ---
										slot25 = slot24[slot16]

										if slot25 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 282-288, warpins: 1 ---
											slot25 = slot1
											slot26 = slot25
											slot25 = slot25.write
											slot27 = "  "
											slot28 = slot24[slot16]

											slot25(slot26, slot27, slot28)
											--- END OF BLOCK #0 ---



										end
										--- END OF BLOCK #0 ---



									else

										-- Decompilation error in this vicinity:
										--- BLOCK #0 289-290, warpins: 2 ---
										if slot20 == "UREFO " or slot20 == "UREFC " then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 293-304, warpins: 2 ---
											slot25 = slot1
											slot26 = slot25
											slot25 = slot25.write
											slot27 = slot4
											slot28 = "  #%-3d"
											slot29 = slot7
											slot30 = slot16
											slot31 = 8

											slot25(slot26, slot27(slot28, slot29(slot30, slot31)))
											--- END OF BLOCK #0 ---



										else

											-- Decompilation error in this vicinity:
											--- BLOCK #0 305-313, warpins: 1 ---
											slot25 = slot1
											slot26 = slot25
											slot25 = slot25.write
											slot27 = slot4
											slot28 = "  #%-3d"
											slot29 = slot16

											slot25(slot26, slot27(slot28, slot29))
											--- END OF BLOCK #0 ---



										end
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 314-316, warpins: 1 ---
									slot24 = 0

									if slot16 < slot24 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 317-326, warpins: 1 ---
										slot24 = slot1
										slot25 = slot24
										slot24 = slot24.write
										slot26 = "  "
										slot27 = slot14
										slot28 = slot0
										slot29 = slot16

										slot24(slot25, slot26, slot27(slot28, slot29))
										--- END OF BLOCK #0 ---



									else

										-- Decompilation error in this vicinity:
										--- BLOCK #0 327-334, warpins: 1 ---
										slot24 = slot1
										slot25 = slot24
										slot24 = slot24.write
										slot26 = slot4
										slot27 = "  %04d"
										slot28 = slot16

										slot24(slot25, slot26(slot27, slot28))
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #1 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #4 ---

				FLOW; TARGET BLOCK #5



				-- Decompilation error in this vicinity:
				--- BLOCK #5 335-339, warpins: 10 ---
				slot24 = slot1
				slot25 = slot24
				slot24 = slot24.write
				slot26 = "\n"

				slot24(slot25, slot26)
				--- END OF BLOCK #5 ---



			end
			--- END OF BLOCK #0 ---



		end
	end

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 343-344, warpins: 1 ---
		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 345-353, warpins: 1 ---
			slot9 = slot1
			slot10 = slot9
			slot9 = slot9.write
			slot11 = slot4
			slot12 = "....              SNAP   #%-3d [ "
			slot13 = slot8

			slot9(slot10, slot11(slot12, slot13))
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 354-361, warpins: 1 ---
			slot9 = slot1
			slot10 = slot9
			slot9 = slot9.write
			slot11 = slot4
			slot12 = "....        SNAP   #%-3d [ "
			slot13 = slot8

			slot9(slot10, slot11(slot12, slot13))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 362-365, warpins: 2 ---
		slot9 = slot5
		slot10 = slot0
		slot11 = slot7

		slot9(slot10, slot11)
		--- END OF BLOCK #1 ---



	end
end

slot58 = ""
slot59 = 0

function slot60(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = slot0
	slot3 = slot0
	slot2 = slot2(slot3)

	if slot2 == "number" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-10, warpins: 1 ---
		slot2 = slot0
		slot3 = slot1
		slot2 = slot2(slot3)

		if slot2 == "function" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-14, warpins: 1 ---
			slot2 = slot1
			slot3 = slot1
			slot2 = slot2(slot3)
			slot1 = slot2
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-21, warpins: 2 ---
		slot2 = slot2
		slot3 = slot3
		slot3 = slot3.traceerr
		slot3 = slot3[slot0]
		slot4 = slot1
		slot2 = slot2(slot3, slot4)
		slot0 = slot2
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-22, warpins: 2 ---
	return slot0
	--- END OF BLOCK #1 ---



end

function slot61(slot0, slot1, slot2, slot3, slot4, slot5)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot0 ~= "stop" and slot0 == "abort" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		slot6 = slot0
		slot6 = slot6.a

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-12, warpins: 2 ---
			slot6 = slot0
			slot6 = slot6.i

			if slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-20, warpins: 1 ---
				slot6 = slot1
				slot7 = slot1
				slot8 = slot0
				slot8 = slot8.s
				slot9 = slot0
				slot9 = slot9.r

				if slot9 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 21-22, warpins: 1 ---
					if slot0 ~= "stop" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 23-24, warpins: 1 ---
						slot9 = false
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 25-25, warpins: 1 ---
						slot9 = true
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 26-27, warpins: 3 ---
				slot6(slot7, slot8, slot9)
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 28-31, warpins: 1 ---
				slot6 = slot0
				slot6 = slot6.s

				if slot6 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 32-34, warpins: 1 ---
					slot6 = slot2
					slot7 = slot1

					slot6(slot7)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 35-38, warpins: 3 ---
			slot6 = slot0
			slot6 = slot6.m

			if slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 39-41, warpins: 1 ---
				slot6 = slot3
				slot7 = slot1

				slot6(slot7)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 42-43, warpins: 4 ---
	if slot0 == "start" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-47, warpins: 1 ---
		slot6 = slot0
		slot6 = slot6.H

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 48-52, warpins: 1 ---
			slot6 = slot4
			slot7 = slot6
			slot6 = slot6.write
			slot8 = "<pre class=\"ljdump\">\n"

			slot6(slot7, slot8)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 53-62, warpins: 2 ---
		slot6 = slot4
		slot7 = slot6
		slot6 = slot6.write
		slot8 = "---- TRACE "
		slot9 = slot1
		slot10 = " "
		slot11 = slot0

		slot6(slot7, slot8, slot9, slot10, slot11)

		if slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 63-70, warpins: 1 ---
			slot6 = slot4
			slot7 = slot6
			slot6 = slot6.write
			slot8 = " "
			slot9 = slot4
			slot10 = "/"

			if slot5 == -1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 71-72, warpins: 1 ---
				slot11 = "stitch"
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 73-73, warpins: 1 ---
				slot11 = slot5
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 74-74, warpins: 2 ---
			slot6(slot7, slot8, slot9, slot10, slot11)
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 75-85, warpins: 2 ---
		slot6 = slot4
		slot7 = slot6
		slot6 = slot6.write
		slot8 = " "
		slot9 = slot5
		slot10 = slot2
		slot11 = slot3
		slot9 = slot9(slot10, slot11)
		slot10 = "\n"

		slot6(slot7, slot8, slot9, slot10)
		--- END OF BLOCK #2 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 86-87, warpins: 1 ---
		if slot0 == "stop" or slot0 == "abort" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 90-99, warpins: 2 ---
			slot6 = slot4
			slot7 = slot6
			slot6 = slot6.write
			slot8 = "---- TRACE "
			slot9 = slot1
			slot10 = " "
			slot11 = slot0

			slot6(slot7, slot8, slot9, slot10, slot11)

			if slot0 == "abort" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 100-115, warpins: 1 ---
				slot6 = slot4
				slot7 = slot6
				slot6 = slot6.write
				slot8 = " "
				slot9 = slot5
				slot10 = slot2
				slot11 = slot3
				slot9 = slot9(slot10, slot11)
				slot10 = " -- "
				slot11 = slot6
				slot12 = slot4
				slot13 = slot5
				slot11 = slot11(slot12, slot13)
				slot12 = "\n"

				slot6(slot7, slot8, slot9, slot10, slot11, slot12)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 116-122, warpins: 1 ---
				slot6 = slot7
				slot7 = slot1
				slot6 = slot6(slot7)
				slot7 = slot6.link
				slot8 = slot6.linktype

				if slot7 == slot1 or slot7 == 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 125-132, warpins: 2 ---
					slot9 = slot4
					slot10 = slot9
					slot9 = slot9.write
					slot11 = " -> "
					slot12 = slot8
					slot13 = "\n"

					slot9(slot10, slot11, slot12, slot13)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 133-134, warpins: 1 ---
					if slot8 == "root" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 135-142, warpins: 1 ---
						slot9 = slot4
						slot10 = slot9
						slot9 = slot9.write
						slot11 = " -> "
						slot12 = slot7
						slot13 = "\n"

						slot9(slot10, slot11, slot12, slot13)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 143-151, warpins: 1 ---
						slot9 = slot4
						slot10 = slot9
						slot9 = slot9.write
						slot11 = " -> "
						slot12 = slot7
						slot13 = " "
						slot14 = slot8
						slot15 = "\n"

						slot9(slot10, slot11, slot12, slot13, slot14, slot15)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 152-155, warpins: 4 ---
			slot6 = slot0
			slot6 = slot6.H

			if slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 156-161, warpins: 1 ---
				slot6 = slot4
				slot7 = slot6
				slot6 = slot6.write
				slot8 = "</pre>\n\n"

				slot6(slot7, slot8)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 162-167, warpins: 1 ---
				slot6 = slot4
				slot7 = slot6
				slot6 = slot6.write
				slot8 = "\n"

				slot6(slot7, slot8)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 168-169, warpins: 1 ---
			if slot0 == "flush" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 170-172, warpins: 1 ---
				slot6 = {}
				slot9 = 0
				slot8 = slot6
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 173-179, warpins: 2 ---
			slot6 = slot4
			slot7 = slot6
			slot6 = slot6.write
			slot8 = "---- TRACE "
			slot9 = slot0
			slot10 = "\n\n"

			slot6(slot7, slot8, slot9, slot10)
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 180-184, warpins: 4 ---
	slot6 = slot4
	slot7 = slot6
	slot6 = slot6.flush

	slot6(slot7)

	return
	--- END OF BLOCK #2 ---



end

function slot62(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot5 = slot0

	if slot3 ~= slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0 = slot3
		slot5 = slot2
		slot6 = " ."
		slot7 = slot3
		slot5 = slot5(slot6, slot7)
		slot1 = slot5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-13, warpins: 2 ---
	slot5 = nil
	slot6 = 0

	if slot2 >= slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-23, warpins: 1 ---
		slot6 = slot3
		slot7 = slot1
		slot8 = slot2
		slot9 = slot1
		slot6 = slot6(slot7, slot8, slot9)
		slot5 = slot6
		slot6 = slot4
		slot6 = slot6.H

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-30, warpins: 1 ---
			slot6 = slot5
			slot7 = slot5
			slot8 = "[<>&]"
			slot9 = slot6
			slot6 = slot6(slot7, slot8, slot9)
			slot5 = slot6
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-35, warpins: 1 ---
		slot6 = "0000 "
		slot7 = slot1
		slot8 = " FUNCC      \n"
		slot5 = slot6 .. slot7 .. slot8
		slot4 = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 36-38, warpins: 3 ---
	slot6 = 0

	if slot2 <= slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-53, warpins: 1 ---
		slot6 = slot7
		slot7 = slot6
		slot6 = slot6.write
		slot8 = slot8
		slot9 = slot5
		slot10 = 1
		slot11 = -2
		slot8 = slot8(slot9, slot10, slot11)
		slot9 = "         ; "
		slot10 = slot9
		slot11 = slot1
		slot10 = slot10(slot11)
		slot11 = "\n"

		slot6(slot7, slot8, slot9, slot10, slot11)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-58, warpins: 1 ---
		slot6 = slot7
		slot7 = slot6
		slot6 = slot6.write
		slot8 = slot5

		slot6(slot7, slot8)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 59-61, warpins: 2 ---
	slot6 = 0

	if slot2 >= slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 62-71, warpins: 1 ---
		slot6 = slot10
		slot7 = slot11
		slot8 = slot1
		slot9 = slot2
		slot7 = slot7(slot8, slot9)
		slot8 = 255
		slot6 = slot6(slot7, slot8)
		slot7 = 16

		if slot6 < slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 72-80, warpins: 1 ---
			slot6 = slot7
			slot7 = slot6
			slot6 = slot6.write
			slot8 = slot3
			slot9 = slot1
			slot10 = slot2 + 1
			slot11 = slot1

			slot6(slot7, slot8(slot9, slot10, slot11))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 81-81, warpins: 3 ---
	return
	--- END OF BLOCK #4 ---



end

function slot63(slot0, slot1, slot2, slot3, ...)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot4 = slot0
	slot5 = slot4
	slot4 = slot4.write
	slot6 = "---- TRACE "
	slot7 = slot0
	slot8 = " exit "
	slot9 = slot1
	slot10 = "\n"

	slot4(slot5, slot6, slot7, slot8, slot9, slot10)

	slot4 = slot1
	slot4 = slot4.X

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-20, warpins: 1 ---
		slot4 = {}
		slot4[MULTRES] = ...
		slot5 = slot2
		slot5 = slot5.arch

		if slot5 == "x64" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-24, warpins: 1 ---
			slot5 = 1
			slot6 = slot2
			slot7 = 1

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 25-41, warpins: 0 ---
			for slot8 = slot5, slot6, slot7 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 25-35, warpins: 2 ---
				slot9 = slot0
				slot10 = slot9
				slot9 = slot9.write
				slot11 = slot3
				slot12 = " %016x"
				slot13 = slot4[slot8]

				slot9(slot10, slot11(slot12, slot13))

				slot9 = slot8 % 4

				if slot9 == 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 36-40, warpins: 1 ---
					slot9 = slot0
					slot10 = slot9
					slot9 = slot9.write
					slot11 = "\n"

					slot9(slot10, slot11)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 41-41, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 42-42, warpins: 1 ---
			--- END OF BLOCK #2 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-46, warpins: 1 ---
			slot5 = 1
			slot6 = slot2
			slot7 = 1

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 47-63, warpins: 0 ---
			for slot8 = slot5, slot6, slot7 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 47-57, warpins: 2 ---
				slot9 = slot0
				slot10 = slot9
				slot9 = slot9.write
				slot11 = " "
				slot12 = slot4
				slot13 = slot4[slot8]

				slot9(slot10, slot11, slot12(slot13))

				slot9 = slot8 % 8

				if slot9 == 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 58-62, warpins: 1 ---
					slot9 = slot0
					slot10 = slot9
					slot9 = slot9.write
					slot11 = "\n"

					slot9(slot10, slot11)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 63-63, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 64-67, warpins: 2 ---
		slot5 = slot2
		slot5 = slot5.arch

		if slot5 ~= "mips" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 68-71, warpins: 1 ---
			slot5 = slot2
			slot5 = slot5.arch

			if slot5 == "mipsel" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 72-75, warpins: 2 ---
				slot5 = 1
				slot6 = slot3
				slot7 = 2

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 76-93, warpins: 0 ---
				for slot8 = slot5, slot6, slot7 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 76-87, warpins: 2 ---
					slot9 = slot0
					slot10 = slot9
					slot9 = slot9.write
					slot11 = slot3
					slot12 = " %+17.14g"
					slot13 = slot2 + slot8
					slot13 = slot4[slot13]

					slot9(slot10, slot11(slot12, slot13))

					slot9 = slot8 % 8

					if slot9 == 7 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 88-92, warpins: 1 ---
						slot9 = slot0
						slot10 = slot9
						slot9 = slot9.write
						slot11 = "\n"

						slot9(slot10, slot11)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 93-93, warpins: 2 ---
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 94-94, warpins: 1 ---
				--- END OF BLOCK #2 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 95-98, warpins: 1 ---
				slot5 = 1
				slot6 = slot3
				slot7 = 1

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 99-116, warpins: 0 ---
				for slot8 = slot5, slot6, slot7 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 99-110, warpins: 2 ---
					slot9 = slot0
					slot10 = slot9
					slot9 = slot9.write
					slot11 = slot3
					slot12 = " %+17.14g"
					slot13 = slot2 + slot8
					slot13 = slot4[slot13]

					slot9(slot10, slot11(slot12, slot13))

					slot9 = slot8 % 4

					if slot9 == 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 111-115, warpins: 1 ---
						slot9 = slot0
						slot10 = slot9
						slot9 = slot9.write
						slot11 = "\n"

						slot9(slot10, slot11)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 116-116, warpins: 2 ---
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 117-117, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

function slot64()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot0 = slot0

	if slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-19, warpins: 1 ---
		slot0 = false
		slot0 = slot1
		slot0 = slot0.attach
		slot1 = slot2

		slot0(slot1)

		slot0 = slot1
		slot0 = slot0.attach
		slot1 = slot3

		slot0(slot1)

		slot0 = slot1
		slot0 = slot0.attach
		slot1 = slot4

		slot0(slot1)

		slot0 = slot5

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-23, warpins: 1 ---
			slot0 = slot5
			slot1 = slot6

			if slot0 ~= slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-27, warpins: 1 ---
				slot0 = slot5
				slot1 = slot7

				if slot0 ~= slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 28-31, warpins: 1 ---
					slot0 = slot5
					slot1 = slot0
					slot0 = slot0.close

					slot0(slot1)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 32-32, warpins: 4 ---
		slot5 = nil
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-33, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot65(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = slot0

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-5, warpins: 1 ---
		slot2 = slot1

		slot2()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-11, warpins: 2 ---
	slot2 = os
	slot2 = slot2.getenv
	slot3 = "TERM"
	slot2 = slot2(slot3)

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-17, warpins: 1 ---
		slot4 = slot2
		slot3 = slot2.match
		slot5 = "color"
		slot3 = slot3(slot4, slot5)

		if not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-23, warpins: 2 ---
			slot3 = os
			slot3 = slot3.getenv
			slot4 = "COLORTERM"
			slot3 = slot3(slot4)

			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-25, warpins: 2 ---
				slot3 = "A"
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 26-26, warpins: 1 ---
				slot3 = "T"
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-28, warpins: 2 ---
	if slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-34, warpins: 1 ---
		slot4 = slot2
		slot5 = slot0
		slot6 = "[TAH]"

		function slot7(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			slot0 = slot0
			slot1 = ""

			return slot1
			--- END OF BLOCK #0 ---



		end

		slot4 = slot4(slot5, slot6, slot7)
		slot0 = slot4
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 35-37, warpins: 2 ---
	slot4 = {
		b = true,
		i = true,
		m = true,
		t = true
	}

	if slot0 and slot0 ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-46, warpins: 1 ---
		slot5 = slot3
		slot6 = slot0
		slot7 = 1
		slot8 = 1
		slot5 = slot5(slot6, slot7, slot8)

		if slot5 ~= "+" and slot5 ~= "-" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 49-49, warpins: 1 ---
			slot4 = {}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 50-53, warpins: 3 ---
		slot6 = 1
		slot7 = #slot0
		slot8 = 1

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 54-65, warpins: 0 ---
		for slot9 = slot6, slot7, slot8 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 54-60, warpins: 2 ---
			slot10 = slot3
			slot11 = slot0
			slot12 = slot9
			slot13 = slot9
			slot10 = slot10(slot11, slot12, slot13)

			if slot5 == "-" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 61-62, warpins: 1 ---
				slot11 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 63-63, warpins: 1 ---
				slot11 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 64-65, warpins: 2 ---
			slot4[slot10] = slot11
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 66-69, warpins: 3 ---
	slot4 = slot4
	slot5 = slot4.t

	if not slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 70-72, warpins: 1 ---
		slot5 = slot4.b

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 73-75, warpins: 1 ---
			slot5 = slot4.i

			if not slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 76-78, warpins: 1 ---
				slot5 = slot4.s

				if not slot5 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 79-81, warpins: 1 ---
					slot5 = slot4.m

					if slot5 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 82-86, warpins: 5 ---
						slot5 = slot5
						slot5 = slot5.attach
						slot6 = slot6
						slot7 = "trace"

						slot5(slot6, slot7)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 87-89, warpins: 2 ---
	slot5 = slot4.b

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 90-97, warpins: 1 ---
		slot5 = slot5
		slot5 = slot5.attach
		slot6 = slot7
		slot7 = "record"

		slot5(slot6, slot7)

		slot5 = slot8

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 98-102, warpins: 1 ---
			slot5 = require
			slot6 = "jit.bc"
			slot5 = slot5(slot6)
			slot5 = slot5.line
			slot8 = slot5
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 103-105, warpins: 3 ---
	slot5 = slot4.x

	if not slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 106-108, warpins: 1 ---
		slot5 = slot4.X

		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 109-113, warpins: 2 ---
			slot5 = slot5
			slot5 = slot5.attach
			slot6 = slot9
			slot7 = "texit"

			slot5(slot6, slot7)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 114-115, warpins: 2 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 116-120, warpins: 1 ---
		slot5 = os
		slot5 = slot5.getenv
		slot6 = "LUAJIT_DUMPFILE"
		slot5 = slot5(slot6)
		slot1 = slot5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 121-122, warpins: 2 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 123-124, warpins: 1 ---
		if slot1 == "-" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 125-127, warpins: 1 ---
			slot5 = slot11

			if not slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 128-134, warpins: 2 ---
				slot5 = assert
				slot6 = io
				slot6 = slot6.open
				slot7 = slot1
				slot8 = "w"
				slot5 = slot5(slot6(slot7, slot8))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 135-136, warpins: 2 ---
		slot10 = slot5
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 137-138, warpins: 1 ---
		slot5 = slot11
		slot10 = slot5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 139-142, warpins: 2 ---
	slot5 = true
	slot4[slot3] = slot5

	if slot3 == "A" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 143-147, warpins: 1 ---
		slot5 = slot13
		slot12 = slot5
		slot5 = slot15
		slot14 = slot5
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 148-149, warpins: 1 ---
		if slot3 == "H" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 150-159, warpins: 1 ---
			slot5 = slot16
			slot12 = slot5
			slot5 = slot17
			slot14 = slot5
			slot5 = slot10
			slot6 = slot5
			slot5 = slot5.write
			slot7 = slot18

			slot5(slot6, slot7)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 160-163, warpins: 1 ---
			slot5 = slot19
			slot12 = slot5
			slot5 = slot20
			slot14 = slot5
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 164-166, warpins: 3 ---
	slot0 = true

	return
	--- END OF BLOCK #10 ---



end

slot66 = {
	on = slot65,
	off = slot64,
	start = slot65
}

return slot66
