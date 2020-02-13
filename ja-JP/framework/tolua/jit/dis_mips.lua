slot0 = type
slot1 = string
slot1 = slot1.byte
slot2 = string
slot2 = slot2.format
slot3 = string
slot3 = slot3.match
slot4 = string
slot4 = slot4.gmatch
slot5 = table
slot5 = slot5.concat
slot6 = require
slot7 = "bit"
slot6 = slot6(slot7)
slot7 = slot6.band
slot8 = slot6.bor
slot9 = slot6.tohex
slot10 = slot6.lshift
slot11 = slot6.rshift
slot12 = slot6.arshift
slot13 = {
	[0] = "movfDSC",
	"movtDSC",
	shift = 16,
	mask = 1
}
slot14 = {
	[0] = "srlDTA",
	"rotrDTA",
	shift = 21,
	mask = 1
}
slot15 = {
	[0] = "srlvDTS",
	"rotrvDTS",
	shift = 6,
	mask = 1
}
slot16 = {
	nil,
	nil,
	"sraDTA",
	"sllvDTS",
	false,
	nil,
	"sravDTS",
	"jrS",
	"jalrD1S",
	"movzDST",
	"movnDST",
	"syscallY",
	"breakY",
	false,
	"sync",
	"mfhiD",
	"mthiS",
	"mfloD",
	"mtloS",
	"dsllvDST",
	false,
	"dsrlvDST",
	"dsravDST",
	"multST",
	"multuST",
	"divST",
	"divuST",
	"dmultST",
	"dmultuST",
	"ddivST",
	"ddivuST",
	"addDST",
	"addu|moveDST0",
	"subDST",
	"subu|neguDS0T",
	"andDST",
	"or|moveDST0",
	"xorDST",
	"nor|notDST0",
	false,
	false,
	"sltDST",
	"sltuDST",
	"daddDST",
	"dadduDST",
	"dsubDST",
	"dsubuDST",
	"tgeSTZ",
	"tgeuSTZ",
	"tltSTZ",
	"tltuSTZ",
	"teqSTZ",
	false,
	"tneSTZ",
	false,
	"dsllDTA",
	false,
	"dsrlDTA",
	"dsraDTA",
	"dsll32DTA",
	false,
	"dsrl32DTA",
	"dsra32DTA",
	shift = 0,
	mask = 63
}
slot17 = {
	[0] = "nop",
	_ = "sllDTA",
	shift = 0,
	mask = -1
}
slot16[0] = slot17
slot16[1] = slot13
slot16[2] = slot14
slot16[6] = slot15
slot17 = {
	[0] = "maddST",
	"madduST",
	"mulDST",
	false,
	"msubST",
	"msubuST",
	[32.0] = "clzDS",
	[63.0] = "sdbbpY",
	mask = 63,
	shift = 0,
	[33.0] = "cloDS"
}
slot18 = {
	nil,
	"wsbhDT",
	[24.0] = "sehDT",
	[16.0] = "sebDT",
	shift = 6,
	mask = 31
}
slot19 = {
	nil,
	"dsbhDT",
	[5.0] = "dshdDT",
	shift = 6,
	mask = 31
}
slot20 = {
	[0] = "extTSAK",
	"dextmTSAP",
	nil,
	"dextTSAK",
	"insTSAL",
	nil,
	"dinsuTSEQ",
	"dinsTSAL",
	[59.0] = "rdhwrTD",
	shift = 0,
	mask = 63,
	[32] = slot18,
	[36] = slot19
}
slot21 = {
	[0] = "bltzSB",
	"bgezSB",
	"bltzlSB",
	"bgezlSB",
	false,
	false,
	false,
	false,
	"tgeiSI",
	"tgeiuSI",
	"tltiSI",
	"tltiuSI",
	"teqiSI",
	false,
	"tneiSI",
	false,
	"bltzalSB",
	"bgezalSB",
	"bltzallSB",
	"bgezallSB",
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	"synciSO",
	shift = 16,
	mask = 31
}
slot22 = {
	shift = 25,
	mask = 1
}
slot23 = {
	[0] = "mfc0TDW",
	nil,
	nil,
	nil,
	"mtc0TDW",
	[14.0] = "wrpgprDT",
	[10.0] = "rdpgprDT",
	shift = 21,
	mask = 15
}
slot24 = {
	[0] = "diT0",
	"eiT0",
	shift = 5,
	mask = 1
}
slot23[11] = slot24
slot22[0] = slot23
slot23 = {
	"tlbr",
	"tlbwi",
	nil,
	nil,
	nil,
	"tlbwr",
	nil,
	"tlbp",
	[24.0] = "eret",
	[32.0] = "wait",
	mask = 63,
	[31.0] = "deret",
	shift = 0
}
slot22[1] = slot23
slot23 = {
	[0] = "add.sFGH",
	"sub.sFGH",
	"mul.sFGH",
	"div.sFGH",
	"sqrt.sFG",
	"abs.sFG",
	"mov.sFG",
	"neg.sFG",
	"round.l.sFG",
	"trunc.l.sFG",
	"ceil.l.sFG",
	"floor.l.sFG",
	"round.w.sFG",
	"trunc.w.sFG",
	"ceil.w.sFG",
	"floor.w.sFG",
	false,
	nil,
	"movz.sFGT",
	"movn.sFGT",
	false,
	"recip.sFG",
	"rsqrt.sFG",
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	"cvt.d.sFG",
	false,
	false,
	"cvt.w.sFG",
	"cvt.l.sFG",
	"cvt.ps.sFGH",
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	"c.f.sVGH",
	"c.un.sVGH",
	"c.eq.sVGH",
	"c.ueq.sVGH",
	"c.olt.sVGH",
	"c.ult.sVGH",
	"c.ole.sVGH",
	"c.ule.sVGH",
	"c.sf.sVGH",
	"c.ngle.sVGH",
	"c.seq.sVGH",
	"c.ngl.sVGH",
	"c.lt.sVGH",
	"c.nge.sVGH",
	"c.le.sVGH",
	"c.ngt.sVGH",
	shift = 0,
	mask = 63
}
slot24 = {
	[0] = "movf.sFGC",
	"movt.sFGC",
	shift = 16,
	mask = 1
}
slot23[17] = slot24
slot24 = {
	[0] = "add.dFGH",
	"sub.dFGH",
	"mul.dFGH",
	"div.dFGH",
	"sqrt.dFG",
	"abs.dFG",
	"mov.dFG",
	"neg.dFG",
	"round.l.dFG",
	"trunc.l.dFG",
	"ceil.l.dFG",
	"floor.l.dFG",
	"round.w.dFG",
	"trunc.w.dFG",
	"ceil.w.dFG",
	"floor.w.dFG",
	false,
	nil,
	"movz.dFGT",
	"movn.dFGT",
	false,
	"recip.dFG",
	"rsqrt.dFG",
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	"cvt.s.dFG",
	false,
	false,
	false,
	"cvt.w.dFG",
	"cvt.l.dFG",
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	"c.f.dVGH",
	"c.un.dVGH",
	"c.eq.dVGH",
	"c.ueq.dVGH",
	"c.olt.dVGH",
	"c.ult.dVGH",
	"c.ole.dVGH",
	"c.ule.dVGH",
	"c.df.dVGH",
	"c.ngle.dVGH",
	"c.deq.dVGH",
	"c.ngl.dVGH",
	"c.lt.dVGH",
	"c.nge.dVGH",
	"c.le.dVGH",
	"c.ngt.dVGH",
	shift = 0,
	mask = 63
}
slot25 = {
	[0] = "movf.dFGC",
	"movt.dFGC",
	shift = 16,
	mask = 1
}
slot24[17] = slot25
slot25 = {
	[0] = "add.psFGH",
	"sub.psFGH",
	"mul.psFGH",
	false,
	false,
	"abs.psFG",
	"mov.psFG",
	"neg.psFG",
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	nil,
	"movz.psFGT",
	"movn.psFGT",
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	"cvt.s.puFG",
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	"cvt.s.plFG",
	false,
	false,
	false,
	"pll.psFGH",
	"plu.psFGH",
	"pul.psFGH",
	"puu.psFGH",
	"c.f.psVGH",
	"c.un.psVGH",
	"c.eq.psVGH",
	"c.ueq.psVGH",
	"c.olt.psVGH",
	"c.ult.psVGH",
	"c.ole.psVGH",
	"c.ule.psVGH",
	"c.psf.psVGH",
	"c.ngle.psVGH",
	"c.pseq.psVGH",
	"c.ngl.psVGH",
	"c.lt.psVGH",
	"c.nge.psVGH",
	"c.le.psVGH",
	"c.ngt.psVGH",
	shift = 0,
	mask = 63
}
slot26 = {
	[0] = "movf.psFGC",
	"movt.psFGC",
	shift = 16,
	mask = 1
}
slot25[17] = slot26
slot26 = {
	[32.0] = "cvt.s.wFG",
	[33.0] = "cvt.d.wFG",
	shift = 0,
	mask = 63
}
slot27 = {
	[32.0] = "cvt.s.lFG",
	[33.0] = "cvt.d.lFG",
	shift = 0,
	mask = 63
}
slot28 = {
	[0] = "bc1fCB",
	"bc1tCB",
	"bc1flCB",
	"bc1tlCB",
	shift = 16,
	mask = 3
}
slot29 = {
	[0] = "mfc1TG",
	"dmfc1TG",
	"cfc1TG",
	"mfhc1TG",
	"mtc1TG",
	"dmtc1TG",
	"ctc1TG",
	"mthc1TG",
	slot28,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	slot23,
	slot24,
	false,
	false,
	slot26,
	slot27,
	slot25,
	shift = 21,
	mask = 31
}
slot30 = {
	[0] = "lwxc1FSX",
	"ldxc1FSX",
	false,
	false,
	false,
	"luxc1FSX",
	false,
	false,
	"swxc1FSX",
	"sdxc1FSX",
	false,
	false,
	false,
	"suxc1FSX",
	false,
	"prefxMSX",
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	"alnv.psFGHS",
	false,
	"madd.sFRGH",
	"madd.dFRGH",
	false,
	false,
	false,
	false,
	"madd.psFRGH",
	false,
	"msub.sFRGH",
	"msub.dFRGH",
	false,
	false,
	false,
	false,
	"msub.psFRGH",
	false,
	"nmadd.sFRGH",
	"nmadd.dFRGH",
	false,
	false,
	false,
	false,
	"nmadd.psFRGH",
	false,
	"nmsub.sFRGH",
	"nmsub.dFRGH",
	false,
	false,
	false,
	false,
	"nmsub.psFRGH",
	false,
	shift = 0,
	mask = 63
}
slot31 = {
	[0] = slot16,
	slot21,
	"jJ",
	"jalJ",
	"beq|beqz|bST00B",
	"bne|bnezST0B",
	"blezSB",
	"bgtzSB",
	"addiTSI",
	"addiu|liTS0I",
	"sltiTSI",
	"sltiuTSI",
	"andiTSU",
	"ori|liTS0U",
	"xoriTSU",
	"luiTU",
	slot22,
	slot29,
	false,
	slot30,
	"beql|beqzlST0B",
	"bnel|bnezlST0B",
	"blezlSB",
	"bgtzlSB",
	"daddiTSI",
	"daddiuTSI",
	false,
	false,
	slot17,
	"jalxJ",
	false,
	slot20,
	"lbTSO",
	"lhTSO",
	"lwlTSO",
	"lwTSO",
	"lbuTSO",
	"lhuTSO",
	"lwrTSO",
	false,
	"sbTSO",
	"shTSO",
	"swlTSO",
	"swTSO",
	false,
	false,
	"swrTSO",
	"cacheNSO",
	"llTSO",
	"lwc1HSO",
	"lwc2TSO",
	"prefNSO",
	false,
	"ldc1HSO",
	"ldc2TSO",
	"ldTSO",
	"scTSO",
	"swc1HSO",
	"swc2TSO",
	false,
	false,
	"sdc1HSO",
	"sdc2TSO",
	"sdTSO"
}
slot32 = {
	[0] = "r0",
	"r1",
	"r2",
	"r3",
	"r4",
	"r5",
	"r6",
	"r7",
	"r8",
	"r9",
	"r10",
	"r11",
	"r12",
	"r13",
	"r14",
	"r15",
	"r16",
	"r17",
	"r18",
	"r19",
	"r20",
	"r21",
	"r22",
	"r23",
	"r24",
	"r25",
	"r26",
	"r27",
	"r28",
	"sp",
	"r30",
	"ra"
}

