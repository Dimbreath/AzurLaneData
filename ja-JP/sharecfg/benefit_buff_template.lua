pg = pg or {}
pg.benefit_buff_template = {
	{
		name = "",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "寮舎経験値5％UP",
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
		desc = "寮舎経験値10％UP",
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
		desc = "寮舎経験値20％UP",
		benefit_effect = "20",
		id = 3,
		icon = "Props/manhanquanxi",
		benefit_type = "dorm_exp"
	},
	{
		name = "経験値強化",
		hide = 0,
		max_time = 0,
		desc = "指揮官Lvが30以下の場合、通常海域のノーマルモード・ハードモード、デイリーチャレンジで入手する指揮官と艦の経験値が100%アップ",
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
		name = "学業祈願",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "戦術教室でスキルを新たに強化する場合、所要時間が少し短縮\n残り時間:$1",
		benefit_effect = "300",
		id = 10,
		icon = "Props/buff_minigame_10",
		benefit_type = "skill_learncost_up"
	},
	[11] = {
		name = "開運招福",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "メイン海域及び作戦履歴海域戦闘時、味方が与えるダメージが微増\n残り時間:$1",
		benefit_effect = "504",
		id = 11,
		icon = "Props/buff_minigame_11",
		benefit_type = "battle_buff"
	},
	[12] = {
		name = "良縁祈願",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "秘書艦の親密度上昇スピードがアップ\n残り時間:$1",
		benefit_effect = "1",
		id = 12,
		icon = "Props/buff_minigame_12",
		benefit_type = "intimacy_up_extra"
	},
	[13] = {
		name = "舰娘经验加成1",
		hide = 0,
		max_time = 0,
		desc = "メイン海域・イベント海域における経験値入手+3%",
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
		desc = "メイン海域・イベント海域における経験値入手+4%",
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
		desc = "メイン海域・イベント海域における経験値入手+5%",
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
		desc = "メイン海域・イベント海域で与えるダメージ+1%",
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
		desc = "メイン海域・イベント海域で与えるダメージ+2%",
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
		desc = "メイン海域・イベント海域で与えるダメージ+3%",
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
		desc = "戦術教室でスキルを強化する場合、所要時間-3%",
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
		desc = "戦術教室でスキルを強化する場合、所要時間-4%",
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
		desc = "戦術教室でスキルを強化する場合、所要時間-5%",
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
		desc = "寮舎経験値入手＋3％",
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
		desc = "寮舎経験値入手＋4％",
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
		desc = "寮舎経験値入手＋5％",
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
		desc = "「刹那觀る胡蝶の夢」イベントステージにて入手できる「特装コア（ブリ集め）」は2倍になります",
		benefit_effect = "0",
		id = 25,
		icon = "Props/buff_urptup",
		benefit_type = "urpt_drop_up"
	},
	[26] = {
		name = "アピールVocal",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵に与えるダメージが1%アップ",
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
		name = "アピールVocal",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵に与えるダメージが2%アップ",
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
		name = "アピールVocal",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵に与えるダメージが3%アップ",
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
		name = "エンゲージDance",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵から受けるダメージが1%ダウン",
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
		name = "エンゲージDance",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵から受けるダメージが2%ダウン",
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
		name = "エンゲージDance",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵から受けるダメージが3%ダウン",
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
		name = "メモリーPerformance",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における艦船が得られる経験値が3%アップ",
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
		name = "メモリーPerformance",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における艦船が得られる経験値が4%アップ",
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
		name = "メモリーPerformance",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における艦船が得られる経験値が5%アップ",
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
		name = "<color=#ff5c5c>POW</color>LV.1：",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵に与えるダメージが1%アップ",
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
		name = "<color=#ff5c5c>POW</color>LV.2：",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵に与えるダメージが2%アップ",
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
		name = "<color=#ff5c5c>POW</color>MAX：",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における味方艦隊が敵に与えるダメージが3%アップ",
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
		name = "<color=#00BFFF>TEC</color>LV.1：",
		hide = 0,
		max_time = 0,
		desc = "戦術教室でスキルを強化する場合、所要時間-3%",
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
		name = "<color=#00BFFF>TEC</color>LV.2：",
		hide = 0,
		max_time = 0,
		desc = "戦術教室でスキルを強化する場合、所要時間-4%",
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
		name = "<color=#00BFFF>TEC</color>MAX：",
		hide = 0,
		max_time = 0,
		desc = "戦術教室でスキルを強化する場合、所要時間-5%",
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
		name = "<color=#ffde38>STM</color>LV.1：",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における艦船が得られる経験値が3%アップ",
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
		name = "<color=#ffde38>STM</color>LV.2：",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における艦船が得られる経験値が4%アップ",
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
		name = "<color=#ffde38>STM</color>MAX：",
		hide = 0,
		max_time = 0,
		desc = "メイン・ハード・イベント・作戦履歴海域における艦船が得られる経験値が5%アップ",
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
		name = "<color=#FF69B4>APL</color>LV.1：",
		hide = 0,
		max_time = 0,
		desc = "寮舎経験値入手＋3％",
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
		name = "<color=#FF69B4>APL</color>LV.2：",
		hide = 0,
		max_time = 0,
		desc = "寮舎経験値入手＋4％",
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
		name = "<color=#FF69B4>APL</color>MAX：",
		hide = 0,
		max_time = 0,
		desc = "寮舎経験値入手＋5％",
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
