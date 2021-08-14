pg = pg or {}
pg.weapon_property_328 = {}

function ()
	uv0.weapon_property_328[743003] = {
		aim_type = 1,
		range = 120,
		damage = 24,
		base = 1000,
		name = "【DOA联动SP4】精英人形霞 大范围主炮",
		fire_fx = "CAFire",
		suppress = 1,
		reload_max = 1500,
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 743003,
		bullet_ID = {
			800003,
			800004,
			800002,
			800002,
			800002
		},
		barrage_ID = {
			730088,
			730089,
			730090,
			730091,
			730092
		}
	}
	uv0.weapon_property_328[743004] = {
		aim_type = 0,
		name = "【DOA联动SP4】精英人形霞 鱼雷弹幕",
		damage = 40,
		base = 1001,
		initial_over_heat = 1,
		reload_max = 1200,
		queue = 1,
		id = 743004,
		bullet_ID = {
			1801,
			1801,
			1801
		},
		barrage_ID = {
			810004,
			810005,
			810006
		}
	}
	uv0.weapon_property_328[743005] = {
		initial_over_heat = 1,
		suppress = 1,
		type = 19,
		name = "【DOA联动SP4】精英人形凪咲 前排跨射",
		fire_fx = "CAFire",
		action_index = "",
		aim_type = 1,
		reload_max = 1800,
		queue = 1,
		range = 75,
		damage = 28,
		base = 1000,
		fire_sfx = "battle/cannon-main",
		id = 743005,
		bullet_ID = {
			800005
		},
		barrage_ID = {
			399912
		},
		precast_param = {
			time = 1,
			fx = "jinengenemy",
			alertTime = 2
		}
	}
	uv0.weapon_property_328[743006] = {
		range = 120,
		name = "【DOA联动SP4】精英人形凪咲 主炮弹幕",
		damage = 32,
		base = 1000,
		fire_fx = "CAFire",
		reload_max = 1500,
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 743006,
		bullet_ID = {
			20003,
			20003
		},
		barrage_ID = {
			950195,
			950196
		}
	}
	uv0.weapon_property_328[743101] = {
		aim_type = 1,
		range = 38,
		damage = 8,
		base = 1000,
		name = "【DOA联动SP4】BOSS 通用近程自卫火炮",
		type = 2,
		suppress = 1,
		reload_max = 500,
		action_index = "",
		queue = 5,
		id = 743101,
		bullet_ID = {
			999
		},
		barrage_ID = {
			13
		}
	}
	uv0.weapon_property_328[743102] = {
		aim_type = 1,
		range = 120,
		damage = 18,
		base = 1000,
		name = "【DOA联动SP4】BOSS 女天狗 变向弹幕",
		suppress = 1,
		reload_max = 800,
		fire_sfx = "",
		queue = 2,
		id = 743102,
		bullet_ID = {
			770022,
			770023
		},
		barrage_ID = {
			990241,
			990242
		}
	}
	uv0.weapon_property_328[743103] = {
		aim_type = 1,
		range = 120,
		damage = 18,
		base = 1000,
		name = "【DOA联动SP4】BOSS 女天狗 变向弹幕",
		suppress = 1,
		reload_max = 800,
		fire_sfx = "",
		queue = 3,
		id = 743103,
		bullet_ID = {
			770020,
			770021
		},
		barrage_ID = {
			990001,
			990002
		}
	}
	uv0.weapon_property_328[743104] = {
		range = 80,
		damage = 32,
		base = 1001,
		type = 11,
		fire_fx = "zhupao",
		suppress = 1,
		spawn_bound = "plane",
		reload_max = 700,
		name = "【DOA联动SP4】BOSS 女天狗 舰载战斗机",
		fire_sfx = "battle/air-atk",
		queue = 1,
		id = 743104,
		action_index = "",
		attack_attribute = 4,
		bullet_ID = {
			30013
		},
		barrage_ID = {
			12015
		}
	}
	uv0.weapon_property_328[743105] = {
		range = 110,
		damage = 46,
		base = 1001,
		type = 11,
		name = "【DOA联动SP4】BOSS 女天狗 舰载鱼雷机",
		suppress = 1,
		spawn_bound = "plane",
		reload_max = 700,
		action_index = "",
		attack_attribute = 4,
		queue = 1,
		id = 743105,
		bullet_ID = {
			30014
		},
		barrage_ID = {
			12015
		}
	}
	uv0.weapon_property_328[743106] = {
		range = 100,
		damage = 58,
		base = 1001,
		type = 11,
		name = "【DOA联动SP4】BOSS 女天狗 舰载轰炸机",
		suppress = 1,
		spawn_bound = "plane",
		reload_max = 700,
		action_index = "",
		attack_attribute = 4,
		queue = 1,
		id = 743106,
		bullet_ID = {
			30019
		},
		barrage_ID = {
			12015
		}
	}
	uv0.weapon_property_328[743107] = {
		action_index = "",
		range = 85,
		type = 1,
		fire_fx = "fangkongpaohuoshe2",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动SP4】BOSS 女天狗 舰载战斗机武器 弹幕",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 180,
		charge_param = "",
		damage = 32,
		corrected = 100,
		min_range = 0,
		id = 743107,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 1650,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "cannon",
		fire_sfx = "battle/air-atk",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			20001,
			20001,
			20001,
			20001
		},
		barrage_ID = {
			101,
			102,
			103,
			104
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[743108] = {
		action_index = "",
		range = 200,
		type = 4,
		fire_fx = "fangkongpaohuoshe2",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动SP4】BOSS 女天狗 舰载战斗机武器 对空",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 180,
		charge_param = "",
		damage = 32,
		corrected = 100,
		min_range = 0,
		id = 743108,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 48,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "antiaircraft",
		fire_sfx = "battle/air-atk",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			10004
		},
		barrage_ID = {
			5
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[743109] = {
		action_index = "",
		range = 60,
		type = 3,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动SP4】BOSS 女天狗 舰载鱼雷机武器",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 35,
		charge_param = "",
		damage = 46,
		corrected = 100,
		min_range = 15,
		id = 743109,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 8000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "torpedo",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			10031
		},
		barrage_ID = {
			12001
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[743110] = {
		action_index = "",
		range = 10,
		type = 2,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动SP4】BOSS 女天狗 舰载轰炸机武器",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 180,
		charge_param = "",
		damage = 58,
		corrected = 100,
		min_range = 0,
		id = 743110,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			130301
		},
		barrage_ID = {
			130992
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[743113] = {
		range = 120,
		damage = 18,
		base = 1000,
		name = "【DOA联动SP4】BOSS 女天狗 fever 黑色羽毛反弹封锁弹",
		type = 2,
		reload_max = 1200,
		fire_sfx = "",
		queue = 1,
		id = 743113,
		bullet_ID = {
			800042,
			800043,
			800042,
			800043,
			800045,
			800046,
			800045,
			800046
		},
		barrage_ID = {
			810088,
			810089,
			810090,
			810091,
			810094,
			810095,
			810096,
			810097
		}
	}
	uv0.weapon_property_328[743114] = {
		aim_type = 1,
		range = 120,
		damage = 22,
		base = 1000,
		name = "【DOA联动SP4】BOSS 女天狗 fever 缓慢紫色子弹",
		type = 2,
		suppress = 1,
		reload_max = 600,
		initial_over_heat = 1,
		queue = 2,
		id = 743114,
		bullet_ID = {
			800049
		},
		barrage_ID = {
			810098
		}
	}
	uv0.weapon_property_328[743115] = {
		range = 120,
		name = "【DOA联动SP4】BOSS 女天狗 fever 变形红色自机狙",
		damage = 18,
		base = 1000,
		reload_max = 6000,
		queue = 2,
		id = 743115,
		bullet_ID = {
			780074,
			780075
		},
		barrage_ID = {
			810099,
			810100
		}
	}
	uv0.weapon_property_328[743116] = {
		action_index = "",
		range = 90,
		type = 11,
		fire_fx = "",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动SP4】BOSS 女天狗 fever 轰炸机",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 90,
		charge_param = "",
		damage = 68,
		corrected = 100,
		min_range = 0,
		id = 743116,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 0,
		reload_max = 400,
		queue = 3,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "battle/cannon-main",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			340141
		},
		barrage_ID = {
			12008
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[743117] = {
		action_index = "",
		range = 1,
		type = 2,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动SP4】BOSS 女天狗 fever 轰炸机武器",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 25,
		charge_param = "",
		damage = 68,
		corrected = 100,
		min_range = 0,
		id = 743117,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 9500,
		queue = 4,
		search_type = 2,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			800050,
			800051,
			800052,
			800053,
			800054,
			800055
		},
		barrage_ID = {
			130991,
			130991,
			130991,
			130991,
			130991,
			130991
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[744001] = {
		aim_type = 1,
		range = 120,
		damage = 24,
		base = 1000,
		name = "【DOA联动VSP】精英人形霞 大范围主炮",
		fire_fx = "CAFire",
		suppress = 1,
		reload_max = 1500,
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 744001,
		bullet_ID = {
			800003,
			800004,
			800002,
			800002,
			800002
		},
		barrage_ID = {
			730088,
			730089,
			730090,
			730091,
			730092
		}
	}
	uv0.weapon_property_328[744002] = {
		aim_type = 0,
		name = "【DOA联动VSP】精英人形霞 鱼雷弹幕",
		damage = 26,
		base = 1001,
		initial_over_heat = 1,
		reload_max = 1200,
		queue = 1,
		id = 744002,
		bullet_ID = {
			1801,
			1801,
			1801
		},
		barrage_ID = {
			810004,
			810005,
			810006
		}
	}
	uv0.weapon_property_328[744003] = {
		initial_over_heat = 1,
		suppress = 1,
		type = 19,
		name = "【DOA联动VSP】精英人形凪咲 前排跨射",
		fire_fx = "CAFire",
		action_index = "",
		aim_type = 1,
		reload_max = 1800,
		queue = 1,
		range = 75,
		damage = 30,
		base = 1000,
		fire_sfx = "battle/cannon-main",
		id = 744003,
		bullet_ID = {
			800005
		},
		barrage_ID = {
			399912
		},
		precast_param = {
			time = 1,
			fx = "jinengenemy",
			alertTime = 2
		}
	}
	uv0.weapon_property_328[744004] = {
		range = 120,
		name = "【DOA联动VSP】精英人形凪咲 主炮弹幕",
		damage = 34,
		base = 1000,
		fire_fx = "CAFire",
		reload_max = 1200,
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 744004,
		bullet_ID = {
			20003,
			20003
		},
		barrage_ID = {
			950195,
			950196
		}
	}
	uv0.weapon_property_328[744005] = {
		aim_type = 1,
		range = 120,
		damage = 21,
		base = 1000,
		name = "【DOA联动VSP】精英人形女天狗 变向弹幕",
		suppress = 1,
		reload_max = 1200,
		fire_sfx = "",
		queue = 2,
		id = 744005,
		bullet_ID = {
			770022,
			770023
		},
		barrage_ID = {
			990241,
			990242
		}
	}
	uv0.weapon_property_328[744006] = {
		aim_type = 1,
		range = 120,
		damage = 21,
		base = 1000,
		name = "【DOA联动VSP】精英人形女天狗 变向弹幕",
		suppress = 1,
		reload_max = 1200,
		fire_sfx = "",
		queue = 3,
		id = 744006,
		bullet_ID = {
			770020,
			770021
		},
		barrage_ID = {
			990001,
			990002
		}
	}
	uv0.weapon_property_328[744101] = {
		aim_type = 1,
		range = 38,
		base = 1000,
		name = "【DOA联动VSP】BOSS 莫妮卡 近程自卫火炮",
		type = 2,
		suppress = 1,
		action_index = "",
		reload_max = 500,
		queue = 5,
		id = 744101,
		bullet_ID = {
			999
		},
		barrage_ID = {
			13
		}
	}
	uv0.weapon_property_328[744102] = {
		range = 120,
		damage = 12,
		base = 1000,
		name = "【DOA联动VSP】BOSS 莫妮卡 fever 四方向子母弹 第二波",
		type = 2,
		reload_max = 6000,
		queue = 1,
		id = 744102,
		bullet_ID = {
			800060
		},
		barrage_ID = {
			810106
		}
	}
	uv0.weapon_property_328[744103] = {
		range = 120,
		damage = 12,
		base = 1000,
		name = "【DOA联动VSP】BOSS 莫妮卡 fever 旋转发射弹幕 第二波",
		type = 2,
		reload_max = 6000,
		queue = 2,
		id = 744103,
		bullet_ID = {
			800061
		},
		barrage_ID = {
			810106
		}
	}
	uv0.weapon_property_328[744104] = {
		aim_type = 1,
		range = 120,
		damage = 12,
		base = 1000,
		name = "【DOA联动VSP】BOSS 莫妮卡 fever 红色自机狙 第二波",
		type = 2,
		suppress = 1,
		reload_max = 6000,
		queue = 3,
		id = 744104,
		bullet_ID = {
			800063,
			800064,
			800065,
			800066,
			800067,
			800068,
			800069
		},
		barrage_ID = {
			810111,
			810111,
			810111,
			810111,
			810111,
			810111,
			810111
		}
	}
	uv0.weapon_property_328[744105] = {
		name = "【DOA联动VSP】BOSS 莫妮卡 fever 扫射纸牌弹幕 第一波",
		damage = 20,
		base = 1000,
		fire_fx = "CAFire",
		reload_max = 6000,
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 744105,
		bullet_ID = {
			800070,
			800070,
			800070,
			800070,
			800070,
			800071,
			800071,
			800071,
			800071,
			800071
		},
		barrage_ID = {
			690134,
			690135,
			690136,
			690137,
			690138,
			690134,
			690135,
			690136,
			690137,
			690138
		}
	}
	uv0.weapon_property_328[744106] = {
		aim_type = 1,
		range = 120,
		damage = 20,
		base = 1000,
		name = "【DOA联动VSP】BOSS 莫妮卡 纸牌弹幕",
		suppress = 1,
		initial_over_heat = 1,
		reload_max = 600,
		queue = 1,
		id = 744106,
		bullet_ID = {
			800041
		},
		barrage_ID = {
			810085
		}
	}
	uv0.weapon_property_328[744107] = {
		aim_type = 0,
		damage = 58,
		base = 1001,
		name = "【DOA联动VSP】BOSS 莫妮卡 鱼雷弹幕",
		action_index = "",
		suppress = 1,
		reload_max = 600,
		fire_sfx = "battle/cannon-main",
		queue = 3,
		id = 744107,
		bullet_ID = {
			140005,
			140006,
			140007,
			140008
		},
		barrage_ID = {
			140005,
			140006,
			140007,
			140008
		}
	}
	uv0.weapon_property_328[744108] = {
		aim_type = 1,
		range = 120,
		damage = 16,
		base = 1000,
		name = "【DOA联动VSP】BOSS 莫妮卡 广域射击",
		type = 2,
		suppress = 1,
		reload_max = 600,
		queue = 1,
		id = 744108,
		bullet_ID = {
			1206,
			1206,
			1206,
			1206,
			1206,
			1206,
			1206,
			1206
		},
		barrage_ID = {
			740039,
			740040,
			740041,
			740042,
			740043,
			740044,
			740045,
			740046
		}
	}
	uv0.weapon_property_328[745001] = {
		aim_type = 1,
		range = 120,
		damage = 25,
		base = 1000,
		name = "【DOA联动EX】BOSS 女天狗 第一波 横向自机狙",
		type = 2,
		suppress = 1,
		reload_max = 6000,
		action_index = "",
		queue = 1,
		id = 745001,
		bullet_ID = {
			800072,
			800072,
			800072,
			800072,
			800072,
			800072,
			800072,
			800072,
			800072,
			800072,
			800072,
			800072
		},
		barrage_ID = {
			810112,
			810113,
			810114,
			810115,
			810116,
			810117,
			810118,
			810119,
			810120,
			810121,
			810124,
			810125
		}
	}
	uv0.weapon_property_328[745002] = {
		aim_type = 1,
		range = 120,
		damage = 25,
		base = 1000,
		name = "【DOA联动EX】BOSS 女天狗 第一波 扇形自机狙",
		type = 2,
		suppress = 1,
		reload_max = 300,
		action_index = "",
		queue = 2,
		id = 745002,
		bullet_ID = {
			800073,
			800074,
			800073,
			800074
		},
		barrage_ID = {
			810122,
			810122,
			810123,
			810123
		}
	}
	uv0.weapon_property_328[745003] = {
		base = 1001,
		name = "【DOA联动EX】BOSS 女天狗 第二波 飞机",
		type = 11,
		spawn_bound = "plane",
		fire_fx = "zhupao",
		suppress = 1,
		attack_attribute = 4,
		reload_max = 600,
		fire_sfx = "battle/air-atk",
		queue = 3,
		id = 745003,
		bullet_ID = {},
		barrage_ID = {
			700143
		}
	}
	uv0.weapon_property_328[745004] = {
		base = 1001,
		name = "【DOA联动EX】BOSS 女天狗 第二波 飞机",
		type = 11,
		spawn_bound = "plane",
		fire_fx = "zhupao",
		suppress = 1,
		attack_attribute = 4,
		reload_max = 600,
		fire_sfx = "battle/air-atk",
		queue = 4,
		id = 745004,
		bullet_ID = {},
		barrage_ID = {
			700143
		}
	}
	uv0.weapon_property_328[745005] = {
		base = 1001,
		name = "【DOA联动EX】BOSS 女天狗 第二波 飞机",
		type = 11,
		spawn_bound = "plane",
		fire_fx = "zhupao",
		suppress = 1,
		attack_attribute = 4,
		reload_max = 600,
		fire_sfx = "battle/air-atk",
		queue = 5,
		id = 745005,
		bullet_ID = {},
		barrage_ID = {
			700143
		}
	}
	uv0.weapon_property_328[745006] = {
		range = 85,
		damage = 400,
		base = 1000,
		name = "【DOA联动EX】BOSS 女天狗 第二波 飞机武器",
		fire_fx = "fangkongpaohuoshe2",
		action_index = "",
		attack_attribute = 4,
		reload_max = 6000,
		fire_sfx = "battle/air-atk",
		queue = 1,
		id = 745006,
		angle = 180,
		bullet_ID = {
			800075
		},
		barrage_ID = {
			810126
		}
	}
	uv0.weapon_property_328[745007] = {
		range = 120,
		name = "【DOA联动EX】BOSS 女天狗 第二波 飞机武器",
		damage = 250,
		base = 1000,
		fire_fx = "fangkongpaohuoshe2",
		action_index = "",
		attack_attribute = 4,
		reload_max = 6000,
		fire_sfx = "battle/air-atk",
		queue = 2,
		id = 745007,
		bullet_ID = {
			800076,
			800076
		},
		barrage_ID = {
			810127,
			810128
		}
	}
	uv0.weapon_property_328[745008] = {
		aim_type = 1,
		range = 120,
		damage = 20,
		base = 1000,
		name = "【DOA联动EX】BOSS 女天狗 第三波 子母弹",
		suppress = 1,
		action_index = "",
		reload_max = 6000,
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 745008,
		bullet_ID = {
			800079,
			800078,
			800079,
			800078,
			800079,
			800078,
			800079,
			800078
		},
		barrage_ID = {
			810130,
			810131,
			810132,
			810133,
			810134,
			810135,
			810136,
			810137
		}
	}
	uv0.weapon_property_328[745009] = {
		aim_type = 1,
		range = 120,
		damage = 50,
		base = 1000,
		name = "【DOA联动EX】BOSS 女天狗 第三波 自机狙",
		suppress = 1,
		action_index = "",
		reload_max = 6000,
		fire_sfx = "battle/cannon-main",
		queue = 2,
		id = 745009,
		bullet_ID = {
			800080,
			800081,
			800082
		},
		barrage_ID = {
			810138,
			810139,
			810140
		}
	}
	uv0.weapon_property_328[745010] = {
		range = 120,
		damage = 20,
		base = 1000,
		name = "【DOA联动EX】BOSS 女天狗 第四波 黑色羽毛反弹封锁弹",
		type = 2,
		reload_max = 1200,
		fire_sfx = "",
		queue = 1,
		id = 745010,
		bullet_ID = {
			800042,
			800043,
			800042,
			800043,
			800045,
			800046,
			800045,
			800046
		},
		barrage_ID = {
			810141,
			810142,
			810143,
			810144,
			810145,
			810146,
			810147,
			810148
		}
	}
	uv0.weapon_property_328[745011] = {
		range = 120,
		damage = 50,
		base = 1000,
		name = "【DOA联动EX】BOSS 女天狗 第四波 交叉子弹",
		type = 2,
		reload_max = 6000,
		fire_sfx = "",
		queue = 2,
		id = 745011,
		bullet_ID = {
			800085,
			800085,
			800085,
			800085,
			800085
		},
		barrage_ID = {
			810149,
			810151,
			810152,
			810153,
			810154
		}
	}
	uv0.weapon_property_328[749001] = {
		action_index = "attack",
		range = 80,
		type = 11,
		fire_fx = "zhupao",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载战斗机I",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 12,
		corrected = 100,
		min_range = 0,
		id = 749001,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 2000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "battle/air-atk",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30013
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[749002] = {
		action_index = "attack",
		range = 80,
		type = 11,
		fire_fx = "zhupao",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载战斗机II",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 16,
		corrected = 100,
		min_range = 0,
		id = 749002,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 2000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "battle/air-atk",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30013
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[749003] = {
		action_index = "attack",
		range = 80,
		type = 11,
		fire_fx = "zhupao",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载战斗机III",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 20,
		corrected = 100,
		min_range = 0,
		id = 749003,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 2000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "battle/air-atk",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30013
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[749004] = {
		action_index = "attack",
		range = 80,
		type = 11,
		fire_fx = "zhupao",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载战斗机IV",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 25,
		corrected = 100,
		min_range = 0,
		id = 749004,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 2000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "battle/air-atk",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30013
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[749005] = {
		action_index = "attack",
		range = 80,
		type = 11,
		fire_fx = "zhupao",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载战斗机V",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 32,
		corrected = 100,
		min_range = 0,
		id = 749005,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 2000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "battle/air-atk",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30013
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[749006] = {
		action_index = "attack",
		range = 110,
		type = 11,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载鱼雷机I",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 18,
		corrected = 100,
		min_range = 0,
		id = 749006,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 4000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30014
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[749007] = {
		action_index = "attack",
		range = 110,
		type = 11,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载鱼雷机II",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 22,
		corrected = 100,
		min_range = 0,
		id = 749007,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 4000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30014
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[749008] = {
		action_index = "attack",
		range = 110,
		type = 11,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载鱼雷机III",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 28,
		corrected = 100,
		min_range = 0,
		id = 749008,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 4000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30014
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[749009] = {
		action_index = "attack",
		range = 110,
		type = 11,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载鱼雷机IV",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 36,
		corrected = 100,
		min_range = 0,
		id = 749009,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 4000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30014
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[749010] = {
		action_index = "attack",
		range = 110,
		type = 11,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载鱼雷机V",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 46,
		corrected = 100,
		min_range = 0,
		id = 749010,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 4000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30014
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[749011] = {
		action_index = "attack",
		range = 100,
		type = 11,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载轰炸机I",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 22,
		corrected = 100,
		min_range = 0,
		id = 749011,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 5000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30019
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[749012] = {
		action_index = "attack",
		range = 100,
		type = 11,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载轰炸机II",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 28,
		corrected = 100,
		min_range = 0,
		id = 749012,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 5000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30019
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[749013] = {
		action_index = "attack",
		range = 100,
		type = 11,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载轰炸机III",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 36,
		corrected = 100,
		min_range = 0,
		id = 749013,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 5000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30019
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[749014] = {
		action_index = "attack",
		range = 100,
		type = 11,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载轰炸机IV",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 46,
		corrected = 100,
		min_range = 0,
		id = 749014,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 5000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30019
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[749015] = {
		action_index = "attack",
		range = 100,
		type = 11,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【DOA联动】舰载轰炸机V",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 58,
		corrected = 100,
		min_range = 0,
		id = 749015,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 5000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30019
		},
		barrage_ID = {
			12015
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[750001] = {
		action_index = "attack",
		range = 90,
		type = 1,
		fire_fx = "CAFire",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【商路护航】Z1-专用武器",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 10,
		corrected = 100,
		min_range = 0,
		id = 750001,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 1000,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-main",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			20005,
			20005
		},
		barrage_ID = {
			200034,
			200035
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[750002] = {
		action_index = "attack",
		range = 50,
		type = 3,
		fire_fx = "",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "【商路护航】Z1-鱼雷",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 60,
		charge_param = "",
		damage = 60,
		corrected = 100,
		min_range = 0,
		id = 750002,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 2,
		reload_max = 2500,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 1,
		spawn_bound = "torpedo",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 1,
		bullet_ID = {
			10007
		},
		barrage_ID = {
			1403
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[750003] = {
		action_index = "attack",
		range = 25,
		type = 4,
		fire_fx = "CLFire",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【商路护航】Z1-防空炮",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 25,
		corrected = 100,
		min_range = 0,
		id = 750003,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 3,
		reload_max = 900,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "antiaircraft",
		fire_sfx = "battle/cannon-air",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			30055
		},
		barrage_ID = {
			14001
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[750004] = {
		action_index = "attack",
		range = 60,
		type = 2,
		fire_fx = "CLFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "【商路护航】Z46单发瞄准x4随机II",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 12,
		corrected = 125,
		min_range = 0,
		id = 750004,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 500,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 1,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			1200
		},
		barrage_ID = {
			1005
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_328[750005] = {
		action_index = "attack",
		range = 60,
		type = 3,
		fire_fx = "",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "【商路护航】Z46四联装鱼雷II",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 60,
		charge_param = "",
		damage = 60,
		corrected = 100,
		min_range = 0,
		id = 750005,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 2,
		reload_max = 2600,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 1,
		spawn_bound = "torpedo",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 1,
		bullet_ID = {
			1801
		},
		barrage_ID = {
			1403
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
end()
