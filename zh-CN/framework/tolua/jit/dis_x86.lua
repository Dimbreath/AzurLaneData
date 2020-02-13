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
	38 = {
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
	3a = {
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
		for slot10 = slot0.start, slot4 - 1, 1 do
			slot5 = slot5 .. slot0("%02X", slot1(slot3, slot10, slot10))
		end

		slot5 = (slot6 < #slot5 and slot2(slot5, 1, slot6) .. ". ") or slot5 .. slot3(" ", slot6 - #slot5 + 2)
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
		slot7 = (slot0.rexw and "w") or ""
		slot7 = slot7 .. ((slot0.rexr and "r") or "") .. ((slot0.rexx and "x") or "") .. ((slot0.rexb and "b") or "") .. ((slot0.vexl and "l") or "")

		if slot0.vexv and slot0.vexv ~= 0 then
			slot7 = slot7 .. "v" .. slot0.vexv
		end

		if slot7 ~= "" then
			slot1 = slot0.rex .. "." .. slot7 .. " " .. slot4(slot1, "^ ", "")
		elseif slot0.rex == "vex" then
			slot1 = slot4("v" .. slot1, "^v ", "")
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
		slot7, slot8 = slot4(slot1, "%[", "[" .. slot0.seg .. ":")
		slot1 = (slot8 == 0 and slot0.seg .. " " .. slot1) or slot7
		slot0.seg = false
	end

	if slot0.lock then
		slot1 = "lock " .. slot1
		slot0.lock = false
	end

	if slot0.imm and slot0.symtab[slot7] then
		slot1 = slot1 .. "\t->" .. slot8
	end

	slot0.out(slot0("%08x  %s%s\n", slot0.addr + slot0.start, slot5, slot1))

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

	slot0(slot0)

	return slot0(slot0, "(incomplete)")
end

function slot25(slot0)
	slot0(slot0)

	return slot0(slot0, "(unknown)")
end

function slot26(slot0, slot1, slot2)
	if slot0.stop < (slot1 + slot2) - 1 then
		return slot0(slot0)
	end

	slot3 = slot0.code

	if slot2 == 1 then
		return slot1(slot3, slot1, slot1)
	elseif slot2 == 2 then
		slot4, slot5 = slot1(slot3, slot1, slot1 + 1)

		return slot4 + slot5 * 256
	else
		slot4, slot5, slot6, slot7 = slot1(slot3, slot1, slot1 + 3)
		slot0.imm = slot4 + slot5 * 256 + slot6 * 65536 + slot7 * 16777216

		return slot4 + slot5 * 256 + slot6 * 65536 + slot7 * 16777216
	end
end

slot28 = nil

function slot29(slot0)
	if not slot0.mrm then
		if slot0.stop < slot0.pos then
			return nil
		end

		slot0.pos = slot2 + 1
		slot0.mrm = slot0(slot0.code, slot2, slot2)
	end

	return slot1
end

function slot30(slot0, slot1, slot2)
	if not slot1 then
		return slot0(slot0)
	end

	if slot1(slot1, "%|") then
		slot3 = nil

		if slot0.rep then
			slot3 = (slot0.rep == "rep" and "%|([^%|]*)") or "%|[^%|]*%|[^%|]*%|([^%|]*)"
			slot0.rep = false
		elseif slot0.o16 then
			slot3 = "%|[^%|]*%|([^%|]*)"
			slot0.o16 = false
		else
			slot3 = "^[^%|]*"
		end

		if not slot1(slot1, slot3) then
			return slot0(slot0)
		end
	end

	if slot1(slot1, "%$") then
		if not slot2(slot0) then
			return slot3(slot0)
		end

		if slot1(slot1, (slot3 >= 192 and "^[^%$]*") or "%$(.*)") == "" then
			return slot0(slot0)
		end
	end

	if slot1 == "" then
		return slot0(slot0)
	end

	slot3, slot4 = slot1(slot1, "^([a-z0-9 ]*)(.*)")

	if slot4 == "" and slot2 then
		slot4 = slot2
	end

	return slot4[slot5(slot4, 1, 1)](slot0, slot3, slot4)
end

function slot31(slot0, slot1)
	slot0.pos = slot0.pos + 1

	return slot1(slot0, slot1[slot0(slot0.code, slot0.pos, )])
end

slot28 = {
	[""] = function (slot0, slot1, slot2)
		return slot0(slot0, slot1)
	end,
	B = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11 = nil
		slot12 = slot0.code
		slot13 = slot0.pos
		slot14 = slot0.stop
		slot15 = slot0.vexl

		for slot19 in slot0(slot2, ".") do
			slot20 = nil

			if slot19 == "V" or slot19 == "U" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				elseif slot0.o16 then
					slot5 = "W"
					slot0.o16 = false
				else
					slot4 = slot1[(slot19 == "U" and slot0.x64 and "Q") or "D"]
				end
			elseif slot19 == "T" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				else
					slot5 = "D"
				end

				slot4 = slot1[slot5]
			elseif slot19 == "B" then
				slot5 = "B"
				slot4 = (slot0.rex and slot1.B64) or slot1.B
			elseif slot2(slot19, "[WDQMXYFG]") then
				if slot19 == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "P" then
				slot0.o16 = false

				if ((slot0.o16 and "X") or "M") == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "S" then
				slot1 = slot1 .. slot3(slot5)
			elseif slot19 == "s" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = (slot21 <= 127 and slot5("+0x%02x", slot21)) or slot5("-0x%02x", 256 - slot21)
				slot13 = slot13 + 1
			elseif slot19 == "u" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot5("0x%02x", slot21)
				slot13 = slot13 + 1
			elseif slot19 == "b" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot4[slot21 / 16 + 1]
				slot13 = slot13 + 1
			elseif slot19 == "w" then
				if not slot4(slot0, slot13, 2) then
					return
				end

				slot20 = slot5("0x%x", slot21)
				slot13 = slot13 + 2
			elseif slot19 == "o" then
				if slot0.x64 then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("[0x%08x%08x]", slot22, slot21)
					slot13 = slot13 + 8
				else
					if not slot4(slot0, slot13, 4) then
						return
					end

					slot20 = slot5("[0x%08x]", slot21)
					slot13 = slot13 + 4
				end
			elseif slot19 == "i" or slot19 == "I" then
				if slot6[slot5] == 8 and slot0.x64 and slot19 == "I" then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("0x%08x%08x", slot23, slot22)
				else
					if slot21 == 8 then
						slot21 = 4
					end

					if not slot4(slot0, slot13, slot21) then
						return
					end

					slot20 = (slot5 ~= "Q" or (slot22 >= 0 and slot22 <= 2147483647) or false) and false
					slot13 = slot13 + slot21
				end
			elseif slot19 == "j" then
				if slot6[slot5] == 8 then
					slot21 = 4
				end

				if not slot4(slot0, slot13, slot21) then
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
					slot20 = slot5("word 0x%04x", slot22 % 65536)
				elseif slot0.x64 then
					slot20 = slot5("0x%02x%06x", (slot22 - slot22 % 16777216) / 16777216, slot22 % 16777216)
				else
					slot20 = "0x" .. slot7(slot22)
				end
			elseif slot19 == "R" then
				slot21 = slot8(slot12, slot13 - 1, slot13 - 1) % 8

				if slot0.rexb then
					slot21 = slot21 + 8
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
							return slot9(slot0)
						end

						slot6 = slot8(slot12, slot13, slot13)
						slot13 = slot13 + 1
					end

					slot11 = ""

					if ((slot6 - slot6 % 8) / 8 - ((slot6 - slot6 % 8) / 8) % 8) / 8 < 3 then
						if slot8 == 4 then
							if slot14 < slot13 then
								return slot9(slot0)
							end

							slot13 = slot13 + 1
							slot9 = ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8 - ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8) % 8) / 8

							if slot0.rexx then
								slot10 = slot10 + 8
								slot0.rexx = false
							end

							if slot10 == 4 then
								slot10 = nil
							end
						end

						if slot6 > 0 or slot8 == 5 then

							-- Decompilation error in this vicinity:
							if slot6 ~= 1 then
								slot21 = 4
							end

							if not slot4(slot0, slot13, slot21) then
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
						slot21 = (slot0.a32 and slot1.D) or slot0.aregs
						slot22 = ""
						slot23 = ""

						if slot8 then
							slot22 = slot21[slot8 + 1]
						elseif not slot9 and slot0.x64 and not slot0.a32 then
							slot22 = "rip"
						end

						slot0.a32 = false

						if slot10 then
							if slot8 then
								slot22 = slot22 .. "+"
							end

							slot23 = slot21[slot10 + 1]

							if slot9 > 0 then
								slot23 = slot23 .. "*" .. 2^slot9
							end
						end

						slot20 = slot5("[%s%s%s]", slot22, slot23, slot11)
					end

					if slot6 < 3 and (not slot2(slot2, "[aRrgp]") or slot2(slot2, "t")) then
						slot20 = slot10[slot5] .. " " .. slot20
					end
				elseif slot19 == "r" then
					slot20 = slot4[slot7 + 1]
				elseif slot19 == "g" then
					slot20 = slot11[slot7 + 1]
				elseif slot19 == "p" then
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
				elseif slot19 == "t" then
				else
					error("bad pattern `" .. slot2 .. "'")
				end
			end

			if slot20 then
				slot3 = (slot3 and slot3 .. ", " .. slot20) or slot20
			end
		end

		slot0.pos = slot13

		return slot12(slot0, slot1, slot3)
	end,
	W = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11 = nil
		slot12 = slot0.code
		slot13 = slot0.pos
		slot14 = slot0.stop
		slot15 = slot0.vexl

		for slot19 in slot0(slot2, ".") do
			slot20 = nil

			if slot19 == "V" or slot19 == "U" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				elseif slot0.o16 then
					slot5 = "W"
					slot0.o16 = false
				else
					slot4 = slot1[(slot19 == "U" and slot0.x64 and "Q") or "D"]
				end
			elseif slot19 == "T" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				else
					slot5 = "D"
				end

				slot4 = slot1[slot5]
			elseif slot19 == "B" then
				slot5 = "B"
				slot4 = (slot0.rex and slot1.B64) or slot1.B
			elseif slot2(slot19, "[WDQMXYFG]") then
				if slot19 == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "P" then
				slot0.o16 = false

				if ((slot0.o16 and "X") or "M") == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "S" then
				slot1 = slot1 .. slot3(slot5)
			elseif slot19 == "s" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = (slot21 <= 127 and slot5("+0x%02x", slot21)) or slot5("-0x%02x", 256 - slot21)
				slot13 = slot13 + 1
			elseif slot19 == "u" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot5("0x%02x", slot21)
				slot13 = slot13 + 1
			elseif slot19 == "b" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot4[slot21 / 16 + 1]
				slot13 = slot13 + 1
			elseif slot19 == "w" then
				if not slot4(slot0, slot13, 2) then
					return
				end

				slot20 = slot5("0x%x", slot21)
				slot13 = slot13 + 2
			elseif slot19 == "o" then
				if slot0.x64 then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("[0x%08x%08x]", slot22, slot21)
					slot13 = slot13 + 8
				else
					if not slot4(slot0, slot13, 4) then
						return
					end

					slot20 = slot5("[0x%08x]", slot21)
					slot13 = slot13 + 4
				end
			elseif slot19 == "i" or slot19 == "I" then
				if slot6[slot5] == 8 and slot0.x64 and slot19 == "I" then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("0x%08x%08x", slot23, slot22)
				else
					if slot21 == 8 then
						slot21 = 4
					end

					if not slot4(slot0, slot13, slot21) then
						return
					end

					slot20 = (slot5 ~= "Q" or (slot22 >= 0 and slot22 <= 2147483647) or false) and false
					slot13 = slot13 + slot21
				end
			elseif slot19 == "j" then
				if slot6[slot5] == 8 then
					slot21 = 4
				end

				if not slot4(slot0, slot13, slot21) then
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
					slot20 = slot5("word 0x%04x", slot22 % 65536)
				elseif slot0.x64 then
					slot20 = slot5("0x%02x%06x", (slot22 - slot22 % 16777216) / 16777216, slot22 % 16777216)
				else
					slot20 = "0x" .. slot7(slot22)
				end
			elseif slot19 == "R" then
				slot21 = slot8(slot12, slot13 - 1, slot13 - 1) % 8

				if slot0.rexb then
					slot21 = slot21 + 8
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
							return slot9(slot0)
						end

						slot6 = slot8(slot12, slot13, slot13)
						slot13 = slot13 + 1
					end

					slot11 = ""

					if ((slot6 - slot6 % 8) / 8 - ((slot6 - slot6 % 8) / 8) % 8) / 8 < 3 then
						if slot8 == 4 then
							if slot14 < slot13 then
								return slot9(slot0)
							end

							slot13 = slot13 + 1
							slot9 = ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8 - ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8) % 8) / 8

							if slot0.rexx then
								slot10 = slot10 + 8
								slot0.rexx = false
							end

							if slot10 == 4 then
								slot10 = nil
							end
						end

						if slot6 > 0 or slot8 == 5 then

							-- Decompilation error in this vicinity:
							if slot6 ~= 1 then
								slot21 = 4
							end

							if not slot4(slot0, slot13, slot21) then
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
						slot21 = (slot0.a32 and slot1.D) or slot0.aregs
						slot22 = ""
						slot23 = ""

						if slot8 then
							slot22 = slot21[slot8 + 1]
						elseif not slot9 and slot0.x64 and not slot0.a32 then
							slot22 = "rip"
						end

						slot0.a32 = false

						if slot10 then
							if slot8 then
								slot22 = slot22 .. "+"
							end

							slot23 = slot21[slot10 + 1]

							if slot9 > 0 then
								slot23 = slot23 .. "*" .. 2^slot9
							end
						end

						slot20 = slot5("[%s%s%s]", slot22, slot23, slot11)
					end

					if slot6 < 3 and (not slot2(slot2, "[aRrgp]") or slot2(slot2, "t")) then
						slot20 = slot10[slot5] .. " " .. slot20
					end
				elseif slot19 == "r" then
					slot20 = slot4[slot7 + 1]
				elseif slot19 == "g" then
					slot20 = slot11[slot7 + 1]
				elseif slot19 == "p" then
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
				elseif slot19 == "t" then
				else
					error("bad pattern `" .. slot2 .. "'")
				end
			end

			if slot20 then
				slot3 = (slot3 and slot3 .. ", " .. slot20) or slot20
			end
		end

		slot0.pos = slot13

		return slot12(slot0, slot1, slot3)
	end,
	D = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11 = nil
		slot12 = slot0.code
		slot13 = slot0.pos
		slot14 = slot0.stop
		slot15 = slot0.vexl

		for slot19 in slot0(slot2, ".") do
			slot20 = nil

			if slot19 == "V" or slot19 == "U" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				elseif slot0.o16 then
					slot5 = "W"
					slot0.o16 = false
				else
					slot4 = slot1[(slot19 == "U" and slot0.x64 and "Q") or "D"]
				end
			elseif slot19 == "T" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				else
					slot5 = "D"
				end

				slot4 = slot1[slot5]
			elseif slot19 == "B" then
				slot5 = "B"
				slot4 = (slot0.rex and slot1.B64) or slot1.B
			elseif slot2(slot19, "[WDQMXYFG]") then
				if slot19 == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "P" then
				slot0.o16 = false

				if ((slot0.o16 and "X") or "M") == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "S" then
				slot1 = slot1 .. slot3(slot5)
			elseif slot19 == "s" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = (slot21 <= 127 and slot5("+0x%02x", slot21)) or slot5("-0x%02x", 256 - slot21)
				slot13 = slot13 + 1
			elseif slot19 == "u" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot5("0x%02x", slot21)
				slot13 = slot13 + 1
			elseif slot19 == "b" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot4[slot21 / 16 + 1]
				slot13 = slot13 + 1
			elseif slot19 == "w" then
				if not slot4(slot0, slot13, 2) then
					return
				end

				slot20 = slot5("0x%x", slot21)
				slot13 = slot13 + 2
			elseif slot19 == "o" then
				if slot0.x64 then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("[0x%08x%08x]", slot22, slot21)
					slot13 = slot13 + 8
				else
					if not slot4(slot0, slot13, 4) then
						return
					end

					slot20 = slot5("[0x%08x]", slot21)
					slot13 = slot13 + 4
				end
			elseif slot19 == "i" or slot19 == "I" then
				if slot6[slot5] == 8 and slot0.x64 and slot19 == "I" then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("0x%08x%08x", slot23, slot22)
				else
					if slot21 == 8 then
						slot21 = 4
					end

					if not slot4(slot0, slot13, slot21) then
						return
					end

					slot20 = (slot5 ~= "Q" or (slot22 >= 0 and slot22 <= 2147483647) or false) and false
					slot13 = slot13 + slot21
				end
			elseif slot19 == "j" then
				if slot6[slot5] == 8 then
					slot21 = 4
				end

				if not slot4(slot0, slot13, slot21) then
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
					slot20 = slot5("word 0x%04x", slot22 % 65536)
				elseif slot0.x64 then
					slot20 = slot5("0x%02x%06x", (slot22 - slot22 % 16777216) / 16777216, slot22 % 16777216)
				else
					slot20 = "0x" .. slot7(slot22)
				end
			elseif slot19 == "R" then
				slot21 = slot8(slot12, slot13 - 1, slot13 - 1) % 8

				if slot0.rexb then
					slot21 = slot21 + 8
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
							return slot9(slot0)
						end

						slot6 = slot8(slot12, slot13, slot13)
						slot13 = slot13 + 1
					end

					slot11 = ""

					if ((slot6 - slot6 % 8) / 8 - ((slot6 - slot6 % 8) / 8) % 8) / 8 < 3 then
						if slot8 == 4 then
							if slot14 < slot13 then
								return slot9(slot0)
							end

							slot13 = slot13 + 1
							slot9 = ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8 - ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8) % 8) / 8

							if slot0.rexx then
								slot10 = slot10 + 8
								slot0.rexx = false
							end

							if slot10 == 4 then
								slot10 = nil
							end
						end

						if slot6 > 0 or slot8 == 5 then

							-- Decompilation error in this vicinity:
							if slot6 ~= 1 then
								slot21 = 4
							end

							if not slot4(slot0, slot13, slot21) then
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
						slot21 = (slot0.a32 and slot1.D) or slot0.aregs
						slot22 = ""
						slot23 = ""

						if slot8 then
							slot22 = slot21[slot8 + 1]
						elseif not slot9 and slot0.x64 and not slot0.a32 then
							slot22 = "rip"
						end

						slot0.a32 = false

						if slot10 then
							if slot8 then
								slot22 = slot22 .. "+"
							end

							slot23 = slot21[slot10 + 1]

							if slot9 > 0 then
								slot23 = slot23 .. "*" .. 2^slot9
							end
						end

						slot20 = slot5("[%s%s%s]", slot22, slot23, slot11)
					end

					if slot6 < 3 and (not slot2(slot2, "[aRrgp]") or slot2(slot2, "t")) then
						slot20 = slot10[slot5] .. " " .. slot20
					end
				elseif slot19 == "r" then
					slot20 = slot4[slot7 + 1]
				elseif slot19 == "g" then
					slot20 = slot11[slot7 + 1]
				elseif slot19 == "p" then
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
				elseif slot19 == "t" then
				else
					error("bad pattern `" .. slot2 .. "'")
				end
			end

			if slot20 then
				slot3 = (slot3 and slot3 .. ", " .. slot20) or slot20
			end
		end

		slot0.pos = slot13

		return slot12(slot0, slot1, slot3)
	end,
	Q = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11 = nil
		slot12 = slot0.code
		slot13 = slot0.pos
		slot14 = slot0.stop
		slot15 = slot0.vexl

		for slot19 in slot0(slot2, ".") do
			slot20 = nil

			if slot19 == "V" or slot19 == "U" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				elseif slot0.o16 then
					slot5 = "W"
					slot0.o16 = false
				else
					slot4 = slot1[(slot19 == "U" and slot0.x64 and "Q") or "D"]
				end
			elseif slot19 == "T" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				else
					slot5 = "D"
				end

				slot4 = slot1[slot5]
			elseif slot19 == "B" then
				slot5 = "B"
				slot4 = (slot0.rex and slot1.B64) or slot1.B
			elseif slot2(slot19, "[WDQMXYFG]") then
				if slot19 == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "P" then
				slot0.o16 = false

				if ((slot0.o16 and "X") or "M") == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "S" then
				slot1 = slot1 .. slot3(slot5)
			elseif slot19 == "s" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = (slot21 <= 127 and slot5("+0x%02x", slot21)) or slot5("-0x%02x", 256 - slot21)
				slot13 = slot13 + 1
			elseif slot19 == "u" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot5("0x%02x", slot21)
				slot13 = slot13 + 1
			elseif slot19 == "b" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot4[slot21 / 16 + 1]
				slot13 = slot13 + 1
			elseif slot19 == "w" then
				if not slot4(slot0, slot13, 2) then
					return
				end

				slot20 = slot5("0x%x", slot21)
				slot13 = slot13 + 2
			elseif slot19 == "o" then
				if slot0.x64 then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("[0x%08x%08x]", slot22, slot21)
					slot13 = slot13 + 8
				else
					if not slot4(slot0, slot13, 4) then
						return
					end

					slot20 = slot5("[0x%08x]", slot21)
					slot13 = slot13 + 4
				end
			elseif slot19 == "i" or slot19 == "I" then
				if slot6[slot5] == 8 and slot0.x64 and slot19 == "I" then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("0x%08x%08x", slot23, slot22)
				else
					if slot21 == 8 then
						slot21 = 4
					end

					if not slot4(slot0, slot13, slot21) then
						return
					end

					slot20 = (slot5 ~= "Q" or (slot22 >= 0 and slot22 <= 2147483647) or false) and false
					slot13 = slot13 + slot21
				end
			elseif slot19 == "j" then
				if slot6[slot5] == 8 then
					slot21 = 4
				end

				if not slot4(slot0, slot13, slot21) then
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
					slot20 = slot5("word 0x%04x", slot22 % 65536)
				elseif slot0.x64 then
					slot20 = slot5("0x%02x%06x", (slot22 - slot22 % 16777216) / 16777216, slot22 % 16777216)
				else
					slot20 = "0x" .. slot7(slot22)
				end
			elseif slot19 == "R" then
				slot21 = slot8(slot12, slot13 - 1, slot13 - 1) % 8

				if slot0.rexb then
					slot21 = slot21 + 8
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
							return slot9(slot0)
						end

						slot6 = slot8(slot12, slot13, slot13)
						slot13 = slot13 + 1
					end

					slot11 = ""

					if ((slot6 - slot6 % 8) / 8 - ((slot6 - slot6 % 8) / 8) % 8) / 8 < 3 then
						if slot8 == 4 then
							if slot14 < slot13 then
								return slot9(slot0)
							end

							slot13 = slot13 + 1
							slot9 = ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8 - ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8) % 8) / 8

							if slot0.rexx then
								slot10 = slot10 + 8
								slot0.rexx = false
							end

							if slot10 == 4 then
								slot10 = nil
							end
						end

						if slot6 > 0 or slot8 == 5 then

							-- Decompilation error in this vicinity:
							if slot6 ~= 1 then
								slot21 = 4
							end

							if not slot4(slot0, slot13, slot21) then
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
						slot21 = (slot0.a32 and slot1.D) or slot0.aregs
						slot22 = ""
						slot23 = ""

						if slot8 then
							slot22 = slot21[slot8 + 1]
						elseif not slot9 and slot0.x64 and not slot0.a32 then
							slot22 = "rip"
						end

						slot0.a32 = false

						if slot10 then
							if slot8 then
								slot22 = slot22 .. "+"
							end

							slot23 = slot21[slot10 + 1]

							if slot9 > 0 then
								slot23 = slot23 .. "*" .. 2^slot9
							end
						end

						slot20 = slot5("[%s%s%s]", slot22, slot23, slot11)
					end

					if slot6 < 3 and (not slot2(slot2, "[aRrgp]") or slot2(slot2, "t")) then
						slot20 = slot10[slot5] .. " " .. slot20
					end
				elseif slot19 == "r" then
					slot20 = slot4[slot7 + 1]
				elseif slot19 == "g" then
					slot20 = slot11[slot7 + 1]
				elseif slot19 == "p" then
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
				elseif slot19 == "t" then
				else
					error("bad pattern `" .. slot2 .. "'")
				end
			end

			if slot20 then
				slot3 = (slot3 and slot3 .. ", " .. slot20) or slot20
			end
		end

		slot0.pos = slot13

		return slot12(slot0, slot1, slot3)
	end,
	V = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11 = nil
		slot12 = slot0.code
		slot13 = slot0.pos
		slot14 = slot0.stop
		slot15 = slot0.vexl

		for slot19 in slot0(slot2, ".") do
			slot20 = nil

			if slot19 == "V" or slot19 == "U" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				elseif slot0.o16 then
					slot5 = "W"
					slot0.o16 = false
				else
					slot4 = slot1[(slot19 == "U" and slot0.x64 and "Q") or "D"]
				end
			elseif slot19 == "T" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				else
					slot5 = "D"
				end

				slot4 = slot1[slot5]
			elseif slot19 == "B" then
				slot5 = "B"
				slot4 = (slot0.rex and slot1.B64) or slot1.B
			elseif slot2(slot19, "[WDQMXYFG]") then
				if slot19 == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "P" then
				slot0.o16 = false

				if ((slot0.o16 and "X") or "M") == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "S" then
				slot1 = slot1 .. slot3(slot5)
			elseif slot19 == "s" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = (slot21 <= 127 and slot5("+0x%02x", slot21)) or slot5("-0x%02x", 256 - slot21)
				slot13 = slot13 + 1
			elseif slot19 == "u" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot5("0x%02x", slot21)
				slot13 = slot13 + 1
			elseif slot19 == "b" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot4[slot21 / 16 + 1]
				slot13 = slot13 + 1
			elseif slot19 == "w" then
				if not slot4(slot0, slot13, 2) then
					return
				end

				slot20 = slot5("0x%x", slot21)
				slot13 = slot13 + 2
			elseif slot19 == "o" then
				if slot0.x64 then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("[0x%08x%08x]", slot22, slot21)
					slot13 = slot13 + 8
				else
					if not slot4(slot0, slot13, 4) then
						return
					end

					slot20 = slot5("[0x%08x]", slot21)
					slot13 = slot13 + 4
				end
			elseif slot19 == "i" or slot19 == "I" then
				if slot6[slot5] == 8 and slot0.x64 and slot19 == "I" then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("0x%08x%08x", slot23, slot22)
				else
					if slot21 == 8 then
						slot21 = 4
					end

					if not slot4(slot0, slot13, slot21) then
						return
					end

					slot20 = (slot5 ~= "Q" or (slot22 >= 0 and slot22 <= 2147483647) or false) and false
					slot13 = slot13 + slot21
				end
			elseif slot19 == "j" then
				if slot6[slot5] == 8 then
					slot21 = 4
				end

				if not slot4(slot0, slot13, slot21) then
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
					slot20 = slot5("word 0x%04x", slot22 % 65536)
				elseif slot0.x64 then
					slot20 = slot5("0x%02x%06x", (slot22 - slot22 % 16777216) / 16777216, slot22 % 16777216)
				else
					slot20 = "0x" .. slot7(slot22)
				end
			elseif slot19 == "R" then
				slot21 = slot8(slot12, slot13 - 1, slot13 - 1) % 8

				if slot0.rexb then
					slot21 = slot21 + 8
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
							return slot9(slot0)
						end

						slot6 = slot8(slot12, slot13, slot13)
						slot13 = slot13 + 1
					end

					slot11 = ""

					if ((slot6 - slot6 % 8) / 8 - ((slot6 - slot6 % 8) / 8) % 8) / 8 < 3 then
						if slot8 == 4 then
							if slot14 < slot13 then
								return slot9(slot0)
							end

							slot13 = slot13 + 1
							slot9 = ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8 - ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8) % 8) / 8

							if slot0.rexx then
								slot10 = slot10 + 8
								slot0.rexx = false
							end

							if slot10 == 4 then
								slot10 = nil
							end
						end

						if slot6 > 0 or slot8 == 5 then

							-- Decompilation error in this vicinity:
							if slot6 ~= 1 then
								slot21 = 4
							end

							if not slot4(slot0, slot13, slot21) then
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
						slot21 = (slot0.a32 and slot1.D) or slot0.aregs
						slot22 = ""
						slot23 = ""

						if slot8 then
							slot22 = slot21[slot8 + 1]
						elseif not slot9 and slot0.x64 and not slot0.a32 then
							slot22 = "rip"
						end

						slot0.a32 = false

						if slot10 then
							if slot8 then
								slot22 = slot22 .. "+"
							end

							slot23 = slot21[slot10 + 1]

							if slot9 > 0 then
								slot23 = slot23 .. "*" .. 2^slot9
							end
						end

						slot20 = slot5("[%s%s%s]", slot22, slot23, slot11)
					end

					if slot6 < 3 and (not slot2(slot2, "[aRrgp]") or slot2(slot2, "t")) then
						slot20 = slot10[slot5] .. " " .. slot20
					end
				elseif slot19 == "r" then
					slot20 = slot4[slot7 + 1]
				elseif slot19 == "g" then
					slot20 = slot11[slot7 + 1]
				elseif slot19 == "p" then
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
				elseif slot19 == "t" then
				else
					error("bad pattern `" .. slot2 .. "'")
				end
			end

			if slot20 then
				slot3 = (slot3 and slot3 .. ", " .. slot20) or slot20
			end
		end

		slot0.pos = slot13

		return slot12(slot0, slot1, slot3)
	end,
	U = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11 = nil
		slot12 = slot0.code
		slot13 = slot0.pos
		slot14 = slot0.stop
		slot15 = slot0.vexl

		for slot19 in slot0(slot2, ".") do
			slot20 = nil

			if slot19 == "V" or slot19 == "U" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				elseif slot0.o16 then
					slot5 = "W"
					slot0.o16 = false
				else
					slot4 = slot1[(slot19 == "U" and slot0.x64 and "Q") or "D"]
				end
			elseif slot19 == "T" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				else
					slot5 = "D"
				end

				slot4 = slot1[slot5]
			elseif slot19 == "B" then
				slot5 = "B"
				slot4 = (slot0.rex and slot1.B64) or slot1.B
			elseif slot2(slot19, "[WDQMXYFG]") then
				if slot19 == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "P" then
				slot0.o16 = false

				if ((slot0.o16 and "X") or "M") == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "S" then
				slot1 = slot1 .. slot3(slot5)
			elseif slot19 == "s" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = (slot21 <= 127 and slot5("+0x%02x", slot21)) or slot5("-0x%02x", 256 - slot21)
				slot13 = slot13 + 1
			elseif slot19 == "u" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot5("0x%02x", slot21)
				slot13 = slot13 + 1
			elseif slot19 == "b" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot4[slot21 / 16 + 1]
				slot13 = slot13 + 1
			elseif slot19 == "w" then
				if not slot4(slot0, slot13, 2) then
					return
				end

				slot20 = slot5("0x%x", slot21)
				slot13 = slot13 + 2
			elseif slot19 == "o" then
				if slot0.x64 then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("[0x%08x%08x]", slot22, slot21)
					slot13 = slot13 + 8
				else
					if not slot4(slot0, slot13, 4) then
						return
					end

					slot20 = slot5("[0x%08x]", slot21)
					slot13 = slot13 + 4
				end
			elseif slot19 == "i" or slot19 == "I" then
				if slot6[slot5] == 8 and slot0.x64 and slot19 == "I" then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("0x%08x%08x", slot23, slot22)
				else
					if slot21 == 8 then
						slot21 = 4
					end

					if not slot4(slot0, slot13, slot21) then
						return
					end

					slot20 = (slot5 ~= "Q" or (slot22 >= 0 and slot22 <= 2147483647) or false) and false
					slot13 = slot13 + slot21
				end
			elseif slot19 == "j" then
				if slot6[slot5] == 8 then
					slot21 = 4
				end

				if not slot4(slot0, slot13, slot21) then
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
					slot20 = slot5("word 0x%04x", slot22 % 65536)
				elseif slot0.x64 then
					slot20 = slot5("0x%02x%06x", (slot22 - slot22 % 16777216) / 16777216, slot22 % 16777216)
				else
					slot20 = "0x" .. slot7(slot22)
				end
			elseif slot19 == "R" then
				slot21 = slot8(slot12, slot13 - 1, slot13 - 1) % 8

				if slot0.rexb then
					slot21 = slot21 + 8
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
							return slot9(slot0)
						end

						slot6 = slot8(slot12, slot13, slot13)
						slot13 = slot13 + 1
					end

					slot11 = ""

					if ((slot6 - slot6 % 8) / 8 - ((slot6 - slot6 % 8) / 8) % 8) / 8 < 3 then
						if slot8 == 4 then
							if slot14 < slot13 then
								return slot9(slot0)
							end

							slot13 = slot13 + 1
							slot9 = ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8 - ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8) % 8) / 8

							if slot0.rexx then
								slot10 = slot10 + 8
								slot0.rexx = false
							end

							if slot10 == 4 then
								slot10 = nil
							end
						end

						if slot6 > 0 or slot8 == 5 then

							-- Decompilation error in this vicinity:
							if slot6 ~= 1 then
								slot21 = 4
							end

							if not slot4(slot0, slot13, slot21) then
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
						slot21 = (slot0.a32 and slot1.D) or slot0.aregs
						slot22 = ""
						slot23 = ""

						if slot8 then
							slot22 = slot21[slot8 + 1]
						elseif not slot9 and slot0.x64 and not slot0.a32 then
							slot22 = "rip"
						end

						slot0.a32 = false

						if slot10 then
							if slot8 then
								slot22 = slot22 .. "+"
							end

							slot23 = slot21[slot10 + 1]

							if slot9 > 0 then
								slot23 = slot23 .. "*" .. 2^slot9
							end
						end

						slot20 = slot5("[%s%s%s]", slot22, slot23, slot11)
					end

					if slot6 < 3 and (not slot2(slot2, "[aRrgp]") or slot2(slot2, "t")) then
						slot20 = slot10[slot5] .. " " .. slot20
					end
				elseif slot19 == "r" then
					slot20 = slot4[slot7 + 1]
				elseif slot19 == "g" then
					slot20 = slot11[slot7 + 1]
				elseif slot19 == "p" then
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
				elseif slot19 == "t" then
				else
					error("bad pattern `" .. slot2 .. "'")
				end
			end

			if slot20 then
				slot3 = (slot3 and slot3 .. ", " .. slot20) or slot20
			end
		end

		slot0.pos = slot13

		return slot12(slot0, slot1, slot3)
	end,
	T = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11 = nil
		slot12 = slot0.code
		slot13 = slot0.pos
		slot14 = slot0.stop
		slot15 = slot0.vexl

		for slot19 in slot0(slot2, ".") do
			slot20 = nil

			if slot19 == "V" or slot19 == "U" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				elseif slot0.o16 then
					slot5 = "W"
					slot0.o16 = false
				else
					slot4 = slot1[(slot19 == "U" and slot0.x64 and "Q") or "D"]
				end
			elseif slot19 == "T" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				else
					slot5 = "D"
				end

				slot4 = slot1[slot5]
			elseif slot19 == "B" then
				slot5 = "B"
				slot4 = (slot0.rex and slot1.B64) or slot1.B
			elseif slot2(slot19, "[WDQMXYFG]") then
				if slot19 == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "P" then
				slot0.o16 = false

				if ((slot0.o16 and "X") or "M") == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "S" then
				slot1 = slot1 .. slot3(slot5)
			elseif slot19 == "s" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = (slot21 <= 127 and slot5("+0x%02x", slot21)) or slot5("-0x%02x", 256 - slot21)
				slot13 = slot13 + 1
			elseif slot19 == "u" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot5("0x%02x", slot21)
				slot13 = slot13 + 1
			elseif slot19 == "b" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot4[slot21 / 16 + 1]
				slot13 = slot13 + 1
			elseif slot19 == "w" then
				if not slot4(slot0, slot13, 2) then
					return
				end

				slot20 = slot5("0x%x", slot21)
				slot13 = slot13 + 2
			elseif slot19 == "o" then
				if slot0.x64 then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("[0x%08x%08x]", slot22, slot21)
					slot13 = slot13 + 8
				else
					if not slot4(slot0, slot13, 4) then
						return
					end

					slot20 = slot5("[0x%08x]", slot21)
					slot13 = slot13 + 4
				end
			elseif slot19 == "i" or slot19 == "I" then
				if slot6[slot5] == 8 and slot0.x64 and slot19 == "I" then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("0x%08x%08x", slot23, slot22)
				else
					if slot21 == 8 then
						slot21 = 4
					end

					if not slot4(slot0, slot13, slot21) then
						return
					end

					slot20 = (slot5 ~= "Q" or (slot22 >= 0 and slot22 <= 2147483647) or false) and false
					slot13 = slot13 + slot21
				end
			elseif slot19 == "j" then
				if slot6[slot5] == 8 then
					slot21 = 4
				end

				if not slot4(slot0, slot13, slot21) then
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
					slot20 = slot5("word 0x%04x", slot22 % 65536)
				elseif slot0.x64 then
					slot20 = slot5("0x%02x%06x", (slot22 - slot22 % 16777216) / 16777216, slot22 % 16777216)
				else
					slot20 = "0x" .. slot7(slot22)
				end
			elseif slot19 == "R" then
				slot21 = slot8(slot12, slot13 - 1, slot13 - 1) % 8

				if slot0.rexb then
					slot21 = slot21 + 8
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
							return slot9(slot0)
						end

						slot6 = slot8(slot12, slot13, slot13)
						slot13 = slot13 + 1
					end

					slot11 = ""

					if ((slot6 - slot6 % 8) / 8 - ((slot6 - slot6 % 8) / 8) % 8) / 8 < 3 then
						if slot8 == 4 then
							if slot14 < slot13 then
								return slot9(slot0)
							end

							slot13 = slot13 + 1
							slot9 = ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8 - ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8) % 8) / 8

							if slot0.rexx then
								slot10 = slot10 + 8
								slot0.rexx = false
							end

							if slot10 == 4 then
								slot10 = nil
							end
						end

						if slot6 > 0 or slot8 == 5 then

							-- Decompilation error in this vicinity:
							if slot6 ~= 1 then
								slot21 = 4
							end

							if not slot4(slot0, slot13, slot21) then
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
						slot21 = (slot0.a32 and slot1.D) or slot0.aregs
						slot22 = ""
						slot23 = ""

						if slot8 then
							slot22 = slot21[slot8 + 1]
						elseif not slot9 and slot0.x64 and not slot0.a32 then
							slot22 = "rip"
						end

						slot0.a32 = false

						if slot10 then
							if slot8 then
								slot22 = slot22 .. "+"
							end

							slot23 = slot21[slot10 + 1]

							if slot9 > 0 then
								slot23 = slot23 .. "*" .. 2^slot9
							end
						end

						slot20 = slot5("[%s%s%s]", slot22, slot23, slot11)
					end

					if slot6 < 3 and (not slot2(slot2, "[aRrgp]") or slot2(slot2, "t")) then
						slot20 = slot10[slot5] .. " " .. slot20
					end
				elseif slot19 == "r" then
					slot20 = slot4[slot7 + 1]
				elseif slot19 == "g" then
					slot20 = slot11[slot7 + 1]
				elseif slot19 == "p" then
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
				elseif slot19 == "t" then
				else
					error("bad pattern `" .. slot2 .. "'")
				end
			end

			if slot20 then
				slot3 = (slot3 and slot3 .. ", " .. slot20) or slot20
			end
		end

		slot0.pos = slot13

		return slot12(slot0, slot1, slot3)
	end,
	M = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11 = nil
		slot12 = slot0.code
		slot13 = slot0.pos
		slot14 = slot0.stop
		slot15 = slot0.vexl

		for slot19 in slot0(slot2, ".") do
			slot20 = nil

			if slot19 == "V" or slot19 == "U" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				elseif slot0.o16 then
					slot5 = "W"
					slot0.o16 = false
				else
					slot4 = slot1[(slot19 == "U" and slot0.x64 and "Q") or "D"]
				end
			elseif slot19 == "T" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				else
					slot5 = "D"
				end

				slot4 = slot1[slot5]
			elseif slot19 == "B" then
				slot5 = "B"
				slot4 = (slot0.rex and slot1.B64) or slot1.B
			elseif slot2(slot19, "[WDQMXYFG]") then
				if slot19 == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "P" then
				slot0.o16 = false

				if ((slot0.o16 and "X") or "M") == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "S" then
				slot1 = slot1 .. slot3(slot5)
			elseif slot19 == "s" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = (slot21 <= 127 and slot5("+0x%02x", slot21)) or slot5("-0x%02x", 256 - slot21)
				slot13 = slot13 + 1
			elseif slot19 == "u" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot5("0x%02x", slot21)
				slot13 = slot13 + 1
			elseif slot19 == "b" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot4[slot21 / 16 + 1]
				slot13 = slot13 + 1
			elseif slot19 == "w" then
				if not slot4(slot0, slot13, 2) then
					return
				end

				slot20 = slot5("0x%x", slot21)
				slot13 = slot13 + 2
			elseif slot19 == "o" then
				if slot0.x64 then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("[0x%08x%08x]", slot22, slot21)
					slot13 = slot13 + 8
				else
					if not slot4(slot0, slot13, 4) then
						return
					end

					slot20 = slot5("[0x%08x]", slot21)
					slot13 = slot13 + 4
				end
			elseif slot19 == "i" or slot19 == "I" then
				if slot6[slot5] == 8 and slot0.x64 and slot19 == "I" then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("0x%08x%08x", slot23, slot22)
				else
					if slot21 == 8 then
						slot21 = 4
					end

					if not slot4(slot0, slot13, slot21) then
						return
					end

					slot20 = (slot5 ~= "Q" or (slot22 >= 0 and slot22 <= 2147483647) or false) and false
					slot13 = slot13 + slot21
				end
			elseif slot19 == "j" then
				if slot6[slot5] == 8 then
					slot21 = 4
				end

				if not slot4(slot0, slot13, slot21) then
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
					slot20 = slot5("word 0x%04x", slot22 % 65536)
				elseif slot0.x64 then
					slot20 = slot5("0x%02x%06x", (slot22 - slot22 % 16777216) / 16777216, slot22 % 16777216)
				else
					slot20 = "0x" .. slot7(slot22)
				end
			elseif slot19 == "R" then
				slot21 = slot8(slot12, slot13 - 1, slot13 - 1) % 8

				if slot0.rexb then
					slot21 = slot21 + 8
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
							return slot9(slot0)
						end

						slot6 = slot8(slot12, slot13, slot13)
						slot13 = slot13 + 1
					end

					slot11 = ""

					if ((slot6 - slot6 % 8) / 8 - ((slot6 - slot6 % 8) / 8) % 8) / 8 < 3 then
						if slot8 == 4 then
							if slot14 < slot13 then
								return slot9(slot0)
							end

							slot13 = slot13 + 1
							slot9 = ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8 - ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8) % 8) / 8

							if slot0.rexx then
								slot10 = slot10 + 8
								slot0.rexx = false
							end

							if slot10 == 4 then
								slot10 = nil
							end
						end

						if slot6 > 0 or slot8 == 5 then

							-- Decompilation error in this vicinity:
							if slot6 ~= 1 then
								slot21 = 4
							end

							if not slot4(slot0, slot13, slot21) then
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
						slot21 = (slot0.a32 and slot1.D) or slot0.aregs
						slot22 = ""
						slot23 = ""

						if slot8 then
							slot22 = slot21[slot8 + 1]
						elseif not slot9 and slot0.x64 and not slot0.a32 then
							slot22 = "rip"
						end

						slot0.a32 = false

						if slot10 then
							if slot8 then
								slot22 = slot22 .. "+"
							end

							slot23 = slot21[slot10 + 1]

							if slot9 > 0 then
								slot23 = slot23 .. "*" .. 2^slot9
							end
						end

						slot20 = slot5("[%s%s%s]", slot22, slot23, slot11)
					end

					if slot6 < 3 and (not slot2(slot2, "[aRrgp]") or slot2(slot2, "t")) then
						slot20 = slot10[slot5] .. " " .. slot20
					end
				elseif slot19 == "r" then
					slot20 = slot4[slot7 + 1]
				elseif slot19 == "g" then
					slot20 = slot11[slot7 + 1]
				elseif slot19 == "p" then
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
				elseif slot19 == "t" then
				else
					error("bad pattern `" .. slot2 .. "'")
				end
			end

			if slot20 then
				slot3 = (slot3 and slot3 .. ", " .. slot20) or slot20
			end
		end

		slot0.pos = slot13

		return slot12(slot0, slot1, slot3)
	end,
	X = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11 = nil
		slot12 = slot0.code
		slot13 = slot0.pos
		slot14 = slot0.stop
		slot15 = slot0.vexl

		for slot19 in slot0(slot2, ".") do
			slot20 = nil

			if slot19 == "V" or slot19 == "U" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				elseif slot0.o16 then
					slot5 = "W"
					slot0.o16 = false
				else
					slot4 = slot1[(slot19 == "U" and slot0.x64 and "Q") or "D"]
				end
			elseif slot19 == "T" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				else
					slot5 = "D"
				end

				slot4 = slot1[slot5]
			elseif slot19 == "B" then
				slot5 = "B"
				slot4 = (slot0.rex and slot1.B64) or slot1.B
			elseif slot2(slot19, "[WDQMXYFG]") then
				if slot19 == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "P" then
				slot0.o16 = false

				if ((slot0.o16 and "X") or "M") == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "S" then
				slot1 = slot1 .. slot3(slot5)
			elseif slot19 == "s" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = (slot21 <= 127 and slot5("+0x%02x", slot21)) or slot5("-0x%02x", 256 - slot21)
				slot13 = slot13 + 1
			elseif slot19 == "u" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot5("0x%02x", slot21)
				slot13 = slot13 + 1
			elseif slot19 == "b" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot4[slot21 / 16 + 1]
				slot13 = slot13 + 1
			elseif slot19 == "w" then
				if not slot4(slot0, slot13, 2) then
					return
				end

				slot20 = slot5("0x%x", slot21)
				slot13 = slot13 + 2
			elseif slot19 == "o" then
				if slot0.x64 then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("[0x%08x%08x]", slot22, slot21)
					slot13 = slot13 + 8
				else
					if not slot4(slot0, slot13, 4) then
						return
					end

					slot20 = slot5("[0x%08x]", slot21)
					slot13 = slot13 + 4
				end
			elseif slot19 == "i" or slot19 == "I" then
				if slot6[slot5] == 8 and slot0.x64 and slot19 == "I" then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("0x%08x%08x", slot23, slot22)
				else
					if slot21 == 8 then
						slot21 = 4
					end

					if not slot4(slot0, slot13, slot21) then
						return
					end

					slot20 = (slot5 ~= "Q" or (slot22 >= 0 and slot22 <= 2147483647) or false) and false
					slot13 = slot13 + slot21
				end
			elseif slot19 == "j" then
				if slot6[slot5] == 8 then
					slot21 = 4
				end

				if not slot4(slot0, slot13, slot21) then
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
					slot20 = slot5("word 0x%04x", slot22 % 65536)
				elseif slot0.x64 then
					slot20 = slot5("0x%02x%06x", (slot22 - slot22 % 16777216) / 16777216, slot22 % 16777216)
				else
					slot20 = "0x" .. slot7(slot22)
				end
			elseif slot19 == "R" then
				slot21 = slot8(slot12, slot13 - 1, slot13 - 1) % 8

				if slot0.rexb then
					slot21 = slot21 + 8
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
							return slot9(slot0)
						end

						slot6 = slot8(slot12, slot13, slot13)
						slot13 = slot13 + 1
					end

					slot11 = ""

					if ((slot6 - slot6 % 8) / 8 - ((slot6 - slot6 % 8) / 8) % 8) / 8 < 3 then
						if slot8 == 4 then
							if slot14 < slot13 then
								return slot9(slot0)
							end

							slot13 = slot13 + 1
							slot9 = ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8 - ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8) % 8) / 8

							if slot0.rexx then
								slot10 = slot10 + 8
								slot0.rexx = false
							end

							if slot10 == 4 then
								slot10 = nil
							end
						end

						if slot6 > 0 or slot8 == 5 then

							-- Decompilation error in this vicinity:
							if slot6 ~= 1 then
								slot21 = 4
							end

							if not slot4(slot0, slot13, slot21) then
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
						slot21 = (slot0.a32 and slot1.D) or slot0.aregs
						slot22 = ""
						slot23 = ""

						if slot8 then
							slot22 = slot21[slot8 + 1]
						elseif not slot9 and slot0.x64 and not slot0.a32 then
							slot22 = "rip"
						end

						slot0.a32 = false

						if slot10 then
							if slot8 then
								slot22 = slot22 .. "+"
							end

							slot23 = slot21[slot10 + 1]

							if slot9 > 0 then
								slot23 = slot23 .. "*" .. 2^slot9
							end
						end

						slot20 = slot5("[%s%s%s]", slot22, slot23, slot11)
					end

					if slot6 < 3 and (not slot2(slot2, "[aRrgp]") or slot2(slot2, "t")) then
						slot20 = slot10[slot5] .. " " .. slot20
					end
				elseif slot19 == "r" then
					slot20 = slot4[slot7 + 1]
				elseif slot19 == "g" then
					slot20 = slot11[slot7 + 1]
				elseif slot19 == "p" then
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
				elseif slot19 == "t" then
				else
					error("bad pattern `" .. slot2 .. "'")
				end
			end

			if slot20 then
				slot3 = (slot3 and slot3 .. ", " .. slot20) or slot20
			end
		end

		slot0.pos = slot13

		return slot12(slot0, slot1, slot3)
	end,
	P = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11 = nil
		slot12 = slot0.code
		slot13 = slot0.pos
		slot14 = slot0.stop
		slot15 = slot0.vexl

		for slot19 in slot0(slot2, ".") do
			slot20 = nil

			if slot19 == "V" or slot19 == "U" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				elseif slot0.o16 then
					slot5 = "W"
					slot0.o16 = false
				else
					slot4 = slot1[(slot19 == "U" and slot0.x64 and "Q") or "D"]
				end
			elseif slot19 == "T" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				else
					slot5 = "D"
				end

				slot4 = slot1[slot5]
			elseif slot19 == "B" then
				slot5 = "B"
				slot4 = (slot0.rex and slot1.B64) or slot1.B
			elseif slot2(slot19, "[WDQMXYFG]") then
				if slot19 == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "P" then
				slot0.o16 = false

				if ((slot0.o16 and "X") or "M") == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "S" then
				slot1 = slot1 .. slot3(slot5)
			elseif slot19 == "s" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = (slot21 <= 127 and slot5("+0x%02x", slot21)) or slot5("-0x%02x", 256 - slot21)
				slot13 = slot13 + 1
			elseif slot19 == "u" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot5("0x%02x", slot21)
				slot13 = slot13 + 1
			elseif slot19 == "b" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot4[slot21 / 16 + 1]
				slot13 = slot13 + 1
			elseif slot19 == "w" then
				if not slot4(slot0, slot13, 2) then
					return
				end

				slot20 = slot5("0x%x", slot21)
				slot13 = slot13 + 2
			elseif slot19 == "o" then
				if slot0.x64 then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("[0x%08x%08x]", slot22, slot21)
					slot13 = slot13 + 8
				else
					if not slot4(slot0, slot13, 4) then
						return
					end

					slot20 = slot5("[0x%08x]", slot21)
					slot13 = slot13 + 4
				end
			elseif slot19 == "i" or slot19 == "I" then
				if slot6[slot5] == 8 and slot0.x64 and slot19 == "I" then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("0x%08x%08x", slot23, slot22)
				else
					if slot21 == 8 then
						slot21 = 4
					end

					if not slot4(slot0, slot13, slot21) then
						return
					end

					slot20 = (slot5 ~= "Q" or (slot22 >= 0 and slot22 <= 2147483647) or false) and false
					slot13 = slot13 + slot21
				end
			elseif slot19 == "j" then
				if slot6[slot5] == 8 then
					slot21 = 4
				end

				if not slot4(slot0, slot13, slot21) then
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
					slot20 = slot5("word 0x%04x", slot22 % 65536)
				elseif slot0.x64 then
					slot20 = slot5("0x%02x%06x", (slot22 - slot22 % 16777216) / 16777216, slot22 % 16777216)
				else
					slot20 = "0x" .. slot7(slot22)
				end
			elseif slot19 == "R" then
				slot21 = slot8(slot12, slot13 - 1, slot13 - 1) % 8

				if slot0.rexb then
					slot21 = slot21 + 8
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
							return slot9(slot0)
						end

						slot6 = slot8(slot12, slot13, slot13)
						slot13 = slot13 + 1
					end

					slot11 = ""

					if ((slot6 - slot6 % 8) / 8 - ((slot6 - slot6 % 8) / 8) % 8) / 8 < 3 then
						if slot8 == 4 then
							if slot14 < slot13 then
								return slot9(slot0)
							end

							slot13 = slot13 + 1
							slot9 = ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8 - ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8) % 8) / 8

							if slot0.rexx then
								slot10 = slot10 + 8
								slot0.rexx = false
							end

							if slot10 == 4 then
								slot10 = nil
							end
						end

						if slot6 > 0 or slot8 == 5 then

							-- Decompilation error in this vicinity:
							if slot6 ~= 1 then
								slot21 = 4
							end

							if not slot4(slot0, slot13, slot21) then
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
						slot21 = (slot0.a32 and slot1.D) or slot0.aregs
						slot22 = ""
						slot23 = ""

						if slot8 then
							slot22 = slot21[slot8 + 1]
						elseif not slot9 and slot0.x64 and not slot0.a32 then
							slot22 = "rip"
						end

						slot0.a32 = false

						if slot10 then
							if slot8 then
								slot22 = slot22 .. "+"
							end

							slot23 = slot21[slot10 + 1]

							if slot9 > 0 then
								slot23 = slot23 .. "*" .. 2^slot9
							end
						end

						slot20 = slot5("[%s%s%s]", slot22, slot23, slot11)
					end

					if slot6 < 3 and (not slot2(slot2, "[aRrgp]") or slot2(slot2, "t")) then
						slot20 = slot10[slot5] .. " " .. slot20
					end
				elseif slot19 == "r" then
					slot20 = slot4[slot7 + 1]
				elseif slot19 == "g" then
					slot20 = slot11[slot7 + 1]
				elseif slot19 == "p" then
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
				elseif slot19 == "t" then
				else
					error("bad pattern `" .. slot2 .. "'")
				end
			end

			if slot20 then
				slot3 = (slot3 and slot3 .. ", " .. slot20) or slot20
			end
		end

		slot0.pos = slot13

		return slot12(slot0, slot1, slot3)
	end,
	F = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11 = nil
		slot12 = slot0.code
		slot13 = slot0.pos
		slot14 = slot0.stop
		slot15 = slot0.vexl

		for slot19 in slot0(slot2, ".") do
			slot20 = nil

			if slot19 == "V" or slot19 == "U" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				elseif slot0.o16 then
					slot5 = "W"
					slot0.o16 = false
				else
					slot4 = slot1[(slot19 == "U" and slot0.x64 and "Q") or "D"]
				end
			elseif slot19 == "T" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				else
					slot5 = "D"
				end

				slot4 = slot1[slot5]
			elseif slot19 == "B" then
				slot5 = "B"
				slot4 = (slot0.rex and slot1.B64) or slot1.B
			elseif slot2(slot19, "[WDQMXYFG]") then
				if slot19 == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "P" then
				slot0.o16 = false

				if ((slot0.o16 and "X") or "M") == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "S" then
				slot1 = slot1 .. slot3(slot5)
			elseif slot19 == "s" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = (slot21 <= 127 and slot5("+0x%02x", slot21)) or slot5("-0x%02x", 256 - slot21)
				slot13 = slot13 + 1
			elseif slot19 == "u" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot5("0x%02x", slot21)
				slot13 = slot13 + 1
			elseif slot19 == "b" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot4[slot21 / 16 + 1]
				slot13 = slot13 + 1
			elseif slot19 == "w" then
				if not slot4(slot0, slot13, 2) then
					return
				end

				slot20 = slot5("0x%x", slot21)
				slot13 = slot13 + 2
			elseif slot19 == "o" then
				if slot0.x64 then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("[0x%08x%08x]", slot22, slot21)
					slot13 = slot13 + 8
				else
					if not slot4(slot0, slot13, 4) then
						return
					end

					slot20 = slot5("[0x%08x]", slot21)
					slot13 = slot13 + 4
				end
			elseif slot19 == "i" or slot19 == "I" then
				if slot6[slot5] == 8 and slot0.x64 and slot19 == "I" then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("0x%08x%08x", slot23, slot22)
				else
					if slot21 == 8 then
						slot21 = 4
					end

					if not slot4(slot0, slot13, slot21) then
						return
					end

					slot20 = (slot5 ~= "Q" or (slot22 >= 0 and slot22 <= 2147483647) or false) and false
					slot13 = slot13 + slot21
				end
			elseif slot19 == "j" then
				if slot6[slot5] == 8 then
					slot21 = 4
				end

				if not slot4(slot0, slot13, slot21) then
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
					slot20 = slot5("word 0x%04x", slot22 % 65536)
				elseif slot0.x64 then
					slot20 = slot5("0x%02x%06x", (slot22 - slot22 % 16777216) / 16777216, slot22 % 16777216)
				else
					slot20 = "0x" .. slot7(slot22)
				end
			elseif slot19 == "R" then
				slot21 = slot8(slot12, slot13 - 1, slot13 - 1) % 8

				if slot0.rexb then
					slot21 = slot21 + 8
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
							return slot9(slot0)
						end

						slot6 = slot8(slot12, slot13, slot13)
						slot13 = slot13 + 1
					end

					slot11 = ""

					if ((slot6 - slot6 % 8) / 8 - ((slot6 - slot6 % 8) / 8) % 8) / 8 < 3 then
						if slot8 == 4 then
							if slot14 < slot13 then
								return slot9(slot0)
							end

							slot13 = slot13 + 1
							slot9 = ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8 - ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8) % 8) / 8

							if slot0.rexx then
								slot10 = slot10 + 8
								slot0.rexx = false
							end

							if slot10 == 4 then
								slot10 = nil
							end
						end

						if slot6 > 0 or slot8 == 5 then

							-- Decompilation error in this vicinity:
							if slot6 ~= 1 then
								slot21 = 4
							end

							if not slot4(slot0, slot13, slot21) then
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
						slot21 = (slot0.a32 and slot1.D) or slot0.aregs
						slot22 = ""
						slot23 = ""

						if slot8 then
							slot22 = slot21[slot8 + 1]
						elseif not slot9 and slot0.x64 and not slot0.a32 then
							slot22 = "rip"
						end

						slot0.a32 = false

						if slot10 then
							if slot8 then
								slot22 = slot22 .. "+"
							end

							slot23 = slot21[slot10 + 1]

							if slot9 > 0 then
								slot23 = slot23 .. "*" .. 2^slot9
							end
						end

						slot20 = slot5("[%s%s%s]", slot22, slot23, slot11)
					end

					if slot6 < 3 and (not slot2(slot2, "[aRrgp]") or slot2(slot2, "t")) then
						slot20 = slot10[slot5] .. " " .. slot20
					end
				elseif slot19 == "r" then
					slot20 = slot4[slot7 + 1]
				elseif slot19 == "g" then
					slot20 = slot11[slot7 + 1]
				elseif slot19 == "p" then
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
				elseif slot19 == "t" then
				else
					error("bad pattern `" .. slot2 .. "'")
				end
			end

			if slot20 then
				slot3 = (slot3 and slot3 .. ", " .. slot20) or slot20
			end
		end

		slot0.pos = slot13

		return slot12(slot0, slot1, slot3)
	end,
	G = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11 = nil
		slot12 = slot0.code
		slot13 = slot0.pos
		slot14 = slot0.stop
		slot15 = slot0.vexl

		for slot19 in slot0(slot2, ".") do
			slot20 = nil

			if slot19 == "V" or slot19 == "U" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				elseif slot0.o16 then
					slot5 = "W"
					slot0.o16 = false
				else
					slot4 = slot1[(slot19 == "U" and slot0.x64 and "Q") or "D"]
				end
			elseif slot19 == "T" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				else
					slot5 = "D"
				end

				slot4 = slot1[slot5]
			elseif slot19 == "B" then
				slot5 = "B"
				slot4 = (slot0.rex and slot1.B64) or slot1.B
			elseif slot2(slot19, "[WDQMXYFG]") then
				if slot19 == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "P" then
				slot0.o16 = false

				if ((slot0.o16 and "X") or "M") == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "S" then
				slot1 = slot1 .. slot3(slot5)
			elseif slot19 == "s" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = (slot21 <= 127 and slot5("+0x%02x", slot21)) or slot5("-0x%02x", 256 - slot21)
				slot13 = slot13 + 1
			elseif slot19 == "u" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot5("0x%02x", slot21)
				slot13 = slot13 + 1
			elseif slot19 == "b" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot4[slot21 / 16 + 1]
				slot13 = slot13 + 1
			elseif slot19 == "w" then
				if not slot4(slot0, slot13, 2) then
					return
				end

				slot20 = slot5("0x%x", slot21)
				slot13 = slot13 + 2
			elseif slot19 == "o" then
				if slot0.x64 then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("[0x%08x%08x]", slot22, slot21)
					slot13 = slot13 + 8
				else
					if not slot4(slot0, slot13, 4) then
						return
					end

					slot20 = slot5("[0x%08x]", slot21)
					slot13 = slot13 + 4
				end
			elseif slot19 == "i" or slot19 == "I" then
				if slot6[slot5] == 8 and slot0.x64 and slot19 == "I" then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("0x%08x%08x", slot23, slot22)
				else
					if slot21 == 8 then
						slot21 = 4
					end

					if not slot4(slot0, slot13, slot21) then
						return
					end

					slot20 = (slot5 ~= "Q" or (slot22 >= 0 and slot22 <= 2147483647) or false) and false
					slot13 = slot13 + slot21
				end
			elseif slot19 == "j" then
				if slot6[slot5] == 8 then
					slot21 = 4
				end

				if not slot4(slot0, slot13, slot21) then
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
					slot20 = slot5("word 0x%04x", slot22 % 65536)
				elseif slot0.x64 then
					slot20 = slot5("0x%02x%06x", (slot22 - slot22 % 16777216) / 16777216, slot22 % 16777216)
				else
					slot20 = "0x" .. slot7(slot22)
				end
			elseif slot19 == "R" then
				slot21 = slot8(slot12, slot13 - 1, slot13 - 1) % 8

				if slot0.rexb then
					slot21 = slot21 + 8
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
							return slot9(slot0)
						end

						slot6 = slot8(slot12, slot13, slot13)
						slot13 = slot13 + 1
					end

					slot11 = ""

					if ((slot6 - slot6 % 8) / 8 - ((slot6 - slot6 % 8) / 8) % 8) / 8 < 3 then
						if slot8 == 4 then
							if slot14 < slot13 then
								return slot9(slot0)
							end

							slot13 = slot13 + 1
							slot9 = ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8 - ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8) % 8) / 8

							if slot0.rexx then
								slot10 = slot10 + 8
								slot0.rexx = false
							end

							if slot10 == 4 then
								slot10 = nil
							end
						end

						if slot6 > 0 or slot8 == 5 then

							-- Decompilation error in this vicinity:
							if slot6 ~= 1 then
								slot21 = 4
							end

							if not slot4(slot0, slot13, slot21) then
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
						slot21 = (slot0.a32 and slot1.D) or slot0.aregs
						slot22 = ""
						slot23 = ""

						if slot8 then
							slot22 = slot21[slot8 + 1]
						elseif not slot9 and slot0.x64 and not slot0.a32 then
							slot22 = "rip"
						end

						slot0.a32 = false

						if slot10 then
							if slot8 then
								slot22 = slot22 .. "+"
							end

							slot23 = slot21[slot10 + 1]

							if slot9 > 0 then
								slot23 = slot23 .. "*" .. 2^slot9
							end
						end

						slot20 = slot5("[%s%s%s]", slot22, slot23, slot11)
					end

					if slot6 < 3 and (not slot2(slot2, "[aRrgp]") or slot2(slot2, "t")) then
						slot20 = slot10[slot5] .. " " .. slot20
					end
				elseif slot19 == "r" then
					slot20 = slot4[slot7 + 1]
				elseif slot19 == "g" then
					slot20 = slot11[slot7 + 1]
				elseif slot19 == "p" then
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
				elseif slot19 == "t" then
				else
					error("bad pattern `" .. slot2 .. "'")
				end
			end

			if slot20 then
				slot3 = (slot3 and slot3 .. ", " .. slot20) or slot20
			end
		end

		slot0.pos = slot13

		return slot12(slot0, slot1, slot3)
	end,
	Y = function (slot0, slot1, slot2)
		slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11 = nil
		slot12 = slot0.code
		slot13 = slot0.pos
		slot14 = slot0.stop
		slot15 = slot0.vexl

		for slot19 in slot0(slot2, ".") do
			slot20 = nil

			if slot19 == "V" or slot19 == "U" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				elseif slot0.o16 then
					slot5 = "W"
					slot0.o16 = false
				else
					slot4 = slot1[(slot19 == "U" and slot0.x64 and "Q") or "D"]
				end
			elseif slot19 == "T" then
				if slot0.rexw then
					slot5 = "Q"
					slot0.rexw = false
				else
					slot5 = "D"
				end

				slot4 = slot1[slot5]
			elseif slot19 == "B" then
				slot5 = "B"
				slot4 = (slot0.rex and slot1.B64) or slot1.B
			elseif slot2(slot19, "[WDQMXYFG]") then
				if slot19 == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "P" then
				slot0.o16 = false

				if ((slot0.o16 and "X") or "M") == "X" and slot15 then
					slot5 = "Y"
					slot0.vexl = false
				end

				slot4 = slot1[slot5]
			elseif slot19 == "S" then
				slot1 = slot1 .. slot3(slot5)
			elseif slot19 == "s" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = (slot21 <= 127 and slot5("+0x%02x", slot21)) or slot5("-0x%02x", 256 - slot21)
				slot13 = slot13 + 1
			elseif slot19 == "u" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot5("0x%02x", slot21)
				slot13 = slot13 + 1
			elseif slot19 == "b" then
				if not slot4(slot0, slot13, 1) then
					return
				end

				slot20 = slot4[slot21 / 16 + 1]
				slot13 = slot13 + 1
			elseif slot19 == "w" then
				if not slot4(slot0, slot13, 2) then
					return
				end

				slot20 = slot5("0x%x", slot21)
				slot13 = slot13 + 2
			elseif slot19 == "o" then
				if slot0.x64 then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("[0x%08x%08x]", slot22, slot21)
					slot13 = slot13 + 8
				else
					if not slot4(slot0, slot13, 4) then
						return
					end

					slot20 = slot5("[0x%08x]", slot21)
					slot13 = slot13 + 4
				end
			elseif slot19 == "i" or slot19 == "I" then
				if slot6[slot5] == 8 and slot0.x64 and slot19 == "I" then
					if not slot4(slot0, slot13, 4) then
						return
					end

					if not slot4(slot0, slot13 + 4, 4) then
						return
					end

					slot20 = slot5("0x%08x%08x", slot23, slot22)
				else
					if slot21 == 8 then
						slot21 = 4
					end

					if not slot4(slot0, slot13, slot21) then
						return
					end

					slot20 = (slot5 ~= "Q" or (slot22 >= 0 and slot22 <= 2147483647) or false) and false
					slot13 = slot13 + slot21
				end
			elseif slot19 == "j" then
				if slot6[slot5] == 8 then
					slot21 = 4
				end

				if not slot4(slot0, slot13, slot21) then
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
					slot20 = slot5("word 0x%04x", slot22 % 65536)
				elseif slot0.x64 then
					slot20 = slot5("0x%02x%06x", (slot22 - slot22 % 16777216) / 16777216, slot22 % 16777216)
				else
					slot20 = "0x" .. slot7(slot22)
				end
			elseif slot19 == "R" then
				slot21 = slot8(slot12, slot13 - 1, slot13 - 1) % 8

				if slot0.rexb then
					slot21 = slot21 + 8
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
							return slot9(slot0)
						end

						slot6 = slot8(slot12, slot13, slot13)
						slot13 = slot13 + 1
					end

					slot11 = ""

					if ((slot6 - slot6 % 8) / 8 - ((slot6 - slot6 % 8) / 8) % 8) / 8 < 3 then
						if slot8 == 4 then
							if slot14 < slot13 then
								return slot9(slot0)
							end

							slot13 = slot13 + 1
							slot9 = ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8 - ((slot8(slot12, slot13, slot13) - slot8(slot12, slot13, slot13) % 8) / 8) % 8) / 8

							if slot0.rexx then
								slot10 = slot10 + 8
								slot0.rexx = false
							end

							if slot10 == 4 then
								slot10 = nil
							end
						end

						if slot6 > 0 or slot8 == 5 then

							-- Decompilation error in this vicinity:
							if slot6 ~= 1 then
								slot21 = 4
							end

							if not slot4(slot0, slot13, slot21) then
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
						slot21 = (slot0.a32 and slot1.D) or slot0.aregs
						slot22 = ""
						slot23 = ""

						if slot8 then
							slot22 = slot21[slot8 + 1]
						elseif not slot9 and slot0.x64 and not slot0.a32 then
							slot22 = "rip"
						end

						slot0.a32 = false

						if slot10 then
							if slot8 then
								slot22 = slot22 .. "+"
							end

							slot23 = slot21[slot10 + 1]

							if slot9 > 0 then
								slot23 = slot23 .. "*" .. 2^slot9
							end
						end

						slot20 = slot5("[%s%s%s]", slot22, slot23, slot11)
					end

					if slot6 < 3 and (not slot2(slot2, "[aRrgp]") or slot2(slot2, "t")) then
						slot20 = slot10[slot5] .. " " .. slot20
					end
				elseif slot19 == "r" then
					slot20 = slot4[slot7 + 1]
				elseif slot19 == "g" then
					slot20 = slot11[slot7 + 1]
				elseif slot19 == "p" then
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
				elseif slot19 == "t" then
				else
					error("bad pattern `" .. slot2 .. "'")
				end
			end

			if slot20 then
				slot3 = (slot3 and slot3 .. ", " .. slot20) or slot20
			end
		end

		slot0.pos = slot13

		return slot12(slot0, slot1, slot3)
	end,
	[":"] = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		slot0[(slot2 == ":" and slot1) or slot0(slot2, 2)] = slot1

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-15, warpins: 2 ---
		if slot0.pos - slot0.start > 5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-18, warpins: 1 ---
			return slot1(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 19-19, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end,
	["*"] = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		return slot0[slot1](slot0, slot1, slot1(slot2, 2))
		--- END OF BLOCK #0 ---



	end,
	["!"] = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		if not slot0(slot0) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-8, warpins: 1 ---
			return slot1(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-23, warpins: 2 ---
		return slot2(slot0, slot3[slot1][((slot3 - slot3 % 8) / 8) % 8 + 1], slot2(slot2, 2))
		--- END OF BLOCK #1 ---



	end,
	sz = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0.o16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0.o16 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-14, warpins: 1 ---
			slot2 = slot0(slot2, ",(.*)")

			if slot0.rexw and slot0(slot2, ",(.*)") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-23, warpins: 1 ---
				slot2 = slot3
				slot0.rexw = false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 24-32, warpins: 4 ---
		return slot1(slot0, slot0(slot2, "^[^,]*"))
		--- END OF BLOCK #1 ---



	end,
	opc2 = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		return slot0(slot0, slot1)
		--- END OF BLOCK #0 ---



	end,
	opc3 = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		return slot0(slot0, slot1[slot2])
		--- END OF BLOCK #0 ---



	end,
	vm = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		return slot0(slot0, slot1[slot0.mrm])
		--- END OF BLOCK #0 ---



	end,
	fp = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		if not slot0(slot0) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-8, warpins: 1 ---
			return slot1(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-17, warpins: 2 ---
		slot5 = slot2 * 8 + ((slot3 - slot3 % 8) / 8) % 8

		if slot3 >= 192 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-18, warpins: 1 ---
			slot5 = slot5 + 64
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 19-25, warpins: 2 ---
		if slot3(slot2[slot5]) == "table" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-27, warpins: 1 ---
			slot6 = slot6[slot4 + 1]
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 28-31, warpins: 2 ---
		return slot4(slot0, slot6)
		--- END OF BLOCK #3 ---



	end,
	rex = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0.rex then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			return slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-11, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 12-18, warpins: 0 ---
		for slot6 in slot1(slot2, ".") do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-16, warpins: 1 ---
			slot0["rex" .. slot6] = true
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 17-18, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 19-21, warpins: 1 ---
		slot0.rex = "rex"

		return
		--- END OF BLOCK #3 ---



	end,
	vex = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0.rex then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			return slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-12, warpins: 2 ---
		slot0.rex = "vex"
		slot3 = slot0.pos

		if slot0.mrm then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-15, warpins: 1 ---
			slot0.mrm = nil
			slot3 = slot3 - 1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 16-22, warpins: 2 ---
		if not slot1(slot0.code, slot3, slot3) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-25, warpins: 1 ---
			return slot2(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 26-29, warpins: 2 ---
		slot3 = slot3 + 1

		if slot4 < 128 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-31, warpins: 1 ---
			slot0.rexr = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 32-34, warpins: 2 ---
		slot5 = 1

		if slot2 == "3" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-42, warpins: 1 ---
			slot4 = ((slot4 - slot4 % 32) / 32 - ((slot4 - slot4 % 32) / 32) % 2) / 2

			if ((slot4 - slot4 % 32) / 32) % 2 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 43-44, warpins: 1 ---
				slot0.rexb = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 45-47, warpins: 2 ---
			if slot4 % 2 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 48-49, warpins: 1 ---
				slot0.rexx = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 50-57, warpins: 2 ---
			if not slot1(slot0.code, slot3, slot3) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 58-60, warpins: 1 ---
				return slot2(slot0)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 61-64, warpins: 2 ---
			slot3 = slot3 + 1

			if slot4 >= 128 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 65-66, warpins: 1 ---
				slot0.rexw = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 67-70, warpins: 3 ---
		slot0.pos = slot3
		slot6 = nil

		if slot5 == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 71-72, warpins: 1 ---
			slot6 = slot3
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 73-74, warpins: 1 ---
			if slot5 == 2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 75-77, warpins: 1 ---
				slot6 = slot4.38
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 78-79, warpins: 1 ---
				if slot5 == 3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 80-82, warpins: 1 ---
					slot6 = slot4.3a
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 83-85, warpins: 1 ---
					return slot0(slot0)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 86-90, warpins: 4 ---
		slot4 = (slot4 - slot4 % 4) / 4

		if slot4 % 4 == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 91-93, warpins: 1 ---
			slot0.o16 = "o16"
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 94-95, warpins: 1 ---
			if slot7 == 2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 96-98, warpins: 1 ---
				slot0.rep = "rep"
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 99-100, warpins: 1 ---
				if slot7 == 3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 101-102, warpins: 1 ---
					slot0.rep = "repne"
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 103-107, warpins: 4 ---
		slot4 = (slot4 - slot4 % 2) / 2

		if slot4 % 2 ~= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 108-109, warpins: 1 ---
			slot0.vexl = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #7 ---

		FLOW; TARGET BLOCK #8



		-- Decompilation error in this vicinity:
		--- BLOCK #8 110-116, warpins: 2 ---
		slot0.vexv = (-1 - slot4) % 16

		return slot5(slot0, slot6)
		--- END OF BLOCK #8 ---



	end,
	nop = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		return slot0(slot0, (slot0.rex and slot2) or "nop")
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end,
	emms = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0.rex ~= "vex" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-8, warpins: 1 ---
			return slot0(slot0, "emms")
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-11, warpins: 1 ---
			if slot0.vexl then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-18, warpins: 1 ---
				slot0.vexl = false

				return slot0(slot0, "zeroall")
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 19-22, warpins: 1 ---
				return slot0(slot0, "zeroupper")
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-23, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end
}

function slot32(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot1 = slot1 or 0
	slot0.start = (slot1 or 0) + 1
	slot0.pos = (slot1 or 0) + 1
	slot0.stop = (slot2 and slot1 + slot2) or #slot0.code
	slot0.imm = nil
	slot0.mrm = false

	slot0(slot0)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 1 ---
	slot1 = 0

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-5, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 6-8, warpins: 1 ---
	if not (slot1 + slot2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-10, warpins: 2 ---
		slot3 = #slot0.code
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 11-21, warpins: 2 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 22-24, warpins: 2 ---
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 25-31, warpins: 0 ---
	while slot0.pos <= slot3 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-25, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-30, warpins: 1 ---
		slot1(slot0, slot0.map1)
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 31-31, warpins: 1 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 31-34, warpins: 1 ---
	if slot0.pos ~= slot0.start then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-37, warpins: 1 ---
		slot2(slot0)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 38-38, warpins: 2 ---
	return
	--- END OF BLOCK #8 ---



end

return {
	create = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot3 = {
			code = slot0
		}

		if not slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			slot4 = 0
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-9, warpins: 2 ---
		slot3.addr = slot4 - 1

		if not slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-11, warpins: 1 ---
			slot4 = io.write
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 12-26, warpins: 2 ---
		slot3.out = slot4
		slot3.symtab = {}
		slot3.disass = slot0
		slot3.hexdump = 16
		slot3.x64 = false
		slot3.map1 = slot1
		slot3.aregs = slot2.D

		return slot3
		--- END OF BLOCK #2 ---



	end,
	create64 = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot3 = slot0(slot0, slot1, slot2)
		slot3.x64 = true
		slot3.map1 = slot1
		slot3.aregs = slot2.Q

		return slot3
		--- END OF BLOCK #0 ---



	end,
	disass = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0(slot0, slot1, slot2):disass()

		return
		--- END OF BLOCK #0 ---



	end,
	disass64 = function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0(slot0, slot1, slot2):disass()

		return
		--- END OF BLOCK #0 ---



	end,
	regname = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 < 8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-8, warpins: 1 ---
			return slot0.D[slot0 + 1]
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-13, warpins: 2 ---
		return slot0.X[slot0 - 7]
		--- END OF BLOCK #1 ---



	end,
	regname64 = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 < 16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-8, warpins: 1 ---
			return slot0.Q[slot0 + 1]
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-13, warpins: 2 ---
		return slot0.X[slot0 - 15]
		--- END OF BLOCK #1 ---



	end
}
