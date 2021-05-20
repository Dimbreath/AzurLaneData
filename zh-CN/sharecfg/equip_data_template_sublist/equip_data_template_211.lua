pg = pg or {}
pg.equip_data_template_211 = {
	[27020] = {
		important = 1,
		destory_gold = 9,
		type = 7,
		group = 27020,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 27021,
		prev = 0,
		id = 27020,
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
	[27021] = {
		trans_use_gold = 60,
		next = 27022,
		base = 27020,
		restore_gold = 20,
		destory_gold = 14,
		prev = 27020,
		id = 27021,
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
	[27022] = {
		trans_use_gold = 100,
		next = 27023,
		base = 27020,
		restore_gold = 80,
		destory_gold = 29,
		prev = 27021,
		id = 27022,
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
	[27023] = {
		trans_use_gold = 160,
		next = 27024,
		base = 27020,
		restore_gold = 180,
		destory_gold = 54,
		prev = 27022,
		id = 27023,
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
	[27024] = {
		trans_use_gold = 220,
		next = 27025,
		base = 27020,
		restore_gold = 340,
		destory_gold = 94,
		prev = 27023,
		id = 27024,
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
	[27025] = {
		trans_use_gold = 280,
		next = 27026,
		base = 27020,
		restore_gold = 560,
		destory_gold = 149,
		prev = 27024,
		id = 27025,
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
	[27026] = {
		trans_use_gold = 0,
		next = 0,
		base = 27020,
		restore_gold = 840,
		destory_gold = 219,
		prev = 27025,
		id = 27026,
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
	[27040] = {
		important = 1,
		destory_gold = 16,
		type = 7,
		group = 27040,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 27041,
		prev = 0,
		id = 27040,
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
			27040
		}
	},
	[27041] = {
		trans_use_gold = 60,
		next = 27042,
		base = 27040,
		restore_gold = 20,
		destory_gold = 21,
		prev = 27040,
		id = 27041,
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
	[27042] = {
		trans_use_gold = 100,
		next = 27043,
		base = 27040,
		restore_gold = 80,
		destory_gold = 36,
		prev = 27041,
		id = 27042,
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
	[27043] = {
		trans_use_gold = 160,
		next = 27044,
		base = 27040,
		restore_gold = 180,
		destory_gold = 61,
		prev = 27042,
		id = 27043,
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
	[27044] = {
		trans_use_gold = 220,
		next = 27045,
		base = 27040,
		restore_gold = 340,
		destory_gold = 101,
		prev = 27043,
		id = 27044,
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
	[27045] = {
		trans_use_gold = 280,
		next = 27046,
		base = 27040,
		restore_gold = 560,
		destory_gold = 156,
		prev = 27044,
		id = 27045,
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
	[27046] = {
		trans_use_gold = 360,
		next = 27047,
		base = 27040,
		restore_gold = 840,
		destory_gold = 226,
		prev = 27045,
		id = 27046,
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
	[27047] = {
		trans_use_gold = 440,
		next = 27048,
		base = 27040,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 27046,
		id = 27047,
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
