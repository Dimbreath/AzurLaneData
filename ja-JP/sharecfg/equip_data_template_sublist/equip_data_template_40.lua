pg = pg or {}
pg.equip_data_template_40 = {
	[2049] = {
		trans_use_gold = 600,
		next = 2050,
		base = 2040,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 2048,
		id = 2049,
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
	[2050] = {
		trans_use_gold = 700,
		next = 2051,
		base = 2040,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 2049,
		id = 2050,
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
	[2051] = {
		trans_use_gold = 0,
		next = 0,
		base = 2040,
		restore_gold = 3460,
		destory_gold = 881,
		prev = 2050,
		id = 2051,
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
	[2100] = {
		important = 1,
		destory_gold = 4,
		type = 10,
		group = 2100,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 2101,
		prev = 0,
		id = 2100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			3,
			4,
			5,
			8,
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
	[2101] = {
		trans_use_gold = 60,
		next = 2102,
		base = 2100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 2100,
		id = 2101,
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
	[2102] = {
		trans_use_gold = 100,
		next = 2103,
		base = 2100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 2101,
		id = 2102,
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
	[2103] = {
		trans_use_gold = 0,
		next = 0,
		base = 2100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 2102,
		id = 2103,
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
	[2120] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 2120,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 2121,
		prev = 0,
		id = 2120,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			3,
			4,
			5,
			8,
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
	[2121] = {
		trans_use_gold = 60,
		next = 2122,
		base = 2120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 2120,
		id = 2121,
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
	[2122] = {
		trans_use_gold = 100,
		next = 2123,
		base = 2120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 2121,
		id = 2122,
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
	[2123] = {
		trans_use_gold = 160,
		next = 2124,
		base = 2120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 2122,
		id = 2123,
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
	[2124] = {
		trans_use_gold = 220,
		next = 2125,
		base = 2120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 2123,
		id = 2124,
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
	[2125] = {
		trans_use_gold = 280,
		next = 2126,
		base = 2120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 2124,
		id = 2125,
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
	[2126] = {
		trans_use_gold = 0,
		next = 0,
		base = 2120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 2125,
		id = 2126,
		level = 7,
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
			}
		}
	},
	[2140] = {
		important = 1,
		destory_gold = 16,
		type = 10,
		group = 2140,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 2141,
		prev = 0,
		id = 2140,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			3,
			4,
			5,
			8,
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
				17002,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	}
}
