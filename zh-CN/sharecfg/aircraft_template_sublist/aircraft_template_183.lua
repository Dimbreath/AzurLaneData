pg = pg or {}
pg.aircraft_template_183 = {
	[67940] = {
		max_hp = 91,
		name = "独立技能鱼雷机Lv10",
		base = 67931,
		id = 67940,
		hp_growth = 3511,
		weapon_ID = {
			67960
		}
	},
	[67981] = {
		name = "香格里拉技能飞机-PVE",
		max_hp = 69,
		accuracy = 23,
		model_ID = "F6F",
		ACC_growth = 0,
		crash_DMG = 406,
		dodge = 1,
		attack_power = 2,
		dodge_limit = 0,
		type = 1,
		AP_growth = 2000,
		icon = "F6F",
		nationality = 1,
		hp_growth = 2282,
		speed = 48,
		id = 67981,
		scale = 1,
		funnel_behavior = {
			offsetX = 22,
			hover_range = 18,
			offsetZ = -26
		},
		weapon_ID = {},
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
				0.52,
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
	[67982] = {
		id = 67982,
		name = "香格里拉技能飞机-PVP",
		base = 67981,
		funnel_behavior = {
			offsetX = 4,
			hover_range = 18,
			offsetZ = -14
		}
	},
	[68001] = {
		name = "邦克山技能鱼雷机Lv1",
		max_hp = 37,
		accuracy = 23,
		model_ID = "tbf",
		ACC_growth = 0,
		crash_DMG = 406,
		dodge = 1,
		attack_power = 2,
		dodge_limit = 0,
		type = 2,
		AP_growth = 2000,
		icon = "tbf",
		funnel_behavior = "",
		nationality = 1,
		hp_growth = 1404,
		speed = 48,
		id = 68001,
		scale = 1,
		weapon_ID = {
			68011
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
				0.15,
				-0.08,
				0
			},
			{
				0,
				0,
				0
			}
		}
	},
	[68002] = {
		max_hp = 42,
		name = "邦克山技能鱼雷机Lv2",
		base = 68001,
		id = 68002,
		hp_growth = 1615,
		weapon_ID = {
			68012
		}
	},
	[68003] = {
		max_hp = 47,
		name = "邦克山技能鱼雷机Lv3",
		base = 68001,
		id = 68003,
		hp_growth = 1826,
		weapon_ID = {
			68013
		}
	},
	[68004] = {
		max_hp = 53,
		name = "邦克山技能鱼雷机Lv4",
		base = 68001,
		id = 68004,
		hp_growth = 2036,
		weapon_ID = {
			68014
		}
	},
	[68005] = {
		max_hp = 58,
		name = "邦克山技能鱼雷机Lv5",
		base = 68001,
		id = 68005,
		hp_growth = 2247,
		weapon_ID = {
			68015
		}
	},
	[68006] = {
		max_hp = 64,
		name = "邦克山技能鱼雷机Lv6",
		base = 68001,
		id = 68006,
		hp_growth = 2458,
		weapon_ID = {
			68016
		}
	}
}
