slot0 = type
slot1 = string.sub
slot2 = string.byte
slot3 = string.format
slot4 = string.match
slot5 = string.gmatch
slot6 = string.gsub
slot7 = string.lower
slot8 = string.rep
slot10 = require("bit").tohex
slot12 = setmetatable({
	[96.0] = false,
	[7.0] = false,
	[39.0] = false,
	[66.0] = "rex*x",
	[22.0] = false,
	[97.0] = false,
	[31.0] = false,
	[69.0] = "rex*rb",
	[103.0] = "a32:",
	[206.0] = false,
	[130.0] = false,
	[68.0] = "rex*r",
	[154.0] = false,
	[30.0] = false,
	[197.0] = "vex*2",
	[71.0] = "rex*rxb",
	[6.0] = false,
	[23.0] = false,
	[70.0] = "rex*rx",
	[74.0] = "rex*wx",
	[196.0] = "vex*3",
	[75.0] = "rex*wxb",
	[72.0] = "rex*w",
	[14.0] = false,
	[73.0] = "rex*wb",
	[78.0] = "rex*wrx",
	[79.0] = "rex*wrxb",
	[47.0] = false,
	[76.0] = "rex*wr",
	[55.0] = false,
	[77.0] = "rex*wrb",
	[63.0] = false,
	[214.0] = false,
	[212.0] = false,
	[65.0] = "rex*b",
	[213.0] = false,
	[98.0] = false,
	[64.0] = "rex*",
	[234.0] = false,
	[99.0] = "movsxdVrDmt",
	[67.0] = "rex*xb"
}, {
	__index = {
		[0] = "addBmr",
		"addVmr",
		"addBrm",
		"addVrm",
		"addBai",
		"addVai",
		"push es",
		"pop es",
		"orBmr",
		"orVmr",
		"orBrm",
		"orVrm",
		"orBai",
		"orVai",
		"push cs",
		"opc2*",
		"adcBmr",
		"adcVmr",
		"adcBrm",
		"adcVrm",
		"adcBai",
		"adcVai",
		"push ss",
		"pop ss",
		"sbbBmr",
		"sbbVmr",
		"sbbBrm",
		"sbbVrm",
		"sbbBai",
		"sbbVai",
		"push ds",
		"pop ds",
		"andBmr",
		"andVmr",
		"andBrm",
		"andVrm",
		"andBai",
		"andVai",
		"es:seg",
		"daa",
		"subBmr",
		"subVmr",
		"subBrm",
		"subVrm",
		"subBai",
		"subVai",
		"cs:seg",
		"das",
		"xorBmr",
		"xorVmr",
		"xorBrm",
		"xorVrm",
		"xorBai",
		"xorVai",
		"ss:seg",
		"aaa",
		"cmpBmr",
		"cmpVmr",
		"cmpBrm",
		"cmpVrm",
		"cmpBai",
		"cmpVai",
		"ds:seg",
		"aas",
		"incVR",
		"incVR",
		"incVR",
		"incVR",
		"incVR",
		"incVR",
		"incVR",
		"incVR",
		"decVR",
		"decVR",
		"decVR",
		"decVR",
		"decVR",
		"decVR",
		"decVR",
		"decVR",
		"pushUR",
		"pushUR",
		"pushUR",
		"pushUR",
		"pushUR",
		"pushUR",
		"pushUR",
		"pushUR",
		"popUR",
		"popUR",
		"popUR",
		"popUR",
		"popUR",
		"popUR",
		"popUR",
		"popUR",
		"sz*pushaw,pusha",
		"sz*popaw,popa",
		"boundVrm",
		"arplWmr",
		"fs:seg",
		"gs:seg",
		"o16:",
		"a16",
		"pushUi",
		"imulVrmi",
		"pushBs",
		"imulVrms",
		"insb",
		"insVS",
		"outsb",
		"outsVS",
		"joBj",
		"jnoBj",
		"jbBj",
		"jnbBj",
		"jzBj",
		"jnzBj",
		"jbeBj",
		"jaBj",
		"jsBj",
		"jnsBj",
		"jpeBj",
		"jpoBj",
		"jlBj",
		"jgeBj",
		"jleBj",
		"jgBj",
		"arith!Bmi",
		"arith!Vmi",
		"arith!Bmi",
		"arith!Vms",
		"testBmr",
		"testVmr",
		"xchgBrm",
		"xchgVrm",
		"movBmr",
		"movVmr",
		"movBrm",
		"movVrm",
		"movVmg",
		"leaVrm",
		"movWgm",
		"popUm",
		"nop*xchgVaR|pause|xchgWaR|repne nop",
		"xchgVaR",
		"xchgVaR",
		"xchgVaR",
		"xchgVaR",
		"xchgVaR",
		"xchgVaR",
		"xchgVaR",
		"sz*cbw,cwde,cdqe",
		"sz*cwd,cdq,cqo",
		"call farViw",
		"wait",
		"sz*pushfw,pushf",
		"sz*popfw,popf",
		"sahf",
		"lahf",
		"movBao",
		"movVao",
		"movBoa",
		"movVoa",
		"movsb",
		"movsVS",
		"cmpsb",
		"cmpsVS",
		"testBai",
		"testVai",
		"stosb",
		"stosVS",
		"lodsb",
		"lodsVS",
		"scasb",
		"scasVS",
		"movBRi",
		"movBRi",
		"movBRi",
		"movBRi",
		"movBRi",
		"movBRi",
		"movBRi",
		"movBRi",
		"movVRI",
		"movVRI",
		"movVRI",
		"movVRI",
		"movVRI",
		"movVRI",
		"movVRI",
		"movVRI",
		"shift!Bmu",
		"shift!Vmu",
		"retBw",
		"ret",
		"vex*3$lesVrm",
		"vex*2$ldsVrm",
		"movBmi",
		"movVmi",
		"enterBwu",
		"leave",
		"retfBw",
		"retf",
		"int3",
		"intBu",
		"into",
		"iretVS",
		"shift!Bm1",
		"shift!Vm1",
		"shift!Bmc",
		"shift!Vmc",
		"aamBu",
		"aadBu",
		"salc",
		"xlatb",
		"fp*0",
		"fp*1",
		"fp*2",
		"fp*3",
		"fp*4",
		"fp*5",
		"fp*6",
		"fp*7",
		"loopneBj",
		"loopeBj",
		"loopBj",
		"sz*jcxzBj,jecxzBj,jrcxzBj",
		"inBau",
		"inVau",
		"outBua",
		"outVua",
		"callVj",
		"jmpVj",
		"jmp farViw",
		"jmpBj",
		"inBad",
		"inVad",
		"outBda",
		"outVda",
		"lock:",
		"int1",
		"repne:rep",
		"rep:",
		"hlt",
		"cmc",
		"testb!Bm",
		"testv!Vm",
		"clc",
		"stc",
		"cli",
		"sti",
		"cld",
		"std",
		"incb!Bm",
		"incd!Vm"
	}
})
slot13 = {
	[0] = "sldt!Dmp",
	"sgdt!Ump",
	"larVrm",
	"lslVrm",
	nil,
	"syscall",
	"clts",
	"sysret",
	"invd",
	"wbinvd",
	nil,
	"ud1",
	nil,
	"$prefetch!Bm",
	"femms",
	"3dnowMrmu",
	"movupsXrm|movssXrvm|movupdXrm|movsdXrvm",
	"movupsXmr|movssXmvr|movupdXmr|movsdXmvr",
	"movhlpsXrm$movlpsXrm|movsldupXrm|movlpdXrm|movddupXrm",
	"movlpsXmr||movlpdXmr",
	"unpcklpsXrvm||unpcklpdXrvm",
	"unpckhpsXrvm||unpckhpdXrvm",
	"movlhpsXrm$movhpsXrm|movshdupXrm|movhpdXrm",
	"movhpsXmr||movhpdXmr",
	"$prefetcht!Bm",
	"hintnopVm",
	"hintnopVm",
	"hintnopVm",
	"hintnopVm",
	"hintnopVm",
	"hintnopVm",
	"hintnopVm",
	"movUmx$",
	"movUmy$",
	"movUxm$",
	"movUym$",
	"movUmz$",
	nil,
	"movUzm$",
	nil,
	"movapsXrm||movapdXrm",
	"movapsXmr||movapdXmr",
	"cvtpi2psXrMm|cvtsi2ssXrvVmt|cvtpi2pdXrMm|cvtsi2sdXrvVmt",
	"movntpsXmr|movntssXmr|movntpdXmr|movntsdXmr",
	"cvttps2piMrXm|cvttss2siVrXm|cvttpd2piMrXm|cvttsd2siVrXm",
	"cvtps2piMrXm|cvtss2siVrXm|cvtpd2piMrXm|cvtsd2siVrXm",
	"ucomissXrm||ucomisdXrm",
	"comissXrm||comisdXrm",
	"wrmsr",
	"rdtsc",
	"rdmsr",
	"rdpmc",
	"sysenter",
	"sysexit",
	nil,
	"getsec",
	"opc3*38",
	nil,
	"opc3*3a",
	nil,
	nil,
	nil,
	nil,
	nil,
	"cmovoVrm",
	"cmovnoVrm",
	"cmovbVrm",
	"cmovnbVrm",
	"cmovzVrm",
	"cmovnzVrm",
	"cmovbeVrm",
	"cmovaVrm",
	"cmovsVrm",
	"cmovnsVrm",
	"cmovpeVrm",
	"cmovpoVrm",
	"cmovlVrm",
	"cmovgeVrm",
	"cmovleVrm",
	"cmovgVrm",
	"movmskpsVrXm$||movmskpdVrXm$",
	"sqrtpsXrm|sqrtssXrm|sqrtpdXrm|sqrtsdXrm",
	"rsqrtpsXrm|rsqrtssXrvm",
	"rcppsXrm|rcpssXrvm",
	"andpsXrvm||andpdXrvm",
	"andnpsXrvm||andnpdXrvm",
	"orpsXrvm||orpdXrvm",
	"xorpsXrvm||xorpdXrvm",
	"addpsXrvm|addssXrvm|addpdXrvm|addsdXrvm",
	"mulpsXrvm|mulssXrvm|mulpdXrvm|mulsdXrvm",
	"cvtps2pdXrm|cvtss2sdXrvm|cvtpd2psXrm|cvtsd2ssXrvm",
	"cvtdq2psXrm|cvttps2dqXrm|cvtps2dqXrm",
	"subpsXrvm|subssXrvm|subpdXrvm|subsdXrvm",
	"minpsXrvm|minssXrvm|minpdXrvm|minsdXrvm",
	"divpsXrvm|divssXrvm|divpdXrvm|divsdXrvm",
	"maxpsXrvm|maxssXrvm|maxpdXrvm|maxsdXrvm",
	"punpcklbwPrvm",
	"punpcklwdPrvm",
	"punpckldqPrvm",
	"packsswbPrvm",
	"pcmpgtbPrvm",
	"pcmpgtwPrvm",
	"pcmpgtdPrvm",
	"packuswbPrvm",
	"punpckhbwPrvm",
	"punpckhwdPrvm",
	"punpckhdqPrvm",
	"packssdwPrvm",
	"||punpcklqdqXrvm",
	"||punpckhqdqXrvm",
	"movPrVSm",
	"movqMrm|movdquXrm|movdqaXrm",
	"pshufwMrmu|pshufhwXrmu|pshufdXrmu|pshuflwXrmu",
	"pshiftw!Pvmu",
	"pshiftd!Pvmu",
	"pshiftq!Mvmu||pshiftdq!Xvmu",
	"pcmpeqbPrvm",
	"pcmpeqwPrvm",
	"pcmpeqdPrvm",
	"emms*|",
	"vmreadUmr||extrqXmuu$|insertqXrmuu$",
	"vmwriteUrm||extrqXrm$|insertqXrm$",
	nil,
	nil,
	"||haddpdXrvm|haddpsXrvm",
	"||hsubpdXrvm|hsubpsXrvm",
	"movVSmMr|movqXrm|movVSmXr",
	"movqMmr|movdquXmr|movdqaXmr",
	"joVj",
	"jnoVj",
	"jbVj",
	"jnbVj",
	"jzVj",
	"jnzVj",
	"jbeVj",
	"jaVj",
	"jsVj",
	"jnsVj",
	"jpeVj",
	"jpoVj",
	"jlVj",
	"jgeVj",
	"jleVj",
	"jgVj",
	"setoBm",
	"setnoBm",
	"setbBm",
	"setnbBm",
	"setzBm",
	"setnzBm",
	"setbeBm",
	"setaBm",
	"setsBm",
	"setnsBm",
	"setpeBm",
	"setpoBm",
	"setlBm",
	"setgeBm",
	"setleBm",
	"setgBm",
	"push fs",
	"pop fs",
	"cpuid",
	"btVmr",
	"shldVmru",
	"shldVmrc",
	nil,
	nil,
	"push gs",
	"pop gs",
	"rsm",
	"btsVmr",
	"shrdVmru",
	"shrdVmrc",
	"fxsave!Dmp",
	"imulVrm",
	"cmpxchgBmr",
	"cmpxchgVmr",
	"$lssVrm",
	"btrVmr",
	"$lfsVrm",
	"$lgsVrm",
	"movzxVrBmt",
	"movzxVrWmt",
	"|popcntVrm",
	"ud2Dp",
	"bt!Vmu",
	"btcVmr",
	"bsfVrm",
	"bsrVrm|lzcntVrm|bsrWrm",
	"movsxVrBmt",
	"movsxVrWmt",
	"xaddBmr",
	"xaddVmr",
	"cmppsXrvmu|cmpssXrvmu|cmppdXrvmu|cmpsdXrvmu",
	"$movntiVmr|",
	"pinsrwPrvWmu",
	"pextrwDrPmu",
	"shufpsXrvmu||shufpdXrvmu",
	"$cmpxchg!Qmp",
	"bswapVR",
	"bswapVR",
	"bswapVR",
	"bswapVR",
	"bswapVR",
	"bswapVR",
	"bswapVR",
	"bswapVR",
	"||addsubpdXrvm|addsubpsXrvm",
	"psrlwPrvm",
	"psrldPrvm",
	"psrlqPrvm",
	"paddqPrvm",
	"pmullwPrvm",
	"|movq2dqXrMm|movqXmr|movdq2qMrXm$",
	"pmovmskbVrMm||pmovmskbVrXm",
	"psubusbPrvm",
	"psubuswPrvm",
	"pminubPrvm",
	"pandPrvm",
	"paddusbPrvm",
	"padduswPrvm",
	"pmaxubPrvm",
	"pandnPrvm",
	"pavgbPrvm",
	"psrawPrvm",
	"psradPrvm",
	"pavgwPrvm",
	"pmulhuwPrvm",
	"pmulhwPrvm",
	"|cvtdq2pdXrm|cvttpd2dqXrm|cvtpd2dqXrm",
	"$movntqMmr||$movntdqXmr",
	"psubsbPrvm",
	"psubswPrvm",
	"pminswPrvm",
	"porPrvm",
	"paddsbPrvm",
	"paddswPrvm",
	"pmaxswPrvm",
	"pxorPrvm",
	"|||lddquXrm",
	"psllwPrvm",
	"pslldPrvm",
	"psllqPrvm",
	"pmuludqPrvm",
	"pmaddwdPrvm",
	"psadbwPrvm",
	"maskmovqMrm||maskmovdquXrm$",
	"psubbPrvm",
	"psubwPrvm",
	"psubdPrvm",
	"psubqPrvm",
	"paddbPrvm",
	"paddwPrvm",
	"padddPrvm",
	"ud"
}
slot14 = {
	["38"] = {
		[0] = "pshufbPrvm",
		"phaddwPrvm",
		"phadddPrvm",
		"phaddswPrvm",
		"pmaddubswPrvm",
		"phsubwPrvm",
		"phsubdPrvm",
		"phsubswPrvm",
		"psignbPrvm",
		"psignwPrvm",
		"psigndPrvm",
		"pmulhrswPrvm",
		"||permilpsXrvm",
		"||permilpdXrvm",
		nil,
		nil,
		"||pblendvbXrma",
		nil,
		nil,
		nil,
		"||blendvpsXrma",
		"||blendvpdXrma",
		"||permpsXrvm",
		"||ptestXrm",
		"||broadcastssXrm",
		"||broadcastsdXrm",
		"||broadcastf128XrlXm",
		nil,
		"pabsbPrm",
		"pabswPrm",
		"pabsdPrm",
		nil,
		"||pmovsxbwXrm",
		"||pmovsxbdXrm",
		"||pmovsxbqXrm",
		"||pmovsxwdXrm",
		"||pmovsxwqXrm",
		"||pmovsxdqXrm",
		nil,
		nil,
		"||pmuldqXrvm",
		"||pcmpeqqXrvm",
		"||$movntdqaXrm",
		"||packusdwXrvm",
		"||maskmovpsXrvm",
		"||maskmovpdXrvm",
		"||maskmovpsXmvr",
		"||maskmovpdXmvr",
		"||pmovzxbwXrm",
		"||pmovzxbdXrm",
		"||pmovzxbqXrm",
		"||pmovzxwdXrm",
		"||pmovzxwqXrm",
		"||pmovzxdqXrm",
		"||permdXrvm",
		"||pcmpgtqXrvm",
		"||pminsbXrvm",
		"||pminsdXrvm",
		"||pminuwXrvm",
		"||pminudXrvm",
		"||pmaxsbXrvm",
		"||pmaxsdXrvm",
		"||pmaxuwXrvm",
		"||pmaxudXrvm",
		"||pmulddXrvm",
		"||phminposuwXrm",
		nil,
		nil,
		nil,
		"||psrlvVSXrvm",
		"||psravdXrvm",
		"||psllvVSXrvm",
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		"||pbroadcastdXrlXm",
		"||pbroadcastqXrlXm",
		"||broadcasti128XrlXm",
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		"||pbroadcastbXrlXm",
		"||pbroadcastwXrlXm",
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		"||pmaskmovXrvVSm",
		nil,
		"||pmaskmovVSmXvr",
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		"||aesencXrvm",
		"||aesenclastXrvm",
		"||aesdecXrvm",
		"||aesdeclastXrvm",
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		"|||crc32TrBmt",
		"|||crc32TrVmt",
		nil,
		nil,
		nil,
		nil,
		nil,
		"| sarxVrmv| shlxVrmv| shrxVrmv"
	},
	["3a"] = {
		[0] = "||permqXrmu",
		"||permpdXrmu",
		"||pblenddXrvmu",
		nil,
		"||permilpsXrmu",
		"||permilpdXrmu",
		"||perm2f128Xrvmu",
		nil,
		"||roundpsXrmu",
		"||roundpdXrmu",
		"||roundssXrvmu",
		"||roundsdXrvmu",
		"||blendpsXrvmu",
		"||blendpdXrvmu",
		"||pblendwXrvmu",
		"palignrPrvmu",
		nil,
		nil,
		nil,
		nil,
		"||pextrbVmXru",
		"||pextrwVmXru",
		"||pextrVmSXru",
		"||extractpsVmXru",
		"||insertf128XrvlXmu",
		"||extractf128XlXmYru",
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		"||pinsrbXrvVmu",
		"||insertpsXrvmu",
		"||pinsrXrvVmuS",
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		"||inserti128Xrvmu",
		"||extracti128XlXmYru",
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		"||dppsXrvmu",
		"||dppdXrvmu",
		"||mpsadbwXrvmu",
		nil,
		"||pclmulqdqXrvmu",
		nil,
		"||perm2i128Xrvmu",
		nil,
		nil,
		nil,
		"||blendvpsXrvmb",
		"||blendvpdXrvmb",
		"||pblendvbXrvmb",
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		"||pcmpestrmXrmu",
		"||pcmpestriXrmu",
		"||pcmpistrmXrmu",
		"||pcmpistriXrmu",
		[223.0] = "||aeskeygenassistXrmu",
		[240.0] = "||| rorxVrmu"
	}
}
slot15 = {
	[217.0] = "vmmcall",
	[194.0] = "vmlaunch",
	[222.0] = "skinit",
	[201.0] = "mwait",
	[223.0] = "invlpga",
	[196.0] = "vmxoff",
	[220.0] = "stgi",
	[248.0] = "swapgs",
	[221.0] = "clgi",
	[249.0] = "rdtscp",
	[218.0] = "vmload",
	[193.0] = "vmcall",
	[219.0] = "vmsave",
	[200.0] = "monitor",
	[216.0] = "vmrun",
	[195.0] = "vmresume"
}
slot16 = {
	[0] = "faddFm",
	"fmulFm",
	"fcomFm",
	"fcompFm",
	"fsubFm",
	"fsubrFm",
	"fdivFm",
	"fdivrFm",
	"fldFm",
	nil,
	"fstFm",
	"fstpFm",
	"fldenvVm",
	"fldcwWm",
	"fnstenvVm",
	"fnstcwWm",
	"fiaddDm",
	"fimulDm",
	"ficomDm",
	"ficompDm",
	"fisubDm",
	"fisubrDm",
	"fidivDm",
	"fidivrDm",
	"fildDm",
	"fisttpDm",
	"fistDm",
	"fistpDm",
	nil,
	"fld twordFmp",
	nil,
	"fstp twordFmp",
	"faddGm",
	"fmulGm",
	"fcomGm",
	"fcompGm",
	"fsubGm",
	"fsubrGm",
	"fdivGm",
	"fdivrGm",
	"fldGm",
	"fisttpQm",
	"fstGm",
	"fstpGm",
	"frstorDmp",
	nil,
	"fnsaveDmp",
	"fnstswWm",
	"fiaddWm",
	"fimulWm",
	"ficomWm",
	"ficompWm",
	"fisubWm",
	"fisubrWm",
	"fidivWm",
	"fidivrWm",
	"fildWm",
	"fisttpWm",
	"fistWm",
	"fistpWm",
	"fbld twordFmp",
	"fildQm",
	"fbstp twordFmp",
	"fistpQm",
	"faddFf",
	"fmulFf",
	"fcomFf",
	"fcompFf",
	"fsubFf",
	"fsubrFf",
	"fdivFf",
	"fdivrFf",
	"fldFf",
	"fxchFf",
	{
		"fnop"
	},
	nil,
	{
		"fchs",
		"fabs",
		nil,
		nil,
		"ftst",
		"fxam"
	},
	{
		"fld1",
		"fldl2t",
		"fldl2e",
		"fldpi",
		"fldlg2",
		"fldln2",
		"fldz"
	},
	{
		"f2xm1",
		"fyl2x",
		"fptan",
		"fpatan",
		"fxtract",
		"fprem1",
		"fdecstp",
		"fincstp"
	},
	{
		"fprem",
		"fyl2xp1",
		"fsqrt",
		"fsincos",
		"frndint",
		"fscale",
		"fsin",
		"fcos"
	},
	"fcmovbFf",
	"fcmoveFf",
	"fcmovbeFf",
	"fcmovuFf",
	nil,
	{
		nil,
		"fucompp"
	},
	nil,
	nil,
	"fcmovnbFf",
	"fcmovneFf",
	"fcmovnbeFf",
	"fcmovnuFf",
	{
		nil,
		nil,
		"fnclex",
		"fninit"
	},
	"fucomiFf",
	"fcomiFf",
	nil,
	"fadd toFf",
	"fmul toFf",
	nil,
	nil,
	"fsub toFf",
	"fsubr toFf",
	"fdivr toFf",
	"fdiv toFf",
	"ffreeFf",
	nil,
	"fstFf",
	"fstpFf",
	"fucomFf",
	"fucompFf",
	nil,
	nil,
	"faddpFf",
	"fmulpFf",
	nil,
	{
		nil,
		"fcompp"
	},
	"fsubrpFf",
	"fsubpFf",
	"fdivrpFf",
	"fdivpFf",
	nil,
	nil,
	nil,
	nil,
	{
		"fnstsw ax"
	},
	"fucomipFf",
	"fcomipFf"
}
slot17 = {
	arith = {
		"add",
		"or",
		"adc",
		"sbb",
		"and",
		"sub",
		"xor",
		"cmp"
	},
	shift = {
		"rol",
		"ror",
		"rcl",
		"rcr",
		"shl",
		"shr",
		"sal",
		"sar"
	},
	testb = {
		"testBmi",
		"testBmi",
		"not",
		"neg",
		"mul",
		"imul",
		"div",
		"idiv"
	},
	testv = {
		"testVmi",
		"testVmi",
		"not",
		"neg",
		"mul",
		"imul",
		"div",
		"idiv"
	},
	incb = {
		"inc",
		"dec"
	},
	incd = {
		"inc",
		"dec",
		"callUmp",
		"$call farDmp",
		"jmpUmp",
		"$jmp farDmp",
		"pushUm"
	},
	sldt = {
		"sldt",
		"str",
		"lldt",
		"ltr",
		"verr",
		"verw"
	},
	sgdt = {
		"vm*$sgdt",
		"vm*$sidt",
		"$lgdt",
		"vm*$lidt",
		"smsw",
		nil,
		"lmsw",
		"vm*$invlpg"
	},
	bt = {
		nil,
		nil,
		nil,
		nil,
		"bt",
		"bts",
		"btr",
		"btc"
	},
	cmpxchg = {
		nil,
		"sz*,cmpxchg8bQmp,cmpxchg16bXmp",
		nil,
		nil,
		nil,
		nil,
		"vmptrld|vmxon|vmclear",
		"vmptrst"
	},
	pshiftw = {
		nil,
		nil,
		"psrlw",
		nil,
		"psraw",
		nil,
		"psllw"
	},
	pshiftd = {
		nil,
		nil,
		"psrld",
		nil,
		"psrad",
		nil,
		"pslld"
	},
	pshiftq = {
		nil,
		nil,
		"psrlq",
		nil,
		nil,
		nil,
		"psllq"
	},
	pshiftdq = {
		nil,
		nil,
		"psrlq",
		"psrldq",
		nil,
		nil,
		"psllq",
		"pslldq"
	},
	fxsave = {
		"$fxsave",
		"$fxrstor",
		"$ldmxcsr",
		"$stmxcsr",
		nil,
		"lfenceDp$",
		"mfenceDp$",
		"sfenceDp$clflush"
	},
	prefetch = {
		"prefetch",
		"prefetchw"
	},
	prefetcht = {
		"prefetchnta",
		"prefetcht0",
		"prefetcht1",
		"prefetcht2"
	}
}
slot18 = {
	B = {
		"al",
		"cl",
		"dl",
		"bl",
		"ah",
		"ch",
		"dh",
		"bh",
		"r8b",
		"r9b",
		"r10b",
		"r11b",
		"r12b",
		"r13b",
		"r14b",
		"r15b"
	},
	B64 = {
		"al",
		"cl",
		"dl",
		"bl",
		"spl",
		"bpl",
		"sil",
		"dil",
		"r8b",
		"r9b",
		"r10b",
		"r11b",
		"r12b",
		"r13b",
		"r14b",
		"r15b"
	},
	W = {
		"ax",
		"cx",
		"dx",
		"bx",
		"sp",
		"bp",
		"si",
		"di",
		"r8w",
		"r9w",
		"r10w",
		"r11w",
		"r12w",
		"r13w",
		"r14w",
		"r15w"
	},
	D = {
		"eax",
		"ecx",
		"edx",
		"ebx",
		"esp",
		"ebp",
		"esi",
		"edi",
		"r8d",
		"r9d",
		"r10d",
		"r11d",
		"r12d",
		"r13d",
		"r14d",
		"r15d"
	},
	Q = {
		"rax",
		"rcx",
		"rdx",
		"rbx",
		"rsp",
		"rbp",
		"rsi",
		"rdi",
		"r8",
		"r9",
		"r10",
		"r11",
		"r12",
		"r13",
		"r14",
		"r15"
	},
	M = {
		"mm0",
		"mm1",
		"mm2",
		"mm3",
		"mm4",
		"mm5",
		"mm6",
		"mm7",
		"mm0",
		"mm1",
		"mm2",
		"mm3",
		"mm4",
		"mm5",
		"mm6",
		"mm7"
	},
	X = {
		"xmm0",
		"xmm1",
		"xmm2",
		"xmm3",
		"xmm4",
		"xmm5",
		"xmm6",
		"xmm7",
		"xmm8",
		"xmm9",
		"xmm10",
		"xmm11",
		"xmm12",
		"xmm13",
		"xmm14",
		"xmm15"
	},
	Y = {
		"ymm0",
		"ymm1",
		"ymm2",
		"ymm3",
		"ymm4",
		"ymm5",
		"ymm6",
		"ymm7",
		"ymm8",
		"ymm9",
		"ymm10",
		"ymm11",
		"ymm12",
		"ymm13",
		"ymm14",
		"ymm15"
	}
}
slot19 = {
	"es",
	"cs",
	"ss",
	"ds",
	"fs",
	"gs",
	"segr6",
	"segr7"
}
slot20 = {
	X = 16,
	Y = 32,
	D = 4,
	W = 2,
	Q = 8,
	M = 8,
	B = 1
}
slot21 = {
	G = "qword",
	X = "xword",
	F = "dword",
	Y = "yword",
	Q = "qword",
	M = "qword",
	D = "dword",
	W = "word",
	B = "byte"
}

