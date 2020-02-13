slot0 = type
slot1 = string
slot1 = slot1.sub
slot2 = string
slot2 = slot2.byte
slot3 = string
slot3 = slot3.format
slot4 = string
slot4 = slot4.match
slot5 = string
slot5 = slot5.gmatch
slot6 = table
slot6 = slot6.concat
slot7 = require
slot8 = "bit"
slot7 = slot7(slot8)
slot8 = slot7.band
slot9 = slot7.bor
slot10 = slot7.ror
slot11 = slot7.tohex
slot12 = slot7.lshift
slot13 = slot7.rshift
slot14 = slot7.arshift
slot15 = {
	shift = 8,
	mask = 15
}
slot16 = {
	shift = 20,
	mask = 1
}
slot17 = {
	[0] = "vmovFmDN",
	"vstmFNdr",
	shift = 23,
	mask = 3
}
slot18 = {
	[0] = "vstrFdl",
	shift = 21,
	mask = 1
}
slot19 = {
	[13.0] = "vpushFdr",
	_ = "vstmdbFNdr",
	shift = 16,
	mask = 15
}
slot18[1] = slot19
slot17._ = slot18
slot16[0] = slot17
slot17 = {
	[0] = "vmovFDNm",
	shift = 23,
	mask = 3
}
slot18 = {
	[13.0] = "vpopFdr",
	_ = "vldmFNdr",
	shift = 16,
	mask = 15
}
slot17[1] = slot18
slot18 = {
	[0] = "vldrFdl",
	"vldmdbFNdr",
	shift = 21,
	mask = 1
}
slot17._ = slot18
slot16[1] = slot17
slot15[10] = slot16
slot16 = {
	shift = 20,
	mask = 1
}
slot17 = {
	[0] = "vmovGmDN",
	"vstmGNdr",
	shift = 23,
	mask = 3
}
slot18 = {
	[0] = "vstrGdl",
	shift = 21,
	mask = 1
}
slot19 = {
	[13.0] = "vpushGdr",
	_ = "vstmdbGNdr",
	shift = 16,
	mask = 15
}
slot18[1] = slot19
slot17._ = slot18
slot16[0] = slot17
slot17 = {
	[0] = "vmovGDNm",
	shift = 23,
	mask = 3
}
slot18 = {
	[13.0] = "vpopGdr",
	_ = "vldmGNdr",
	shift = 16,
	mask = 15
}
slot17[1] = slot18
slot18 = {
	[0] = "vldrGdl",
	"vldmdbGNdr",
	shift = 21,
	mask = 1
}
slot17._ = slot18
slot16[1] = slot17
slot15[11] = slot16
slot16 = {
	shift = 0,
	mask = 0
}
slot15._ = slot16
slot16 = {
	[0] = "vmlaF.dnm",
	"vmlsF.dnm",
	[147456.0] = "vfnmsF.dnm",
	[163840.0] = "vfmaF.dnm",
	[131072.0] = "vdivF.dnm",
	mask = 180225,
	[32769.0] = "vnmulF.dnm",
	[16384.0] = "vnmlsF.dnm",
	[32768.0] = "vmulF.dnm",
	[16385.0] = "vnmlaF.dnm",
	[163841.0] = "vfmsF.dnm",
	[180224.0] = "vmovF.dY",
	[49153.0] = "vsubF.dnm",
	[49152.0] = "vaddF.dnm",
	shift = 6,
	[147457.0] = "vfnmaF.dnm"
}
slot17 = {
	[0] = "vmovF.dm",
	"vabsF.dm",
	[512.0] = "vnegF.dm",
	[2048.0] = "vcmpF.dm",
	[4096.0] = "vcvt.f32.u32Fdm",
	mask = 7681,
	[513.0] = "vsqrtF.dm",
	[2560.0] = "vcmpzF.d",
	[2049.0] = "vcmpeF.dm",
	[4097.0] = "vcvt.f32.s32Fdm",
	[6144.0] = "vcvtr.u32F.dm",
	[2561.0] = "vcmpzeF.d",
	[6656.0] = "vcvtr.s32F.dm",
	[6145.0] = "vcvt.u32F.dm",
	[6657.0] = "vcvt.s32F.dm",
	shift = 7,
	[3585.0] = "vcvtG.dF.m"
}
slot18 = 180225
slot16[slot18] = slot17
slot17 = {
	[0] = "vmlaG.dnm",
	"vmlsG.dnm",
	[147456.0] = "vfnmsG.dnm",
	[163840.0] = "vfmaG.dnm",
	[131072.0] = "vdivG.dnm",
	mask = 180225,
	[32769.0] = "vnmulG.dnm",
	[16384.0] = "vnmlsG.dnm",
	[32768.0] = "vmulG.dnm",
	[16385.0] = "vnmlaG.dnm",
	[163841.0] = "vfmsG.dnm",
	[180224.0] = "vmovG.dY",
	[49153.0] = "vsubG.dnm",
	[49152.0] = "vaddG.dnm",
	shift = 6,
	[147457.0] = "vfnmaG.dnm"
}
slot18 = {
	[0] = "vmovG.dm",
	"vabsG.dm",
	[512.0] = "vnegG.dm",
	[2048.0] = "vcmpG.dm",
	[4096.0] = "vcvt.f64.u32GdFm",
	mask = 7681,
	[513.0] = "vsqrtG.dm",
	[2560.0] = "vcmpzG.d",
	[2049.0] = "vcmpeG.dm",
	[4097.0] = "vcvt.f64.s32GdFm",
	[6144.0] = "vcvtr.u32FdG.m",
	[2561.0] = "vcmpzeG.d",
	[6656.0] = "vcvtr.s32FdG.m",
	[6145.0] = "vcvt.u32FdG.m",
	[6657.0] = "vcvt.s32FdG.m",
	shift = 7,
	[3585.0] = "vcvtF.dG.m"
}
slot19 = 180225
slot17[slot19] = slot18
slot18 = {
	"svcT",
	shift = 24,
	mask = 1
}
slot19 = {
	shift = 4,
	mask = 1
}
slot20 = {
	shift = 8,
	mask = 15,
	[10] = slot16,
	[11] = slot17
}
slot19[0] = slot20
slot20 = {
	shift = 8,
	mask = 15
}
slot21 = {
	[0] = "vmovFnD",
	"vmovFDn",
	[14.0] = "vmsrD",
	shift = 20,
	mask = 15
}
slot22 = {
	_ = "vmrsD",
	[15.0] = "vmrs",
	shift = 12,
	mask = 15
}
slot21[15] = slot22
slot20[10] = slot21
slot19[1] = slot20
slot18[0] = slot19
slot19 = {
	shift = 0,
	mask = 0
}
slot20 = {
	shift = 0,
	mask = 0
}
slot21 = {
	shift = 0,
	mask = 0
}
slot22 = {
	shift = 0,
	mask = 0
}
slot23 = {
	shift = 0,
	mask = 0
}
slot24 = {
	[0] = false,
	nil,
	nil,
	nil,
	false,
	nil,
	nil,
	nil,
	nil,
	false,
	nil,
	nil,
	nil,
	false,
	nil,
	nil,
	nil,
	false,
	false,
	false,
	nil,
	nil,
	false,
	false,
	nil,
	false,
	shift = 20,
	mask = 31
}
slot25 = {
	[0] = "sadd16DNM",
	"sasxDNM",
	"ssaxDNM",
	"ssub16DNM",
	"sadd8DNM",
	false,
	false,
	"ssub8DNM",
	shift = 5,
	mask = 7
}
slot24[1] = slot25
slot25 = {
	[0] = "qadd16DNM",
	"qasxDNM",
	"qsaxDNM",
	"qsub16DNM",
	"qadd8DNM",
	false,
	false,
	"qsub8DNM",
	shift = 5,
	mask = 7
}
slot24[2] = slot25
slot25 = {
	[0] = "shadd16DNM",
	"shasxDNM",
	"shsaxDNM",
	"shsub16DNM",
	"shadd8DNM",
	false,
	false,
	"shsub8DNM",
	shift = 5,
	mask = 7
}
slot24[3] = slot25
slot25 = {
	[0] = "uadd16DNM",
	"uasxDNM",
	"usaxDNM",
	"usub16DNM",
	"uadd8DNM",
	false,
	false,
	"usub8DNM",
	shift = 5,
	mask = 7
}
slot24[5] = slot25
slot25 = {
	[0] = "uqadd16DNM",
	"uqasxDNM",
	"uqsaxDNM",
	"uqsub16DNM",
	"uqadd8DNM",
	false,
	false,
	"uqsub8DNM",
	shift = 5,
	mask = 7
}
slot24[6] = slot25
slot25 = {
	[0] = "uhadd16DNM",
	"uhasxDNM",
	"uhsaxDNM",
	"uhsub16DNM",
	"uhadd8DNM",
	false,
	false,
	"uhsub8DNM",
	shift = 5,
	mask = 7
}
slot24[7] = slot25
slot25 = {
	[0] = "pkhbtDNMU",
	false,
	"pkhtbDNMU",
	nil,
	"pkhbtDNMU",
	"selDNM",
	"pkhtbDNMU",
	shift = 5,
	mask = 7
}
slot26 = {
	_ = "sxtab16DNMU",
	[15.0] = "sxtb16DMU",
	shift = 16,
	mask = 15
}
slot25[3] = slot26
slot24[8] = slot25
slot25 = {
	[0] = "ssatDxMu",
	"ssat16DxM",
	"ssatDxMu",
	nil,
	"ssatDxMu",
	false,
	"ssatDxMu",
	shift = 5,
	mask = 7
}
slot26 = {
	_ = "sxtabDNMU",
	[15.0] = "sxtbDMU",
	shift = 16,
	mask = 15
}
slot25[3] = slot26
slot24[10] = slot25
slot25 = {
	[0] = "ssatDxMu",
	"revDM",
	"ssatDxMu",
	nil,
	"ssatDxMu",
	"rev16DM",
	"ssatDxMu",
	shift = 5,
	mask = 7
}
slot26 = {
	_ = "sxtahDNMU",
	[15.0] = "sxthDMU",
	shift = 16,
	mask = 15
}
slot25[3] = slot26
slot24[11] = slot25
slot25 = {
	shift = 5,
	mask = 7
}
slot26 = {
	_ = "uxtab16DNMU",
	[15.0] = "uxtb16DMU",
	shift = 16,
	mask = 15
}
slot25[3] = slot26
slot24[12] = slot25
slot25 = {
	[0] = "usatDwMu",
	"usat16DwM",
	"usatDwMu",
	nil,
	"usatDwMu",
	false,
	"usatDwMu",
	shift = 5,
	mask = 7
}
slot26 = {
	_ = "uxtabDNMU",
	[15.0] = "uxtbDMU",
	shift = 16,
	mask = 15
}
slot25[3] = slot26
slot24[14] = slot25
slot25 = {
	[0] = "usatDwMu",
	"rbitDM",
	"usatDwMu",
	nil,
	"usatDwMu",
	"revshDM",
	"usatDwMu",
	shift = 5,
	mask = 7
}
slot26 = {
	_ = "uxtahDNMU",
	[15.0] = "uxthDMU",
	shift = 16,
	mask = 15
}
slot25[3] = slot26
slot24[15] = slot25
slot25 = {
	shift = 12,
	mask = 15
}
slot26 = {
	"smuadNMS",
	"smuadxNMS",
	"smusdNMS",
	"smusdxNMS",
	shift = 5,
	mask = 7
}
slot25[15] = slot26
slot26 = {
	[0] = "smladNMSD",
	"smladxNMSD",
	"smlsdNMSD",
	"smlsdxNMSD",
	shift = 5,
	mask = 7
}
slot25._ = slot26
slot24[16] = slot25
slot25 = {
	[0] = "smlaldDNMS",
	"smlaldxDNMS",
	"smlsldDNMS",
	"smlsldxDNMS",
	shift = 5,
	mask = 7
}
slot24[20] = slot25
slot25 = {
	nil,
	false,
	false,
	false,
	false,
	"smmlsNMSD",
	"smmlsrNMSD",
	shift = 5,
	mask = 7
}
slot26 = {
	_ = "smmlaNMSD",
	[15.0] = "smmulNMS",
	shift = 12,
	mask = 15
}
slot25[0] = slot26
slot26 = {
	_ = "smmlarNMSD",
	[15.0] = "smmulrNMS",
	shift = 12,
	mask = 15
}
slot25[1] = slot26
slot24[21] = slot25
slot25 = {
	shift = 5,
	mask = 7
}
slot26 = {
	_ = "usada8NMSD",
	[15.0] = "usad8NMS",
	shift = 12,
	mask = 15
}
slot25[0] = slot26
slot24[24] = slot25
slot25 = {
	nil,
	"sbfxDMvw",
	shift = 5,
	mask = 3
}
slot24[26] = slot25
slot25 = {
	nil,
	"sbfxDMvw",
	shift = 5,
	mask = 3
}
slot24[27] = slot25
slot25 = {
	shift = 5,
	mask = 3
}
slot26 = {
	_ = "bfiDMvX",
	[15.0] = "bfcDvX",
	shift = 0,
	mask = 15
}
slot25[0] = slot26
slot24[28] = slot25
slot25 = {
	shift = 5,
	mask = 3
}
slot26 = {
	_ = "bfiDMvX",
	[15.0] = "bfcDvX",
	shift = 0,
	mask = 15
}
slot25[0] = slot26
slot24[29] = slot25
slot25 = {
	nil,
	"ubfxDMvw",
	shift = 5,
	mask = 3
}
slot24[30] = slot25
slot25 = {
	nil,
	"ubfxDMvw",
	shift = 5,
	mask = 3
}
slot24[31] = slot25
slot25 = {
	shift = 21,
	mask = 9
}
slot26 = {
	[0] = "strtDL",
	"ldrtDL",
	nil,
	nil,
	"strbtDL",
	"ldrbtDL",
	shift = 20,
	mask = 5
}
slot25[1] = slot26
slot26 = {
	[0] = "strDL",
	"ldrDL",
	nil,
	nil,
	"strbDL",
	"ldrbDL",
	shift = 20,
	mask = 5
}
slot25._ = slot26
slot26 = {
	[0] = slot25,
	slot24,
	shift = 4,
	mask = 1
}
slot27 = {
	shift = 20,
	mask = 1
}
slot28 = {
	[0] = "stmdaNR",
	"stmNR",
	nil,
	"stmibNR",
	shift = 23,
	mask = 3
}
slot29 = {
	[45.0] = "pushR",
	_ = "stmdbNR",
	shift = 16,
	mask = 63
}
slot28[2] = slot29
slot27[0] = slot28
slot28 = {
	[0] = "ldmdaNR",
	nil,
	"ldmdbNR",
	"ldmibNR",
	shift = 23,
	mask = 3
}
slot29 = {
	_ = "ldmNR",
	[61.0] = "popR",
	shift = 16,
	mask = 63
}
slot28[1] = slot29
slot27[1] = slot28
slot28 = {
	[0] = "andDNPs",
	"eorDNPs",
	"subDNPs",
	"rsbDNPs",
	"addDNPs",
	"adcDNPs",
	"sbcDNPs",
	"rscDNPs",
	"tstNP",
	"teqNP",
	"cmpNP",
	"cmnNP",
	"orrDNPs",
	"movDPs",
	"bicDNPs",
	"mvnDPs",
	shift = 21,
	mask = 15
}
slot29 = {
	[0] = "mulNMSs",
	"mlaNMSDs",
	"umaalDNMS",
	"mlsDNMS",
	"umullDNMSs",
	"umlalDNMSs",
	"smullDNMSs",
	"smlalDNMSs",
	shift = 21,
	mask = 7
}
slot30 = {
	[0] = "swpDMN",
	false,
	false,
	false,
	"swpbDMN",
	false,
	false,
	false,
	"strexDMN",
	"ldrexDN",
	"strexdDN",
	"ldrexdDN",
	"strexbDMN",
	"ldrexbDN",
	"strexhDN",
	"ldrexhDN",
	shift = 20,
	mask = 15
}
slot31 = {
	shift = 21,
	mask = 3
}
slot32 = {
	[0] = "smlabbNMSD",
	"smlatbNMSD",
	"smlabtNMSD",
	"smlattNMSD",
	shift = 5,
	mask = 3
}
slot31[0] = slot32
slot32 = {
	[0] = "smlawbNMSD",
	"smulwbNMS",
	"smlawtNMSD",
	"smulwtNMS",
	shift = 5,
	mask = 3
}
slot31[1] = slot32
slot32 = {
	[0] = "smlalbbDNMS",
	"smlaltbDNMS",
	"smlalbtDNMS",
	"smlalttDNMS",
	shift = 5,
	mask = 3
}
slot31[2] = slot32
slot32 = {
	[0] = "smulbbNMS",
	"smultbNMS",
	"smulbtNMS",
	"smulttNMS",
	shift = 5,
	mask = 3
}
slot31[3] = slot32
slot32 = {
	nil,
	nil,
	nil,
	false,
	nil,
	false,
	shift = 4,
	mask = 7
}
slot33 = {
	[0] = "mrsD",
	"msrM",
	shift = 21,
	mask = 1
}
slot32[0] = slot33
slot33 = {
	"bxM",
	false,
	"clzDM",
	shift = 21,
	mask = 3
}
slot32[1] = slot33
slot33 = {
	"bxjM",
	shift = 21,
	mask = 3
}
slot32[2] = slot33
slot33 = {
	"blxM",
	shift = 21,
	mask = 3
}
slot32[3] = slot33
slot33 = {
	[0] = "qaddDMN",
	"qsubDMN",
	"qdaddDMN",
	"qdsubDMN",
	shift = 21,
	mask = 3
}
slot32[5] = slot33
slot33 = {
	"bkptK",
	shift = 21,
	mask = 3
}
slot32[7] = slot33
slot33 = {
	shift = 4,
	mask = 9
}
slot34 = {
	shift = 5,
	mask = 3
}
slot35 = {
	[0] = slot29,
	slot30,
	shift = 24,
	mask = 1
}
slot34[0] = slot35
slot35 = {
	[0] = "strhDL",
	"ldrhDL",
	shift = 20,
	mask = 1
}
slot34[1] = slot35
slot35 = {
	[0] = "ldrdDL",
	"ldrsbDL",
	shift = 20,
	mask = 1
}
slot34[2] = slot35
slot35 = {
	[0] = "strdDL",
	"ldrshDL",
	shift = 20,
	mask = 1
}
slot34[3] = slot35
slot33[9] = slot34
slot34 = {
	shift = 20,
	mask = 25
}
slot35 = {
	[0] = slot32,
	slot31,
	shift = 7,
	mask = 1
}
slot34[16] = slot35
slot35 = {
	shift = 0,
	mask = 4294967295.0
}
slot36 = slot9
slot37 = 3785359360.0
slot36 = slot36(slot37)
slot37 = "nop"
slot35[slot36] = slot37
slot35._ = slot28
slot34._ = slot35
slot33._ = slot34
slot34 = {
	[16.0] = "movwDW",
	mask = 31,
	[20.0] = "movtDW",
	shift = 20,
	[22.0] = "msrNW"
}
slot35 = {
	[0] = "nopv6",
	_ = "msrNW",
	shift = 0,
	mask = 983295
}
slot34[18] = slot35
slot34._ = slot28
slot35 = {
	[0] = "bB",
	"blB",
	shift = 24,
	mask = 1
}
slot36 = {
	[0] = slot33,
	slot34,
	slot25,
	slot26,
	slot27,
	slot35,
	slot15,
	slot18
}
slot37 = {
	[0] = false,
	slot21,
	slot22,
	slot23,
	false,
	"blxB",
	slot19,
	slot20
}
slot38 = {
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
	"sp",
	"lr",
	"pc"
}
slot39 = {
	[0] = "eq",
	"ne",
	"hs",
	"lo",
	"mi",
	"pl",
	"vs",
	"vc",
	"hi",
	"ls",
	"ge",
	"lt",
	"gt",
	"le",
	"al"
}
slot40 = {
	[0] = "lsl",
	"lsr",
	"asr",
	"ror"
}