function slot33(slot0, slot1, slot2)
	slot3 = slot0.pos
	slot4 = ""
	slot5 = slot0.rel

	if slot5 then
		slot5 = slot0.symtab
		slot6 = slot0.rel
		slot5 = slot5[slot6]

		if slot5 then
			slot6 = "\t->"
			slot7 = slot5
			slot4 = slot6 .. slot7
		end
	end

	slot5 = slot0.hexdump
	slot6 = 0

	if slot5 > slot6 then
		slot5 = slot0.out
		slot6 = slot0
		slot7 = "%08x  %s  %-7s %s%s\n"
		slot8 = slot0.addr
		slot8 = slot8 + slot3
		slot9 = slot1
		slot10 = slot0.op
		slot9 = slot9(slot10)
		slot10 = slot1
		slot11 = slot2
		slot12 = slot2
		slot13 = ", "
		slot11 = slot11(slot12, slot13)
		slot12 = slot4

		slot5(slot6(slot7, slot8, slot9, slot10, slot11, slot12))
	else
		slot5 = slot0.out
		slot6 = slot0
		slot7 = "%08x  %-7s %s%s\n"
		slot8 = slot0.addr
		slot8 = slot8 + slot3
		slot9 = slot1
		slot10 = slot2
		slot11 = slot2
		slot12 = ", "
		slot10 = slot10(slot11, slot12)
		slot11 = slot4

		slot5(slot6(slot7, slot8, slot9, slot10, slot11))
	end

	slot5 = slot3 + 4
	slot0.pos = slot5
