pg = pg or {}
pg.equip_data_template_81 = {
	[7300] = {
		important = 2,
		destory_gold = 25,
		type = 3,
		group = 7300,
		restore_gold = 0,
		trans_use_gold = 30,
		next = 7301,
		prev = 0,
		id = 7300,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			8,
			17
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
	[7301] = {
		trans_use_gold = 90,
		next = 7302,
		base = 7300,
		restore_gold = 30,
		destory_gold = 33,
		prev = 7300,
		id = 7301,
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
	[7302] = {
		trans_use_gold = 150,
		next = 7303,
		base = 7300,
		restore_gold = 120,
		destory_gold = 55,
		prev = 7301,
		id = 7302,
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
	[7303] = {
		trans_use_gold = 240,
		next = 7304,
		base = 7300,
		restore_gold = 270,
		destory_gold = 93,
		prev = 7302,
		id = 7303,
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
	[7304] = {
		trans_use_gold = 330,
		next = 7305,
		base = 7300,
		restore_gold = 510,
		destory_gold = 153,
		prev = 7303,
		id = 7304,
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
	[7305] = {
		trans_use_gold = 420,
		next = 7306,
		base = 7300,
		restore_gold = 840,
		destory_gold = 235,
		prev = 7304,
		id = 7305,
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
	[7306] = {
		trans_use_gold = 540,
		next = 7307,
		base = 7300,
		restore_gold = 1260,
		destory_gold = 340,
		prev = 7305,
		id = 7306,
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
	[7307] = {
		trans_use_gold = 660,
		next = 7308,
		base = 7300,
		restore_gold = 1800,
		destory_gold = 475,
		prev = 7306,
		id = 7307,
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
	[7308] = {
		trans_use_gold = 780,
		next = 7309,
		base = 7300,
		restore_gold = 2460,
		destory_gold = 640,
		prev = 7307,
		id = 7308,
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
	[7309] = {
		trans_use_gold = 900,
		next = 7310,
		base = 7300,
		restore_gold = 3240,
		destory_gold = 835,
		prev = 7308,
		id = 7309,
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
	[7310] = {
		trans_use_gold = 800,
		next = 7311,
		base = 7300,
		restore_gold = 4140,
		destory_gold = 1060,
		prev = 7309,
		id = 7310,
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
	[7311] = {
		trans_use_gold = 1000,
		next = 7312,
		base = 7300,
		restore_gold = 4940,
		destory_gold = 1260,
		prev = 7310,
		id = 7311,
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
	[7312] = {
		trans_use_gold = 1200,
		next = 7313,
		base = 7300,
		restore_gold = 5940,
		destory_gold = 1510,
		prev = 7311,
		id = 7312,
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
	[7313] = {
		trans_use_gold = 0,
		next = 0,
		base = 7300,
		restore_gold = 7140,
		destory_gold = 1810,
		prev = 7312,
		id = 7313,
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
	[7320] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 7320,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 7321,
		prev = 0,
		id = 7320,
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
	}
}
