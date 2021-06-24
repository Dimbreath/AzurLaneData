pg = pg or {}
pg.weapon_property_128 = {}

function ()
	uv0.weapon_property_128[65988] = {
		name = "新泽西跨队支援弹幕-Lv8",
		damage = 17,
		base = 65981,
		id = 65988,
		barrage_ID = {
			81105,
			81106
		}
	}
	uv0.weapon_property_128[65989] = {
		name = "新泽西跨队支援弹幕-Lv9",
		damage = 18,
		base = 65981,
		id = 65989,
		barrage_ID = {
			81105,
			81106
		}
	}
	uv0.weapon_property_128[65990] = {
		name = "新泽西跨队支援弹幕-Lv10",
		damage = 20,
		base = 65981,
		id = 65990,
		barrage_ID = {
			81105,
			81106
		}
	}
	uv0.weapon_property_128[65991] = {
		action_index = "attack",
		range = 120,
		type = 1,
		fire_fx = "CAFire",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "黑海伦娜-区域雷达扫描",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 1,
		corrected = 100,
		min_range = 0,
		id = 65991,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 3,
		attack_attribute = 1,
		reload_max = 5000,
		queue = 4,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-main",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			19305
		},
		barrage_ID = {
			81107
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_128[66000] = {
		action_index = "attack",
		range = 120,
		type = 2,
		fire_fx = "CAFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 302,
		name = "萨拉托加技能LV0",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 10,
		angle = 40,
		charge_param = "",
		damage = 40,
		corrected = 105,
		min_range = 0,
		id = 66000,
		attack_attribute_ratio = 120,
		fire_fx_loop_type = 1,
		attack_attribute = 4,
		reload_max = 1300,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 1,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-203mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			1404
		},
		barrage_ID = {
			1206
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_128[66001] = {
		reload_max = 1270,
		name = "萨拉托加技能LV1",
		damage = 48,
		base = 66000,
		id = 66001
	}
	uv0.weapon_property_128[66002] = {
		reload_max = 1244,
		name = "萨拉托加技能LV2",
		damage = 56,
		base = 66000,
		id = 66002
	}
	uv0.weapon_property_128[66003] = {
		reload_max = 1218,
		name = "萨拉托加技能LV3",
		damage = 64,
		base = 66000,
		id = 66003
	}
	uv0.weapon_property_128[66004] = {
		reload_max = 1192,
		name = "萨拉托加技能LV4",
		damage = 72,
		base = 66000,
		id = 66004
	}
	uv0.weapon_property_128[66005] = {
		reload_max = 1166,
		name = "萨拉托加技能LV5",
		damage = 80,
		base = 66000,
		id = 66005
	}
	uv0.weapon_property_128[66006] = {
		reload_max = 1140,
		name = "萨拉托加技能LV6",
		damage = 88,
		base = 66000,
		id = 66006
	}
	uv0.weapon_property_128[66007] = {
		reload_max = 1114,
		name = "萨拉托加技能LV7",
		damage = 96,
		base = 66000,
		id = 66007
	}
	uv0.weapon_property_128[66008] = {
		reload_max = 1088,
		name = "萨拉托加技能LV8",
		damage = 104,
		base = 66000,
		id = 66008
	}
	uv0.weapon_property_128[66009] = {
		reload_max = 1062,
		name = "萨拉托加技能LV9",
		damage = 112,
		base = 66000,
		id = 66009
	}
	uv0.weapon_property_128[66010] = {
		reload_max = 1036,
		name = "萨拉托加技能LV10",
		damage = 120,
		base = 66000,
		id = 66010
	}
	uv0.weapon_property_128[66020] = {
		action_index = "attack_main",
		range = 200,
		type = 23,
		fire_fx = "zhupao",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 302,
		name = "厌战技能LV0",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 50,
		damage = 52,
		corrected = 110,
		min_range = 35,
		id = 66020,
		attack_attribute_ratio = 80,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 3366,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 1,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-356mm",
		auto_aftercast = 0,
		initial_over_heat = 1,
		bullet_ID = {
			19981
		},
		barrage_ID = {
			1300
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		charge_param = {
			lockTime = 0.3,
			maxLock = 2
		},
		precast_param = {}
	}
	uv0.weapon_property_128[66021] = {
		reload_max = 3298,
		name = "厌战技能LV1",
		damage = 60,
		base = 66020,
		id = 66021
	}
	uv0.weapon_property_128[66022] = {
		reload_max = 3231,
		name = "厌战技能LV2",
		damage = 68,
		base = 66020,
		id = 66022
	}
	uv0.weapon_property_128[66023] = {
		reload_max = 3164,
		name = "厌战技能LV3",
		damage = 76,
		base = 66020,
		id = 66023
	}
	uv0.weapon_property_128[66024] = {
		reload_max = 3096,
		name = "厌战技能LV4",
		damage = 84,
		base = 66020,
		id = 66024
	}
	uv0.weapon_property_128[66025] = {
		reload_max = 3029,
		name = "厌战技能LV5",
		damage = 92,
		base = 66020,
		id = 66025
	}
	uv0.weapon_property_128[66026] = {
		reload_max = 2962,
		damage = 100,
		base = 66020,
		id = 66026,
		name = "厌战技能LV6",
		bullet_ID = {
			19982
		}
	}
	uv0.weapon_property_128[66027] = {
		reload_max = 2894,
		damage = 112,
		base = 66020,
		id = 66027,
		name = "厌战技能LV7",
		bullet_ID = {
			19982
		}
	}
	uv0.weapon_property_128[66028] = {
		reload_max = 2827,
		damage = 124,
		base = 66020,
		id = 66028,
		name = "厌战技能LV8",
		bullet_ID = {
			19982
		}
	}
	uv0.weapon_property_128[66029] = {
		reload_max = 2760,
		damage = 138,
		base = 66020,
		id = 66029,
		name = "厌战技能LV9",
		bullet_ID = {
			19982
		}
	}
	uv0.weapon_property_128[66030] = {
		reload_max = 2692,
		damage = 154,
		base = 66020,
		id = 66030,
		name = "厌战技能LV10",
		bullet_ID = {
			19982
		}
	}
	uv0.weapon_property_128[66040] = {
		action_index = "attack",
		range = 115,
		type = 19,
		fire_fx = "CAFire",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "胡德技能LV0-PVP",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 60,
		charge_param = "",
		damage = 50,
		corrected = 100,
		min_range = 35,
		id = 66040,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 2100,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 1,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-main",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			10014,
			10014
		},
		barrage_ID = {
			199437,
			199438
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {
			time = 0.5,
			fx = "jineng",
			alertTime = 1,
			isBound = true
		}
	}
	uv0.weapon_property_128[66041] = {
		id = 66041,
		name = "胡德技能LV1-PVP",
		damage = 62,
		base = 66040
	}
	uv0.weapon_property_128[66042] = {
		id = 66042,
		name = "胡德技能LV2-PVP",
		damage = 74,
		base = 66040
	}
	uv0.weapon_property_128[66043] = {
		id = 66043,
		name = "胡德技能LV3-PVP",
		damage = 86,
		base = 66040
	}
	uv0.weapon_property_128[66044] = {
		name = "胡德技能LV4-PVP",
		damage = 98,
		base = 66040,
		id = 66044,
		barrage_ID = {
			199439,
			199440
		}
	}
	uv0.weapon_property_128[66045] = {
		name = "胡德技能LV5-PVP",
		damage = 110,
		base = 66040,
		id = 66045,
		barrage_ID = {
			199439,
			199440
		}
	}
	uv0.weapon_property_128[66046] = {
		name = "胡德技能LV6-PVP",
		damage = 122,
		base = 66040,
		id = 66046,
		barrage_ID = {
			199439,
			199440
		}
	}
	uv0.weapon_property_128[66047] = {
		name = "胡德技能LV7-PVP",
		damage = 134,
		base = 66040,
		id = 66047,
		bullet_ID = {
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199441,
			199442,
			199443
		}
	}
	uv0.weapon_property_128[66048] = {
		name = "胡德技能LV8-PVP",
		damage = 146,
		base = 66040,
		id = 66048,
		bullet_ID = {
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199441,
			199442,
			199443
		}
	}
	uv0.weapon_property_128[66049] = {
		name = "胡德技能LV9-PVP",
		damage = 158,
		base = 66040,
		id = 66049,
		bullet_ID = {
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199441,
			199442,
			199443
		}
	}
	uv0.weapon_property_128[66050] = {
		name = "胡德技能LV10-PVP",
		damage = 174,
		base = 66040,
		id = 66050,
		bullet_ID = {
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199441,
			199442,
			199443
		}
	}
	uv0.weapon_property_128[66060] = {
		action_index = "attack",
		range = 95,
		type = 19,
		fire_fx = "CAFire",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "胡德技能LV0-PVE",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 60,
		charge_param = "",
		damage = 50,
		corrected = 100,
		min_range = 25,
		id = 66060,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 2100,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 1,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-main",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			10014,
			10014
		},
		barrage_ID = {
			199437,
			199438
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {
			time = 0.5,
			fx = "jineng",
			alertTime = 1,
			isBound = true
		}
	}
	uv0.weapon_property_128[66061] = {
		id = 66061,
		name = "胡德技能LV1-PVE",
		damage = 62,
		base = 66060
	}
	uv0.weapon_property_128[66062] = {
		id = 66062,
		name = "胡德技能LV2-PVE",
		damage = 74,
		base = 66060
	}
	uv0.weapon_property_128[66063] = {
		id = 66063,
		name = "胡德技能LV3-PVE",
		damage = 86,
		base = 66060
	}
	uv0.weapon_property_128[66064] = {
		name = "胡德技能LV4-PVE",
		damage = 98,
		base = 66060,
		id = 66064,
		barrage_ID = {
			199439,
			199440
		}
	}
	uv0.weapon_property_128[66065] = {
		name = "胡德技能LV5-PVE",
		damage = 110,
		base = 66060,
		id = 66065,
		barrage_ID = {
			199439,
			199440
		}
	}
	uv0.weapon_property_128[66066] = {
		name = "胡德技能LV6-PVE",
		damage = 122,
		base = 66060,
		id = 66066,
		barrage_ID = {
			199439,
			199440
		}
	}
	uv0.weapon_property_128[66067] = {
		name = "胡德技能LV7-PVE",
		damage = 134,
		base = 66060,
		id = 66067,
		bullet_ID = {
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199441,
			199442,
			199443
		}
	}
	uv0.weapon_property_128[66068] = {
		name = "胡德技能LV8-PVE",
		damage = 146,
		base = 66060,
		id = 66068,
		bullet_ID = {
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199441,
			199442,
			199443
		}
	}
	uv0.weapon_property_128[66069] = {
		name = "胡德技能LV9-PVE",
		damage = 158,
		base = 66060,
		id = 66069,
		bullet_ID = {
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199441,
			199442,
			199443
		}
	}
	uv0.weapon_property_128[66070] = {
		name = "胡德技能LV10-PVE",
		damage = 174,
		base = 66060,
		id = 66070,
		bullet_ID = {
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199441,
			199442,
			199443
		}
	}
	uv0.weapon_property_128[66080] = {
		action_index = "attack",
		range = 115,
		type = 19,
		fire_fx = "CLFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "宾夕法尼亚技能LV0-PVP",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 40,
		corrected = 100,
		min_range = 35,
		id = 66080,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 1250,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 1,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			10014,
			10014
		},
		barrage_ID = {
			199400,
			199401
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_128[66081] = {
		id = 66081,
		name = "宾夕法尼亚技能LV1-PVP",
		damage = 48,
		base = 66080
	}
	uv0.weapon_property_128[66082] = {
		id = 66082,
		name = "宾夕法尼亚技能LV2-PVP",
		damage = 56,
		base = 66080
	}
	uv0.weapon_property_128[66083] = {
		id = 66083,
		name = "宾夕法尼亚技能LV3-PVP",
		damage = 64,
		base = 66080
	}
	uv0.weapon_property_128[66084] = {
		name = "宾夕法尼亚技能LV4-PVP",
		damage = 72,
		base = 66080,
		id = 66084,
		bullet_ID = {
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199400,
			199401,
			199402
		}
	}
	uv0.weapon_property_128[66085] = {
		name = "宾夕法尼亚技能LV5-PVP",
		damage = 80,
		base = 66080,
		id = 66085,
		bullet_ID = {
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199400,
			199401,
			199402
		}
	}
	uv0.weapon_property_128[66086] = {
		name = "宾夕法尼亚技能LV6-PVP",
		damage = 88,
		base = 66080,
		id = 66086,
		bullet_ID = {
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199400,
			199401,
			199402
		}
	}
	uv0.weapon_property_128[66087] = {
		name = "宾夕法尼亚技能LV7-PVP",
		damage = 96,
		base = 66080,
		id = 66087,
		bullet_ID = {
			10014,
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199400,
			199401,
			199402,
			199403
		}
	}
	uv0.weapon_property_128[66088] = {
		name = "宾夕法尼亚技能LV8-PVP",
		damage = 104,
		base = 66080,
		id = 66088,
		bullet_ID = {
			10014,
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199400,
			199401,
			199402,
			199403
		}
	}
	uv0.weapon_property_128[66089] = {
		name = "宾夕法尼亚技能LV9-PVP",
		damage = 112,
		base = 66080,
		id = 66089,
		bullet_ID = {
			10014,
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199400,
			199401,
			199402,
			199403
		}
	}
	uv0.weapon_property_128[66090] = {
		name = "宾夕法尼亚技能LV10-PVP",
		damage = 120,
		base = 66080,
		id = 66090,
		bullet_ID = {
			10014,
			10014,
			10014,
			10014
		},
		barrage_ID = {
			199400,
			199401,
			199402,
			199403
		}
	}
	uv0.weapon_property_128[66100] = {
		action_index = "attack",
		range = 90,
		type = 19,
		fire_fx = "CLFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "宾夕法尼亚技能LV0-PVE",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 40,
		corrected = 100,
		min_range = 25,
		id = 66100,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 1250,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 1,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			10014,
			10014
		},
		barrage_ID = {
			199400,
			199401
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_128[66101] = {
		id = 66101,
		name = "宾夕法尼亚技能LV1-PVE",
		damage = 48,
		base = 66100
	}
	uv0.weapon_property_128[66102] = {
		id = 66102,
		name = "宾夕法尼亚技能LV2-PVE",
		damage = 56,
		base = 66100
	}
end()