end

function slot34(slot0)
	slot1 = slot0
	slot2 = slot0
	slot3 = ".long"
	slot4 = {}
	slot5 = "0x"
	slot6 = slot1
	slot7 = slot0.op
	slot6 = slot6(slot7)
	slot5 = slot5 .. slot6
	slot4[1] = slot5

	return slot1(slot2, slot3, slot4)
end

function slot35(slot0)
	slot1 = slot0.pos
	slot2 = slot0
	slot3 = slot0.code
	slot4 = slot1 + 1
	slot5 = slot1 + 4
	slot2, slot3, slot4, slot5 = slot2(slot3, slot4, slot5)
	slot6 = slot1
	slot7 = slot2
	slot8 = slot2
	slot9 = 24
	slot7 = slot7(slot8, slot9)
	slot8 = slot2
	slot9 = slot3
	slot10 = 16
	slot8 = slot8(slot9, slot10)
	slot9 = slot2
	slot10 = slot4
	slot11 = 8
	slot9 = slot9(slot10, slot11)
	slot10 = slot5

	return slot6(slot7, slot8, slot9, slot10)
end

function slot36(slot0)
	slot1 = slot0.pos
	slot2 = slot0
	slot3 = slot0.code
	slot4 = slot1 + 1
	slot5 = slot1 + 4
	slot2, slot3, slot4, slot5 = slot2(slot3, slot4, slot5)
	slot6 = slot1
	slot7 = slot2
	slot8 = slot5
	slot9 = 24
	slot7 = slot7(slot8, slot9)
	slot8 = slot2
	slot9 = slot4
	slot10 = 16
	slot8 = slot8(slot9, slot10)
	slot9 = slot2
	slot10 = slot3
	slot11 = 8
	slot9 = slot9(slot10, slot11)
	slot10 = slot2

	return slot6(slot7, slot8, slot9, slot10)
