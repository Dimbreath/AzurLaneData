pg = pg or {}
pg.equip_data_template_251 = {
	[33100] = {
		important = 2,
		destory_gold = 25,
		type = 11,
		group = 33100,
		restore_gold = 0,
		trans_use_gold = 30,
		next = 33101,
		prev = 0,
		id = 33100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			3
		},
		trans_use_item = {
			{
				17011,
				2
			}
		},
		destory_item = {
			{
				17013,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[33101] = {
		trans_use_gold = 90,
		next = 33102,
		base = 33100,
		restore_gold = 30,
		destory_gold = 33,
		prev = 33100,
		id = 33101,
		level = 2,
		trans_use_item = {
			{
				17011,
				5
			}
		},
		destory_item = {
			{
				17011,
				1
			},
			{
				17013,
				1
			}
		},
		restore_item = {
			{
				17011,
				2
			}
		}
	},
	[33102] = {
		trans_use_gold = 150,
		next = 33103,
		base = 33100,
		restore_gold = 120,
		destory_gold = 55,
		prev = 33101,
		id = 33102,
		level = 3,
		trans_use_item = {
			{
				17011,
				8
			}
		},
		destory_item = {
			{
				17011,
				2
			},
			{
				17013,
				1
			}
		},
		restore_item = {
			{
				17011,
				7
			}
		}
	},
	[33103] = {
		trans_use_gold = 240,
		next = 33104,
		base = 33100,
		restore_gold = 270,
		destory_gold = 93,
		prev = 33102,
		id = 33103,
		level = 4,
		trans_use_item = {
			{
				17012,
				12
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17013,
				1
			}
		},
		restore_item = {
			{
				17011,
				15
			}
		}
	},
	[33104] = {
		trans_use_gold = 330,
		next = 33105,
		base = 33100,
		restore_gold = 510,
		destory_gold = 153,
		prev = 33103,
		id = 33104,
		level = 5,
		trans_use_item = {
			{
				17012,
				16
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				3
			},
			{
				17013,
				1
			}
		},
		restore_item = {
			{
				17011,
				15
			},
			{
				17012,
				12
			}
		}
	},
	[33105] = {
		trans_use_gold = 420,
		next = 33106,
		base = 33100,
		restore_gold = 840,
		destory_gold = 235,
		prev = 33104,
		id = 33105,
		level = 6,
		trans_use_item = {
			{
				17012,
				21
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				7
			},
			{
				17013,
				1
			}
		},
		restore_item = {
			{
				17011,
				15
			},
			{
				17012,
				28
			}
		}
	},
	[33106] = {
		trans_use_gold = 540,
		next = 33107,
		base = 33100,
		restore_gold = 1260,
		destory_gold = 340,
		prev = 33105,
		id = 33106,
		level = 7,
		trans_use_item = {
			{
				17013,
				27
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				1
			}
		},
		restore_item = {
			{
				17011,
				15
			},
			{
				17012,
				49
			}
		}
	},
	[33107] = {
		trans_use_gold = 660,
		next = 33108,
		base = 33100,
		restore_gold = 1800,
		destory_gold = 475,
		prev = 33106,
		id = 33107,
		level = 8,
		trans_use_item = {
			{
				17013,
				33
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				7
			}
		},
		restore_item = {
			{
				17011,
				15
			},
			{
				17012,
				49
			},
			{
				17013,
				27
			}
		}
	},
	[33108] = {
		trans_use_gold = 780,
		next = 33109,
		base = 33100,
		restore_gold = 2460,
		destory_gold = 640,
		prev = 33107,
		id = 33108,
		level = 9,
		trans_use_item = {
			{
				17013,
				39
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				15
			}
		},
		restore_item = {
			{
				17011,
				15
			},
			{
				17012,
				49
			},
			{
				17013,
				60
			}
		}
	},
	[33109] = {
		trans_use_gold = 900,
		next = 33110,
		base = 33100,
		restore_gold = 3240,
		destory_gold = 835,
		prev = 33108,
		id = 33109,
		level = 10,
		trans_use_item = {
			{
				17013,
				45
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				25
			}
		},
		restore_item = {
			{
				17011,
				15
			},
			{
				17012,
				49
			},
			{
				17013,
				99
			}
		}
	},
	[33110] = {
		trans_use_gold = 800,
		next = 33111,
		base = 33100,
		restore_gold = 4140,
		destory_gold = 1060,
		prev = 33109,
		id = 33110,
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
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				36
			}
		},
		restore_item = {
			{
				17011,
				15
			},
			{
				17012,
				49
			},
			{
				17013,
				144
			}
		}
	},
	[33111] = {
		trans_use_gold = 1000,
		next = 33112,
		base = 33100,
		restore_gold = 4940,
		destory_gold = 1260,
		prev = 33110,
		id = 33111,
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
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				36
			},
			{
				17014,
				9
			}
		},
		restore_item = {
			{
				17011,
				15
			},
			{
				17012,
				49
			},
			{
				17013,
				144
			},
			{
				17014,
				35
			}
		}
	},
	[33112] = {
		trans_use_gold = 1200,
		next = 33113,
		base = 33100,
		restore_gold = 5940,
		destory_gold = 1510,
		prev = 33111,
		id = 33112,
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
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				36
			},
			{
				17014,
				19
			}
		},
		restore_item = {
			{
				17011,
				15
			},
			{
				17012,
				49
			},
			{
				17013,
				144
			},
			{
				17014,
				75
			}
		}
	},
	[33113] = {
		trans_use_gold = 0,
		next = 0,
		base = 33100,
		restore_gold = 7140,
		destory_gold = 1810,
		prev = 33112,
		id = 33113,
		level = 14,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				36
			},
			{
				17014,
				30
			}
		},
		restore_item = {
			{
				17011,
				15
			},
			{
				17012,
				49
			},
			{
				17013,
				144
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
	[34000] = {
		important = 1,
		destory_gold = 1,
		type = 4,
		group = 34000,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 34001,
		prev = 0,
		id = 34000,
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
	}
}
