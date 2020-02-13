slot0 = type
slot1 = string
slot1 = slot1.byte
slot2 = string
slot2 = slot2.format
slot3 = string
slot3 = slot3.match
slot4 = string
slot4 = slot4.gmatch
slot5 = string
slot5 = slot5.gsub
slot6 = table
slot6 = slot6.concat
slot7 = require
slot8 = "bit"
slot7 = slot7(slot8)
slot8 = slot7.band
slot9 = slot7.bor
slot10 = slot7.tohex
slot11 = slot7.lshift
slot12 = slot7.rshift
slot13 = slot7.arshift
slot14 = {
	[0] = "mcrfXX",
	[289.0] = "creqv|crsetCCC%",
	[257.0] = "crandCCC",
	[225.0] = "crnandCCC",
	mask = 1023,
	[150.0] = "isync",
	[129.0] = "crandcCCC",
	[16.0] = "b_lrKB",
	[33.0] = "crnor|crnotCCC=",
	[528.0] = "b_ctrKB",
	[417.0] = "crorcCCC",
	[449.0] = "cror|crmoveCCC=",
	[193.0] = "crxor|crclrCCC%",
	shift = 1
}
slot15 = setmetatable
slot16 = {
	shift = 0,
	mask = -1
}
slot17 = {}

function slot18(slot0, slot1)
	slot2 = slot0
	slot3 = slot1
	slot4 = slot1
	slot5 = 11
	slot3 = slot3(slot4, slot5)
	slot4 = 31
	slot2 = slot2(slot3, slot4)
	slot3 = slot0
	slot4 = slot1
	slot5 = slot1
	slot6 = 6
	slot4 = slot4(slot5, slot6)
	slot5 = 31
	slot3 = slot3(slot4, slot5)
	slot4 = slot0
	slot5 = slot1
	slot6 = slot1
	slot7 = 1
	slot5 = slot5(slot6, slot7)
	slot6 = 31
	slot4 = slot4(slot5, slot6)

	if slot3 == 0 then
		slot5 = 31 - slot2

		if slot4 == slot5 then
			slot5 = "slwiRR~A."

			return slot5
		end
	elseif slot4 == 31 then
		slot5 = 32 - slot2

		if slot3 == slot5 then
			slot5 = "srwiRR~-A."

			return slot5
		end
	else
		slot5 = "rlwinmRR~AAA."

		return slot5
	end
end