function slot41(slot0, slot1, slot2)
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
		else
			slot6 = slot0
			slot7 = slot0.op
			slot8 = 234881024
			slot6 = slot6(slot7, slot8)

			if slot6 ~= 167772160 then
				slot6 = "\t; 0x"
				slot7 = slot1
				slot8 = slot0.rel
				slot7 = slot7(slot8)
				slot4 = slot6 .. slot7
			end
		end
	end

	slot5 = slot0.hexdump
	slot6 = 0

	if slot5 > slot6 then
		slot5 = slot0.out
		slot6 = slot2
		slot7 = "%08x  %s  %-5s %s%s\n"
		slot8 = slot0.addr
		slot8 = slot8 + slot3
		slot9 = slot1
		slot10 = slot0.op
		slot9 = slot9(slot10)
		slot10 = slot1
		slot11 = slot3
		slot12 = slot2
		slot13 = ", "
		slot11 = slot11(slot12, slot13)
		slot12 = slot4

		slot5(slot6(slot7, slot8, slot9, slot10, slot11, slot12))
	else
		slot5 = slot0.out
		slot6 = slot2
		slot7 = "%08x  %-5s %s%s\n"
		slot8 = slot0.addr
		slot8 = slot8 + slot3
		slot9 = slot1
		slot10 = slot3
		slot11 = slot2
		slot12 = ", "
		slot10 = slot10(slot11, slot12)
		slot11 = slot4

		slot5(slot6(slot7, slot8, slot9, slot10, slot11))
	end

	slot5 = slot3 + 4
	slot0.pos = slot5
