pg = pg or {}
pg.equip_data_template_52 = {
	[3100] = {
		important = 2,
		destory_gold = 16,
		type = 10,
		group = 3100,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 3101,
		prev = 0,
		id = 3100,
		equip_limit = 3100,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			9,
			10,
			11,
			12,
			13,
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
				17002,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[3101] = {
		trans_use_gold = 60,
		next = 3102,
		base = 3100,
		restore_gold = 20,
		destory_gold = 21,
		prev = 3100,
		id = 3101,
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
			},
			{
				17002,
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
	[3102] = {
		trans_use_gold = 100,
		next = 3103,
		base = 3100,
		restore_gold = 80,
		destory_gold = 36,
		prev = 3101,
		id = 3102,
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
			},
			{
				17002,
				1
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[3103] = {
		trans_use_gold = 160,
		next = 3104,
		base = 3100,
		restore_gold = 180,
		destory_gold = 61,
		prev = 3102,
		id = 3103,
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
				3
			},
			{
				17002,
				1
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[3104] = {
		trans_use_gold = 220,
		next = 3105,
		base = 3100,
		restore_gold = 340,
		destory_gold = 101,
		prev = 3103,
		id = 3104,
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
				3
			},
			{
				17002,
				3
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
	[3105] = {
		trans_use_gold = 280,
		next = 3106,
		base = 3100,
		restore_gold = 560,
		destory_gold = 156,
		prev = 3104,
		id = 3105,
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
				3
			},
			{
				17002,
				6
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
	[3106] = {
		trans_use_gold = 360,
		next = 3107,
		base = 3100,
		restore_gold = 840,
		destory_gold = 226,
		prev = 3105,
		id = 3106,
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
				3
			},
			{
				17002,
				9
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
	[3107] = {
		trans_use_gold = 440,
		next = 3108,
		base = 3100,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 3106,
		id = 3107,
		level = 8,
		trans_use_item = {
			{
				17003,
				22
			}
		},
		destory_item = {
			{
				17001,
				3
			},
			{
				17002,
				9
			},
			{
				17003,
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
				33
			},
			{
				17003,
				18
			}
		}
	},
	[3108] = {
		trans_use_gold = 520,
		next = 3109,
		base = 3100,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 3107,
		id = 3108,
		level = 9,
		trans_use_item = {
			{
				17003,
				26
			}
		},
		destory_item = {
			{
				17001,
				3
			},
			{
				17002,
				9
			},
			{
				17003,
				10
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
				40
			}
		}
	},
	[3109] = {
		trans_use_gold = 600,
		next = 3110,
		base = 3100,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 3108,
		id = 3109,
		level = 10,
		trans_use_item = {
			{
				17003,
				30
			}
		},
		destory_item = {
			{
				17001,
				3
			},
			{
				17002,
				9
			},
			{
				17003,
				16
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
				66
			}
		}
	},
	[3110] = {
		trans_use_gold = 700,
		next = 3111,
		base = 3100,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 3109,
		id = 3110,
		level = 11,
		trans_use_item = {
			{
				17004,
				35
			},
			{
				17990,
				1
			}
		},
		destory_item = {
			{
				17001,
				3
			},
			{
				17002,
				9
			},
			{
				17003,
				24
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
				96
			}
		}
	},
	[3111] = {
		trans_use_gold = 0,
		next = 0,
		base = 3100,
		restore_gold = 3460,
		destory_gold = 881,
		prev = 3110,
		id = 3111,
		level = 12,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			},
			{
				17002,
				9
			},
			{
				17003,
				24
			},
			{
				17004,
				9
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
				96
			},
			{
				17004,
				35
			},
			{
				17990,
				1
			}
		}
	},
	[3120] = {
		important = 1,
		destory_gold = 25,
		type = 10,
		group = 3120,
		restore_gold = 0,
		trans_use_gold = 30,
		next = 3121,
		prev = 0,
		id = 3120,
		equip_limit = 3100,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			9,
			10,
			11,
			12,
			13,
			18,
			19
		},
		trans_use_item = {
			{
				17001,
				2
			}
		},
		destory_item = {
			{
				17003,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[3121] = {
		trans_use_gold = 90,
		next = 3122,
		base = 3120,
		restore_gold = 30,
		destory_gold = 33,
		prev = 3120,
		id = 3121,
		level = 2,
		trans_use_item = {
			{
				17001,
				5
			}
		},
		destory_item = {
			{
				17001,
				1
			},
			{
				17003,
				1
			}
		},
		restore_item = {
			{
				17001,
				2
			}
		}
	},
	[3122] = {
		trans_use_gold = 150,
		next = 3123,
		base = 3120,
		restore_gold = 120,
		destory_gold = 55,
		prev = 3121,
		id = 3122,
		level = 3,
		trans_use_item = {
			{
				17001,
				8
			}
		},
		destory_item = {
			{
				17001,
				2
			},
			{
				17003,
				1
			}
		},
		restore_item = {
			{
				17001,
				7
			}
		}
	}
}