function slot22(slot0, slot1, slot2)
	slot3 = slot0.code
	slot4 = slot0.pos
	slot5 = ""

	if slot0.hexdump > 0 then
		for slot10 = slot0.start, slot4 - 1 do
			slot5 = slot5 .. uv0("%02X", uv1(slot3, slot10, slot10))
		end

		slot5 = slot6 < #slot5 and uv2(slot5, 1, slot6) .. ". " or slot5 .. uv3(" ", slot6 - #slot5 + 2)
	end

	if slot2 then
		slot1 = slot1 .. " " .. slot2
	end

	if slot0.o16 then
		slot1 = "o16 " .. slot1
		slot0.o16 = false
	end

	if slot0.a32 then
		slot1 = "a32 " .. slot1
		slot0.a32 = false
	end

	if slot0.rep then
		slot1 = slot0.rep .. " " .. slot1
		slot0.rep = false
	end

	if slot0.rex then
		if slot0.vexv and slot0.vexv ~= 0 then
			slot7 = (slot0.rexw and "w" or "") .. (slot0.rexr and "r" or "") .. (slot0.rexx and "x" or "") .. (slot0.rexb and "b" or "") .. (slot0.vexl and "l" or "") .. "v" .. slot0.vexv
		end

		if slot7 ~= "" then
			slot1 = slot0.rex .. "." .. slot7 .. " " .. uv4(slot1, "^ ", "")
		elseif slot0.rex == "vex" then
			slot1 = uv4("v" .. slot1, "^v ", "")
		end

		slot0.rexw = false
		slot0.rexr = false
		slot0.rexx = false
		slot0.rexb = false
		slot0.rex = false
		slot0.vexl = false
		slot0.vexv = false
	end

	if slot0.seg then
		slot7, slot8 = uv4(slot1, "%[", "[" .. slot0.seg .. ":")
		slot1 = slot8 == 0 and slot0.seg .. " " .. slot1 or slot7
		slot0.seg = false
	end

	if slot0.lock then
		slot1 = "lock " .. slot1
		slot0.lock = false
	end

	if slot0.imm and slot0.symtab[slot7] then
		slot1 = slot1 .. "\t->" .. slot8
	end

	slot0.out(uv0("%08x  %s%s\n", slot0.addr + slot0.start, slot5, slot1))

	slot0.mrm = false
	slot0.vexv = false
	slot0.start = slot4
	slot0.imm = nil
