pg = pg or {}
pg.equip_data_template_182 = {
	[25020] = {
		important = 1,
		destory_gold = 16,
		type = 5,
		group = 25020,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 25021,
		prev = 0,
		id = 25020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17021,
				1
			}
		},
		destory_item = {
			{
				17022,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {
			25020,
			25021
		}
	},
	[25021] = {
		trans_use_gold = 60,
		next = 25022,
		base = 25020,
		restore_gold = 20,
		destory_gold = 21,
		prev = 25020,
		id = 25021,
		level = 2,
		trans_use_item = {
			{
				17021,
				3
			}
		},
		destory_item = {
			{
				17021,
				1
			},
			{
				17022,
				1
			}
		},
		restore_item = {
			{
				17021,
				1
			}
		}
	},
	[25022] = {
		trans_use_gold = 100,
		next = 25023,
		base = 25020,
		restore_gold = 80,
		destory_gold = 36,
		prev = 25021,
		id = 25022,
		level = 3,
		trans_use_item = {
			{
				17021,
				5
			}
		},
		destory_item = {
			{
				17021,
				2
			},
			{
				17022,
				1
			}
		},
		restore_item = {
			{
				17021,
				4
			}
		}
	},
	[25023] = {
		trans_use_gold = 160,
		next = 25024,
		base = 25020,
		restore_gold = 180,
		destory_gold = 61,
		prev = 25022,
		id = 25023,
		level = 4,
		trans_use_item = {
			{
				17022,
				8
			}
		},
		destory_item = {
			{
				17021,
				3
			},
			{
				17022,
				1
			}
		},
		restore_item = {
			{
				17021,
				9
			}
		}
	},
	[25024] = {
		trans_use_gold = 220,
		next = 25025,
		base = 25020,
		restore_gold = 340,
		destory_gold = 101,
		prev = 25023,
		id = 25024,
		level = 5,
		trans_use_item = {
			{
				17022,
				11
			}
		},
		destory_item = {
			{
				17021,
				3
			},
			{
				17022,
				3
			}
		},
		restore_item = {
			{
				17021,
				9
			},
			{
				17022,
				8
			}
		}
	},
	[25025] = {
		trans_use_gold = 280,
		next = 25026,
		base = 25020,
		restore_gold = 560,
		destory_gold = 156,
		prev = 25024,
		id = 25025,
		level = 6,
		trans_use_item = {
			{
				17022,
				14
			}
		},
		destory_item = {
			{
				17021,
				3
			},
			{
				17022,
				6
			}
		},
		restore_item = {
			{
				17021,
				9
			},
			{
				17022,
				19
			}
		}
	},
	[25026] = {
		trans_use_gold = 360,
		next = 25027,
		base = 25020,
		restore_gold = 840,
		destory_gold = 226,
		prev = 25025,
		id = 25026,
		level = 7,
		trans_use_item = {
			{
				17023,
				18
			}
		},
		destory_item = {
			{
				17021,
				3
			},
			{
				17022,
				9
			}
		},
		restore_item = {
			{
				17021,
				9
			},
			{
				17022,
				33
			}
		}
	},
	[25027] = {
		trans_use_gold = 440,
		next = 25028,
		base = 25020,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 25026,
		id = 25027,
		level = 8,
		trans_use_item = {
			{
				17023,
				22
			}
		},
		destory_item = {
			{
				17021,
				3
			},
			{
				17022,
				9
			},
			{
				17023,
				5
			}
		},
		restore_item = {
			{
				17021,
				9
			},
			{
				17022,
				33
			},
			{
				17023,
				18
			}
		}
	},
	[25028] = {
		trans_use_gold = 520,
		next = 25029,
		base = 25020,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 25027,
		id = 25028,
		level = 9,
		trans_use_item = {
			{
				17023,
				26
			}
		},
		destory_item = {
			{
				17021,
				3
			},
			{
				17022,
				9
			},
			{
				17023,
				10
			}
		},
		restore_item = {
			{
				17021,
				9
			},
			{
				17022,
				33
			},
			{
				17023,
				40
			}
		}
	},
	[25029] = {
		trans_use_gold = 600,
		next = 25030,
		base = 25020,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 25028,
		id = 25029,
		level = 10,
		trans_use_item = {
			{
				17023,
				30
			}
		},
		destory_item = {
			{
				17021,
				3
			},
			{
				17022,
				9
			},
			{
				17023,
				16
			}
		},
		restore_item = {
			{
				17021,
				9
			},
			{
				17022,
				33
			},
			{
				17023,
				66
			}
		}
	},
	[25030] = {
		trans_use_gold = 700,
		next = 25031,
		base = 25020,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 25029,
		id = 25030,
		level = 11,
		trans_use_item = {
			{
				17024,
				35
			},
			{
				17990,
				1
			}
		},
		destory_item = {
			{
				17021,
				3
			},
			{
				17022,
				9
			},
			{
				17023,
				24
			}
		},
		restore_item = {
			{
				17021,
				9
			},
			{
				17022,
				33
			},
			{
				17023,
				96
			}
		}
	},
	[25031] = {
		trans_use_gold = 0,
		next = 0,
		base = 25020,
		restore_gold = 3460,
		destory_gold = 881,
		prev = 25030,
		id = 25031,
		level = 12,
		trans_use_item = {},
		destory_item = {
			{
				17021,
				3
			},
			{
				17022,
				9
			},
			{
				17023,
				24
			},
			{
				17024,
				9
			}
		},
		restore_item = {
			{
				17021,
				9
			},
			{
				17022,
				33
			},
			{
				17023,
				96
			},
			{
				17024,
				35
			},
			{
				17990,
				1
			}
		}
	},
	[25040] = {
		important = 1,
		destory_gold = 25,
		type = 5,
		group = 25040,
		restore_gold = 0,
		trans_use_gold = 30,
		next = 25041,
		prev = 0,
		id = 25040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17021,
				2
			}
		},
		destory_item = {
			{
				17023,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {
			25040,
			25041
		}
	},
	[25041] = {
		trans_use_gold = 90,
		next = 25042,
		base = 25040,
		restore_gold = 30,
		destory_gold = 33,
		prev = 25040,
		id = 25041,
		level = 2,
		trans_use_item = {
			{
				17021,
				5
			}
		},
		destory_item = {
			{
				17021,
				1
			},
			{
				17023,
				1
			}
		},
		restore_item = {
			{
				17021,
				2
			}
		}
	},
	[25042] = {
		trans_use_gold = 150,
		next = 25043,
		base = 25040,
		restore_gold = 120,
		destory_gold = 55,
		prev = 25041,
		id = 25042,
		level = 3,
		trans_use_item = {
			{
				17021,
				8
			}
		},
		destory_item = {
			{
				17021,
				2
			},
			{
				17023,
				1
			}
		},
		restore_item = {
			{
				17021,
				7
			}
		}
	}
}
