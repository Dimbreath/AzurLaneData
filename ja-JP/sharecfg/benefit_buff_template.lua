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
		desc = "指揮官Lvが40以下の場合、通常海域のノーマルモード・ハードモード、デイリーチャレンジで入手する指揮官と艦の経験値が100%アップ",
		benefit_condition = {
			"lv",
			"<",
			40
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