end

function slot23(slot0)
	slot0.o16 = false
	slot0.seg = false
	slot0.lock = false
	slot0.rep = false
	slot0.rexw = false
	slot0.rexr = false
	slot0.rexx = false
	slot0.rexb = false
	slot0.rex = false
	slot0.a32 = false
	slot0.vexl = false
end

function slot24(slot0)
	slot0.pos = slot0.stop + 1

	uv0(slot0)

	return uv1(slot0, "(incomplete)")
end

function slot25(slot0)
	uv0(slot0)

	return uv1(slot0, "(unknown)")
end

function slot26(slot0, slot1, slot2)
	if slot0.stop < slot1 + slot2 - 1 then
		return uv0(slot0)
	end

	if slot2 == 1 then
		return uv1(slot0.code, slot1, slot1)
	elseif slot2 == 2 then
		slot4, slot5 = uv1(slot3, slot1, slot1 + 1)

		return slot4 + slot5 * 256
	else
		slot4, slot5, slot6, slot7 = uv1(slot3, slot1, slot1 + 3)
		slot8 = slot4 + slot5 * 256 + slot6 * 65536 + slot7 * 16777216
		slot0.imm = slot8

		return slot8
	end
end

function slot27(slot0, slot1, slot2)
	slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11 = nil
	slot12 = slot0.code
	slot13 = slot0.pos
	slot14 = slot0.stop
	slot15 = slot0.vexl

	for slot19 in uv0(slot2, ".") do
		slot20 = nil

		if slot19 == "V" or slot19 == "U" then
			if slot0.rexw then
				slot5 = "Q"
				slot0.rexw = false
			elseif slot0.o16 then
				slot5 = "W"
				slot0.o16 = false
			else
				slot5 = slot19 == "U" and slot0.x64 and "Q" or "D"
			end

			slot4 = uv1[slot5]
		elseif slot19 == "T" then
			if slot0.rexw then
				slot5 = "Q"
				slot0.rexw = false
			else
				slot5 = "D"
			end

			slot4 = uv1[slot5]
		elseif slot19 == "B" then
			slot5 = "B"
			slot4 = slot0.rex and uv1.B64 or uv1.B
		elseif uv2(slot19, "[WDQMXYFG]") then
			if slot19 == "X" and slot15 then
				slot5 = "Y"
				slot0.vexl = false
			end

			slot4 = uv1[slot5]
		elseif slot19 == "P" then
			slot0.o16 = false

			if (slot0.o16 and "X" or "M") == "X" and slot15 then
				slot5 = "Y"
				slot0.vexl = false
			end

			slot4 = uv1[slot5]
		elseif slot19 == "S" then
			slot1 = slot1 .. uv3(slot5)
		elseif slot19 == "s" then
			if not uv4(slot0, slot13, 1) then
				return
			end

			slot20 = slot21 <= 127 and uv5("+0x%02x", slot21) or uv5("-0x%02x", 256 - slot21)
			slot13 = slot13 + 1
		elseif slot19 == "u" then
			if not uv4(slot0, slot13, 1) then
				return
			end

			slot20 = uv5("0x%02x", slot21)
			slot13 = slot13 + 1
		elseif slot19 == "b" then
			if not uv4(slot0, slot13, 1) then
				return
			end

			slot20 = slot4[slot21 / 16 + 1]
			slot13 = slot13 + 1
		elseif slot19 == "w" then
			if not uv4(slot0, slot13, 2) then
				return
			end

			slot20 = uv5("0x%x", slot21)
			slot13 = slot13 + 2
		elseif slot19 == "o" then
			if slot0.x64 then
				if not uv4(slot0, slot13, 4) then
					return
				end

				if not uv4(slot0, slot13 + 4, 4) then
					return
				end

				slot20 = uv5("[0x%08x%08x]", slot22, slot21)
				slot13 = slot13 + 8
			else
				if not uv4(slot0, slot13, 4) then
					return
				end

				slot20 = uv5("[0x%08x]", slot21)
				slot13 = slot13 + 4
			end
		elseif slot19 == "i" or slot19 == "I" then
			if uv6[slot5] == 8 and slot0.x64 and slot19 == "I" then
				if not uv4(slot0, slot13, 4) then
					return
				end

				if not uv4(slot0, slot13 + 4, 4) then
					return
				end

				slot20 = uv5("0x%08x%08x", slot23, slot22)
			else
				if slot21 == 8 then
					slot21 = 4
				end

				if not uv4(slot0, slot13, slot21) then
					return
				end

				slot20 = (slot5 ~= "Q" or slot22 >= 0 and slot22 <= 2147483647 or uv5(4294967296.0 - slot22 > 65535 and "-0x%08x" or "-0x%x", slot22)) and uv5(slot22 > 65535 and "0x%08x" or "0x%x", slot22)
			end

			slot13 = slot13 + slot21
		elseif slot19 == "j" then
			if uv6[slot5] == 8 then
				slot21 = 4
			end

			if not uv4(slot0, slot13, slot21) then
				return
			end

			if slot5 == "B" and slot22 > 127 then
				slot22 = slot22 - 256
			elseif slot22 > 2147483647 then
				slot22 = slot22 - 4294967296.0
			end

			if slot22 + slot13 + slot21 + slot0.addr > 4294967295.0 and not slot0.x64 then
				slot22 = slot22 - 4294967296.0
			end

			slot0.imm = slot22

			if slot5 == "W" then
				slot20 = uv5("word 0x%04x", slot22 % 65536)
			elseif slot0.x64 then
				slot23 = slot22 % 16777216
				slot20 = uv5("0x%02x%06x", (slot22 - slot23) / 16777216, slot23)
			else
				slot20 = "0x" .. uv7(slot22)
			end
		elseif slot19 == "R" then
			if slot0.rexb then
				slot21 = uv8(slot12, slot13 - 1, slot13 - 1) % 8 + 8
				slot0.rexb = false
			end

			slot20 = slot4[slot21 + 1]
		elseif slot19 == "a" then
			slot20 = slot4[1]
		elseif slot19 == "c" then
			slot20 = "cl"
		elseif slot19 == "d" then
			slot20 = "dx"
		elseif slot19 == "1" then
			slot20 = "1"
		else
			if not slot6 then
				if not slot0.mrm then
					if slot14 < slot13 then
						return uv9(slot0)
					end

					slot6 = uv8(slot12, slot13, slot13)
					slot13 = slot13 + 1
				end

				slot6 = (slot6 - slot6 % 8) / 8
				slot11 = ""

				if (slot6 - slot6 % 8) / 8 < 3 then
					if slot8 == 4 then
						if slot14 < slot13 then
							return uv9(slot0)
						end

						slot9 = uv8(slot12, slot13, slot13)
						slot13 = slot13 + 1
						slot9 = (slot9 - slot9 % 8) / 8
						slot9 = (slot9 - slot9 % 8) / 8

						if slot0.rexx then
							slot10 = slot10 + 8
							slot0.rexx = false
						end

						if slot10 == 4 then
							slot10 = nil
						end
					end

					if slot6 > 0 or slot8 == 5 then
						if slot6 ~= 1 then
							slot21 = 4
						end

						if not uv4(slot0, slot13, slot21) then
							return
						end

						if slot6 == 0 then
							slot8 = nil
						end

						slot13 = slot13 + slot21
					end
				end

				if slot8 and slot0.rexb then
					slot8 = slot8 + 8
					slot0.rexb = false
				end

				if slot0.rexr then
					slot7 = slot7 + 8
					slot0.rexr = false
				end
			end

			if slot19 == "m" then
				if slot6 == 3 then
					slot20 = slot4[slot8 + 1]
				else
					slot22 = ""
					slot23 = ""

					if slot8 then
						slot22 = (slot0.a32 and uv1.D or slot0.aregs)[slot8 + 1]
					elseif not slot9 and slot0.x64 and not slot0.a32 then
						slot22 = "rip"
					end

					slot0.a32 = false

					if slot10 then
						if slot8 then
							slot22 = slot22 .. "+"
						end

						if slot9 > 0 then
							slot23 = slot21[slot10 + 1] .. "*" .. 2^slot9
						end
					end

					slot20 = uv5("[%s%s%s]", slot22, slot23, slot11)
				end

				if slot6 < 3 and (not uv2(slot2, "[aRrgp]") or uv2(slot2, "t")) then
					slot20 = uv10[slot5] .. " " .. slot20
				end
			elseif slot19 == "r" then
				slot20 = slot4[slot7 + 1]
			elseif slot19 == "g" then
				slot20 = uv11[slot7 + 1]
			elseif slot19 == "p" then
				-- Nothing
			elseif slot19 == "f" then
				slot20 = "st" .. slot8
			elseif slot19 == "x" then
				if slot7 == 0 and slot0.lock and not slot0.x64 then
					slot20 = "CR8"
					slot0.lock = false
				else
					slot20 = "CR" .. slot7
				end
			elseif slot19 == "v" then
				if slot0.vexv then
					slot20 = slot4[slot0.vexv + 1]
					slot0.vexv = false
				end
			elseif slot19 == "y" then
				slot20 = "DR" .. slot7
			elseif slot19 == "z" then
				slot20 = "TR" .. slot7
			elseif slot19 == "l" then
				slot15 = false
			elseif slot19 ~= "t" then
				error("bad pattern `" .. slot2 .. "'")
			end
		end

		if slot20 then
			slot3 = slot3 and slot3 .. ", " .. slot20 or slot20
		end
	end

	slot0.pos = slot13

	return uv12(slot0, slot1, slot3)
