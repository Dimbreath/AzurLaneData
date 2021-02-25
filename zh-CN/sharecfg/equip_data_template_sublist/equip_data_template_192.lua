pg = pg or {}
pg.equip_data_template_192 = {
	[25300] = {
		important = 1,
		destory_gold = 25,
		type = 13,
		group = 25300,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 25301,
		prev = 0,
		id = 25300,
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
				17023,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {
			25300
		}
	},
	[25301] = {
		trans_use_gold = 60,
		next = 25302,
		base = 25300,
		restore_gold = 20,
		destory_gold = 30,
		prev = 25300,
		id = 25301,
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
				17023,
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
	[25302] = {
		trans_use_gold = 100,
		next = 25303,
		base = 25300,
		restore_gold = 80,
		destory_gold = 45,
		prev = 25301,
		id = 25302,
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
				17023,
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
	[25303] = {
		trans_use_gold = 160,
		next = 25304,
		base = 25300,
		restore_gold = 180,
		destory_gold = 70,
		prev = 25302,
		id = 25303,
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
				17023,
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
	[25304] = {
		trans_use_gold = 220,
		next = 25305,
		base = 25300,
		restore_gold = 340,
		destory_gold = 110,
		prev = 25303,
		id = 25304,
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
				9
			},
			{
				17022,
				8
			}
		}
	},
	[25305] = {
		trans_use_gold = 280,
		next = 25306,
		base = 25300,
		restore_gold = 560,
		destory_gold = 165,
		prev = 25304,
		id = 25305,
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
				5
			},
			{
				17023,
				1
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
	[25306] = {
		trans_use_gold = 360,
		next = 25307,
		base = 25300,
		restore_gold = 840,
		destory_gold = 235,
		prev = 25305,
		id = 25306,
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
				8
			},
			{
				17023,
				1
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
	[25307] = {
		trans_use_gold = 440,
		next = 25308,
		base = 25300,
		restore_gold = 1200,
		destory_gold = 325,
		prev = 25306,
		id = 25307,
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
				8
			},
			{
				17023,
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
				33
			},
			{
				17023,
				18
			}
		}
	},
	[25308] = {
		trans_use_gold = 520,
		next = 25309,
		base = 25300,
		restore_gold = 1640,
		destory_gold = 435,
		prev = 25307,
		id = 25308,
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
				8
			},
			{
				17023,
				11
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
	[25309] = {
		trans_use_gold = 600,
		next = 25310,
		base = 25300,
		restore_gold = 2160,
		destory_gold = 565,
		prev = 25308,
		id = 25309,
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
				8
			},
			{
				17023,
				17
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
	[25310] = {
		trans_use_gold = 800,
		next = 25311,
		base = 25300,
		restore_gold = 2760,
		destory_gold = 715,
		prev = 25309,
		id = 25310,
		level = 11,
		trans_use_item = {
			{
				17024,
				35
			}
		},
		destory_item = {
			{
				17021,
				3
			},
			{
				17022,
				8
			},
			{
				17023,
				25
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
	[25311] = {
		trans_use_gold = 1000,
		next = 25312,
		base = 25300,
		restore_gold = 3560,
		destory_gold = 915,
		prev = 25310,
		id = 25311,
		level = 12,
		trans_use_item = {
			{
				17024,
				40
			}
		},
		destory_item = {
			{
				17021,
				3
			},
			{
				17022,
				8
			},
			{
				17023,
				25
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
			}
		}
	},
	[25312] = {
		trans_use_gold = 1200,
		next = 25313,
		base = 25300,
		restore_gold = 4560,
		destory_gold = 1165,
		prev = 25311,
		id = 25312,
		level = 13,
		trans_use_item = {
			{
				17024,
				45
			},
			{
				17990,
				5
			}
		},
		destory_item = {
			{
				17021,
				3
			},
			{
				17022,
				8
			},
			{
				17023,
				25
			},
			{
				17024,
				19
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
				75
			}
		}
	},
	[25313] = {
		trans_use_gold = 0,
		next = 0,
		base = 25300,
		restore_gold = 5760,
		destory_gold = 1465,
		prev = 25312,
		id = 25313,
		level = 14,
		trans_use_item = {},
		destory_item = {
			{
				17021,
				3
			},
			{
				17022,
				8
			},
			{
				17023,
				25
			},
			{
				17024,
				30
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
				120
			},
			{
				17990,
				5
			}
		}
	},
	[25800] = {
		important = 2,
		destory_gold = 25,
		type = 14,
		group = 25800,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 25801,
		prev = 0,
		id = 25800,
		equip_limit = 25800,
		level = 1,
		ship_type_forbidden = {
			3,
			4,
			5,
			6,
			7,
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
