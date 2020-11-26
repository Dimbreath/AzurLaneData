pg = pg or {}
pg.benefit_buff_template = {
	{
		name = "",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "后宅经验加成提高5%",
		benefit_effect = "5",
		id = 1,
		icon = "Props/haijungali",
		benefit_type = "dorm_exp"
	},
	{
		name = "",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "后宅经验加成提高10%",
		benefit_effect = "10",
		id = 2,
		icon = "Props/huangjialiaoli",
		benefit_type = "dorm_exp"
	},
	{
		name = "",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "后宅经验加成提高20%",
		benefit_effect = "20",
		id = 3,
		icon = "Props/manhanquanxi",
		benefit_type = "dorm_exp"
	},
	{
		name = "经验加成",
		hide = 0,
		max_time = 0,
		desc = "指挥官等级小于30级时，在普通关卡、困难关卡、活动关卡、每日活动中获得的指挥官经验和角色经验提高100%",
		benefit_effect = "100",
		id = 4,
		icon = "Props/xinshou",
		benefit_type = "rookie_battle_exp",
		benefit_condition = {
			"lv",
			"<",
			30
		}
	},
	[10] = {
		name = "学业",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "战术学院技能学习时间略微减少\n剩余时间:$1",
		benefit_effect = "300",
		id = 10,
		icon = "Props/buff_minigame_10",
		benefit_type = "skill_learncost_up"
	},
	[11] = {
		name = "事业",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "主线、困难、作战档案关卡中，我方战斗内造成的伤害略微提高\n剩余时间:$1",
		benefit_effect = "504",
		id = 11,
		icon = "Props/buff_minigame_11",
		benefit_type = "battle_buff"
	},
	[12] = {
		name = "姻缘",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "秘书舰好感度提高速度加快\n剩余时间:$1",
		benefit_effect = "1",
		id = 12,
		icon = "Props/buff_minigame_12",
		benefit_type = "intimacy_up_extra"
	},
	[13] = {
		name = "舰娘经验加成1",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，角色经验获取提高3%",
		benefit_effect = "3",
		id = 13,
		icon = "Props/xinshou",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			686,
			{
				5,
				1
			}
		}
	},
	[14] = {
		name = "舰娘经验加成2",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，角色经验获取提高4%",
		benefit_effect = "4",
		id = 14,
		icon = "Props/xinshou",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			686,
			{
				5,
				2
			}
		}
	},
	[15] = {
		name = "舰娘经验加成3",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，角色经验获取提高5%",
		benefit_effect = "5",
		id = 15,
		icon = "Props/xinshou",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			686,
			{
				5,
				3
			}
		}
	},
	[16] = {
		name = "战斗伤害加成1",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，造成的伤害提高1%",
		benefit_effect = "500",
		id = 16,
		icon = "Props/buff_minigame_11",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			686,
			{
				6,
				1
			}
		}
	},
	[17] = {
		name = "战斗伤害加成2",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，造成的伤害提高2%",
		benefit_effect = "502",
		id = 17,
		icon = "Props/buff_minigame_11",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			686,
			{
				6,
				2
			}
		}
	},
	[18] = {
		name = "战斗伤害加成3",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，造成的伤害提高3%",
		benefit_effect = "504",
		id = 18,
		icon = "Props/buff_minigame_11",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			686,
			{
				6,
				3
			}
		}
	},
	[19] = {
		name = "战术学院学习时间缩短1",
		hide = 0,
		max_time = 0,
		desc = "战术学院技能学习时间减少3%",
		benefit_effect = "300",
		id = 19,
		icon = "Props/buff_minigame_10",
		benefit_type = "skill_learncost_up",
		benefit_condition = {
			"activity",
			686,
			{
				7,
				1
			}
		}
	},
	[20] = {
		name = "战术学院学习时间缩短2",
		hide = 0,
		max_time = 0,
		desc = "战术学院技能学习时间减少4%",
		benefit_effect = "400",
		id = 20,
		icon = "Props/buff_minigame_10",
		benefit_type = "skill_learncost_up",
		benefit_condition = {
			"activity",
			686,
			{
				7,
				2
			}
		}
	},
	[21] = {
		name = "战术学院学习时间缩短3",
		hide = 0,
		max_time = 0,
		desc = "战术学院技能学习时间减少5%",
		benefit_effect = "500",
		id = 21,
		icon = "Props/buff_minigame_10",
		benefit_type = "skill_learncost_up",
		benefit_condition = {
			"activity",
			686,
			{
				7,
				3
			}
		}
	},
	[22] = {
		name = "后宅经验加成1",
		hide = 0,
		max_time = 0,
		desc = "后宅经验加成提高3%",
		benefit_effect = "3",
		id = 22,
		icon = "Props/buff_minigame_12",
		benefit_type = "dorm_exp",
		benefit_condition = {
			"activity",
			686,
			{
				8,
				1
			}
		}
	},
	[23] = {
		name = "后宅经验加成2",
		hide = 0,
		max_time = 0,
		desc = "后宅经验加成提高4%",
		benefit_effect = "4",
		id = 23,
		icon = "Props/buff_minigame_12",
		benefit_type = "dorm_exp",
		benefit_condition = {
			"activity",
			686,
			{
				8,
				2
			}
		}
	},
	[24] = {
		name = "后宅经验加成3",
		hide = 0,
		max_time = 0,
		desc = "后宅经验加成提高5%",
		benefit_effect = "5",
		id = 24,
		icon = "Props/buff_minigame_12",
		benefit_type = "dorm_exp",
		benefit_condition = {
			"activity",
			686,
			{
				8,
				3
			}
		}
	},
	[25] = {
		name = "活动关卡特装原型掉落加成",
		hide = 0,
		max_time = 0,
		benefit_condition = "",
		desc = "通过「蝶海梦花」活动关卡获得的特装原型数量翻倍",
		benefit_effect = "0",
		id = 25,
		icon = "Props/buff_urptup",
		benefit_type = "urpt_drop_up"
	},
	[26] = {
		name = "演唱力 ",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，造成的伤害提高1%",
		benefit_effect = "500",
		id = 26,
		icon = "Props/yanchangli1",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[27] = {
		name = "演唱力 ",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，造成的伤害提高2%",
		benefit_effect = "502",
		id = 27,
		icon = "Props/yanchangli2",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[28] = {
		name = "演唱力 ",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，造成的伤害提高3%",
		benefit_effect = "504",
		id = 28,
		icon = "Props/yanchangli3",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[29] = {
		name = "舞蹈力 ",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，受到的伤害减少1%",
		benefit_effect = "510",
		id = 29,
		icon = "Props/wudaoli1",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[30] = {
		name = "舞蹈力 ",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，受到的伤害减少2%",
		benefit_effect = "512",
		id = 30,
		icon = "Props/wudaoli2",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[31] = {
		name = "舞蹈力 ",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，受到的伤害减少3%",
		benefit_effect = "514",
		id = 31,
		icon = "Props/wudaoli3",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[32] = {
		name = "表演力 ",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，角色经验获取提高3%",
		benefit_effect = "3",
		id = 32,
		icon = "Props/biaoyanli1",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[33] = {
		name = "表演力 ",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，角色经验获取提高4%",
		benefit_effect = "4",
		id = 33,
		icon = "Props/biaoyanli2",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[34] = {
		name = "表演力 ",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，角色经验获取提高5%",
		benefit_effect = "5",
		id = 34,
		icon = "Props/biaoyanli3",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[35] = {
		name = "<color=#ff5c5c>力量</color>LV.1：",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，造成的伤害提高1%",
		benefit_effect = "500",
		id = 35,
		icon = "Props/yanchangli1",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			779,
			0
		}
	},
	[36] = {
		name = "<color=#ff5c5c>力量</color>LV.2：",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，造成的伤害提高2%",
		benefit_effect = "502",
		id = 36,
		icon = "Props/yanchangli2",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			779,
			0
		}
	},
	[37] = {
		name = "<color=#ff5c5c>力量</color>MAX：",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，造成的伤害提高3%",
		benefit_effect = "504",
		id = 37,
		icon = "Props/yanchangli3",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			779,
			0
		}
	},
	[38] = {
		name = "<color=#00BFFF>技巧</color>LV.1：",
		hide = 0,
		max_time = 0,
		desc = "战术学院技能学习时间减少3%",
		benefit_effect = "300",
		id = 38,
		icon = "Props/buff_minigame_10",
		benefit_type = "skill_learncost_up",
		benefit_condition = {
			"activity",
			779,
			0
		}
	},
	[39] = {
		name = "<color=#00BFFF>技巧</color>LV.2：",
		hide = 0,
		max_time = 0,
		desc = "战术学院技能学习时间减少4%",
		benefit_effect = "400",
		id = 39,
		icon = "Props/buff_minigame_10",
		benefit_type = "skill_learncost_up",
		benefit_condition = {
			"activity",
			779,
			0
		}
	},
	[40] = {
		name = "<color=#00BFFF>技巧</color>MAX：",
		hide = 0,
		max_time = 0,
		desc = "战术学院技能学习时间减少5%",
		benefit_effect = "500",
		id = 40,
		icon = "Props/buff_minigame_10",
		benefit_type = "skill_learncost_up",
		benefit_condition = {
			"activity",
			779,
			0
		}
	},
	[41] = {
		name = "<color=#ffde38>体力</color>LV.1：",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，角色经验获取提高3%",
		benefit_effect = "3",
		id = 41,
		icon = "Props/biaoyanli1",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			779,
			0
		}
	},
	[42] = {
		name = "<color=#ffde38>体力</color>LV.2：",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，角色经验获取提高4%",
		benefit_effect = "4",
		id = 42,
		icon = "Props/biaoyanli2",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			779,
			0
		}
	},
	[43] = {
		name = "<color=#ffde38>体力</color>MAX：",
		hide = 0,
		max_time = 0,
		desc = "主线、困难、活动、作战档案关卡中，角色经验获取提高5%",
		benefit_effect = "5",
		id = 43,
		icon = "Props/biaoyanli3",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			779,
			0
		}
	},
	[44] = {
		name = "<color=#FF69B4>魅力</color>LV.1：",
		hide = 0,
		max_time = 0,
		desc = "后宅经验加成提高3%",
		benefit_effect = "3",
		id = 44,
		icon = "Props/buff_minigame_12",
		benefit_type = "dorm_exp",
		benefit_condition = {
			"activity",
			779,
			0
		}
	},
	[45] = {
		name = "<color=#FF69B4>魅力</color>LV.2：",
		hide = 0,
		max_time = 0,
		desc = "后宅经验加成提高4%",
		benefit_effect = "4",
		id = 45,
		icon = "Props/buff_minigame_12",
		benefit_type = "dorm_exp",
		benefit_condition = {
			"activity",
			779,
			0
		}
	},
	[46] = {
		name = "<color=#FF69B4>魅力</color>MAX：",
		hide = 0,
		max_time = 0,
		desc = "后宅经验加成提高5%",
		benefit_effect = "5",
		id = 46,
		icon = "Props/buff_minigame_12",
		benefit_type = "dorm_exp",
		benefit_condition = {
			"activity",
			779,
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
		34,
		35,
		36,
		37,
		38,
		39,
		40,
		41,
		42,
		43,
		44,
		45,
		46
	}
}
