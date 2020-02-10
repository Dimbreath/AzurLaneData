pg = pg or {}
slot0 = pg
slot0.HeroType = {
	ZhongX = 3,
	QinX = 2,
	QuZ = 1,
	HangZ = 11,
	LeiX = 9,
	ZhanL = 5,
	HangX = 10,
	QinM = 6,
	WeiX = 12,
	KongM = 7,
	QianT = 8,
	ZhanX = 4
}
slot1 = slot0.HeroType
slot3.type = slot1.QuZ
slot3[1] = painting
slot2[1] = {
	prefab = "zhuque",
	name = "朱雀"
}
slot3.type = slot1.QuZ
slot3[1] = painting
slot2[2] = {
	name = "波特",
	resetLevel = "20",
	prefab = "bote",
	starLevel = 3
}
slot3.type = slot1.QuZ
slot3[1] = painting
slot2[3] = {
	prefab = "xuefeng",
	name = "雪风"
}
slot3.type = slot1.QuZ
slot3[1] = painting
slot2[4] = {
	prefab = "monagen",
	name = "莫纳根"
}
slot3.type = slot1.QinX
slot3[1] = painting
slot2[5] = {
	prefab = "zhunuo",
	name = "朱诺"
}
slot3.type = slot1.QinX
slot3[1] = painting
slot2[6] = {
	prefab = "shengdiyage",
	name = "圣地亚哥"
}
slot3.type = slot1.ZhongX
slot3[1] = painting
slot2[7] = {
	prefab = "jiujinshan",
	name = "旧金山"
}
slot3.type = slot1.ZhanL
slot3[1] = painting
slot2[8] = {
	prefab = "shengwang",
	name = "声望"
}
slot3.type = slot1.ZhanL
slot3[1] = painting
slot2[9] = {
	prefab = "fanji",
	name = "反击"
}
slot3.type = slot1.QuZ
slot3[1] = painting
slot2[10] = {
	prefab = "Z5",
	name = "Z5"
}
slot3.type = slot1.ZhanL
slot3[1] = painting
slot2[11] = {
	prefab = "deyizhi",
	name = "德意志"
}
slot3.type = slot1.HangM
slot3[1] = painting
slot2[12] = {
	prefab = "huangjiafangzhou",
	name = "皇家方舟"
}
slot3.type = slot1.QinX
slot3[1] = painting
slot2[13] = {
	prefab = "wushiling",
	name = "五十铃"
}
slot3.type = slot1.ZhanL
slot3[1] = painting
slot2[14] = {
	prefab = "yishi",
	name = "伊势"
}
slot3.type = slot1.ZhongX
slot3[1] = painting
slot2[15] = {
	prefab = "xinaoerliang",
	name = "新奥尔良"
}
slot3.type = slot1.ZhanL
slot3[1] = painting
slot2[16] = {
	prefab = "jingang",
	name = "金刚"
}
slot3.type = slot1.QuZ
slot3[1] = painting
slot2[17] = {
	prefab = "yinggelan",
	name = "英格兰"
}
slot3.type = slot1.QinX
slot3[1] = painting
slot2[18] = {
	prefab = "yatelanda",
	name = "亚特兰大"
}
slot3.type = slot1.ZhanL
slot3[1] = painting
slot2[19] = {
	name = "北卡罗来纳",
	resetLevel = "30",
	prefab = "beikaluolaina",
	starLevel = 5
}
slot3.type = slot1.ZhanL
slot3[1] = painting
slot2[20] = {
	prefab = "huashengdun",
	name = "华盛顿"
}
slot3.type = slot1.WeiX
slot3[1] = painting
slot2[21] = {
	prefab = "zaoshen",
	name = "女灶神"
}
slot3.type = slot1.ZhongX
slot3[1] = painting
slot2[22] = {
	prefab = "kunxi",
	name = "昆西"
}
slot3.type = slot1.WeiX
slot3[1] = painting
slot2[23] = {
	name = "明石",
	resetLevel = "25",
	prefab = "mingshi",
	starLevel = 4
}
slot3.type = slot1.QinX
slot3[1] = painting
slot2[24] = {
	name = "最上",
	resetLevel = "30",
	prefab = "zuishang",
	starLevel = 5
}
slot3.type = slot1.QuZ
slot3[1] = painting
slot2[25] = {
	name = "萤火虫",
	resetLevel = "20",
	prefab = "yinghuochong",
	starLevel = 3
}
slot0.HeroCfg = {}
slot0.CommonCfg = {
	TeamCount = 5,
	MaxHealth = 100
}
slot2[slot1.QuZ] = {
	dropOil = 1,
	name = "驱逐",
	dropGold = 1,
	repairCost = 0.1,
	dropSilver = 0,
	repairTime = 0.2
}
slot2[slot1.QinX] = {
	dropOil = 1,
	name = "轻巡",
	dropGold = 2,
	repairCost = 0.15,
	dropSilver = 0,
	repairTime = 0.3
}
slot2[slot1.ZhongX] = {
	dropOil = 2,
	name = "重巡",
	dropGold = 3,
	repairCost = 0.3,
	dropSilver = 0,
	repairTime = 0.6
}
slot2[slot1.ZhanX] = {
	dropOil = 2,
	name = "战巡",
	dropGold = 4,
	repairCost = 0.5,
	dropSilver = 0,
	repairTime = 0.8
}
slot2[slot1.ZhanL] = {
	dropOil = 3,
	name = "战列",
	dropGold = 6,
	repairCost = 0.8,
	dropSilver = 0,
	repairTime = 1.5
}
slot2[slot1.QinM] = {
	dropOil = 0,
	name = "轻母",
	dropGold = 1,
	repairCost = 0.25,
	dropSilver = 1,
	repairTime = 0.5
}
slot2[slot1.KongM] = {
	dropOil = 2,
	name = "空母",
	dropGold = 2,
	repairCost = 0.4,
	dropSilver = 3,
	repairTime = 1
}
slot2[slot1.QianT] = {
	dropOil = 1,
	name = "潜艇",
	dropGold = 1,
	repairCost = 0.05,
	dropSilver = 0,
	repairTime = 0.1
}
slot2[slot1.LeiX] = {
	dropOil = 2,
	name = "雷巡",
	dropGold = 2,
	repairCost = 0.2,
	dropSilver = 0,
	repairTime = 0.4
}
slot2[slot1.HangX] = {
	dropOil = 2,
	name = "航巡",
	dropGold = 3,
	repairCost = 0.4,
	dropSilver = 1,
	repairTime = 0.9
}
slot2[slot1.HangZ] = {
	dropOil = 3,
	name = "航战",
	dropGold = 4,
	repairCost = 0.5,
	dropSilver = 1,
	repairTime = 1.2
}
slot0.HeroTypeCfg = {}
slot3[1] = {
	-234,
	-6,
	0
}
slot3[2] = {
	-70,
	45,
	0
}
slot3[3] = {
	150,
	60,
	0
}
slot3[4] = {
	330,
	-30,
	0
}
slot2[1] = {}
slot0.LeavePosCfg = {}
slot2[1] = {
	-90,
	-140,
	0
}
slot2[2] = {
	95,
	-140,
	0
}
slot2[3] = {
	-90,
	-175,
	0
}
slot2[4] = {
	95,
	-175,
	0
}
slot0.PropertyPosCfg = {}
slot2[1] = {
	-85,
	-140,
	0
}
slot2[2] = {
	85,
	-140,
	0
}
slot2[3] = {
	-85,
	-180,
	0
}
slot2[4] = {
	85,
	-180,
	0
}
slot0.PropertyCfg = {}
slot3[1] = {
	233,
	30,
	0
}
slot3[2] = {
	140,
	50,
	0
}
slot3[3] = {
	50,
	70,
	0
}
slot3[4] = {
	-40,
	88,
	0
}
slot3[5] = {
	-125,
	105,
	0
}
slot3.friend = {
	-200,
	60,
	0
}
slot3.qijianPos = {
	233,
	110,
	0
}
slot2.single1 = {
	Buff = "单纵阵： \n 炮击&雷击 +15% \n 防空&回避 -10%"
}
slot3[1] = {
	145,
	50,
	0
}
slot3[2] = {
	105,
	10,
	-10
}
slot3[3] = {
	50,
	70,
	0
}
slot3[4] = {
	10,
	30,
	-10
}
slot3[5] = {
	-40,
	90,
	0
}
slot3.friend = {
	-90,
	-20,
	-10
}
slot3.qijianPos = {
	145,
	125,
	0
}
slot2.double1 = {
	Buff = "复纵阵： \n 航空 +15% \n 炮击&雷击 -10%"
}
slot3[1] = {
	50,
	70,
	0
}
slot3[2] = {
	135,
	50,
	-10
}
slot3[3] = {
	-40,
	90,
	10
}
slot3[4] = {
	85,
	105,
	10
}
slot3[5] = {
	5,
	30,
	-10
}
slot3.friend = {
	-125,
	40,
	15
}
slot3.qijianPos = {
	50,
	140,
	0
}
slot2.round1 = {
	Buff = "轮型阵： \n 航空 +15% \n 炮击&雷击 -10% "
}
slot3[1] = {
	145,
	50,
	0
}
slot3[2] = {
	90,
	105,
	0
}
slot3[3] = {
	10,
	30,
	0
}
slot3[4] = {
	55,
	70,
	0
}
slot3[5] = {
	5,
	125,
	0
}
slot3.friend = {
	-80,
	-15,
	0
}
slot3.qijianPos = {
	145,
	125,
	0
}
slot2.taper1 = {
	Buff = "锥形阵： \n 航空 +15% \n 炮击&雷击 -10% "
}
slot3[1] = {
	290,
	40,
	0
}
slot3[2] = {
	165,
	65,
	0
}
slot3[3] = {
	50,
	90,
	0
}
slot3[4] = {
	-55,
	110,
	0
}
slot3[5] = {
	-153,
	133,
	0
}
slot3.friend = {
	-245,
	90,
	0
}
slot3.qijianPos = {
	290,
	100,
	0
}
slot2.single = {
	Buff = "单纵阵： \n 炮击&雷击 +15% \n 防空&回避 -10%"
}
slot3[1] = {
	165,
	65,
	0
}
slot3[2] = {
	115,
	0,
	-10
}
slot3[3] = {
	50,
	90,
	0
}
slot3[4] = {
	-5,
	30,
	-10
}
slot3[5] = {
	-55,
	110,
	0
}
slot3.friend = {
	-115,
	-10,
	-10
}
slot3.qijianPos = {
	168,
	125,
	0
}
slot2.double = {
	Buff = "复纵阵： \n 航空 +15% \n 炮击&雷击 -10%"
}
slot3[1] = {
	50,
	90,
	0
}
slot3[2] = {
	165,
	65,
	-10
}
slot3[3] = {
	-55,
	110,
	10
}
slot3[4] = {
	95,
	140,
	10
}
slot3[5] = {
	-5,
	30,
	-10
}
slot3.friend = {
	-155,
	65,
	15
}
slot3.qijianPos = {
	50,
	150,
	0
}
slot2.round = {
	Buff = "轮型阵： \n 航空 +15% \n 炮击&雷击 -10% "
}
slot3[1] = {
	165,
	65,
	0
}
slot3[2] = {
	95,
	140,
	0
}
slot3[3] = {
	0,
	30,
	0
}
slot3[4] = {
	50,
	90,
	0
}
slot3[5] = {
	-5,
	160,
	0
}
slot3.friend = {
	-115,
	-10,
	0
}
slot3.qijianPos = {
	165,
	125,
	0
}
slot2.taper = {
	Buff = "锥形阵： \n 航空 +15% \n 炮击&雷击 -10% "
}
slot0.PosCfg = {}
