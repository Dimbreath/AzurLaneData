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
		desc = "指挥官等级小于30级时，在普通关卡、困难关卡、活动关卡、每日活动中获得的指挥官经验和角色经验提高100%",
		benefit_condition = {
			"lv",
			"<",
			30
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
	[13] = {
		max_time = 0,
		name = "舰娘经验加成1",
		icon = "Props/xinshou",
		benefit_effect = "3",
		id = 13,
		benefit_type = "ship_battle_exp",
		desc = "主线、困难、活动、作战档案关卡中，角色经验获取提高3%",
		benefit_condition = {
			"activity",
			587,
			{
				1,
				1
			}
		}
	},
	[14] = {
		max_time = 0,
		name = "舰娘经验加成2",
		icon = "Props/xinshou",
		benefit_effect = "4",
		id = 14,
		benefit_type = "ship_battle_exp",
		desc = "主线、困难、活动、作战档案关卡中，角色经验获取提高4%",
		benefit_condition = {
			"activity",
			587,
			{
				1,
				2
			}
		}
	},
	[15] = {
		max_time = 0,
		name = "舰娘经验加成3",
		icon = "Props/xinshou",
		benefit_effect = "5",
		id = 15,
		benefit_type = "ship_battle_exp",
		desc = "主线、困难、活动、作战档案关卡中，角色经验获取提高5%",
		benefit_condition = {
			"activity",
			587,
			{
				1,
				3
			}
		}
	},
	[16] = {
		max_time = 0,
		name = "战斗伤害加成1",
		icon = "Props/buff_minigame_11",
		benefit_effect = "502",
		id = 16,
		benefit_type = "battle_buff",
		desc = "主线、困难、活动、作战档案关卡中，造成的伤害提高1%",
		benefit_condition = {
			"activity",
			587,
			{
				2,
				1
			}
		}
	},
	[17] = {
		max_time = 0,
		name = "战斗伤害加成2",
		icon = "Props/buff_minigame_11",
		benefit_effect = "504",
		id = 17,
		benefit_type = "battle_buff",
		desc = "主线、困难、活动、作战档案关卡中，造成的伤害提高2%",
		benefit_condition = {
			"activity",
			587,
			{
				2,
				2
			}
		}
	},
	[18] = {
		max_time = 0,
		name = "战斗伤害加成3",
		icon = "Props/buff_minigame_11",
		benefit_effect = "500",
		id = 18,
		benefit_type = "battle_buff",
		desc = "主线、困难、活动、作战档案关卡中，造成的伤害提高3%",
		benefit_condition = {
			"activity",
			587,
			{
				2,
				3
			}
		}
	},
	[19] = {
		max_time = 0,
		name = "战术学院学习时间缩短1",
		icon = "Props/buff_minigame_10",
		benefit_effect = "300",
		id = 19,
		benefit_type = "skill_learncost_up",
		desc = "战术学院技能学习时间减少3%",
		benefit_condition = {
			"activity",
			587,
			{
				3,
				1
			}
		}
	},
	[20] = {
		max_time = 0,
		name = "战术学院学习时间缩短2",
		icon = "Props/buff_minigame_10",
		benefit_effect = "400",
		id = 20,
		benefit_type = "skill_learncost_up",
		desc = "战术学院技能学习时间减少4%",
		benefit_condition = {
			"activity",
			587,
			{
				3,
				2
			}
		}
	},
	[21] = {
		max_time = 0,
		name = "战术学院学习时间缩短3",
		icon = "Props/buff_minigame_10",
		benefit_effect = "500",
		id = 21,
		benefit_type = "skill_learncost_up",
		desc = "战术学院技能学习时间减少5%",
		benefit_condition = {
			"activity",
			587,
			{
				3,
				3
			}
		}
	},
	[22] = {
		max_time = 0,
		name = "后宅经验加成1",
		icon = "Props/buff_minigame_12",
		benefit_effect = "3",
		id = 22,
		benefit_type = "dorm_exp",
		desc = "后宅经验加成提高3%",
		benefit_condition = {
			"activity",
			587,
			{
				4,
				1
			}
		}
	},
	[23] = {
		max_time = 0,
		name = "后宅经验加成2",
		icon = "Props/buff_minigame_12",
		benefit_effect = "4",
		id = 23,
		benefit_type = "dorm_exp",
		desc = "后宅经验加成提高4%",
		benefit_condition = {
			"activity",
			587,
			{
				4,
				2
			}
		}
	},
	[24] = {
		max_time = 0,
		name = "后宅经验加成3",
		icon = "Props/buff_minigame_12",
		benefit_effect = "5",
		id = 24,
		benefit_type = "dorm_exp",
		desc = "后宅经验加成提高5%",
		benefit_condition = {
			"activity",
			587,
			{
				4,
				3
			}
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
		24
	}
}
