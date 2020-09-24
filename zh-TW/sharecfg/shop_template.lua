pg = pg or {}
pg.shop_template = {
	{
		group_type = 0,
		resource_num = 100,
		desc = "100鑽石擴充裝備容量+20",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "equip_bag_size",
		group = 0,
		num = 20,
		discount = 0,
		resource_type = 14,
		id = 1,
		genre = "",
		discount_time = {},
		limit_args = {}
	},
	{
		group_type = 0,
		resource_num = 200,
		desc = "200鑽石擴充船塢容量+10",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "ship_bag_size",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 14,
		id = 2,
		genre = "",
		discount_time = {},
		limit_args = {
			"count",
			0,
			1999
		}
	},
	{
		group_type = 0,
		resource_num = 300,
		desc = "300鑽石擴充後宅休息床位+1",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_exp_pos",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 3,
		genre = "",
		discount_time = {},
		limit_args = {
			{
				"number",
				2,
				2
			}
		}
	},
	{
		group_type = 0,
		resource_num = 500,
		desc = "500鑽石擴充後宅休息床位+1",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_exp_pos",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 4,
		genre = "",
		discount_time = {},
		limit_args = {
			{
				"number",
				3,
				3
			}
		}
	},
	{
		group_type = 0,
		resource_num = 100,
		desc = "擴充食物容量，前10次擴充每次消耗100鑽石",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_food_max",
		group = 0,
		num = 2000,
		discount = 0,
		resource_type = 14,
		id = 5,
		genre = "backyard_food_extend",
		discount_time = {},
		limit_args = {
			"count",
			0,
			9
		}
	},
	{
		group_type = 0,
		resource_num = 200,
		desc = "擴充食物容量，第11次以後擴充消耗200鑽石",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_food_max",
		group = 0,
		num = 2000,
		discount = 0,
		resource_type = 14,
		id = 6,
		genre = "backyard_food_extend",
		discount_time = {},
		limit_args = {
			"count",
			10,
			24
		}
	},
	{
		group_type = 0,
		resource_num = -1,
		desc = "升級貿易港",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "tradingport_level",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 7,
		genre = "",
		discount_time = {},
		limit_args = {}
	},
	{
		group_type = 0,
		resource_num = -1,
		desc = "升級煉油廠",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "oilfield_level",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 8,
		genre = "",
		discount_time = {},
		limit_args = {}
	},
	{
		group_type = 0,
		resource_num = -1,
		desc = "商業街升級",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "shop_street_level",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 9,
		genre = "",
		discount_time = {},
		limit_args = {}
	},
	{
		group_type = 0,
		resource_num = 50,
		desc = "刷新商業街",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "shop_street_flash",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 10,
		genre = "shop_street_upgrade",
		discount_time = {},
		limit_args = {
			"count",
			0,
			3
		}
	},
	{
		group_type = 0,
		resource_num = 100,
		desc = "刷新商業街",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "shop_street_flash",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 11,
		genre = "shop_street_upgrade",
		discount_time = {},
		limit_args = {
			"count",
			4,
			9
		}
	},
	{
		group_type = 0,
		resource_num = 100,
		desc = "花費100鑽石購買3000物資",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 3000,
		discount = 0,
		resource_type = 14,
		id = 12,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			1
		}
	},
	{
		group_type = 0,
		resource_num = 50,
		desc = "花費50鑽石購買500石油",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = -1,
		discount = 0,
		resource_type = 14,
		id = 13,
		genre = "buy_oil",
		discount_time = {},
		limit_args = {
			"count",
			0,
			1
		},
		effect_args = {
			2
		}
	},
	{
		group_type = 0,
		resource_num = 100,
		desc = "花費100鑽石購買500石油",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = -1,
		discount = 0,
		resource_type = 14,
		id = 14,
		genre = "buy_oil",
		discount_time = {},
		limit_args = {
			"count",
			2,
			5
		},
		effect_args = {
			2
		}
	},
	{
		group_type = 0,
		resource_num = 200,
		desc = "花費200鑽石購買500石油",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = -1,
		discount = 0,
		resource_type = 14,
		id = 15,
		genre = "buy_oil",
		discount_time = {},
		limit_args = {
			"count",
			6,
			9
		},
		effect_args = {
			2
		}
	},
	{
		group_type = 0,
		resource_num = 400,
		desc = "花費400鑽石購買500石油",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = -1,
		discount = 0,
		resource_type = 14,
		id = 16,
		genre = "buy_oil",
		discount_time = {},
		limit_args = {
			"count",
			10,
			15
		},
		effect_args = {
			2
		}
	},
	{
		group_type = 0,
		resource_num = 500,
		desc = "500鑽石擴充後宅休息欄位+1",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_fix_pos",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 17,
		genre = "",
		discount_time = {},
		limit_args = {}
	},
	{
		group_type = 0,
		resource_num = 800,
		desc = "800鑽石擴充後宅休息床位+1",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_exp_pos",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 18,
		genre = "",
		discount_time = {},
		limit_args = {
			{
				"number",
				4,
				4
			}
		}
	},
	{
		group_type = 0,
		resource_num = 500,
		desc = "800鑽石購買擴充後宅二層傢俱",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_floor",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 19,
		genre = "",
		discount_time = {},
		limit_args = {
			{
				"count",
				1,
				1
			},
			{
				"level",
				3
			}
		}
	},
	{
		group_type = 0,
		resource_num = -1,
		desc = "升級大講堂",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "class_room_level",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 20,
		genre = "",
		discount_time = {},
		limit_args = {}
	},
	{
		group_type = 0,
		resource_num = 500,
		desc = "500鑽石開啟戰術學院第三技能學習欄位",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "skill_room_pos",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 21,
		genre = "skill_room_upgrade",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {
			{
				"number",
				2,
				2
			}
		}
	},
	[23] = {
		group_type = 0,
		resource_num = 200,
		desc = "200鑽石擴充指揮喵容量+10",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "commander_bag_size",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 14,
		id = 23,
		genre = "",
		discount_time = {},
		limit_args = {}
	},
	[24] = {
		group_type = 0,
		resource_num = 450,
		desc = "花费450钻石购买15000物资",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 15000,
		discount = 0,
		resource_type = 14,
		id = 24,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			1
		}
	},
	[25] = {
		group_type = 0,
		resource_num = 300,
		desc = "300钻石扩展船坞容量+10（船坞数量在2001~4000时）",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1,
		time = "always",
		effect_args = "ship_bag_size",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 14,
		id = 25,
		genre = "",
		discount_time = {},
		limit_args = {
			"count",
			2000,
			2999
		}
	},
	[26] = {
		group_type = 0,
		resource_num = 1200,
		desc = "1200钻石扩展后宅休息床位+1",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_exp_pos",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 26,
		genre = "",
		discount_time = {},
		limit_args = {
			{
				"number",
				5,
				5
			}
		}
	},
	[21001] = {
		group_type = 0,
		resource_num = 1500,
		desc = "1500物資購買1個快速完成工具",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21001,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15003
		}
	},
	[21002] = {
		group_type = 0,
		resource_num = 600,
		desc = "600物資購買1個艦艇攻擊教材T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21002,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16001
		}
	},
	[21003] = {
		group_type = 0,
		resource_num = 600,
		desc = "600物資購買1個艦艇防禦教材T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21003,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16011
		}
	},
	[21004] = {
		group_type = 0,
		resource_num = 600,
		desc = "600物資購買1個艦艇輔助教材T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21004,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16021
		}
	},
	[21005] = {
		group_type = 0,
		resource_num = 750,
		desc = "750物資購買1個通用部件T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21005,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17001
		}
	},
	[21006] = {
		group_type = 0,
		resource_num = 750,
		desc = "750物資購買1個主炮部件T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21006,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17011
		}
	},
	[21007] = {
		group_type = 0,
		resource_num = 750,
		desc = "750物資購買1個魚雷部件T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21007,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17021
		}
	},
	[21008] = {
		group_type = 0,
		resource_num = 750,
		desc = "750物資購買1個防空炮部件T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21008,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17031
		}
	},
	[21009] = {
		group_type = 0,
		resource_num = 750,
		desc = "750物資購買1個艦載機部件T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21009,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17041
		}
	},
	[21010] = {
		group_type = 0,
		resource_num = 1200,
		desc = "1200物資購買1個艦艇攻擊教材T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21010,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16002
		}
	},
	[21011] = {
		group_type = 0,
		resource_num = 1200,
		desc = "1200物資購買1個艦艇防禦教材T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21011,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16012
		}
	},
	[21012] = {
		group_type = 0,
		resource_num = 1200,
		desc = "1200物資購買1個艦艇輔助教材T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21012,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16022
		}
	},
	[21013] = {
		group_type = 0,
		resource_num = 1500,
		desc = "1500物資購買1個通用部件T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21013,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17002
		}
	},
	[21014] = {
		group_type = 0,
		resource_num = 1500,
		desc = "1500物資購買1個主炮部件T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21014,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17012
		}
	},
	[21015] = {
		group_type = 0,
		resource_num = 1500,
		desc = "1500物資購買1個魚雷部件T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21015,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17022
		}
	},
	[21016] = {
		group_type = 0,
		resource_num = 1500,
		desc = "1500物資購買1個防空炮部件T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21016,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17032
		}
	},
	[21017] = {
		group_type = 0,
		resource_num = 1500,
		desc = "1500物資購買1個艦載機部件T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21017,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17042
		}
	},
	[21018] = {
		group_type = 0,
		resource_num = 2400,
		desc = "2400物資購買1個艦艇攻擊教材T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21018,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16003
		}
	},
	[21019] = {
		group_type = 0,
		resource_num = 2400,
		desc = "2400物資購買1個艦艇防禦教材T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21019,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16013
		}
	},
	[21020] = {
		group_type = 0,
		resource_num = 2400,
		desc = "2400物資購買1個艦艇輔助教材T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21020,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16023
		}
	},
	[21021] = {
		group_type = 0,
		resource_num = 3000,
		desc = "3000物資購買1個通用部件T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21021,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17003
		}
	},
	[21022] = {
		group_type = 0,
		resource_num = 3000,
		desc = "3000物資購買1個主炮部件T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21022,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17013
		}
	},
	[21023] = {
		group_type = 0,
		resource_num = 3000,
		desc = "3000物資購買1個魚雷部件T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21023,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17023
		}
	},
	[21024] = {
		group_type = 0,
		resource_num = 3000,
		desc = "3000物資購買1個防空炮部件T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21024,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17033
		}
	},
	[21025] = {
		group_type = 0,
		resource_num = 3000,
		desc = "3000物資購買1個艦載機部件T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21025,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17043
		}
	},
	[21026] = {
		group_type = 0,
		resource_num = 2000,
		desc = "2000物資購買1個心智模型",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21026,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			20001
		}
	},
	[21027] = {
		group_type = 0,
		resource_num = 300,
		desc = "300物資購買10個酸素可樂",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 1,
		id = 21027,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50001
		}
	},
	[21028] = {
		group_type = 0,
		resource_num = 900,
		desc = "900物資購買10個祕製冷卻水",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 1,
		id = 21028,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50002
		}
	},
	[21029] = {
		group_type = 0,
		resource_num = 1500,
		desc = "1500物資購買10個魚雷天婦羅",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 1,
		id = 21029,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50003
		}
	},
	[21030] = {
		group_type = 0,
		resource_num = 3000,
		desc = "3000物資購買10個西瓜",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 1,
		id = 21030,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50004
		}
	},
	[21031] = {
		group_type = 0,
		resource_num = 6000,
		desc = "6000物資購買10個皇家料理",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 1,
		id = 21031,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50005
		}
	},
	[21032] = {
		group_type = 0,
		resource_num = 12000,
		desc = "12000物資購買10個滿漢全席",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 1,
		id = 21032,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50006
		}
	},
	[23001] = {
		group_type = 0,
		resource_num = 2000,
		desc = "2000功勳兌換1個心智模型",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 23001,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			20001
		}
	},
	[24001] = {
		group_type = 0,
		resource_num = 20,
		desc = "20鑽石購買1個快速完成工具",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24001,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15003
		}
	},
	[24002] = {
		group_type = 0,
		resource_num = 40,
		desc = "40鑽石購買2個快速完成工具",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 2,
		discount = 0,
		resource_type = 14,
		id = 24002,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15003
		}
	},
	[24003] = {
		group_type = 0,
		resource_num = 30,
		desc = "30鑽石購買1個心智模型",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24003,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			20001
		}
	},
	[24004] = {
		group_type = 0,
		resource_num = 60,
		desc = "60鑽石購買2個心智模型",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 2,
		discount = 0,
		resource_type = 14,
		id = 24004,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			20001
		}
	},
	[24005] = {
		group_type = 0,
		resource_num = 20,
		desc = "20鑽石購買1個艦艇攻擊教材T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24005,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16001
		}
	},
	[24006] = {
		group_type = 0,
		resource_num = 20,
		desc = "20鑽石購買1個艦艇防禦教材T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24006,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16011
		}
	},
	[24007] = {
		group_type = 0,
		resource_num = 20,
		desc = "20鑽石購買1個艦艇輔助教材T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24007,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16021
		}
	},
	[24008] = {
		group_type = 0,
		resource_num = 40,
		desc = "40鑽石購買1個艦艇攻擊教材T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24008,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16002
		}
	},
	[24009] = {
		group_type = 0,
		resource_num = 40,
		desc = "40鑽石購買1個艦艇防禦教材T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24009,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16012
		}
	},
	[24010] = {
		group_type = 0,
		resource_num = 40,
		desc = "40鑽石購買1個艦艇輔助教材T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24010,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16022
		}
	},
	[24011] = {
		group_type = 0,
		resource_num = 80,
		desc = "80鑽石購買1個艦艇攻擊教材T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24011,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16003
		}
	},
	[24012] = {
		group_type = 0,
		resource_num = 80,
		desc = "80鑽石購買1個艦艇防禦教材T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24012,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16013
		}
	},
	[24013] = {
		group_type = 0,
		resource_num = 80,
		desc = "80鑽石購買1個艦艇輔助教材T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24013,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16023
		}
	},
	[31011] = {
		group_type = 0,
		resource_num = 80,
		desc = "80物資兌換1個克洛希德科技箱T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31011,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30011
		}
	},
	[31012] = {
		group_type = 0,
		resource_num = 400,
		desc = "400物資兌換1個克洛希德科技箱T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31012,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30012
		}
	},
	[31013] = {
		group_type = 0,
		resource_num = 2000,
		desc = "2000物資兌換1個克洛希德科技箱T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31013,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30013
		}
	},
	[31014] = {
		group_type = 0,
		resource_num = 5000,
		desc = "5000物資兌換1個克洛希德科技箱T4",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31014,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30014
		}
	},
	[31111] = {
		group_type = 0,
		resource_num = 400,
		desc = "400物資兌換5個克洛希德科技箱T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31111,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30011
		}
	},
	[31112] = {
		group_type = 0,
		resource_num = 2000,
		desc = "2000物資兌換5個克洛希德科技箱T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31112,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30012
		}
	},
	[31113] = {
		group_type = 0,
		resource_num = 10000,
		desc = "10000物資兌換5個克洛希德科技箱T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31113,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30013
		}
	},
	[31114] = {
		group_type = 0,
		resource_num = 25000,
		desc = "25000物資兌換5個克洛希德科技箱T4",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31114,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30014
		}
	},
	[31021] = {
		group_type = 0,
		resource_num = 80,
		desc = "80物資兌換1個威斯克科技箱T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31021,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30021
		}
	},
	[31022] = {
		group_type = 0,
		resource_num = 400,
		desc = "400物資兌換1個威斯克科技箱T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31022,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30022
		}
	},
	[31023] = {
		group_type = 0,
		resource_num = 2000,
		desc = "2000物資兌換1個威斯克科技箱T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31023,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30023
		}
	},
	[31024] = {
		group_type = 0,
		resource_num = 5000,
		desc = "5000物資兌換1個威斯克科技箱T4",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31024,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30024
		}
	},
	[31121] = {
		group_type = 0,
		resource_num = 400,
		desc = "400物資兌換5個威斯克科技箱T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31121,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30021
		}
	},
	[31122] = {
		group_type = 0,
		resource_num = 2000,
		desc = "2000物資兌換5個威斯克科技箱T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31122,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30022
		}
	},
	[31123] = {
		group_type = 0,
		resource_num = 10000,
		desc = "10000物資兌換5個威斯克科技箱T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31123,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30023
		}
	},
	[31124] = {
		group_type = 0,
		resource_num = 25000,
		desc = "25000物資兌換5個威斯克科技箱T4",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31124,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30024
		}
	},
	[31031] = {
		group_type = 0,
		resource_num = 80,
		desc = "80物資兌換1個藏王重工科技箱T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31031,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30031
		}
	},
	[31032] = {
		group_type = 0,
		resource_num = 400,
		desc = "400物資兌換1個藏王重工科技箱T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31032,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30032
		}
	},
	[31033] = {
		group_type = 0,
		resource_num = 2000,
		desc = "2000物資兌換1個藏王重工科技箱T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31033,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30033
		}
	},
	[31034] = {
		group_type = 0,
		resource_num = 5000,
		desc = "5000物資兌換1個藏王重工科技箱T4",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31034,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30034
		}
	},
	[31131] = {
		group_type = 0,
		resource_num = 400,
		desc = "400物資兌換5個藏王重工科技箱T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31131,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30031
		}
	},
	[31132] = {
		group_type = 0,
		resource_num = 2000,
		desc = "2000物資兌換5個藏王重工科技箱T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31132,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30032
		}
	},
	[31133] = {
		group_type = 0,
		resource_num = 10000,
		desc = "10000物資兌換5個藏王重工科技箱T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31133,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30033
		}
	},
	[31134] = {
		group_type = 0,
		resource_num = 25000,
		desc = "25000物資兌換5個藏王重工科技箱T4",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31134,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30034
		}
	},
	[31041] = {
		group_type = 0,
		resource_num = 80,
		desc = "80物資兌換1個伯魯克科技箱T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31041,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30041
		}
	},
	[31042] = {
		group_type = 0,
		resource_num = 400,
		desc = "400物資兌換1個伯魯克科技箱T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31042,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30042
		}
	},
	[31043] = {
		group_type = 0,
		resource_num = 2000,
		desc = "2000物資兌換1個伯魯克科技箱T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31043,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30043
		}
	},
	[31044] = {
		group_type = 0,
		resource_num = 5000,
		desc = "5000物資兌換1個伯魯克科技箱T4",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31044,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30044
		}
	},
	[31141] = {
		group_type = 0,
		resource_num = 400,
		desc = "400物資兌換5個伯魯克科技箱T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31141,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30041
		}
	},
	[31142] = {
		group_type = 0,
		resource_num = 2000,
		desc = "2000物資兌換5個伯魯克科技箱T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31142,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30042
		}
	},
	[31143] = {
		group_type = 0,
		resource_num = 10000,
		desc = "10000物資兌換5個伯魯克科技箱T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31143,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30043
		}
	},
	[31144] = {
		group_type = 0,
		resource_num = 25000,
		desc = "25000物資兌換5個伯魯克科技箱T4",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31144,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30044
		}
	},
	[31989] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物資兌換1個外觀裝備箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31989,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30312
		}
	},
	[31990] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物資兌換1個外觀裝備箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31990,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30311
		}
	},
	[31991] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物資兌換1個外觀裝備箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31991,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30310
		}
	},
	[31992] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物資兌換1個外觀裝備箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31992,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30309
		}
	},
	[31993] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物資兌換1個外觀裝備箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31993,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30308
		}
	},
	[31994] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物資兌換1個外觀裝備箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31994,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30307
		}
	},
	[31995] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物資兌換1個外觀裝備箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31995,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30306
		}
	},
	[31996] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物資兌換1個外觀裝備箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31996,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30305
		}
	},
	[31997] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物資兌換1個外觀裝備箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31997,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30304
		}
	},
	[31998] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物資兌換1個海王星聯動外觀裝備箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31998,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30303
		}
	},
	[31999] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物資兌換1個外觀裝備箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31999,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30302
		}
	},
	[33011] = {
		group_type = 0,
		resource_num = 100,
		desc = "100功勳兌換1個克洛希德科技箱T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33011,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30011
		}
	},
	[33012] = {
		group_type = 0,
		resource_num = 300,
		desc = "300功勳兌換1個克洛希德科技箱T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33012,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30012
		}
	},
	[33013] = {
		group_type = 0,
		resource_num = 600,
		desc = "600功勳兌換1個克洛希德科技箱T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33013,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30013
		}
	},
	[33014] = {
		group_type = 0,
		resource_num = 1500,
		desc = "1500功勳兌換1個克洛希德科技箱T4",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33014,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30014
		}
	},
	[33021] = {
		group_type = 0,
		resource_num = 100,
		desc = "100功勳兌換1個威斯克科技箱T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33021,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30021
		}
	},
	[33022] = {
		group_type = 0,
		resource_num = 300,
		desc = "300功勳兌換1個威斯克科技箱T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33022,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30022
		}
	},
	[33023] = {
		group_type = 0,
		resource_num = 600,
		desc = "600功勳兌換1個威斯克科技箱T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33023,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30023
		}
	},
	[33024] = {
		group_type = 0,
		resource_num = 1500,
		desc = "1500功勳兌換1個威斯克科技箱T4",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33024,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30024
		}
	},
	[33031] = {
		group_type = 0,
		resource_num = 100,
		desc = "100功勳兌換1個藏王重工科技箱T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33031,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30031
		}
	},
	[33032] = {
		group_type = 0,
		resource_num = 300,
		desc = "300功勳兌換1個藏王重工科技箱T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33032,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30032
		}
	},
	[33033] = {
		group_type = 0,
		resource_num = 600,
		desc = "600功勳兌換1個藏王重工科技箱T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33033,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30033
		}
	},
	[33034] = {
		group_type = 0,
		resource_num = 1500,
		desc = "1500功勳兌換1個藏王重工科技箱T4",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33034,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30034
		}
	},
	[33041] = {
		group_type = 0,
		resource_num = 100,
		desc = "100功勳兌換1個伯魯克科技箱T1",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33041,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30041
		}
	},
	[33042] = {
		group_type = 0,
		resource_num = 300,
		desc = "300功勳兌換1個伯魯克科技箱T2",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33042,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30042
		}
	},
	[33043] = {
		group_type = 0,
		resource_num = 600,
		desc = "600功勳兌換1個伯魯克科技箱T3",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33043,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30043
		}
	},
	[33044] = {
		group_type = 0,
		resource_num = 1500,
		desc = "1500功勳兌換1個伯魯克科技箱T4",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33044,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30044
		}
	},
	[43001] = {
		group_type = 0,
		resource_num = 20000,
		desc = "8000功勳兌換埃爾德里奇",
		type = 4,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 43001,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101261
		}
	},
	[43002] = {
		group_type = 0,
		resource_num = 20000,
		desc = "8000功勳兌換南達科他",
		type = 4,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 43002,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			105141
		}
	},
	[43003] = {
		group_type = 0,
		resource_num = 3000,
		desc = "3000功勳兌換試作型布里",
		type = 4,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 43003,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			100001
		}
	},
	[43004] = {
		group_type = 0,
		resource_num = 15000,
		desc = "8000功勳兌換泛用型布里MKII",
		type = 4,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 43004,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			100011
		}
	},
	[50002] = {
		group_type = 0,
		resource_num = 50,
		desc = "50鑽石購買1個快速建造工具",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 50002,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15003
		}
	},
	[50003] = {
		group_type = 0,
		resource_num = 50,
		desc = "50鑽石購買1個休息加速工具",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 50003,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15004
		}
	},
	[50004] = {
		group_type = 0,
		resource_num = 10,
		desc = "10石油購買1個酸素可樂",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 2,
		id = 50004,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50001
		}
	},
	[50005] = {
		group_type = 0,
		resource_num = 20,
		desc = "20石油購買1個祕製冷卻水",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 2,
		id = 50005,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50002
		}
	},
	[50006] = {
		group_type = 0,
		resource_num = 30,
		desc = "30石油購買1個魚雷天婦羅",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 2,
		id = 50006,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50003
		}
	},
	[50007] = {
		group_type = 0,
		resource_num = 50,
		desc = "50石油購買1個西瓜",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 2,
		id = 50007,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50004
		}
	},
	[50008] = {
		group_type = 0,
		resource_num = 10,
		desc = "10鑽石購買1個皇家料理",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 50008,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50005
		}
	},
	[50009] = {
		group_type = 0,
		resource_num = 20,
		desc = "20鑽石購買1個滿漢全席",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 50009,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50006
		}
	},
	[50011] = {
		group_type = 0,
		resource_num = 100,
		desc = "100傢俱幣購買一個擴充證",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 6,
		id = 50011,
		genre = "backyard_upgrade",
		discount_time = {},
		limit_args = {
			{
				"count",
				0,
				0
			}
		},
		effect_args = {
			15005
		}
	},
	[50012] = {
		group_type = 0,
		resource_num = 500,
		desc = "500傢俱幣購買一個擴充證",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 6,
		id = 50012,
		genre = "backyard_upgrade",
		discount_time = {},
		limit_args = {
			{
				"count",
				1,
				1
			}
		},
		effect_args = {
			15005
		}
	},
	[50013] = {
		group_type = 0,
		resource_num = 1000,
		desc = "1000傢俱幣購買一個擴充證",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 6,
		id = 50013,
		genre = "backyard_upgrade",
		discount_time = {},
		limit_args = {
			{
				"count",
				2,
				2
			}
		},
		effect_args = {
			15005
		}
	},
	[55000] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包-台服第一次",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 55000,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40106
		},
		time = {
			{
				{
					2019,
					10,
					31
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[55001] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买红染攻略补给-台服第一次",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 55001,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2019,
					10,
					31
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[55002] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买红染建造补给-台服第一次",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 55002,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2019,
					10,
					31
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[55003] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买z舰队攻略补给-台服第一次",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 55003,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2019,
					11,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					12,
					11
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[55004] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买z舰队建造补给-台服第一次",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 55004,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2019,
					11,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					12,
					11
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[55005] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包-台服第二次",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 55005,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40106
		},
		time = {
			{
				{
					2019,
					12,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					12,
					25
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[55006] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包-台服第三次",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 55006,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40106
		},
		time = {
			{
				{
					2019,
					12,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					1,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[55007] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买异色格攻略补给-台服第一次",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 55007,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2019,
					12,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					1,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[55008] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买异色格建造补给-台服第一次",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 55008,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2019,
					12,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					1,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[55009] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞-台服第一次",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 55009,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40100
		},
		time = {
			{
				{
					2019,
					12,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					1,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60001] = {
		group_type = 0,
		resource_num = 300,
		desc = "300鑽石購買10級禮包",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60001,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"level",
				10
			},
			{
				"time",
				1
			}
		},
		effect_args = {
			40005
		}
	},
	[60002] = {
		group_type = 0,
		resource_num = 600,
		desc = "600鑽石購買20級禮包",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60002,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"level",
				20
			},
			{
				"time",
				1
			}
		},
		effect_args = {
			40006
		}
	},
	[60003] = {
		group_type = 0,
		resource_num = 1000,
		desc = "1000鑽石購買30級禮包",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60003,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"level",
				30
			},
			{
				"time",
				1
			}
		},
		effect_args = {
			40007
		}
	},
	[60004] = {
		group_type = 0,
		resource_num = 2000,
		desc = "2000鑽石購買50級禮包",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60004,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"level",
				50
			},
			{
				"time",
				1
			}
		},
		effect_args = {
			40008
		}
	},
	[60005] = {
		group_type = 1,
		resource_num = 400,
		desc = "400鑽石購買1個日常補給禮包",
		type = 2,
		is_auto_use = 1,
		group_limit = 1,
		group_buy_count = 1,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		group = 1,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60005,
		genre = "gift_package",
		discount_time = {},
		limit_args = {},
		effect_args = {
			40009
		}
	},
	[60007] = {
		group_type = 0,
		resource_num = 2000,
		desc = "2000鑽石購買70級禮包",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60007,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"level",
				70
			},
			{
				"time",
				1
			}
		},
		effect_args = {
			40011
		}
	},
	[60105] = {
		group_type = 0,
		resource_num = 980,
		desc = "980鑽石購買限時禮包-比翼雙飛",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60105,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40100
		},
		time = {
			{
				{
					2020,
					2,
					13
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					2,
					19
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60114] = {
		group_type = 0,
		resource_num = 120,
		desc = "120鑽石購買攻略補給",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60114,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40105
		},
		time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					10,
					24
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60118] = {
		group_type = 0,
		resource_num = 980,
		desc = "980鑽石購買限時禮包-比翼雙飛",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60118,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40100
		},
		time = {
			{
				{
					2020,
					6,
					11
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					6,
					23
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60141] = {
		group_type = 0,
		resource_num = 980,
		desc = "980鑽石購買限時建造補給",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60141,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2020,
					1,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					2,
					5
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60142] = {
		group_type = 0,
		resource_num = 120,
		desc = "120鑽石購買限時攻略補給",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60142,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2020,
					2,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					3,
					4
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60143] = {
		group_type = 0,
		resource_num = 980,
		desc = "980鑽石購買限時建造補給",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60143,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2020,
					2,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					3,
					4
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60144] = {
		group_type = 0,
		resource_num = 120,
		desc = "120鑽石購買限時攻略補給",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60144,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2020,
					3,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					4,
					9
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60145] = {
		group_type = 0,
		resource_num = 980,
		desc = "980鑽石購買限時建造補給",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60145,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2020,
					3,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					4,
					9
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60146] = {
		group_type = 0,
		resource_num = 500,
		desc = "500鑽石購買傢俱幣禮包",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60146,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40106
		},
		time = {
			{
				{
					2020,
					1,
					16
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					1,
					22
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60148] = {
		group_type = 0,
		resource_num = 120,
		desc = "120鑽石購買限時攻略補給",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60148,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2020,
					4,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					5,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60149] = {
		group_type = 0,
		resource_num = 980,
		desc = "980鑽石購買限時建造補給",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60149,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2020,
					4,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					5,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60150] = {
		group_type = 0,
		resource_num = 500,
		desc = "500鑽石購買傢俱幣禮包",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60150,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40106
		},
		time = {
			{
				{
					2020,
					1,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					2,
					5
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60152] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买限时攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60152,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2020,
					4,
					10
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					4,
					22
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60153] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时建造补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60153,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2020,
					4,
					10
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					4,
					22
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60154] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买限时攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60154,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2020,
					6,
					11
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					6,
					23
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60155] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买限时攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60155,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2020,
					3,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					3,
					25
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60156] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时建造补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60156,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2020,
					3,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					3,
					25
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60157] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买限时攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60157,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2020,
					5,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					6,
					10
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60158] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时建造补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60158,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2020,
					5,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					6,
					10
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60159] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买限时攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60159,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2020,
					5,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					6,
					10
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60160] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时建造补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60160,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2020,
					5,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					6,
					10
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60162] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60162,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40106
		},
		time = {
			{
				{
					2020,
					3,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					4,
					9
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60164] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买限时攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60164,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2020,
					7,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					8,
					5
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60165] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时建造补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60165,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2020,
					7,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					8,
					5
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60166] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买限时攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60166,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60167] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时建造补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60167,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60171] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买限时攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60171,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2020,
					8,
					6
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					8,
					12
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60174] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60174,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40106
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60188] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买限时攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60188,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2020,
					9,
					10
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					9,
					16
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[61001] = {
		group_type = 0,
		resource_num = 200,
		desc = "200鑽石擴充船塢容量+10",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 10,
		time = "always",
		effect_args = "ship_bag_size",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 14,
		id = 61001,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {
			"count",
			0,
			1999
		}
	},
	[61002] = {
		group_type = 0,
		resource_num = 100,
		desc = "100鑽石擴充裝備容量+20",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9,
		time = "always",
		effect_args = "equip_bag_size",
		group = 0,
		num = 20,
		discount = 0,
		resource_type = 14,
		id = 61002,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {}
	},
	[61003] = {
		group_type = 0,
		resource_num = 300,
		desc = "300鑽石購買11個心智魔方",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8,
		time = "always",
		group = 0,
		num = 11,
		discount = 0,
		resource_type = 14,
		id = 61003,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			20001
		}
	},
	[61004] = {
		group_type = 0,
		resource_num = 200,
		desc = "200鑽石購買11個快速完成工具",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 7,
		time = "always",
		group = 0,
		num = 11,
		discount = 0,
		resource_type = 14,
		id = 61004,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15003
		}
	},
	[61005] = {
		group_type = 0,
		resource_num = 100,
		desc = "花費100鑽石購買3000物資",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 6,
		time = "always",
		group = 0,
		num = 3000,
		discount = 0,
		resource_type = 14,
		id = 61005,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			1
		}
	},
	[61006] = {
		group_type = 0,
		resource_num = 450,
		desc = "花費450鑽石購買15000物資",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 5,
		time = "always",
		group = 0,
		num = 15000,
		discount = 0,
		resource_type = 14,
		id = 61006,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			1
		}
	},
	[61007] = {
		group_type = 0,
		resource_num = 600,
		desc = "600鑽石購買1個誓約之戒",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 4,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 61007,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15006
		}
	},
	[61008] = {
		group_type = 0,
		resource_num = 300,
		desc = "300鑽石購買11個心智魔方",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 8,
		time = "always",
		group = 0,
		num = 11,
		discount = 0,
		resource_type = 14,
		id = 61008,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			20001
		}
	},
	[61009] = {
		group_type = 0,
		resource_num = 200,
		desc = "200鑽石購買11個快速完成工具",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 7,
		time = "always",
		group = 0,
		num = 11,
		discount = 0,
		resource_type = 14,
		id = 61009,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15003
		}
	},
	[61010] = {
		group_type = 0,
		resource_num = 300,
		desc = "300鑽石購買1個改名卡",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 3,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 61010,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15009
		}
	},
	[61012] = {
		group_type = 0,
		resource_num = 80,
		desc = "80鑽石擴充貓窩容量+5",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "commander_bag_size",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 14,
		id = 61012,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {
			{
				"level",
				40
			}
		}
	},
	[61013] = {
		group_type = 0,
		resource_num = 300,
		desc = "300钻石扩展船坞容量+10（船坞数量在2001~4000时）",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 10,
		time = "always",
		effect_args = "ship_bag_size",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 14,
		id = 61013,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {
			"count",
			2000,
			2999
		}
	},
	[70001] = {
		group_type = 0,
		resource_num = 800,
		desc = "購買造型:虛幻的幸福",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1700,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70001,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					2,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					2,
					20
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			213011
		}
	},
	[70002] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:沙灘狂想曲",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1900,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70002,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					5,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					6,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			303112
		}
	},
	[70003] = {
		group_type = 0,
		resource_num = 600,
		desc = "購買造型:樂園的彼岸花",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2200,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70003,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					5,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					6,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307011
		}
	},
	[70004] = {
		group_type = 0,
		resource_num = 600,
		desc = "購買造型:常夏的殺生石",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2200,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70004,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					5,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					6,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307021
		}
	},
	[70005] = {
		group_type = 0,
		resource_num = 800,
		desc = "購買造型:照耀太陽的淑女",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1700,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70005,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					5,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					6,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			204031
		}
	},
	[70006] = {
		group_type = 0,
		resource_num = 500,
		desc = "購買造型:進擊，伊490！",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2400,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70006,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					5,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					6,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301151
		}
	},
	[70007] = {
		group_type = 0,
		resource_num = 600,
		desc = "購買造型:七海的憩日",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2200,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70007,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					5,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					6,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			107031
		}
	},
	[70008] = {
		group_type = 0,
		resource_num = 800,
		desc = "購買造型:未來的海濱上將",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1700,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70008,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					5,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					6,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			205041
		}
	},
	[70009] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:盛夏進行曲",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1900,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70009,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					11,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			303121
		}
	},
	[70010] = {
		group_type = 0,
		resource_num = 500,
		desc = "購買造型:遊興之夏",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2400,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70010,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					5,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					6,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			502031
		}
	},
	[70011] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:陽光照耀著溫莎",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1900,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70011,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					11,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			205061
		}
	},
	[70012] = {
		group_type = 0,
		resource_num = 600,
		desc = "購買造型:小小的夏日戰爭",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2200,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70012,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					5,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					6,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			101251
		}
	},
	[70015] = {
		group_type = 0,
		resource_num = 800,
		desc = "購買造型:永不褪色的笑容",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1700,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70015,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2017,
					9,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2017,
					10,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			403031
		}
	},
	[70016] = {
		group_type = 0,
		resource_num = 800,
		desc = "購買造型:食慾之夏",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1700,
		time = "always",
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70016,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2017,
					9,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2017,
					10,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			502021
		}
	},
	[70017] = {
		group_type = 0,
		resource_num = 600,
		desc = "購買造型:萬聖節·祥鳳",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 660,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70017,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2017,
					9,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2017,
					10,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			306051
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70018] = {
		group_type = 0,
		resource_num = 800,
		desc = "購買造型:萬聖節·克里夫蘭",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 510,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70018,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2017,
					9,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2017,
					10,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			102091
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70019] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:萬聖節·綾波",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 570,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70019,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2017,
					9,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2017,
					10,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301051
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70020] = {
		group_type = 0,
		resource_num = 600,
		desc = "購買造型:萬聖節·陽炎",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 660,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70020,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2017,
					9,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2017,
					10,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301171
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70021] = {
		group_type = 0,
		resource_num = 800,
		desc = "購買造型:下午茶光輝",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1700,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70021,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207031
		}
	},
	[70022] = {
		group_type = 0,
		resource_num = 650,
		desc = "購買造型:下午茶雷",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2100,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70022,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301111
		}
	},
	[70023] = {
		group_type = 0,
		resource_num = 650,
		desc = "購買造型:下午茶電",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2100,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70023,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301121
		}
	},
	[70024] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:埃爾德里奇聖誕造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70024,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					12,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			101261
		}
	},
	[70025] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:企業聖誕造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1600,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70025,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					12,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			107061
		}
	},
	[70026] = {
		group_type = 0,
		resource_num = 680,
		desc = "購買造型:山城聖誕造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2000,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70026,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					12,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			305022
		}
	},
	[70027] = {
		group_type = 0,
		resource_num = 680,
		desc = "購買造型:小天鵝聖誕造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2000,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70027,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					12,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			201102
		}
	},
	[70028] = {
		group_type = 0,
		resource_num = 680,
		desc = "購買造型:聖地牙哥聖誕造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2000,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70028,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					12,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			102081
		}
	},
	[70029] = {
		group_type = 0,
		resource_num = 600,
		desc = "購買造型:睦月聖誕造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2200,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70029,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					12,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301321
		}
	},
	[70030] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:愛宕春節造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70030,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					1,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			303122
		}
	},
	[70031] = {
		group_type = 0,
		resource_num = 680,
		desc = "購買造型:蒼龍春節造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2000,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70031,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					1,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307031
		}
	},
	[70032] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:赤城春節造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1600,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70032,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					1,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307012
		}
	},
	[70033] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:加賀春節造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1600,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70033,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					1,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307022
		}
	},
	[70034] = {
		group_type = 0,
		resource_num = 680,
		desc = "購買造型:拉菲春節造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2000,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70034,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					1,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			101172
		}
	},
	[70036] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:歐根春節造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1600,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70036,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					1,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			403032
		}
	},
	[70037] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:夕立春節造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70037,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					1,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301141
		}
	},
	[70042] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:高雄旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1600,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70042,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					31
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					2,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			303113
		}
	},
	[70043] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:歐若拉旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1600,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70043,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					31
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					2,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			202151
		}
	},
	[70044] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:吸血鬼旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1600,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70044,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					31
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					2,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			201231
		}
	},
	[70045] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:獨角獸旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70045,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					31
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					2,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			206032
		}
	},
	[70046] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:長春旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70046,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					31
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					2,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			501031
		}
	},
	[70047] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:聖路易斯旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1600,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70047,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					31
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					2,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			102131
		}
	},
	[70048] = {
		group_type = 0,
		resource_num = 680,
		desc = "購買造型:扶桑旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 2000,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70048,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					31
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					2,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			305011
		}
	},
	[70049] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:尼古拉斯護士服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1900,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70049,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101311
		}
	},
	[70050] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:埃爾德里奇校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1600,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70050,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					3,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					4,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			101262
		}
	},
	[70051] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:愛丁堡校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70051,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					3,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					4,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			202111
		}
	},
	[70052] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:蒼龍校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70052,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					3,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					4,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307032
		}
	},
	[70053] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:飛龍校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70053,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					3,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					4,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307041
		}
	},
	[70054] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:火奴魯魯校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1600,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70054,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					3,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					4,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			102121
		}
	},
	[70055] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:吹雪校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70055,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					3,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					4,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301011
		}
	},
	[70056] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:Z1校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70056,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					3,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					4,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			401011
		}
	},
	[70057] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:雪風造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 570,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70057,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					5,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					6,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301161
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70058] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:谷風造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1900,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70058,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301621
		}
	},
	[70059] = {
		group_type = 0,
		resource_num = 800,
		desc = "購買造型:施佩伯爵校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 510,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70059,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					5,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					6,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			403051
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70060] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:霧島校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 160,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70060,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			304041
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70061] = {
		group_type = 0,
		resource_num = 800,
		desc = "購買造型:綾波私服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1700,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70061,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301053
		}
	},
	[70062] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:白露女僕",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70062,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					8,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					8,
					25
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301131
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70063] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:夕暮女僕",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70063,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					8,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					8,
					25
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301261
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70064] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:卯月",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1900,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70064,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301351
		}
	},
	[70065] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:光榮JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70065,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					10,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					24
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			207061
		}
	},
	[70066] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:阿卡司塔造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1900,
		time = "always",
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70066,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					10,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					24
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			201021
		}
	},
	[70067] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:朝潮校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70067,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301631
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70068] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:榛名校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70068,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			304031
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70069] = {
		group_type = 0,
		resource_num = 800,
		desc = "購買造型:江風造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 510,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70069,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301491
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70070] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:文月睡衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 570,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70070,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301381
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70071] = {
		group_type = 0,
		resource_num = 800,
		desc = "購買造型:君主禮服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1700,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70071,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2020,
					4,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					5,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			299021
		}
	},
	[70072] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:高雄JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1600,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70072,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			303114
		}
	},
	[70073] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:愛宕JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1600,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70073,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			303123
		}
	},
	[70074] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:伊19校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1600,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70074,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			308011
		}
	},
	[70075] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:伊26校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70075,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			308021
		}
	},
	[70076] = {
		group_type = 0,
		resource_num = 1180,
		desc = "購買造型:Z46泳裝",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 330,
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70076,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					10,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					24
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			401461
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70077] = {
		group_type = 0,
		resource_num = 1180,
		desc = "購買造型:齊柏林泳裝",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 330,
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70077,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					10,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					24
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			407011
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70078] = {
		group_type = 0,
		resource_num = 1180,
		desc = "購買造型:鐵必制造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 330,
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70078,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					10,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					24
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			405021
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70079] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:U47造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70079,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			408021
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70080] = {
		group_type = 0,
		resource_num = 1080,
		desc = "購買造型:德意志泳裝",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 390,
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70080,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					9,
					6
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					9,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			403042
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70081] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:Z25泳裝",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70081,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			401251
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70082] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:阿斯托利亞校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 180,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70082,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					1,
					23
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			103081
		},
		time = {
			{
				{
					2020,
					9,
					10
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					9,
					16
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70083] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:昆西泳裝",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 180,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70083,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					1,
					23
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			103091
		},
		time = {
			{
				{
					2020,
					9,
					10
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					9,
					16
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70084] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:文森尼斯睡衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 190,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70084,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					1,
					23
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			103101
		},
		time = {
			{
				{
					2020,
					9,
					10
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					9,
					16
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70085] = {
		group_type = 0,
		resource_num = 1080,
		desc = "購買造型:埃米爾•貝爾坦-泳裝 ",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 390,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70085,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			802011
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70086] = {
		group_type = 0,
		resource_num = 1080,
		desc = "購買造型:敦克爾克泳裝",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 390,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70086,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			904011
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70087] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:福爾班常服 ",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 570,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70087,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			801021
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70088] = {
		group_type = 0,
		resource_num = 1080,
		desc = "購買造型:標槍泳裝",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1300,
		time = "always",
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70088,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					8,
					15
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					8,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			201212
		}
	},
	[70089] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:皇家方舟泳裝",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70089,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					8,
					15
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					8,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			207021
		}
	},
	[70090] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:三笠造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70090,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					8,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					9,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			305111
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70091] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:比叡睡衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 570,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70091,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					8,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					9,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			304021
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70092] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:濱風校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70092,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					8,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					9,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301611
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70093] = {
		group_type = 0,
		resource_num = 1180,
		desc = "購買造型:半人馬泳裝",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1100,
		time = "always",
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70093,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					8,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					9,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			206041
		}
	},
	[70095] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:女灶神泳裝",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70095,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					9,
					6
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					9,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			112011
		}
	},
	[70096] = {
		group_type = 0,
		resource_num = 1080,
		desc = "購買造型:吹雪禮服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 390,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70096,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301013
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70097] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:歐若拉禮服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70097,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			202152
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70098] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:伊麗莎白禮服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70098,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			205011
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70099] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:阿賈克斯禮服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70099,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			202031
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70100] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:明石禮服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70100,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			312012
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70101] = {
		group_type = 0,
		resource_num = 1080,
		desc = "購買造型:克里夫蘭禮服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 390,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70101,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			102092
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70102] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:女將禮服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70102,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			201011
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70103] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:南達科他禮服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70103,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			105141
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70105] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:U81禮服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70105,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			408011
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70106] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:光輝禮服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70106,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			207032
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70108] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:曉造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1900,
		time = "always",
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70108,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					9,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301091
		}
	},
	[70109] = {
		group_type = 0,
		resource_num = 1080,
		desc = "購買造型:火奴魯魯造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 390,
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70109,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					10,
					11
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					17
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			102122
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70110] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:神通造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70110,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					10,
					11
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					17
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			302131
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70111] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:霍比造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70111,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101361
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70112] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:科爾克造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70112,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101371
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70113] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型:明尼亞波利斯造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70113,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			103131
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70114] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:五十鈴造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 570,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70114,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			302051
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70115] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:恐怖造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 570,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70115,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2017,
					9,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2017,
					10,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			213021
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70116] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型:納爾遜造型",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 570,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70116,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2017,
					9,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2017,
					10,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			205031
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70117] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型:康克德浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70117,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					11,
					20
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			102181
		}
	},
	[70127] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型：聖誕厭戰",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70127,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			205021
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70130] = {
		group_type = 0,
		resource_num = 1180,
		desc = "購買造型：埃爾德里奇浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 330,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70130,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101263
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70133] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型：威爾斯浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70133,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			205062
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70136] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型：海倫娜浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70136,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102051
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70138] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型：足柄浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70138,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			303091
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70141] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型：勝利-常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70141,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207041
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70142] = {
		group_type = 0,
		resource_num = 700,
		desc = "購買造型：謝菲爾德-常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 570,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70142,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202081
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70143] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型：約克公爵-晚禮服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70143,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			205072
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70144] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型：牙買加-常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70144,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202171
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70146] = {
		group_type = 0,
		resource_num = 1180,
		desc = "購買造型：貝爾法斯特旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 330,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70146,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202121
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70147] = {
		group_type = 0,
		resource_num = 1080,
		desc = "購買造型：拉菲春節",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 390,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70147,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101173
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70148] = {
		group_type = 0,
		resource_num = 1080,
		desc = "購買造型：太原-春節",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 390,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70148,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			501041
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70149] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型：企業-春節",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70149,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107062
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70152] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型：夕暮旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70152,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301262
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70153] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型：綾波春節",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70153,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301054
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70154] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型：列星頓旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70154,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107021
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70156] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型：馬拉尼旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70156,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101392
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70157] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型：庫拉索旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70157,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202211
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70158] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型：杓鷸旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70158,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202221
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70159] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型：追趕者春節",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70159,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			206051
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70160] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型：扶桑人妻",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70160,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305012
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70161] = {
		group_type = 0,
		resource_num = 1080,
		desc = "購買造型：獨角獸JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 390,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70161,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			206033
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70164] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型：波特蘭JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70164,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			103061
		}
	},
	[70165] = {
		group_type = 0,
		resource_num = 780,
		desc = "購買造型：印第安納波利斯JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 1800,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70165,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			103071
		}
	},
	[70171] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：三笠春装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70171,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305112
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70172] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：小天鹅皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70172,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201104
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70166] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：长门睡衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70166,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305051
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70167] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：金刚浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70167,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			304011
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70168] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：宵月运动服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70168,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301581
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70170] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：光辉韩服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 510,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70170,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207033
		},
		time = {
			{
				{
					2020,
					9,
					3
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					9,
					23
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70173] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：陆奥战国皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70173,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305061
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70183] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤：俾斯麦礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 110,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70183,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			405011
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70184] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：皇家方舟礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 130,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70184,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			207022
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70186] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：乔治五世礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 160,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70186,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			205051
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70187] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：Z23礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 180,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70187,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			401234
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70188] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：海妈礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 180,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70188,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			102052
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70189] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：大黄蜂礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 180,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70189,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			107071
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70190] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：约克城礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 180,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70190,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			107051
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70191] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：施佩伯爵礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 180,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70191,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			403053
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70192] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：时雨礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 180,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70192,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301152
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70193] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤：天狼星泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 330,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70193,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202202
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70194] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：无敌皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70194,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201261
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70195] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：斐济常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 570,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70195,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202161
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70203] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：伊168浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70203,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			308061
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70204] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：u101校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70204,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			408061
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70205] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：伊25校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70205,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			308041
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70212] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：杜威泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70212,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101021
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70215] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：苏塞克斯泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70215,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			203091
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70216] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：火奴鲁鲁浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 390,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70216,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102124
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70218] = {
		group_type = 0,
		resource_num = 880,
		desc = "購買造型：瑞鶴浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70218,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2017,
					9,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2017,
					10,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307061
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70220] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：雷浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70220,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301112
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70221] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：电浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70221,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301122
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70223] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：伊26浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70223,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			308022
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70225] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：吸血鬼浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 390,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70225,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201233
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70234] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤：翔鹤礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 110,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70234,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307051
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70235] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：U47礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 160,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70235,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			408022
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70236] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：欧根晚礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 160,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70236,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			403033
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70237] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：提尔比茨礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 160,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70237,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			405022
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70238] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：伊吹礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 160,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70238,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			399012
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70239] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：德意志礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 180,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70239,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			403043
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70241] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：夕立礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 160,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70241,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301143
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70242] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：贝尔法斯特礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 160,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70242,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			202123
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70243] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：让巴尔礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70243,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			905011
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70244] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：罗恩礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 160,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70244,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					10,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					11,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			499011
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70249] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：絮库夫机车",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 390,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70249,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			808011
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70250] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：约克JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70250,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			203071
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70251] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：山城JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70251,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305026
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70254] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：爱丁堡万圣节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70254,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202112
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70255] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：黑暗界万圣节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70255,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			213012
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70291] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：独角兽新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70291,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			206034
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70294] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：绫波新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70294,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			331050
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70296] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：克爹新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70296,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102094
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70298] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：方舟新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70298,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207023
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70299] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：阿贺野常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70299,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			302202
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70303] = {
		group_type = 0,
		resource_num = 900,
		desc = "购买皮肤：天狼星旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 450,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70303,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202203
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70312] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：沙恩霍斯特旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 510,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70312,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			404011
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70314] = {
		group_type = 0,
		resource_num = 1100,
		desc = "购买皮肤：欧若拉川剧皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 360,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70314,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202153
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70318] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：哥伦比亚情人节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70318,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102101
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70319] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：热心情人节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70319,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201031
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70343] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:足柄泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70343,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			303092
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70344] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:比叡泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70344,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			304023
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70345] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:那珂泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70345,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			302141
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70347] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:卷波泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 540,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70347,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301801
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70391] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:伊19睡衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 480,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70391,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			308012
		},
		time = {
			{
				{
					2020,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100001] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：天狼星旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 1,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 125,
		id = 100001,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202203
		},
		time = {
			{
				{
					2020,
					3,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					4,
					10
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100002] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：胜利常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 2,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 125,
		id = 100002,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207041
		},
		time = {
			{
				{
					2020,
					3,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					4,
					10
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100003] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：谢菲尔德常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 3,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 125,
		id = 100003,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202081
		},
		time = {
			{
				{
					2020,
					3,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					4,
					10
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100004] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：长门睡衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 1,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 100004,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305051
		},
		time = {
			{
				{
					2020,
					4,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					5,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100005] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：陆奥皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 2,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 100005,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305061
		},
		time = {
			{
				{
					2020,
					4,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					5,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100006] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：金刚浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 3,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 100006,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			304011
		},
		time = {
			{
				{
					2020,
					4,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					5,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100007] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：敦刻尔克泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 1,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 144,
		id = 100007,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			904011
		},
		time = {
			{
				{
					2020,
					5,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100008] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：埃米尔皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 2,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 144,
		id = 100008,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			802011
		},
		time = {
			{
				{
					2020,
					5,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100009] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：让巴尔礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 3,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 144,
		id = 100009,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			905011
		},
		time = {
			{
				{
					2020,
					5,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100010] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：吸血鬼浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 1,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 150,
		id = 100010,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201233
		},
		time = {
			{
				{
					2020,
					6,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					7,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100011] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：足柄浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 2,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 150,
		id = 100011,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			303091
		},
		time = {
			{
				{
					2020,
					6,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					7,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100012] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：比叡泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 3,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 150,
		id = 100012,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			304023
		},
		time = {
			{
				{
					2020,
					6,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					7,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100013] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：提尔比茨泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 1,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 153,
		id = 100013,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			405021
		},
		time = {
			{
				{
					2020,
					7,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					8,
					5
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100014] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：齐柏林泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 2,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 153,
		id = 100014,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			407011
		},
		time = {
			{
				{
					2020,
					7,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					8,
					5
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100015] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：u47自行车",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 3,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 153,
		id = 100015,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			408021
		},
		time = {
			{
				{
					2020,
					7,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					8,
					5
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100016] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：德意志泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 4,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 153,
		id = 100016,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403042
		},
		time = {
			{
				{
					2020,
					7,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					8,
					5
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100017] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：俾斯麦礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 1,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 160,
		id = 100017,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			405011
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100018] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：海伦娜礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 3,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 160,
		id = 100018,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102052
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100019] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：翔鹤礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 2,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 160,
		id = 100019,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			307051
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[100020] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：欧根礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 4,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 160,
		id = 100020,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403033
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		19,
		20,
		21,
		23,
		24,
		25,
		26,
		21001,
		21002,
		21003,
		21004,
		21005,
		21006,
		21007,
		21008,
		21009,
		21010,
		21011,
		21012,
		21013,
		21014,
		21015,
		21016,
		21017,
		21018,
		21019,
		21020,
		21021,
		21022,
		21023,
		21024,
		21025,
		21026,
		21027,
		21028,
		21029,
		21030,
		21031,
		21032,
		23001,
		24001,
		24002,
		24003,
		24004,
		24005,
		24006,
		24007,
		24008,
		24009,
		24010,
		24011,
		24012,
		24013,
		31011,
		31012,
		31013,
		31014,
		31111,
		31112,
		31113,
		31114,
		31021,
		31022,
		31023,
		31024,
		31121,
		31122,
		31123,
		31124,
		31031,
		31032,
		31033,
		31034,
		31131,
		31132,
		31133,
		31134,
		31041,
		31042,
		31043,
		31044,
		31141,
		31142,
		31143,
		31144,
		31989,
		31990,
		31991,
		31992,
		31993,
		31994,
		31995,
		31996,
		31997,
		31998,
		31999,
		33011,
		33012,
		33013,
		33014,
		33021,
		33022,
		33023,
		33024,
		33031,
		33032,
		33033,
		33034,
		33041,
		33042,
		33043,
		33044,
		43001,
		43002,
		43003,
		43004,
		50002,
		50003,
		50004,
		50005,
		50006,
		50007,
		50008,
		50009,
		50011,
		50012,
		50013,
		55000,
		55001,
		55002,
		55003,
		55004,
		55005,
		55006,
		55007,
		55008,
		55009,
		60001,
		60002,
		60003,
		60004,
		60005,
		60007,
		60105,
		60114,
		60118,
		60141,
		60142,
		60143,
		60144,
		60145,
		60146,
		60148,
		60149,
		60150,
		60152,
		60153,
		60154,
		60155,
		60156,
		60157,
		60158,
		60159,
		60160,
		60162,
		60164,
		60165,
		60166,
		60167,
		60171,
		60174,
		60188,
		61001,
		61002,
		61003,
		61004,
		61005,
		61006,
		61007,
		61008,
		61009,
		61010,
		61012,
		61013,
		70001,
		70002,
		70003,
		70004,
		70005,
		70006,
		70007,
		70008,
		70009,
		70010,
		70011,
		70012,
		70015,
		70016,
		70017,
		70018,
		70019,
		70020,
		70021,
		70022,
		70023,
		70024,
		70025,
		70026,
		70027,
		70028,
		70029,
		70030,
		70031,
		70032,
		70033,
		70034,
		70036,
		70037,
		70042,
		70043,
		70044,
		70045,
		70046,
		70047,
		70048,
		70049,
		70050,
		70051,
		70052,
		70053,
		70054,
		70055,
		70056,
		70057,
		70058,
		70059,
		70060,
		70061,
		70062,
		70063,
		70064,
		70065,
		70066,
		70067,
		70068,
		70069,
		70070,
		70071,
		70072,
		70073,
		70074,
		70075,
		70076,
		70077,
		70078,
		70079,
		70080,
		70081,
		70082,
		70083,
		70084,
		70085,
		70086,
		70087,
		70088,
		70089,
		70090,
		70091,
		70092,
		70093,
		70095,
		70096,
		70097,
		70098,
		70099,
		70100,
		70101,
		70102,
		70103,
		70105,
		70106,
		70108,
		70109,
		70110,
		70111,
		70112,
		70113,
		70114,
		70115,
		70116,
		70117,
		70127,
		70130,
		70133,
		70136,
		70138,
		70141,
		70142,
		70143,
		70144,
		70146,
		70147,
		70148,
		70149,
		70152,
		70153,
		70154,
		70156,
		70157,
		70158,
		70159,
		70160,
		70161,
		70164,
		70165,
		70171,
		70172,
		70166,
		70167,
		70168,
		70170,
		70173,
		70183,
		70184,
		70186,
		70187,
		70188,
		70189,
		70190,
		70191,
		70192,
		70193,
		70194,
		70195,
		70203,
		70204,
		70205,
		70212,
		70215,
		70216,
		70218,
		70220,
		70221,
		70223,
		70225,
		70234,
		70235,
		70236,
		70237,
		70238,
		70239,
		70241,
		70242,
		70243,
		70244,
		70249,
		70250,
		70251,
		70254,
		70255,
		70291,
		70294,
		70296,
		70298,
		70299,
		70303,
		70312,
		70314,
		70318,
		70319,
		70343,
		70344,
		70345,
		70347,
		70391,
		100001,
		100002,
		100003,
		100004,
		100005,
		100006,
		100007,
		100008,
		100009,
		100010,
		100011,
		100012,
		100013,
		100014,
		100015,
		100016,
		100017,
		100018,
		100019,
		100020
	}
}
