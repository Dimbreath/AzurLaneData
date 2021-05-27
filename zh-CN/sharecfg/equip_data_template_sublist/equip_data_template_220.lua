pg = pg or {}
pg.equip_data_template_220 = {
	[28020] = {
		important = 1,
		destory_gold = 9,
		type = 8,
		group = 28020,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 28021,
		prev = 0,
		id = 28020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			10
		},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {
			{
				17041,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[28021] = {
		trans_use_gold = 60,
		next = 28022,
		base = 28020,
		restore_gold = 20,
		destory_gold = 14,
		prev = 28020,
		id = 28021,
		level = 2,
		trans_use_item = {
			{
				17041,
				3
			}
		},
		destory_item = {
			{
				17041,
				2
			}
		},
		restore_item = {
			{
				17041,
				1
			}
		}
	},
	[28022] = {
		trans_use_gold = 100,
		next = 28023,
		base = 28020,
		restore_gold = 80,
		destory_gold = 29,
		prev = 28021,
		id = 28022,
		level = 3,
		trans_use_item = {
			{
				17041,
				5
			}
		},
		destory_item = {
			{
				17041,
				3
			}
		},
		restore_item = {
			{
				17041,
				4
			}
		}
	},
	[28023] = {
		trans_use_gold = 160,
		next = 28024,
		base = 28020,
		restore_gold = 180,
		destory_gold = 54,
		prev = 28022,
		id = 28023,
		level = 4,
		trans_use_item = {
			{
				17042,
				8
			}
		},
		destory_item = {
			{
				17041,
				4
			}
		},
		restore_item = {
			{
				17041,
				9
			}
		}
	},
	[28024] = {
		trans_use_gold = 220,
		next = 28025,
		base = 28020,
		restore_gold = 340,
		destory_gold = 94,
		prev = 28023,
		id = 28024,
		level = 5,
		trans_use_item = {
			{
				17042,
				11
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				2
			}
		},
		restore_item = {
			{
				17041,
				9
			},
			{
				17042,
				8
			}
		}
	},
	[28025] = {
		trans_use_gold = 280,
		next = 28026,
		base = 28020,
		restore_gold = 560,
		destory_gold = 149,
		prev = 28024,
		id = 28025,
		level = 6,
		trans_use_item = {
			{
				17042,
				14
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				5
			}
		},
		restore_item = {
			{
				17041,
				9
			},
			{
				17042,
				19
			}
		}
	},
	[28026] = {
		trans_use_gold = 0,
		next = 0,
		base = 28020,
		restore_gold = 840,
		destory_gold = 219,
		prev = 28025,
		id = 28026,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				8
			}
		},
		restore_item = {
			{
				17041,
				9
			},
			{
				17042,
				33
			}
		}
	},
	[28040] = {
		important = 1,
		destory_gold = 16,
		type = 8,
		group = 28040,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 28041,
		prev = 0,
		id = 28040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			10
		},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {
			{
				17042,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {
			28040
		}
	},
	[28041] = {
		trans_use_gold = 60,
		next = 28042,
		base = 28040,
		restore_gold = 20,
		destory_gold = 21,
		prev = 28040,
		id = 28041,
		level = 2,
		trans_use_item = {
			{
				17041,
				3
			}
		},
		destory_item = {
			{
				17041,
				1
			},
			{
				17042,
				1
			}
		},
		restore_item = {
			{
				17041,
				1
			}
		}
	},
	[28042] = {
		trans_use_gold = 100,
		next = 28043,
		base = 28040,
		restore_gold = 80,
		destory_gold = 36,
		prev = 28041,
		id = 28042,
		level = 3,
		trans_use_item = {
			{
				17041,
				5
			}
		},
		destory_item = {
			{
				17041,
				2
			},
			{
				17042,
				1
			}
		},
		restore_item = {
			{
				17041,
				4
			}
		}
	},
	[28043] = {
		trans_use_gold = 160,
		next = 28044,
		base = 28040,
		restore_gold = 180,
		destory_gold = 61,
		prev = 28042,
		id = 28043,
		level = 4,
		trans_use_item = {
			{
				17042,
				8
			}
		},
		destory_item = {
			{
				17041,
				3
			},
			{
				17042,
				1
			}
		},
		restore_item = {
			{
				17041,
				9
			}
		}
	},
	[28044] = {
		trans_use_gold = 220,
		next = 28045,
		base = 28040,
		restore_gold = 340,
		destory_gold = 101,
		prev = 28043,
		id = 28044,
		level = 5,
		trans_use_item = {
			{
				17042,
				11
			}
		},
		destory_item = {
			{
				17041,
				3
			},
			{
				17042,
				3
			}
		},
		restore_item = {
			{
				17041,
				9
			},
			{
				17042,
				8
			}
		}
	},
	[28045] = {
		trans_use_gold = 280,
		next = 28046,
		base = 28040,
		restore_gold = 560,
		destory_gold = 156,
		prev = 28044,
		id = 28045,
		level = 6,
		trans_use_item = {
			{
				17042,
				14
			}
		},
		destory_item = {
			{
				17041,
				3
			},
			{
				17042,
				6
			}
		},
		restore_item = {
			{
				17041,
				9
			},
			{
				17042,
				19
			}
		}
	},
	[28046] = {
		trans_use_gold = 360,
		next = 28047,
		base = 28040,
		restore_gold = 840,
		destory_gold = 226,
		prev = 28045,
		id = 28046,
		level = 7,
		trans_use_item = {
			{
				17043,
				18
			}
		},
		destory_item = {
			{
				17041,
				3
			},
			{
				17042,
				9
			}
		},
		restore_item = {
			{
				17041,
				9
			},
			{
				17042,
				33
			}
		}
	},
	[28047] = {
		trans_use_gold = 440,
		next = 28048,
		base = 28040,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 28046,
		id = 28047,
		level = 8,
		trans_use_item = {
			{
				17043,
				22
			}
		},
		destory_item = {
			{
				17041,
				3
			},
			{
				17042,
				9
			},
			{
				17043,
				5
			}
		},
		restore_item = {
			{
				17041,
				9
			},
			{
				17042,
				33
			},
			{
				17043,
				18
			}
		}
	}
}