end

slot28 = nil

function slot29(slot0)
	if not slot0.mrm then
		if slot0.stop < slot0.pos then
			return nil
		end

		slot0.pos = slot2 + 1
		slot0.mrm = uv0(slot0.code, slot2, slot2)
	end

	return slot1
end

function slot30(slot0, slot1, slot2)
	if not slot1 then
		return uv0(slot0)
	end

	if uv1(slot1, "%|") then
		slot3 = nil

		if slot0.rep then
			slot3 = slot0.rep == "rep" and "%|([^%|]*)" or "%|[^%|]*%|[^%|]*%|([^%|]*)"
			slot0.rep = false
		elseif slot0.o16 then
			slot3 = "%|[^%|]*%|([^%|]*)"
			slot0.o16 = false
		else
			slot3 = "^[^%|]*"
		end

		if not uv1(slot1, slot3) then
			return uv0(slot0)
		end
	end

	if uv1(slot1, "%$") then
		if not uv2(slot0) then
			return uv3(slot0)
		end

		if uv1(slot1, slot3 >= 192 and "^[^%$]*" or "%$(.*)") == "" then
			return uv0(slot0)
		end
	end

	if slot1 == "" then
		return uv0(slot0)
	end

	slot3, slot4 = uv1(slot1, "^([a-z0-9 ]*)(.*)")

	if slot4 == "" and slot2 then
		slot4 = slot2
	end

	return uv4[uv5(slot4, 1, 1)](slot0, slot3, slot4)
