pg = pg or {}
pg.equip_data_template_400 = {
	[91000] = {
		important = 1,
		destory_gold = 25,
		type = 4,
		group = 91000,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 91001,
		prev = 0,
		id = 91000,
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
				17013,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[91001] = {
		trans_use_gold = 60,
		next = 91002,
		base = 91000,
		restore_gold = 20,
		destory_gold = 30,
		prev = 91000,
		id = 91001,
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
	[91002] = {
		trans_use_gold = 100,
		next = 91003,
		base = 91000,
		restore_gold = 80,
		destory_gold = 45,
		prev = 91001,
		id = 91002,
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
	[91003] = {
		trans_use_gold = 160,
		next = 91004,
		base = 91000,
		restore_gold = 180,
		destory_gold = 70,
		prev = 91002,
		id = 91003,
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
	[91004] = {
		trans_use_gold = 220,
		next = 91005,
		base = 91000,
		restore_gold = 340,
		destory_gold = 110,
		prev = 91003,
		id = 91004,
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
	[91005] = {
		trans_use_gold = 280,
		next = 91006,
		base = 91000,
		restore_gold = 560,
		destory_gold = 165,
		prev = 91004,
		id = 91005,
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
	[91006] = {
		trans_use_gold = 360,
		next = 91007,
		base = 91000,
		restore_gold = 840,
		destory_gold = 235,
		prev = 91005,
		id = 91006,
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
	[91007] = {
		trans_use_gold = 440,
		next = 91008,
		base = 91000,
		restore_gold = 1200,
		destory_gold = 325,
		prev = 91006,
		id = 91007,
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
	[91008] = {
		trans_use_gold = 520,
		next = 91009,
		base = 91000,
		restore_gold = 1640,
		destory_gold = 435,
		prev = 91007,
		id = 91008,
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
	[91009] = {
		trans_use_gold = 600,
		next = 91010,
		base = 91000,
		restore_gold = 2160,
		destory_gold = 565,
		prev = 91008,
		id = 91009,
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
	[91010] = {
		trans_use_gold = 800,
		next = 91011,
		base = 91000,
		restore_gold = 2760,
		destory_gold = 715,
		prev = 91009,
		id = 91010,
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
	[91011] = {
		trans_use_gold = 1000,
		next = 91012,
		base = 91000,
		restore_gold = 3560,
		destory_gold = 915,
		prev = 91010,
		id = 91011,
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
	},
	[91012] = {
		trans_use_gold = 1200,
		next = 91013,
		base = 91000,
		restore_gold = 4560,
		destory_gold = 1165,
		prev = 91011,
		id = 91012,
		level = 13,
		trans_use_item = {
			{
				17014,
				45
			},
			{
				17990,
				5
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
				19
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
				75
			}
		}
	},
	[91013] = {
		trans_use_gold = 0,
		next = 0,
		base = 91000,
		restore_gold = 5760,
		destory_gold = 1465,
		prev = 91012,
		id = 91013,
		level = 14,
		trans_use_item = {},
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
				30
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
				120
			},
			{
				17990,
				5
			}
		}
	},
	[95000] = {
		important = 1,
		destory_gold = 9,
		type = 4,
		group = 95000,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95001,
		prev = 0,
		id = 95000,
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
	[95001] = {
		trans_use_gold = 60,
		next = 95002,
		base = 95000,
		restore_gold = 20,
		destory_gold = 14,
		prev = 95000,
		id = 95001,
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
	[95002] = {
		trans_use_gold = 100,
		next = 95003,
		base = 95000,
		restore_gold = 80,
		destory_gold = 29,
		prev = 95001,
		id = 95002,
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
	[95003] = {
		trans_use_gold = 160,
		next = 95004,
		base = 95000,
		restore_gold = 180,
		destory_gold = 54,
		prev = 95002,
		id = 95003,
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
	[95004] = {
		trans_use_gold = 220,
		next = 95005,
		base = 95000,
		restore_gold = 340,
		destory_gold = 94,
		prev = 95003,
		id = 95004,
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
	[95005] = {
		trans_use_gold = 280,
		next = 95006,
		base = 95000,
		restore_gold = 560,
		destory_gold = 149,
		prev = 95004,
		id = 95005,
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
	[95006] = {
		trans_use_gold = 0,
		next = 0,
		base = 95000,
		restore_gold = 840,
		destory_gold = 219,
		prev = 95005,
		id = 95006,
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
	[95020] = {
		important = 1,
		destory_gold = 16,
		type = 4,
		group = 95020,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95021,
		prev = 0,
		id = 95020,
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
	[95021] = {
		trans_use_gold = 60,
		next = 95022,
		base = 95020,
		restore_gold = 20,
		destory_gold = 21,
		prev = 95020,
		id = 95021,
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
	[95022] = {
		trans_use_gold = 100,
		next = 95023,
		base = 95020,
		restore_gold = 80,
		destory_gold = 36,
		prev = 95021,
		id = 95022,
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
	[95023] = {
		trans_use_gold = 160,
		next = 95024,
		base = 95020,
		restore_gold = 180,
		destory_gold = 61,
		prev = 95022,
		id = 95023,
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
	[95024] = {
		trans_use_gold = 220,
		next = 95025,
		base = 95020,
		restore_gold = 340,
		destory_gold = 101,
		prev = 95023,
		id = 95024,
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
	[95025] = {
		trans_use_gold = 280,
		next = 95026,
		base = 95020,
		restore_gold = 560,
		destory_gold = 156,
		prev = 95024,
		id = 95025,
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
	[95026] = {
		trans_use_gold = 360,
		next = 95027,
		base = 95020,
		restore_gold = 840,
		destory_gold = 226,
		prev = 95025,
		id = 95026,
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
	[95027] = {
		trans_use_gold = 440,
		next = 95028,
		base = 95020,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 95026,
		id = 95027,
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
	},
	[95028] = {
		trans_use_gold = 520,
		next = 95029,
		base = 95020,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 95027,
		id = 95028,
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
				9
			},
			{
				17013,
				10
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
	[95029] = {
		trans_use_gold = 600,
		next = 95030,
		base = 95020,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 95028,
		id = 95029,
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
	[95030] = {
		trans_use_gold = 0,
		next = 0,
		base = 95020,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 95029,
		id = 95030,
		level = 11,
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
	[95040] = {
		important = 1,
		destory_gold = 25,
		type = 4,
		group = 95040,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95041,
		prev = 0,
		id = 95040,
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
				17013,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95041] = {
		trans_use_gold = 60,
		next = 95042,
		base = 95040,
		restore_gold = 20,
		destory_gold = 30,
		prev = 95040,
		id = 95041,
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
	[95042] = {
		trans_use_gold = 100,
		next = 95043,
		base = 95040,
		restore_gold = 80,
		destory_gold = 45,
		prev = 95041,
		id = 95042,
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
	[95043] = {
		trans_use_gold = 160,
		next = 95044,
		base = 95040,
		restore_gold = 180,
		destory_gold = 70,
		prev = 95042,
		id = 95043,
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
	[95044] = {
		trans_use_gold = 220,
		next = 95045,
		base = 95040,
		restore_gold = 340,
		destory_gold = 110,
		prev = 95043,
		id = 95044,
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
	[95045] = {
		trans_use_gold = 280,
		next = 95046,
		base = 95040,
		restore_gold = 560,
		destory_gold = 165,
		prev = 95044,
		id = 95045,
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
	[95046] = {
		trans_use_gold = 360,
		next = 95047,
		base = 95040,
		restore_gold = 840,
		destory_gold = 235,
		prev = 95045,
		id = 95046,
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
	[95047] = {
		trans_use_gold = 440,
		next = 95048,
		base = 95040,
		restore_gold = 1200,
		destory_gold = 325,
		prev = 95046,
		id = 95047,
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
	[95048] = {
		trans_use_gold = 520,
		next = 95049,
		base = 95040,
		restore_gold = 1640,
		destory_gold = 435,
		prev = 95047,
		id = 95048,
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
	[95049] = {
		trans_use_gold = 600,
		next = 95050,
		base = 95040,
		restore_gold = 2160,
		destory_gold = 565,
		prev = 95048,
		id = 95049,
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
	[95050] = {
		trans_use_gold = 800,
		next = 95051,
		base = 95040,
		restore_gold = 2760,
		destory_gold = 715,
		prev = 95049,
		id = 95050,
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
	[95051] = {
		trans_use_gold = 1000,
		next = 95052,
		base = 95040,
		restore_gold = 3560,
		destory_gold = 915,
		prev = 95050,
		id = 95051,
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
	},
	[95052] = {
		trans_use_gold = 1200,
		next = 95053,
		base = 95040,
		restore_gold = 4560,
		destory_gold = 1165,
		prev = 95051,
		id = 95052,
		level = 13,
		trans_use_item = {
			{
				17014,
				45
			},
			{
				17990,
				5
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
				19
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
				75
			}
		}
	},
	[95053] = {
		trans_use_gold = 0,
		next = 0,
		base = 95040,
		restore_gold = 5760,
		destory_gold = 1465,
		prev = 95052,
		id = 95053,
		level = 14,
		trans_use_item = {},
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
				30
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
				120
			},
			{
				17990,
				5
			}
		}
	},
	[95100] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 95100,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95101,
		prev = 0,
		id = 95100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17031,
				1
			}
		},
		destory_item = {
			{
				17031,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95101] = {
		trans_use_gold = 60,
		next = 95102,
		base = 95100,
		restore_gold = 20,
		destory_gold = 14,
		prev = 95100,
		id = 95101,
		level = 2,
		trans_use_item = {
			{
				17031,
				3
			}
		},
		destory_item = {
			{
				17031,
				2
			}
		},
		restore_item = {
			{
				17031,
				1
			}
		}
	},
	[95102] = {
		trans_use_gold = 100,
		next = 95103,
		base = 95100,
		restore_gold = 80,
		destory_gold = 29,
		prev = 95101,
		id = 95102,
		level = 3,
		trans_use_item = {
			{
				17031,
				5
			}
		},
		destory_item = {
			{
				17031,
				3
			}
		},
		restore_item = {
			{
				17031,
				4
			}
		}
	},
	[95103] = {
		trans_use_gold = 160,
		next = 95104,
		base = 95100,
		restore_gold = 180,
		destory_gold = 54,
		prev = 95102,
		id = 95103,
		level = 4,
		trans_use_item = {
			{
				17032,
				8
			}
		},
		destory_item = {
			{
				17031,
				4
			}
		},
		restore_item = {
			{
				17031,
				9
			}
		}
	},
	[95104] = {
		trans_use_gold = 220,
		next = 95105,
		base = 95100,
		restore_gold = 340,
		destory_gold = 94,
		prev = 95103,
		id = 95104,
		level = 5,
		trans_use_item = {
			{
				17032,
				11
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				2
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				8
			}
		}
	},
	[95105] = {
		trans_use_gold = 280,
		next = 95106,
		base = 95100,
		restore_gold = 560,
		destory_gold = 149,
		prev = 95104,
		id = 95105,
		level = 6,
		trans_use_item = {
			{
				17032,
				14
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				5
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				19
			}
		}
	},
	[95106] = {
		trans_use_gold = 0,
		next = 0,
		base = 95100,
		restore_gold = 840,
		destory_gold = 219,
		prev = 95105,
		id = 95106,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				8
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			}
		}
	},
	[95120] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 95120,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95121,
		prev = 0,
		id = 95120,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17031,
				1
			}
		},
		destory_item = {
			{
				17032,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95121] = {
		trans_use_gold = 60,
		next = 95122,
		base = 95120,
		restore_gold = 20,
		destory_gold = 21,
		prev = 95120,
		id = 95121,
		level = 2,
		trans_use_item = {
			{
				17031,
				3
			}
		},
		destory_item = {
			{
				17031,
				1
			},
			{
				17032,
				1
			}
		},
		restore_item = {
			{
				17031,
				1
			}
		}
	},
	[95122] = {
		trans_use_gold = 100,
		next = 95123,
		base = 95120,
		restore_gold = 80,
		destory_gold = 36,
		prev = 95121,
		id = 95122,
		level = 3,
		trans_use_item = {
			{
				17031,
				5
			}
		},
		destory_item = {
			{
				17031,
				2
			},
			{
				17032,
				1
			}
		},
		restore_item = {
			{
				17031,
				4
			}
		}
	},
	[95123] = {
		trans_use_gold = 160,
		next = 95124,
		base = 95120,
		restore_gold = 180,
		destory_gold = 61,
		prev = 95122,
		id = 95123,
		level = 4,
		trans_use_item = {
			{
				17032,
				8
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				1
			}
		},
		restore_item = {
			{
				17031,
				9
			}
		}
	},
	[95124] = {
		trans_use_gold = 220,
		next = 95125,
		base = 95120,
		restore_gold = 340,
		destory_gold = 101,
		prev = 95123,
		id = 95124,
		level = 5,
		trans_use_item = {
			{
				17032,
				11
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				3
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				8
			}
		}
	},
	[95125] = {
		trans_use_gold = 280,
		next = 95126,
		base = 95120,
		restore_gold = 560,
		destory_gold = 156,
		prev = 95124,
		id = 95125,
		level = 6,
		trans_use_item = {
			{
				17032,
				14
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				6
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				19
			}
		}
	},
	[95126] = {
		trans_use_gold = 360,
		next = 95127,
		base = 95120,
		restore_gold = 840,
		destory_gold = 226,
		prev = 95125,
		id = 95126,
		level = 7,
		trans_use_item = {
			{
				17033,
				18
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				9
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			}
		}
	},
	[95127] = {
		trans_use_gold = 440,
		next = 95128,
		base = 95120,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 95126,
		id = 95127,
		level = 8,
		trans_use_item = {
			{
				17033,
				22
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				9
			},
			{
				17033,
				5
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				18
			}
		}
	},
	[95128] = {
		trans_use_gold = 520,
		next = 95129,
		base = 95120,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 95127,
		id = 95128,
		level = 9,
		trans_use_item = {
			{
				17033,
				26
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				9
			},
			{
				17033,
				10
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				40
			}
		}
	},
	[95129] = {
		trans_use_gold = 600,
		next = 95130,
		base = 95120,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 95128,
		id = 95129,
		level = 10,
		trans_use_item = {
			{
				17033,
				30
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				9
			},
			{
				17033,
				16
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				66
			}
		}
	},
	[95130] = {
		trans_use_gold = 0,
		next = 0,
		base = 95120,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 95129,
		id = 95130,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				9
			},
			{
				17033,
				24
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				96
			}
		}
	},
	[95140] = {
		important = 1,
		destory_gold = 25,
		type = 6,
		group = 95140,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95141,
		prev = 0,
		id = 95140,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17031,
				1
			}
		},
		destory_item = {
			{
				17033,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95141] = {
		trans_use_gold = 60,
		next = 95142,
		base = 95140,
		restore_gold = 20,
		destory_gold = 30,
		prev = 95140,
		id = 95141,
		level = 2,
		trans_use_item = {
			{
				17031,
				3
			}
		},
		destory_item = {
			{
				17031,
				1
			},
			{
				17033,
				1
			}
		},
		restore_item = {
			{
				17031,
				1
			}
		}
	},
	[95142] = {
		trans_use_gold = 100,
		next = 95143,
		base = 95140,
		restore_gold = 80,
		destory_gold = 45,
		prev = 95141,
		id = 95142,
		level = 3,
		trans_use_item = {
			{
				17031,
				5
			}
		},
		destory_item = {
			{
				17031,
				2
			},
			{
				17033,
				1
			}
		},
		restore_item = {
			{
				17031,
				4
			}
		}
	},
	[95143] = {
		trans_use_gold = 160,
		next = 95144,
		base = 95140,
		restore_gold = 180,
		destory_gold = 70,
		prev = 95142,
		id = 95143,
		level = 4,
		trans_use_item = {
			{
				17032,
				8
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17033,
				1
			}
		},
		restore_item = {
			{
				17031,
				9
			}
		}
	},
	[95144] = {
		trans_use_gold = 220,
		next = 95145,
		base = 95140,
		restore_gold = 340,
		destory_gold = 110,
		prev = 95143,
		id = 95144,
		level = 5,
		trans_use_item = {
			{
				17032,
				11
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				2
			},
			{
				17033,
				1
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				8
			}
		}
	},
	[95145] = {
		trans_use_gold = 280,
		next = 95146,
		base = 95140,
		restore_gold = 560,
		destory_gold = 165,
		prev = 95144,
		id = 95145,
		level = 6,
		trans_use_item = {
			{
				17032,
				14
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				5
			},
			{
				17033,
				1
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				19
			}
		}
	},
	[95146] = {
		trans_use_gold = 360,
		next = 95147,
		base = 95140,
		restore_gold = 840,
		destory_gold = 235,
		prev = 95145,
		id = 95146,
		level = 7,
		trans_use_item = {
			{
				17033,
				18
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				8
			},
			{
				17033,
				1
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			}
		}
	},
	[95147] = {
		trans_use_gold = 440,
		next = 95148,
		base = 95140,
		restore_gold = 1200,
		destory_gold = 325,
		prev = 95146,
		id = 95147,
		level = 8,
		trans_use_item = {
			{
				17033,
				22
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				8
			},
			{
				17033,
				6
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				18
			}
		}
	},
	[95148] = {
		trans_use_gold = 520,
		next = 95149,
		base = 95140,
		restore_gold = 1640,
		destory_gold = 435,
		prev = 95147,
		id = 95148,
		level = 9,
		trans_use_item = {
			{
				17033,
				26
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				8
			},
			{
				17033,
				11
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				40
			}
		}
	},
	[95149] = {
		trans_use_gold = 600,
		next = 95150,
		base = 95140,
		restore_gold = 2160,
		destory_gold = 565,
		prev = 95148,
		id = 95149,
		level = 10,
		trans_use_item = {
			{
				17033,
				30
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				8
			},
			{
				17033,
				17
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				66
			}
		}
	},
	[95150] = {
		trans_use_gold = 800,
		next = 95151,
		base = 95140,
		restore_gold = 2760,
		destory_gold = 715,
		prev = 95149,
		id = 95150,
		level = 11,
		trans_use_item = {
			{
				17034,
				35
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				8
			},
			{
				17033,
				25
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				96
			}
		}
	},
	[95151] = {
		trans_use_gold = 1000,
		next = 95152,
		base = 95140,
		restore_gold = 3560,
		destory_gold = 915,
		prev = 95150,
		id = 95151,
		level = 12,
		trans_use_item = {
			{
				17034,
				40
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				8
			},
			{
				17033,
				25
			},
			{
				17034,
				9
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				96
			},
			{
				17034,
				35
			}
		}
	},
	[95152] = {
		trans_use_gold = 1200,
		next = 95153,
		base = 95140,
		restore_gold = 4560,
		destory_gold = 1165,
		prev = 95151,
		id = 95152,
		level = 13,
		trans_use_item = {
			{
				17034,
				45
			},
			{
				17990,
				5
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				8
			},
			{
				17033,
				25
			},
			{
				17034,
				19
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				96
			},
			{
				17034,
				75
			}
		}
	},
	[95153] = {
		trans_use_gold = 0,
		next = 0,
		base = 95140,
		restore_gold = 5760,
		destory_gold = 1465,
		prev = 95152,
		id = 95153,
		level = 14,
		trans_use_item = {},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				8
			},
			{
				17033,
				25
			},
			{
				17034,
				30
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				96
			},
			{
				17034,
				120
			},
			{
				17990,
				5
			}
		}
	},
	[95200] = {
		important = 1,
		destory_gold = 9,
		type = 3,
		group = 95200,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95201,
		prev = 0,
		id = 95200,
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
				17011,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95201] = {
		trans_use_gold = 60,
		next = 95202,
		base = 95200,
		restore_gold = 20,
		destory_gold = 14,
		prev = 95200,
		id = 95201,
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
	[95202] = {
		trans_use_gold = 100,
		next = 95203,
		base = 95200,
		restore_gold = 80,
		destory_gold = 29,
		prev = 95201,
		id = 95202,
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
	[95203] = {
		trans_use_gold = 160,
		next = 95204,
		base = 95200,
		restore_gold = 180,
		destory_gold = 54,
		prev = 95202,
		id = 95203,
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
	[95204] = {
		trans_use_gold = 220,
		next = 95205,
		base = 95200,
		restore_gold = 340,
		destory_gold = 94,
		prev = 95203,
		id = 95204,
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
	[95205] = {
		trans_use_gold = 280,
		next = 95206,
		base = 95200,
		restore_gold = 560,
		destory_gold = 149,
		prev = 95204,
		id = 95205,
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
	[95206] = {
		trans_use_gold = 0,
		next = 0,
		base = 95200,
		restore_gold = 840,
		destory_gold = 219,
		prev = 95205,
		id = 95206,
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
	[95220] = {
		important = 1,
		destory_gold = 16,
		type = 3,
		group = 95220,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95221,
		prev = 0,
		id = 95220,
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
				17012,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95221] = {
		trans_use_gold = 60,
		next = 95222,
		base = 95220,
		restore_gold = 20,
		destory_gold = 21,
		prev = 95220,
		id = 95221,
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
	[95222] = {
		trans_use_gold = 100,
		next = 95223,
		base = 95220,
		restore_gold = 80,
		destory_gold = 36,
		prev = 95221,
		id = 95222,
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
	[95223] = {
		trans_use_gold = 160,
		next = 95224,
		base = 95220,
		restore_gold = 180,
		destory_gold = 61,
		prev = 95222,
		id = 95223,
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
	[95224] = {
		trans_use_gold = 220,
		next = 95225,
		base = 95220,
		restore_gold = 340,
		destory_gold = 101,
		prev = 95223,
		id = 95224,
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
	[95225] = {
		trans_use_gold = 280,
		next = 95226,
		base = 95220,
		restore_gold = 560,
		destory_gold = 156,
		prev = 95224,
		id = 95225,
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
	[95226] = {
		trans_use_gold = 360,
		next = 95227,
		base = 95220,
		restore_gold = 840,
		destory_gold = 226,
		prev = 95225,
		id = 95226,
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
	[95227] = {
		trans_use_gold = 440,
		next = 95228,
		base = 95220,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 95226,
		id = 95227,
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
	},
	[95228] = {
		trans_use_gold = 520,
		next = 95229,
		base = 95220,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 95227,
		id = 95228,
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
				9
			},
			{
				17013,
				10
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
	[95229] = {
		trans_use_gold = 600,
		next = 95230,
		base = 95220,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 95228,
		id = 95229,
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
	[95230] = {
		trans_use_gold = 0,
		next = 0,
		base = 95220,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 95229,
		id = 95230,
		level = 11,
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
	[95240] = {
		important = 1,
		destory_gold = 25,
		type = 3,
		group = 95240,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95241,
		prev = 0,
		id = 95240,
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
		upgrade_formula_id = {}
	},
	[95241] = {
		trans_use_gold = 60,
		next = 95242,
		base = 95240,
		restore_gold = 20,
		destory_gold = 30,
		prev = 95240,
		id = 95241,
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
	[95242] = {
		trans_use_gold = 100,
		next = 95243,
		base = 95240,
		restore_gold = 80,
		destory_gold = 45,
		prev = 95241,
		id = 95242,
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
	[95243] = {
		trans_use_gold = 160,
		next = 95244,
		base = 95240,
		restore_gold = 180,
		destory_gold = 70,
		prev = 95242,
		id = 95243,
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
	[95244] = {
		trans_use_gold = 220,
		next = 95245,
		base = 95240,
		restore_gold = 340,
		destory_gold = 110,
		prev = 95243,
		id = 95244,
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
	[95245] = {
		trans_use_gold = 280,
		next = 95246,
		base = 95240,
		restore_gold = 560,
		destory_gold = 165,
		prev = 95244,
		id = 95245,
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
	[95246] = {
		trans_use_gold = 360,
		next = 95247,
		base = 95240,
		restore_gold = 840,
		destory_gold = 235,
		prev = 95245,
		id = 95246,
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
	[95247] = {
		trans_use_gold = 440,
		next = 95248,
		base = 95240,
		restore_gold = 1200,
		destory_gold = 325,
		prev = 95246,
		id = 95247,
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
	[95248] = {
		trans_use_gold = 520,
		next = 95249,
		base = 95240,
		restore_gold = 1640,
		destory_gold = 435,
		prev = 95247,
		id = 95248,
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
	[95249] = {
		trans_use_gold = 600,
		next = 95250,
		base = 95240,
		restore_gold = 2160,
		destory_gold = 565,
		prev = 95248,
		id = 95249,
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
	[95250] = {
		trans_use_gold = 800,
		next = 95251,
		base = 95240,
		restore_gold = 2760,
		destory_gold = 715,
		prev = 95249,
		id = 95250,
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
	[95251] = {
		trans_use_gold = 1000,
		next = 95252,
		base = 95240,
		restore_gold = 3560,
		destory_gold = 915,
		prev = 95250,
		id = 95251,
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
	},
	[95252] = {
		trans_use_gold = 1200,
		next = 95253,
		base = 95240,
		restore_gold = 4560,
		destory_gold = 1165,
		prev = 95251,
		id = 95252,
		level = 13,
		trans_use_item = {
			{
				17014,
				45
			},
			{
				17990,
				5
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
				19
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
				75
			}
		}
	},
	[95253] = {
		trans_use_gold = 0,
		next = 0,
		base = 95240,
		restore_gold = 5760,
		destory_gold = 1465,
		prev = 95252,
		id = 95253,
		level = 14,
		trans_use_item = {},
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
				30
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
				120
			},
			{
				17990,
				5
			}
		}
	},
	[95300] = {
		important = 1,
		destory_gold = 4,
		type = 3,
		group = 95300,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95301,
		prev = 0,
		id = 95300,
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
		destory_item = {},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95301] = {
		trans_use_gold = 60,
		next = 95302,
		base = 95300,
		restore_gold = 20,
		destory_gold = 9,
		prev = 95300,
		id = 95301,
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
			}
		},
		restore_item = {
			{
				17011,
				1
			}
		}
	},
	[95302] = {
		trans_use_gold = 100,
		next = 95303,
		base = 95300,
		restore_gold = 80,
		destory_gold = 24,
		prev = 95301,
		id = 95302,
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
			}
		},
		restore_item = {
			{
				17011,
				4
			}
		}
	},
	[95303] = {
		trans_use_gold = 0,
		next = 0,
		base = 95300,
		restore_gold = 180,
		destory_gold = 49,
		prev = 95302,
		id = 95303,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				3
			}
		},
		restore_item = {
			{
				17011,
				9
			}
		}
	},
	[95320] = {
		important = 1,
		destory_gold = 9,
		type = 3,
		group = 95320,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95321,
		prev = 0,
		id = 95320,
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
				17011,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95321] = {
		trans_use_gold = 60,
		next = 95322,
		base = 95320,
		restore_gold = 20,
		destory_gold = 14,
		prev = 95320,
		id = 95321,
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
	[95322] = {
		trans_use_gold = 100,
		next = 95323,
		base = 95320,
		restore_gold = 80,
		destory_gold = 29,
		prev = 95321,
		id = 95322,
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
	[95323] = {
		trans_use_gold = 160,
		next = 95324,
		base = 95320,
		restore_gold = 180,
		destory_gold = 54,
		prev = 95322,
		id = 95323,
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
	[95324] = {
		trans_use_gold = 220,
		next = 95325,
		base = 95320,
		restore_gold = 340,
		destory_gold = 94,
		prev = 95323,
		id = 95324,
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
	[95325] = {
		trans_use_gold = 280,
		next = 95326,
		base = 95320,
		restore_gold = 560,
		destory_gold = 149,
		prev = 95324,
		id = 95325,
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
	[95326] = {
		trans_use_gold = 0,
		next = 0,
		base = 95320,
		restore_gold = 840,
		destory_gold = 219,
		prev = 95325,
		id = 95326,
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
	[95340] = {
		important = 1,
		destory_gold = 16,
		type = 3,
		group = 95340,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95341,
		prev = 0,
		id = 95340,
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
				17012,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95341] = {
		trans_use_gold = 60,
		next = 95342,
		base = 95340,
		restore_gold = 20,
		destory_gold = 21,
		prev = 95340,
		id = 95341,
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
	[95342] = {
		trans_use_gold = 100,
		next = 95343,
		base = 95340,
		restore_gold = 80,
		destory_gold = 36,
		prev = 95341,
		id = 95342,
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
	[95343] = {
		trans_use_gold = 160,
		next = 95344,
		base = 95340,
		restore_gold = 180,
		destory_gold = 61,
		prev = 95342,
		id = 95343,
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
	[95344] = {
		trans_use_gold = 220,
		next = 95345,
		base = 95340,
		restore_gold = 340,
		destory_gold = 101,
		prev = 95343,
		id = 95344,
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
	[95345] = {
		trans_use_gold = 280,
		next = 95346,
		base = 95340,
		restore_gold = 560,
		destory_gold = 156,
		prev = 95344,
		id = 95345,
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
	[95346] = {
		trans_use_gold = 360,
		next = 95347,
		base = 95340,
		restore_gold = 840,
		destory_gold = 226,
		prev = 95345,
		id = 95346,
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
	[95347] = {
		trans_use_gold = 440,
		next = 95348,
		base = 95340,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 95346,
		id = 95347,
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
	},
	[95348] = {
		trans_use_gold = 520,
		next = 95349,
		base = 95340,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 95347,
		id = 95348,
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
				9
			},
			{
				17013,
				10
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
	[95349] = {
		trans_use_gold = 600,
		next = 95350,
		base = 95340,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 95348,
		id = 95349,
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
	[95350] = {
		trans_use_gold = 700,
		next = 95351,
		base = 95340,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 95349,
		id = 95350,
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
	[95351] = {
		trans_use_gold = 0,
		next = 0,
		base = 95340,
		restore_gold = 3460,
		destory_gold = 881,
		prev = 95350,
		id = 95351,
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
	[95400] = {
		important = 1,
		destory_gold = 4,
		type = 1,
		group = 95400,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95401,
		prev = 0,
		id = 95400,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17011,
				1
			}
		},
		destory_item = {},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95401] = {
		trans_use_gold = 60,
		next = 95402,
		base = 95400,
		restore_gold = 20,
		destory_gold = 9,
		prev = 95400,
		id = 95401,
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
			}
		},
		restore_item = {
			{
				17011,
				1
			}
		}
	},
	[95402] = {
		trans_use_gold = 100,
		next = 95403,
		base = 95400,
		restore_gold = 80,
		destory_gold = 24,
		prev = 95401,
		id = 95402,
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
			}
		},
		restore_item = {
			{
				17011,
				4
			}
		}
	},
	[95403] = {
		trans_use_gold = 0,
		next = 0,
		base = 95400,
		restore_gold = 180,
		destory_gold = 49,
		prev = 95402,
		id = 95403,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				3
			}
		},
		restore_item = {
			{
				17011,
				9
			}
		}
	},
	[95420] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 95420,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95421,
		prev = 0,
		id = 95420,
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
	[95421] = {
		trans_use_gold = 60,
		next = 95422,
		base = 95420,
		restore_gold = 20,
		destory_gold = 14,
		prev = 95420,
		id = 95421,
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
	[95422] = {
		trans_use_gold = 100,
		next = 95423,
		base = 95420,
		restore_gold = 80,
		destory_gold = 29,
		prev = 95421,
		id = 95422,
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
	[95423] = {
		trans_use_gold = 160,
		next = 95424,
		base = 95420,
		restore_gold = 180,
		destory_gold = 54,
		prev = 95422,
		id = 95423,
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
	[95424] = {
		trans_use_gold = 220,
		next = 95425,
		base = 95420,
		restore_gold = 340,
		destory_gold = 94,
		prev = 95423,
		id = 95424,
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
	[95425] = {
		trans_use_gold = 280,
		next = 95426,
		base = 95420,
		restore_gold = 560,
		destory_gold = 149,
		prev = 95424,
		id = 95425,
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
	[95426] = {
		trans_use_gold = 0,
		next = 0,
		base = 95420,
		restore_gold = 840,
		destory_gold = 219,
		prev = 95425,
		id = 95426,
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
	[95440] = {
		important = 1,
		destory_gold = 16,
		type = 1,
		group = 95440,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95441,
		prev = 0,
		id = 95440,
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
	[95441] = {
		trans_use_gold = 60,
		next = 95442,
		base = 95440,
		restore_gold = 20,
		destory_gold = 21,
		prev = 95440,
		id = 95441,
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
	[95442] = {
		trans_use_gold = 100,
		next = 95443,
		base = 95440,
		restore_gold = 80,
		destory_gold = 36,
		prev = 95441,
		id = 95442,
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
	[95443] = {
		trans_use_gold = 160,
		next = 95444,
		base = 95440,
		restore_gold = 180,
		destory_gold = 61,
		prev = 95442,
		id = 95443,
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
	[95444] = {
		trans_use_gold = 220,
		next = 95445,
		base = 95440,
		restore_gold = 340,
		destory_gold = 101,
		prev = 95443,
		id = 95444,
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
	[95445] = {
		trans_use_gold = 280,
		next = 95446,
		base = 95440,
		restore_gold = 560,
		destory_gold = 156,
		prev = 95444,
		id = 95445,
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
	[95446] = {
		trans_use_gold = 360,
		next = 95447,
		base = 95440,
		restore_gold = 840,
		destory_gold = 226,
		prev = 95445,
		id = 95446,
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
	[95447] = {
		trans_use_gold = 440,
		next = 95448,
		base = 95440,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 95446,
		id = 95447,
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
	},
	[95448] = {
		trans_use_gold = 520,
		next = 95449,
		base = 95440,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 95447,
		id = 95448,
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
				9
			},
			{
				17013,
				10
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
	[95449] = {
		trans_use_gold = 600,
		next = 95450,
		base = 95440,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 95448,
		id = 95449,
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
	[95450] = {
		trans_use_gold = 700,
		next = 95451,
		base = 95440,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 95449,
		id = 95450,
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
	[95451] = {
		trans_use_gold = 0,
		next = 0,
		base = 95440,
		restore_gold = 3460,
		destory_gold = 881,
		prev = 95450,
		id = 95451,
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
	[95460] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 95460,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95461,
		prev = 0,
		id = 95460,
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
	[95461] = {
		trans_use_gold = 60,
		next = 95462,
		base = 95460,
		restore_gold = 20,
		destory_gold = 14,
		prev = 95460,
		id = 95461,
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
	[95462] = {
		trans_use_gold = 100,
		next = 95463,
		base = 95460,
		restore_gold = 80,
		destory_gold = 29,
		prev = 95461,
		id = 95462,
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
	[95463] = {
		trans_use_gold = 160,
		next = 95464,
		base = 95460,
		restore_gold = 180,
		destory_gold = 54,
		prev = 95462,
		id = 95463,
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
	[95464] = {
		trans_use_gold = 220,
		next = 95465,
		base = 95460,
		restore_gold = 340,
		destory_gold = 94,
		prev = 95463,
		id = 95464,
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
	[95465] = {
		trans_use_gold = 280,
		next = 95466,
		base = 95460,
		restore_gold = 560,
		destory_gold = 149,
		prev = 95464,
		id = 95465,
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
	[95466] = {
		trans_use_gold = 360,
		next = 95467,
		base = 95460,
		restore_gold = 840,
		destory_gold = 219,
		prev = 95465,
		id = 95466,
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
	[95467] = {
		trans_use_gold = 0,
		next = 0,
		base = 95460,
		restore_gold = 1200,
		destory_gold = 309,
		prev = 95466,
		id = 95467,
		level = 8,
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
			},
			{
				17013,
				18
			}
		}
	},
	[95480] = {
		important = 1,
		destory_gold = 9,
		type = 4,
		group = 95480,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95481,
		prev = 0,
		id = 95480,
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
	[95481] = {
		trans_use_gold = 60,
		next = 95482,
		base = 95480,
		restore_gold = 20,
		destory_gold = 14,
		prev = 95480,
		id = 95481,
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
	[95482] = {
		trans_use_gold = 100,
		next = 95483,
		base = 95480,
		restore_gold = 80,
		destory_gold = 29,
		prev = 95481,
		id = 95482,
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
	[95483] = {
		trans_use_gold = 160,
		next = 95484,
		base = 95480,
		restore_gold = 180,
		destory_gold = 54,
		prev = 95482,
		id = 95483,
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
	[95484] = {
		trans_use_gold = 220,
		next = 95485,
		base = 95480,
		restore_gold = 340,
		destory_gold = 94,
		prev = 95483,
		id = 95484,
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
	[95485] = {
		trans_use_gold = 280,
		next = 95486,
		base = 95480,
		restore_gold = 560,
		destory_gold = 149,
		prev = 95484,
		id = 95485,
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
	[95486] = {
		trans_use_gold = 360,
		next = 95487,
		base = 95480,
		restore_gold = 840,
		destory_gold = 219,
		prev = 95485,
		id = 95486,
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
	[95487] = {
		trans_use_gold = 0,
		next = 0,
		base = 95480,
		restore_gold = 1200,
		destory_gold = 309,
		prev = 95486,
		id = 95487,
		level = 8,
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
			},
			{
				17013,
				18
			}
		}
	},
	[95500] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 95500,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95501,
		prev = 0,
		id = 95500,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17031,
				1
			}
		},
		destory_item = {},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95501] = {
		trans_use_gold = 60,
		next = 95502,
		base = 95500,
		restore_gold = 20,
		destory_gold = 9,
		prev = 95500,
		id = 95501,
		level = 2,
		trans_use_item = {
			{
				17031,
				3
			}
		},
		destory_item = {
			{
				17031,
				1
			}
		},
		restore_item = {
			{
				17031,
				1
			}
		}
	},
	[95502] = {
		trans_use_gold = 100,
		next = 95503,
		base = 95500,
		restore_gold = 80,
		destory_gold = 24,
		prev = 95501,
		id = 95502,
		level = 3,
		trans_use_item = {
			{
				17031,
				5
			}
		},
		destory_item = {
			{
				17031,
				2
			}
		},
		restore_item = {
			{
				17031,
				4
			}
		}
	},
	[95503] = {
		trans_use_gold = 0,
		next = 0,
		base = 95500,
		restore_gold = 180,
		destory_gold = 49,
		prev = 95502,
		id = 95503,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17031,
				3
			}
		},
		restore_item = {
			{
				17031,
				9
			}
		}
	},
	[95520] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 95520,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95521,
		prev = 0,
		id = 95520,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17031,
				1
			}
		},
		destory_item = {
			{
				17031,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95521] = {
		trans_use_gold = 60,
		next = 95522,
		base = 95520,
		restore_gold = 20,
		destory_gold = 14,
		prev = 95520,
		id = 95521,
		level = 2,
		trans_use_item = {
			{
				17031,
				3
			}
		},
		destory_item = {
			{
				17031,
				2
			}
		},
		restore_item = {
			{
				17031,
				1
			}
		}
	},
	[95522] = {
		trans_use_gold = 100,
		next = 95523,
		base = 95520,
		restore_gold = 80,
		destory_gold = 29,
		prev = 95521,
		id = 95522,
		level = 3,
		trans_use_item = {
			{
				17031,
				5
			}
		},
		destory_item = {
			{
				17031,
				3
			}
		},
		restore_item = {
			{
				17031,
				4
			}
		}
	},
	[95523] = {
		trans_use_gold = 160,
		next = 95524,
		base = 95520,
		restore_gold = 180,
		destory_gold = 54,
		prev = 95522,
		id = 95523,
		level = 4,
		trans_use_item = {
			{
				17032,
				8
			}
		},
		destory_item = {
			{
				17031,
				4
			}
		},
		restore_item = {
			{
				17031,
				9
			}
		}
	},
	[95524] = {
		trans_use_gold = 220,
		next = 95525,
		base = 95520,
		restore_gold = 340,
		destory_gold = 94,
		prev = 95523,
		id = 95524,
		level = 5,
		trans_use_item = {
			{
				17032,
				11
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				2
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				8
			}
		}
	},
	[95525] = {
		trans_use_gold = 280,
		next = 95526,
		base = 95520,
		restore_gold = 560,
		destory_gold = 149,
		prev = 95524,
		id = 95525,
		level = 6,
		trans_use_item = {
			{
				17032,
				14
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				5
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				19
			}
		}
	},
	[95526] = {
		trans_use_gold = 0,
		next = 0,
		base = 95520,
		restore_gold = 840,
		destory_gold = 219,
		prev = 95525,
		id = 95526,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				8
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			}
		}
	},
	[95540] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 95540,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95541,
		prev = 0,
		id = 95540,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17031,
				1
			}
		},
		destory_item = {
			{
				17032,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95541] = {
		trans_use_gold = 60,
		next = 95542,
		base = 95540,
		restore_gold = 20,
		destory_gold = 21,
		prev = 95540,
		id = 95541,
		level = 2,
		trans_use_item = {
			{
				17031,
				3
			}
		},
		destory_item = {
			{
				17031,
				1
			},
			{
				17032,
				1
			}
		},
		restore_item = {
			{
				17031,
				1
			}
		}
	},
	[95542] = {
		trans_use_gold = 100,
		next = 95543,
		base = 95540,
		restore_gold = 80,
		destory_gold = 36,
		prev = 95541,
		id = 95542,
		level = 3,
		trans_use_item = {
			{
				17031,
				5
			}
		},
		destory_item = {
			{
				17031,
				2
			},
			{
				17032,
				1
			}
		},
		restore_item = {
			{
				17031,
				4
			}
		}
	},
	[95543] = {
		trans_use_gold = 160,
		next = 95544,
		base = 95540,
		restore_gold = 180,
		destory_gold = 61,
		prev = 95542,
		id = 95543,
		level = 4,
		trans_use_item = {
			{
				17032,
				8
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				1
			}
		},
		restore_item = {
			{
				17031,
				9
			}
		}
	},
	[95544] = {
		trans_use_gold = 220,
		next = 95545,
		base = 95540,
		restore_gold = 340,
		destory_gold = 101,
		prev = 95543,
		id = 95544,
		level = 5,
		trans_use_item = {
			{
				17032,
				11
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				3
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				8
			}
		}
	},
	[95545] = {
		trans_use_gold = 280,
		next = 95546,
		base = 95540,
		restore_gold = 560,
		destory_gold = 156,
		prev = 95544,
		id = 95545,
		level = 6,
		trans_use_item = {
			{
				17032,
				14
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				6
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				19
			}
		}
	},
	[95546] = {
		trans_use_gold = 360,
		next = 95547,
		base = 95540,
		restore_gold = 840,
		destory_gold = 226,
		prev = 95545,
		id = 95546,
		level = 7,
		trans_use_item = {
			{
				17033,
				18
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				9
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			}
		}
	},
	[95547] = {
		trans_use_gold = 440,
		next = 95548,
		base = 95540,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 95546,
		id = 95547,
		level = 8,
		trans_use_item = {
			{
				17033,
				22
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				9
			},
			{
				17033,
				5
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				18
			}
		}
	},
	[95548] = {
		trans_use_gold = 520,
		next = 95549,
		base = 95540,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 95547,
		id = 95548,
		level = 9,
		trans_use_item = {
			{
				17033,
				26
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				9
			},
			{
				17033,
				10
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				40
			}
		}
	},
	[95549] = {
		trans_use_gold = 600,
		next = 95550,
		base = 95540,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 95548,
		id = 95549,
		level = 10,
		trans_use_item = {
			{
				17033,
				30
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				9
			},
			{
				17033,
				16
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				66
			}
		}
	},
	[95550] = {
		trans_use_gold = 700,
		next = 95551,
		base = 95540,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 95549,
		id = 95550,
		level = 11,
		trans_use_item = {
			{
				17034,
				35
			},
			{
				17990,
				1
			}
		},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				9
			},
			{
				17033,
				24
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				96
			}
		}
	},
	[95551] = {
		trans_use_gold = 0,
		next = 0,
		base = 95540,
		restore_gold = 3460,
		destory_gold = 881,
		prev = 95550,
		id = 95551,
		level = 12,
		trans_use_item = {},
		destory_item = {
			{
				17031,
				3
			},
			{
				17032,
				9
			},
			{
				17033,
				24
			},
			{
				17034,
				9
			}
		},
		restore_item = {
			{
				17031,
				9
			},
			{
				17032,
				33
			},
			{
				17033,
				96
			},
			{
				17034,
				35
			},
			{
				17990,
				1
			}
		}
	},
	[95560] = {
		important = 1,
		destory_gold = 4,
		type = 1,
		group = 95560,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95561,
		prev = 0,
		id = 95560,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17011,
				1
			}
		},
		destory_item = {},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95561] = {
		trans_use_gold = 60,
		next = 95562,
		base = 95560,
		restore_gold = 20,
		destory_gold = 9,
		prev = 95560,
		id = 95561,
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
			}
		},
		restore_item = {
			{
				17011,
				1
			}
		}
	},
	[95562] = {
		trans_use_gold = 100,
		next = 95563,
		base = 95560,
		restore_gold = 80,
		destory_gold = 24,
		prev = 95561,
		id = 95562,
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
			}
		},
		restore_item = {
			{
				17011,
				4
			}
		}
	},
	[95563] = {
		trans_use_gold = 0,
		next = 0,
		base = 95560,
		restore_gold = 180,
		destory_gold = 49,
		prev = 95562,
		id = 95563,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				3
			}
		},
		restore_item = {
			{
				17011,
				9
			}
		}
	},
	[95600] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 95600,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95601,
		prev = 0,
		id = 95600,
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
	[95601] = {
		trans_use_gold = 60,
		next = 95602,
		base = 95600,
		restore_gold = 20,
		destory_gold = 14,
		prev = 95600,
		id = 95601,
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
	[95602] = {
		trans_use_gold = 100,
		next = 95603,
		base = 95600,
		restore_gold = 80,
		destory_gold = 29,
		prev = 95601,
		id = 95602,
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
	[95603] = {
		trans_use_gold = 160,
		next = 95604,
		base = 95600,
		restore_gold = 180,
		destory_gold = 54,
		prev = 95602,
		id = 95603,
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
	[95604] = {
		trans_use_gold = 220,
		next = 95605,
		base = 95600,
		restore_gold = 340,
		destory_gold = 94,
		prev = 95603,
		id = 95604,
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
	[95605] = {
		trans_use_gold = 280,
		next = 95606,
		base = 95600,
		restore_gold = 560,
		destory_gold = 149,
		prev = 95604,
		id = 95605,
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
	[95606] = {
		trans_use_gold = 0,
		next = 0,
		base = 95600,
		restore_gold = 840,
		destory_gold = 219,
		prev = 95605,
		id = 95606,
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
	[95640] = {
		important = 1,
		destory_gold = 25,
		type = 2,
		group = 95640,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95641,
		prev = 0,
		id = 95640,
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
				17013,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95641] = {
		trans_use_gold = 60,
		next = 95642,
		base = 95640,
		restore_gold = 20,
		destory_gold = 30,
		prev = 95640,
		id = 95641,
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
	[95642] = {
		trans_use_gold = 100,
		next = 95643,
		base = 95640,
		restore_gold = 80,
		destory_gold = 45,
		prev = 95641,
		id = 95642,
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
	[95643] = {
		trans_use_gold = 160,
		next = 95644,
		base = 95640,
		restore_gold = 180,
		destory_gold = 70,
		prev = 95642,
		id = 95643,
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
	[95644] = {
		trans_use_gold = 220,
		next = 95645,
		base = 95640,
		restore_gold = 340,
		destory_gold = 110,
		prev = 95643,
		id = 95644,
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
	[95645] = {
		trans_use_gold = 280,
		next = 95646,
		base = 95640,
		restore_gold = 560,
		destory_gold = 165,
		prev = 95644,
		id = 95645,
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
	[95646] = {
		trans_use_gold = 360,
		next = 95647,
		base = 95640,
		restore_gold = 840,
		destory_gold = 235,
		prev = 95645,
		id = 95646,
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
	[95647] = {
		trans_use_gold = 440,
		next = 95648,
		base = 95640,
		restore_gold = 1200,
		destory_gold = 325,
		prev = 95646,
		id = 95647,
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
	[95648] = {
		trans_use_gold = 520,
		next = 95649,
		base = 95640,
		restore_gold = 1640,
		destory_gold = 435,
		prev = 95647,
		id = 95648,
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
	[95649] = {
		trans_use_gold = 600,
		next = 95650,
		base = 95640,
		restore_gold = 2160,
		destory_gold = 565,
		prev = 95648,
		id = 95649,
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
	[95650] = {
		trans_use_gold = 800,
		next = 95651,
		base = 95640,
		restore_gold = 2760,
		destory_gold = 715,
		prev = 95649,
		id = 95650,
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
	[95651] = {
		trans_use_gold = 1000,
		next = 95652,
		base = 95640,
		restore_gold = 3560,
		destory_gold = 915,
		prev = 95650,
		id = 95651,
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
	},
	[95652] = {
		trans_use_gold = 1200,
		next = 95653,
		base = 95640,
		restore_gold = 4560,
		destory_gold = 1165,
		prev = 95651,
		id = 95652,
		level = 13,
		trans_use_item = {
			{
				17014,
				45
			},
			{
				17990,
				5
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
				19
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
				75
			}
		}
	},
	[95653] = {
		trans_use_gold = 0,
		next = 0,
		base = 95640,
		restore_gold = 5760,
		destory_gold = 1465,
		prev = 95652,
		id = 95653,
		level = 14,
		trans_use_item = {},
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
				30
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
				120
			},
			{
				17990,
				5
			}
		}
	},
	[95700] = {
		important = 1,
		destory_gold = 9,
		type = 13,
		group = 95700,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95701,
		prev = 0,
		id = 95700,
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
				17021,
				1
			}
		},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95701] = {
		trans_use_gold = 60,
		next = 95702,
		base = 95700,
		restore_gold = 20,
		destory_gold = 14,
		prev = 95700,
		id = 95701,
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
				2
			}
		},
		restore_item = {
			{
				17021,
				1
			}
		}
	},
	[95702] = {
		trans_use_gold = 100,
		next = 95703,
		base = 95700,
		restore_gold = 80,
		destory_gold = 29,
		prev = 95701,
		id = 95702,
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
				3
			}
		},
		restore_item = {
			{
				17021,
				4
			}
		}
	},
	[95703] = {
		trans_use_gold = 160,
		next = 95704,
		base = 95700,
		restore_gold = 180,
		destory_gold = 54,
		prev = 95702,
		id = 95703,
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
				4
			}
		},
		restore_item = {
			{
				17021,
				9
			}
		}
	},
	[95704] = {
		trans_use_gold = 220,
		next = 95705,
		base = 95700,
		restore_gold = 340,
		destory_gold = 94,
		prev = 95703,
		id = 95704,
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
				4
			},
			{
				17022,
				2
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
	[95705] = {
		trans_use_gold = 280,
		next = 95706,
		base = 95700,
		restore_gold = 560,
		destory_gold = 149,
		prev = 95704,
		id = 95705,
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
				4
			},
			{
				17022,
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
				19
			}
		}
	},
	[95706] = {
		trans_use_gold = 0,
		next = 0,
		base = 95700,
		restore_gold = 840,
		destory_gold = 219,
		prev = 95705,
		id = 95706,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
				8
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
	[95720] = {
		important = 1,
		destory_gold = 4,
		type = 7,
		group = 95720,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95721,
		prev = 0,
		id = 95720,
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
		destory_item = {},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95721] = {
		trans_use_gold = 60,
		next = 95722,
		base = 95720,
		restore_gold = 20,
		destory_gold = 9,
		prev = 95720,
		id = 95721,
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
			}
		},
		restore_item = {
			{
				17041,
				1
			}
		}
	},
	[95722] = {
		trans_use_gold = 100,
		next = 95723,
		base = 95720,
		restore_gold = 80,
		destory_gold = 24,
		prev = 95721,
		id = 95722,
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
			}
		},
		restore_item = {
			{
				17041,
				4
			}
		}
	},
	[95723] = {
		trans_use_gold = 0,
		next = 0,
		base = 95720,
		restore_gold = 180,
		destory_gold = 49,
		prev = 95722,
		id = 95723,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17041,
				3
			}
		},
		restore_item = {
			{
				17041,
				9
			}
		}
	},
	[95740] = {
		important = 1,
		destory_gold = 9,
		type = 7,
		group = 95740,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95741,
		prev = 0,
		id = 95740,
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
	[95741] = {
		trans_use_gold = 60,
		next = 95742,
		base = 95740,
		restore_gold = 20,
		destory_gold = 14,
		prev = 95740,
		id = 95741,
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
	[95742] = {
		trans_use_gold = 100,
		next = 95743,
		base = 95740,
		restore_gold = 80,
		destory_gold = 29,
		prev = 95741,
		id = 95742,
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
	[95743] = {
		trans_use_gold = 160,
		next = 95744,
		base = 95740,
		restore_gold = 180,
		destory_gold = 54,
		prev = 95742,
		id = 95743,
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
	[95744] = {
		trans_use_gold = 220,
		next = 95745,
		base = 95740,
		restore_gold = 340,
		destory_gold = 94,
		prev = 95743,
		id = 95744,
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
	[95745] = {
		trans_use_gold = 280,
		next = 95746,
		base = 95740,
		restore_gold = 560,
		destory_gold = 149,
		prev = 95744,
		id = 95745,
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
	[95746] = {
		trans_use_gold = 0,
		next = 0,
		base = 95740,
		restore_gold = 840,
		destory_gold = 219,
		prev = 95745,
		id = 95746,
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
	[95760] = {
		important = 1,
		destory_gold = 16,
		type = 7,
		group = 95760,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95761,
		prev = 0,
		id = 95760,
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
		upgrade_formula_id = {}
	},
	[95761] = {
		trans_use_gold = 60,
		next = 95762,
		base = 95760,
		restore_gold = 20,
		destory_gold = 21,
		prev = 95760,
		id = 95761,
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
	[95762] = {
		trans_use_gold = 100,
		next = 95763,
		base = 95760,
		restore_gold = 80,
		destory_gold = 36,
		prev = 95761,
		id = 95762,
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
	[95763] = {
		trans_use_gold = 160,
		next = 95764,
		base = 95760,
		restore_gold = 180,
		destory_gold = 61,
		prev = 95762,
		id = 95763,
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
	[95764] = {
		trans_use_gold = 220,
		next = 95765,
		base = 95760,
		restore_gold = 340,
		destory_gold = 101,
		prev = 95763,
		id = 95764,
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
	[95765] = {
		trans_use_gold = 280,
		next = 95766,
		base = 95760,
		restore_gold = 560,
		destory_gold = 156,
		prev = 95764,
		id = 95765,
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
	[95766] = {
		trans_use_gold = 360,
		next = 95767,
		base = 95760,
		restore_gold = 840,
		destory_gold = 226,
		prev = 95765,
		id = 95766,
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
	[95767] = {
		trans_use_gold = 440,
		next = 95768,
		base = 95760,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 95766,
		id = 95767,
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
	},
	[95768] = {
		trans_use_gold = 520,
		next = 95769,
		base = 95760,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 95767,
		id = 95768,
		level = 9,
		trans_use_item = {
			{
				17043,
				26
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
				10
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
				40
			}
		}
	},
	[95769] = {
		trans_use_gold = 600,
		next = 95770,
		base = 95760,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 95768,
		id = 95769,
		level = 10,
		trans_use_item = {
			{
				17043,
				30
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
				16
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
				66
			}
		}
	},
	[95770] = {
		trans_use_gold = 700,
		next = 95771,
		base = 95760,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 95769,
		id = 95770,
		level = 11,
		trans_use_item = {
			{
				17044,
				35
			},
			{
				17990,
				1
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
				24
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
				96
			}
		}
	},
	[95771] = {
		trans_use_gold = 0,
		next = 0,
		base = 95760,
		restore_gold = 3460,
		destory_gold = 881,
		prev = 95770,
		id = 95771,
		level = 12,
		trans_use_item = {},
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
				24
			},
			{
				17044,
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
			},
			{
				17043,
				96
			},
			{
				17044,
				35
			},
			{
				17990,
				1
			}
		}
	},
	[95800] = {
		important = 1,
		destory_gold = 4,
		type = 7,
		group = 95800,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95801,
		prev = 0,
		id = 95800,
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
		destory_item = {},
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95801] = {
		trans_use_gold = 60,
		next = 95802,
		base = 95800,
		restore_gold = 20,
		destory_gold = 9,
		prev = 95800,
		id = 95801,
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
			}
		},
		restore_item = {
			{
				17041,
				1
			}
		}
	},
	[95802] = {
		trans_use_gold = 100,
		next = 95803,
		base = 95800,
		restore_gold = 80,
		destory_gold = 24,
		prev = 95801,
		id = 95802,
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
			}
		},
		restore_item = {
			{
				17041,
				4
			}
		}
	},
	[95803] = {
		trans_use_gold = 0,
		next = 0,
		base = 95800,
		restore_gold = 180,
		destory_gold = 49,
		prev = 95802,
		id = 95803,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17041,
				3
			}
		},
		restore_item = {
			{
				17041,
				9
			}
		}
	},
	[95820] = {
		important = 1,
		destory_gold = 9,
		type = 7,
		group = 95820,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95821,
		prev = 0,
		id = 95820,
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
	[95821] = {
		trans_use_gold = 60,
		next = 95822,
		base = 95820,
		restore_gold = 20,
		destory_gold = 14,
		prev = 95820,
		id = 95821,
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
	[95822] = {
		trans_use_gold = 100,
		next = 95823,
		base = 95820,
		restore_gold = 80,
		destory_gold = 29,
		prev = 95821,
		id = 95822,
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
	[95823] = {
		trans_use_gold = 160,
		next = 95824,
		base = 95820,
		restore_gold = 180,
		destory_gold = 54,
		prev = 95822,
		id = 95823,
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
	[95824] = {
		trans_use_gold = 220,
		next = 95825,
		base = 95820,
		restore_gold = 340,
		destory_gold = 94,
		prev = 95823,
		id = 95824,
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
	[95825] = {
		trans_use_gold = 280,
		next = 95826,
		base = 95820,
		restore_gold = 560,
		destory_gold = 149,
		prev = 95824,
		id = 95825,
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
	[95826] = {
		trans_use_gold = 0,
		next = 0,
		base = 95820,
		restore_gold = 840,
		destory_gold = 219,
		prev = 95825,
		id = 95826,
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
	[95840] = {
		important = 1,
		destory_gold = 16,
		type = 7,
		group = 95840,
		restore_gold = 0,
		trans_use_gold = 20,
		next = 95841,
		prev = 0,
		id = 95840,
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
		upgrade_formula_id = {}
	},
	[95841] = {
		trans_use_gold = 60,
		next = 95842,
		base = 95840,
		restore_gold = 20,
		destory_gold = 21,
		prev = 95840,
		id = 95841,
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
	[95842] = {
		trans_use_gold = 100,
		next = 95843,
		base = 95840,
		restore_gold = 80,
		destory_gold = 36,
		prev = 95841,
		id = 95842,
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
	[95843] = {
		trans_use_gold = 160,
		next = 95844,
		base = 95840,
		restore_gold = 180,
		destory_gold = 61,
		prev = 95842,
		id = 95843,
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
	[95844] = {
		trans_use_gold = 220,
		next = 95845,
		base = 95840,
		restore_gold = 340,
		destory_gold = 101,
		prev = 95843,
		id = 95844,
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
	[95845] = {
		trans_use_gold = 280,
		next = 95846,
		base = 95840,
		restore_gold = 560,
		destory_gold = 156,
		prev = 95844,
		id = 95845,
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
	[95846] = {
		trans_use_gold = 360,
		next = 95847,
		base = 95840,
		restore_gold = 840,
		destory_gold = 226,
		prev = 95845,
		id = 95846,
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
	[95847] = {
		trans_use_gold = 440,
		next = 95848,
		base = 95840,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 95846,
		id = 95847,
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
	},
	[95848] = {
		trans_use_gold = 520,
		next = 95849,
		base = 95840,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 95847,
		id = 95848,
		level = 9,
		trans_use_item = {
			{
				17043,
				26
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
				10
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
				40
			}
		}
	},
	[95849] = {
		trans_use_gold = 600,
		next = 95850,
		base = 95840,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 95848,
		id = 95849,
		level = 10,
		trans_use_item = {
			{
				17043,
				30
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
				16
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
				66
			}
		}
	},
	[95850] = {
		trans_use_gold = 700,
		next = 95851,
		base = 95840,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 95849,
		id = 95850,
		level = 11,
		trans_use_item = {
			{
				17044,
				35
			},
			{
				17990,
				1
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
				24
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
				96
			}
		}
	},
	[95851] = {
		trans_use_gold = 0,
		next = 0,
		base = 95840,
		restore_gold = 3460,
		destory_gold = 881,
		prev = 95850,
		id = 95851,
		level = 12,
		trans_use_item = {},
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
				24
			},
			{
				17044,
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
			},
			{
				17043,
				96
			},
			{
				17044,
				35
			},
			{
				17990,
				1
			}
		}
	}
}
