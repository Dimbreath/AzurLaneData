pg = pg or {}
pg.equip_data_template_14 = {
	[801] = {
		trans_use_gold = 60,
		next = 802,
		base = 800,
		restore_gold = 20,
		destory_gold = 21,
		prev = 800,
		id = 801,
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
	[802] = {
		trans_use_gold = 100,
		next = 803,
		base = 800,
		restore_gold = 80,
		destory_gold = 36,
		prev = 801,
		id = 802,
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
	[803] = {
		trans_use_gold = 160,
		next = 804,
		base = 800,
		restore_gold = 180,
		destory_gold = 61,
		prev = 802,
		id = 803,
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
	[804] = {
		trans_use_gold = 220,
		next = 805,
		base = 800,
		restore_gold = 340,
		destory_gold = 101,
		prev = 803,
		id = 804,
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
	[805] = {
		trans_use_gold = 280,
		next = 806,
		base = 800,
		restore_gold = 560,
		destory_gold = 156,
		prev = 804,
		id = 805,
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
	[806] = {
		trans_use_gold = 360,
		next = 807,
		base = 800,
		restore_gold = 840,
		destory_gold = 226,
		prev = 805,
		id = 806,
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
	[807] = {
		trans_use_gold = 440,
		next = 808,
		base = 800,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 806,
		id = 807,
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
	[808] = {
		trans_use_gold = 520,
		next = 809,
		base = 800,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 807,
		id = 808,
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
	[809] = {
		trans_use_gold = 600,
		next = 810,
		base = 800,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 808,
		id = 809,
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
	[810] = {
		trans_use_gold = 0,
		next = 0,
		base = 800,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 809,
		id = 810,
		level = 11,
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
	[820] = {
		important = 2,
		destory_gold = 25,
		type = 10,
		group = 820,
		restore_gold = 0,
		trans_use_gold = 30,
		next = 821,
		prev = 0,
		id = 820,
		equip_limit = 820,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			3,
			4,
			5,
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
	[821] = {
		trans_use_gold = 90,
		next = 822,
		base = 820,
		restore_gold = 30,
		destory_gold = 33,
		prev = 820,
		id = 821,
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
	[822] = {
		trans_use_gold = 150,
		next = 823,
		base = 820,
		restore_gold = 120,
		destory_gold = 55,
		prev = 821,
		id = 822,
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
	},
	[823] = {
		trans_use_gold = 240,
		next = 824,
		base = 820,
		restore_gold = 270,
		destory_gold = 93,
		prev = 822,
		id = 823,
		level = 4,
		trans_use_item = {
			{
				17002,
				12
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17003,
				1
			}
		},
		restore_item = {
			{
				17001,
				15
			}
		}
	},
	[824] = {
		trans_use_gold = 330,
		next = 825,
		base = 820,
		restore_gold = 510,
		destory_gold = 153,
		prev = 823,
		id = 824,
		level = 5,
		trans_use_item = {
			{
				17002,
				16
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
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
				15
			},
			{
				17002,
				12
			}
		}
	}
}
