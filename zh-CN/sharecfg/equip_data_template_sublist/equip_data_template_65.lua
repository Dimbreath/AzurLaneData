pg = pg or {}
pg.equip_data_template_65 = {
	[4001] = {
		trans_use_gold = 60,
		next = 4002,
		base = 4000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 4000,
		id = 4001,
		level = 2,
		trans_use_item = {
			{
				17001,
				3
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[4002] = {
		trans_use_gold = 100,
		next = 4003,
		base = 4000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 4001,
		id = 4002,
		level = 3,
		trans_use_item = {
			{
				17001,
				5
			}
		},
		destory_item = {
			{
				17001,
				2
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[4003] = {
		trans_use_gold = 0,
		next = 0,
		base = 4000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 4002,
		id = 4003,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[4020] = {
		important = 1,
		destory_gold = 4,
		type = 14,
		group = 4020,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 4021,
		prev = 0,
		id = 4020,
		equip_limit = 4000,
		level = 1,
		ship_type_forbidden = {
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
			13,
			17,
			18,
			19
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[4021] = {
		trans_use_gold = 60,
		next = 4022,
		base = 4020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 4020,
		id = 4021,
		level = 2,
		trans_use_item = {
			{
				17001,
				3
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[4022] = {
		trans_use_gold = 100,
		next = 4023,
		base = 4020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 4021,
		id = 4022,
		level = 3,
		trans_use_item = {
			{
				17001,
				5
			}
		},
		destory_item = {
			{
				17001,
				2
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[4023] = {
		trans_use_gold = 0,
		next = 0,
		base = 4020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 4022,
		id = 4023,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[4040] = {
		important = 1,
		destory_gold = 9,
		type = 14,
		group = 4040,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 4041,
		prev = 0,
		id = 4040,
		equip_limit = 4000,
		level = 1,
		ship_type_forbidden = {
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
			13,
			17,
			18,
			19
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[4041] = {
		trans_use_gold = 60,
		next = 4042,
		base = 4040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 4040,
		id = 4041,
		level = 2,
		trans_use_item = {
			{
				17001,
				3
			}
		},
		destory_item = {
			{
				17001,
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[4042] = {
		trans_use_gold = 100,
		next = 4043,
		base = 4040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 4041,
		id = 4042,
		level = 3,
		trans_use_item = {
			{
				17001,
				5
			}
		},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[4043] = {
		trans_use_gold = 160,
		next = 4044,
		base = 4040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 4042,
		id = 4043,
		level = 4,
		trans_use_item = {
			{
				17002,
				8
			}
		},
		destory_item = {
			{
				17001,
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[4044] = {
		trans_use_gold = 220,
		next = 4045,
		base = 4040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 4043,
		id = 4044,
		level = 5,
		trans_use_item = {
			{
				17002,
				11
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				2
			}
		},
		restore_item = {
			{
				17001,
				9
			},
			{
				17002,
				8
			}
		}
	},
	[4045] = {
		trans_use_gold = 280,
		next = 4046,
		base = 4040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 4044,
		id = 4045,
		level = 6,
		trans_use_item = {
			{
				17002,
				14
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				5
			}
		},
		restore_item = {
			{
				17001,
				9
			},
			{
				17002,
				19
			}
		}
	},
	[4046] = {
		trans_use_gold = 360,
		next = 4047,
		base = 4040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 4045,
		id = 4046,
		level = 7,
		trans_use_item = {
			{
				17003,
				18
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
			}
		},
		restore_item = {
			{
				17001,
				9
			},
			{
				17002,
				33
			}
		}
	},
	[4047] = {
		trans_use_gold = 0,
		next = 0,
		base = 4040,
		restore_gold = 1200,
		destory_gold = 309,
		prev = 4046,
		id = 4047,
		level = 8,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
			}
		},
		restore_item = {
			{
				17001,
				9
			},
			{
				17002,
				33
			},
			{
				17003,
				18
			}
		}
	}
}
