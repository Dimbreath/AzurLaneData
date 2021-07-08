pg = pg or {}
pg.weapon_property_188 = {}

function ()
	uv0.weapon_property_188[79601] = {
		action_index = "attack",
		range = 90,
		type = 1,
		fire_fx = "CLFire",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-凉月I",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 12,
		corrected = 105,
		min_range = 0,
		id = 79601,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 3,
		attack_attribute = 1,
		reload_max = 600,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 1,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79601,
			79601,
			79601
		},
		barrage_ID = {
			79601,
			79602,
			79603
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79602] = {
		id = 79602,
		name = "专属弹幕-凉月II",
		damage = 20,
		base = 79601
	}
	uv0.weapon_property_188[79603] = {
		action_index = "attack",
		range = 90,
		type = 3,
		fire_fx = "CAFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-凉月鱼雷",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 42,
		corrected = 100,
		min_range = 0,
		id = 79603,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 2,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-main",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79602
		},
		barrage_ID = {
			79604
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79611] = {
		action_index = "attack",
		range = 50,
		type = 2,
		fire_fx = "CLFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-罗恩μI",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 20,
		corrected = 110,
		min_range = 0,
		id = 79611,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79611,
			79612,
			79613,
			79614
		},
		barrage_ID = {
			79241,
			79242,
			79243,
			79244
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79612] = {
		name = "专属弹幕-罗恩μII",
		damage = 30,
		base = 79611,
		id = 79612,
		bullet_ID = {
			79615,
			79616,
			79617,
			79618
		},
		barrage_ID = {
			79245,
			79246,
			79247,
			79248
		}
	}
	uv0.weapon_property_188[79621] = {
		action_index = "attack",
		range = 90,
		type = 3,
		fire_fx = "CAFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-恶毒μI",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 12,
		corrected = 125,
		min_range = 0,
		id = 79621,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-main",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79621,
			79621
		},
		barrage_ID = {
			79621,
			79622
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79622] = {
		name = "专属弹幕-恶毒μII",
		damage = 18,
		base = 79621,
		id = 79622,
		barrage_ID = {
			79623,
			79624
		}
	}
	uv0.weapon_property_188[79623] = {
		action_index = "attack",
		range = 90,
		type = 3,
		fire_fx = "CAFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-恶毒鱼雷I",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 30,
		corrected = 100,
		min_range = 0,
		id = 79623,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 2,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-main",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79622
		},
		barrage_ID = {
			79625
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79624] = {
		id = 79624,
		name = "专属弹幕-恶毒鱼雷II",
		damage = 45,
		base = 79623
	}
	uv0.weapon_property_188[79631] = {
		action_index = "attack",
		range = 50,
		type = 2,
		fire_fx = "CLFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-黛朵μI",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 24,
		corrected = 125,
		min_range = 0,
		id = 79631,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79631,
			79631,
			79631
		},
		barrage_ID = {
			79491,
			79492,
			79493
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79632] = {
		name = "专属弹幕-黛朵μII",
		damage = 34,
		base = 79631,
		id = 79632,
		bullet_ID = {
			79631,
			79631,
			79631,
			79632,
			79632,
			79632
		},
		barrage_ID = {
			79491,
			79492,
			79493,
			79494,
			79495,
			79496
		}
	}
	uv0.weapon_property_188[79641] = {
		action_index = "attack",
		range = 50,
		type = 1,
		fire_fx = "CLFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-塔什干μI",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 8,
		corrected = 100,
		min_range = 0,
		id = 79641,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 3000,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79641,
			79641,
			79641,
			79641
		},
		barrage_ID = {
			79641,
			79642,
			79643,
			79644
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79642] = {
		name = "专属弹幕-塔什干μII",
		damage = 12,
		base = 79641,
		id = 79642,
		barrage_ID = {
			79645,
			79646,
			79647,
			79648
		}
	}
	uv0.weapon_property_188[79651] = {
		action_index = "attack",
		range = 80,
		type = 3,
		fire_fx = "",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-大青花鱼μI",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 25,
		corrected = 100,
		min_range = 0,
		id = 79651,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 2,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "torpedo",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79651
		},
		barrage_ID = {
			79651
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79652] = {
		name = "专属弹幕-大青花鱼μII",
		damage = 35,
		base = 79651,
		id = 79652,
		bullet_ID = {
			79651,
			79651
		},
		barrage_ID = {
			79651,
			79652
		}
	}
	uv0.weapon_property_188[79661] = {
		action_index = "attack",
		range = 80,
		type = 1,
		fire_fx = "CAFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-巴尔的摩μI",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 25,
		corrected = 100,
		min_range = 0,
		id = 79661,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 412,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79661,
			79661
		},
		barrage_ID = {
			79661,
			79662
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79662] = {
		name = "专属弹幕-巴尔的摩μII",
		damage = 35,
		base = 79661,
		id = 79662,
		barrage_ID = {
			79663,
			79664
		}
	}
	uv0.weapon_property_188[79671] = {
		action_index = "attack",
		range = 80,
		type = 3,
		fire_fx = "",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-U37I",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 40,
		corrected = 100,
		min_range = 0,
		id = 79671,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 2,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "torpedo",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79671,
			79671
		},
		barrage_ID = {
			79671,
			79672
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79672] = {
		name = "专属弹幕-U37II",
		damage = 60,
		base = 79671,
		id = 79672,
		bullet_ID = {
			79671,
			79671,
			79671
		},
		barrage_ID = {
			79671,
			79672,
			79673
		}
	}
	uv0.weapon_property_188[79681] = {
		action_index = "attack",
		range = 50,
		type = 1,
		fire_fx = "CLFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-基洛夫I",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 12,
		corrected = 125,
		min_range = 0,
		id = 79681,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79681,
			79681,
			79681,
			79681,
			79681
		},
		barrage_ID = {
			79681,
			79682,
			79683,
			79684,
			79685
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79682] = {
		name = "专属弹幕-基洛夫II",
		damage = 25,
		base = 79681,
		id = 79682,
		bullet_ID = {
			79681,
			79681,
			79681,
			79681,
			79681
		},
		barrage_ID = {
			79681,
			79687,
			79688,
			79689,
			79690
		}
	}
	uv0.weapon_property_188[79683] = {
		action_index = "attack",
		range = 90,
		type = 3,
		fire_fx = "CAFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-基洛夫鱼雷I",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 40,
		corrected = 100,
		min_range = 0,
		id = 79683,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 2,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-main",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79682
		},
		barrage_ID = {
			79686
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79691] = {
		action_index = "attack",
		range = 50,
		type = 2,
		fire_fx = "CLFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-艾伦·萨姆那I",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 8,
		corrected = 125,
		min_range = 0,
		id = 79691,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79691,
			79691
		},
		barrage_ID = {
			79691,
			79692
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79692] = {
		name = "专属弹幕-艾伦·萨姆那II",
		damage = 12,
		base = 79691,
		id = 79692,
		bullet_ID = {
			79692,
			79692
		},
		barrage_ID = {
			79693,
			79694
		}
	}
	uv0.weapon_property_188[79693] = {
		action_index = "attack",
		range = 90,
		type = 3,
		fire_fx = "CAFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-艾伦萨姆纳鱼雷",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 42,
		corrected = 100,
		min_range = 0,
		id = 79693,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 2,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-main",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79693
		},
		barrage_ID = {
			79695
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79701] = {
		action_index = "attack",
		range = 80,
		type = 1,
		fire_fx = "CLFire",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-阿布鲁齐公爵I",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 12,
		corrected = 100,
		min_range = 0,
		id = 79701,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 1800,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 1,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 1,
		bullet_ID = {
			79701
		},
		barrage_ID = {
			79701
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79702] = {
		id = 79702,
		name = "专属弹幕-阿布鲁齐公爵II",
		damage = 18,
		base = 79701
	}
	uv0.weapon_property_188[79703] = {
		action_index = "attack",
		range = 90,
		type = 3,
		fire_fx = "CAFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-阿布鲁齐公爵鱼雷",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 35,
		corrected = 100,
		min_range = 0,
		id = 79703,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 2,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-main",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79703
		},
		barrage_ID = {
			79703
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79711] = {
		action_index = "attack",
		range = 80,
		type = 1,
		fire_fx = "CAFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-旧金山I",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 25,
		corrected = 100,
		min_range = 0,
		id = 79711,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 412,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79711,
			79711
		},
		barrage_ID = {
			79711,
			79712
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79712] = {
		name = "专属弹幕-旧金山II",
		damage = 35,
		base = 79711,
		id = 79712,
		bullet_ID = {
			79711,
			79711,
			79711,
			79711
		},
		barrage_ID = {
			79711,
			79712,
			79713,
			79714
		}
	}
	uv0.weapon_property_188[79721] = {
		action_index = "attack",
		range = 80,
		type = 3,
		fire_fx = "",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-射水鱼I",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 35,
		corrected = 100,
		min_range = 0,
		id = 79721,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 2,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "torpedo",
		fire_sfx = "",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79721
		},
		barrage_ID = {
			79721
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79722] = {
		name = "专属弹幕-射水鱼II",
		damage = 45,
		base = 79721,
		id = 79722,
		bullet_ID = {
			79721,
			79722
		},
		barrage_ID = {
			79721,
			79722
		}
	}
	uv0.weapon_property_188[79731] = {
		action_index = "attack",
		range = 50,
		type = 2,
		fire_fx = "CLFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-海伦娜.METAI",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 12,
		corrected = 100,
		min_range = 0,
		id = 79731,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			19308
		},
		barrage_ID = {
			81113
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79732] = {
		name = "专属弹幕-海伦娜.METAII",
		damage = 20,
		base = 79731,
		id = 79732,
		bullet_ID = {
			19308,
			19307
		},
		barrage_ID = {
			81113,
			81112
		}
	}
	uv0.weapon_property_188[79741] = {
		action_index = "attack",
		range = 90,
		type = 1,
		fire_fx = "CLFire",
		recover_time = 0,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-风云I",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 360,
		charge_param = "",
		damage = 10,
		corrected = 105,
		min_range = 0,
		id = 79741,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 3,
		attack_attribute = 1,
		reload_max = 600,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 1,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79741
		},
		barrage_ID = {
			79741
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79742] = {
		id = 79742,
		name = "专属弹幕-风云II",
		damage = 18,
		base = 79741
	}
	uv0.weapon_property_188[79743] = {
		action_index = "attack",
		range = 90,
		type = 3,
		fire_fx = "CAFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-风云鱼雷I",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 30,
		corrected = 100,
		min_range = 0,
		id = 79743,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 2,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-main",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79742
		},
		barrage_ID = {
			79742
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79744] = {
		name = "专属弹幕-风云鱼雷II",
		damage = 40,
		base = 79743,
		id = 79744,
		bullet_ID = {
			79742,
			79742
		},
		barrage_ID = {
			79742,
			79743
		}
	}
	uv0.weapon_property_188[79751] = {
		action_index = "attack",
		range = 80,
		type = 1,
		fire_fx = "CAFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-安克雷奇I",
		aim_type = 0,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 20,
		corrected = 100,
		min_range = 0,
		id = 79751,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 1,
		reload_max = 412,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-155mm",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79751,
			79751
		},
		barrage_ID = {
			79751,
			79752
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[79752] = {
		name = "专属弹幕-安克雷奇II",
		damage = 30,
		base = 79751,
		id = 79752,
		bullet_ID = {
			79751,
			79751
		},
		barrage_ID = {
			79753,
			79754
		}
	}
	uv0.weapon_property_188[79753] = {
		action_index = "attack",
		range = 90,
		type = 3,
		fire_fx = "CAFire",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "专属弹幕-安克雷奇鱼雷",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 120,
		charge_param = "",
		damage = 40,
		corrected = 100,
		min_range = 0,
		id = 79753,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 2,
		reload_max = 400,
		queue = 1,
		search_type = 1,
		effect_move = 0,
		suppress = 0,
		spawn_bound = "cannon",
		fire_sfx = "battle/cannon-main",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			79752
		},
		barrage_ID = {
			79755
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[81000] = {
		action_index = "attack",
		range = 90,
		type = 11,
		fire_fx = "",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "F2A水牛T1",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 30,
		charge_param = "",
		damage = 18,
		corrected = 100,
		min_range = 0,
		id = 81000,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 0,
		reload_max = 1995,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "battle/air-atk",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			17000
		},
		barrage_ID = {
			1500
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[81001] = {
		reload_max = 1971,
		damage = 20,
		base = 81000,
		id = 81001,
		bullet_ID = {
			17001
		}
	}
	uv0.weapon_property_188[81002] = {
		reload_max = 1948,
		damage = 22,
		base = 81000,
		id = 81002,
		bullet_ID = {
			17002
		}
	}
	uv0.weapon_property_188[81003] = {
		reload_max = 1924,
		damage = 24,
		base = 81000,
		id = 81003,
		bullet_ID = {
			17003
		}
	}
	uv0.weapon_property_188[81020] = {
		action_index = "attack",
		range = 90,
		type = 11,
		fire_fx = "",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "F2A水牛T2",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 30,
		charge_param = "",
		damage = 20,
		corrected = 100,
		min_range = 0,
		id = 81020,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 0,
		reload_max = 1948,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "battle/air-atk",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			17000
		},
		barrage_ID = {
			1500
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[81021] = {
		reload_max = 1924,
		damage = 22,
		base = 81020,
		id = 81021,
		bullet_ID = {
			17001
		}
	}
	uv0.weapon_property_188[81022] = {
		reload_max = 1900,
		damage = 24,
		base = 81020,
		id = 81022,
		bullet_ID = {
			17002
		}
	}
	uv0.weapon_property_188[81023] = {
		reload_max = 1876,
		damage = 26,
		base = 81020,
		id = 81023,
		bullet_ID = {
			17003
		}
	}
	uv0.weapon_property_188[81040] = {
		action_index = "attack",
		range = 90,
		type = 11,
		fire_fx = "",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "F2A水牛T3",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 30,
		charge_param = "",
		damage = 22,
		corrected = 100,
		min_range = 0,
		id = 81040,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 0,
		reload_max = 1900,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "battle/air-atk",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			17000
		},
		barrage_ID = {
			1500
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[81041] = {
		reload_max = 1876,
		damage = 24,
		base = 81040,
		id = 81041,
		bullet_ID = {
			17001
		}
	}
	uv0.weapon_property_188[81042] = {
		reload_max = 1853,
		damage = 26,
		base = 81040,
		id = 81042,
		bullet_ID = {
			17002
		}
	}
	uv0.weapon_property_188[81043] = {
		reload_max = 1829,
		damage = 28,
		base = 81040,
		id = 81043,
		bullet_ID = {
			17003
		}
	}
	uv0.weapon_property_188[81044] = {
		reload_max = 1805,
		damage = 32,
		base = 81040,
		id = 81044,
		bullet_ID = {
			17004
		}
	}
	uv0.weapon_property_188[81045] = {
		reload_max = 1781,
		damage = 34,
		base = 81040,
		id = 81045,
		bullet_ID = {
			17005
		}
	}
	uv0.weapon_property_188[81046] = {
		reload_max = 1758,
		damage = 36,
		base = 81040,
		id = 81046,
		bullet_ID = {
			17006
		}
	}
	uv0.weapon_property_188[81047] = {
		reload_max = 1758,
		damage = 36,
		base = 81040,
		id = 81047,
		bullet_ID = {
			17006
		}
	}
	uv0.weapon_property_188[81060] = {
		action_index = "attack",
		range = 90,
		type = 11,
		fire_fx = "",
		recover_time = 0.5,
		axis_angle = 0,
		shakescreen = 0,
		name = "F2A水牛(萨奇队)",
		aim_type = 1,
		torpedo_ammo = 0,
		expose = 0,
		angle = 30,
		charge_param = "",
		damage = 31,
		corrected = 100,
		min_range = 0,
		id = 81060,
		attack_attribute_ratio = 100,
		fire_fx_loop_type = 1,
		attack_attribute = 0,
		reload_max = 1670,
		queue = 1,
		search_type = 1,
		effect_move = 1,
		suppress = 1,
		spawn_bound = "plane",
		fire_sfx = "battle/air-atk",
		auto_aftercast = 0,
		initial_over_heat = 0,
		bullet_ID = {
			17060
		},
		barrage_ID = {
			1500
		},
		oxy_type = {
			1
		},
		search_condition = {
			1
		},
		precast_param = {}
	}
	uv0.weapon_property_188[81061] = {
		reload_max = 1645,
		damage = 35,
		base = 81060,
		id = 81061,
		bullet_ID = {
			17061
		}
	}
	uv0.weapon_property_188[81062] = {
		reload_max = 1620,
		damage = 37,
		base = 81060,
		id = 81062,
		bullet_ID = {
			17062
		}
	}
	uv0.weapon_property_188[81063] = {
		reload_max = 1595,
		damage = 41,
		base = 81060,
		id = 81063,
		bullet_ID = {
			17063
		}
	}
	uv0.weapon_property_188[81064] = {
		reload_max = 1570,
		damage = 45,
		base = 81060,
		id = 81064,
		bullet_ID = {
			17064
		}
	}
	uv0.weapon_property_188[81065] = {
		reload_max = 1545,
		damage = 49,
		base = 81060,
		id = 81065,
		bullet_ID = {
			17065
		}
	}
end()
