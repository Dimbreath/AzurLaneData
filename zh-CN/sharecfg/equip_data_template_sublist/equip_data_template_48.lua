pg = pg or {}
pg.equip_data_template_48 = {
	[2620] = {
		important = 1,
		destory_gold = 25,
		type = 10,
		group = 2620,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 2621,
		prev = 0,
		id = 2620,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			4,
			5,
			6,
			7,
			10,
			12,
			13,
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
				17003,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[2621] = {
		trans_use_gold = 60,
		next = 2622,
		base = 2620,
		restore_gold = 20,
		destory_gold = 30,
		prev = 2620,
		id = 2621,
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
	[2622] = {
		trans_use_gold = 100,
		next = 2623,
		base = 2620,
		restore_gold = 80,
		destory_gold = 45,
		prev = 2621,
		id = 2622,
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
	[2623] = {
		trans_use_gold = 160,
		next = 2624,
		base = 2620,
		restore_gold = 180,
		destory_gold = 70,
		prev = 2622,
		id = 2623,
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
	[2624] = {
		trans_use_gold = 220,
		next = 2625,
		base = 2620,
		restore_gold = 340,
		destory_gold = 110,
		prev = 2623,
		id = 2624,
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
	[2625] = {
		trans_use_gold = 280,
		next = 2626,
		base = 2620,
		restore_gold = 560,
		destory_gold = 165,
		prev = 2624,
		id = 2625,
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
	[2626] = {
		trans_use_gold = 360,
		next = 2627,
		base = 2620,
		restore_gold = 840,
		destory_gold = 235,
		prev = 2625,
		id = 2626,
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
	[2627] = {
		trans_use_gold = 440,
		next = 2628,
		base = 2620,
		restore_gold = 1200,
		destory_gold = 325,
		prev = 2626,
		id = 2627,
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
	[2628] = {
		trans_use_gold = 520,
		next = 2629,
		base = 2620,
		restore_gold = 1640,
		destory_gold = 435,
		prev = 2627,
		id = 2628,
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
	[2629] = {
		trans_use_gold = 600,
		next = 2630,
		base = 2620,
		restore_gold = 2160,
		destory_gold = 565,
		prev = 2628,
		id = 2629,
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
	[2630] = {
		trans_use_gold = 0,
		next = 0,
		base = 2620,
		restore_gold = 2760,
		destory_gold = 715,
		prev = 2629,
		id = 2630,
		level = 11,
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
	[2640] = {
		important = 2,
		destory_gold = 36,
		type = 10,
		group = 2640,
		restore_gold = 0,
		trans_use_gold = 60,
		next = 2641,
		prev = 0,
		id = 2640,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			4,
			5,
			6,
			7,
			10,
			12,
			13,
			19
		},
		trans_use_item = {
			{
				17001,
				3
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
	[2641] = {
		trans_use_gold = 180,
		next = 2642,
		base = 2640,
		restore_gold = 60,
		destory_gold = 51,
		prev = 2640,
		id = 2641,
		level = 2,
		trans_use_item = {
			{
				17001,
				9
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
				3
			}
		}
	},
	[2642] = {
		trans_use_gold = 300,
		next = 2643,
		base = 2640,
		restore_gold = 240,
		destory_gold = 96,
		prev = 2641,
		id = 2642,
		level = 3,
		trans_use_item = {
			{
				17001,
				15
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
				12
			}
		}
	},
	[2643] = {
		trans_use_gold = 480,
		next = 2644,
		base = 2640,
		restore_gold = 540,
		destory_gold = 171,
		prev = 2642,
		id = 2643,
		level = 4,
		trans_use_item = {
			{
				17002,
				24
			}
		},
		destory_item = {
			{
				17001,
				7
			},
			{
				17003,
				1
			}
		},
		restore_item = {
			{
				17001,
				27
			}
		}
	}
}