end

function slot42(slot0)
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

function slot43(slot0, slot1, slot2)
	slot3 = slot0[slot1(slot2(slot1, 16), 15)]
	slot4, slot5 = nil
	slot6 = slot1(slot1, 67108864) == 0

	if not slot6 then
		slot7 = slot1
		slot8 = slot1
		slot9 = 33554432
		slot7 = slot7(slot8, slot9)

		if slot7 == 0 then
			slot7 = slot1
			slot8 = slot1
			slot9 = 4095
			slot7 = slot7(slot8, slot9)
			slot5 = slot7
			slot7 = slot1
			slot8 = slot1
			slot9 = 8388608
			slot7 = slot7(slot8, slot9)

			if slot7 == 0 then
				slot5 = -slot5
			end

			if slot3 == "pc" then
				slot7 = slot0.addr
				slot7 = slot7 + slot2
				slot7 = slot7 + 8
				slot7 = slot7 + slot5
				slot0.rel = slot7
			end

			slot7 = "#"
			slot8 = slot5
			slot5 = slot7 .. slot8
		end
	elseif slot6 then
		slot7 = slot1
		slot8 = slot1
		slot9 = 4194304
		slot7 = slot7(slot8, slot9)

		if slot7 ~= 0 then
			slot7 = slot1
			slot8 = slot1
			slot9 = 15
			slot7 = slot7(slot8, slot9)
			slot8 = slot1
			slot9 = slot2
			slot10 = slot1
			slot11 = 4
			slot9 = slot9(slot10, slot11)
			slot10 = 240
			slot8 = slot8(slot9, slot10)
			slot5 = slot7 + slot8
			slot7 = slot1
			slot8 = slot1
			slot9 = 8388608
			slot7 = slot7(slot8, slot9)

			if slot7 == 0 then
				slot5 = -slot5
			end

			if slot3 == "pc" then
				slot7 = slot0.addr
				slot7 = slot7 + slot2
				slot7 = slot7 + 8
				slot7 = slot7 + slot5
				slot0.rel = slot7
			end

			slot7 = "#"
			slot8 = slot5
			slot5 = slot7 .. slot8
		end
	else
		slot7 = slot0
		slot8 = slot1
		slot9 = slot1
		slot10 = 15
		slot8 = slot8(slot9, slot10)
		slot5 = slot7[slot8]

		if not slot6 then
			slot7 = slot1
			slot8 = slot1
			slot9 = 4064
			slot7 = slot7(slot8, slot9)

			if slot7 == 0 then
			else
				slot7 = slot1
				slot8 = slot1
				slot9 = 4064
				slot7 = slot7(slot8, slot9)

				if slot7 == 96 then
					slot7 = slot3
					slot8 = "%s, rrx"
					slot9 = slot5
					slot7 = slot7(slot8, slot9)
					slot5 = slot7
				else
					slot7 = slot1
					slot8 = slot2
					slot9 = slot1
					slot10 = 7
					slot8 = slot8(slot9, slot10)
					slot9 = 31
					slot7 = slot7(slot8, slot9)

					if slot7 == 0 then
						slot7 = 32
					end

					slot8 = slot3
					slot9 = "%s, %s #%d"
					slot10 = slot5
					slot11 = slot4
					slot12 = slot1
					slot13 = slot2
					slot14 = slot1
					slot15 = 5
					slot13 = slot13(slot14, slot15)
					slot14 = 3
					slot12 = slot12(slot13, slot14)
					slot11 = slot11[slot12]
					slot12 = slot7
					slot8 = slot8(slot9, slot10, slot11, slot12)
					slot5 = slot8
				end
			end
		end

		slot7 = slot1
		slot8 = slot1
		slot9 = 8388608
		slot7 = slot7(slot8, slot9)

		if slot7 == 0 then
			slot7 = "-"
			slot8 = slot5
			slot5 = slot7 .. slot8
		end
	end

	if slot5 == "#0" then
		slot7 = slot3
		slot8 = "[%s]"
		slot9 = slot3
		slot7 = slot7(slot8, slot9)
		slot4 = slot7
	else
		slot7 = slot1
		slot8 = slot1
		slot9 = 16777216
		slot7 = slot7(slot8, slot9)

		if slot7 == 0 then
			slot7 = slot3
			slot8 = "[%s], %s"
			slot9 = slot3
			slot10 = slot5
			slot7 = slot7(slot8, slot9, slot10)
			slot4 = slot7
		else
			slot7 = slot3
			slot8 = "[%s, %s]"
			slot9 = slot3
			slot10 = slot5
			slot7 = slot7(slot8, slot9, slot10)
			slot4 = slot7
		end
	end

	slot7 = slot1
	slot8 = slot1
	slot9 = 18874368
	slot7 = slot7(slot8, slot9)

	if slot7 == 18874368 then
		slot7 = slot4
		slot8 = "!"
		slot4 = slot7 .. slot8
	end

	return slot4
