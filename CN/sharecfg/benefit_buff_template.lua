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
		desc = "后宅经验加成提高5%"
	},
	{
		max_time = 86400,
		name = "",
		icon = "Props/huangjialiaoli",
		benefit_effect = "10",
		id = 2,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "后宅经验加成提高10%"
	},
	{
		max_time = 86400,
		name = "",
		icon = "Props/manhanquanxi",
		benefit_effect = "20",
		id = 3,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "后宅经验加成提高20%"
	},
	{
		max_time = 0,
		name = "经验加成",
		icon = "Props/xinshou",
		benefit_effect = "100",
		id = 4,
		benefit_type = "rookie_battle_exp",
		desc = "指挥官等级小于40级时，在普通关卡、困难关卡、每日活动中获得的指挥官经验和角色经验提高100%",
		benefit_condition = {
			"lv",
			"<",
			40
		}
	},
	[10] = {
		max_time = 86400,
		name = "学业",
		icon = "Props/buff_minigame_10",
		benefit_effect = "300",
		id = 10,
		benefit_condition = "",
		benefit_type = "skill_learncost_up",
		desc = "战术学院技能学习时间略微减少\n剩余时间:$1"
	},
	[11] = {
		max_time = 86400,
		name = "事业",
		icon = "Props/buff_minigame_11",
		benefit_effect = "500",
		id = 11,
		benefit_condition = "",
		benefit_type = "battle_buff",
		desc = "主线、困难、作战档案关卡中，我方战斗内造成的伤害略微提高\n剩余时间:$1"
	},
	[12] = {
		max_time = 86400,
		name = "姻缘",
		icon = "Props/buff_minigame_12",
		benefit_effect = "1",
		id = 12,
		benefit_condition = "",
		benefit_type = "intimacy_up_extra",
		desc = "秘书舰好感度提高速度加快\n剩余时间:$1"
	},
	all = {
		1,
		2,
		3,
		4,
		10,
		11,
		12
	}
}

return
