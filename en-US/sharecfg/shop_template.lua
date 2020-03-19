pg = pg or {}
pg.shop_template = {
	{
		group_type = 0,
		resource_num = 100,
		desc = "Spend 100 Gems to increase gear capacity by 20",
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
		desc = "Spend 200 Gems to increase dock capacity by 10",
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
		limit_args = {}
	},
	{
		group_type = 0,
		resource_num = 300,
		desc = "Spend 300 Gems to add 1 bed in your dorm",
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
		desc = "Spend 500 Gems to add 1 bed in your dorm",
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
		desc = "Food storage expansion 1-10: 100 Gems",
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
		desc = "Food storage expansion 11+: 200 Gems",
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
		desc = "Upgrade Trading Port",
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
		desc = "Upgrade Refinery",
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
		desc = "Upgrade Trade Street",
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
		desc = "Refresh Trade Street",
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
		desc = "Refresh Trade Street",
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
		desc = "Spend 100 Gems to buy 3000 Coins",
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
		desc = "Spend 50 Gems to buy 500 Oil",
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
		desc = "Spend 100 Gems to buy 500 Oil",
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
		desc = "Spend 200 Gems to buy 500 Oil",
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
		desc = "Spend 400 Gems to buy 500 Oil",
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
		desc = "Spend 500 Gems to add 1 dorm resting slot",
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
		desc = "Spend 800 Gems to add 1 bed to your dorm",
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
		desc = "Spend 500 Gems to unlock dorm's second floor furniture",
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
		desc = "Upgrade Lecture Hall",
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
		desc = "Spend 500 Gems to unlock the 3rd training slot in Tactical Classroom ",
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
					2018,
					9,
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
					10,
					14
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
		desc = "200钻石扩展指挥喵容量+10",
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
		desc = "Spend 450 Gems to buy 15000 Coins",
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
	[21001] = {
		group_type = 0,
		resource_num = 1500,
		desc = "Spend 1500 Coins to buy 1 Quick Finish item",
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
		desc = "Spend 600 Coins to buy 1 T1 offensive skill book",
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
		desc = "Spend 600 Coins to buy 1 T1 defensive skill book",
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
		desc = "Spend 600 Coins to buy 1 T1 support skill book",
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
		desc = "Spend 750 Coins to buy 1 T1 general part",
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
		desc = "Spend 750 Coins to buy 1 T1 main gun part",
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
		desc = "Spend 750 Coins to buy 1 T1 torpedo part",
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
		desc = "Spend 750 Coins to buy 1 T1 AA gun part",
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
		desc = "Spend 750 Coins to buy 1 T1 aircraft part",
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
		desc = "Spend 1200 Coins to buy 1 T2 offensive skill book",
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
		desc = "Spend 1200 Coins to buy 1 T2 defensive skill book",
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
		desc = "Spend 1200 Coins to buy 1 T2 support skill book",
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
		desc = "Spend 1500 Coins to buy 1 T2 general part",
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
		desc = "Spend 1500 Coins to buy 1 T2 main gun part",
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
		desc = "Spend 1500 Coins to buy 1 T2 torpedo part",
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
		desc = "Spend 1500 Coins to buy 1 T2 AA gun part",
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
		desc = "Spend 1500 Coins to buy 1 T2 aircraft part",
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
		desc = "Spend 2400 Coins to buy 1 T3 offensive skill book",
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
		desc = "Spend 2400 Coins to buy 1 T3 defensive skill book",
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
		desc = "Spend 2400 Coins to buy 1 T3 support skill book",
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
		desc = "Spend 3000 Coins to buy 1 T3 general part",
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
		desc = "Spend 3000 Coins to buy 1 T3 main gun part",
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
		desc = "Spend 3000 Coins to buy 1 T3 torpedo part",
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
		desc = "Spend 3000 Coins to buy 1 T3 AA gun part",
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
		desc = "Spend 3000 Coins to buy 1 T3 aircraft part",
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
		desc = "Spend 2000 Coins to buy 1 Wisdom Cube",
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
		desc = "Spend 300 Coins to buy 10 Oxy-colas",
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
		desc = "Spend 900 Coins to buy 10 Secret Coolants",
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
		desc = "Spend 1500 Coins to buy 10 Torpedo Tempura",
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
		desc = "Spend 3000 Coins to buy 10 Watermelons",
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
		desc = "Spend 6000 Coins to buy 10 Royal Gourmet",
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
		desc = "Spend 12000 Coins to buy 10 Full Courses",
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
		desc = "Exchange 2000 Merit for 1 Wisdom Cube",
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
		desc = "Spend 20 Gems to buy 1 Quick Finish item",
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
		desc = "Spend 40 Gems to buy 2 Quick Finish items",
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
		desc = "Spend 30 Gems to buy 1 Wisdom Cube",
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
		desc = "Spend 60 Gems to buy 2 Wisdom Cubes",
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
		desc = "Spend 20 Gems to buy 1 T1 offensive skill book",
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
		desc = "Spend 20 Gems to buy 1 T1 defensive skill book",
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
		desc = "Spend 20 Gems to buy 1 T1 support skill book",
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
		desc = "Spend 40 Gems to buy 1 T2 offensive skill book",
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
		desc = "Spend 40 Gems to buy 1 T2 defensive skill book",
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
		desc = "Spend 40 Gems to buy 1 T2 support skill book",
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
		desc = "Spend 80 Gems to buy 1 T3 offensive skill book",
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
		desc = "Spend 80 Gems to buy 1 T3 defensive skill book",
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
		desc = "Spend 80 Gems to buy 1 T3 support skill book",
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
		desc = "Exchange 80 Coins for 1 T1 Eagle Tech Pack",
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
		desc = "Exchange 400 Coins for 1 T2 Eagle Tech Pack",
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
		desc = "Exchange 2000 Coins for 1 T3 Eagle Tech Pack",
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
		desc = "Exchange 5000 Coins for 1 T4 Eagle Tech Pack",
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
		desc = "Exchange 400 Coins for 5 T1 Eagle Tech Packs",
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
		desc = "Exchange 2000 Coins for 5 T2 Eagle Tech Packs",
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
		desc = "Exchange 10000 Coins for 5 T3 Eagle Tech Packs",
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
		desc = "Exchange 25000 Coins for 5 T4 Eagle Tech Packs",
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
		desc = "Exchange 80 Coins for 1 T1 Royal Tech Pack",
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
		desc = "Exchange 400 Coins for 1 T2 Royal Tech Pack",
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
		desc = "Exchange 2000 Coins for 1 T3 Royal Tech Pack",
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
		desc = "Exchange 5000 Coins for 1 T4 Royal Tech Pack",
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
		desc = "Exchange 400 Coins for 5 T1 Royal Tech Packs",
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
		desc = "Exchange 2000 Coins for 5 T2 Royal Tech Packs",
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
		desc = "Exchange 10000 Coins for 5 T3 Royal Tech Packs",
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
		desc = "Exchange 25000 Coins for 5 T4 Royal Tech Packs",
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
		desc = "Exchange 80 Coins for 1 T1 Sakura Tech Pack",
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
		desc = "Exchange 400 Coins for 1 T2 Sakura Tech Pack",
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
		desc = "Exchange 2000 Coins for 1 T3 Sakura Tech Pack",
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
		desc = "Exchange 5000 Coins for 1 T4 Sakura Tech Pack",
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
		desc = "Exchange 400 Coins for 5 T1 Sakura Tech Packs",
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
		desc = "Exchange 2000 Coins for 5 T2 Sakura Tech Packs",
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
		desc = "Exchange 10000 Coins for 5 T3 Sakura Tech Packs",
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
		desc = "Exchange 25000 Coins for 5 T4 Sakura Tech Packs",
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
		desc = "Exchange 80 Coins for 1 T1 Ironblood Tech Pack",
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
		desc = "Exchange 400 Coins for 1 T2 Ironblood Tech Pack",
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
		desc = "Exchange 2000 Coins for 1 T3 Ironblood Tech Pack",
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
		desc = "Exchange 5000 Coins for 1 T4 Ironblood Tech Pack",
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
		desc = "Exchange 400 Coins for 5 T1 Ironblood Tech Packs",
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
		desc = "Exchange 2000 Coins for 5 T2 Ironblood Tech Packs",
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
		desc = "Exchange 10000 Coins for 5 T3 Ironblood Tech Packs",
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
		desc = "Exchange 25000 Coins for 5 T4 Ironblood Tech Packs",
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
	[31984] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物资兑换1个苏联联动外观装备箱",
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
		id = 31984,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30317
		}
	},
	[31985] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物资兑换1个hololive联动外观装备箱",
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
		id = 31985,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30316
		}
	},
	[31986] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物资兑换1个偶像活动外观装备箱",
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
		id = 31986,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30315
		}
	},
	[31987] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物资兑换1个意大利联动外观装备箱",
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
		id = 31987,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30314
		}
	},
	[31988] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物资兑换1个绊爱联动外观装备箱",
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
		id = 31988,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30313
		}
	},
	[31989] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物资兑换1个外观装备箱",
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
		desc = "7000物资兑换1个外观装备箱",
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
		desc = "7000物资兑换1个外观装备箱",
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
	[31994] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物资兑换1个外观装备箱",
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
	[31996] = {
		group_type = 0,
		resource_num = 7000,
		desc = "Exchange 7000 Coins for 1 Gear Skin Box",
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
		desc = "Exchange 7000 Coins for 1 Gear Skin Box",
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
		desc = "Exchange 7000 Coins for 1 Neptune Link Gear Box",
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
		desc = "Exchange 7000 Coins for 1 Gear Skin Box",
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
		desc = "Exchange 100 Merit for 1 T1 Eagle Tech Pack",
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
		desc = "Exchange 300 Merit for 1 T2 Eagle Tech Pack",
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
		desc = "Exchange 600 Merit for 1 T3 Eagle Tech Pack",
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
		desc = "Exchange 1500 Merit for 1 T4 Eagle Tech Pack",
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
		desc = "Exchange 100 Merit for 1 T1 Royal Tech Pack",
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
		desc = "Exchange 300 Merit for 1 T2 Royal Tech Pack",
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
		desc = "Exchange 600 Merit for 1 T3 Royal Tech Pack",
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
		desc = "Exchange 1500 Merit for 1 T4 Royal Tech Pack",
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
		desc = "Exchange 100 Merit for 1 T1 Sakura Tech Pack",
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
		desc = "Exchange 300 Merit for 1 T2 Sakura Tech Pack",
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
		desc = "Exchange 600 Merit for 1 T3 Sakura Tech Pack",
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
		desc = "Exchange 1500 Merit for 1 T4 Sakura Tech Pack",
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
		desc = "Exchange 100 Merit for 1 T1 Ironblood Tech Pack",
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
		desc = "Exchange 300 Merit for 1 T2 Ironblood Tech Pack",
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
		desc = "Exchange 600 Merit for 1 T3 Ironblood Tech Pack",
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
		desc = "Exchange 1500 Merit for 1 T4 Ironblood Tech Pack",
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
		desc = "Exchange 8000 Merit for Eldridge",
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
		desc = "Exchange 8000 Merit for South Dakota",
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
		desc = "Exchange 3000 Merit for Engineer",
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
		desc = "Exchange 10000 Merit for Universal Bulin MKII",
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
		desc = "Spend 50 Gems to buy 1 Quick Build item",
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
		desc = "Spend 50 Gems to buy 1 Quick Rest item",
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
		desc = "Spend 10 Oil to buy 1 Oxy-cola",
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
		desc = "Spend 20 Oil to buy 1 Secret Coolant",
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
		desc = "Spend 30 Oil to buy 1 Torpedo Tempura",
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
		desc = "Spend 50 Oil to buy 1 Watermelon",
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
		desc = "Spend 10 Gems to buy 1 Royal Gourmet",
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
		desc = "Spend 20 Gems to buy 1 Full Course",
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
		desc = "Spend 100 Decor Tokens to expand the dorm",
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
		desc = "Spend 500 Decor Tokens to expand the dorm",
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
		desc = "Spend 1000 Decor Tokens to expand the dorm",
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
	[60001] = {
		group_type = 0,
		resource_num = 300,
		desc = "Spend 300 Gems to buy a Lv. 10 Pack",
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
				10,
				1
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
		desc = "Spend 600 Gems to buy a Lv. 20 Pack",
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
				20,
				1
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
		desc = "Spend 1000 Gems to buy a Lv. 30 Pack",
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
				30,
				1
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
		desc = "Spend 2000 Gems to buy a Lv. 50 Pack",
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
				50,
				1
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
		desc = "Spend 400 Gems to buy 1 Daily Supplies Pack",
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
	[60101] = {
		group_type = 1,
		resource_num = 600,
		desc = "Spend 600 Gems to buy Limited Build Supplies",
		type = 2,
		is_auto_use = 1,
		group_limit = 2,
		group_buy_count = 1,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "stop",
		group = 3,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60101,
		genre = "gift_package",
		discount_time = {},
		limit_args = {},
		effect_args = {
			40001
		}
	},
	[60105] = {
		group_type = 0,
		resource_num = 980,
		desc = "Spend 980 Gems to buy Limited Pack - Two Hearts",
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
					2018,
					9,
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
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60109] = {
		group_type = 0,
		resource_num = 120,
		desc = "Spend 200 Gems to buy Red Dyed Raiders Supplies",
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
		id = 60109,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40102
		},
		time = {
			{
				{
					2018,
					4,
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
					6,
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
	[60110] = {
		group_type = 0,
		resource_num = 980,
		desc = "Spend 980 Gems to buy Red Dyed Construction Supplies",
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
		id = 60110,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40004
		},
		time = {
			{
				{
					2018,
					4,
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
					6,
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
	[60111] = {
		group_type = 0,
		resource_num = 500,
		desc = "Spend 500 Gems to buy Decor Tokens Pack",
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
		id = 60111,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				3
			}
		},
		effect_args = {
			40103
		},
		time = {
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60112] = {
		group_type = 0,
		resource_num = 500,
		desc = "Spend 500 Gems to buy Decor Tokens Pack",
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
		id = 60112,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40103
		},
		time = {
			{
				{
					2019,
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
					2019,
					9,
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
	[60114] = {
		group_type = 0,
		resource_num = 120,
		desc = "Spend 200 Gems to buy Strategic Supplies",
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
					2018,
					9,
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
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60115] = {
		group_type = 0,
		resource_num = 980,
		desc = "Spend 980 Gems to buy Construction Supplies",
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
		id = 60115,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40104
		},
		time = {
			{
				{
					2018,
					4,
					8
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
	[60125] = {
		group_type = 0,
		resource_num = 200,
		desc = "Spend 200 Gems to buy Mutsu Strategic Supplies",
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
		id = 60125,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40107
		},
		time = {
			{
				{
					2019,
					4,
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
					2019,
					4,
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
	[60126] = {
		group_type = 0,
		resource_num = 980,
		desc = "Spend 980 Gems to buy Mutsu Construction Supplies",
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
		id = 60126,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40108
		},
		time = {
			{
				{
					2019,
					4,
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
					2019,
					4,
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
	[60127] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞",
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
		id = 60127,
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
					4,
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
					2019,
					4,
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
	[60128] = {
		group_type = 0,
		resource_num = 200,
		desc = "Spend 200 Gems to purchase Dichotomous Chess Supplies ",
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
		id = 60128,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40109
		},
		time = {
			{
				{
					2018,
					12,
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
					2018,
					12,
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60135] = {
		group_type = 0,
		resource_num = 120,
		desc = "Fallen Wings Strategic Supplies will cost you 120 gems",
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
		id = 60135,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40113
		},
		time = {
			{
				{
					2018,
					10,
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
					2018,
					11,
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
	[60136] = {
		group_type = 0,
		resource_num = 980,
		desc = "Fallen Wings Construction Supplies will cost you 980 gems",
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
		id = 60136,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40114
		},
		time = {
			{
				{
					2018,
					10,
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
					2018,
					11,
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
	[60140] = {
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
		id = 60140,
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
					7
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
					7
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
					2019,
					1,
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
					2019,
					1,
					31
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
					2019,
					1,
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
					2019,
					1,
					31
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
					2019,
					1,
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
					2019,
					1,
					31
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60147] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞",
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
		id = 60147,
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
					1,
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
					2019,
					1,
					31
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
		desc = "Spend 120 Gems to buy 凛冬 Strategic Supplies",
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
					2019,
					2,
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
					2019,
					3,
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
		desc = "Spend 200 Gems to buy 凛冬 Strategic Supplies",
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
					2019,
					2,
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
					2019,
					3,
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
					17
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
					2019,
					6,
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
					7,
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
					2019,
					6,
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
					7,
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
		tag = 1,
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
					2019,
					4,
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
					2019,
					5,
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
	[60159] = {
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
					2019,
					4,
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
					2019,
					5,
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
	[60160] = {
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
					2019,
					5,
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
					6,
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
	[60161] = {
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
		id = 60161,
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
					5,
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
					6,
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
					2019,
					5,
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
					6,
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
	[60163] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞",
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
		id = 60163,
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
					5,
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
					2019,
					6,
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
	[60164] = {
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
					2019,
					10,
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
					2019,
					10,
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
	[60165] = {
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
					2019,
					10,
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
					2019,
					10,
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
	[60166] = {
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
					2019,
					7,
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
					8,
					14
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
		tag = 1,
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
					2019,
					7,
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
					8,
					14
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60168] = {
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
		id = 60168,
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
					9,
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
					2019,
					9,
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
	[60169] = {
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
		id = 60169,
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
					9,
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
					2019,
					9,
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
	[60170] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞",
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
		id = 60170,
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
					9,
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
					10,
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
	[60175] = {
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
		id = 60175,
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
					11,
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
					12,
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
	[60176] = {
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
		id = 60176,
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
					12,
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
	[60177] = {
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
		id = 60177,
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
					11,
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
					12,
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
	[60178] = {
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
		id = 60178,
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
	[60179] = {
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
		id = 60179,
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
	[60180] = {
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
		id = 60180,
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
	[60181] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞",
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
		id = 60181,
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
	[60182] = {
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
		id = 60182,
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
	[60183] = {
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
		id = 60183,
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
	[60184] = {
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
		id = 60184,
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
	[60185] = {
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
		id = 60185,
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
					2,
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
					2020,
					3,
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
	[60186] = {
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
		id = 60186,
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
					2020,
					3,
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
	[60187] = {
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
		id = 60187,
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
					2020,
					3,
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
	[60188] = {
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
	[61001] = {
		group_type = 0,
		resource_num = 200,
		desc = "Spend 200 Gems to increase dock capacity by 10",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "ship_bag_size",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 14,
		id = 61001,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {}
	},
	[61002] = {
		group_type = 0,
		resource_num = 100,
		desc = "Spend 100 Gems to increase gear capacity by 20",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
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
		desc = "Spend 300 Gems to buy 11 Wisdom Cubes",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
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
		desc = "Spend 200 Gems to buy 11 Quick Finish items",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
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
		desc = "Spend 100 Gems to buy 3000 Coins",
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
		desc = "Spend 450 Gems to buy 15000 Coins",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
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
		desc = "Spend 600 Gems to buy 1 Promise Ring",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
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
		desc = "Spend 300 Gems to buy 11 Wisdom Cubes",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
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
		desc = "Spend 200 Gems to buy 11 Quick Finish items",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 11,
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
		desc = "Spend 300 Gems to buy 1 Identity Change Certification ",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
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
		desc = "80钻石扩展猫窝容量+5",
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
	[70001] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Illusory Happiness",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9914,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70001,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			213011
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70002] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin - Beach Rhapsody",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9994,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70002,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			303112
		}
	},
	[70003] = {
		group_type = 0,
		resource_num = 600,
		desc = "Buy skin - Paradise Amaryllis",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9984,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70003,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			307011
		}
	},
	[70004] = {
		group_type = 0,
		resource_num = 600,
		desc = "Buy skin - Eternal Killing Stone",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9983,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70004,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			307021
		}
	},
	[70005] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Shining Beauty",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9995,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70005,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			204031
		}
	},
	[70006] = {
		group_type = 0,
		resource_num = 500,
		desc = "Buy skin - Attack, I-490!",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9982,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70006,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301151
		}
	},
	[70007] = {
		group_type = 0,
		resource_num = 600,
		desc = "Buy skin - Seven Seas",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9996,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70007,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107031
		}
	},
	[70008] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Future Beach",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9997,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70008,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			205041
		}
	},
	[70009] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin - Midsummer March",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9993,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70009,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			303121
		}
	},
	[70010] = {
		group_type = 0,
		resource_num = 500,
		desc = "Buy skin - Summer",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9998,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70010,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			502031
		}
	},
	[70011] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin - Windsor Sun",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9992,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70011,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			205061
		}
	},
	[70012] = {
		group_type = 0,
		resource_num = 600,
		desc = "Buy skin - Little Summer War",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 10000,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70012,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101251
		}
	},
	[70013] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Moon Rabbit",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9812,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70013,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			502022
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70014] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Osmanthus Rabbit",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9813,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70014,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			502032
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70015] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Unfading Smile",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9991,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70015,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403031
		}
	},
	[70016] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Summer's Appetite",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9999,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70016,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			502021
		}
	},
	[70017] = {
		group_type = 0,
		resource_num = 600,
		desc = "Buy skin - Shouhou: Halloween",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9061,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70017,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			306051
		}
	},
	[70018] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Cleveland: Halloween",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9060,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70018,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102091
		}
	},
	[70019] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin - Ayanami: Halloween",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9059,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70019,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301051
		}
	},
	[70020] = {
		group_type = 0,
		resource_num = 600,
		desc = "Buy skin - Kagerou: Halloween",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9058,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70020,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301171
		}
	},
	[70021] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Illustrious: Tea Party",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9974,
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
		desc = "Buy skin - Ikazuchi: Tea Party",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9973,
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
		desc = "Buy skin - Inazuma: Tea Party",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9972,
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
		desc = "Buy skin - Eldridge: Christmas",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9032,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70024,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101261
		}
	},
	[70025] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Enterprise: Christmas",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9032,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70025,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107061
		}
	},
	[70026] = {
		group_type = 0,
		resource_num = 680,
		desc = "Buy skin - Yamashiro: Christmas",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9032,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70026,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305022
		}
	},
	[70027] = {
		group_type = 0,
		resource_num = 680,
		desc = "Buy skin - Cygnet: Christmas",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9032,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70027,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201102
		}
	},
	[70028] = {
		group_type = 0,
		resource_num = 680,
		desc = "Buy skin - San Diego: Christmas",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9032,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70028,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102081
		}
	},
	[70029] = {
		group_type = 0,
		resource_num = 600,
		desc = "Buy skin - Mutsuki: Christmas",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9032,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70029,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301321
		}
	},
	[70030] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Atago: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9017,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70030,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			303122
		}
	},
	[70031] = {
		group_type = 0,
		resource_num = 680,
		desc = "Buy skin - Souryuu: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9018,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70031,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			307031
		}
	},
	[70032] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Akagi: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9019,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70032,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			307012
		}
	},
	[70033] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Kaga: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9020,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70033,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			307022
		}
	},
	[70034] = {
		group_type = 0,
		resource_num = 680,
		desc = "Buy skin - Laffey: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9021,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70034,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101172
		}
	},
	[70035] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Akashi: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9022,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70035,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			312011
		}
	},
	[70036] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Prinz Eugen: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9023,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70036,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403032
		}
	},
	[70037] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Yuudachi: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9024,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70037,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301141
		}
	},
	[70038] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Purple Heart: Goddess' Promise",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9970,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70038,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			10100051
		}
	},
	[70039] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Black Heart: Goddess' Smile",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9969,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70039,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			10100061
		}
	},
	[70040] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - White Heart: Goddess' Demureness",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9968,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70040,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			10100071
		}
	},
	[70041] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Green Heart: Goddess' Moment",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9967,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70041,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			10100081
		}
	},
	[70042] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Takao: Spring's Learning",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9934,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70042,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			303113
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70043] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Aurora: Spring's Story",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9933,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70043,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202151
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70044] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Vampire: Spring's Wind",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9932,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70044,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201231
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70045] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Unicorn: Spring's Present",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9066,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70045,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			206032
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70046] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Changchun: Spring's Embrace",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9919,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70046,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			501031
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70047] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - St. Louis: Spring's Flower",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9954,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70047,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102131
		}
	},
	[70048] = {
		group_type = 0,
		resource_num = 680,
		desc = "Buy skin - Fusou: Spring's Celebration",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9930,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70048,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305011
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70049] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin - Nicholas: Niko Nurse",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9915,
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
		desc = "Buy skin - Eldridge: Mystery of the Empty Classroom",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9905,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70050,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101262
		}
	},
	[70051] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Edinburgh: Fairy of the Library",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9904,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70051,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202111
		}
	},
	[70052] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Souryuu: Hallway Monitor",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9903,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70052,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			307032
		}
	},
	[70053] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Hiryuu: Hallway Monitor",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9902,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70053,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			307041
		}
	},
	[70054] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Honolulu: Parasol Girl",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9900,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70054,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102121
		}
	},
	[70055] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Fubuki: Nearly Late for School",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9899,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70055,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301011
		}
	},
	[70056] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Z1: Rebellious Vierzehn",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9901,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70056,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			401011
		}
	},
	[70057] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin - Yukikaze: Swings-Sama",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9898,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70057,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301161
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70058] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin - Tanikaze: Lost Girl and Labyrinth Butterfly",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9873,
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
		desc = "Buy skin - Admiral Graf Spee: Maiden's Sunday",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9070,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70059,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403051
		}
	},
	[70060] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Kirishima: After School Artillery Time",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9870,
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
					2019,
					11,
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
		}
	},
	[70061] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Ayanami Rock'n KIJIN",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9895,
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
		desc = "Buy skin - Shiratsuyu: Is the Order a Torpedo?",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9894,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70062,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301131
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70063] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Yuugure: Apprentice Maid",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9893,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70063,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301261
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70064] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin: Uzuki",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9872,
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
		desc = "Buy skin: Glorious JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9042,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70065,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207061
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70066] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin: Acasta - Going Out in Style",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9043,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70066,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201021
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70067] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:朝潮校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9886,
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
					2019,
					11,
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
		}
	},
	[70068] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:榛名校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9885,
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
					2019,
					11,
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
		}
	},
	[70069] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤:江风皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9884,
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
					2019,
					11,
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
		}
	},
	[70070] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤:文月睡衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9883,
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
					2019,
					11,
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
		}
	},
	[70071] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤:君主礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9826,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70071,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			299021
		}
	},
	[70072] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:高雄JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9890,
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
		desc = "购买皮肤:爱宕JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9889,
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
		desc = "购买皮肤:伊19校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9888,
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
		desc = "购买皮肤:伊26校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9887,
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
		desc = "购买皮肤:Z46泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9045,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70076,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			401461
		}
	},
	[70077] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤:齐柏林泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9046,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70077,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			407011
		}
	},
	[70078] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤:提尔比茨皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9047,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70078,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			405021
		}
	},
	[70079] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:U47皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9044,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70079,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			408021
		}
	},
	[70080] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤:德意志泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9957,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70080,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403042
		}
	},
	[70081] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:Z25泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9049,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70081,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			401251
		}
	},
	[70082] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:阿斯托利亚校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9869,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70082,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			103081
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70083] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:昆西泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9868,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70083,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			103091
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70084] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤:文森斯睡衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9905,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70084,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			103101
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70085] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤:埃米尔·贝尔汀-泳装 ",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9851,
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
					2019,
					11,
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
		}
	},
	[70086] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤:敦刻尔克泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9850,
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
					2019,
					11,
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
		}
	},
	[70087] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤:福尔班常服 ",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9849,
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
					2019,
					11,
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
		}
	},
	[70088] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤:标枪泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9837,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70088,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201212
		}
	},
	[70089] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:皇家方舟泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9836,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70089,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207021
		}
	},
	[70090] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:三笠皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9065,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70090,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305111
		}
	},
	[70091] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤:比叡睡衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9066,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70091,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			304021
		}
	},
	[70092] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:滨风校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9067,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70092,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301611
		}
	},
	[70093] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤:半人马泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9831,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70093,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			206041
		}
	},
	[70095] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:女灶神泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9835,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70095,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			112011
		}
	},
	[70096] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤:吹雪礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9826,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70096,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301013
		}
	},
	[70097] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:欧若拉礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9826,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70097,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202152
		}
	},
	[70098] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:伊丽莎白礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9826,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70098,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			205011
		}
	},
	[70099] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:阿贾克斯礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9826,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70099,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202031
		}
	},
	[70100] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:明石礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9826,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70100,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			312012
		}
	},
	[70101] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤:克利夫兰礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9826,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70101,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102092
		}
	},
	[70102] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:女将礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9826,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70102,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201011
		}
	},
	[70103] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:南达科他礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9826,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70103,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			105141
		}
	},
	[70104] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤:大凤礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9826,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70104,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			307071
		}
	},
	[70105] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:U81礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9826,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70105,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			408011
		}
	},
	[70106] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:光辉礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9826,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70106,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207032
		}
	},
	[70107] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤:纽卡斯尔皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 8981,
		time = "always",
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70107,
		genre = "skin_shop",
		discount_time = {
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
					1,
					27
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
			202191
		}
	},
	[70109] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤:火奴鲁鲁皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9854,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70109,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102122
		}
	},
	[70110] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:神通皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9867,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70110,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			302131
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70111] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:霍比皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9981,
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
					2019,
					11,
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
		}
	},
	[70112] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:科尔克皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9980,
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
					2019,
					11,
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
		}
	},
	[70113] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:明尼阿波利斯皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9979,
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
					2019,
					11,
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
		}
	},
	[70114] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤:五十铃皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9064,
		time = "stop",
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
		}
	},
	[70115] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤:恐怖皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9063,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70115,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			213021
		}
	},
	[70116] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤:纳尔逊皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9062,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70116,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			205031
		}
	},
	[70117] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:康克德浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9971,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70117,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102181
		}
	},
	[70124] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：龙骧睡衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 8972,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70124,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			306061
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
	[70125] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：斯佩常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9071,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70125,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403052
		}
	},
	[70126] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：圣诞尼古拉斯",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9031,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70126,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101312
		},
		time = {
			{
				{
					2019,
					12,
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
					1,
					2
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70127] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：圣诞厌战",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9031,
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
					2019,
					12,
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
					1,
					2
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70128] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：圣诞浦风",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9031,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70128,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301591
		},
		time = {
			{
				{
					2019,
					12,
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
					1,
					2
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70129] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：圣诞火奴鲁鲁",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9031,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70129,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102123
		},
		time = {
			{
				{
					2019,
					12,
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
					1,
					2
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
		desc = "购买皮肤：埃尔德里奇浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9010,
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
	[70131] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤：伊吹浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9011,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70131,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			399011
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
	[70132] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：出云浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9012,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70132,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			399021
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
	[70133] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：威尔士浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9013,
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
	[70134] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：圣路易斯浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9014,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70134,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102132
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
	[70135] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：矶风新年",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9015,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70135,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301601
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
	[70136] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：海伦娜浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9016,
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
	[70137] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：蒙彼利埃浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9009,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70137,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102141
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
	[70138] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：足柄浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9017,
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
	[70139] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：初春冬装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9033,
		time = "always",
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70139,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					12,
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
					2019,
					12,
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
			301211
		}
	},
	[70141] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：胜利-常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9911,
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
					2019,
					11,
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
		}
	},
	[70142] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：谢菲尔德-常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9910,
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
					2019,
					11,
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
		}
	},
	[70143] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：约克公爵-晚礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9909,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70143,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			205072
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70144] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：牙买加-常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9908,
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
					2019,
					11,
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
		}
	},
	[70145] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：天狼星-晚礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9907,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70145,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202201
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70146] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤：贝尔法斯特旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8982,
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
	[70147] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：拉菲春节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8982,
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
	[70148] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：太原-春节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8982,
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
	[70149] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：企业-春节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8982,
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
	[70150] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：半人马-旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8981,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70150,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			206042
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
	[70151] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：君主旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8982,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70151,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			299022
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
	[70152] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：夕暮旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8982,
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
	[70153] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：绫波春节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8982,
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
	[70154] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：列克星敦旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8982,
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
	[70156] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：马拉尼旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8982,
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
	[70157] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：库拉索旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8982,
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
	[70158] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：杓鹬旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8982,
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
	[70159] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：追赶者春节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8982,
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
	[70160] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：扶桑人妻",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8977,
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
					26
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
		desc = "购买皮肤：独角兽JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8973,
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
					18
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
		desc = "购买皮肤：波特兰JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9897,
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
		desc = "购买皮肤：印第安纳波利斯JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9896,
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
	[70172] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：小天鹅皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9864,
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
					2019,
					11,
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
		}
	},
	[70166] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：长门",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9871,
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
					2019,
					11,
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
		}
	},
	[70167] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：金刚",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9880,
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
					2019,
					11,
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
		}
	},
	[70168] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：宵月",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9881,
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
					2019,
					11,
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
		}
	},
	[70170] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：光辉",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8971,
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
					3,
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
					2020,
					4,
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
	[70173] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：陆奥",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9882,
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
					2019,
					11,
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
		}
	},
	[70174] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：绊爱浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9874,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70174,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			10400011
		}
	},
	[70175] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：拉菲coco",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9879,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70175,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101174
		}
	},
	[70176] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：标枪coco",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9878,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70176,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201213
		}
	},
	[70177] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：凌波coco",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9877,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70177,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301055
		}
	},
	[70178] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：Z23coco",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9876,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70178,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			401233
		}
	},
	[70179] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：萨拉托加爱酱联动",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9875,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70179,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107033
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
		tag = 0,
		time_second = 0,
		order = 9855,
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
					2019,
					11,
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
		tag = 0,
		time_second = 0,
		order = 9856,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70184,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207022
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 0,
		time_second = 0,
		order = 9857,
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
					2019,
					11,
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
		tag = 0,
		time_second = 0,
		order = 9858,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70187,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			401234
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 0,
		time_second = 0,
		order = 9859,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70188,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102052
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 0,
		time_second = 0,
		order = 9860,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70189,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107071
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 0,
		time_second = 0,
		order = 9861,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70190,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107051
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70191] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：斯佩伯爵礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9862,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70191,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403053
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 0,
		time_second = 0,
		order = 9863,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70192,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301152
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70199] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：敦刻尔克常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9844,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70199,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			904012
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70200] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：马萨诸塞皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9845,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70200,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			901012
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70201] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：福尔班jk",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9846,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70201,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			801022
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 0,
		time_second = 0,
		order = 9834,
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
					2019,
					11,
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
		tag = 0,
		time_second = 0,
		order = 9833,
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
					2019,
					11,
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
		tag = 0,
		time_second = 0,
		order = 9832,
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
					2019,
					11,
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
		}
	},
	[70206] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：棘鳍jk",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9827,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70206,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			108031
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70207] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：巴尔的摩jk",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9828,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70207,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			103161
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70208] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：艾尔温常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9829,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70208,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101401
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70209] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：伯明翰jk",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9830,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70209,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102231
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70210] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：巴丹睡衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9830,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70210,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107291
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70211] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：克利夫兰常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9826,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70211,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102093
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70213] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：加斯科涅泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 8992,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70213,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			999011
		},
		time = {
			{
				{
					2020,
					1,
					9
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70214] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：佐治亚泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 8992,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70214,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			199022
		},
		time = {
			{
				{
					2020,
					1,
					9
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
					30
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
		tag = 0,
		time_second = 0,
		order = 9816,
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
					2019,
					11,
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
		}
	},
	[70217] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：企业常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9825,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70217,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107063
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70218] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：瑞鹤浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9818,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70218,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			307061
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70219] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：北风浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 8992,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70219,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			399031
		},
		time = {
			{
				{
					2020,
					1,
					9
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
					30
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
		tag = 0,
		time_second = 0,
		order = 9819,
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
					2019,
					11,
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
		tag = 0,
		time_second = 0,
		order = 9820,
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
					2019,
					11,
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
		}
	},
	[70222] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：谢菲尔德浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9821,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70222,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202082
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 0,
		time_second = 0,
		order = 9822,
		time = "stop",
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
		}
	},
	[70224] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：睦月浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9823,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70224,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301322
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 0,
		time_second = 0,
		order = 9817,
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
					2019,
					11,
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
		}
	},
	[70226] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：黑太子泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9814,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70226,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202241
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70227] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：雾岛常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9815,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70227,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			304042
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70228] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：利托里奥泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9805,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70228,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			605021
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70229] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤：扎拉泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9086,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70229,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			603021
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70230] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：可畏泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9807,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70230,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207051
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70231] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：特伦托皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9809,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70231,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			603011
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70232] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：龙骑兵常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9810,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70232,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			601021
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70233] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：凯撒运动服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9811,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70233,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			605061
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 1,
		time_second = 0,
		order = 9076,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70234,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			307051
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 1,
		time_second = 0,
		order = 9077,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70236,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403033
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 1,
		time_second = 0,
		order = 9078,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70237,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			405022
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 1,
		time_second = 0,
		order = 9079,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70238,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			399012
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 1,
		time_second = 0,
		order = 9080,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70239,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403043
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 1,
		time_second = 0,
		order = 9081,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70241,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301143
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 1,
		time_second = 0,
		order = 9082,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70242,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202123
		},
		time = {
			{
				{
					2019,
					11,
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
		order = 9083,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70243,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			905011
		},
		time = {
			{
				{
					2019,
					11,
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
		tag = 1,
		time_second = 0,
		order = 9084,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70244,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			499011
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70245] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：埃塞克斯机车",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9075,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70245,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107091
		}
	},
	[70246] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：贝奇机车",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9074,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70246,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101351
		}
	},
	[70248] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：晓机车",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9073,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70248,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301092
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
		tag = 2,
		time_second = 0,
		order = 9072,
		time = "stop",
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
		tag = 2,
		time_second = 0,
		order = 9068,
		time = "stop",
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
		tag = 2,
		time_second = 0,
		order = 9067,
		time = "stop",
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
		}
	},
	[70252] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：U110JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9050,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70252,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			408081
		}
	},
	[70253] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：格奈森瑙万圣节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9051,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70253,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			404021
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
		order = 9052,
		time = "stop",
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
		order = 9053,
		time = "stop",
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
		}
	},
	[70256] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：阿贝克隆比万圣节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9054,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70256,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			213041
		}
	},
	[70257] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：斯莫利万圣节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9055,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70257,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101421
		}
	},
	[70258] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：三日月万圣节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9056,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70258,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301411
		}
	},
	[70259] = {
		group_type = 0,
		resource_num = 1100,
		desc = "购买皮肤：埃尔德里奇偶像",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8975,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70259,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101264
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
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70260] = {
		group_type = 0,
		resource_num = 1100,
		desc = "购买皮肤：斯佩伯爵偶像",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8975,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70260,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403054
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
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70261] = {
		group_type = 0,
		resource_num = 1100,
		desc = "购买皮肤：平海偶像",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8975,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70261,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			502033
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
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70262] = {
		group_type = 0,
		resource_num = 1100,
		desc = "购买皮肤：宁海偶像",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8975,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70262,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			502023
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
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70263] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：绫波偶像",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8975,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70263,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301057
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
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70264] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：拉菲偶像",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8975,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70264,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101176
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
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70265] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：Z23偶像",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8975,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70265,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			401236
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
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70267] = {
		group_type = 0,
		resource_num = 900,
		desc = "购买皮肤：白上吹雪皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9038,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70267,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			10500011
		},
		time = {
			{
				{
					2019,
					11,
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
					12,
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
	[70268] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：夏色祭皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9039,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70268,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			10500041
		},
		time = {
			{
				{
					2019,
					11,
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
					12,
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
	[70269] = {
		group_type = 0,
		resource_num = 900,
		desc = "购买皮肤：凑阿库娅皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9038,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70269,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			10500031
		},
		time = {
			{
				{
					2019,
					11,
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
					12,
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
	[70270] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：大神澪皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9039,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70270,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			10500071
		},
		time = {
			{
				{
					2019,
					11,
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
					12,
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
	[70271] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：百鬼绫目皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9039,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70271,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			10500051
		},
		time = {
			{
				{
					2019,
					11,
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
					12,
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
	[70272] = {
		group_type = 0,
		resource_num = 900,
		desc = "购买皮肤：时乃空皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9038,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70272,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			10500021
		},
		time = {
			{
				{
					2019,
					11,
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
					12,
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
	[70273] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：紫咲诗音皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9039,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70273,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			10500061
		},
		time = {
			{
				{
					2019,
					11,
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
					12,
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
	[70274] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：格拉斯哥JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9040,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70274,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202261
		},
		time = {
			{
				{
					2019,
					11,
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
		}
	},
	[70276] = {
		group_type = 0,
		resource_num = 900,
		desc = "购买皮肤：海王星圣诞",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9025,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70276,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			299011
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
					2020,
					1,
					2
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70277] = {
		group_type = 0,
		resource_num = 900,
		desc = "购买皮肤：西雅图圣诞",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8992,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70277,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			199012
		},
		time = {
			{
				{
					2020,
					1,
					9
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70278] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：清波圣诞",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9026,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70278,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301541
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
					2020,
					1,
					2
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70279] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：阿贺野圣诞",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9027,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70279,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			302201
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
					2020,
					1,
					2
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70280] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：康克德圣诞",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9029,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70280,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102182
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
					2020,
					1,
					2
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70281] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：五十铃圣诞",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9030,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70281,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			302052
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
					2020,
					1,
					2
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70282] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：杜威圣诞",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8990,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70282,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101022
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70283] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤：能代新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8993,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70283,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			302211
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
	[70284] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤：骏河新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8994,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70284,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305141
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
	[70285] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：腓特烈大帝新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8991,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70285,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			499021
		},
		time = {
			{
				{
					2020,
					1,
					9
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70286] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤：龙凤新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8996,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70286,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			306071
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
	[70287] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：长门新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8997,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70287,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305052
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
	[70288] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：平海日本旅游",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8980,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70288,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			502034
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
	[70289] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：宁海日本旅游",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8980,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70289,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			502024
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
	[70290] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：响和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9000,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70290,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301101
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
	[70291] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：独角兽新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9001,
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
	[70292] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：Z35新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9002,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70292,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			401351
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
	[70293] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：雾岛新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9003,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70293,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			304043
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
	[70294] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：绫波新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9004,
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
	[70295] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：南安普顿新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9005,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70295,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202071
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
	[70296] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：克爹新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9006,
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
	[70297] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：霞新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9007,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70297,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301811
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
	[70298] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：方舟新年和服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9008,
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
	[70299] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：阿贺野常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8995,
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70300] = {
		group_type = 0,
		resource_num = 1200,
		desc = "购买皮肤：吾妻旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8979,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70300,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			399041
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
	[70301] = {
		group_type = 0,
		resource_num = 1200,
		desc = "购买皮肤：雪风旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8979,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70301,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301162
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
	[70302] = {
		group_type = 0,
		resource_num = 1200,
		desc = "购买皮肤：大凤旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8979,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70302,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			307072
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
	[70303] = {
		group_type = 0,
		resource_num = 900,
		desc = "购买皮肤：天狼星旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8979,
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
	[70305] = {
		group_type = 0,
		resource_num = 900,
		desc = "购买皮肤：伊吹旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8979,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70305,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			399013
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
	[70306] = {
		group_type = 0,
		resource_num = 900,
		desc = "购买皮肤：光辉旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8979,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70306,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207035
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
	[70307] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：德意志旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8979,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70307,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403044
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
	[70308] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：黑太子旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8979,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70308,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202242
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
	[70309] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：比叡旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8979,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70309,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			304022
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
	[70310] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：比洛克西旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8979,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70310,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102251
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
	[70311] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：格罗斯特旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8979,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70311,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202101
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
	[70312] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：沙恩霍斯特旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8979,
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
	[70313] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：哈尔西中国衣服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8979,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70313,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101431
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
	[70314] = {
		group_type = 0,
		resource_num = 1100,
		desc = "购买皮肤：欧若拉川剧皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8976,
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
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70315] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：阿卡斯塔元宵节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 8978,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70315,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201022
		},
		time = {
			{
				{
					2020,
					2,
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
	[70316] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：长月女仆",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8976,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70316,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301391
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
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70317] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：浦波滑雪服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8976,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70317,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301721
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
					26
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
		tag = 2,
		time_second = 0,
		order = 8975,
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
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70320] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：苏维埃罗希娅皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8974,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70320,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			705051
		},
		time = {
			{
				{
					2020,
					2,
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
					2020,
					3,
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
	[70321] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：恰巴耶夫皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8974,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70321,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			702031
		},
		time = {
			{
				{
					2020,
					2,
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
					2020,
					3,
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
	[70322] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：阿芙乐尔皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8974,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70322,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			702011
		},
		time = {
			{
				{
					2020,
					2,
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
					2020,
					3,
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
	[70323] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：威严皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8974,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70323,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			701021
		},
		time = {
			{
				{
					2020,
					2,
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
					2020,
					3,
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
	[70324] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：明斯克皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8974,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70324,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			701031
		},
		time = {
			{
				{
					2020,
					2,
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
					2020,
					3,
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
	[70325] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：甘古特皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8974,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70325,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			705011
		},
		time = {
			{
				{
					2020,
					2,
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
					2020,
					3,
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
	[70326] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：水星纪念皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8974,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70326,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			702021
		},
		time = {
			{
				{
					2020,
					2,
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
					2020,
					3,
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
	[70327] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：塔什干皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 8974,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70327,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			701041
		},
		time = {
			{
				{
					2020,
					2,
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
					2020,
					3,
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
	[90001] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：光辉-永不落幕的茶会",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 1,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 125,
		id = 90001,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207031
		}
	},
	[90002] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：夕暮-女仆练习生",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 2,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 125,
		id = 90002,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301261
		}
	},
	[90003] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：卯月-贪睡的天使",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 3,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 125,
		id = 90003,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301351
		}
	},
	[90013] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：利托里奥泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 1,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 90013,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			605021
		}
	},
	[90014] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：扎拉泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 2,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 90014,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			603021
		}
	},
	[90015] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：拉菲-雪兔与苹果糖",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 3,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 90015,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101172
		}
	},
	[90016] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：翔鹤礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 1,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 90016,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			307051
		}
	},
	[90017] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：让巴尔礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 2,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 90017,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			905011
		}
	},
	[90018] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：夕立礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 3,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 90018,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301143
		}
	},
	[90022] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：约克JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 2,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 90022,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			203071
		}
	},
	[90023] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：山城JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 1,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 90023,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305026
		}
	},
	[90024] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：独角兽春之礼",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 3,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 90024,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			206032
		}
	},
	[90028] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：爱丁堡万圣节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 1,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 90028,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202112
		}
	},
	[90029] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：绫波万圣节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 2,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 90029,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301051
		}
	},
	[90030] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：克利夫兰万圣节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 3,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 90030,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102091
		}
	},
	[90034] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：苏维埃罗西亚皮肤",
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
		id = 90034,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			705051
		},
		time = {
			{
				{
					2020,
					2,
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
					2020,
					3,
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
	[90035] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：明斯克皮肤",
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
		id = 90035,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			701031
		},
		time = {
			{
				{
					2020,
					2,
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
					2020,
					3,
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
	[90036] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：威严皮肤",
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
		id = 90036,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			701021
		},
		time = {
			{
				{
					2020,
					2,
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
					2020,
					3,
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
	[99000] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞（堕落之翼活动时美服独有）",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 6,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99000,
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
					2018,
					10,
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
					2018,
					11,
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
	[99001] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包（堕落之翼活动时美服独有）",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 6,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99001,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40103
		},
		time = {
			{
				{
					2018,
					10,
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
					2018,
					11,
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
	[99002] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包（海王星活动时美服独有）",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 6,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99002,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40103
		},
		time = {
			{
				{
					2018,
					11,
					22
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
	[99003] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包（异色格活动时美服独有）",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 6,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99003,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40103
		},
		time = {
			{
				{
					2018,
					12,
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
					2018,
					12,
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99004] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞",
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
		id = 99004,
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
					14
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99005] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买春节建造补给",
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
		id = 99005,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40957
		},
		time = {
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
					14
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99006] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买红染攻略补给",
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
		id = 99006,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40102
		},
		time = {
			{
				{
					2017,
					10,
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
					2017,
					11,
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
	[99007] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买红染建造补给",
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
		id = 99007,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40004
		},
		time = {
			{
				{
					2017,
					10,
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
					2017,
					11,
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
	[99008] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包（绊爱联动时美服独有）",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 6,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99008,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40103
		},
		time = {
			{
				{
					2019,
					4,
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
					2019,
					5,
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
	[99009] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买攻略补给",
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
		id = 99009,
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
					6,
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
					2019,
					6,
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99010] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞",
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
		id = 99010,
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
					7,
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
					8,
					14
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99011] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：大凤礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 1,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 125,
		id = 99011,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			307071
		}
	},
	[99012] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：光辉礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 2,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 125,
		id = 99012,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207032
		}
	},
	[99013] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：明石礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 3,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 125,
		id = 99013,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			312012
		}
	},
	[99014] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买红染建造补给",
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
		id = 99014,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40004
		},
		time = {
			{
				{
					2019,
					8,
					29
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
					9,
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
	[99015] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：翔鹤礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 1,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 99015,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107091
		}
	},
	[99016] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：让巴尔礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 2,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 99016,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301092
		}
	},
	[99017] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：夕立礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 3,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 99017,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			808011
		}
	},
	[99018] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买攻略补给",
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
		id = 99018,
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
					9,
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
					2019,
					10,
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
	[99019] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：比叡睡衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 5,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 99019,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			304021
		}
	},
	[99020] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：浜风校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 6,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 99020,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301611
		}
	},
	[99021] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：三笠常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 4,
		time = "stop",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 136,
		id = 99021,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305111
		}
	},
	[99022] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买攻略补给",
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
		id = 99022,
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
					10,
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99023] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买红染攻略补给",
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
		id = 99023,
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
	[99024] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买红染建造补给",
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
		id = 99024,
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
	[99025] = {
		group_type = 0,
		resource_num = 1,
		desc = "购买皮肤:齐柏林泳装",
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
		id = 99025,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			407011
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
	[99026] = {
		group_type = 0,
		resource_num = 1,
		desc = "购买皮肤:提尔比茨皮肤",
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
		id = 99026,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			405021
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
	[99027] = {
		group_type = 0,
		resource_num = 1,
		desc = "购买皮肤:U47皮肤",
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
		id = 99027,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			408021
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
	[99028] = {
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
		id = 99028,
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
					2020,
					1,
					2
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99029] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物资兑换1个外观装备箱",
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
		id = 99029,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30310
		}
	},
	[99030] = {
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
		id = 99030,
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
					20
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99031] = {
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
		id = 99031,
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
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99032] = {
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
		id = 99032,
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
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99033] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞",
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
		id = 99033,
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
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99034] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包（绊爱联动时美服独有）",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 6,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99034,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40103
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
					26
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
		31984,
		31985,
		31986,
		31987,
		31988,
		31989,
		31990,
		31991,
		31994,
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
		60001,
		60002,
		60003,
		60004,
		60005,
		60101,
		60105,
		60109,
		60110,
		60111,
		60112,
		60114,
		60115,
		60125,
		60126,
		60127,
		60128,
		60135,
		60136,
		60140,
		60141,
		60144,
		60145,
		60146,
		60147,
		60148,
		60149,
		60150,
		60152,
		60153,
		60158,
		60159,
		60160,
		60161,
		60162,
		60163,
		60164,
		60165,
		60166,
		60167,
		60168,
		60169,
		60170,
		60175,
		60176,
		60177,
		60178,
		60179,
		60180,
		60181,
		60182,
		60183,
		60184,
		60185,
		60186,
		60187,
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
		70013,
		70014,
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
		70035,
		70036,
		70037,
		70038,
		70039,
		70040,
		70041,
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
		70104,
		70105,
		70106,
		70107,
		70109,
		70110,
		70111,
		70112,
		70113,
		70114,
		70115,
		70116,
		70117,
		70124,
		70125,
		70126,
		70127,
		70128,
		70129,
		70130,
		70131,
		70132,
		70133,
		70134,
		70135,
		70136,
		70137,
		70138,
		70139,
		70141,
		70142,
		70143,
		70144,
		70145,
		70146,
		70147,
		70148,
		70149,
		70150,
		70151,
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
		70172,
		70166,
		70167,
		70168,
		70170,
		70173,
		70174,
		70175,
		70176,
		70177,
		70178,
		70179,
		70183,
		70184,
		70186,
		70187,
		70188,
		70189,
		70190,
		70191,
		70192,
		70199,
		70200,
		70201,
		70203,
		70204,
		70205,
		70206,
		70207,
		70208,
		70209,
		70210,
		70211,
		70213,
		70214,
		70216,
		70217,
		70218,
		70219,
		70220,
		70221,
		70222,
		70223,
		70224,
		70225,
		70226,
		70227,
		70228,
		70229,
		70230,
		70231,
		70232,
		70233,
		70234,
		70236,
		70237,
		70238,
		70239,
		70241,
		70242,
		70243,
		70244,
		70245,
		70246,
		70248,
		70249,
		70250,
		70251,
		70252,
		70253,
		70254,
		70255,
		70256,
		70257,
		70258,
		70259,
		70260,
		70261,
		70262,
		70263,
		70264,
		70265,
		70267,
		70268,
		70269,
		70270,
		70271,
		70272,
		70273,
		70274,
		70276,
		70277,
		70278,
		70279,
		70280,
		70281,
		70282,
		70283,
		70284,
		70285,
		70286,
		70287,
		70288,
		70289,
		70290,
		70291,
		70292,
		70293,
		70294,
		70295,
		70296,
		70297,
		70298,
		70299,
		70300,
		70301,
		70302,
		70303,
		70305,
		70306,
		70307,
		70308,
		70309,
		70310,
		70311,
		70312,
		70313,
		70314,
		70315,
		70316,
		70317,
		70318,
		70320,
		70321,
		70322,
		70323,
		70324,
		70325,
		70326,
		70327,
		90001,
		90002,
		90003,
		90013,
		90014,
		90015,
		90016,
		90017,
		90018,
		90022,
		90023,
		90024,
		90028,
		90029,
		90030,
		90034,
		90035,
		90036,
		99000,
		99001,
		99002,
		99003,
		99004,
		99005,
		99006,
		99007,
		99008,
		99009,
		99010,
		99011,
		99012,
		99013,
		99014,
		99015,
		99016,
		99017,
		99018,
		99019,
		99020,
		99021,
		99022,
		99023,
		99024,
		99025,
		99026,
		99027,
		99028,
		99029,
		99030,
		99031,
		99032,
		99033,
		99034
	}
}

return
