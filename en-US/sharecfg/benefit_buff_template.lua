pg = pg or {}
pg.benefit_buff_template = {
	{
		max_time = 86400,
		name = "",
		icon = "Props/haijungali",
		benefit_effect = "5",
		id = 1,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "Dorm EXP bonus +5%"
	},
	{
		max_time = 86400,
		name = "",
		icon = "Props/huangjialiaoli",
		benefit_effect = "10",
		id = 2,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "Dorm EXP bonus +10%"
	},
	{
		max_time = 86400,
		name = "",
		icon = "Props/manhanquanxi",
		benefit_effect = "20",
		id = 3,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "Dorm EXP bonus +20%"
	},
	{
		max_time = 0,
		name = "EXP Bonus",
		icon = "Props/xinshou",
		benefit_effect = "100",
		id = 4,
		benefit_type = "rookie_battle_exp",
		desc = "Earn 100% bonus Commander EXP and Ship EXP from Normal stages, Hard stages, Event stages, War Archives stages and daily missions when you are lower than lv. 30.",
		benefit_condition = {
			"lv",
			"<",
			30
		}
	},
	[10] = {
		max_time = 86400,
		name = "Academic Achievement",
		icon = "Props/buff_minigame_10",
		benefit_effect = "300",
		id = 10,
		benefit_condition = "",
		benefit_type = "skill_learncost_up",
		desc = "Tactical Class lesson time is reduced. \nTime remaining: $1"
	},
	[11] = {
		max_time = 86400,
		name = "Career Success",
		icon = "Props/buff_minigame_11",
		benefit_effect = "504",
		id = 11,
		benefit_condition = "",
		benefit_type = "battle_buff",
		desc = "While sortieing in a Campaign, Hard Mode, or War Archives map, your ships deal slightly more DMG. \nTime remaining: $1"
	},
	[12] = {
		max_time = 86400,
		name = "Fruitful Courtship",
		icon = "Props/buff_minigame_12",
		benefit_effect = "1",
		id = 12,
		benefit_condition = "",
		benefit_type = "intimacy_up_extra",
		desc = "Increases the rate at which your secretary ship gains Affection. \nTime remaining: $1"
	},
	[13] = {
		max_time = 0,
		name = "Combat Insight I",
		icon = "Props/xinshou",
		benefit_effect = "3",
		id = 13,
		benefit_type = "ship_battle_exp",
		desc = "Increases the EXP that ships gain from Normal, Hard, and Event stages by 3%",
		benefit_condition = {
			"activity",
			30707,
			{
				5,
				1
			}
		}
	},
	[14] = {
		max_time = 0,
		name = "Combat Insight II",
		icon = "Props/xinshou",
		benefit_effect = "4",
		id = 14,
		benefit_type = "ship_battle_exp",
		desc = "Increases the EXP that ships gain from Normal, Hard, and Event stages by 4%",
		benefit_condition = {
			"activity",
			30707,
			{
				5,
				2
			}
		}
	},
	[15] = {
		max_time = 0,
		name = "Combat Insight III",
		icon = "Props/xinshou",
		benefit_effect = "5",
		id = 15,
		benefit_type = "ship_battle_exp",
		desc = "Increases the EXP that ships gain from Normal, Hard, and Event stages by 5%",
		benefit_condition = {
			"activity",
			30707,
			{
				5,
				3
			}
		}
	},
	[16] = {
		max_time = 0,
		name = "Battle Acumen I",
		icon = "Props/buff_minigame_11",
		benefit_effect = "500",
		id = 16,
		benefit_type = "battle_buff",
		desc = "Increases the DMG your ships deal in Normal, Hard, and Event stages by 1%",
		benefit_condition = {
			"activity",
			30707,
			{
				6,
				1
			}
		}
	},
	[17] = {
		max_time = 0,
		name = "Battle Acumen II",
		icon = "Props/buff_minigame_11",
		benefit_effect = "502",
		id = 17,
		benefit_type = "battle_buff",
		desc = "Increases the DMG your ships deal in Normal, Hard, and Event stages by 2%",
		benefit_condition = {
			"activity",
			30707,
			{
				6,
				2
			}
		}
	},
	[18] = {
		max_time = 0,
		name = "Battle Acumen III",
		icon = "Props/buff_minigame_11",
		benefit_effect = "504",
		id = 18,
		benefit_type = "battle_buff",
		desc = "Increases the DMG your ships deal in Normal, Hard, and Event stages by 3%",
		benefit_condition = {
			"activity",
			30707,
			{
				6,
				3
			}
		}
	},
	[19] = {
		max_time = 0,
		name = "Efficient Education I",
		icon = "Props/buff_minigame_10",
		benefit_effect = "300",
		id = 19,
		benefit_type = "skill_learncost_up",
		desc = "Reduces Tactical Class training time by 3%",
		benefit_condition = {
			"activity",
			30707,
			{
				7,
				1
			}
		}
	},
	[20] = {
		max_time = 0,
		name = "Efficient Education II",
		icon = "Props/buff_minigame_10",
		benefit_effect = "400",
		id = 20,
		benefit_type = "skill_learncost_up",
		desc = "Reduces Tactical Class training time by 4%",
		benefit_condition = {
			"activity",
			30707,
			{
				7,
				2
			}
		}
	},
	[21] = {
		max_time = 0,
		name = "Efficient Education III",
		icon = "Props/buff_minigame_10",
		benefit_effect = "500",
		id = 21,
		benefit_type = "skill_learncost_up",
		desc = "Reduces Tactical Class training time by 5%",
		benefit_condition = {
			"activity",
			30707,
			{
				7,
				3
			}
		}
	},
	[22] = {
		max_time = 0,
		name = "Leisurely Learning I",
		icon = "Props/buff_minigame_12",
		benefit_effect = "3",
		id = 22,
		benefit_type = "dorm_exp",
		desc = "Increases EXP gained in the Dorm by 3%",
		benefit_condition = {
			"activity",
			30707,
			{
				8,
				1
			}
		}
	},
	[23] = {
		max_time = 0,
		name = "Leisurely Learning II",
		icon = "Props/buff_minigame_12",
		benefit_effect = "4",
		id = 23,
		benefit_type = "dorm_exp",
		desc = "Increases EXP gained in the Dorm by 4%",
		benefit_condition = {
			"activity",
			30707,
			{
				8,
				2
			}
		}
	},
	[24] = {
		max_time = 0,
		name = "Leisurely Learning III",
		icon = "Props/buff_minigame_12",
		benefit_effect = "5",
		id = 24,
		benefit_type = "dorm_exp",
		desc = "Increases EXP gained in the Dorm by 5%",
		benefit_condition = {
			"activity",
			30707,
			{
				8,
				3
			}
		}
	},
	[25] = {
		max_time = 0,
		name = "Specialized Core Event Boost ",
		icon = "Props/buff_urptup",
		benefit_effect = "0",
		id = 25,
		benefit_condition = "",
		benefit_type = "urpt_drop_up",
		desc = "\"Dreamwaker's Butterfly\" Event Stages will drop twice the amount of Specialized Cores. "
	},
	[26] = {
		max_time = 0,
		name = "Vocal Appeal",
		icon = "Props/yanchangli1",
		benefit_effect = "500",
		id = 26,
		benefit_type = "battle_buff",
		desc = "Increases the DMG your ships deal on Normal, Hard, Event, and War Archives stages by 1.0%.",
		benefit_condition = {
			"activity",
			30746,
			0
		}
	},
	[27] = {
		max_time = 0,
		name = "Vocal Appeal",
		icon = "Props/yanchangli2",
		benefit_effect = "502",
		id = 27,
		benefit_type = "battle_buff",
		desc = "Increases the DMG your ships deal on Normal, Hard, Event, and War Archives stages by 2.0%.",
		benefit_condition = {
			"activity",
			30746,
			0
		}
	},
	[28] = {
		max_time = 0,
		name = "Vocal Appeal",
		icon = "Props/yanchangli3",
		benefit_effect = "504",
		id = 28,
		benefit_type = "battle_buff",
		desc = "Increases the DMG your ships deal on Normal, Hard, Event, and War Archives stages by 3.0%.",
		benefit_condition = {
			"activity",
			30746,
			0
		}
	},
	[29] = {
		max_time = 0,
		name = "Glamorous Steps",
		icon = "Props/wudaoli1",
		benefit_effect = "510",
		id = 29,
		benefit_type = "battle_buff",
		desc = "Decreases the DMG your ships take on Normal, Hard, Event, and War Archives stages by 1.0%.",
		benefit_condition = {
			"activity",
			30746,
			0
		}
	},
	[30] = {
		max_time = 0,
		name = "Glamorous Steps",
		icon = "Props/wudaoli2",
		benefit_effect = "512",
		id = 30,
		benefit_type = "battle_buff",
		desc = "Decreases the DMG your ships take on Normal, Hard, Event, and War Archives stages by 2.0%.",
		benefit_condition = {
			"activity",
			30746,
			0
		}
	},
	[31] = {
		max_time = 0,
		name = "Glamorous Steps",
		icon = "Props/wudaoli3",
		benefit_effect = "514",
		id = 31,
		benefit_type = "battle_buff",
		desc = "Decreases the DMG your ships take on Normal, Hard, Event, and War Archives stages by 3.0%.",
		benefit_condition = {
			"activity",
			30746,
			0
		}
	},
	[32] = {
		max_time = 0,
		name = "Memorable Performance",
		icon = "Props/biaoyanli1",
		benefit_effect = "0",
		id = 32,
		benefit_type = "ship_battle_exp",
		desc = "Increases the EXP your ships gain on Normal, Hard, Event, and War Archives stages by 3.0%.",
		benefit_condition = {
			"activity",
			30746,
			0
		}
	},
	[33] = {
		max_time = 0,
		name = "Memorable Performance",
		icon = "Props/biaoyanli2",
		benefit_effect = "0",
		id = 33,
		benefit_type = "ship_battle_exp",
		desc = "Increases the EXP your ships gain on Normal, Hard, Event, and War Archives stages by 4.0%.",
		benefit_condition = {
			"activity",
			30746,
			0
		}
	},
	[34] = {
		max_time = 0,
		name = "Memorable Performance",
		icon = "Props/biaoyanli3",
		benefit_effect = "0",
		id = 34,
		benefit_type = "ship_battle_exp",
		desc = "Increases the EXP your ships gain on Normal, Hard, Event, and War Archives stages by 5.0%.",
		benefit_condition = {
			"activity",
			30746,
			0
		}
	},
	all = {
		1,
		2,
		3,
		4,
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
		22,
		23,
		24,
		25,
		26,
		27,
		28,
		29,
		30,
		31,
		32,
		33,
		34
	}
}
