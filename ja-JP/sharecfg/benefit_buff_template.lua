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
		benefit_effect = "504",
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
			686,
			{
				5,
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
			686,
			{
				5,
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
			686,
			{
				5,
				3
			}
		}
	},
	[16] = {
		max_time = 0,
		name = "战斗伤害加成1",
		icon = "Props/buff_minigame_11",
		benefit_effect = "500",
		id = 16,
		benefit_type = "battle_buff",
		desc = "メイン海域・イベント海域で与えるダメージ+1%",
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
		max_time = 0,
		name = "战斗伤害加成2",
		icon = "Props/buff_minigame_11",
		benefit_effect = "502",
		id = 17,
		benefit_type = "battle_buff",
		desc = "メイン海域・イベント海域で与えるダメージ+2%",
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
		max_time = 0,
		name = "战斗伤害加成3",
		icon = "Props/buff_minigame_11",
		benefit_effect = "504",
		id = 18,
		benefit_type = "battle_buff",
		desc = "メイン海域・イベント海域で与えるダメージ+3%",
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
		max_time = 0,
		name = "战术学院学习时间缩短1",
		icon = "Props/buff_minigame_10",
		benefit_effect = "300",
		id = 19,
		benefit_type = "skill_learncost_up",
		desc = "戦術教室でスキルを強化する場合、所要時間-3%",
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
		max_time = 0,
		name = "战术学院学习时间缩短2",
		icon = "Props/buff_minigame_10",
		benefit_effect = "400",
		id = 20,
		benefit_type = "skill_learncost_up",
		desc = "戦術教室でスキルを強化する場合、所要時間-4%",
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
		max_time = 0,
		name = "战术学院学习时间缩短3",
		icon = "Props/buff_minigame_10",
		benefit_effect = "500",
		id = 21,
		benefit_type = "skill_learncost_up",
		desc = "戦術教室でスキルを強化する場合、所要時間-5%",
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
		max_time = 0,
		name = "后宅经验加成1",
		icon = "Props/buff_minigame_12",
		benefit_effect = "3",
		id = 22,
		benefit_type = "dorm_exp",
		desc = "寮舎経験値入手＋3％",
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
		max_time = 0,
		name = "后宅经验加成2",
		icon = "Props/buff_minigame_12",
		benefit_effect = "4",
		id = 23,
		benefit_type = "dorm_exp",
		desc = "寮舎経験値入手＋4％",
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
		max_time = 0,
		name = "后宅经验加成3",
		icon = "Props/buff_minigame_12",
		benefit_effect = "5",
		id = 24,
		benefit_type = "dorm_exp",
		desc = "寮舎経験値入手＋5％",
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
		max_time = 0,
		name = "活动关卡特装原型掉落加成",
		icon = "Props/buff_urptup",
		benefit_effect = "0",
		id = 25,
		benefit_condition = "",
		benefit_type = "urpt_drop_up",
		desc = "「刹那觀る胡蝶の夢」イベントステージにて入手できる「特装コア（ブリ集め）」は2倍になります"
	},
	[26] = {
		max_time = 0,
		name = "アピールVocal",
		icon = "Props/yanchangli1",
		benefit_effect = "500",
		id = 26,
		benefit_type = "battle_buff",
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵に与えるダメージが1%アップ",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[27] = {
		max_time = 0,
		name = "アピールVocal",
		icon = "Props/yanchangli2",
		benefit_effect = "502",
		id = 27,
		benefit_type = "battle_buff",
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵に与えるダメージが2%アップ",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[28] = {
		max_time = 0,
		name = "アピールVocal",
		icon = "Props/yanchangli3",
		benefit_effect = "504",
		id = 28,
		benefit_type = "battle_buff",
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵に与えるダメージが3%アップ",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[29] = {
		max_time = 0,
		name = "エンゲージDance",
		icon = "Props/wudaoli1",
		benefit_effect = "510",
		id = 29,
		benefit_type = "battle_buff",
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵から受けるダメージが1%ダウン",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[30] = {
		max_time = 0,
		name = "エンゲージDance",
		icon = "Props/wudaoli2",
		benefit_effect = "512",
		id = 30,
		benefit_type = "battle_buff",
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵から受けるダメージが2%ダウン",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[31] = {
		max_time = 0,
		name = "エンゲージDance",
		icon = "Props/wudaoli3",
		benefit_effect = "514",
		id = 31,
		benefit_type = "battle_buff",
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵から受けるダメージが3%ダウン",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[32] = {
		max_time = 0,
		name = "メモリーPerformance",
		icon = "Props/biaoyanli1",
		benefit_effect = "3",
		id = 32,
		benefit_type = "ship_battle_exp",
		desc = "メイン・ハード・イベント・作戦履歴海域における艦船が得られる経験値が3%アップ",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[33] = {
		max_time = 0,
		name = "メモリーPerformance",
		icon = "Props/biaoyanli2",
		benefit_effect = "4",
		id = 33,
		benefit_type = "ship_battle_exp",
		desc = "メイン・ハード・イベント・作戦履歴海域における艦船が得られる経験値が4%アップ",
		benefit_condition = {
			"activity",
			753,
			0
		}
	},
	[34] = {
		max_time = 0,
		name = "メモリーPerformance",
		icon = "Props/biaoyanli3",
		benefit_effect = "5",
		id = 34,
		benefit_type = "ship_battle_exp",
		desc = "メイン・ハード・イベント・作戦履歴海域における艦船が得られる経験値が5%アップ",
		benefit_condition = {
			"activity",
			753,
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
