pg = pg or {}
pg.benefit_buff_template = {
	{
		max_time = 86400,
		name = "",
		icon = "Props/zongzi",
		benefit_effect = "5",
		id = 1,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "寮舎経験値5％UP"
	},
	{
		max_time = 86400,
		name = "",
		icon = "Props/huangjialiaoli",
		benefit_effect = "10",
		id = 2,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "寮舎経験値10％UP"
	},
	{
		max_time = 86400,
		name = "",
		icon = "Props/manhanquanxi",
		benefit_effect = "20",
		id = 3,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "寮舎経験値20％UP"
	},
	{
		max_time = 0,
		name = "経験値強化",
		icon = "Props/xinshou",
		benefit_effect = "100",
		id = 4,
		benefit_type = "rookie_battle_exp",
		desc = "指揮官Lvが30以下の場合、通常海域のノーマルモード・ハードモード、デイリーチャレンジで入手する指揮官と艦の経験値が100%アップ",
		benefit_condition = {
			"lv",
			"<",
			30
		}
	},
	[10] = {
		max_time = 86400,
		name = "学業祈願",
		icon = "Props/buff_minigame_10",
		benefit_effect = "300",
		id = 10,
		benefit_condition = "",
		benefit_type = "skill_learncost_up",
		desc = "戦術教室でスキルを新たに強化する場合、所要時間が少し短縮\n残り時間:$1"
	},
	[11] = {
		max_time = 86400,
		name = "開運招福",
		icon = "Props/buff_minigame_11",
		benefit_effect = "500",
		id = 11,
		benefit_condition = "",
		benefit_type = "battle_buff",
		desc = "メイン海域及び作戦履歴海域戦闘時、味方が与えるダメージが微増\n残り時間:$1"
	},
	[12] = {
		max_time = 86400,
		name = "良縁祈願",
		icon = "Props/buff_minigame_12",
		benefit_effect = "1",
		id = 12,
		benefit_condition = "",
		benefit_type = "intimacy_up_extra",
		desc = "秘書艦の親密度上昇スピードがアップ\n残り時間:$1"
	},
	[13] = {
		max_time = 0,
		name = "舰娘经验加成1",
		icon = "Props/xinshou",
		benefit_effect = "3",
		id = 13,
		benefit_type = "ship_battle_exp",
		desc = "メイン海域・イベント海域における経験値入手+3%",
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
		desc = "メイン海域・イベント海域における経験値入手+4%",
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
		desc = "メイン海域・イベント海域における経験値入手+5%",
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
		desc = "メイン海域・イベント海域で与えるダメージ+1%",
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
		desc = "メイン海域・イベント海域で与えるダメージ+2%",
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
		desc = "メイン海域・イベント海域で与えるダメージ+3%",
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
		desc = "戦術教室でスキルを強化する場合、所要時間-3%",
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
		desc = "戦術教室でスキルを強化する場合、所要時間-4%",
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
		desc = "戦術教室でスキルを強化する場合、所要時間-5%",
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
		desc = "寮舎経験値入手＋3％",
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
		desc = "寮舎経験値入手＋4％",
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
		desc = "寮舎経験値入手＋5％",
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