end

function slot44(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot1
	slot5 = slot2
	slot6 = slot1
	slot7 = 16
	slot5 = slot5(slot6, slot7)
	slot6 = 15
	slot4 = slot4(slot5, slot6)
	slot3 = slot3[slot4]
	slot4 = slot1
	slot5 = slot1
	slot6 = 255
	slot4 = slot4(slot5, slot6)
	slot4 = slot4 * 4
	slot5 = slot1
	slot6 = slot1
	slot7 = 8388608
	slot5 = slot5(slot6, slot7)

	if slot5 == 0 then
		slot4 = -slot4
	end

	if slot3 == "pc" then
		slot5 = slot0.addr
		slot5 = slot5 + slot2
		slot5 = slot5 + 8
		slot5 = slot5 + slot4
		slot0.rel = slot5
	end

	if slot4 == 0 then
		slot5 = slot3
		slot6 = "[%s]"
		slot7 = slot3

		return slot5(slot6, slot7)
	else
		slot5 = slot3
		slot6 = "[%s, #%d]"
		slot7 = slot3
		slot8 = slot4

		return slot5(slot6, slot7, slot8)
	end
end

function slot45(slot0, slot1, slot2, slot3)
	if slot1 == "s" then
		slot4 = slot0
		slot5 = "s%d"
		slot6 = slot1
		slot7 = slot2
		slot8 = slot0
		slot9 = slot2
		slot7 = slot7(slot8, slot9)
		slot8 = 15
		slot6 = slot6(slot7, slot8)
		slot6 = 2 * slot6
		slot7 = slot1
		slot8 = slot2
		slot9 = slot0
		slot10 = slot3
		slot8 = slot8(slot9, slot10)
		slot9 = 1
		slot7 = slot7(slot8, slot9)
		slot6 = slot6 + slot7

		return slot4(slot5, slot6)
	else
		slot4 = slot0
		slot5 = "d%d"
		slot6 = slot1
		slot7 = slot2
		slot8 = slot0
		slot9 = slot2
		slot7 = slot7(slot8, slot9)
		slot8 = 15
		slot6 = slot6(slot7, slot8)
		slot7 = slot1
		slot8 = slot2
		slot9 = slot0
		slot10 = slot3 - 4
		slot8 = slot8(slot9, slot10)
		slot9 = 16
		slot7 = slot7(slot8, slot9)
		slot6 = slot6 + slot7

		return slot4(slot5, slot6)
	end
end

function slot46(slot0)
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
	slot6 = slot6(slot7, slot8, slot9, slot10)
	slot7 = {}
	slot8 = ""
	slot9, slot10, slot11, slot12 = nil
	slot0.op = slot6
	slot13 = nil
	slot0.rel = slot13
	slot13 = slot3
	slot14 = slot6
	slot15 = 28
	slot13 = slot13(slot14, slot15)
	slot14 = nil

	if slot13 == 15 then
		slot15 = slot4
		slot16 = slot5
		slot17 = slot3
		slot18 = slot6
		slot19 = 25
		slot17 = slot17(slot18, slot19)
		slot18 = 7
		slot16 = slot16(slot17, slot18)
		slot14 = slot15[slot16]
	else
		if slot13 ~= 14 then
			slot15 = slot6
			slot8 = slot15[slot13]
		end

		slot15 = slot7
		slot16 = slot5
		slot17 = slot3
		slot18 = slot6
		slot19 = 25
		slot17 = slot17(slot18, slot19)
		slot18 = 7
		slot16 = slot16(slot17, slot18)
		slot14 = slot15[slot16]
	end

	slot15 = slot8
	slot16 = slot14
	slot15 = slot15(slot16)

	while slot15 ~= "string" do
		if not slot14 then
			slot15 = slot9
			slot16 = slot0

			return slot15(slot16)
		end

		slot14 = slot14[slot5(slot3(slot6, slot14.shift), slot14.mask)] or slot14._
	end

	slot15 = slot10
	slot16 = slot14
	slot17 = "^([a-z0-9]*)(.*)"
	slot15, slot16 = slot15(slot16, slot17)
	slot11 = slot16
	slot10 = slot15
	slot15 = slot11
	slot16 = slot11
	slot17 = 1
	slot18 = 1
	slot15 = slot15(slot16, slot17, slot18)

	if slot15 == "." then
		slot15 = slot10
		slot16 = slot11
		slot17 = "^([a-z0-9.]*)(.*)"
		slot15, slot16 = slot15(slot16, slot17)
		slot17 = slot8
		slot18 = slot15
		slot8 = slot17 .. slot18
		slot11 = slot16
	end

	slot15 = slot12
	slot16 = slot11
	slot17 = "."
	slot15, slot16, slot17 = slot15(slot16, slot17)

	for slot18 in slot15, slot16, slot17 do
		slot19 = nil

		if slot18 == "D" then
			slot20 = slot13
			slot21 = slot5
			slot22 = slot3
			slot23 = slot6
			slot24 = 12
			slot22 = slot22(slot23, slot24)
			slot23 = 15
			slot21 = slot21(slot22, slot23)
			slot19 = slot20[slot21]
		elseif slot18 == "N" then
			slot20 = slot13
			slot21 = slot5
			slot22 = slot3
			slot23 = slot6
			slot24 = 16
			slot22 = slot22(slot23, slot24)
			slot23 = 15
			slot21 = slot21(slot22, slot23)
			slot19 = slot20[slot21]
		elseif slot18 == "S" then
			slot20 = slot13
			slot21 = slot5
			slot22 = slot3
			slot23 = slot6
			slot24 = 8
			slot22 = slot22(slot23, slot24)
			slot23 = 15
			slot21 = slot21(slot22, slot23)
			slot19 = slot20[slot21]
		elseif slot18 == "M" then
			slot20 = slot13
			slot21 = slot5
			slot22 = slot6
			slot23 = 15
			slot21 = slot21(slot22, slot23)
			slot19 = slot20[slot21]
		elseif slot18 == "d" then
			slot20 = slot14
			slot21 = slot6
			slot22 = slot12
			slot23 = 12
			slot24 = 22
			slot20 = slot20(slot21, slot22, slot23, slot24)
			slot19 = slot20
		elseif slot18 == "n" then
			slot20 = slot14
			slot21 = slot6
			slot22 = slot12
			slot23 = 16
			slot24 = 7
			slot20 = slot20(slot21, slot22, slot23, slot24)
			slot19 = slot20
		elseif slot18 == "m" then
			slot20 = slot14
			slot21 = slot6
			slot22 = slot12
			slot23 = 0
			slot24 = 5
			slot20 = slot20(slot21, slot22, slot23, slot24)
			slot19 = slot20
		elseif slot18 == "P" then
			slot20 = slot5
			slot21 = slot6
			slot22 = 33554432
			slot20 = slot20(slot21, slot22)

			if slot20 ~= 0 then
				slot20 = slot15
				slot21 = slot5
				slot22 = slot6
				slot23 = 255
				slot21 = slot21(slot22, slot23)
				slot22 = slot5
				slot23 = slot3
				slot24 = slot6
				slot25 = 8
				slot23 = slot23(slot24, slot25)
				slot24 = 15
				slot22 = slot22(slot23, slot24)
				slot22 = 2 * slot22
				slot20 = slot20(slot21, slot22)
				slot19 = slot20
			else
				slot20 = slot13
				slot21 = slot5
				slot22 = slot6
				slot23 = 15
				slot21 = slot21(slot22, slot23)
				slot19 = slot20[slot21]
				slot20 = slot5
				slot21 = slot6
				slot22 = 4080
				slot20 = slot20(slot21, slot22)

				if slot20 ~= 0 then
					slot20 = #slot7
					slot20 = slot20 + 1
					slot7[slot20] = slot19
					slot20 = slot16
					slot21 = slot5
					slot22 = slot3
					slot23 = slot6
					slot24 = 5
					slot22 = slot22(slot23, slot24)
					slot23 = 3
					slot21 = slot21(slot22, slot23)
					slot20 = slot20[slot21]
					slot21 = nil
					slot22 = slot5
					slot23 = slot6
					slot24 = 3984
					slot22 = slot22(slot23, slot24)

					if slot22 == 0 then
						if slot20 == "ror" then
							slot20 = "rrx"
						else
							slot21 = "#32"
						end
					else
						slot22 = slot5
						slot23 = slot6
						slot24 = 16
						slot22 = slot22(slot23, slot24)

						if slot22 == 0 then
							slot22 = "#"
							slot23 = slot5
							slot24 = slot3
							slot25 = slot6
							slot26 = 7
							slot24 = slot24(slot25, slot26)
							slot25 = 31
							slot23 = slot23(slot24, slot25)
							slot21 = slot22 .. slot23
						else
							slot22 = slot13
							slot23 = slot5
							slot24 = slot3
							slot25 = slot6
							slot26 = 8
							slot24 = slot24(slot25, slot26)
							slot25 = 15
							slot23 = slot23(slot24, slot25)
							slot21 = slot22[slot23]
						end
					end

					if slot10 == "mov" then
						slot10 = slot20
						slot19 = slot21
					elseif slot21 then
						slot22 = slot17
						slot23 = "%s %s"
						slot24 = slot20
						slot25 = slot21
						slot22 = slot22(slot23, slot24, slot25)
						slot19 = slot22
					else
						slot19 = slot20
					end
				end
			end
		elseif slot18 == "L" then
			slot20 = slot18
			slot21 = slot0
			slot22 = slot6
			slot23 = slot1
			slot20 = slot20(slot21, slot22, slot23)
			slot19 = slot20
		elseif slot18 == "l" then
			slot20 = slot19
			slot21 = slot0
			slot22 = slot6
			slot23 = slot1
			slot20 = slot20(slot21, slot22, slot23)
			slot19 = slot20
		elseif slot18 == "B" then
			slot20 = slot0.addr
			slot20 = slot20 + slot1
			slot20 = slot20 + 8
			slot21 = slot20
			slot22 = slot2
			slot23 = slot6
			slot24 = 8
			slot22 = slot22(slot23, slot24)
			slot23 = 6
			slot21 = slot21(slot22, slot23)
			slot20 = slot20 + slot21

			if slot13 == 15 then
				slot21 = slot5
				slot22 = slot3
				slot23 = slot6
				slot24 = 23
				slot22 = slot22(slot23, slot24)
				slot23 = 2
				slot21 = slot21(slot22, slot23)
				slot20 = slot20 + slot21
			end

			slot0.rel = slot20
			slot21 = "0x"
			slot22 = slot21
			slot23 = slot20
			slot22 = slot22(slot23)
			slot19 = slot21 .. slot22
		elseif slot18 == "F" then
			slot12 = "s"
		elseif slot18 == "G" then
			slot12 = "d"
		elseif slot18 == "." then
			slot8 = slot8 .. ((slot12 == "s" and ".f32") or ".f64")
		elseif slot18 == "R" then
			slot20 = slot5
			slot21 = slot6
			slot22 = 2097152
			slot20 = slot20(slot21, slot22)

			if slot20 ~= 0 then
				slot20 = #slot7

				if slot20 == 1 then
					slot20 = slot7[1]
					slot21 = "!"
					slot20 = slot20 .. slot21
					slot7[1] = slot20
				end
			end

			slot20 = {}
			slot21 = 0
			slot22 = 15
			slot23 = 1

			for slot24 = slot21, slot22, slot23 do
				slot25 = slot5
				slot26 = slot3
				slot27 = slot6
				slot28 = slot24
				slot26 = slot26(slot27, slot28)
				slot27 = 1
				slot25 = slot25(slot26, slot27)

				if slot25 == 1 then
					slot25 = #slot20
					slot25 = slot25 + 1
					slot26 = slot13
					slot26 = slot26[slot24]
					slot20[slot25] = slot26
				end
			end

			slot21 = "{"
			slot22 = slot22
			slot23 = slot20
			slot24 = ", "
			slot22 = slot22(slot23, slot24)
			slot23 = "}"
			slot19 = slot21 .. slot22 .. slot23
		elseif slot18 == "r" then
			slot20 = slot5
			slot21 = slot6
			slot22 = 2097152
			slot20 = slot20(slot21, slot22)

			if slot20 ~= 0 then
				slot20 = #slot7

				if slot20 == 2 then
					slot20 = slot7[1]
					slot21 = "!"
					slot20 = slot20 .. slot21
					slot7[1] = slot20
				end
			end

			slot20 = tonumber
			slot21 = slot11
			slot22 = slot9
			slot23 = 2
			slot20 = slot20(slot21(slot22, slot23))
			slot21 = slot5
			slot22 = slot6
			slot23 = 255
			slot21 = slot21(slot22, slot23)

			if slot12 == "d" then
				slot22 = slot3
				slot23 = slot21
				slot24 = 1
				slot22 = slot22(slot23, slot24)
				slot21 = slot22
			end

			slot22 = #slot7
			slot23 = slot17
			slot24 = "{%s-%s%d}"
			slot25 = slot9
			slot26 = slot12
			slot27 = slot20 + slot21
			slot27 = slot27 - 1
			slot23 = slot23(slot24, slot25, slot26, slot27)
			slot7[slot22] = slot23
		elseif slot18 == "W" then
			slot20 = slot5
			slot21 = slot6
			slot22 = 4095
			slot20 = slot20(slot21, slot22)
			slot21 = slot5
			slot22 = slot3
			slot23 = slot6
			slot24 = 4
			slot22 = slot22(slot23, slot24)
			slot23 = 61440
			slot21 = slot21(slot22, slot23)
			slot19 = slot20 + slot21
		elseif slot18 == "T" then
			slot20 = "#0x"
			slot21 = slot21
			slot22 = slot5
			slot23 = slot6
			slot24 = 16777215
			slot22 = slot22(slot23, slot24)
			slot23 = 6
			slot21 = slot21(slot22, slot23)
			slot19 = slot20 .. slot21
		elseif slot18 == "U" then
			slot20 = slot5
			slot21 = slot3
			slot22 = slot6
			slot23 = 7
			slot21 = slot21(slot22, slot23)
			slot22 = 31
			slot20 = slot20(slot21, slot22)
			slot19 = slot20

			if slot19 == 0 then
				slot19 = nil
			end
		elseif slot18 == "u" then
			slot20 = slot5
			slot21 = slot3
			slot22 = slot6
			slot23 = 7
			slot21 = slot21(slot22, slot23)
			slot22 = 31
			slot20 = slot20(slot21, slot22)
			slot19 = slot20
			slot20 = slot5
			slot21 = slot6
			slot22 = 64
			slot20 = slot20(slot21, slot22)

			if slot20 == 0 then
				if slot19 == 0 then
					slot19 = nil
				else
					slot20 = "lsl #"
					slot21 = slot19
					slot19 = slot20 .. slot21
				end
			elseif slot19 == 0 then
				slot19 = "asr #32"
			else
				slot20 = "asr #"
				slot21 = slot19
				slot19 = slot20 .. slot21
			end
		elseif slot18 == "v" then
			slot20 = slot5
			slot21 = slot3
			slot22 = slot6
			slot23 = 7
			slot21 = slot21(slot22, slot23)
			slot22 = 31
			slot20 = slot20(slot21, slot22)
			slot19 = slot20
		elseif slot18 == "w" then
			slot20 = slot5
			slot21 = slot3
			slot22 = slot6
			slot23 = 16
			slot21 = slot21(slot22, slot23)
			slot22 = 31
			slot20 = slot20(slot21, slot22)
			slot19 = slot20
		elseif slot18 == "x" then
			slot20 = slot5
			slot21 = slot3
			slot22 = slot6
			slot23 = 16
			slot21 = slot21(slot22, slot23)
			slot22 = 31
			slot20 = slot20(slot21, slot22)
			slot19 = slot20 + 1
		elseif slot18 == "X" then
			slot20 = slot5
			slot21 = slot3
			slot22 = slot6
			slot23 = 16
			slot21 = slot21(slot22, slot23)
			slot22 = 31
			slot20 = slot20(slot21, slot22)
			slot20 = slot20 - slot9
			slot19 = slot20 + 1
		elseif slot18 == "Y" then
			slot20 = slot5
			slot21 = slot3
			slot22 = slot6
			slot23 = 12
			slot21 = slot21(slot22, slot23)
			slot22 = 240
			slot20 = slot20(slot21, slot22)
			slot21 = slot5
			slot22 = slot6
			slot23 = 15
			slot21 = slot21(slot22, slot23)
			slot19 = slot20 + slot21
		elseif slot18 == "K" then
			slot20 = "#0x"
			slot21 = slot21
			slot22 = slot5
			slot23 = slot3
			slot24 = slot6
			slot25 = 4
			slot23 = slot23(slot24, slot25)
			slot24 = 65520
			slot22 = slot22(slot23, slot24)
			slot23 = slot5
			slot24 = slot6
			slot25 = 15
			slot23 = slot23(slot24, slot25)
			slot22 = slot22 + slot23
			slot23 = 4
			slot21 = slot21(slot22, slot23)
			slot19 = slot20 .. slot21
		elseif slot18 == "s" then
			slot20 = slot5
			slot21 = slot6
			slot22 = 1048576
			slot20 = slot20(slot21, slot22)

			if slot20 ~= 0 then
				slot20 = "s"
				slot21 = slot8
				slot8 = slot20 .. slot21
			end
		end

		if slot19 then
			slot9 = slot19
			slot20 = slot8
			slot21 = slot19
			slot20 = slot20(slot21)

			if slot20 == "number" then
				slot20 = "#"
				slot21 = slot19
				slot19 = slot20 .. slot21
			end

			slot20 = #slot7
			slot20 = slot20 + 1
			slot7[slot20] = slot19
		end
	end

	slot15 = slot23
	slot16 = slot0
	slot17 = slot10
	slot18 = slot8
	slot17 = slot17 .. slot18
	slot18 = slot7

	return slot15(slot16, slot17, slot18)
end

function slot47(slot0, slot1, slot2)
	slot1 = slot1 or 0

	if slot2 then
		slot3 = slot1 + slot2

		if not slot3 then
			slot3 = slot0.code
			slot3 = #slot3
		end
	end

	slot0.pos = slot1
	slot4 = nil
	slot0.rel = slot4
	slot4 = slot0.pos

	while slot4 < slot3 do
		slot4 = slot0
		slot5 = slot0

		slot4(slot5)
	end
end

function slot48(slot0, slot1, slot2)
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

	return slot3
end

function slot49(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot6 = slot2
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = slot3
	slot3 = slot3.disass

	slot3(slot4)
end

function slot50(slot0)
	slot1 = 16

	if slot0 < slot1 then
		slot1 = slot0
		slot1 = slot1[slot0]

		return slot1
	end

	slot1 = "d"
	slot2 = slot0 - 16
	slot1 = slot1 .. slot2

	return slot1
end

slot51 = {
	create = slot48,
	disass = slot49,
	regname = slot50
}

return slot51
