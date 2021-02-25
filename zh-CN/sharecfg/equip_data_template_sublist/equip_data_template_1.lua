pg = pg or {}
pg.equip_data_template_1 = {
	[500] = {
		important = 2,
		destory_gold = 25,
		type = 10,
		group = 500,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 501,
		prev = 0,
		id = 500,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
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
	[501] = {
		trans_use_gold = 60,
		next = 502,
		base = 500,
		restore_gold = 20,
		destory_gold = 30,
		prev = 500,
		id = 501,
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
				17003,
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
	[502] = {
		trans_use_gold = 100,
		next = 503,
		base = 500,
		restore_gold = 80,
		destory_gold = 45,
		prev = 501,
		id = 502,
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
				17003,
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
	[503] = {
		trans_use_gold = 160,
		next = 504,
		base = 500,
		restore_gold = 180,
		destory_gold = 70,
		prev = 502,
		id = 503,
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
				17003,
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
	[504] = {
		trans_use_gold = 220,
		next = 505,
		base = 500,
		restore_gold = 340,
		destory_gold = 110,
		prev = 503,
		id = 504,
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
				9
			},
			{
				17002,
				8
			}
		}
	},
	[505] = {
		trans_use_gold = 280,
		next = 506,
		base = 500,
		restore_gold = 560,
		destory_gold = 165,
		prev = 504,
		id = 505,
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
				5
			},
			{
				17003,
				1
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
	[506] = {
		trans_use_gold = 360,
		next = 507,
		base = 500,
		restore_gold = 840,
		destory_gold = 235,
		prev = 505,
		id = 506,
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
				8
			},
			{
				17003,
				1
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
	[507] = {
		trans_use_gold = 440,
		next = 508,
		base = 500,
		restore_gold = 1200,
		destory_gold = 325,
		prev = 506,
		id = 507,
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
				8
			},
			{
				17003,
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
				33
			},
			{
				17003,
				18
			}
		}
	},
	[508] = {
		trans_use_gold = 520,
		next = 509,
		base = 500,
		restore_gold = 1640,
		destory_gold = 435,
		prev = 507,
		id = 508,
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
				8
			},
			{
				17003,
				11
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
	[509] = {
		trans_use_gold = 600,
		next = 510,
		base = 500,
		restore_gold = 2160,
		destory_gold = 565,
		prev = 508,
		id = 509,
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
				8
			},
			{
				17003,
				17
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
	[510] = {
		trans_use_gold = 800,
		next = 511,
		base = 500,
		restore_gold = 2760,
		destory_gold = 715,
		prev = 509,
		id = 510,
		level = 11,
		trans_use_item = {
			{
				17004,
				35
			}
		},
		destory_item = {
			{
				17001,
				3
			},
			{
				17002,
				8
			},
			{
				17003,
				25
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
	[511] = {
		trans_use_gold = 1000,
		next = 512,
		base = 500,
		restore_gold = 3560,
		destory_gold = 915,
		prev = 510,
		id = 511,
		level = 12,
		trans_use_item = {
			{
				17004,
				40
			}
		},
		destory_item = {
			{
				17001,
				3
			},
			{
				17002,
				8
			},
			{
				17003,
				25
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
			}
		}
	},
	[512] = {
		trans_use_gold = 1200,
		next = 513,
		base = 500,
		restore_gold = 4560,
		destory_gold = 1165,
		prev = 511,
		id = 512,
		level = 13,
		trans_use_item = {
			{
				17004,
				45
			},
			{
				17990,
				5
			}
		},
		destory_item = {
			{
				17001,
				3
			},
			{
				17002,
				8
			},
			{
				17003,
				25
			},
			{
				17004,
				19
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
				75
			}
		}
	},
	[513] = {
		trans_use_gold = 0,
		next = 0,
		base = 500,
		restore_gold = 5760,
		destory_gold = 1465,
		prev = 512,
		id = 513,
		level = 14,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			},
			{
				17002,
				8
			},
			{
				17003,
				25
			},
			{
				17004,
				30
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
				120
			},
			{
				17990,
				5
			}
		}
	},
	[520] = {
		important = 2,
		destory_gold = 25,
		type = 10,
		group = 520,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 521,
		prev = 0,
		id = 520,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
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
	}
}
