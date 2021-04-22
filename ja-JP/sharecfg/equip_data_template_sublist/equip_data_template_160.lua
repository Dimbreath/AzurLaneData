pg = pg or {}
pg.equip_data_template_160 = {
	[22001] = {
		trans_use_gold = 60,
		next = 22002,
		base = 22000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 22000,
		id = 22001,
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
	[22002] = {
		trans_use_gold = 100,
		next = 22003,
		base = 22000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 22001,
		id = 22002,
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
	[22003] = {
		trans_use_gold = 0,
		next = 0,
		base = 22000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 22002,
		id = 22003,
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
	[22020] = {
		important = 1,
		destory_gold = 4,
		type = 2,
		group = 22020,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 22021,
		prev = 0,
		id = 22020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
	[22021] = {
		trans_use_gold = 60,
		next = 22022,
		base = 22020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 22020,
		id = 22021,
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
	[22022] = {
		trans_use_gold = 100,
		next = 22023,
		base = 22020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 22021,
		id = 22022,
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
	[22023] = {
		trans_use_gold = 0,
		next = 0,
		base = 22020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 22022,
		id = 22023,
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
	[22040] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 22040,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 22041,
		prev = 0,
		id = 22040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
	[22041] = {
		trans_use_gold = 60,
		next = 22042,
		base = 22040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 22040,
		id = 22041,
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
	},
	[22042] = {
		trans_use_gold = 100,
		next = 22043,
		base = 22040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 22041,
		id = 22042,
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
				3
			}
		},
		restore_item = {
			{
				17011,
				4
			}
		}
	},
	[22043] = {
		trans_use_gold = 160,
		next = 22044,
		base = 22040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 22042,
		id = 22043,
		level = 4,
		trans_use_item = {
			{
				17012,
				8
			}
		},
		destory_item = {
			{
				17011,
				4
			}
		},
		restore_item = {
			{
				17011,
				9
			}
		}
	},
	[22044] = {
		trans_use_gold = 220,
		next = 22045,
		base = 22040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 22043,
		id = 22044,
		level = 5,
		trans_use_item = {
			{
				17012,
				11
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				2
			}
		},
		restore_item = {
			{
				17011,
				9
			},
			{
				17012,
				8
			}
		}
	},
	[22045] = {
		trans_use_gold = 280,
		next = 22046,
		base = 22040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 22044,
		id = 22045,
		level = 6,
		trans_use_item = {
			{
				17012,
				14
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				5
			}
		},
		restore_item = {
			{
				17011,
				9
			},
			{
				17012,
				19
			}
		}
	},
	[22046] = {
		trans_use_gold = 360,
		next = 22047,
		base = 22040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 22045,
		id = 22046,
		level = 7,
		trans_use_item = {
			{
				17013,
				18
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				8
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
			}
		}
	},
	[22047] = {
		trans_use_gold = 0,
		next = 0,
		base = 22040,
		restore_gold = 1200,
		destory_gold = 309,
		prev = 22046,
		id = 22047,
		level = 8,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				8
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
				18
			}
		}
	}
}