end

function slot31(slot0, slot1)
	slot2 = slot0.pos
	slot0.pos = slot2 + 1

	return uv1(slot0, slot1[uv0(slot0.code, slot2, slot2)])
end

slot28 = {
	[""] = function (slot0, slot1, slot2)
		return uv0(slot0, slot1)
	end,
	B = slot27,
	W = slot27,
	D = slot27,
	Q = slot27,
	V = slot27,
	U = slot27,
	T = slot27,
	M = slot27,
	X = slot27,
	P = slot27,
	F = slot27,
	G = slot27,
	Y = slot27,
	[":"] = function (slot0, slot1, slot2)
		slot0[slot2 == ":" and slot1 or uv0(slot2, 2)] = slot1

		if slot0.pos - slot0.start > 5 then
			return uv1(slot0)
		end
	end,
	["*"] = function (slot0, slot1, slot2)
		return uv0[slot1](slot0, slot1, uv1(slot2, 2))
	end,
	["!"] = function (slot0, slot1, slot2)
		if not uv0(slot0) then
			return uv1(slot0)
		end

		return uv2(slot0, uv3[slot1][(slot3 - slot3 % 8) / 8 % 8 + 1], uv4(slot2, 2))
	end,
	sz = function (slot0, slot1, slot2)
		if slot0.o16 then
			slot0.o16 = false
		elseif slot0.rexw and uv0(uv0(slot2, ",(.*)"), ",(.*)") then
			slot2 = slot3
			slot0.rexw = false
		end

		return uv1(slot0, uv0(slot2, "^[^,]*"))
	end,
	opc2 = function (slot0, slot1, slot2)
		return uv0(slot0, uv1)
	end,
	opc3 = function (slot0, slot1, slot2)
		return uv0(slot0, uv1[slot2])
	end,
	vm = function (slot0, slot1, slot2)
		return uv0(slot0, uv1[slot0.mrm])
	end,
	fp = function (slot0, slot1, slot2)
		if not uv0(slot0) then
			return uv1(slot0)
		end

		if slot3 >= 192 then
			slot5 = slot2 * 8 + (slot3 - slot3 % 8) / 8 % 8 + 64
		end

		if uv3(uv2[slot5]) == "table" then
			slot6 = slot6[slot4 + 1]
		end

		return uv4(slot0, slot6)
	end,
	rex = function (slot0, slot1, slot2)
		if slot0.rex then
			return uv0(slot0)
		end

		for slot6 in uv1(slot2, ".") do
			slot0["rex" .. slot6] = true
		end

		slot0.rex = "rex"
	end,
	vex = function (slot0, slot1, slot2)
		if slot0.rex then
			return uv0(slot0)
		end

		slot0.rex = "vex"

		if slot0.mrm then
			slot0.mrm = nil
			slot3 = slot0.pos - 1
		end

		if not uv1(slot0.code, slot3, slot3) then
			return uv2(slot0)
		end

		slot3 = slot3 + 1

		if slot4 < 128 then
			slot0.rexr = true
		end

		slot5 = 1

		if slot2 == "3" then
			slot4 = (slot4 - slot4 % 32) / 32
			slot6 = slot4 % 2
			slot4 = (slot4 - slot6) / 2

			if slot6 == 0 then
				slot0.rexb = true
			end

			if slot4 % 2 == 0 then
				slot0.rexx = true
			end

			if not uv1(slot0.code, slot3, slot3) then
				return uv2(slot0)
			end

			slot3 = slot3 + 1

			if slot4 >= 128 then
				slot0.rexw = true
			end
		end

		slot0.pos = slot3
		slot6 = nil

		if slot5 == 1 then
			slot6 = uv3
		elseif slot5 == 2 then
			slot6 = uv4["38"]
		elseif slot5 == 3 then
			slot6 = uv4["3a"]
		else
			return uv0(slot0)
		end

		slot7 = slot4 % 4
		slot4 = (slot4 - slot7) / 4

		if slot7 == 1 then
			slot0.o16 = "o16"
		elseif slot7 == 2 then
			slot0.rep = "rep"
		elseif slot7 == 3 then
			slot0.rep = "repne"
		end

		slot8 = slot4 % 2
		slot4 = (slot4 - slot8) / 2

		if slot8 ~= 0 then
			slot0.vexl = true
		end

		slot0.vexv = (-1 - slot4) % 16

		return uv5(slot0, slot6)
	end,
	nop = function (slot0, slot1, slot2)
		return uv0(slot0, slot0.rex and slot2 or "nop")
	end,
	emms = function (slot0, slot1, slot2)
		if slot0.rex ~= "vex" then
			return uv0(slot0, "emms")
		elseif slot0.vexl then
			slot0.vexl = false

			return uv0(slot0, "zeroall")
		else
			return uv0(slot0, "zeroupper")
		end
	end
}

