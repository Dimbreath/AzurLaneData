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
slot6 = string
slot6 = slot6.gsub
slot7 = table
slot7 = slot7.concat
slot8 = require
slot9 = "bit"
slot8 = slot8(slot9)
slot9 = slot8.band
slot10 = slot8.bor
slot11 = slot8.bxor
slot12 = slot8.tohex
slot13 = slot8.lshift
slot14 = slot8.rshift
slot15 = slot8.arshift
slot16 = slot8.ror
slot17 = {
	[0] = "adrDBx",
	"adrpDBx",
	shift = 31,
	mask = 1
}
slot18 = {
	[0] = "add|movDNIg",
	"adds|cmnD0NIg",
	"subDNIg",
	"subs|cmpD0NIg",
	shift = 29,
	mask = 3
}
slot19 = {
	shift = 31,
	mask = 1
}
slot20 = {
	false,
	shift = 22,
	mask = 1
}
slot21 = {
	[0] = "andDNig",
	"orr|movDN0ig",
	"eorDNig",
	"ands|tstD0Nig",
	shift = 29,
	mask = 3
}
slot20[0] = slot21
slot19[0] = slot20
slot20 = {
	[0] = "andDNig",
	"orr|movDN0ig",
	"eorDNig",
	"ands|tstD0Nig",
	shift = 29,
	mask = 3
}
slot19[1] = slot20
slot20 = {
	shift = 31,
	mask = 1
}
slot21 = {
	false,
	shift = 22,
	mask = 1
}
slot22 = {
	[0] = "movnDWRg",
	false,
	"movz|movDYRg",
	"movkDWRg",
	shift = 29,
	mask = 3
}
slot21[0] = slot22
slot20[0] = slot21
slot21 = {
	[0] = "movnDWRg",
	false,
	"movz|movDYRg",
	"movkDWRg",
	shift = 29,
	mask = 3
}
slot20[1] = slot21
slot21 = {
	shift = 31,
	mask = 1
}
slot22 = {
	shift = 22,
	mask = 1
}
slot23 = {
	[0] = "sbfm|sbfiz|sbfx|asr|sxtw|sxth|sxtbDN12w",
	"bfm|bfi|bfxilDN13w",
	"ubfm|ubfiz|ubfx|lsr|lsl|uxth|uxtbDN12w",
	shift = 29,
	mask = 3
}
slot22[0] = slot23
slot21[0] = slot22
slot22 = {
	shift = 22,
	mask = 1
}
slot23 = {
	[0] = "sbfm|sbfiz|sbfx|asr|sxtw|sxth|sxtbDN12x",
	"bfm|bfi|bfxilDN13x",
	"ubfm|ubfiz|ubfx|lsr|lsl|uxth|uxtbDN12x",
	shift = 29,
	mask = 3
}
slot22[1] = slot23
slot21[1] = slot22
slot22 = {
	[0] = slot17,
	slot17,
	slot18,
	false,
	slot19,
	slot20,
	slot21,
	shift = 23,
	mask = 7
}
slot23 = {
	[0] = "extr|rorDNM4w",
	[65664.0] = "extr|rorDNM4x",
	[65665.0] = "extr|rorDNM4x",
	shift = 15,
	mask = 114881
}
slot22[7] = slot23
slot23 = {
	shift = 31,
	mask = 1
}
slot24 = {
	false,
	shift = 15,
	mask = 1
}
slot25 = {
	shift = 29,
	mask = 3
}
slot26 = {
	[0] = "andDNMSg",
	"bicDNMSg",
	"andDNMSg",
	"bicDNMSg",
	"andDNMSg",
	"bicDNMSg",
	"andDNMg",
	"bicDNMg",
	shift = 21,
	mask = 7
}
slot25[0] = slot26
slot26 = {
	[0] = "orr|movDN0MSg",
	"orn|mvnDN0MSg",
	"orr|movDN0MSg",
	"orn|mvnDN0MSg",
	"orr|movDN0MSg",
	"orn|mvnDN0MSg",
	"orr|movDN0Mg",
	"orn|mvnDN0Mg",
	shift = 21,
	mask = 7
}
slot25[1] = slot26
slot26 = {
	[0] = "eorDNMSg",
	"eonDNMSg",
	"eorDNMSg",
	"eonDNMSg",
	"eorDNMSg",
	"eonDNMSg",
	"eorDNMg",
	"eonDNMg",
	shift = 21,
	mask = 7
}
slot25[2] = slot26
slot26 = {
	[0] = "ands|tstD0NMSg",
	"bicsDNMSg",
	"ands|tstD0NMSg",
	"bicsDNMSg",
	"ands|tstD0NMSg",
	"bicsDNMSg",
	"ands|tstD0NMg",
	"bicsDNMg",
	shift = 21,
	mask = 7
}
slot25[3] = slot26
slot24[0] = slot25
slot23[0] = slot24
slot24 = {
	shift = 29,
	mask = 3
}
slot25 = {
	[0] = "andDNMSg",
	"bicDNMSg",
	"andDNMSg",
	"bicDNMSg",
	"andDNMSg",
	"bicDNMSg",
	"andDNMg",
	"bicDNMg",
	shift = 21,
	mask = 7
}
slot24[0] = slot25
slot25 = {
	[0] = "orr|movDN0MSg",
	"orn|mvnDN0MSg",
	"orr|movDN0MSg",
	"orn|mvnDN0MSg",
	"orr|movDN0MSg",
	"orn|mvnDN0MSg",
	"orr|movDN0Mg",
	"orn|mvnDN0Mg",
	shift = 21,
	mask = 7
}
slot24[1] = slot25
slot25 = {
	[0] = "eorDNMSg",
	"eonDNMSg",
	"eorDNMSg",
	"eonDNMSg",
	"eorDNMSg",
	"eonDNMSg",
	"eorDNMg",
	"eonDNMg",
	shift = 21,
	mask = 7
}
slot24[2] = slot25
slot25 = {
	[0] = "ands|tstD0NMSg",
	"bicsDNMSg",
	"ands|tstD0NMSg",
	"bicsDNMSg",
	"ands|tstD0NMSg",
	"bicsDNMSg",
	"ands|tstD0NMg",
	"bicsDNMg",
	shift = 21,
	mask = 7
}
slot24[3] = slot25
slot23[1] = slot24
slot24 = {
	shift = 31,
	mask = 1
}
slot25 = {
	false,
	shift = 15,
	mask = 1
}
slot26 = {
	shift = 29,
	mask = 3
}
slot27 = {
	[0] = "addDNMSg",
	"addDNMSg",
	"addDNMSg",
	"addDNMg",
	shift = 22,
	mask = 3
}
slot26[0] = slot27
slot27 = {
	[0] = "adds|cmnD0NMSg",
	"adds|cmnD0NMSg",
	"adds|cmnD0NMSg",
	"adds|cmnD0NMg",
	shift = 22,
	mask = 3
}
slot26[1] = slot27
slot27 = {
	[0] = "sub|negDN0MSg",
	"sub|negDN0MSg",
	"sub|negDN0MSg",
	"sub|negDN0Mg",
	shift = 22,
	mask = 3
}
slot26[2] = slot27
slot27 = {
	[0] = "subs|cmp|negsD0N0MzSg",
	"subs|cmp|negsD0N0MzSg",
	"subs|cmp|negsD0N0MzSg",
	"subs|cmp|negsD0N0Mzg",
	shift = 22,
	mask = 3
}
slot26[3] = slot27
slot25[0] = slot26
slot24[0] = slot25
slot25 = {
	shift = 29,
	mask = 3
}
slot26 = {
	[0] = "addDNMSg",
	"addDNMSg",
	"addDNMSg",
	"addDNMg",
	shift = 22,
	mask = 3
}
slot25[0] = slot26
slot26 = {
	[0] = "adds|cmnD0NMSg",
	"adds|cmnD0NMSg",
	"adds|cmnD0NMSg",
	"adds|cmnD0NMg",
	shift = 22,
	mask = 3
}
slot25[1] = slot26
slot26 = {
	[0] = "sub|negDN0MSg",
	"sub|negDN0MSg",
	"sub|negDN0MSg",
	"sub|negDN0Mg",
	shift = 22,
	mask = 3
}
slot25[2] = slot26
slot26 = {
	[0] = "subs|cmp|negsD0N0MzSg",
	"subs|cmp|negsD0N0MzSg",
	"subs|cmp|negsD0N0MzSg",
	"subs|cmp|negsD0N0Mzg",
	shift = 22,
	mask = 3
}
slot25[3] = slot26
slot24[1] = slot25
slot25 = {
	[0] = slot24,
	slot24,
	slot24,
	shift = 22,
	mask = 3
}
slot26 = {
	shift = 22,
	mask = 3
}
slot27 = {
	[0] = "addDNMXg",
	"adds|cmnD0NMXg",
	"subDNMXg",
	"subs|cmpD0NMzXg",
	shift = 29,
	mask = 3
}
slot26[0] = slot27
slot27 = {
	shift = 10,
	mask = 63
}
slot28 = {
	[0] = "adcDNMg",
	"adcsDNMg",
	"sbc|ngcDN0Mg",
	"sbcs|ngcsDN0Mg",
	shift = 29,
	mask = 3
}
slot27[0] = slot28
slot28 = {
	shift = 4,
	mask = 1
}
slot29 = {
	shift = 10,
	mask = 3
}
slot30 = {
	"ccmnNMVCg",
	false,
	"ccmpNMVCg",
	shift = 29,
	mask = 3
}
slot29[0] = slot30
slot30 = {
	"ccmnN5VCg",
	false,
	"ccmpN5VCg",
	shift = 29,
	mask = 3
}
slot29[2] = slot30
slot28[0] = slot29
slot29 = {
	shift = 11,
	mask = 1
}
slot30 = {
	shift = 10,
	mask = 1
}
slot31 = {
	[0] = "cselDNMzCg",
	false,
	"csinv|cinv|csetmDNMcg",
	false,
	shift = 29,
	mask = 3
}
slot30[0] = slot31
slot31 = {
	[0] = "csinc|cinc|csetDNMcg",
	false,
	"csneg|cnegDNMcg",
	false,
	shift = 29,
	mask = 3
}
slot30[1] = slot31
slot29[0] = slot30
slot30 = {
	shift = 29,
	mask = 1
}
slot31 = {
	shift = 31,
	mask = 1
}
slot32 = {
	[0] = "rbitDNg",
	"rev16DNg",
	"revDNw",
	false,
	"clzDNg",
	"clsDNg",
	shift = 10,
	mask = 2047
}
slot31[0] = slot32
slot32 = {
	[0] = "rbitDNg",
	"rev16DNg",
	"rev32DNx",
	"revDNx",
	"clzDNg",
	"clsDNg",
	shift = 10,
	mask = 2047
}
slot31[1] = slot32
slot30[0] = slot31
slot31 = {
	shift = 29,
	mask = 1
}
slot32 = {
	false,
	"udivDNMg",
	"sdivDNMg",
	false,
	false,
	false,
	false,
	"lslDNMg",
	"lsrDNMg",
	"asrDNMg",
	"rorDNMg",
	shift = 10,
	mask = 63
}
slot31[0] = slot32
slot32 = {
	false,
	false,
	false,
	shift = 29,
	mask = 7
}
slot33 = {
	shift = 21,
	mask = 7
}
slot34 = {
	[0] = "madd|mulDNMA0g",
	"msub|mnegDNMA0g",
	shift = 15,
	mask = 1
}
slot33[0] = slot34
slot32[0] = slot33
slot33 = {
	shift = 15,
	mask = 1
}
slot34 = {
	[0] = "madd|mulDNMA0g",
	"smaddl|smullDxNMwA0x",
	"smulhDNMx",
	false,
	false,
	"umaddl|umullDxNMwA0x",
	"umulhDNMx",
	shift = 21,
	mask = 7
}
slot33[0] = slot34
slot34 = {
	[0] = "msub|mnegDNMA0g",
	"smsubl|smneglDxNMwA0x",
	false,
	false,
	false,
	"umsubl|umneglDxNMwA0x",
	shift = 21,
	mask = 7
}
slot33[1] = slot34
slot32[4] = slot33
slot33 = {
	shift = 28,
	mask = 1
}
slot34 = {
	[0] = slot23,
	shift = 24,
	mask = 1
}
slot35 = {
	[0] = slot25,
	slot26,
	shift = 21,
	mask = 1
}
slot34[1] = slot35
slot33[0] = slot34
slot34 = {
	[0] = slot27,
	false,
	slot28,
	false,
	slot29,
	false,
	nil,
	false,
	shift = 21,
	mask = 15
}
slot35 = {
	[0] = slot31,
	slot30,
	shift = 30,
	mask = 1
}
slot34[6] = slot35
slot34[8] = slot32
slot34[9] = slot32
slot34[10] = slot32
slot34[11] = slot32
slot34[12] = slot32
slot34[13] = slot32
slot34[14] = slot32
slot34[15] = slot32
slot33[1] = slot34
slot34 = {
	shift = 26,
	mask = 1
}
slot35 = {
	[0] = "ldrDwB",
	"ldrDxB",
	"ldrswDxB",
	shift = 30,
	mask = 3
}
slot34[0] = slot35
slot35 = {
	[0] = "ldrDsB",
	"ldrDdB",
	shift = 30,
	mask = 3
}
slot34[1] = slot35
slot35 = {
	shift = 30,
	mask = 3
}
slot36 = {
	shift = 26,
	mask = 1
}
slot37 = {
	[0] = "strbDwzL",
	"ldrbDwzL",
	"ldrsbDxzL",
	"ldrsbDwzL",
	shift = 22,
	mask = 3
}
slot36[0] = slot37
slot35[0] = slot36
slot36 = {
	shift = 26,
	mask = 1
}
slot37 = {
	[0] = "strhDwzL",
	"ldrhDwzL",
	"ldrshDxzL",
	"ldrshDwzL",
	shift = 22,
	mask = 3
}
slot36[0] = slot37
slot35[1] = slot36
slot36 = {
	shift = 26,
	mask = 1
}
slot37 = {
	[0] = "strDwzL",
	"ldrDwzL",
	"ldrswDxzL",
	shift = 22,
	mask = 3
}
slot36[0] = slot37
slot37 = {
	[0] = "strDszL",
	"ldrDszL",
	shift = 22,
	mask = 3
}
slot36[1] = slot37
slot35[2] = slot36
slot36 = {
	shift = 26,
	mask = 1
}
slot37 = {
	[0] = "strDxzL",
	"ldrDxzL",
	shift = 22,
	mask = 3
}
slot36[0] = slot37
slot37 = {
	[0] = "strDdzL",
	"ldrDdzL",
	shift = 22,
	mask = 3
}
slot36[1] = slot37
slot35[3] = slot36
slot36 = {
	shift = 21,
	mask = 1
}
slot37 = {
	nil,
	false,
	shift = 10,
	mask = 3
}
slot38 = {
	shift = 26,
	mask = 1
}
slot39 = {
	shift = 30,
	mask = 3
}
slot40 = {
	[0] = "sturbDwK",
	"ldurbDwK",
	shift = 22,
	mask = 3
}
slot39[0] = slot40
slot40 = {
	[0] = "sturhDwK",
	"ldurhDwK",
	shift = 22,
	mask = 3
}
slot39[1] = slot40
slot40 = {
	[0] = "sturDwK",
	"ldurDwK",
	shift = 22,
	mask = 3
}
slot39[2] = slot40
slot40 = {
	[0] = "sturDxK",
	"ldurDxK",
	shift = 22,
	mask = 3
}
slot39[3] = slot40
slot38[0] = slot39
slot37[0] = slot38
slot37[1] = slot35
slot37[3] = slot35
slot36[0] = slot37
slot37 = {
	shift = 10,
	mask = 3
}
slot38 = {
	shift = 26,
	mask = 1
}
slot39 = {
	shift = 30,
	mask = 3
}
slot40 = {
	[0] = "strbDwO",
	"ldrbDwO",
	"ldrsbDxO",
	"ldrsbDwO",
	shift = 22,
	mask = 3
}
slot39[0] = slot40
slot40 = {
	[0] = "strhDwO",
	"ldrhDwO",
	"ldrshDxO",
	"ldrshDwO",
	shift = 22,
	mask = 3
}
slot39[1] = slot40
slot40 = {
	[0] = "strDwO",
	"ldrDwO",
	"ldrswDxO",
	shift = 22,
	mask = 3
}
slot39[2] = slot40
slot40 = {
	[0] = "strDxO",
	"ldrDxO",
	shift = 22,
	mask = 3
}
slot39[3] = slot40
slot38[0] = slot39
slot39 = {
	shift = 30,
	mask = 3
}
slot40 = {
	[0] = "strDsO",
	"ldrDsO",
	shift = 22,
	mask = 3
}
slot39[2] = slot40
slot40 = {
	[0] = "strDdO",
	"ldrDdO",
	shift = 22,
	mask = 3
}
slot39[3] = slot40
slot38[1] = slot39
slot37[2] = slot38
slot36[1] = slot37
slot37 = {
	shift = 22,
	mask = 1
}
slot38 = {
	shift = 30,
	mask = 3
}
slot39 = {
	[0] = "stpDzAzwP",
	"stpDzAzsP",
	shift = 26,
	mask = 1
}
slot38[0] = slot39
slot39 = {
	"stpDzAzdP",
	shift = 26,
	mask = 1
}
slot38[1] = slot39
slot39 = {
	[0] = "stpDzAzxP",
	shift = 26,
	mask = 1
}
slot38[2] = slot39
slot37[0] = slot38
slot38 = {
	shift = 30,
	mask = 3
}
slot39 = {
	[0] = "ldpDzAzwP",
	"ldpDzAzsP",
	shift = 26,
	mask = 1
}
slot38[0] = slot39
slot39 = {
	[0] = "ldpswDAxP",
	"ldpDzAzdP",
	shift = 26,
	mask = 1
}
slot38[1] = slot39
slot39 = {
	[0] = "ldpDzAzxP",
	shift = 26,
	mask = 1
}
slot38[2] = slot39
slot37[1] = slot38
slot38 = {
	shift = 24,
	mask = 49,
	[16] = slot34,
	[48] = slot36
}
slot39 = {
	slot37,
	slot37,
	slot37,
	shift = 23,
	mask = 3
}
slot38[32] = slot39
slot39 = {
	slot37,
	slot37,
	slot37,
	shift = 23,
	mask = 3
}
slot38[33] = slot39
slot39 = {
	shift = 26,
	mask = 1
}
slot40 = {
	shift = 30,
	mask = 3
}
slot41 = {
	[0] = "strbDwzU",
	"ldrbDwzU",
	shift = 22,
	mask = 3
}
slot40[0] = slot41
slot41 = {
	[0] = "strhDwzU",
	"ldrhDwzU",
	shift = 22,
	mask = 3
}
slot40[1] = slot41
slot41 = {
	[0] = "strDwzU",
	"ldrDwzU",
	shift = 22,
	mask = 3
}
slot40[2] = slot41
slot41 = {
	[0] = "strDxzU",
	"ldrDxzU",
	shift = 22,
	mask = 3
}
slot40[3] = slot41
slot39[0] = slot40
slot40 = {
	shift = 30,
	mask = 3
}
slot41 = {
	[0] = "strDszU",
	"ldrDszU",
	shift = 22,
	mask = 3
}
slot40[2] = slot41
slot41 = {
	[0] = "strDdzU",
	"ldrDdzU",
	shift = 22,
	mask = 3
}
slot40[3] = slot41
slot39[1] = slot40
slot38[49] = slot39
slot39 = {
	shift = 28,
	mask = 7
}
slot40 = {
	shift = 24,
	mask = 1
}
slot41 = {
	shift = 21,
	mask = 1
}
slot42 = {
	shift = 10,
	mask = 3
}
slot43 = {
	shift = 12,
	mask = 1
}
slot44 = {
	shift = 13,
	mask = 1
}
slot45 = {
	shift = 14,
	mask = 1
}
slot46 = {
	shift = 15,
	mask = 1
}
slot47 = {
	shift = 31,
	mask = 1
}
slot48 = {
	[57.0] = "fcvtzuDwNs",
	[121.0] = "fcvtzuDwNd",
	[104.0] = "fcvtpsDwNd",
	[112.0] = "fcvtmsDwNd",
	[99.0] = "ucvtfDdNw",
	[97.0] = "fcvtnuDwNd",
	[100.0] = "fcvtasDwNd",
	[33.0] = "fcvtnuDwNs",
	[39.0] = "fmovDsNw",
	[35.0] = "ucvtfDsNw",
	[105.0] = "fcvtpuDwNd",
	[96.0] = "fcvtnsDwNd",
	[113.0] = "fcvtmuDwNd",
	[120.0] = "fcvtzsDwNd",
	[32.0] = "fcvtnsDwNs",
	[38.0] = "fmovDwNs",
	[36.0] = "fcvtasDwNs",
	[40.0] = "fcvtpsDwNs",
	mask = 255,
	[48.0] = "fcvtmsDwNs",
	[101.0] = "fcvtauDwNd",
	[56.0] = "fcvtzsDwNs",
	[37.0] = "fcvtauDwNs",
	[98.0] = "scvtfDdNw",
	[41.0] = "fcvtpuDwNs",
	[49.0] = "fcvtmuDwNs",
	shift = 16,
	[34.0] = "scvtfDsNw"
}
slot47[0] = slot48
slot48 = {
	[96.0] = "fcvtnsDxNd",
	[121.0] = "fcvtzuDxNd",
	[104.0] = "fcvtpsDxNd",
	[112.0] = "fcvtmsDxNd",
	[100.0] = "fcvtasDxNd",
	[97.0] = "fcvtnuDxNd",
	[56.0] = "fcvtzsDxNs",
	[33.0] = "fcvtnuDxNs",
	[105.0] = "fcvtpuDxNd",
	[102.0] = "fmovDxNd",
	[99.0] = "ucvtfDdNx",
	[113.0] = "fcvtmuDxNd",
	[120.0] = "fcvtzsDxNd",
	[103.0] = "fmovDdNx",
	[32.0] = "fcvtnsDxNs",
	[57.0] = "fcvtzuDxNs",
	[36.0] = "fcvtasDxNs",
	[40.0] = "fcvtpsDxNs",
	mask = 255,
	[48.0] = "fcvtmsDxNs",
	[101.0] = "fcvtauDxNd",
	[35.0] = "ucvtfDsNx",
	[37.0] = "fcvtauDxNs",
	[98.0] = "scvtfDdNx",
	[41.0] = "fcvtpuDxNs",
	[49.0] = "fcvtmuDxNs",
	shift = 16,
	[34.0] = "scvtfDsNx"
}
slot47[1] = slot48
slot46[0] = slot47
slot45[0] = slot46
slot46 = {
	shift = 31,
	mask = 1
}
slot47 = {
	shift = 22,
	mask = 3
}
slot48 = {
	[0] = "fmovDNf",
	"fabsDNf",
	"fnegDNf",
	"fsqrtDNf",
	false,
	"fcvtDdNs",
	false,
	false,
	"frintnDNf",
	"frintpDNf",
	"frintmDNf",
	"frintzDNf",
	"frintaDNf",
	false,
	"frintxDNf",
	"frintiDNf",
	shift = 15,
	mask = 63
}
slot47[0] = slot48
slot48 = {
	[0] = "fmovDNf",
	"fabsDNf",
	"fnegDNf",
	"fsqrtDNf",
	"fcvtDsNd",
	false,
	false,
	false,
	"frintnDNf",
	"frintpDNf",
	"frintmDNf",
	"frintzDNf",
	"frintaDNf",
	false,
	"frintxDNf",
	"frintiDNf",
	shift = 15,
	mask = 63
}
slot47[1] = slot48
slot46[0] = slot47
slot45[1] = slot46
slot44[0] = slot45
slot45 = {
	shift = 31,
	mask = 1
}
slot46 = {
	shift = 14,
	mask = 3
}
slot47 = {
	shift = 23,
	mask = 1
}
slot48 = {
	[0] = "fcmpNMf",
	[24.0] = "fcmpeNZf",
	[8.0] = "fcmpNZf",
	[16.0] = "fcmpeNMf",
	mask = 31,
	shift = 0
}
slot47[0] = slot48
slot46[0] = slot47
slot45[0] = slot46
slot44[1] = slot45
slot43[0] = slot44
slot44 = {
	shift = 31,
	mask = 1
}
slot45 = {
	shift = 5,
	mask = 31
}
slot46 = {
	[0] = "fmovDFf",
	shift = 23,
	mask = 1
}
slot45[0] = slot46
slot44[0] = slot45
slot43[1] = slot44
slot42[0] = slot43
slot43 = {
	shift = 31,
	mask = 1
}
slot44 = {
	shift = 23,
	mask = 1
}
slot45 = {
	[0] = "fccmpNMVCf",
	"fccmpeNMVCf",
	shift = 4,
	mask = 1
}
slot44[0] = slot45
slot43[0] = slot44
slot42[1] = slot43
slot43 = {
	shift = 31,
	mask = 1
}
slot44 = {
	shift = 23,
	mask = 1
}
slot45 = {
	[0] = "fmulDNMf",
	"fdivDNMf",
	"faddDNMf",
	"fsubDNMf",
	"fmaxDNMf",
	"fminDNMf",
	"fmaxnmDNMf",
	"fminnmDNMf",
	"fnmulDNMf",
	shift = 12,
	mask = 15
}
slot44[0] = slot45
slot43[0] = slot44
slot42[2] = slot43
slot43 = {
	shift = 31,
	mask = 1
}
slot44 = {
	[0] = "fcselDNMCf",
	shift = 23,
	mask = 1
}
slot43[0] = slot44
slot42[3] = slot43
slot41[1] = slot42
slot40[0] = slot41
slot41 = {
	shift = 31,
	mask = 1
}
slot42 = {
	shift = 15,
	mask = 1
}
slot43 = {
	[0] = "fmaddDNMAf",
	"fnmaddDNMAf",
	shift = 21,
	mask = 5
}
slot42[0] = slot43
slot43 = {
	[0] = "fmsubDNMAf",
	"fnmsubDNMAf",
	shift = 21,
	mask = 5
}
slot42[1] = slot43
slot41[0] = slot42
slot40[1] = slot41
slot39[1] = slot40
slot40 = {
	[0] = "bB",
	nil,
	nil,
	false,
	"blB",
	shift = 29,
	mask = 7
}
slot41 = {
	[0] = "cbzDBg",
	"cbnzDBg",
	"tbzDTBw",
	"tbnzDTBw",
	shift = 24,
	mask = 3
}
slot40[1] = slot41
slot41 = {
	shift = 24,
	mask = 3
}
slot42 = {
	shift = 4,
	mask = 1
}
slot43 = {
	[0] = "beqB",
	"bneB",
	"bhsB",
	"bloB",
	"bmiB",
	"bplB",
	"bvsB",
	"bvcB",
	"bhiB",
	"blsB",
	"bgeB",
	"bltB",
	"bgtB",
	"bleB",
	"balB",
	shift = 0,
	mask = 15
}
slot42[0] = slot43
slot41[0] = slot42
slot40[2] = slot41
slot41 = {
	[0] = "cbzDBg",
	"cbnzDBg",
	"tbzDTBx",
	"tbnzDTBx",
	shift = 24,
	mask = 3
}
slot40[5] = slot41
slot41 = {
	shift = 24,
	mask = 3
}
slot42 = {
	[2097152.0] = "brkW",
	shift = 0,
	mask = 14680095
}
slot41[0] = slot42
slot42 = {
	[204831.0] = "nop",
	shift = 0,
	mask = 4194303
}
slot41[1] = slot42
slot42 = {
	[6225920.0] = "retNx",
	[4128768.0] = "blrNx",
	mask = 16776223,
	[2031616.0] = "brNx",
	shift = 0
}
slot41[2] = slot42
slot40[6] = slot41
slot41 = {
	[0] = false,
	false,
	false,
	false,
	slot38,
	slot33,
	slot38,
	slot39,
	slot22,
	slot22,
	slot40,
	slot40,
	slot38,
	slot33,
	slot38,
	slot39,
	shift = 25,
	mask = 15
}
slot42 = {}
slot43 = {}
slot42.x = slot43
slot43 = {}
slot42.w = slot43
slot43 = {}
slot42.d = slot43
slot43 = {}
slot42.s = slot43
slot43 = 0
slot44 = 30
slot45 = 1

