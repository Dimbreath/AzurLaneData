pg = pg or {}
pg.equip_data_template_19 = {
	[1022] = {
		trans_use_gold = 100,
		next = 1023,
		base = 1020,
		restore_gold = 80,
		destory_gold = 36,
		prev = 1021,
		id = 1022,
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
	[1023] = {
		trans_use_gold = 160,
		next = 1024,
		base = 1020,
		restore_gold = 180,
		destory_gold = 61,
		prev = 1022,
		id = 1023,
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
	[1024] = {
		trans_use_gold = 220,
		next = 1025,
		base = 1020,
		restore_gold = 340,
		destory_gold = 101,
		prev = 1023,
		id = 1024,
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
	[1025] = {
		trans_use_gold = 280,
		next = 1026,
		base = 1020,
		restore_gold = 560,
		destory_gold = 156,
		prev = 1024,
		id = 1025,
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
	[1026] = {
		trans_use_gold = 360,
		next = 1027,
		base = 1020,
		restore_gold = 840,
		destory_gold = 226,
		prev = 1025,
		id = 1026,
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
	[1027] = {
		trans_use_gold = 440,
		next = 1028,
		base = 1020,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 1026,
		id = 1027,
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
	[1028] = {
		trans_use_gold = 520,
		next = 1029,
		base = 1020,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 1027,
		id = 1028,
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
	[1029] = {
		trans_use_gold = 600,
		next = 1030,
		base = 1020,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 1028,
		id = 1029,
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
	[1030] = {
		trans_use_gold = 0,
		next = 0,
		base = 1020,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 1029,
		id = 1030,
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
	[1040] = {
		important = 1,
		destory_gold = 25,
		type = 10,
		group = 1040,
		restore_gold = 0,
		trans_use_gold = 30,
		next = 1041,
		prev = 0,
		id = 1040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
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
	[1041] = {
		trans_use_gold = 90,
		next = 1042,
		base = 1040,
		restore_gold = 30,
		destory_gold = 33,
		prev = 1040,
		id = 1041,
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
	[1042] = {
		trans_use_gold = 150,
		next = 1043,
		base = 1040,
		restore_gold = 120,
		destory_gold = 55,
		prev = 1041,
		id = 1042,
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
	[1043] = {
		trans_use_gold = 240,
		next = 1044,
		base = 1040,
		restore_gold = 270,
		destory_gold = 93,
		prev = 1042,
		id = 1043,
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
	[1044] = {
		trans_use_gold = 330,
		next = 1045,
		base = 1040,
		restore_gold = 510,
		destory_gold = 153,
		prev = 1043,
		id = 1044,
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
	},
	[1045] = {
		trans_use_gold = 420,
		next = 1046,
		base = 1040,
		restore_gold = 840,
		destory_gold = 235,
		prev = 1044,
		id = 1045,
		level = 6,
		trans_use_item = {
			{
				17002,
				21
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
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
				15
			},
			{
				17002,
				28
			}
		}
	}
}