slot17.__index = slot18
slot15 = slot15(slot16, slot17)
slot16 = {
	[0] = "rldiclRR~HM.",
	"rldicrRR~HM.",
	"rldicRR~HM.",
	"rldimiRR~HM.",
	shift = 2,
	mask = 7
}
slot17 = {
	[0] = "rldclRR~RM.",
	"rldcrRR~RM.",
	shift = 1,
	mask = 1
}
slot16[4] = slot17
slot17 = setmetatable
slot18 = {
	[0] = "cmp_YLRR",
	nil,
	nil,
	nil,
	"twARR",
	nil,
	nil,
	nil,
	"subfcRRR.",
	"mulhduRRR.",
	"addcRRR.",
	"mulhwuRRR.",
	nil,
	nil,
	nil,
	"iselltRRR",
	nil,
	nil,
	nil,
	nil,
	"lwarxRR0R",
	"ldxRR0R",
	nil,
	"lwzxRR0R",
	"slwRR~R.",
	nil,
	"cntlzwRR~",
	"sldRR~R.",
	"andRR~R.",
	nil,
	nil,
	nil,
	"cmpl_YLRR",
	[232.0] = "subfmeRR.",
	[824.0] = "srawiRR~A.",
	[233.0] = "mulldRRR.",
	[149.0] = "stdxRR0R",
	[181.0] = "stduxRRR",
	[552.0] = "subfoRRR.",
	[86.0] = "dcbf-R0R",
	[235.0] = "mullwRRR.",
	[119.0] = "lbzuxRRR",
	[341.0] = "lwaxRR0R",
	[87.0] = "lbzxRR0R",
	[343.0] = "lhaxRR0R",
	mask = 1023,
	[747.0] = "mullwoRRR.",
	[84.0] = "ldarxRR0R",
	[745.0] = "mulldoRRR.",
	[136.0] = "subfeRRR.",
	[854.0] = "eieio",
	[215.0] = "stbxRR0R",
	[457.0] = "divduRRR.",
	[616.0] = "negoRR.",
	[459.0] = "divwuRRR.",
	[200.0] = "subfzeRR.",
	[438.0] = "ecowxRR0R",
	[75.0] = "mulhwRRR.",
	[470.0] = "dcbi-RR",
	[758.0] = "dcba-RR",
	[631.0] = "lfduxFRR",
	[154.0] = "prtywRR~",
	[58.0] = "cntlzdRR~",
	[53.0] = "lduxRRR",
	[60.0] = "andcRR~R.",
	[73.0] = "mulhdRRR.",
	[124.0] = "nor|notRR~R=.",
	[104.0] = "negRR.",
	[284.0] = "eqvRR~R.",
	[316.0] = "xorRR~R.",
	[650.0] = "addeoRRR.",
	[54.0] = "dcbst-R0R",
	[412.0] = "orcRR~R.",
	[79.0] = "iseleqRRR",
	[439.0] = "sthuxRRR",
	[310.0] = "eciwxRR0R",
	[311.0] = "lhzuxRRR",
	[660.0] = "stdbrxRR0R",
	[476.0] = "nandRR~R.",
	[55.0] = "lwzuxRRR",
	[532.0] = "ldbrxRR0R",
	[444.0] = "or|mrRR~R=.",
	[918.0] = "sthbrxRR0R",
	[214.0] = "stdcxRR0R.",
	[597.0] = "lswiRR0A",
	[150.0] = "stwcxRR0R.",
	[661.0] = "stswxRR0R",
	[151.0] = "stwxRR0R",
	[662.0] = "stwbrxRR0R",
	[790.0] = "lhbrxRR0R",
	[533.0] = "lswxRR0R",
	[535.0] = "lfsxFR0R",
	[695.0] = "stfsuxFRR",
	[279.0] = "lhzxRR0R",
	[278.0] = "dcbt-R0R",
	[648.0] = "subfeoRRR.",
	[663.0] = "stfsxFR0R",
	[599.0] = "lfdxFR0R",
	[202.0] = "addzeRR.",
	[727.0] = "stfdxFR0R",
	[759.0] = "stfduxFR0R",
	[567.0] = "lfsuxFRR",
	[969.0] = "divduoRRR.",
	[971.0] = "divwouRRR.",
	[712.0] = "subfzeoRR.",
	[714.0] = "addzeoRR.",
	[725.0] = "stswiRR0A",
	[407.0] = "sthxRR0R",
	[68.0] = "tdARR",
	[855.0] = "lfiwaxFR0R",
	[983.0] = "stfiwxFR0R",
	[986.0] = "extswRR~.",
	[792.0] = "srawRR~R.",
	[982.0] = "icbi-R0R",
	[183.0] = "stwuxRRR",
	[539.0] = "srdRR~R.",
	[138.0] = "addeRRR.",
	[534.0] = "lwbrxRR0R",
	[1001.0] = "divdoRRR.",
	[1003.0] = "divwoRRR.",
	[744.0] = "subfmeoRR.",
	[746.0] = "addmeoRR.",
	[266.0] = "addRRR.",
	[522.0] = "addcoRRR.",
	[520.0] = "subfcoRRR.",
	[827.0] = "sradiRR~H.",
	[122.0] = "popcntbRR~",
	[512.0] = "mcrxrX",
	[186.0] = "prtydRR~",
	[1014.0] = "dcbz-R0R",
	[508.0] = "cmpbRR~R",
	[922.0] = "extshRR~.",
	[954.0] = "extsbRR~.",
	[536.0] = "srwRR~R.",
	[826.0] = "sradiRR~H.",
	[778.0] = "addoRRR.",
	[375.0] = "lhauxRRR",
	[47.0] = "iselgtRRR",
	[373.0] = "lwauxRRR",
	[794.0] = "sradRR~R.",
	[40.0] = "subfRRR.",
	[247.0] = "stbuxRRR",
	[491.0] = "divwRRR.",
	[246.0] = "dcbtst-R0R",
	[489.0] = "divdRRR.",
	[234.0] = "addmeRR.",
	shift = 1
}
slot19 = {
	[0] = "mtcrfRZ~",
	"mtocrfRZ~",
	shift = 20,
	mask = 1
}
slot18[144] = slot19
slot19 = {
	[0] = "mfcrR",
	"mfocrfRZ",
	shift = 20,
	mask = 1
}
slot18[19] = slot19
slot19 = {
	[424.0] = "mftbuR",
	[392.0] = "mftbR",
	shift = 11,
	mask = 1023
}
slot20 = 371
slot18[slot20] = slot19
slot19 = {
	[32.0] = "mferR",
	[16.0] = "mfspefscrR",
	[256.0] = "mflrR",
	mask = 1023,
	[288.0] = "mfctrR",
	shift = 11
}
slot20 = 339
slot18[slot20] = slot19
slot19 = {
	[32.0] = "mtxerR",
	[16.0] = "mtspefscrR",
	[256.0] = "mtlrR",
	mask = 1023,
	[288.0] = "mtctrR",
	shift = 11
}
slot20 = 467
slot18[slot20] = slot19
slot19 = {
	[0] = "sync",
	"lwsync",
	"ptesync",
	shift = 21,
	mask = 3
}
slot20 = 598
slot18[slot20] = slot19
slot19 = {}

function slot20(slot0, slot1)
	slot2 = slot0
	slot3 = slot1
	slot4 = 31
	slot2 = slot2(slot3, slot4)

	if slot2 == 15 then
		slot2 = "iselRRRC"

		return slot2
	end
end