end

function slot37(slot0)
	slot2 = slot0
	slot1 = slot0.get
	slot1 = slot1(slot2)
	slot2 = {}
	slot3 = nil
	slot0.op = slot1
	slot4 = nil
	slot0.rel = slot4
	slot4 = slot0
	slot5 = slot1
	slot6 = slot1
	slot7 = 26
	slot5 = slot5(slot6, slot7)
	slot4 = slot4[slot5]
	slot5 = slot2
	slot6 = slot4
	slot5 = slot5(slot6)

	while slot5 ~= "string" do
		if not slot4 then
			slot5 = slot3
			slot6 = slot0

			return slot5(slot6)
		end

		slot4 = slot4[slot4(slot1(slot1, slot4.shift), slot4.mask)] or slot4._
	end

	slot5 = slot5
	slot6 = slot4
	slot7 = "^([a-z0-9_.]*)(.*)"
	slot5, slot6 = slot5(slot6, slot7)
	slot7 = slot5
	slot8 = slot6
	slot9 = "|([a-z0-9_.|]*)(.*)"
	slot7, slot8 = slot7(slot8, slot9)

	if slot7 then
		slot6 = slot8
	end

	slot9 = slot6
	slot10 = slot6
	slot11 = "."
	slot9, slot10, slot11 = slot9(slot10, slot11)

	for slot12 in slot9, slot10, slot11 do
		slot13 = nil

		if slot12 == "S" then
			slot14 = slot7
			slot15 = slot4
			slot16 = slot1
			slot17 = slot1
			slot18 = 21
			slot16 = slot16(slot17, slot18)
			slot17 = 31
			slot15 = slot15(slot16, slot17)
			slot13 = slot14[slot15]
		elseif slot12 == "T" then
			slot14 = slot7
			slot15 = slot4
			slot16 = slot1
			slot17 = slot1
			slot18 = 16
			slot16 = slot16(slot17, slot18)
			slot17 = 31
			slot15 = slot15(slot16, slot17)
			slot13 = slot14[slot15]
		elseif slot12 == "D" then
			slot14 = slot7
			slot15 = slot4
			slot16 = slot1
			slot17 = slot1
			slot18 = 11
			slot16 = slot16(slot17, slot18)
			slot17 = 31
			slot15 = slot15(slot16, slot17)
			slot13 = slot14[slot15]
		elseif slot12 == "F" then
			slot14 = "f"
			slot15 = slot4
			slot16 = slot1
			slot17 = slot1
			slot18 = 6
			slot16 = slot16(slot17, slot18)
			slot17 = 31
			slot15 = slot15(slot16, slot17)
			slot13 = slot14 .. slot15
		elseif slot12 == "G" then
			slot14 = "f"
			slot15 = slot4
			slot16 = slot1
			slot17 = slot1
			slot18 = 11
			slot16 = slot16(slot17, slot18)
			slot17 = 31
			slot15 = slot15(slot16, slot17)
			slot13 = slot14 .. slot15
		elseif slot12 == "H" then
			slot14 = "f"
			slot15 = slot4
			slot16 = slot1
			slot17 = slot1
			slot18 = 16
			slot16 = slot16(slot17, slot18)
			slot17 = 31
			slot15 = slot15(slot16, slot17)
			slot13 = slot14 .. slot15
		elseif slot12 == "R" then
			slot14 = "f"
			slot15 = slot4
			slot16 = slot1
			slot17 = slot1
			slot18 = 21
			slot16 = slot16(slot17, slot18)
			slot17 = 31
			slot15 = slot15(slot16, slot17)
			slot13 = slot14 .. slot15
		elseif slot12 == "A" then
			slot14 = slot4
			slot15 = slot1
			slot16 = slot1
			slot17 = 6
			slot15 = slot15(slot16, slot17)
			slot16 = 31
			slot14 = slot14(slot15, slot16)
			slot13 = slot14
		elseif slot12 == "E" then
			slot14 = slot4
			slot15 = slot1
			slot16 = slot1
			slot17 = 6
			slot15 = slot15(slot16, slot17)
			slot16 = 31
			slot14 = slot14(slot15, slot16)
			slot13 = slot14 + 32
		elseif slot12 == "M" then
			slot14 = slot4
			slot15 = slot1
			slot16 = slot1
			slot17 = 11
			slot15 = slot15(slot16, slot17)
			slot16 = 31
			slot14 = slot14(slot15, slot16)
			slot13 = slot14
		elseif slot12 == "N" then
			slot14 = slot4
			slot15 = slot1
			slot16 = slot1
			slot17 = 16
			slot15 = slot15(slot16, slot17)
			slot16 = 31
			slot14 = slot14(slot15, slot16)
			slot13 = slot14
		elseif slot12 == "C" then
			slot14 = slot4
			slot15 = slot1
			slot16 = slot1
			slot17 = 18
			slot15 = slot15(slot16, slot17)
			slot16 = 7
			slot14 = slot14(slot15, slot16)
			slot13 = slot14

			if slot13 == 0 then
				slot13 = nil
			end
		elseif slot12 == "K" then
			slot14 = slot4
			slot15 = slot1
			slot16 = slot1
			slot17 = 11
			slot15 = slot15(slot16, slot17)
			slot16 = 31
			slot14 = slot14(slot15, slot16)
			slot13 = slot14 + 1
		elseif slot12 == "P" then
			slot14 = slot4
			slot15 = slot1
			slot16 = slot1
			slot17 = 11
			slot15 = slot15(slot16, slot17)
			slot16 = 31
			slot14 = slot14(slot15, slot16)
			slot13 = slot14 + 33
		elseif slot12 == "L" then
			slot14 = slot4
			slot15 = slot1
			slot16 = slot1
			slot17 = 11
			slot15 = slot15(slot16, slot17)
			slot16 = 31
			slot14 = slot14(slot15, slot16)
			slot14 = slot14 - slot3
			slot13 = slot14 + 1
		elseif slot12 == "Q" then
			slot14 = slot4
			slot15 = slot1
			slot16 = slot1
			slot17 = 11
			slot15 = slot15(slot16, slot17)
			slot16 = 31
			slot14 = slot14(slot15, slot16)
			slot14 = slot14 - slot3
			slot13 = slot14 + 33
		elseif slot12 == "I" then
			slot14 = slot8
			slot15 = slot9
			slot16 = slot1
			slot17 = 16
			slot15 = slot15(slot16, slot17)
			slot16 = 16
			slot14 = slot14(slot15, slot16)
			slot13 = slot14
		elseif slot12 == "U" then
			slot14 = slot4
			slot15 = slot1
			slot16 = 65535
			slot14 = slot14(slot15, slot16)
			slot13 = slot14
		elseif slot12 == "O" then
			slot14 = slot8
			slot15 = slot9
			slot16 = slot1
			slot17 = 16
			slot15 = slot15(slot16, slot17)
			slot16 = 16
			slot14 = slot14(slot15, slot16)
			slot15 = #slot2
			slot16 = slot10
			slot17 = "%d(%s)"
			slot18 = slot14
			slot19 = slot3
			slot16 = slot16(slot17, slot18, slot19)
			slot2[slot15] = slot16
		elseif slot12 == "X" then
			slot14 = slot7
			slot15 = slot4
			slot16 = slot1
			slot17 = slot1
			slot18 = 16
			slot16 = slot16(slot17, slot18)
			slot17 = 31
			slot15 = slot15(slot16, slot17)
			slot14 = slot14[slot15]
			slot15 = #slot2
			slot16 = slot10
			slot17 = "%s(%s)"
			slot18 = slot14
			slot19 = slot3
			slot16 = slot16(slot17, slot18, slot19)
			slot2[slot15] = slot16
		elseif slot12 == "B" then
			slot14 = slot0.addr
			slot15 = slot0.pos
			slot14 = slot14 + slot15
			slot15 = slot8
			slot16 = slot9
			slot17 = slot1
			slot18 = 16
			slot16 = slot16(slot17, slot18)
			slot17 = 16
			slot15 = slot15(slot16, slot17)
			slot15 = slot15 * 4
			slot14 = slot14 + slot15
			slot13 = slot14 + 4
			slot0.rel = slot13
			slot14 = slot10
			slot15 = "0x%08x"
			slot16 = slot13
			slot14 = slot14(slot15, slot16)
			slot13 = slot14
		elseif slot12 == "J" then
			slot14 = slot0.addr
			slot15 = slot0.pos
			slot14 = slot14 + slot15
			slot15 = slot4
			slot16 = slot14
			slot17 = 268435455
			slot15 = slot15(slot16, slot17)
			slot15 = slot14 - slot15
			slot16 = slot4
			slot17 = slot1
			slot18 = 67108863
			slot16 = slot16(slot17, slot18)
			slot16 = slot16 * 4
			slot13 = slot15 + slot16
			slot0.rel = slot13
			slot15 = slot10
			slot16 = "0x%08x"
			slot17 = slot13
			slot15 = slot15(slot16, slot17)
			slot13 = slot15
		elseif slot12 == "V" then
			slot14 = slot4
			slot15 = slot1
			slot16 = slot1
			slot17 = 8
			slot15 = slot15(slot16, slot17)
			slot16 = 7
			slot14 = slot14(slot15, slot16)
			slot13 = slot14

			if slot13 == 0 then
				slot13 = nil
			end
		elseif slot12 == "W" then
			slot14 = slot4
			slot15 = slot1
			slot16 = 7
			slot14 = slot14(slot15, slot16)
			slot13 = slot14

			if slot13 == 0 then
				slot13 = nil
			end
		elseif slot12 == "Y" then
			slot14 = slot4
			slot15 = slot1
			slot16 = slot1
			slot17 = 6
			slot15 = slot15(slot16, slot17)
			slot16 = 1048575
			slot14 = slot14(slot15, slot16)
			slot13 = slot14

			if slot13 == 0 then
				slot13 = nil
			end
		elseif slot12 == "Z" then
			slot14 = slot4
			slot15 = slot1
			slot16 = slot1
			slot17 = 6
			slot15 = slot15(slot16, slot17)
			slot16 = 1023
			slot14 = slot14(slot15, slot16)
			slot13 = slot14

			if slot13 == 0 then
				slot13 = nil
			end
		elseif slot12 == "0" then
			if slot3 == "r0" or slot3 == 0 then
				slot14 = #slot2
				slot15 = nil
				slot2[slot14] = slot15
				slot15 = slot14 - 1
				slot3 = slot2[slot15]

				if slot7 then
					slot15 = slot5
					slot16 = slot7
					slot17 = "([^|]*)|(.*)"
					slot15, slot16 = slot15(slot16, slot17)

					if slot15 then
						slot17 = slot15
						slot7 = slot16
						slot5 = slot17
					else
						slot5 = slot7
					end
				end
			end
		elseif slot12 == "1" and slot3 == "ra" then
			slot14 = #slot2
			slot15 = nil
			slot2[slot14] = slot15
		end

		if slot13 then
			slot14 = #slot2
			slot14 = slot14 + 1
			slot2[slot14] = slot13
			slot3 = slot13
		end
	end

	slot9 = slot11
	slot10 = slot0
	slot11 = slot5
	slot12 = slot2

	return slot9(slot10, slot11, slot12)
