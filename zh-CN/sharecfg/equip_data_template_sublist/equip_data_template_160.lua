pg = pg or {}
pg.equip_data_template_160 = {
	[21100] = {
		important = 1,
		destory_gold = 1,
		type = 1,
		group = 21100,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 21101,
		prev = 0,
		id = 21100,
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
	[21101] = {
		trans_use_gold = 60,
		next = 21102,
		base = 21100,
		restore_gold = 20,
		destory_gold = 6,
		prev = 21100,
		id = 21101,
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
	[21102] = {
		trans_use_gold = 100,
		next = 21103,
		base = 21100,
		restore_gold = 80,
		destory_gold = 21,
		prev = 21101,
		id = 21102,
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
	[21103] = {
		trans_use_gold = 0,
		next = 0,
		base = 21100,
		restore_gold = 180,
		destory_gold = 46,
		prev = 21102,
		id = 21103,
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
	[21120] = {
		important = 1,
		destory_gold = 4,
		type = 1,
		group = 21120,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 21121,
		prev = 0,
		id = 21120,
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
	[21121] = {
		trans_use_gold = 60,
		next = 21122,
		base = 21120,
		restore_gold = 20,
		destory_gold = 9,
		prev = 21120,
		id = 21121,
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
	[21122] = {
		trans_use_gold = 100,
		next = 21123,
		base = 21120,
		restore_gold = 80,
		destory_gold = 24,
		prev = 21121,
		id = 21122,
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
	[21123] = {
		trans_use_gold = 0,
		next = 0,
		base = 21120,
		restore_gold = 180,
		destory_gold = 49,
		prev = 21122,
		id = 21123,
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
	[21140] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 21140,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 21141,
		prev = 0,
		id = 21140,
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
		upgrade_formula_id = {
			21140
		}
	},
	[21141] = {
		trans_use_gold = 60,
		next = 21142,
		base = 21140,
		restore_gold = 20,
		destory_gold = 14,
		prev = 21140,
		id = 21141,
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
	[21142] = {
		trans_use_gold = 100,
		next = 21143,
		base = 21140,
		restore_gold = 80,
		destory_gold = 29,
		prev = 21141,
		id = 21142,
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
	[21143] = {
		trans_use_gold = 160,
		next = 21144,
		base = 21140,
		restore_gold = 180,
		destory_gold = 54,
		prev = 21142,
		id = 21143,
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
	[21144] = {
		trans_use_gold = 220,
		next = 21145,
		base = 21140,
		restore_gold = 340,
		destory_gold = 94,
		prev = 21143,
		id = 21144,
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
	[21145] = {
		trans_use_gold = 280,
		next = 21146,
		base = 21140,
		restore_gold = 560,
		destory_gold = 149,
		prev = 21144,
		id = 21145,
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
	[21146] = {
		trans_use_gold = 360,
		next = 21147,
		base = 21140,
		restore_gold = 840,
		destory_gold = 219,
		prev = 21145,
		id = 21146,
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
	}
}
