pg = pg or {}
pg.HeroType = {
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
pg.HeroCfg = {
	{
		painting,
		prefab = "zhuque",
		name = "朱雀",
		type = pg.HeroType.QuZ
	},
	{
		painting,
		name = "波特",
		resetLevel = "20",
		prefab = "bote",
		starLevel = 3,
		type = pg.HeroType.QuZ
	},
	{
		painting,
		prefab = "xuefeng",
		name = "雪风",
		type = pg.HeroType.QuZ
	},
	{
		painting,
		prefab = "monagen",
		name = "莫纳根",
		type = pg.HeroType.QuZ
	},
	{
		painting,
		prefab = "zhunuo",
		name = "朱诺",
		type = pg.HeroType.QinX
	},
	{
		painting,
		prefab = "shengdiyage",
		name = "圣地亚哥",
		type = pg.HeroType.QinX
	},
	{
		painting,
		prefab = "jiujinshan",
		name = "旧金山",
		type = pg.HeroType.ZhongX
	},
	{
		painting,
		prefab = "shengwang",
		name = "声望",
		type = pg.HeroType.ZhanL
	},
	{
		painting,
		prefab = "fanji",
		name = "反击",
		type = pg.HeroType.ZhanL
	},
	{
		painting,
		prefab = "Z5",
		name = "Z5",
		type = pg.HeroType.QuZ
	},
	{
		painting,
		prefab = "deyizhi",
		name = "德意志",
		type = pg.HeroType.ZhanL
	},
	{
		painting,
		prefab = "huangjiafangzhou",
		name = "皇家方舟",
		type = pg.HeroType.HangM
	},
	{
		painting,
		prefab = "wushiling",
		name = "五十铃",
		type = pg.HeroType.QinX
	},
	{
		painting,
		prefab = "yishi",
		name = "伊势",
		type = pg.HeroType.ZhanL
	},
	{
		painting,
		prefab = "xinaoerliang",
		name = "新奥尔良",
		type = pg.HeroType.ZhongX
	},
	{
		painting,
		prefab = "jingang",
		name = "金刚",
		type = pg.HeroType.ZhanL
	},
	{
		painting,
		prefab = "yinggelan",
		name = "英格兰",
		type = pg.HeroType.QuZ
	},
	{
		painting,
		prefab = "yatelanda",
		name = "亚特兰大",
		type = pg.HeroType.QinX
	},
	{
		painting,
		name = "北卡罗来纳",
		resetLevel = "30",
		prefab = "beikaluolaina",
		starLevel = 5,
		type = pg.HeroType.ZhanL
	},
	{
		painting,
		prefab = "huashengdun",
		name = "华盛顿",
		type = pg.HeroType.ZhanL
	},
	{
		painting,
		prefab = "zaoshen",
		name = "女灶神",
		type = pg.HeroType.WeiX
	},
	{
		painting,
		prefab = "kunxi",
		name = "昆西",
		type = pg.HeroType.ZhongX
	},
	{
		painting,
		name = "明石",
		resetLevel = "25",
		prefab = "mingshi",
		starLevel = 4,
		type = pg.HeroType.WeiX
	},
	{
		painting,
		name = "最上",
		resetLevel = "30",
		prefab = "zuishang",
		starLevel = 5,
		type = pg.HeroType.QinX
	},
	{
		painting,
		name = "萤火虫",
		resetLevel = "20",
		prefab = "yinghuochong",
		starLevel = 3,
		type = pg.HeroType.QuZ
	}
}
pg.CommonCfg = {
	TeamCount = 5,
	MaxHealth = 100
}
pg.HeroTypeCfg = {
	[pg.HeroType.QuZ] = {
		dropOil = 1,
		name = "驱逐",
		dropGold = 1,
		repairCost = 0.1,
		dropSilver = 0,
		repairTime = 0.2
	},
	[pg.HeroType.QinX] = {
		dropOil = 1,
		name = "轻巡",
		dropGold = 2,
		repairCost = 0.15,
		dropSilver = 0,
		repairTime = 0.3
	},
	[pg.HeroType.ZhongX] = {
		dropOil = 2,
		name = "重巡",
		dropGold = 3,
		repairCost = 0.3,
		dropSilver = 0,
		repairTime = 0.6
	},
	[pg.HeroType.ZhanX] = {
		dropOil = 2,
		name = "战巡",
		dropGold = 4,
		repairCost = 0.5,
		dropSilver = 0,
		repairTime = 0.8
	},
	[pg.HeroType.ZhanL] = {
		dropOil = 3,
		name = "战列",
		dropGold = 6,
		repairCost = 0.8,
		dropSilver = 0,
		repairTime = 1.5
	},
	[pg.HeroType.QinM] = {
		dropOil = 0,
		name = "轻母",
		dropGold = 1,
		repairCost = 0.25,
		dropSilver = 1,
		repairTime = 0.5
	},
	[pg.HeroType.KongM] = {
		dropOil = 2,
		name = "空母",
		dropGold = 2,
		repairCost = 0.4,
		dropSilver = 3,
		repairTime = 1
	},
	[pg.HeroType.QianT] = {
		dropOil = 1,
		name = "潜艇",
		dropGold = 1,
		repairCost = 0.05,
		dropSilver = 0,
		repairTime = 0.1
	},
	[pg.HeroType.LeiX] = {
		dropOil = 2,
		name = "雷巡",
		dropGold = 2,
		repairCost = 0.2,
		dropSilver = 0,
		repairTime = 0.4
	},
	[pg.HeroType.HangX] = {
		dropOil = 2,
		name = "航巡",
		dropGold = 3,
		repairCost = 0.4,
		dropSilver = 1,
		repairTime = 0.9
	},
	[pg.HeroType.HangZ] = {
		dropOil = 3,
		name = "航战",
		dropGold = 4,
		repairCost = 0.5,
		dropSilver = 1,
		repairTime = 1.2
	}
}
pg.LeavePosCfg = {
	{
		{
			-234,
			-6,
			0
		},
		{
			-70,
			45,
			0
		},
		{
			150,
			60,
			0
		},
		{
			330,
			-30,
			0
		}
	}
}
pg.PropertyPosCfg = {
	{
		-90,
		-140,
		0
	},
	{
		95,
		-140,
		0
	},
	{
		-90,
		-175,
		0
	},
	{
		95,
		-175,
		0
	}
}
pg.PropertyCfg = {
	{
		-85,
		-140,
		0
	},
	{
		85,
		-140,
		0
	},
	{
		-85,
		-180,
		0
	},
	{
		85,
		-180,
		0
	}
}
pg.PosCfg = {
	single1 = {
		{
			233,
			30,
			0
		},
		{
			140,
			50,
			0
		},
		{
			50,
			70,
			0
		},
		{
			-40,
			88,
			0
		},
		{
			-125,
			105,
			0
		},
		Buff = "单纵阵： \n 炮击&雷击 +15% \n 防空&回避 -10%",
		friend = {
			-200,
			60,
			0
		},
		qijianPos = {
			233,
			110,
			0
		}
	},
	double1 = {
		{
			145,
			50,
			0
		},
		{
			105,
			10,
			-10
		},
		{
			50,
			70,
			0
		},
		{
			10,
			30,
			-10
		},
		{
			-40,
			90,
			0
		},
		Buff = "复纵阵： \n 航空 +15% \n 炮击&雷击 -10%",
		friend = {
			-90,
			-20,
			-10
		},
		qijianPos = {
			145,
			125,
			0
		}
	},
	round1 = {
		{
			50,
			70,
			0
		},
		{
			135,
			50,
			-10
		},
		{
			-40,
			90,
			10
		},
		{
			85,
			105,
			10
		},
		{
			5,
			30,
			-10
		},
		Buff = "轮型阵： \n 航空 +15% \n 炮击&雷击 -10% ",
		friend = {
			-125,
			40,
			15
		},
		qijianPos = {
			50,
			140,
			0
		}
	},
	taper1 = {
		{
			145,
			50,
			0
		},
		{
			90,
			105,
			0
		},
		{
			10,
			30,
			0
		},
		{
			55,
			70,
			0
		},
		{
			5,
			125,
			0
		},
		Buff = "锥形阵： \n 航空 +15% \n 炮击&雷击 -10% ",
		friend = {
			-80,
			-15,
			0
		},
		qijianPos = {
			145,
			125,
			0
		}
	},
	single = {
		{
			290,
			40,
			0
		},
		{
			165,
			65,
			0
		},
		{
			50,
			90,
			0
		},
		{
			-55,
			110,
			0
		},
		{
			-153,
			133,
			0
		},
		Buff = "单纵阵： \n 炮击&雷击 +15% \n 防空&回避 -10%",
		friend = {
			-245,
			90,
			0
		},
		qijianPos = {
			290,
			100,
			0
		}
	},
	double = {
		{
			165,
			65,
			0
		},
		{
			115,
			0,
			-10
		},
		{
			50,
			90,
			0
		},
		{
			-5,
			30,
			-10
		},
		{
			-55,
			110,
			0
		},
		Buff = "复纵阵： \n 航空 +15% \n 炮击&雷击 -10%",
		friend = {
			-115,
			-10,
			-10
		},
		qijianPos = {
			168,
			125,
			0
		}
	},
	round = {
		{
			50,
			90,
			0
		},
		{
			165,
			65,
			-10
		},
		{
			-55,
			110,
			10
		},
		{
			95,
			140,
			10
		},
		{
			-5,
			30,
			-10
		},
		Buff = "轮型阵： \n 航空 +15% \n 炮击&雷击 -10% ",
		friend = {
			-155,
			65,
			15
		},
		qijianPos = {
			50,
			150,
			0
		}
	},
	taper = {
		{
			165,
			65,
			0
		},
		{
			95,
			140,
			0
		},
		{
			0,
			30,
			0
		},
		{
			50,
			90,
			0
		},
		{
			-5,
			160,
			0
		},
		Buff = "锥形阵： \n 航空 +15% \n 炮击&雷击 -10% ",
		friend = {
			-115,
			-10,
			0
		},
		qijianPos = {
			165,
			125,
			0
		}
	}
}

return
