pg = pg or {}
pg.ship_meta_breakout = {
	[9702011] = {
		breakout_view = "【炬火の力-ヘレナ】習得/主砲補正+5%",
		item2 = 21001,
		pre_id = 0,
		repair = 0,
		gold = 1000,
		breakout_id = 9702012,
		item1_num = 1,
		item2_num = 0,
		id = 9702011,
		item1 = 21003,
		level = 10,
		weapon_ids = {
			79731
		}
	},
	[9702012] = {
		breakout_view = "主砲砲座+1/主砲補正+10%",
		item2 = 21001,
		pre_id = 9702011,
		repair = 0,
		gold = 3000,
		breakout_id = 9702013,
		item1_num = 1,
		item2_num = 0,
		id = 9702012,
		item1 = 21003,
		level = 30,
		weapon_ids = {
			12100,
			12100
		}
	},
	[9702013] = {
		breakout_view = "【炬火の力-ヘレナ】強化/主砲補正+15%",
		item2 = 21001,
		pre_id = 9702012,
		repair = 0,
		gold = 10000,
		breakout_id = 9702014,
		item1_num = 2,
		item2_num = 0,
		id = 9702013,
		item1 = 21003,
		level = 70,
		weapon_ids = {
			79732
		}
	},
	[9702014] = {
		breakout_view = "なし",
		item2 = 21001,
		pre_id = 9702013,
		repair = 0,
		gold = 0,
		breakout_id = 0,
		item1_num = 0,
		item2_num = 0,
		id = 9702014,
		item1 = 21003,
		level = 0,
		weapon_ids = {}
	},
	[9707011] = {
		breakout_view = "【炬火の力-飛龍】習得/攻撃機数+1/攻撃機補正+5%",
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
		breakout_view = "【炬火の力-飛龍】強化/艦載機数+1/攻撃機補正+15%",
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
	[9707021] = {
		breakout_view = "【炬火の力-アーク・ロイヤル】習得/攻撃機数＋1/攻撃機補正+3%",
		item2 = 21002,
		pre_id = 0,
		repair = 0,
		gold = 1000,
		breakout_id = 9707022,
		item1_num = 1,
		item2_num = 0,
		id = 9707021,
		item1 = 21002,
		level = 10,
		weapon_ids = {
			60101,
			54014
		}
	},
	[9707022] = {
		breakout_view = "攻撃隊上限+1/爆撃機+1/攻撃機補正+5% ",
		item2 = 21002,
		pre_id = 9707021,
		repair = 0,
		gold = 3000,
		breakout_id = 9707023,
		item1_num = 1,
		item2_num = 0,
		id = 9707022,
		item1 = 21002,
		level = 30,
		weapon_ids = {
			60102,
			54014,
			60102,
			54014
		}
	},
	[9707023] = {
		breakout_view = "【炬火の力-アーク・ロイヤル】強化/攻撃機数＋1/攻撃機補正+7% ",
		item2 = 21002,
		pre_id = 9707022,
		repair = 0,
		gold = 10000,
		breakout_id = 9707024,
		item1_num = 2,
		item2_num = 0,
		id = 9707023,
		item1 = 21002,
		level = 70,
		weapon_ids = {
			60103,
			54015,
			60103,
			54015
		}
	},
	[9707024] = {
		breakout_view = "なし",
		item2 = 21002,
		pre_id = 9707023,
		repair = 0,
		gold = 0,
		breakout_id = 0,
		item1_num = 0,
		item2_num = 0,
		id = 9707024,
		item1 = 21002,
		level = 0,
		weapon_ids = {}
	},
	all = {
		9702011,
		9702012,
		9702013,
		9702014,
		9707011,
		9707012,
		9707013,
		9707014,
		9707021,
		9707022,
		9707023,
		9707024
	}
}