end

function slot38(slot0, slot1, slot2)
	slot1 = slot1 or 0

	if slot2 then
		slot3 = slot1 + slot2

		if not slot3 then
			slot3 = slot0.code
			slot3 = #slot3
		end
	end

	slot4 = slot3 % 4
	slot3 = slot3 - slot4
	slot4 = slot1 % 4
	slot4 = slot1 - slot4
	slot0.pos = slot4
	slot4 = nil
	slot0.rel = slot4
	slot4 = slot0.pos

	while slot4 < slot3 do
		slot4 = slot0
		slot5 = slot0

		slot4(slot5)
	end
end

function slot39(slot0, slot1, slot2)
	slot3 = {
		code = slot0,
		addr = slot1 or 0
	}

	if not slot2 then
		slot4 = io
		slot4 = slot4.write
	end

	slot3.out = slot4
	slot4 = {}
	slot3.symtab = slot4
	slot4 = slot0
	slot3.disass = slot4
	slot4 = 8
	slot3.hexdump = slot4
	slot4 = slot1
	slot3.get = slot4

	return slot3
end

function slot40(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot6 = slot2
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = slot1
	slot3.get = slot4

	return slot3
end

function slot41(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot6 = slot2
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = slot3
	slot3 = slot3.disass

	slot3(slot4)
end

function slot42(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot6 = slot2
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = slot3
	slot3 = slot3.disass

	slot3(slot4)
end

function slot43(slot0)
	slot1 = 32

	if slot0 < slot1 then
		slot1 = slot0
		slot1 = slot1[slot0]

		return slot1
	end

	slot1 = "f"
	slot2 = slot0 - 32
	slot1 = slot1 .. slot2

	return slot1
end

slot44 = {
	create = slot39,
	create_el = slot40,
	disass = slot41,
	disass_el = slot42,
	regname = slot43
}

return slot44
