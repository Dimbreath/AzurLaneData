pg = pg or {}
pg.ship_meta_breakout = {
	[9707011] = {
		breakout_view = "【炬火の力・飛龍】習得/攻撃機数+1/攻撃機補正+5%",
		item2 = 21001,
		pre_id = 0,
		repair = 0,
		gold = 1000,
		breakout_id = 9707012,
		item1_num = 1,
		item2_num = 0,
		id = 9707011,
		item1 = 21001,
		level = 10,
		weapon_ids = {
			60161,
			54014
		}
	},
	[9707012] = {
		breakout_view = "攻撃隊上限+1/戦闘機数+1/攻撃機補正+10%",
		item2 = 21001,
		pre_id = 9707011,
		repair = 0,
		gold = 3000,
		breakout_id = 9707013,
		item1_num = 1,
		item2_num = 0,
		id = 9707012,
		item1 = 21001,
		level = 30,
		weapon_ids = {
			60162,
			54014,
			60162,
			54014
		}
	},
	[9707013] = {
		breakout_view = "【炬火の力・飛龍】強化/艦載機数+1/攻撃機補正+15%",
		item2 = 21001,
		pre_id = 9707012,
		repair = 0,
		gold = 10000,
		breakout_id = 9707014,
		item1_num = 2,
		item2_num = 0,
		id = 9707013,
		item1 = 21001,
		level = 70,
		weapon_ids = {
			60163,
			54015,
			60163,
			54015
		}
	},
	[9707014] = {
		breakout_view = "なし",
		item2 = 21001,
		pre_id = 9707013,
		repair = 0,
		gold = 0,
		breakout_id = 0,
		item1_num = 0,
		item2_num = 0,
		id = 9707014,
		item1 = 21001,
		level = 0,
		weapon_ids = {}
	},
	all = {
		9707011,
		9707012,
		9707013,
		9707014
	}
}