function slot32(slot0, slot1, slot2)
	slot1 = (slot1 or 0) + 1
	slot0.start = slot1
	slot0.pos = slot1
	slot0.stop = slot2 and slot1 + slot2 or #slot0.code
	slot0.imm = nil
	slot0.mrm = false

	uv0(slot0)

	while slot0.pos <= slot3 do
		uv1(slot0, slot0.map1)
	end

	if slot0.pos ~= slot0.start then
		uv2(slot0)
	end
end

return {
	create = function (slot0, slot1, slot2)
		return {
			code = slot0,
			addr = (slot1 or 0) - 1,
			out = slot2 or io.write,
			symtab = {},
			disass = uv0,
			hexdump = 16,
			x64 = false,
			map1 = uv1,
			aregs = uv2.D
		}
	end,
	create64 = function (slot0, slot1, slot2)
		slot3 = uv0(slot0, slot1, slot2)
		slot3.x64 = true
		slot3.map1 = uv1
		slot3.aregs = uv2.Q

		return slot3
	end,
	disass = function (slot0, slot1, slot2)
		uv0(slot0, slot1, slot2):disass()
	end,
	disass64 = function (slot0, slot1, slot2)
		uv0(slot0, slot1, slot2):disass()
	end,
	regname = function (slot0)
		if slot0 < 8 then
			return uv0.D[slot0 + 1]
		end

		return uv0.X[slot0 - 7]
	end,
	regname64 = function (slot0)
		if slot0 < 16 then
			return uv0.Q[slot0 + 1]
		end

		return uv0.X[slot0 - 15]
	end
}
