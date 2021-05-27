pg = pg or {}
pg.equip_data_template_250 = {
	[33049] = {
		trans_use_gold = 600,
		next = 33050,
		base = 33040,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 33048,
		id = 33049,
		level = 10,
		trans_use_item = {
			{
				17013,
				30
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
				16
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
				66
			}
		}
	},
	[33050] = {
		trans_use_gold = 700,
		next = 33051,
		base = 33040,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 33049,
		id = 33050,
		level = 11,
		trans_use_item = {
			{
				17014,
				35
			},
			{
				17990,
				1
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
				24
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
				96
			}
		}
	},
	[33051] = {
		trans_use_gold = 0,
		next = 0,
		base = 33040,
		restore_gold = 3460,
		destory_gold = 881,
		prev = 33050,
		id = 33051,
		level = 12,
		trans_use_item = {},
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
				24
			},
			{
				17014,
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
			},
			{
				17013,
				96
			},
			{
				17014,
				35
			},
			{
				17990,
				1
			}
		}
	},
	[33060] = {
		important = 1,
		destory_gold = 25,
		type = 3,
		group = 33060,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 33061,
		prev = 0,
		id = 33060,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			8,
			17
		},
		trans_use_item = {
			{
				17011,
				1
			}
		},
		destory_item = {
			{
				17013,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {
			33060
		}
	},
	[33061] = {
		trans_use_gold = 60,
		next = 33062,
		base = 33060,
		restore_gold = 20,
		destory_gold = 30,
		prev = 33060,
		id = 33061,
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
				17013,
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
	[33062] = {
		trans_use_gold = 100,
		next = 33063,
		base = 33060,
		restore_gold = 80,
		destory_gold = 45,
		prev = 33061,
		id = 33062,
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
				17013,
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
	[33063] = {
		trans_use_gold = 160,
		next = 33064,
		base = 33060,
		restore_gold = 180,
		destory_gold = 70,
		prev = 33062,
		id = 33063,
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
				17013,
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
	[33064] = {
		trans_use_gold = 220,
		next = 33065,
		base = 33060,
		restore_gold = 340,
		destory_gold = 110,
		prev = 33063,
		id = 33064,
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
				2
			},
			{
				17013,
				1
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
	[33065] = {
		trans_use_gold = 280,
		next = 33066,
		base = 33060,
		restore_gold = 560,
		destory_gold = 165,
		prev = 33064,
		id = 33065,
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
				5
			},
			{
				17013,
				1
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
	[33066] = {
		trans_use_gold = 360,
		next = 33067,
		base = 33060,
		restore_gold = 840,
		destory_gold = 235,
		prev = 33065,
		id = 33066,
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
				8
			},
			{
				17013,
				1
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
	[33067] = {
		trans_use_gold = 440,
		next = 33068,
		base = 33060,
		restore_gold = 1200,
		destory_gold = 325,
		prev = 33066,
		id = 33067,
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
				8
			},
			{
				17013,
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
				33
			},
			{
				17013,
				18
			}
		}
	},
	[33068] = {
		trans_use_gold = 520,
		next = 33069,
		base = 33060,
		restore_gold = 1640,
		destory_gold = 435,
		prev = 33067,
		id = 33068,
		level = 9,
		trans_use_item = {
			{
				17013,
				26
			}
		},
		destory_item = {
			{
				17011,
				3
			},
			{
				17012,
				8
			},
			{
				17013,
				11
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
				40
			}
		}
	},
	[33069] = {
		trans_use_gold = 600,
		next = 33070,
		base = 33060,
		restore_gold = 2160,
		destory_gold = 565,
		prev = 33068,
		id = 33069,
		level = 10,
		trans_use_item = {
			{
				17013,
				30
			}
		},
		destory_item = {
			{
				17011,
				3
			},
			{
				17012,
				8
			},
			{
				17013,
				17
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
				66
			}
		}
	},
	[33070] = {
		trans_use_gold = 800,
		next = 33071,
		base = 33060,
		restore_gold = 2760,
		destory_gold = 715,
		prev = 33069,
		id = 33070,
		level = 11,
		trans_use_item = {
			{
				17014,
				35
			}
		},
		destory_item = {
			{
				17011,
				3
			},
			{
				17012,
				8
			},
			{
				17013,
				25
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
				96
			}
		}
	},
	[33071] = {
		trans_use_gold = 1000,
		next = 33072,
		base = 33060,
		restore_gold = 3560,
		destory_gold = 915,
		prev = 33070,
		id = 33071,
		level = 12,
		trans_use_item = {
			{
				17014,
				40
			}
		},
		destory_item = {
			{
				17011,
				3
			},
			{
				17012,
				8
			},
			{
				17013,
				25
			},
			{
				17014,
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
			},
			{
				17013,
				96
			},
			{
				17014,
				35
			}
		}
	}
}
