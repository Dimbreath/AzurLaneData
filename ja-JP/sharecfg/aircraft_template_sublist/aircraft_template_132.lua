pg = pg or {}
pg.aircraft_template_132 = {
	[49060] = {
		name = "He-50b舰载轰炸机",
		max_hp = 37,
		accuracy = 23,
		model_ID = "He50b",
		ACC_growth = 0,
		crash_DMG = 112,
		dodge = 3.51,
		attack_power = 2,
		dodge_limit = 0.8,
		type = 3,
		AP_growth = 2000,
		icon = "He50b",
		funnel_behavior = "",
		nationality = 4,
		hp_growth = 1408,
		speed = 48,
		id = 49060,
		scale = 1,
		weapon_ID = {
			59760,
			52240
		},
		position_offset = {
			0,
			5,
			0
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		bound_bone = {
			weapon = {
				{
					1.04,
					-1.11,
					0
				},
				{
					1.08,
					1.2,
					0
				}
			}
		},
		fx_container = {
			{
				0,
				0,
				0
			},
			{
				0,
				0,
				0
			},
			{
				0,
				0,
				0
			},
			{
				0,
				0,
				0
			}
		}
	},
	[49061] = {
		id = 49061,
		base = 49060,
		max_hp = 42,
		hp_growth = 1619,
		weapon_ID = {
			59761,
			52241
		}
	},
	[49062] = {
		id = 49062,
		base = 49060,
		max_hp = 48,
		hp_growth = 1830,
		weapon_ID = {
			59762,
			52242
		}
	},
	[49063] = {
		id = 49063,
		base = 49060,
		max_hp = 53,
		hp_growth = 2042,
		weapon_ID = {
			59763,
			52243
		}
	},
	[49064] = {
		id = 49064,
		base = 49060,
		max_hp = 59,
		hp_growth = 2253,
		weapon_ID = {
			59764,
			52244
		}
	},
	[49065] = {
		id = 49065,
		base = 49060,
		max_hp = 64,
		hp_growth = 2464,
		weapon_ID = {
			59765,
			52245
		}
	},
	[49066] = {
		id = 49066,
		base = 49060,
		max_hp = 70,
		hp_growth = 2675,
		weapon_ID = {
			59766,
			52246
		}
	},
	[49067] = {
		id = 49067,
		base = 49060,
		max_hp = 75,
		hp_growth = 2886,
		weapon_ID = {
			59767,
			52247
		}
	},
	[61010] = {
		name = "皇家方舟技能LV1",
		max_hp = 32,
		accuracy = 23,
		model_ID = "suoyu",
		ACC_growth = 0,
		crash_DMG = 90,
		dodge = 1,
		attack_power = 2,
		dodge_limit = 0,
		type = 2,
		AP_growth = 2000,
		icon = "suoyu",
		funnel_behavior = "",
		nationality = 3,
		hp_growth = 1216,
		speed = 40,
		id = 61010,
		scale = 1,
		weapon_ID = {
			61013
		},
		position_offset = {
			0,
			5,
			0
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		bound_bone = {
			weapon = {
				{
					0.68,
					-0.667,
					0
				},
				{
					0.97,
					0.584,
					0
				}
			}
		},
		fx_container = {
			{
				0,
				0,
				0
			},
			{
				0,
				0,
				0
			},
			{
				0.26,
				0,
				0
			},
			{
				0,
				0,
				0
			}
		}
	},
	[61011] = {
		max_hp = 64,
		name = "皇家方舟技能LV2",
		base = 61010,
		id = 61011,
		hp_growth = 2432,
		weapon_ID = {
			61014
		}
	}
}
