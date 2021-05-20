pg = pg or {}
pg.equip_data_template_98 = {
	[12209] = {
		trans_use_gold = 600,
		next = 12210,
		base = 12200,
		restore_gold = 2160,
		destory_gold = 565,
		prev = 12208,
		id = 12209,
		level = 10,
		trans_use_item = {
			{
				17013,
				30
			}
		},
		destory_item = {
			{
				17011,
				3
			},
			{
				17012,
				8
			},
			{
				17013,
				17
			}
		},
		restore_item = {
			{
				17011,
				9
			},
			{
				17012,
				33
			},
			{
				17013,
				66
			}
		}
	},
	[12210] = {
		trans_use_gold = 800,
		next = 12211,
		base = 12200,
		restore_gold = 2760,
		destory_gold = 715,
		prev = 12209,
		id = 12210,
		level = 11,
		trans_use_item = {
			{
				17014,
				35
			}
		},
		destory_item = {
			{
				17011,
				3
			},
			{
				17012,
				8
			},
			{
				17013,
				25
			}
		},
		restore_item = {
			{
				17011,
				9
			},
			{
				17012,
				33
			},
			{
				17013,
				96
			}
		}
	},
	[12211] = {
		trans_use_gold = 1000,
		next = 12212,
		base = 12200,
		restore_gold = 3560,
		destory_gold = 915,
		prev = 12210,
		id = 12211,
		level = 12,
		trans_use_item = {
			{
				17014,
				40
			}
		},
		destory_item = {
			{
				17011,
				3
			},
			{
				17012,
				8
			},
			{
				17013,
				25
			},
			{
				17014,
				9
			}
		},
		restore_item = {
			{
				17011,
				9
			},
			{
				17012,
				33
			},
			{
				17013,
				96
			},
			{
				17014,
				35
			}
		}
	},
	[12212] = {
		trans_use_gold = 1200,
		next = 12213,
		base = 12200,
		restore_gold = 4560,
		destory_gold = 1165,
		prev = 12211,
		id = 12212,
		level = 13,
		trans_use_item = {
			{
				17014,
				45
			},
			{
				17990,
				5
			}
		},
		destory_item = {
			{
				17011,
				3
			},
			{
				17012,
				8
			},
			{
				17013,
				25
			},
			{
				17014,
				19
			}
		},
		restore_item = {
			{
				17011,
				9
			},
			{
				17012,
				33
			},
			{
				17013,
				96
			},
			{
				17014,
				75
			}
		}
	},
	[12213] = {
		trans_use_gold = 0,
		next = 0,
		base = 12200,
		restore_gold = 5760,
		destory_gold = 1465,
		prev = 12212,
		id = 12213,
		level = 14,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				3
			},
			{
				17012,
				8
			},
			{
				17013,
				25
			},
			{
				17014,
				30
			}
		},
		restore_item = {
			{
				17011,
				9
			},
			{
				17012,
				33
			},
			{
				17013,
				96
			},
			{
				17014,
				120
			},
			{
				17990,
				5
			}
		}
	},
	[13000] = {
		important = 1,
		destory_gold = 1,
		type = 3,
		group = 13000,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 13001,
		prev = 0,
		id = 13000,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			8,
			17
		},
		trans_use_item = {
			{
				17011,
				1
			}
		},
		destory_item = {},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[13001] = {
		trans_use_gold = 60,
		next = 13002,
		base = 13000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 13000,
		id = 13001,
		level = 2,
		trans_use_item = {
			{
				17011,
				3
			}
		},
		destory_item = {
			{
				17011,
				1
			}
		},
		restore_item = {
			{
				17011,
				1
			}
		}
	},
	[13002] = {
		trans_use_gold = 100,
		next = 13003,
		base = 13000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 13001,
		id = 13002,
		level = 3,
		trans_use_item = {
			{
				17011,
				5
			}
		},
		destory_item = {
			{
				17011,
				2
			}
		},
		restore_item = {
			{
				17011,
				4
			}
		}
	},
	[13003] = {
		trans_use_gold = 0,
		next = 0,
		base = 13000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 13002,
		id = 13003,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				3
			}
		},
		restore_item = {
			{
				17011,
				9
			}
		}
	},
	[13020] = {
		important = 1,
		destory_gold = 4,
		type = 3,
		group = 13020,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 13021,
		prev = 0,
		id = 13020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			8,
			17
		},
		trans_use_item = {
			{
				17011,
				1
			}
		},
		destory_item = {},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[13021] = {
		trans_use_gold = 60,
		next = 13022,
		base = 13020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 13020,
		id = 13021,
		level = 2,
		trans_use_item = {
			{
				17011,
				3
			}
		},
		destory_item = {
			{
				17011,
				1
			}
		},
		restore_item = {
			{
				17011,
				1
			}
		}
	},
	[13022] = {
		trans_use_gold = 100,
		next = 13023,
		base = 13020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 13021,
		id = 13022,
		level = 3,
		trans_use_item = {
			{
				17011,
				5
			}
		},
		destory_item = {
			{
				17011,
				2
			}
		},
		restore_item = {
			{
				17011,
				4
			}
		}
	},
	[13023] = {
		trans_use_gold = 0,
		next = 0,
		base = 13020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 13022,
		id = 13023,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				3
			}
		},
		restore_item = {
			{
				17011,
				9
			}
		}
	},
	[13040] = {
		important = 1,
		destory_gold = 9,
		type = 3,
		group = 13040,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 13041,
		prev = 0,
		id = 13040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			8,
			17
		},
		trans_use_item = {
			{
				17011,
				1
			}
		},
		destory_item = {
			{
				17011,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[13041] = {
		trans_use_gold = 60,
		next = 13042,
		base = 13040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 13040,
		id = 13041,
		level = 2,
		trans_use_item = {
			{
				17011,
				3
			}
		},
		destory_item = {
			{
				17011,
				2
			}
		},
		restore_item = {
			{
				17011,
				1
			}
		}
	}
}
