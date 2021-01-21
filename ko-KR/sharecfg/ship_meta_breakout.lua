pg = pg or {}
pg.ship_meta_breakout = {
	[9707011] = {
		breakout_view = "스킬 [격침의 횃불] 습득/모든 뇌격기+1/뇌격기 효율 5% 상승",
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
		breakout_view = "격납고 용량 +1/모든 전투기 +1/뇌격기 효율 10% 상승",
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
		breakout_view = "[격침의 횃불] 승급/모든 함재기 +1/뇌격기 효율 15% 상승",
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
		breakout_view = "없음",
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
