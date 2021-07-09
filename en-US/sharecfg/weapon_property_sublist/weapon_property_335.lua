pg = pg or {}
pg.weapon_property_335 = {}

function ()
	uv0.weapon_property_335[760102] = {
		base = 1000,
		range = 100,
		type = 2,
		name = "【2020德系活动A2】BOSS 英王乔治五世 <型弹幕",
		reload_max = 1350,
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 760102,
		bullet_ID = {
			810002,
			810002
		},
		barrage_ID = {
			820002,
			820003
		}
	}
	uv0.weapon_property_335[760103] = {
		aim_type = 1,
		range = 100,
		damage = 22,
		base = 1000,
		name = "【2020德系活动A2】BOSS 英王乔治五世 4连主炮3轮跨射",
		fire_fx = "CAFire",
		suppress = 1,
		reload_max = 1800,
		type = 19,
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 760103,
		initial_over_heat = 1,
		bullet_ID = {
			810001
		},
		barrage_ID = {
			820001
		},
		precast_param = {
			time = 1,
			fx = "jinengenemy",
			alertTime = 1,
			isBound = true
		}
	}
	uv0.weapon_property_335[760104] = {
		aim_type = 1,
		range = 100,
		damage = 16,
		base = 1000,
		name = "【2020德系活动A2】BOSS 英王乔治五世 2连快速火炮",
		type = 2,
		suppress = 1,
		reload_max = 1000,
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 760104,
		bullet_ID = {
			810003
		},
		barrage_ID = {
			820004
		}
	}
	uv0.weapon_property_335[760105] = {
		aim_type = 1,
		range = 100,
		base = 1000,
		name = "【2020德系活动A2】BOSS 英王乔治五世 子母弹",
		type = 2,
		suppress = 1,
		initial_over_heat = 1,
		reload_max = 1500,
		fire_sfx = "battle/cannon-main",
		queue = 2,
		id = 760105,
		bullet_ID = {
			810004
		},
		barrage_ID = {
			820005
		}
	}
	uv0.weapon_property_335[760106] = {
		aim_type = 1,
		min_range = 75,
		type = 19,
		name = "【2020德系活动A2】BOSS 英王乔治五世 后排跨射",
		fire_fx = "CAFire",
		action_index = "",
		reload_max = 2100,
		queue = 1,
		angle = 40,
		range = 150,
		damage = 22,
		base = 1000,
		suppress = 1,
		fire_sfx = "battle/cannon-main",
		id = 760106,
		bullet_ID = {
			810006
		},
		barrage_ID = {
			20018
		},
		precast_param = {
			time = 1,
			fx = "jinengenemy",
			alertTime = 2,
			isBound = true
		}
	}
	uv0.weapon_property_335[760201] = {
		aim_type = 1,
		range = 38,
		damage = 6,
		base = 1000,
		name = "【2020德系活动A3】BOSS 通用近程自卫火炮",
		type = 2,
		suppress = 1,
		reload_max = 500,
		initial_over_heat = 1,
		queue = 5,
		id = 760201,
		bullet_ID = {
			999
		},
		barrage_ID = {
			12
		}
	}
	uv0.weapon_property_335[760202] = {
		aim_type = 0,
		range = 120,
		damage = 16,
		base = 1002,
		name = "【2020德系活动A3】BOSS 通用战斗机（自机狙）",
		action_index = "",
		reload_max = 200,
		fire_sfx = "battle/air-atk",
		queue = 1,
		id = 760202,
		bullet_ID = {
			340123
		},
		barrage_ID = {
			820007
		}
	}
	uv0.weapon_property_335[760203] = {
		range = 120,
		name = "【2020德系活动A3】BOSS 通用轰炸机",
		damage = 24,
		base = 1002,
		action_index = "",
		reload_max = 200,
		queue = 1,
		id = 760203,
		bullet_ID = {
			340124
		},
		barrage_ID = {
			820007
		}
	}
	uv0.weapon_property_335[760204] = {
		action_index = "",
		range = 85,
		type = 1,
		fire_fx = "fangkongpaohuoshe2",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【2020德系活动A3】BOSS 通用战斗机弹幕（自机狙）",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 180,
		charge_param = "",
		damage = 16,
		corrected = 100,
		min_range = 0,
		id = 760204,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 100,
		queue = 3,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "cannon",
		fire_sfx = "battle/air-atk",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			130314
		},
		barrage_ID = {
			120303
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_335[760205] = {
		action_index = "",
		range = 10,
		type = 2,
		fire_fx = "CAFire",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【2020德系活动A3】BOSS 通用轰炸机弹幕",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 180,
		charge_param = "",
		damage = 24,
		corrected = 100,
		min_range = 0,
		id = 760205,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 200,
		queue = 2,
		search_type = 1,
		effect_move = 1,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-main",
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
	uv0.weapon_property_335[760206] = {
		aim_type = 1,
		range = 120,
		damage = 16,
		base = 1000,
		name = "【2020德系活动A3】BOSS 翔鹤第一波弹幕",
		suppress = 1,
		reload_max = 5000,
		queue = 1,
		id = 760206,
		bullet_ID = {
			770022,
			770023
		},
		barrage_ID = {
			990241,
			990242
		}
	}
	uv0.weapon_property_335[760207] = {
		aim_type = 1,
		range = 120,
		damage = 16,
		base = 1000,
		name = "【2020德系活动A3】BOSS 瑞鹤第一波弹幕",
		suppress = 1,
		reload_max = 5000,
		queue = 1,
		id = 760207,
		bullet_ID = {
			770020,
			770021
		},
		barrage_ID = {
			990001,
			990002
		}
	}
	uv0.weapon_property_335[760208] = {
		aim_type = 1,
		range = 120,
		damage = 16,
		base = 1000,
		name = "【2020德系活动A3】BOSS 翔鹤第二波弹幕",
		suppress = 1,
		reload_max = 9999,
		queue = 1,
		id = 760208,
		bullet_ID = {
			770026
		},
		barrage_ID = {
			780017
		}
	}
	uv0.weapon_property_335[760209] = {
		aim_type = 1,
		range = 120,
		damage = 16,
		base = 1000,
		name = "【2020德系活动A3】BOSS 瑞鹤第二波弹幕",
		fire_fx = "fangkongpaohuoshe2",
		suppress = 1,
		reload_max = 5000,
		type = 2,
		queue = 1,
		id = 760209,
		bullet_ID = {
			770024,
			770025
		},
		barrage_ID = {
			780015,
			780016
		}
	}
	uv0.weapon_property_335[760210] = {
		aim_type = 1,
		range = 120,
		damage = 16,
		base = 1000,
		name = "【2020德系活动A3】BOSS 翔鹤第三波弹幕",
		type = 2,
		suppress = 1,
		reload_max = 5000,
		queue = 3,
		id = 760210,
		bullet_ID = {
			770033
		},
		barrage_ID = {
			730226
		}
	}
	uv0.weapon_property_335[760211] = {
		aim_type = 1,
		range = 120,
		damage = 16,
		base = 1000,
		name = "【2020德系活动A3】BOSS 瑞鹤第三波弹幕",
		fire_fx = "fangkongpaohuoshe2",
		suppress = 1,
		reload_max = 5000,
		type = 2,
		queue = 1,
		id = 760211,
		bullet_ID = {
			770034,
			770035
		},
		barrage_ID = {
			780015,
			780016
		}
	}
	uv0.weapon_property_335[761001] = {
		aim_type = 1,
		range = 38,
		damage = 5,
		base = 1000,
		name = "【2020德系活动B1】BOSS 通用近程自卫火炮",
		type = 2,
		suppress = 1,
		reload_max = 500,
		initial_over_heat = 1,
		queue = 5,
		id = 761001,
		bullet_ID = {
			999
		},
		barrage_ID = {
			12
		}
	}
	uv0.weapon_property_335[761002] = {
		range = 40,
		damage = 20,
		base = 1001,
		name = "【2020德系活动B1】BOSS Z24 半途自瞄鱼雷",
		suppress = 1,
		reload_max = 5000,
		queue = 1,
		id = 761002,
		bullet_ID = {
			810007
		},
		barrage_ID = {
			820008
		}
	}
	uv0.weapon_property_335[761003] = {
		aim_type = 1,
		range = 100,
		damage = 8,
		base = 1000,
		name = "【2020德系活动B1】BOSS 通用旋转子弹弹幕",
		type = 2,
		suppress = 1,
		reload_max = 5000,
		fire_sfx = "battle/cannon-main",
		queue = 2,
		id = 761003,
		bullet_ID = {
			810010,
			810013
		},
		barrage_ID = {
			820010,
			820013
		}
	}
	uv0.weapon_property_335[761004] = {
		aim_type = 1,
		range = 100,
		damage = 8,
		base = 1000,
		name = "【2020德系活动B1】BOSS 通用旋转子弹弹幕",
		type = 2,
		suppress = 1,
		reload_max = 5000,
		fire_sfx = "battle/cannon-main",
		queue = 2,
		id = 761004,
		bullet_ID = {
			810010,
			810013
		},
		barrage_ID = {
			820022,
			820023
		}
	}
	uv0.weapon_property_335[761005] = {
		range = 100,
		damage = 5,
		base = 1000,
		name = "【2020德系活动B1】BOSS Z24 杂乱发射弹幕",
		type = 2,
		reload_max = 5000,
		queue = 5,
		id = 761005,
		bullet_ID = {
			810016
		},
		barrage_ID = {
			820016
		}
	}
	uv0.weapon_property_335[761006] = {
		range = 100,
		damage = 12,
		base = 1000,
		name = "【2020德系活动B1】BOSS 莱比锡 扇形弹幕",
		type = 2,
		reload_max = 5000,
		queue = 6,
		id = 761006,
		bullet_ID = {
			810017
		},
		barrage_ID = {
			820017
		}
	}
	uv0.weapon_property_335[761007] = {
		aim_type = 0,
		range = 100,
		damage = 24,
		base = 1001,
		fire_fx = "CLFire",
		spawn_bound = "cannon",
		name = "【2020德系活动B1】BOSS 莱比锡 散射鱼雷",
		reload_max = 5000,
		fire_sfx = "battle/cannon-main",
		queue = 7,
		id = 761007,
		bullet_ID = {
			810018,
			810018
		},
		barrage_ID = {
			820018,
			820019
		}
	}
	uv0.weapon_property_335[761008] = {
		aim_type = 1,
		range = 120,
		damage = 6,
		base = 1000,
		name = "【2020德系活动B1】BOSS Z24 最后一波 全屏交叉弹幕",
		fire_fx = "CAFire",
		suppress = 1,
		reload_max = 5000,
		type = 2,
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 761008,
		bullet_ID = {
			810019,
			810019,
			810020,
			810020
		},
		barrage_ID = {
			820020,
			820021,
			820020,
			820021
		}
	}
	uv0.weapon_property_335[761009] = {
		range = 100,
		name = "【2020德系活动B1】BOSS 莱比锡 最后一波 上下穿透弹",
		damage = 12,
		base = 1000,
		reload_max = 5000,
		fire_sfx = "battle/cannon-main",
		queue = 7,
		id = 761009,
		bullet_ID = {
			810021,
			810022
		},
		barrage_ID = {
			820025,
			820026
		}
	}
	uv0.weapon_property_335[761010] = {
		aim_type = 1,
		range = 120,
		damage = 12,
		base = 1000,
		name = "【2020德系活动B1】BOSS 莱比锡 最后一波 全屏交叉弹幕2",
		fire_fx = "CAFire",
		suppress = 1,
		reload_max = 5000,
		type = 2,
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 761010,
		bullet_ID = {
			810025,
			810025,
			810026,
			810026
		},
		barrage_ID = {
			820020,
			820021,
			820020,
			820021
		}
	}
	uv0.weapon_property_335[761011] = {
		range = 100,
		name = "【2020德系活动B1】BOSS Z24 最后一波 上下穿透弹2",
		damage = 6,
		base = 1000,
		reload_max = 5000,
		fire_sfx = "battle/cannon-main",
		queue = 7,
		id = 761011,
		bullet_ID = {
			810027,
			810028
		},
		barrage_ID = {
			820025,
			820026
		}
	}
	uv0.weapon_property_335[761101] = {
		aim_type = 1,
		range = 38,
		damage = 7,
		base = 1000,
		name = "【2020德系活动B2】BOSS 欧根亲王 常驻 近程自卫火炮",
		type = 2,
		suppress = 1,
		reload_max = 500,
		queue = 5,
		id = 761101,
		bullet_ID = {
			999
		},
		barrage_ID = {
			11
		}
	}
	uv0.weapon_property_335[761102] = {
		range = 120,
		name = "【2020德系活动B2】BOSS 欧根亲王 第一波 开幕主炮射击",
		damage = 20,
		base = 1000,
		fire_fx = "CAFire",
		reload_max = 400,
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 761102,
		bullet_ID = {
			750089
		},
		barrage_ID = {
			760154
		}
	}
	uv0.weapon_property_335[761103] = {
		range = 120,
		damage = 16,
		base = 1000,
		name = "【2020德系活动B2】BOSS 欧根亲王 第二波 蓝色变形弹幕",
		fire_fx = "CAFire",
		type = 2,
		reload_max = 5000,
		queue = 1,
		id = 761103,
		bullet_ID = {
			810029,
			810030,
			810031,
			810032,
			810033,
			810034,
			810035,
			810036,
			810037,
			810038,
			810039,
			810040,
			810041,
			810042,
			810043,
			810044,
			810045,
			810046,
			810047,
			810048,
			810049,
			810050
		},
		barrage_ID = {
			760129,
			760130,
			760131,
			760132,
			760133,
			760134,
			760135,
			760136,
			760137,
			760138,
			760139,
			760140,
			760141,
			760142,
			760143,
			760144,
			760145,
			760146,
			760147,
			760148,
			760149,
			760150
		}
	}
	uv0.weapon_property_335[761104] = {
		range = 120,
		damage = 15,
		base = 1000,
		name = "【2020德系活动B2】BOSS 欧根亲王 第三波 紫色子母弹",
		fire_fx = "CAFire",
		type = 2,
		reload_max = 5000,
		queue = 1,
		id = 761104,
		bullet_ID = {
			750087
		},
		barrage_ID = {
			760152
		}
	}
	uv0.weapon_property_335[761105] = {
		range = 120,
		name = "【2020德系活动B2】BOSS 欧根亲王 第三波 慢速直射后分叉",
		damage = 18,
		base = 1000,
		reload_max = 150,
		queue = 2,
		id = 761105,
		bullet_ID = {
			950280,
			950281,
			950282,
			950283,
			950284
		},
		barrage_ID = {
			950190,
			950191,
			950192,
			950193,
			950194
		}
	}
	uv0.weapon_property_335[761106] = {
		range = 120,
		name = "【2020德系活动B2】BOSS 欧根亲王 第三波 慢速直射后分叉",
		damage = 18,
		base = 1000,
		reload_max = 150,
		queue = 2,
		id = 761106,
		bullet_ID = {
			950280,
			950281,
			950282,
			950283,
			950284
		},
		barrage_ID = {
			950197,
			950198,
			950199,
			950200,
			950201
		}
	}
	uv0.weapon_property_335[761107] = {
		range = 120,
		name = "【2020德系活动B2】BOSS 欧根亲王 第三波 慢速直射后分叉",
		damage = 18,
		base = 1000,
		reload_max = 150,
		queue = 2,
		id = 761107,
		bullet_ID = {
			950280,
			950281,
			950282,
			950283,
			950284
		},
		barrage_ID = {
			950202,
			950203,
			950204,
			950205,
			950206
		}
	}
	uv0.weapon_property_335[761108] = {
		range = 120,
		damage = 15,
		base = 1000,
		name = "【2020德系活动B2】BOSS 欧根亲王 第四波 红色子母弹",
		fire_fx = "CAFire",
		type = 2,
		reload_max = 5000,
		queue = 1,
		id = 761108,
		bullet_ID = {
			750090,
			750091
		},
		barrage_ID = {
			760155,
			760156
		}
	}
	uv0.weapon_property_335[761109] = {
		range = 120,
		name = "【2020德系活动B2】BOSS 欧根亲王 第四波 自机狙主炮",
		damage = 20,
		base = 1000,
		reload_max = 5000,
		queue = 2,
		id = 761109,
		bullet_ID = {
			750093
		},
		barrage_ID = {
			820035
		}
	}
	uv0.weapon_property_335[761110] = {
		aim_type = 0,
		damage = 24,
		base = 1001,
		name = "【2020德系活动B2】BOSS 欧根亲王 第四波 自机狙鱼雷",
		action_index = "",
		suppress = 1,
		reload_max = 5000,
		fire_sfx = "battle/cannon-main",
		queue = 3,
		id = 761110,
		bullet_ID = {
			750094
		},
		barrage_ID = {
			820036
		}
	}
	uv0.weapon_property_335[761111] = {
		range = 120,
		damage = 15,
		base = 1000,
		name = "【2020德系活动B2】BOSS 欧根亲王 第四波 红色子母弹第二次",
		fire_fx = "CAFire",
		type = 2,
		reload_max = 5000,
		queue = 1,
		id = 761111,
		bullet_ID = {
			750090,
			750091
		},
		barrage_ID = {
			760162,
			760163
		}
	}
	uv0.weapon_property_335[761112] = {
		action_index = "attack",
		range = 999,
		type = 11,
		fire_fx = "",
		recover_time = 5,
		axis_angle = 0,
		shakescreen = 0,
		name = "【2020德系活动B2】BOSS 五航战支援 战斗机",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 10,
		corrected = 100,
		min_range = 0,
		id = 761112,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 300,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {},
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
	uv0.weapon_property_335[761113] = {
		action_index = "attack",
		range = 999,
		type = 11,
		fire_fx = "",
		recover_time = 5,
		axis_angle = 0,
		shakescreen = 0,
		name = "【2020德系活动B2】BOSS 五航战支援 鱼雷机",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 20,
		corrected = 100,
		min_range = 0,
		id = 761113,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 300,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {},
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
	uv0.weapon_property_335[761114] = {
		action_index = "attack",
		range = 999,
		type = 11,
		fire_fx = "",
		recover_time = 5,
		axis_angle = 0,
		shakescreen = 0,
		name = "【2020德系活动B2】BOSS 五航战支援 轰炸机",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 24,
		corrected = 100,
		min_range = 0,
		id = 761114,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 300,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {},
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
	uv0.weapon_property_335[761115] = {
		action_index = "",
		range = 25,
		type = 1,
		fire_fx = "fangkongpaohuoshe2",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【2020德系活动B2】BOSS 五航战支援 战斗机武器",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 180,
		charge_param = "",
		damage = 10,
		corrected = 100,
		min_range = 0,
		id = 761115,
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
	uv0.weapon_property_335[761116] = {
		action_index = "",
		range = 40,
		type = 3,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【2020德系活动B2】BOSS 五航战支援 鱼雷机武器",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 35,
		charge_param = "",
		damage = 20,
		corrected = 100,
		min_range = 22,
		id = 761116,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 11954,
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
	uv0.weapon_property_335[761117] = {
		action_index = "",
		range = 10,
		type = 2,
		fire_fx = "",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "【2020德系活动B2】BOSS 五航战支援 轰炸机武器",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 180,
		charge_param = "",
		damage = 24,
		corrected = 100,
		min_range = 0,
		id = 761117,
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
	uv0.weapon_property_335[761201] = {
		aim_type = 0,
		name = "【2020德系活动B3】塞壬构建者 开幕雷击",
		damage = 36,
		base = 1001,
		reload_max = 1000,
		queue = 1,
		id = 761201,
		bullet_ID = {
			700125,
			700125
		},
		barrage_ID = {
			700138,
			700139
		}
	}
	uv0.weapon_property_335[761202] = {
		aim_type = 0,
		name = "【2020德系活动B3】塞壬构建者 开幕雷击2",
		damage = 36,
		base = 1001,
		reload_max = 1000,
		queue = 1,
		id = 761202,
		bullet_ID = {
			700126,
			700126,
			700126
		},
		barrage_ID = {
			700140,
			700141,
			700142
		}
	}
	uv0.weapon_property_335[761203] = {
		aim_type = 1,
		range = 38,
		damage = 6,
		base = 1000,
		name = "【2020德系活动B3】塞壬构建者 常驻 近程自卫火炮",
		type = 2,
		suppress = 1,
		reload_max = 500,
		queue = 6,
		id = 761203,
		bullet_ID = {
			999
		},
		barrage_ID = {
			11
		}
	}
	uv0.weapon_property_335[761204] = {
		range = 150,
		damage = 18,
		base = 1000,
		type = 19,
		fire_fx = "CAFire",
		min_range = 100,
		suppress = 1,
		reload_max = 5000,
		name = "【2020德系活动B3】塞壬构建者 第一波 地毯式跨射",
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 761204,
		aim_type = 1,
		bullet_ID = {
			810064,
			810065,
			810066,
			810067,
			810068,
			810069,
			810070
		},
		barrage_ID = {
			820050,
			820050,
			820050,
			820050,
			820050,
			820050,
			820050
		},
		precast_param = {
			time = 0.1,
			fx = "jinengenemy",
			alertTime = 2
		}
	}
	uv0.weapon_property_335[761205] = {
		range = 150,
		damage = 18,
		base = 1000,
		type = 19,
		fire_fx = "CAFire",
		min_range = 100,
		suppress = 1,
		reload_max = 5000,
		name = "【2020德系活动B3】塞壬构建者 第一波 地毯式跨射",
		fire_sfx = "battle/cannon-main",
		queue = 2,
		id = 761205,
		aim_type = 1,
		bullet_ID = {
			810071,
			810072,
			810073,
			810074,
			810075,
			810076,
			810077
		},
		barrage_ID = {
			820051,
			820051,
			820051,
			820051,
			820051,
			820051,
			820051
		},
		precast_param = {
			time = 0.1,
			fx = "jinengenemy",
			alertTime = 2
		}
	}
	uv0.weapon_property_335[761206] = {
		range = 150,
		damage = 18,
		base = 1000,
		type = 19,
		fire_fx = "CAFire",
		min_range = 100,
		suppress = 1,
		reload_max = 5000,
		name = "【2020德系活动B3】塞壬构建者 第一波 地毯式跨射",
		fire_sfx = "battle/cannon-main",
		queue = 3,
		id = 761206,
		aim_type = 1,
		bullet_ID = {
			810078,
			810079,
			810080,
			810081,
			810082,
			810083,
			810084
		},
		barrage_ID = {
			820052,
			820052,
			820052,
			820052,
			820052,
			820052,
			820052
		},
		precast_param = {
			time = 0.1,
			fx = "jinengenemy",
			alertTime = 2
		}
	}
	uv0.weapon_property_335[761207] = {
		range = 150,
		damage = 18,
		base = 1000,
		type = 19,
		fire_fx = "CAFire",
		min_range = 100,
		suppress = 1,
		reload_max = 5000,
		name = "【2020德系活动B3】塞壬构建者 第一波 地毯式跨射",
		fire_sfx = "battle/cannon-main",
		aim_type = 1,
		id = 761207,
		bullet_ID = {
			810085,
			810086,
			810087,
			810088,
			810089,
			810090,
			810091
		},
		barrage_ID = {
			820053,
			820053,
			820053,
			820053,
			820053,
			820053,
			820053
		},
		precast_param = {
			time = 0.1,
			fx = "jinengenemy",
			alertTime = 2
		}
	}
	uv0.weapon_property_335[761208] = {
		range = 150,
		damage = 18,
		base = 1000,
		type = 19,
		fire_fx = "CAFire",
		min_range = 100,
		suppress = 1,
		reload_max = 5000,
		name = "【2020德系活动B3】塞壬构建者 第一波 地毯式跨射",
		fire_sfx = "battle/cannon-main",
		queue = 5,
		id = 761208,
		aim_type = 1,
		bullet_ID = {
			810092,
			810093,
			810094,
			810095,
			810096,
			810097,
			810098
		},
		barrage_ID = {
			820054,
			820054,
			820054,
			820054,
			820054,
			820054,
			820054
		},
		precast_param = {
			time = 0.1,
			fx = "jinengenemy",
			alertTime = 2
		}
	}
	uv0.weapon_property_335[761209] = {
		action_index = "attack",
		range = 120,
		type = 24,
		fire_fx = "",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "【2020德系活动B3】塞壬构建者 第二波 聚焦激光",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 12,
		corrected = 100,
		min_range = 0,
		id = 761209,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 5000,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			810051,
			810051,
			810052,
			810052
		},
		barrage_ID = {
			820038,
			820039,
			820040,
			820041
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {
			time = 1,
			fx = "jinengenemy",
			alertTime = 2,
			isBound = true
		}
	}
	uv0.weapon_property_335[761210] = {
		range = 120,
		name = "【2020德系活动B3】塞壬构建者 第二波 聚焦激光伴随爆炸",
		damage = 12,
		base = 1000,
		fire_fx = "",
		reload_max = 1800,
		fire_sfx = "battle/cannon-main",
		queue = 2,
		id = 761210,
		bullet_ID = {
			810053,
			810054,
			810055,
			810056,
			810053,
			810054,
			810055,
			810056
		},
		barrage_ID = {
			820042,
			820042,
			820042,
			820042,
			820044,
			820044,
			820044,
			820044
		},
		precast_param = {
			time = 1,
			fx = "jinengenemy",
			alertTime = 1,
			isBound = true
		}
	}
	uv0.weapon_property_335[761211] = {
		aim_type = 1,
		range = 120,
		damage = 12,
		base = 1000,
		name = "【2020德系活动B3】塞壬构建者 第三波 连续自机狙触手",
		fire_fx = "",
		suppress = 1,
		reload_max = 1800,
		fire_sfx = "battle/cannon-main",
		queue = 2,
		id = 761211,
		bullet_ID = {
			810059,
			810059,
			810059,
			810099
		},
		barrage_ID = {
			820049,
			820055,
			820056,
			820057
		},
		precast_param = {
			time = 1,
			fx = "jinengenemy",
			alertTime = 1,
			isBound = true
		}
	}
	uv0.weapon_property_335[761212] = {
		reload_max = 100,
		name = "【2020德系活动B3】塞壬构建者 第四波 浮游炮",
		damage = 12,
		base = 1002,
		id = 761212,
		range = 120,
		queue = 2,
		barrage_ID = {
			700143
		}
	}
	uv0.weapon_property_335[761213] = {
		reload_max = 100,
		name = "【2020德系活动B3】塞壬构建者 第四波 浮游炮",
		damage = 12,
		base = 1002,
		id = 761213,
		range = 120,
		queue = 3,
		barrage_ID = {
			700143
		}
	}
	uv0.weapon_property_335[761214] = {
		range = 120,
		damage = 12,
		base = 1000,
		name = "【2020德系活动B3】塞壬构建者 第四波 浮游炮弹幕",
		fire_fx = "",
		action_index = "",
		type = 2,
		reload_max = 5000,
		attack_attribute = 4,
		fire_sfx = "",
		queue = 1,
		id = 761214,
		bullet_ID = {
			810100,
			810100,
			810100,
			810100,
			810100,
			810100
		},
		barrage_ID = {
			820058,
			820059,
			820060,
			820061,
			820062,
			820063
		}
	}
	uv0.weapon_property_335[761215] = {
		range = 120,
		damage = 12,
		base = 1000,
		name = "【2020德系活动B3】塞壬构建者 第四波 浮游炮弹幕",
		fire_fx = "",
		action_index = "",
		type = 2,
		reload_max = 5000,
		attack_attribute = 4,
		fire_sfx = "",
		queue = 1,
		id = 761215,
		bullet_ID = {
			810100,
			810100,
			810100,
			810100,
			810100,
			810100
		},
		barrage_ID = {
			820064,
			820065,
			820066,
			820067,
			820068,
			820069
		}
	}
	uv0.weapon_property_335[761216] = {
		aim_type = 1,
		range = 120,
		damage = 14,
		base = 1000,
		name = "【2020德系活动B3】塞壬构建者 第四波 紫色自机狙弹幕",
		suppress = 1,
		action_index = "",
		reload_max = 5000,
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 761216,
		bullet_ID = {
			810102,
			810103,
			810104
		},
		barrage_ID = {
			820070,
			820071,
			820072
		}
	}
	uv0.weapon_property_335[761217] = {
		range = 120,
		name = "【2020德系活动B3】塞壬构建者 第五波 紫色扫射弹幕",
		damage = 14,
		base = 1000,
		action_index = "",
		reload_max = 5000,
		fire_sfx = "battle/cannon-main",
		queue = 1,
		id = 761217,
		bullet_ID = {
			810105,
			810105,
			810105,
			810105
		},
		barrage_ID = {
			820079,
			820080,
			820081,
			820082
		}
	}
	uv0.weapon_property_335[761218] = {
		reload_max = 5000,
		damage = 36,
		base = 1001,
		id = 761218,
		name = "【2020德系活动B3】塞壬构建者 第五波 鱼雷自机狙",
		suppress = 1,
		bullet_ID = {
			810106,
			810107
		},
		barrage_ID = {
			820083,
			820084
		}
	}
	uv0.weapon_property_335[761219] = {
		range = 120,
		name = "【2020德系活动B3】塞壬构建者 第五波 全屏触手",
		damage = 12,
		base = 1000,
		fire_fx = "",
		reload_max = 1800,
		fire_sfx = "battle/cannon-main",
		queue = 3,
		id = 761219,
		bullet_ID = {
			810099
		},
		barrage_ID = {
			820085
		},
		precast_param = {
			time = 1,
			fx = "jinengenemy",
			alertTime = 1,
			isBound = true
		}
	}
end()