slot19.__index = slot20
slot17 = slot17(slot18, slot19)
slot18 = {
	[0] = "ldRRE",
	"lduRRE",
	"lwaRRE",
	shift = 0,
	mask = 3
}
slot19 = {
	[0] = "stdRRE",
	"stduRRE",
	shift = 0,
	mask = 3
}
slot20 = {
	shift = 5,
	mask = 1
}
slot21 = {
	[0] = false,
	false,
	"fdivsFFF.",
	false,
	"fsubsFFF.",
	"faddsFFF.",
	"fsqrtsF-F.",
	false,
	"fresF-F.",
	"fmulsFF-F.",
	"frsqrtesF-F.",
	false,
	"fmsubsFFFF~.",
	"fmaddsFFFF~.",
	"fnmsubsFFFF~.",
	"fnmaddsFFFF~.",
	shift = 1,
	mask = 15
}
slot20[1] = slot21
slot21 = {
	shift = 5,
	mask = 1
}
slot22 = {
	[0] = "fcmpuXFF",
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"fcpsgnFFF.",
	nil,
	nil,
	nil,
	"frspF-F.",
	nil,
	"fctiwF-F.",
	"fctiwzF-F.",
	[38.0] = "mtfsb1A.",
	[264.0] = "fabsF-F.",
	[711.0] = "mtfsfZF.",
	[583.0] = "mffsF.",
	[40.0] = "fnegF-F.",
	[846.0] = "fcfidF-F.",
	[815.0] = "fctidzF-F.",
	[70.0] = "mtfsb0A.",
	[32.0] = "fcmpoXFF",
	[392.0] = "frinF-F.",
	[424.0] = "frizF-F.",
	mask = 1023,
	[456.0] = "fripF-F.",
	[488.0] = "frimF-F.",
	[814.0] = "fctidF-F.",
	[136.0] = "fnabsF-F.",
	[64.0] = "mcrfsXX",
	[134.0] = "mtfsfiA>>-A>",
	[72.0] = "fmrF-F.",
	shift = 1
}
slot21[0] = slot22
slot22 = {
	[0] = false,
	false,
	"fdivFFF.",
	false,
	"fsubFFF.",
	"faddFFF.",
	"fsqrtF-F.",
	"fselFFFF~.",
	"freF-F.",
	"fmulFF-F.",
	"frsqrteF-F.",
	false,
	"fmsubFFFF~.",
	"fmaddFFFF~.",
	"fnmsubFFFF~.",
	"fnmaddFFFF~.",
	shift = 1,
	mask = 15
}
slot21[1] = slot22
slot22 = {
	[765.0] = "efdtstltYRR",
	[759.0] = "efdctsfR-R",
	[725.0] = "efsctsiR-R",
	[669.0] = "evfststltYRR",
	[727.0] = "efsctsfR-R",
	[1219.0] = "evsubfssiaawRR",
	[1453.0] = "evmhogsmianRRR",
	[1039.0] = "evmhosmfRRR",
	[1281.0] = "evmhessiaawRRR",
	[1068.0] = "evmhoumiaRRR",
	[785.0] = "evlwheRR4",
	[1036.0] = "evmhoumiRRR",
	[766.0] = "efdtsteqYRR",
	[754.0] = "efdcfufR-R",
	[1421.0] = "evmhosmianwRRR",
	[756.0] = "efdctuiR-R",
	[1413.0] = "evmhossianwRRR",
	[542.0] = "evnandRRR",
	[544.0] = "evsrwuRRR",
	[724.0] = "efsctuiR-R",
	[1035.0] = "evmhesmfRRR",
	[1031.0] = "evmhossfRRR",
	[560.0] = "evcmpgtuYRR",
	[514.0] = "evaddiwRAR~",
	[522.0] = "evextsbRR",
	[668.0] = "evfststgtYRR",
	[666.0] = "evfsctsizR-R",
	[660.0] = "evfsctuiR-R",
	[633.0] = "evselRRRW",
	[1222.0] = "evdivwsRRR",
	[637.0] = "evselRRRW",
	[521.0] = "evnegRR",
	[526.0] = "evcntlswRR",
	[640.0] = "evfsaddRRR",
	[525.0] = "evcntlzwRR",
	[639.0] = "evselRRRW",
	[644.0] = "evfsabsRR",
	[652.0] = "evfscmpgtYRR",
	[648.0] = "evfsmulRRR",
	[1324.0] = "evmhogumiaaRRR",
	[1037.0] = "evmhosmiRRR",
	[635.0] = "evselRRRW",
	[656.0] = "evfscfuiR-R",
	[658.0] = "evfscfufR-R",
	[1284.0] = "evmhousiaawRRR",
	[719.0] = "efscfdR-R",
	[664.0] = "evfsctuizR-R",
	[1292.0] = "evmhoumiaawRRR",
	[1069.0] = "evmhosmiaRRR",
	[562.0] = "evcmpltuYRR",
	[537.0] = "eveqvRRR",
	[554.0] = "evrlwiRRA",
	[552.0] = "evrlwRRR",
	[546.0] = "evsrwiuRRA",
	[713.0] = "efsdivRRR",
	[716.0] = "efscmpgtYRR",
	[1101.0] = "evmwhsmiRRR",
	[721.0] = "efscfsiR-R",
	[722.0] = "efscfufR-R",
	[738.0] = "efdcfuidR-R",
	[752.0] = "efdcfuiR-R",
	[732.0] = "efststgtYRR",
	[536.0] = "evnor|evnotRRR=",
	[535.0] = "evor|evmrRRR=",
	[1133.0] = "evmwhsmiaRRR",
	[708.0] = "efsabsRR",
	[530.0] = "evandcRRR",
	[704.0] = "efsaddRRR",
	[529.0] = "evandRRR",
	[564.0] = "evcmpeqYRR",
	[1452.0] = "evmhogumianRRR",
	[712.0] = "efsmulRRR",
	[527.0] = "brincRRR",
	[556.0] = "evmergehiRRR",
	[1345.0] = "evmwlssiaawRRR",
	[720.0] = "efscfuiR-R",
	[518.0] = "evsubiwRAR~",
	[548.0] = "evslwRRR",
	[1420.0] = "evmhoumianwRRR",
	[728.0] = "efsctuizR-R",
	[1412.0] = "evmhousianwRRR",
	[740.0] = "efdabsRR",
	[516.0] = "evsubwRRR~",
	[736.0] = "efdaddRRR",
	[748.0] = "efdcmpgtYRR",
	[744.0] = "efdmulRRR",
	[524.0] = "evrndwRR",
	[520.0] = "evabsRR",
	[764.0] = "efdtstgtYRR",
	[512.0] = "evaddwRRR",
	[760.0] = "efdctuizR-R",
	[773.0] = "evldhRR8",
	[769.0] = "evlddRR8",
	[781.0] = "evlhhousplatRR2",
	[1323.0] = "evmhegsmfaaRRR",
	[777.0] = "evlhhesplatRR2",
	[789.0] = "evlwhouRR4",
	[1283.0] = "evmhessfaawRRR",
	[797.0] = "evlwhsplatRR4",
	[1291.0] = "evmhesmfaawRRR",
	[793.0] = "evlwwsplatRR4",
	[805.0] = "evstdhRR8",
	[801.0] = "evstddRR8",
	[1100.0] = "evmwhumiRRR",
	[821.0] = "evstwhoRR4",
	[817.0] = "evstwheRR4",
	[829.0] = "evstwwoRR4",
	[1132.0] = "evmwhumiaRRR",
	[825.0] = "evstwweRR4",
	[1363.0] = "evmwssfaaRRR",
	[1371.0] = "evmwsmfaaRRR",
	[1451.0] = "evmhegsmfanRRR",
	[1419.0] = "evmhesmfanwRRR",
	[1411.0] = "evmhessfanwRRR",
	[632.0] = "evselRRR",
	[1220.0] = "evmraRR",
	[636.0] = "evselRRRW",
	[1499.0] = "evmwsmfanRRR",
	[1491.0] = "evmwssfanRRR",
	[659.0] = "evfscfsfR-R",
	[1027.0] = "evmhessfRRR",
	[663.0] = "evfsctsfR-R",
	[1067.0] = "evmhesmfaRRR",
	[1059.0] = "evmhessfaRRR",
	[1115.0] = "evmwsmfRRR",
	[1107.0] = "evmwssfRRR",
	[1147.0] = "evmwsmfaRRR",
	[1139.0] = "evmwssfaRRR",
	[563.0] = "evcmpltsYRR",
	[559.0] = "evmergelohiRRR",
	[555.0] = "evsplatfiRS",
	[723.0] = "efscfsfR-R",
	[547.0] = "evsrwisRRA",
	[539.0] = "evorcRRR",
	[739.0] = "efdcfsidR-R",
	[751.0] = "efdcfsR-R",
	[747.0] = "efdctsidzR-R",
	[523.0] = "evextshRR",
	[755.0] = "efdcfsfR-R",
	[1227.0] = "evsubfsmiaawRR",
	[772.0] = "evldhxRR0R",
	[768.0] = "evlddxRR0R",
	[780.0] = "evlhhousplatxRR0R",
	[1321.0] = "evmhegsmiaaRRR",
	[776.0] = "evlhhesplatxRR0R",
	[788.0] = "evlwhouxRR0R",
	[784.0] = "evlwhexRR0R",
	[796.0] = "evlwhsplatxRR0R",
	[1289.0] = "evmhesmiaawRRR",
	[792.0] = "evlwwsplatxRR0R",
	[804.0] = "evstdhxRR0R",
	[800.0] = "evstddxRR0R",
	[820.0] = "evstwhoxRR0R",
	[816.0] = "evstwhexRR0R",
	shift = 0,
	[828.0] = "evstwwoxRR0R",
	[1353.0] = "evmwlsmiaawRRR",
	[824.0] = "evstwwexRR0R",
	[1369.0] = "evmwsmiaaRRR",
	[1449.0] = "evmhegsmianRRR",
	[1417.0] = "evmhesmianwRRR",
	[1409.0] = "evmhessianwRRR",
	mask = 2047,
	[1218.0] = "evsubfusiaawRR",
	[1481.0] = "evmwlsmianwRRR",
	[1226.0] = "evsubfumiaawRR",
	[1473.0] = "evmwlssianwRRR",
	[1497.0] = "evmwsmianRRR",
	[646.0] = "evfsnegRR",
	[654.0] = "evfscmpeqYRR",
	[1320.0] = "evmhegumiaaRRR",
	[1033.0] = "evmhesmiRRR",
	[662.0] = "evfsctufR-R",
	[1280.0] = "evmheusiaawRRR",
	[670.0] = "evfststeqYRR",
	[1288.0] = "evmheumiaawRRR",
	[1065.0] = "evmhesmiaRRR",
	[1113.0] = "evmwsmiRRR",
	[1145.0] = "evmwsmiaRRR",
	[1344.0] = "evmwlusiaawRRR",
	[1352.0] = "evmwlumiaawRRR",
	[710.0] = "efsnegRR",
	[1368.0] = "evmwumiaaRRR",
	[1448.0] = "evmhegumianRRR",
	[718.0] = "efscmpeqYRR",
	[558.0] = "evmergehiloRRR",
	[726.0] = "efsctufR-R",
	[550.0] = "evslwiRRA",
	[1416.0] = "evmheumianwRRR",
	[734.0] = "efststeqYRR",
	[1408.0] = "evmheusianwRRR",
	[730.0] = "efsctsizR-R",
	[742.0] = "efdnegRR",
	[534.0] = "evxorRRR",
	[750.0] = "efdcmpeqYRR",
	[746.0] = "efdctuidzR-R",
	[758.0] = "efdctufR-R",
	[1217.0] = "evaddssiaawRR",
	[1480.0] = "evmwlumianwRRR",
	[1225.0] = "evaddsmiaawRR",
	[1472.0] = "evmwlusianwRRR",
	[762.0] = "efdctsizR-R",
	[1496.0] = "evmwumianRRR",
	[771.0] = "evldwRR8",
	[783.0] = "evlhhossplatRR2",
	[1327.0] = "evmhogsmfaaRRR",
	[1032.0] = "evmheumiRRR",
	[791.0] = "evlwhosRR4",
	[1287.0] = "evmhossfaawRRR",
	[1295.0] = "evmhosmfaawRRR",
	[1064.0] = "evmheumiaRRR",
	[803.0] = "evstdwRR8",
	[1112.0] = "evmwumiRRR",
	[1096.0] = "evmwlumiRRR",
	[1144.0] = "evmwumiaRRR",
	[1128.0] = "evmwlumiaRRR",
	[1455.0] = "evmhogsmfanRRR",
	[1423.0] = "evmhosmfanwRRR",
	[1415.0] = "evmhossfanwRRR",
	[1216.0] = "evaddusiaawRR",
	[634.0] = "evselRRRW",
	[1224.0] = "evaddumiaawRR",
	[638.0] = "evselRRRW",
	[641.0] = "evfssubRRR",
	[645.0] = "evfsnabsRR",
	[649.0] = "evfsdivRRR",
	[653.0] = "evfscmpltYRR",
	[657.0] = "evfscfsiR-R",
	[661.0] = "evfsctsiR-R",
	[1071.0] = "evmhosmfaRRR",
	[1063.0] = "evmhossfaRRR",
	[1103.0] = "evmwhsmfRRR",
	[1095.0] = "evmwhssfRRR",
	[1135.0] = "evmwhsmfaRRR",
	[709.0] = "efsnabsRR",
	[1127.0] = "evmwhssfaRRR",
	[705.0] = "efssubRRR",
	[717.0] = "efscmpltYRR",
	[561.0] = "evcmpgtsYRR",
	[557.0] = "evmergeloRRR",
	[553.0] = "evsplatiRS",
	[733.0] = "efststltYRR",
	[545.0] = "evsrwsRRR",
	[741.0] = "efdnabsRR",
	[737.0] = "efdsubRRR",
	[749.0] = "efdcmpltYRR",
	[745.0] = "efddivRRR",
	[757.0] = "efdctsiR-R",
	[753.0] = "efdcfsiR-R",
	[1223.0] = "evdivwuRRR",
	[770.0] = "evldwxRR0R",
	[782.0] = "evlhhossplatxRR0R",
	[1325.0] = "evmhogsmiaaRRR",
	[790.0] = "evlwhosxRR0R",
	[1285.0] = "evmhossiaawRRR",
	[1293.0] = "evmhosmiaawRRR",
	[802.0] = "evstdwxRR0R"
}
slot23 = {
	[0] = false,
	false,
	"tdiARI",
	"twiARI",
	slot22,
	false,
	false,
	"mulliRRI",
	"subficRRI",
	false,
	"cmpl_iYLRU",
	"cmp_iYLRI",
	"addicRRI",
	"addic.RRI",
	"addi|liRR0I",
	"addis|lisRR0I",
	"b_KBJ",
	"sc",
	"bKJ",
	slot14,
	"rlwimiRR~AAA.",
	slot15,
	false,
	"rlwnmRR~RAA.",
	"oriNRR~U",
	"orisRR~U",
	"xoriRR~U",
	"xorisRR~U",
	"andi.RR~U",
	"andis.RR~U",
	slot16,
	slot17,
	"lwzRRD",
	"lwzuRRD",
	"lbzRRD",
	"lbzuRRD",
	"stwRRD",
	"stwuRRD",
	"stbRRD",
	"stbuRRD",
	"lhzRRD",
	"lhzuRRD",
	"lhaRRD",
	"lhauRRD",
	"sthRRD",
	"sthuRRD",
	"lmwRRD",
	"stmwRRD",
	"lfsFRD",
	"lfsuFRD",
	"lfdFRD",
	"lfduFRD",
	"stfsFRD",
	"stfsuFRD",
	"stfdFRD",
	"stfduFRD",
	false,
	false,
	slot18,
	slot20,
	false,
	false,
	slot19,
	slot21
}
slot24 = {
	[0] = "r0",
	"sp",
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
	"r29",
	"r30",
	"r31"
}
slot25 = {
	[0] = "lt",
	"gt",
	"eq",
	"so",
	"ge",
	"le",
	"ne",
	"ns"
}