for slot46 = slot43, slot44, slot45 do
	slot47 = slot42.x
	slot48 = "x"
	slot49 = slot46
	slot48 = slot48 .. slot49
	slot47[slot46] = slot48
	slot47 = slot42.w
	slot48 = "w"
	slot49 = slot46
	slot48 = slot48 .. slot49
	slot47[slot46] = slot48
	slot47 = slot42.d
	slot48 = "d"
	slot49 = slot46
	slot48 = slot48 .. slot49
	slot47[slot46] = slot48
	slot47 = slot42.s
	slot48 = "s"
	slot49 = slot46
	slot48 = slot48 .. slot49
	slot47[slot46] = slot48
end

slot43 = slot42.x
slot44 = "sp"
slot43[31] = slot44
slot43 = slot42.w
slot44 = "wsp"
slot43[31] = slot44
slot43 = slot42.d
slot44 = "d31"
slot43[31] = slot44
slot43 = slot42.s
slot44 = "s31"
slot43[31] = slot44
slot43 = {
	[0] = "eq",
	"ne",
	"cs",
	"cc",
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
slot44 = {
	[0] = "lsl",
	"lsr",
	"asr"
}
slot45 = {
	[0] = "uxtb",
	"uxth",
	"uxtw",
	"uxtx",
	"sxtb",
	"sxth",
	"sxtw",
	"sxtx"
}

function slot46(slot0, slot1, slot2)
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
		slot7 = "%08x  %s  %-5s %s%s\n"
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
		slot7 = "%08x  %-5s %s%s\n"
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

function slot47(slot0)
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

function slot48(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot1
	slot5 = slot1
	slot6 = slot0
	slot7 = "%w-([xwds])"
	slot6 = slot6 .. slot7
	slot4 = slot4(slot5, slot6)
	slot3 = slot3[slot4]
	slot3 = slot3[slot2]

	return slot3
end

function slot49(slot0)
	slot1 = 0

	if slot0 < slot1 then
		slot1 = slot0
		slot2 = slot0

		return slot1(slot2)
	else
		slot1 = slot1
		slot2 = "%x"
		slot3 = slot0

		return slot1(slot2, slot3)
	end
end

slot50 = {
	1431655765,
	286331153,
	16843009,
	65537,
	1
}

function slot51(slot0)
	slot1 = slot0
	slot2 = slot1
	slot3 = slot0
	slot4 = 10
	slot2 = slot2(slot3, slot4)
	slot3 = 63
	slot1 = slot1(slot2, slot3)
	slot2 = slot0
	slot3 = slot1
	slot4 = slot0
	slot5 = 16
	slot3 = slot3(slot4, slot5)
	slot4 = 63
	slot2 = slot2(slot3, slot4)
	slot3 = slot0
	slot4 = slot0
	slot5 = 4194304
	slot3 = slot3(slot4, slot5)

	if slot3 == 0 then
		slot3 = 5
		slot4 = 56

		if slot1 >= slot4 then
			slot4 = 60

			if slot1 >= slot4 then
				slot3 = 1
			else
				slot3 = 2
			end
		else
			slot4 = 48

			if slot1 >= slot4 then
				slot3 = 3
			else
				slot4 = 32

				if slot1 >= slot4 then
					slot3 = 4
				end
			end
		end

		slot4 = slot2
		slot5 = 1
		slot6 = slot3
		slot4 = slot4(slot5, slot6)
		slot4 = slot4 - 1
		slot5 = slot0
		slot6 = slot1
		slot7 = slot4
		slot5 = slot5(slot6, slot7)
		slot6 = slot0
		slot7 = slot2
		slot8 = slot4
		slot6 = slot6(slot7, slot8)
		slot7 = slot3
		slot8 = slot1
		slot9 = -1
		slot10 = 31 - slot5
		slot8 = slot8(slot9, slot10)
		slot9 = slot6
		slot7 = slot7(slot8, slot9)

		if slot3 ~= 5 then
			slot8 = slot0
			slot9 = slot7
			slot10 = slot2
			slot11 = 1
			slot12 = slot4
			slot10 = slot10(slot11, slot12)
			slot10 = slot10 - 1
			slot8 = slot8(slot9, slot10)
			slot9 = slot1
			slot10 = slot7
			slot11 = 31 - slot4
			slot9 = slot9(slot10, slot11)
			slot7 = slot8 + slot9
		end

		slot8 = slot4
		slot8 = slot8[slot3]
		slot7 = slot7 * slot8
		slot8 = slot5
		slot9 = slot7
		slot8 = slot8(slot9)
		slot9 = slot1
		slot10 = slot0
		slot11 = 31
		slot9 = slot9(slot10, slot11)

		if slot9 ~= 0 then
			slot9 = slot8
			slot10 = slot6
			slot11 = slot7
			slot10 = slot10(slot11)
			slot9 = slot9 .. slot10

			return slot9
		else
			return slot8
		end
	else
		slot3 = -1
		slot4 = 0
		slot5 = 32

		if slot1 < slot5 then
			slot5 = slot1
			slot6 = -1
			slot7 = 31 - slot1
			slot5 = slot5(slot6, slot7)
			slot3 = slot5
		else
			slot5 = slot1
			slot6 = -1
			slot7 = 63 - slot1
			slot5 = slot5(slot6, slot7)
			slot4 = slot5
		end

		if slot2 ~= 0 then
			slot5 = slot3
			slot6 = slot3
			slot7 = slot2
			slot5 = slot5(slot6, slot7)
			slot6 = slot3
			slot7 = slot4
			slot8 = slot2
			slot6 = slot6(slot7, slot8)
			slot4 = slot6
			slot3 = slot5

			if slot2 == 32 then
				slot5 = 0
			else
				slot5 = slot0
				slot6 = slot7
				slot7 = slot3
				slot8 = slot4
				slot6 = slot6(slot7, slot8)
				slot7 = slot2
				slot8 = -1
				slot9 = 32 - slot2
				slot5 = slot5(slot6, slot7(slot8, slot9))
			end

			slot6 = slot7
			slot7 = slot3
			slot8 = slot5
			slot6 = slot6(slot7, slot8)
			slot7 = slot7
			slot8 = slot4
			slot9 = slot5
			slot7 = slot7(slot8, slot9)
			slot4 = slot7
			slot3 = slot6
			slot6 = 32

			if slot2 >= slot6 then
				slot6 = slot4
				slot4 = slot3
				slot3 = slot6
			end
		end

		if slot4 ~= 0 then
			slot5 = slot5
			slot6 = slot4
			slot5 = slot5(slot6)
			slot6 = slot6
			slot7 = slot3
			slot6 = slot6(slot7)
			slot5 = slot5 .. slot6

			return slot5
		else
			slot5 = slot5
			slot6 = slot3

			return slot5(slot6)
		end
	end
end

function slot52(slot0, slot1)
	if slot1 == "b" or slot1 == "bl" then
		slot2 = slot0
		slot3 = slot1
		slot4 = slot0
		slot5 = 6
		slot3 = slot3(slot4, slot5)
		slot4 = 4

		return slot2(slot3, slot4)
	elseif slot1 == "adr" or slot1 == "adrp" then
		slot2 = slot2
		slot3 = slot3
		slot4 = slot0
		slot5 = 29
		slot3 = slot3(slot4, slot5)
		slot4 = 3
		slot2 = slot2(slot3, slot4)
		slot3 = slot1
		slot4 = slot0
		slot5 = slot1
		slot6 = slot0
		slot7 = 8
		slot5 = slot5(slot6, slot7)
		slot6 = 13
		slot4 = slot4(slot5, slot6)
		slot5 = 2
		slot3 = slot3(slot4, slot5)
		slot4 = slot4
		slot5 = slot3
		slot6 = slot2

		return slot4(slot5, slot6)
	elseif slot1 == "tbz" or slot1 == "tbnz" then
		slot2 = slot1
		slot3 = slot0
		slot4 = slot1
		slot5 = slot0
		slot6 = 13
		slot4 = slot4(slot5, slot6)
		slot5 = 18
		slot3 = slot3(slot4, slot5)
		slot4 = 2

		return slot2(slot3, slot4)
	else
		slot2 = slot1
		slot3 = slot0
		slot4 = slot1
		slot5 = slot0
		slot6 = 8
		slot4 = slot4(slot5, slot6)
		slot5 = 13
		slot3 = slot3(slot4, slot5)
		slot4 = 2

		return slot2(slot3, slot4)
	end
end

function slot53(slot0)
	return ((slot0(slot0, 1048576) == 0 and 1) or -1) * (16 + slot0(slot2(slot0, 13), 15)) * 2^(slot1(slot2(slot3(slot4(slot0, 12), 5), 24), 128) - 131)
end

function slot54(slot0, slot1, slot2, slot3)
	if slot2 < slot3 or slot2 == 31 or slot2 == 63 then
		slot4 = false

		return slot4
	end

	if slot3 == 0 then
		if slot0 == 0 and (slot2 == 7 or slot2 == 15) then
			slot4 = false

			return slot4
		end

		if slot0 ~= 0 and slot1 == 0 and (slot2 == 7 or slot2 == 15 or slot2 == 31) then
			slot4 = false

			return slot4
		end
	end

	slot4 = true

	return slot4
end

function slot55(slot0)
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
	slot9 = nil
	slot13 = nil
	slot14 = slot3
	slot15 = slot4
	slot16 = slot5
	slot17 = slot6
	slot18 = 25
	slot16 = slot16(slot17, slot18)
	slot17 = 15
	slot15 = slot15(slot16, slot17)
	slot13 = slot14[slot15]
	slot14 = slot6
	slot15 = slot13
	slot14 = slot14(slot15)

	while slot14 ~= "string" do
		if not slot13 then
			slot14 = slot7
			slot15 = slot0

			return slot14(slot15)
		end

		slot13 = slot13[slot4(slot5(slot6, slot13.shift), slot13.mask)] or slot13._
	end

	slot14 = slot8
	slot15 = slot13
	slot16 = "^([a-z0-9]*)(.*)"
	slot14, slot15 = slot14(slot15, slot16)
	slot11 = slot15
	slot10 = slot14
	slot14 = slot8
	slot15 = slot11
	slot16 = "|([a-z0-9_.|]*)(.*)"
	slot14, slot15 = slot14(slot15, slot16)

	if slot14 then
		slot11 = slot15
	end

	slot16 = slot9
	slot17 = slot11
	slot18 = 1
	slot19 = 1
	slot16 = slot16(slot17, slot18, slot19)

	if slot16 == "." then
		slot16 = slot8
		slot17 = slot11
		slot18 = "^([a-z0-9.]*)(.*)"
		slot16, slot17 = slot16(slot17, slot18)
		slot18 = slot8
		slot19 = slot16
		slot8 = slot18 .. slot19
		slot11 = slot17
	end

	slot16 = slot8
	slot17 = slot11
	slot18 = "[gf]"
	slot16 = slot16(slot17, slot18)

	if slot16 then
		if slot16 == "g" then
			slot17 = slot4
			slot18 = slot6
			slot19 = 2147483648.0
			slot17 = slot17(slot18, slot19)

			if slot17 ~= 0 then
				slot17 = slot10
				slot17 = slot17.x

				if not slot17 then
					slot17 = slot10
					slot12 = slot17.w
				end
			end
		else
			slot17 = slot4
			slot18 = slot6
			slot19 = 4194304
			slot17 = slot17(slot18, slot19)

			if slot17 ~= 0 then
				slot17 = slot10
				slot17 = slot17.d

				if not slot17 then
					slot17 = slot10
					slot12 = slot17.s
				end
			end
		end
	end

	slot17, slot18 = nil
	slot19 = slot11
	slot20 = slot11
	slot21 = "."
	slot19, slot20, slot21 = slot19(slot20, slot21)

	for slot22 in slot19, slot20, slot21 do
		slot23 = nil

		if slot22 == "D" then
			slot24 = slot4
			slot25 = slot6
			slot26 = 31
			slot24 = slot24(slot25, slot26)

			if slot16 then
				slot25 = slot12[slot24]

				if not slot25 then
					slot25 = slot12
					slot26 = slot22
					slot27 = slot11
					slot28 = slot24
					slot25 = slot25(slot26, slot27, slot28)
					slot23 = slot25
				end
			end
		elseif slot22 == "N" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 5
			slot25 = slot25(slot26, slot27)
			slot26 = 31
			slot24 = slot24(slot25, slot26)

			if slot16 then
				slot25 = slot12[slot24]

				if not slot25 then
					slot25 = slot12
					slot26 = slot22
					slot27 = slot11
					slot28 = slot24
					slot25 = slot25(slot26, slot27, slot28)
					slot23 = slot25
				end
			end
		elseif slot22 == "M" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 16
			slot25 = slot25(slot26, slot27)
			slot26 = 31
			slot24 = slot24(slot25, slot26)

			if slot16 then
				slot25 = slot12[slot24]

				if not slot25 then
					slot25 = slot12
					slot26 = slot22
					slot27 = slot11
					slot28 = slot24
					slot25 = slot25(slot26, slot27, slot28)
					slot23 = slot25
				end
			end
		elseif slot22 == "A" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 10
			slot25 = slot25(slot26, slot27)
			slot26 = 31
			slot24 = slot24(slot25, slot26)

			if slot16 then
				slot25 = slot12[slot24]

				if not slot25 then
					slot25 = slot12
					slot26 = slot22
					slot27 = slot11
					slot28 = slot24
					slot25 = slot25(slot26, slot27, slot28)
					slot23 = slot25
				end
			end
		elseif slot22 == "B" then
			slot24 = slot0.addr
			slot24 = slot24 + slot1
			slot25 = slot13
			slot26 = slot6
			slot27 = slot10
			slot25 = slot25(slot26, slot27)
			slot24 = slot24 + slot25
			slot0.rel = slot24
			slot25 = "0x"
			slot26 = slot14
			slot27 = slot24
			slot26 = slot26(slot27)
			slot23 = slot25 .. slot26
		elseif slot22 == "T" then
			slot24 = slot1
			slot25 = slot4
			slot26 = slot5
			slot27 = slot6
			slot28 = 26
			slot26 = slot26(slot27, slot28)
			slot27 = 32
			slot25 = slot25(slot26, slot27)
			slot26 = slot4
			slot27 = slot5
			slot28 = slot6
			slot29 = 19
			slot27 = slot27(slot28, slot29)
			slot28 = 31
			slot24 = slot24(slot25, slot26(slot27, slot28))
			slot23 = slot24
		elseif slot22 == "V" then
			slot24 = slot4
			slot25 = slot6
			slot26 = 15
			slot24 = slot24(slot25, slot26)
			slot23 = slot24
		elseif slot22 == "C" then
			slot24 = slot15
			slot25 = slot4
			slot26 = slot5
			slot27 = slot6
			slot28 = 12
			slot26 = slot26(slot27, slot28)
			slot27 = 15
			slot25 = slot25(slot26, slot27)
			slot23 = slot24[slot25]
		elseif slot22 == "c" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 5
			slot25 = slot25(slot26, slot27)
			slot26 = 31
			slot24 = slot24(slot25, slot26)
			slot25 = slot4
			slot26 = slot5
			slot27 = slot6
			slot28 = 16
			slot26 = slot26(slot27, slot28)
			slot27 = 31
			slot25 = slot25(slot26, slot27)
			slot26 = slot4
			slot27 = slot5
			slot28 = slot6
			slot29 = 12
			slot27 = slot27(slot28, slot29)
			slot28 = 15
			slot26 = slot26(slot27, slot28)
			slot27 = slot16
			slot28 = slot26
			slot29 = 1
			slot27 = slot27(slot28, slot29)
			slot28 = slot15
			slot23 = slot28[slot26]

			if slot14 and slot26 ~= 14 and slot26 ~= 15 then
				slot28 = slot8
				slot29 = slot14
				slot30 = "([^|]*)|(.*)"
				slot28, slot29 = slot28(slot29, slot30)

				if slot24 == slot25 then
					slot30 = #slot7
					slot31 = nil
					slot7[slot30] = slot31
					slot31 = slot15
					slot23 = slot31[slot27]

					if slot24 ~= 31 then
						if slot28 then
							slot10 = slot28
						else
							slot10 = slot14
						end
					else
						slot31 = slot30 - 1
						slot32 = nil
						slot7[slot31] = slot32
						slot10 = slot29
					end
				end
			end
		elseif slot22 == "W" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 5
			slot25 = slot25(slot26, slot27)
			slot26 = 65535
			slot24 = slot24(slot25, slot26)
			slot23 = slot24
		elseif slot22 == "Y" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 5
			slot25 = slot25(slot26, slot27)
			slot26 = 65535
			slot24 = slot24(slot25, slot26)
			slot23 = slot24
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 21
			slot25 = slot25(slot26, slot27)
			slot26 = 3
			slot24 = slot24(slot25, slot26)

			if slot14 and (slot24 == 0 or slot23 ~= 0) then
				slot10 = slot14
			end
		elseif slot22 == "L" then
			slot24 = slot10
			slot24 = slot24.x
			slot25 = slot4
			slot26 = slot5
			slot27 = slot6
			slot28 = 5
			slot26 = slot26(slot27, slot28)
			slot27 = 31
			slot25 = slot25(slot26, slot27)
			slot24 = slot24[slot25]
			slot25 = slot17
			slot26 = slot2
			slot27 = slot6
			slot28 = 11
			slot26 = slot26(slot27, slot28)
			slot27 = 23
			slot25 = slot25(slot26, slot27)
			slot26 = slot4
			slot27 = slot6
			slot28 = 2048
			slot26 = slot26(slot27, slot28)

			if slot26 ~= 0 then
				slot26 = "["
				slot27 = slot24
				slot28 = ", #"
				slot29 = slot25
				slot30 = "]!"
				slot23 = slot26 .. slot27 .. slot28 .. slot29 .. slot30
			else
				slot26 = "["
				slot27 = slot24
				slot28 = "], #"
				slot29 = slot25
				slot23 = slot26 .. slot27 .. slot28 .. slot29
			end
		elseif slot22 == "U" then
			slot24 = slot10
			slot24 = slot24.x
			slot25 = slot4
			slot26 = slot5
			slot27 = slot6
			slot28 = 5
			slot26 = slot26(slot27, slot28)
			slot27 = 31
			slot25 = slot25(slot26, slot27)
			slot24 = slot24[slot25]
			slot25 = slot4
			slot26 = slot5
			slot27 = slot6
			slot28 = 30
			slot26 = slot26(slot27, slot28)
			slot27 = 3
			slot25 = slot25(slot26, slot27)
			slot26 = slot2
			slot27 = slot17
			slot28 = slot2
			slot29 = slot6
			slot30 = 10
			slot28 = slot28(slot29, slot30)
			slot29 = 20
			slot27 = slot27(slot28, slot29)
			slot28 = slot25
			slot26 = slot26(slot27, slot28)

			if slot26 ~= 0 then
				slot27 = "["
				slot28 = slot24
				slot29 = ", #"
				slot30 = slot26
				slot31 = "]"
				slot23 = slot27 .. slot28 .. slot29 .. slot30 .. slot31
			else
				slot27 = "["
				slot28 = slot24
				slot29 = "]"
				slot23 = slot27 .. slot28 .. slot29
			end
		elseif slot22 == "K" then
			slot24 = slot10
			slot24 = slot24.x
			slot25 = slot4
			slot26 = slot5
			slot27 = slot6
			slot28 = 5
			slot26 = slot26(slot27, slot28)
			slot27 = 31
			slot25 = slot25(slot26, slot27)
			slot24 = slot24[slot25]
			slot25 = slot17
			slot26 = slot2
			slot27 = slot6
			slot28 = 11
			slot26 = slot26(slot27, slot28)
			slot27 = 23
			slot25 = slot25(slot26, slot27)

			if slot25 ~= 0 then
				slot26 = "["
				slot27 = slot24
				slot28 = ", #"
				slot29 = slot25
				slot30 = "]"
				slot23 = slot26 .. slot27 .. slot28 .. slot29 .. slot30
			else
				slot26 = "["
				slot27 = slot24
				slot28 = "]"
				slot23 = slot26 .. slot27 .. slot28
			end
		elseif slot22 == "O" then
			slot24 = slot10
			slot24 = slot24.x
			slot25 = slot4
			slot26 = slot5
			slot27 = slot6
			slot28 = 5
			slot26 = slot26(slot27, slot28)
			slot27 = 31
			slot25 = slot25(slot26, slot27)
			slot24 = slot24[slot25]
			slot25 = nil
			slot26 = slot4
			slot27 = slot5
			slot28 = slot6
			slot29 = 13
			slot27 = slot27(slot28, slot29)
			slot28 = 1
			slot26 = slot26(slot27, slot28)

			if slot26 == 0 then
				slot27 = slot10
				slot27 = slot27.w
				slot28 = slot4
				slot29 = slot5
				slot30 = slot6
				slot31 = 16
				slot29 = slot29(slot30, slot31)
				slot30 = 31
				slot28 = slot28(slot29, slot30)
				slot25 = slot27[slot28]
			else
				slot27 = slot10
				slot27 = slot27.x
				slot28 = slot4
				slot29 = slot5
				slot30 = slot6
				slot31 = 16
				slot29 = slot29(slot30, slot31)
				slot30 = 31
				slot28 = slot28(slot29, slot30)
				slot25 = slot27[slot28]
			end

			slot27 = "["
			slot28 = slot24
			slot29 = ", "
			slot30 = slot25
			slot23 = slot27 .. slot28 .. slot29 .. slot30
			slot27 = slot4
			slot28 = slot5
			slot29 = slot6
			slot30 = 13
			slot28 = slot28(slot29, slot30)
			slot29 = 7
			slot27 = slot27(slot28, slot29)
			slot28 = slot4
			slot29 = slot5
			slot30 = slot6
			slot31 = 12
			slot29 = slot29(slot30, slot31)
			slot30 = 1
			slot28 = slot28(slot29, slot30)
			slot29 = slot4
			slot30 = slot5
			slot31 = slot6
			slot32 = 30
			slot30 = slot30(slot31, slot32)
			slot31 = 3
			slot29 = slot29(slot30, slot31)

			if slot27 == 3 then
				if slot28 == 0 then
					slot30 = slot23
					slot31 = "]"
					slot23 = slot30 .. slot31
				else
					slot30 = slot23
					slot31 = ", lsl #"
					slot32 = slot29
					slot33 = "]"
					slot23 = slot30 .. slot31 .. slot32 .. slot33
				end
			elseif slot27 == 2 or slot27 == 6 or slot27 == 7 then
				if slot28 == 0 then
					slot30 = slot23
					slot31 = ", "
					slot32 = slot18
					slot32 = slot32[slot27]
					slot33 = "]"
					slot23 = slot30 .. slot31 .. slot32 .. slot33
				else
					slot30 = slot23
					slot31 = ", "
					slot32 = slot18
					slot32 = slot32[slot27]
					slot33 = " #"
					slot34 = slot29
					slot35 = "]"
					slot23 = slot30 .. slot31 .. slot32 .. slot33 .. slot34 .. slot35
				end
			else
				slot30 = slot23
				slot31 = "]"
				slot23 = slot30 .. slot31
			end
		elseif slot22 == "P" then
			slot24 = slot5
			slot25 = slot6
			slot26 = 26
			slot24 = slot24(slot25, slot26)
			slot25 = 2
			slot26 = 42

			if slot24 >= slot26 then
				slot25 = 4
			else
				slot26 = 27

				if slot24 >= slot26 then
					slot25 = 3
				end
			end

			slot26 = slot2
			slot27 = slot17
			slot28 = slot2
			slot29 = slot6
			slot30 = 10
			slot28 = slot28(slot29, slot30)
			slot29 = 25
			slot27 = slot27(slot28, slot29)
			slot28 = slot25
			slot26 = slot26(slot27, slot28)
			slot27 = slot10
			slot27 = slot27.x
			slot28 = slot4
			slot29 = slot5
			slot30 = slot6
			slot31 = 5
			slot29 = slot29(slot30, slot31)
			slot30 = 31
			slot28 = slot28(slot29, slot30)
			slot27 = slot27[slot28]
			slot28 = slot4
			slot29 = slot5
			slot30 = slot6
			slot31 = 23
			slot29 = slot29(slot30, slot31)
			slot30 = 3
			slot28 = slot28(slot29, slot30)

			if slot28 == 1 then
				slot29 = "["
				slot30 = slot27
				slot31 = "], #"
				slot32 = slot26
				slot23 = slot29 .. slot30 .. slot31 .. slot32
			elseif slot28 == 2 then
				if slot26 == 0 then
					slot29 = "["
					slot30 = slot27
					slot31 = "]"
					slot23 = slot29 .. slot30 .. slot31
				else
					slot29 = "["
					slot30 = slot27
					slot31 = ", #"
					slot32 = slot26
					slot33 = "]"
					slot23 = slot29 .. slot30 .. slot31 .. slot32 .. slot33
				end
			elseif slot28 == 3 then
				slot29 = "["
				slot30 = slot27
				slot31 = ", #"
				slot32 = slot26
				slot33 = "]!"
				slot23 = slot29 .. slot30 .. slot31 .. slot32 .. slot33
			end
		elseif slot22 == "I" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 22
			slot25 = slot25(slot26, slot27)
			slot26 = 3
			slot24 = slot24(slot25, slot26)
			slot25 = slot4
			slot26 = slot5
			slot27 = slot6
			slot28 = 10
			slot26 = slot26(slot27, slot28)
			slot27 = 4095
			slot25 = slot25(slot26, slot27)
			slot26 = slot4
			slot27 = slot5
			slot28 = slot6
			slot29 = 5
			slot27 = slot27(slot28, slot29)
			slot28 = 31
			slot26 = slot26(slot27, slot28)
			slot27 = slot4
			slot28 = slot6
			slot29 = 31
			slot27 = slot27(slot28, slot29)

			if slot14 == "mov" and slot24 == 0 and slot25 == 0 and (slot26 == 31 or slot27 == 31) then
				slot10 = slot14
				slot23 = nil
			elseif slot24 == 0 then
				slot23 = slot25
			elseif slot24 == 1 then
				slot28 = slot25
				slot29 = ", lsl #12"
				slot23 = slot28 .. slot29
			end
		elseif slot22 == "i" then
			slot24 = "#0x"
			slot25 = slot19
			slot26 = slot6
			slot25 = slot25(slot26)
			slot23 = slot24 .. slot25
		elseif slot22 == "1" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 16
			slot25 = slot25(slot26, slot27)
			slot26 = 63
			slot24 = slot24(slot25, slot26)
			slot18 = slot24
			slot23 = slot18
		elseif slot22 == "2" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 10
			slot25 = slot25(slot26, slot27)
			slot26 = 63
			slot24 = slot24(slot25, slot26)
			slot23 = slot24

			if slot14 then
				slot24 = slot8
				slot25 = slot14
				slot26 = "([^|]*)|([^|]*)|([^|]*)|([^|]*)|([^|]*)|(.*)"
				slot24, slot25, slot26, slot27, slot28, slot29 = slot24(slot25, slot26)
				slot30 = slot4
				slot31 = slot5
				slot32 = slot6
				slot33 = 26
				slot31 = slot31(slot32, slot33)
				slot32 = 32
				slot30 = slot30(slot31, slot32)
				slot31 = slot4
				slot32 = slot5
				slot33 = slot6
				slot34 = 30
				slot32 = slot32(slot33, slot34)
				slot33 = 1
				slot31 = slot31(slot32, slot33)
				slot32 = slot20
				slot33 = slot30
				slot34 = slot31
				slot35 = slot23
				slot36 = slot18
				slot32 = slot32(slot33, slot34, slot35, slot36)

				if slot32 then
					slot10 = slot25
					slot32 = slot23 - slot18
					slot23 = slot32 + 1
				elseif slot18 == 0 and slot23 == 7 then
					slot32 = #slot7
					slot33 = nil
					slot7[slot32] = slot33

					if slot30 ~= 0 then
						slot33 = slot32 - 1
						slot34 = slot21
						slot35 = slot32 - 1
						slot35 = slot7[slot35]
						slot36 = "x"
						slot37 = "w"
						slot34 = slot34(slot35, slot36, slot37)
						slot7[slot33] = slot34
					end

					slot33 = slot32 - 1
					slot9 = slot7[slot33]
					slot10 = slot29
					slot23 = nil
				elseif slot18 == 0 and slot23 == 15 then
					slot32 = #slot7
					slot33 = nil
					slot7[slot32] = slot33

					if slot30 ~= 0 then
						slot33 = slot32 - 1
						slot34 = slot21
						slot35 = slot32 - 1
						slot35 = slot7[slot35]
						slot36 = "x"
						slot37 = "w"
						slot34 = slot34(slot35, slot36, slot37)
						slot7[slot33] = slot34
					end

					slot33 = slot32 - 1
					slot9 = slot7[slot33]
					slot10 = slot28
					slot23 = nil
				elseif slot23 == 31 or slot23 == 63 then
					if slot23 == 31 and slot18 == 0 and slot10 == "sbfm" then
						slot10 = slot27
						slot32 = #slot7
						slot33 = nil
						slot7[slot32] = slot33

						if slot30 ~= 0 then
							slot33 = slot32 - 1
							slot34 = slot21
							slot35 = slot32 - 1
							slot35 = slot7[slot35]
							slot36 = "x"
							slot37 = "w"
							slot34 = slot34(slot35, slot36, slot37)
							slot7[slot33] = slot34
						end

						slot33 = slot32 - 1
						slot9 = slot7[slot33]
					else
						slot10 = slot26
					end

					slot23 = nil
				else
					slot32 = slot4
					slot33 = slot23
					slot34 = 31
					slot32 = slot32(slot33, slot34)

					if slot32 ~= 31 then
						slot32 = slot23 + 1

						if slot18 == slot32 and slot10 == "ubfm" then
							slot10 = slot27
							slot32 = "#"
							slot33 = slot30 + 32
							slot33 = slot33 - slot18
							slot9 = slot32 .. slot33
							slot32 = #slot7
							slot7[slot32] = slot9
							slot23 = nil
						end
					elseif slot23 < slot18 then
						slot10 = slot24
						slot32 = "#"
						slot33 = slot30 + 32
						slot33 = slot33 - slot18
						slot9 = slot32 .. slot33
						slot32 = #slot7
						slot7[slot32] = slot9
						slot23 = slot23 + 1
					end
				end
			end
		elseif slot22 == "3" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 10
			slot25 = slot25(slot26, slot27)
			slot26 = 63
			slot24 = slot24(slot25, slot26)
			slot23 = slot24

			if slot14 then
				slot24 = slot8
				slot25 = slot14
				slot26 = "([^|]*)|(.*)"
				slot24, slot25 = slot24(slot25, slot26)

				if slot23 < slot18 then
					slot10 = slot24
					slot26 = slot4
					slot27 = slot5
					slot28 = slot6
					slot29 = 26
					slot27 = slot27(slot28, slot29)
					slot28 = 32
					slot26 = slot26(slot27, slot28)
					slot27 = "#"
					slot28 = slot26 + 32
					slot28 = slot28 - slot18
					slot9 = slot27 .. slot28
					slot27 = #slot7
					slot7[slot27] = slot9
					slot23 = slot23 + 1
				elseif slot18 <= slot23 then
					slot10 = slot25
					slot26 = slot23 - slot18
					slot23 = slot26 + 1
				end
			end
		elseif slot22 == "4" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 10
			slot25 = slot25(slot26, slot27)
			slot26 = 63
			slot24 = slot24(slot25, slot26)
			slot23 = slot24
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 5
			slot25 = slot25(slot26, slot27)
			slot26 = 31
			slot24 = slot24(slot25, slot26)
			slot25 = slot4
			slot26 = slot5
			slot27 = slot6
			slot28 = 16
			slot26 = slot26(slot27, slot28)
			slot27 = 31
			slot25 = slot25(slot26, slot27)

			if slot14 and slot24 == slot25 then
				slot26 = #slot7
				slot27 = nil
				slot7[slot26] = slot27
				slot27 = slot26 - 1
				slot9 = slot7[slot27]
				slot10 = slot14
			end
		elseif slot22 == "5" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 16
			slot25 = slot25(slot26, slot27)
			slot26 = 31
			slot24 = slot24(slot25, slot26)
			slot23 = slot24
		elseif slot22 == "S" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 10
			slot25 = slot25(slot26, slot27)
			slot26 = 63
			slot24 = slot24(slot25, slot26)
			slot23 = slot24

			if slot23 == 0 then
				slot23 = nil
			else
				slot24 = slot22
				slot25 = slot4
				slot26 = slot5
				slot27 = slot6
				slot28 = 22
				slot26 = slot26(slot27, slot28)
				slot27 = 3
				slot25 = slot25(slot26, slot27)
				slot24 = slot24[slot25]
				slot25 = " #"
				slot26 = slot23
				slot23 = slot24 .. slot25 .. slot26
			end
		elseif slot22 == "X" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 13
			slot25 = slot25(slot26, slot27)
			slot26 = 7
			slot24 = slot24(slot25, slot26)

			if slot24 ~= 3 and slot24 ~= 7 then
				slot25 = slot10
				slot25 = slot25.w
				slot26 = slot4
				slot27 = slot5
				slot28 = slot6
				slot29 = 16
				slot27 = slot27(slot28, slot29)
				slot28 = 31
				slot26 = slot26(slot27, slot28)
				slot9 = slot25[slot26]
				slot25 = #slot7
				slot7[slot25] = slot9
			end

			slot25 = slot4
			slot26 = slot5
			slot27 = slot6
			slot28 = 10
			slot26 = slot26(slot27, slot28)
			slot27 = 7
			slot25 = slot25(slot26, slot27)
			slot23 = slot25
			slot25 = slot4
			slot26 = slot5
			slot27 = slot6
			slot28 = 31
			slot26 = slot26(slot27, slot28)
			slot27 = 1
			slot25 = slot25(slot26, slot27)
			slot25 = 2 + slot25

			if slot24 == slot25 then
				slot25 = slot4(slot5(slot6, (slot17 and 5) or 0), 31)

				if slot25 == 31 and slot23 == 0 then
					slot23 = nil
				else
					slot25 = "lsl #"
					slot26 = slot23
					slot23 = slot25 .. slot26
				end
			elseif slot23 == 0 then
				slot25 = slot18
				slot26 = slot4
				slot27 = slot5
				slot28 = slot6
				slot29 = 13
				slot27 = slot27(slot28, slot29)
				slot28 = 7
				slot26 = slot26(slot27, slot28)
				slot23 = slot25[slot26]
			else
				slot25 = slot18
				slot26 = slot4
				slot27 = slot5
				slot28 = slot6
				slot29 = 13
				slot27 = slot27(slot28, slot29)
				slot28 = 7
				slot26 = slot26(slot27, slot28)
				slot25 = slot25[slot26]
				slot26 = " #"
				slot27 = slot23
				slot23 = slot25 .. slot26 .. slot27
			end
		elseif slot22 == "R" then
			slot24 = slot4
			slot25 = slot5
			slot26 = slot6
			slot27 = 21
			slot25 = slot25(slot26, slot27)
			slot26 = 3
			slot24 = slot24(slot25, slot26)
			slot23 = slot24

			if slot23 == 0 then
				slot23 = nil
			else
				slot24 = "lsl #"
				slot25 = slot23 * 16
				slot23 = slot24 .. slot25
			end
		elseif slot22 == "z" then
			slot24 = #slot7
			slot25 = slot7[slot24]

			if slot25 == "sp" then
				slot25 = "xzr"
				slot7[slot24] = slot25
			else
				slot25 = slot7[slot24]

				if slot25 == "wsp" then
					slot25 = "wzr"
					slot7[slot24] = slot25
				end
			end
		elseif slot22 == "Z" then
			slot23 = 0
		elseif slot22 == "F" then
			slot24 = slot23
			slot25 = slot6
			slot24 = slot24(slot25)
			slot23 = slot24
		elseif slot22 ~= "g" and slot22 ~= "f" and slot22 ~= "x" and slot22 ~= "w" and slot22 ~= "d" then
			if slot22 == "s" then
			elseif slot22 == "0" then
				if slot9 == "sp" or slot9 == "wsp" then
					slot24 = #slot7
					slot25 = nil
					slot7[slot24] = slot25
					slot25 = slot24 - 1
					slot9 = slot7[slot25]

					if slot14 then
						slot25 = slot8
						slot26 = slot14
						slot27 = "([^|]*)|(.*)"
						slot25, slot26 = slot25(slot26, slot27)

						if not slot25 then
							slot10 = slot14
						elseif slot17 then
							slot27 = slot26
							slot14 = slot25
							slot10 = slot27
						else
							slot27 = slot25
							slot14 = slot26
							slot10 = slot27
						end
					end
				end

				slot17 = true
			end
		end

		if slot23 then
			slot9 = slot23
			slot24 = slot6
			slot25 = slot23
			slot24 = slot24(slot25)

			if slot24 == "number" then
				slot24 = "#"
				slot25 = slot23
				slot23 = slot24 .. slot25
			end

			slot24 = #slot7
			slot24 = slot24 + 1
			slot7[slot24] = slot23
		end
	end

	slot19 = slot24
	slot20 = slot0
	slot21 = slot10
	slot22 = slot8
	slot21 = slot21 .. slot22
	slot22 = slot7

	return slot19(slot20, slot21, slot22)
end

function slot56(slot0, slot1, slot2)
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

function slot57(slot0, slot1, slot2)
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

function slot58(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot6 = slot2
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = slot3
	slot3 = slot3.disass

	slot3(slot4)
end

function slot59(slot0)
	slot1 = 32

	if slot0 < slot1 then
		slot1 = slot0
		slot1 = slot1.x
		slot1 = slot1[slot0]

		return slot1
	end

	slot1 = slot0
	slot1 = slot1.d
	slot2 = slot0 - 32
	slot1 = slot1[slot2]

	return slot1
end

slot60 = {
	create = slot57,
	disass = slot58,
	regname = slot59
}

return slot60
