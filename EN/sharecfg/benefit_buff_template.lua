pg = pg or {}
pg.benefit_buff_template = {
	{
		max_time = 86400,
		name = "",
		icon = "Props/huoji",
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
		benefit_effect = "500",
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
	all = {
		1,
		2,
		3,
		10,
		11,
		12
	}
}

return
