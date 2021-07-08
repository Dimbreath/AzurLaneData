pg = pg or {}
pg.equip_data_template_320 = {
	[44100] = {
		important = 1,
		destory_gold = 9,
		type = 4,
		group = 44100,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 44101,
		prev = 0,
		id = 44100,
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
	},
	[44101] = {
		trans_use_gold = 60,
		next = 44102,
		base = 44100,
		restore_gold = 20,
		destory_gold = 14,
		prev = 44100,
		id = 44101,
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
	[44102] = {
		trans_use_gold = 100,
		next = 44103,
		base = 44100,
		restore_gold = 80,
		destory_gold = 29,
		prev = 44101,
		id = 44102,
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
	[44103] = {
		trans_use_gold = 160,
		next = 44104,
		base = 44100,
		restore_gold = 180,
		destory_gold = 54,
		prev = 44102,
		id = 44103,
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
	[44104] = {
		trans_use_gold = 220,
		next = 44105,
		base = 44100,
		restore_gold = 340,
		destory_gold = 94,
		prev = 44103,
		id = 44104,
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
	[44105] = {
		trans_use_gold = 280,
		next = 44106,
		base = 44100,
		restore_gold = 560,
		destory_gold = 149,
		prev = 44104,
		id = 44105,
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
	[44106] = {
		trans_use_gold = 0,
		next = 0,
		base = 44100,
		restore_gold = 840,
		destory_gold = 219,
		prev = 44105,
		id = 44106,
		level = 7,
		trans_use_item = {},
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
	},
	[44120] = {
		important = 1,
		destory_gold = 16,
		type = 4,
		group = 44120,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 44121,
		prev = 0,
		id = 44120,
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
				17012,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[44121] = {
		trans_use_gold = 60,
		next = 44122,
		base = 44120,
		restore_gold = 20,
		destory_gold = 21,
		prev = 44120,
		id = 44121,
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
			},
			{
				17012,
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
	[44122] = {
		trans_use_gold = 100,
		next = 44123,
		base = 44120,
		restore_gold = 80,
		destory_gold = 36,
		prev = 44121,
		id = 44122,
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
			},
			{
				17012,
				1
			}
		},
		restore_item = {
			{
				17011,
				4
			}
		}
	},
	[44123] = {
		trans_use_gold = 160,
		next = 44124,
		base = 44120,
		restore_gold = 180,
		destory_gold = 61,
		prev = 44122,
		id = 44123,
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
				3
			},
			{
				17012,
				1
			}
		},
		restore_item = {
			{
				17011,
				9
			}
		}
	},
	[44124] = {
		trans_use_gold = 220,
		next = 44125,
		base = 44120,
		restore_gold = 340,
		destory_gold = 101,
		prev = 44123,
		id = 44124,
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
				3
			},
			{
				17012,
				3
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
	[44125] = {
		trans_use_gold = 280,
		next = 44126,
		base = 44120,
		restore_gold = 560,
		destory_gold = 156,
		prev = 44124,
		id = 44125,
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
				3
			},
			{
				17012,
				6
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
	[44126] = {
		trans_use_gold = 360,
		next = 44127,
		base = 44120,
		restore_gold = 840,
		destory_gold = 226,
		prev = 44125,
		id = 44126,
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
				3
			},
			{
				17012,
				9
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
	},
	[44127] = {
		trans_use_gold = 440,
		next = 44128,
		base = 44120,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 44126,
		id = 44127,
		level = 8,
		trans_use_item = {
			{
				17013,
				22
			}
		},
		destory_item = {
			{
				17011,
				3
			},
			{
				17012,
				9
			},
			{
				17013,
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
				33
			},
			{
				17013,
				18
			}
		}
	}
}
