pg = pg or {}
pg.benefit_buff_template = {
	{
		max_time = 86400,
		name = "",
		icon = "Props/christmas",
		benefit_effect = "5",
		id = 1,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "後宅經驗加成提高5%"
	},
	{
		max_time = 86400,
		name = "",
		icon = "Props/huangjialiaoli",
		benefit_effect = "10",
		id = 2,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "後宅經驗加成提高10%"
	},
	{
		max_time = 86400,
		name = "",
		icon = "Props/manhanquanxi",
		benefit_effect = "20",
		id = 3,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "後宅經驗加成提高20%"
	},
	{
		max_time = 0,
		name = "經驗加成",
		icon = "Props/xinshou",
		benefit_effect = "100",
		id = 4,
		benefit_type = "rookie_battle_exp",
		desc = "指揮官等級小於30級時，在普通關卡、困難關卡、每日活動中獲得的指揮官經驗和艦船經驗提高100%",
		benefit_condition = {
			"lv",
			"<",
			40
		}
	},
	all = {
		1,
		2,
		3,
		4
	}
}

return