function slot26(slot0)
	slot1 = 3

	if slot0 <= slot1 then
		slot1 = slot0
		slot2 = slot1
		slot3 = slot0
		slot4 = 3
		slot2 = slot2(slot3, slot4)
		slot1 = slot1[slot2]

		return slot1
	else
		slot1 = slot2
		slot2 = "4*cr%d+%s"
		slot3 = slot3
		slot4 = slot0
		slot5 = 2
		slot3 = slot3(slot4, slot5)
		slot4 = slot0
		slot5 = slot1
		slot6 = slot0
		slot7 = 3
		slot5 = slot5(slot6, slot7)
		slot4 = slot4[slot5]

		return slot1(slot2, slot3, slot4)
	end
end

function slot27(slot0, slot1, slot2)
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

function slot28(slot0)
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

function slot29(slot0)
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
	slot6 = slot6(slot7, slot8, slot9, slot10)
	slot7 = {}
	slot8 = nil
	slot9 = 21
	slot0.op = slot6
	slot10 = nil
	slot0.rel = slot10
	slot10 = slot3
	slot11 = slot4
	slot12 = slot2
	slot13 = 2
	slot11 = slot11(slot12, slot13)
	slot10 = slot10[slot11]
	slot11 = slot5
	slot12 = slot10
	slot11 = slot11(slot12)

	while slot11 ~= "string" do
		if not slot10 then
			slot11 = slot6
			slot12 = slot0

			return slot11(slot12)
		end

		slot11 = slot7
		slot12 = slot4
		slot13 = slot6
		slot14 = slot10.shift
		slot12 = slot12(slot13, slot14)
		slot13 = slot10.mask
		slot11 = slot11(slot12, slot13)
		slot10 = slot10[slot11]
	end

	slot11 = slot8
	slot12 = slot10
	slot13 = "^([a-z0-9_.]*)(.*)"
	slot11, slot12 = slot11(slot12, slot13)
	slot13 = slot8
	slot14 = slot12
	slot15 = "|([a-z0-9_.]*)(.*)"
	slot13, slot14 = slot13(slot14, slot15)

	if slot13 then
		slot12 = slot14
	end

	slot15 = slot9
	slot16 = slot12
	slot17 = "."
	slot15, slot16, slot17 = slot15(slot16, slot17)

	for slot18 in slot15, slot16, slot17 do
		slot19 = nil

		if slot18 == "R" then
			slot20 = slot10
			slot21 = slot7
			slot22 = slot4
			slot23 = slot6
			slot24 = slot9
			slot22 = slot22(slot23, slot24)
			slot23 = 31
			slot21 = slot21(slot22, slot23)
			slot19 = slot20[slot21]
			slot9 = slot9 - 5
		elseif slot18 == "F" then
			slot20 = "f"
			slot21 = slot7
			slot22 = slot4
			slot23 = slot6
			slot24 = slot9
			slot22 = slot22(slot23, slot24)
			slot23 = 31
			slot21 = slot21(slot22, slot23)
			slot19 = slot20 .. slot21
			slot9 = slot9 - 5
		elseif slot18 == "A" then
			slot20 = slot7
			slot21 = slot4
			slot22 = slot6
			slot23 = slot9
			slot21 = slot21(slot22, slot23)
			slot22 = 31
			slot20 = slot20(slot21, slot22)
			slot19 = slot20
			slot9 = slot9 - 5
		elseif slot18 == "S" then
			slot20 = slot11
			slot21 = slot2
			slot22 = slot6
			slot23 = 27 - slot9
			slot21 = slot21(slot22, slot23)
			slot22 = 27
			slot20 = slot20(slot21, slot22)
			slot19 = slot20
			slot9 = slot9 - 5
		elseif slot18 == "I" then
			slot20 = slot11
			slot21 = slot2
			slot22 = slot6
			slot23 = 16
			slot21 = slot21(slot22, slot23)
			slot22 = 16
			slot20 = slot20(slot21, slot22)
			slot19 = slot20
		elseif slot18 == "U" then
			slot20 = slot7
			slot21 = slot6
			slot22 = 65535
			slot20 = slot20(slot21, slot22)
			slot19 = slot20
		elseif slot18 == "D" or slot18 == "E" then
			slot20 = slot11
			slot21 = slot2
			slot22 = slot6
			slot23 = 16
			slot21 = slot21(slot22, slot23)
			slot22 = 16
			slot20 = slot20(slot21, slot22)

			if slot18 == "E" then
				slot21 = slot7
				slot22 = slot20
				slot23 = -4
				slot21 = slot21(slot22, slot23)
				slot20 = slot21
			end

			if slot8 == "r0" then
				slot8 = "0"
			end

			slot21 = #slot7
			slot22 = slot12
			slot23 = "%d(%s)"
			slot24 = slot20
			slot25 = slot8
			slot22 = slot22(slot23, slot24, slot25)
			slot7[slot21] = slot22
		else
			slot20 = "2"

			if slot20 <= slot18 then
				slot20 = "8"

				if slot18 <= slot20 then
					slot20 = slot7
					slot21 = slot4
					slot22 = slot6
					slot23 = slot9
					slot21 = slot21(slot22, slot23)
					slot22 = 31
					slot20 = slot20(slot21, slot22)
					slot20 = slot20 * slot18

					if slot8 == "r0" then
						slot8 = "0"
					end

					slot21 = #slot7
					slot22 = slot12
					slot23 = "%d(%s)"
					slot24 = slot20
					slot25 = slot8
					slot22 = slot22(slot23, slot24, slot25)
					slot7[slot21] = slot22
				end
			elseif slot18 == "H" then
				slot20 = slot7
				slot21 = slot4
				slot22 = slot6
				slot23 = slot9
				slot21 = slot21(slot22, slot23)
				slot22 = 31
				slot20 = slot20(slot21, slot22)
				slot21 = slot2
				slot22 = slot7
				slot23 = slot6
				slot24 = 2
				slot22 = slot22(slot23, slot24)
				slot23 = 4
				slot21 = slot21(slot22, slot23)
				slot19 = slot20 + slot21
				slot9 = slot9 - 5
			elseif slot18 == "M" then
				slot20 = slot7
				slot21 = slot4
				slot22 = slot6
				slot23 = slot9
				slot21 = slot21(slot22, slot23)
				slot22 = 31
				slot20 = slot20(slot21, slot22)
				slot21 = slot7
				slot22 = slot6
				slot23 = 32
				slot21 = slot21(slot22, slot23)
				slot19 = slot20 + slot21
			elseif slot18 == "C" then
				slot20 = slot13
				slot21 = slot7
				slot22 = slot4
				slot23 = slot6
				slot24 = slot9
				slot22 = slot22(slot23, slot24)
				slot23 = 31
				slot20 = slot20(slot21(slot22, slot23))
				slot19 = slot20
				slot9 = slot9 - 5
			elseif slot18 == "B" then
				slot20 = slot4
				slot21 = slot6
				slot22 = 21
				slot20 = slot20(slot21, slot22)
				slot21 = slot7
				slot22 = slot4
				slot23 = slot6
				slot24 = 16
				slot22 = slot22(slot23, slot24)
				slot23 = 31
				slot21 = slot21(slot22, slot23)
				slot22 = ""
				slot9 = slot9 - 10
				slot23 = slot7
				slot24 = slot20
				slot25 = 4
				slot23 = slot23(slot24, slot25)

				if slot23 == 0 then
					slot22 = (slot7(slot20, 2) == 0 and "dnz") or "dz"
					slot23 = slot7(slot20, 16)

					if slot23 == 0 then
						slot22 = slot22 .. ((slot7(slot20, 8) == 0 and "f") or "t")
					end

					slot23 = slot7
					slot24 = slot20
					slot25 = 16
					slot23 = slot23(slot24, slot25)

					if slot23 == 0 then
						slot23 = slot13
						slot24 = slot21
						slot23 = slot23(slot24)
						slot19 = slot23
					end

					slot11 = slot11 .. ((slot7(slot20, 1) == slot7(slot4(slot6, 15), 1) and "-") or "+")
				else
					slot23 = slot7
					slot24 = slot20
					slot25 = 16
					slot23 = slot23(slot24, slot25)

					if slot23 == 0 then
						slot22 = slot14[slot7(slot21, 3) + ((slot7(slot20, 8) == 0 and 4) or 0)]
						slot23 = 3

						if slot21 > slot23 then
							slot23 = "cr"
							slot24 = slot4
							slot25 = slot21
							slot26 = 2
							slot24 = slot24(slot25, slot26)
							slot19 = slot23 .. slot24
						end

						slot11 = slot11 .. ((slot7(slot20, 1) == slot7(slot4(slot6, 15), 1) and "-") or "+")
					end
				end

				slot23 = slot15
				slot24 = slot11
				slot25 = "_"
				slot26 = slot22
				slot23 = slot23(slot24, slot25, slot26)
				slot11 = slot23
			elseif slot18 == "J" then
				slot20 = slot11
				slot21 = slot2
				slot22 = slot6
				slot23 = 27 - slot9
				slot21 = slot21(slot22, slot23)
				slot22 = 29 - slot9
				slot20 = slot20(slot21, slot22)
				slot19 = slot20 * 4
				slot20 = slot7
				slot21 = slot6
				slot22 = 2
				slot20 = slot20(slot21, slot22)

				if slot20 == 0 then
					slot20 = slot0.addr
					slot20 = slot20 + slot1
					slot19 = slot20 + slot19
				end

				slot0.rel = slot19
				slot20 = "0x"
				slot21 = slot16
				slot22 = slot19
				slot21 = slot21(slot22)
				slot19 = slot20 .. slot21
			elseif slot18 == "K" then
				slot20 = slot7
				slot21 = slot6
				slot22 = 1
				slot20 = slot20(slot21, slot22)

				if slot20 ~= 0 then
					slot20 = slot11
					slot21 = "l"
					slot11 = slot20 .. slot21
				end

				slot20 = slot7
				slot21 = slot6
				slot22 = 2
				slot20 = slot20(slot21, slot22)

				if slot20 ~= 0 then
					slot20 = slot11
					slot21 = "a"
					slot11 = slot20 .. slot21
				end
			elseif slot18 == "X" or slot18 == "Y" then
				slot20 = slot7
				slot21 = slot4
				slot22 = slot6
				slot23 = slot9 + 2
				slot21 = slot21(slot22, slot23)
				slot22 = 7
				slot20 = slot20(slot21, slot22)
				slot19 = slot20

				if slot19 == 0 and slot18 == "Y" then
					slot19 = nil
				else
					slot20 = "cr"
					slot21 = slot19
					slot19 = slot20 .. slot21
				end

				slot9 = slot9 - 5
			elseif slot18 == "W" then
				slot20 = "cr"
				slot21 = slot7
				slot22 = slot6
				slot23 = 7
				slot21 = slot21(slot22, slot23)
				slot19 = slot20 .. slot21
			elseif slot18 == "Z" then
				slot20 = slot7
				slot21 = slot4
				slot22 = slot6
				slot23 = slot9 - 4
				slot21 = slot21(slot22, slot23)
				slot22 = 255
				slot20 = slot20(slot21, slot22)
				slot19 = slot20
				slot9 = slot9 - 10
			elseif slot18 == ">" then
				slot20 = #slot7
				slot21 = slot4
				slot22 = #slot7
				slot22 = slot7[slot22]
				slot23 = 1
				slot21 = slot21(slot22, slot23)
				slot7[slot20] = slot21
			elseif slot18 == "0" then
				if slot8 == "r0" then
					slot20 = #slot7
					slot21 = nil
					slot7[slot20] = slot21

					if slot13 then
						slot11 = slot13
					end
				end
			elseif slot18 == "L" then
				slot11 = slot15(slot11, "_", (slot7(slot6, 2097152) ~= 0 and "d") or "w")
			elseif slot18 == "." then
				slot20 = slot7
				slot21 = slot6
				slot22 = 1
				slot20 = slot20(slot21, slot22)

				if slot20 == 1 then
					slot20 = slot11
					slot21 = "."
					slot11 = slot20 .. slot21
				end
			elseif slot18 == "N" then
				if slot6 == 1610612736 then
					slot11 = "nop"

					break
				end
			elseif slot18 == "~" then
				slot20 = #slot7
				slot21 = slot20 - 1
				slot22 = slot7[slot20]
				slot23 = slot20 - 1
				slot23 = slot7[slot23]
				slot7[slot20] = slot23
				slot7[slot21] = slot22
			elseif slot18 == "=" then
				slot20 = #slot7
				slot21 = slot20 - 1
				slot21 = slot7[slot21]

				if slot8 == slot21 then
					slot21 = nil
					slot7[slot20] = slot21
					slot11 = slot13
				end
			elseif slot18 == "%" then
				slot20 = #slot7
				slot21 = slot20 - 1
				slot21 = slot7[slot21]

				if slot8 == slot21 then
					slot21 = slot20 - 2
					slot21 = slot7[slot21]

					if slot8 == slot21 then
						slot21 = nil
						slot7[slot20] = slot21
						slot21 = slot20 - 1
						slot22 = nil
						slot7[slot21] = slot22
						slot11 = slot13
					end
				end
			elseif slot18 == "-" then
				slot9 = slot9 - 5
			end
		end

		if slot19 then
			slot20 = #slot7
			slot20 = slot20 + 1
			slot7[slot20] = slot19
			slot8 = slot19
		end
	end

	slot15 = slot17
	slot16 = slot0
	slot17 = slot11
	slot18 = slot7

	return slot15(slot16, slot17, slot18)
end

function slot30(slot0, slot1, slot2)
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

function slot31(slot0, slot1, slot2)
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

function slot32(slot0, slot1, slot2)
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot6 = slot2
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = slot3
	slot3 = slot3.disass

	slot3(slot4)
end

function slot33(slot0)
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

slot34 = {
	create = slot31,
	disass = slot32,
	regname = slot33
}

return slot34
