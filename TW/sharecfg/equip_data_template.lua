pg = pg or {}
pg.equip_data_template = {
	[500] = {
		important = 2,
		destory_gold = 25,
		type = 10,
		group = 500,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 501,
		prev = 0,
		id = 500,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[501] = {
		trans_use_gold = 90,
		next = 502,
		base = 500,
		restore_gold = 20,
		destory_gold = 33,
		prev = 500,
		id = 501,
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
				1
			}
		}
	},
	[502] = {
		trans_use_gold = 150,
		next = 503,
		base = 500,
		restore_gold = 80,
		destory_gold = 55,
		prev = 501,
		id = 502,
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
				4
			}
		}
	},
	[503] = {
		trans_use_gold = 240,
		next = 504,
		base = 500,
		restore_gold = 180,
		destory_gold = 93,
		prev = 502,
		id = 503,
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
				9
			}
		}
	},
	[504] = {
		trans_use_gold = 330,
		next = 505,
		base = 500,
		restore_gold = 340,
		destory_gold = 153,
		prev = 503,
		id = 504,
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
				9
			},
			{
				17002,
				8
			}
		}
	},
	[505] = {
		trans_use_gold = 420,
		next = 506,
		base = 500,
		restore_gold = 560,
		destory_gold = 235,
		prev = 504,
		id = 505,
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
				9
			},
			{
				17002,
				19
			}
		}
	},
	[506] = {
		trans_use_gold = 540,
		next = 507,
		base = 500,
		restore_gold = 840,
		destory_gold = 340,
		prev = 505,
		id = 506,
		level = 7,
		trans_use_item = {
			{
				17003,
				27
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
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
	[507] = {
		trans_use_gold = 660,
		next = 508,
		base = 500,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 506,
		id = 507,
		level = 8,
		trans_use_item = {
			{
				17003,
				33
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				7
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
	[508] = {
		trans_use_gold = 780,
		next = 509,
		base = 500,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 507,
		id = 508,
		level = 9,
		trans_use_item = {
			{
				17003,
				39
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				15
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
	[509] = {
		trans_use_gold = 900,
		next = 510,
		base = 500,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 508,
		id = 509,
		level = 10,
		trans_use_item = {
			{
				17003,
				45
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
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
				66
			}
		}
	},
	[510] = {
		trans_use_gold = 0,
		next = 0,
		base = 500,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 509,
		id = 510,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				36
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
	[520] = {
		important = 2,
		destory_gold = 25,
		type = 10,
		group = 520,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 521,
		prev = 0,
		id = 520,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[521] = {
		trans_use_gold = 90,
		next = 522,
		base = 520,
		restore_gold = 20,
		destory_gold = 33,
		prev = 520,
		id = 521,
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
				1
			}
		}
	},
	[522] = {
		trans_use_gold = 150,
		next = 523,
		base = 520,
		restore_gold = 80,
		destory_gold = 55,
		prev = 521,
		id = 522,
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
				4
			}
		}
	},
	[523] = {
		trans_use_gold = 240,
		next = 524,
		base = 520,
		restore_gold = 180,
		destory_gold = 93,
		prev = 522,
		id = 523,
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
				9
			}
		}
	},
	[524] = {
		trans_use_gold = 330,
		next = 525,
		base = 520,
		restore_gold = 340,
		destory_gold = 153,
		prev = 523,
		id = 524,
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
				9
			},
			{
				17002,
				8
			}
		}
	},
	[525] = {
		trans_use_gold = 420,
		next = 526,
		base = 520,
		restore_gold = 560,
		destory_gold = 235,
		prev = 524,
		id = 525,
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
				9
			},
			{
				17002,
				19
			}
		}
	},
	[526] = {
		trans_use_gold = 540,
		next = 527,
		base = 520,
		restore_gold = 840,
		destory_gold = 340,
		prev = 525,
		id = 526,
		level = 7,
		trans_use_item = {
			{
				17003,
				27
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
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
	[527] = {
		trans_use_gold = 660,
		next = 528,
		base = 520,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 526,
		id = 527,
		level = 8,
		trans_use_item = {
			{
				17003,
				33
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				7
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
	[528] = {
		trans_use_gold = 780,
		next = 529,
		base = 520,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 527,
		id = 528,
		level = 9,
		trans_use_item = {
			{
				17003,
				39
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				15
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
	[529] = {
		trans_use_gold = 900,
		next = 530,
		base = 520,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 528,
		id = 529,
		level = 10,
		trans_use_item = {
			{
				17003,
				45
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
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
				66
			}
		}
	},
	[530] = {
		trans_use_gold = 0,
		next = 0,
		base = 520,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 529,
		id = 530,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				36
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
	[540] = {
		important = 2,
		destory_gold = 25,
		type = 10,
		group = 540,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 541,
		prev = 0,
		id = 540,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[541] = {
		trans_use_gold = 90,
		next = 542,
		base = 540,
		restore_gold = 20,
		destory_gold = 33,
		prev = 540,
		id = 541,
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
				1
			}
		}
	},
	[542] = {
		trans_use_gold = 150,
		next = 543,
		base = 540,
		restore_gold = 80,
		destory_gold = 55,
		prev = 541,
		id = 542,
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
				4
			}
		}
	},
	[543] = {
		trans_use_gold = 240,
		next = 544,
		base = 540,
		restore_gold = 180,
		destory_gold = 93,
		prev = 542,
		id = 543,
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
				9
			}
		}
	},
	[544] = {
		trans_use_gold = 330,
		next = 545,
		base = 540,
		restore_gold = 340,
		destory_gold = 153,
		prev = 543,
		id = 544,
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
				9
			},
			{
				17002,
				8
			}
		}
	},
	[545] = {
		trans_use_gold = 420,
		next = 546,
		base = 540,
		restore_gold = 560,
		destory_gold = 235,
		prev = 544,
		id = 545,
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
				9
			},
			{
				17002,
				19
			}
		}
	},
	[546] = {
		trans_use_gold = 540,
		next = 547,
		base = 540,
		restore_gold = 840,
		destory_gold = 340,
		prev = 545,
		id = 546,
		level = 7,
		trans_use_item = {
			{
				17003,
				27
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
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
	[547] = {
		trans_use_gold = 660,
		next = 548,
		base = 540,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 546,
		id = 547,
		level = 8,
		trans_use_item = {
			{
				17003,
				33
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				7
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
	[548] = {
		trans_use_gold = 780,
		next = 549,
		base = 540,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 547,
		id = 548,
		level = 9,
		trans_use_item = {
			{
				17003,
				39
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				15
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
	[549] = {
		trans_use_gold = 900,
		next = 550,
		base = 540,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 548,
		id = 549,
		level = 10,
		trans_use_item = {
			{
				17003,
				45
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
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
				66
			}
		}
	},
	[550] = {
		trans_use_gold = 0,
		next = 0,
		base = 540,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 549,
		id = 550,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				36
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
	[640] = {
		important = 2,
		destory_gold = 36,
		type = 10,
		group = 640,
		trans_use_gold = 60,
		restore_gold = 0,
		next = 641,
		prev = 0,
		id = 640,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			3,
			6,
			8,
			9,
			11,
			12,
			13,
			17,
			18
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
		restore_item = {}
	},
	[641] = {
		trans_use_gold = 180,
		next = 642,
		base = 640,
		restore_gold = 60,
		destory_gold = 51,
		prev = 640,
		id = 641,
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
	[642] = {
		trans_use_gold = 300,
		next = 643,
		base = 640,
		restore_gold = 240,
		destory_gold = 96,
		prev = 641,
		id = 642,
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
	[643] = {
		trans_use_gold = 480,
		next = 644,
		base = 640,
		restore_gold = 540,
		destory_gold = 171,
		prev = 642,
		id = 643,
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
	},
	[644] = {
		trans_use_gold = 660,
		next = 645,
		base = 640,
		restore_gold = 1020,
		destory_gold = 291,
		prev = 643,
		id = 644,
		level = 5,
		trans_use_item = {
			{
				17002,
				33
			}
		},
		destory_item = {
			{
				17001,
				7
			},
			{
				17002,
				6
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
			},
			{
				17002,
				24
			}
		}
	},
	[645] = {
		trans_use_gold = 840,
		next = 646,
		base = 640,
		restore_gold = 1680,
		destory_gold = 456,
		prev = 644,
		id = 645,
		level = 6,
		trans_use_item = {
			{
				17002,
				42
			}
		},
		destory_item = {
			{
				17001,
				7
			},
			{
				17002,
				14
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
			},
			{
				17002,
				57
			}
		}
	},
	[646] = {
		trans_use_gold = 1080,
		next = 647,
		base = 640,
		restore_gold = 2520,
		destory_gold = 666,
		prev = 645,
		id = 646,
		level = 7,
		trans_use_item = {
			{
				17003,
				54
			}
		},
		destory_item = {
			{
				17001,
				7
			},
			{
				17002,
				25
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
			},
			{
				17002,
				99
			}
		}
	},
	[647] = {
		trans_use_gold = 1320,
		next = 648,
		base = 640,
		restore_gold = 3600,
		destory_gold = 936,
		prev = 646,
		id = 647,
		level = 8,
		trans_use_item = {
			{
				17003,
				66
			}
		},
		destory_item = {
			{
				17001,
				7
			},
			{
				17002,
				25
			},
			{
				17003,
				15
			}
		},
		restore_item = {
			{
				17001,
				27
			},
			{
				17002,
				99
			},
			{
				17003,
				54
			}
		}
	},
	[648] = {
		trans_use_gold = 1560,
		next = 649,
		base = 640,
		restore_gold = 4920,
		destory_gold = 1266,
		prev = 647,
		id = 648,
		level = 9,
		trans_use_item = {
			{
				17003,
				78
			}
		},
		destory_item = {
			{
				17001,
				7
			},
			{
				17002,
				25
			},
			{
				17003,
				31
			}
		},
		restore_item = {
			{
				17001,
				27
			},
			{
				17002,
				99
			},
			{
				17003,
				120
			}
		}
	},
	[649] = {
		trans_use_gold = 1800,
		next = 650,
		base = 640,
		restore_gold = 6480,
		destory_gold = 1656,
		prev = 648,
		id = 649,
		level = 10,
		trans_use_item = {
			{
				17003,
				90
			}
		},
		destory_item = {
			{
				17001,
				7
			},
			{
				17002,
				25
			},
			{
				17003,
				51
			}
		},
		restore_item = {
			{
				17001,
				27
			},
			{
				17002,
				99
			},
			{
				17003,
				198
			}
		}
	},
	[650] = {
		trans_use_gold = 0,
		next = 0,
		base = 640,
		restore_gold = 8280,
		destory_gold = 2106,
		prev = 649,
		id = 650,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				7
			},
			{
				17002,
				25
			},
			{
				17003,
				73
			}
		},
		restore_item = {
			{
				17001,
				27
			},
			{
				17002,
				99
			},
			{
				17003,
				288
			}
		}
	},
	[1000] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 1000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1001,
		prev = 0,
		id = 1000,
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
			18
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[1001] = {
		trans_use_gold = 60,
		next = 1002,
		base = 1000,
		restore_gold = 20,
		destory_gold = 14,
		prev = 1000,
		id = 1001,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1002] = {
		trans_use_gold = 100,
		next = 1003,
		base = 1000,
		restore_gold = 80,
		destory_gold = 29,
		prev = 1001,
		id = 1002,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1003] = {
		trans_use_gold = 160,
		next = 1004,
		base = 1000,
		restore_gold = 180,
		destory_gold = 54,
		prev = 1002,
		id = 1003,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1004] = {
		trans_use_gold = 220,
		next = 1005,
		base = 1000,
		restore_gold = 340,
		destory_gold = 94,
		prev = 1003,
		id = 1004,
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
				4
			},
			{
				17002,
				2
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
	[1005] = {
		trans_use_gold = 280,
		next = 1006,
		base = 1000,
		restore_gold = 560,
		destory_gold = 149,
		prev = 1004,
		id = 1005,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[1006] = {
		trans_use_gold = 0,
		next = 0,
		base = 1000,
		restore_gold = 840,
		destory_gold = 219,
		prev = 1005,
		id = 1006,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[1020] = {
		important = 1,
		destory_gold = 16,
		type = 10,
		group = 1020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1021,
		prev = 0,
		id = 1020,
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
			18
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17002,
				1
			}
		},
		restore_item = {}
	},
	[1021] = {
		trans_use_gold = 60,
		next = 1022,
		base = 1020,
		restore_gold = 20,
		destory_gold = 21,
		prev = 1020,
		id = 1021,
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
		trans_use_gold = 30,
		restore_gold = 0,
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
			18
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
		restore_item = {}
	},
	[1041] = {
		trans_use_gold = 90,
		next = 1042,
		base = 1040,
		restore_gold = 20,
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
				1
			}
		}
	},
	[1042] = {
		trans_use_gold = 150,
		next = 1043,
		base = 1040,
		restore_gold = 80,
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
				4
			}
		}
	},
	[1043] = {
		trans_use_gold = 240,
		next = 1044,
		base = 1040,
		restore_gold = 180,
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
				9
			}
		}
	},
	[1044] = {
		trans_use_gold = 330,
		next = 1045,
		base = 1040,
		restore_gold = 340,
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
				9
			},
			{
				17002,
				8
			}
		}
	},
	[1045] = {
		trans_use_gold = 420,
		next = 1046,
		base = 1040,
		restore_gold = 560,
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
				9
			},
			{
				17002,
				19
			}
		}
	},
	[1046] = {
		trans_use_gold = 540,
		next = 1047,
		base = 1040,
		restore_gold = 840,
		destory_gold = 340,
		prev = 1045,
		id = 1046,
		level = 7,
		trans_use_item = {
			{
				17003,
				27
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
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
	[1047] = {
		trans_use_gold = 660,
		next = 1048,
		base = 1040,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 1046,
		id = 1047,
		level = 8,
		trans_use_item = {
			{
				17003,
				33
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				7
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
	[1048] = {
		trans_use_gold = 780,
		next = 1049,
		base = 1040,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 1047,
		id = 1048,
		level = 9,
		trans_use_item = {
			{
				17003,
				39
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				15
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
	[1049] = {
		trans_use_gold = 900,
		next = 1050,
		base = 1040,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 1048,
		id = 1049,
		level = 10,
		trans_use_item = {
			{
				17003,
				45
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
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
				66
			}
		}
	},
	[1050] = {
		trans_use_gold = 0,
		next = 0,
		base = 1040,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 1049,
		id = 1050,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				36
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
	[1100] = {
		important = 1,
		destory_gold = 4,
		type = 10,
		group = 1100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1101,
		prev = 0,
		id = 1100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[1101] = {
		trans_use_gold = 60,
		next = 1102,
		base = 1100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 1100,
		id = 1101,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1102] = {
		trans_use_gold = 100,
		next = 1103,
		base = 1100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 1101,
		id = 1102,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1103] = {
		trans_use_gold = 0,
		next = 0,
		base = 1100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 1102,
		id = 1103,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1120] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 1120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1121,
		prev = 0,
		id = 1120,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[1121] = {
		trans_use_gold = 60,
		next = 1122,
		base = 1120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 1120,
		id = 1121,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1122] = {
		trans_use_gold = 100,
		next = 1123,
		base = 1120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 1121,
		id = 1122,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1123] = {
		trans_use_gold = 160,
		next = 1124,
		base = 1120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 1122,
		id = 1123,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1124] = {
		trans_use_gold = 220,
		next = 1125,
		base = 1120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 1123,
		id = 1124,
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
				4
			},
			{
				17002,
				2
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
	[1125] = {
		trans_use_gold = 280,
		next = 1126,
		base = 1120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 1124,
		id = 1125,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[1126] = {
		trans_use_gold = 0,
		next = 0,
		base = 1120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 1125,
		id = 1126,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[1140] = {
		important = 1,
		destory_gold = 16,
		type = 10,
		group = 1140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1141,
		prev = 0,
		id = 1140,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17002,
				1
			}
		},
		restore_item = {}
	},
	[1141] = {
		trans_use_gold = 60,
		next = 1142,
		base = 1140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 1140,
		id = 1141,
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
	[1142] = {
		trans_use_gold = 100,
		next = 1143,
		base = 1140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 1141,
		id = 1142,
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
	[1143] = {
		trans_use_gold = 160,
		next = 1144,
		base = 1140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 1142,
		id = 1143,
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
	[1144] = {
		trans_use_gold = 220,
		next = 1145,
		base = 1140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 1143,
		id = 1144,
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
	[1145] = {
		trans_use_gold = 280,
		next = 1146,
		base = 1140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 1144,
		id = 1145,
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
	[1146] = {
		trans_use_gold = 360,
		next = 1147,
		base = 1140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 1145,
		id = 1146,
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
	[1147] = {
		trans_use_gold = 440,
		next = 1148,
		base = 1140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 1146,
		id = 1147,
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
	[1148] = {
		trans_use_gold = 520,
		next = 1149,
		base = 1140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 1147,
		id = 1148,
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
	[1149] = {
		trans_use_gold = 600,
		next = 1150,
		base = 1140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 1148,
		id = 1149,
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
	[1150] = {
		trans_use_gold = 0,
		next = 0,
		base = 1140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 1149,
		id = 1150,
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
	[1200] = {
		important = 1,
		destory_gold = 4,
		type = 10,
		group = 1200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1201,
		prev = 0,
		id = 1200,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			6,
			7,
			8,
			11,
			12,
			17
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[1201] = {
		trans_use_gold = 60,
		next = 1202,
		base = 1200,
		restore_gold = 20,
		destory_gold = 9,
		prev = 1200,
		id = 1201,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1202] = {
		trans_use_gold = 100,
		next = 1203,
		base = 1200,
		restore_gold = 80,
		destory_gold = 24,
		prev = 1201,
		id = 1202,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1203] = {
		trans_use_gold = 0,
		next = 0,
		base = 1200,
		restore_gold = 180,
		destory_gold = 49,
		prev = 1202,
		id = 1203,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1220] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 1220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1221,
		prev = 0,
		id = 1220,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			6,
			7,
			8,
			11,
			12,
			17
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[1221] = {
		trans_use_gold = 60,
		next = 1222,
		base = 1220,
		restore_gold = 20,
		destory_gold = 14,
		prev = 1220,
		id = 1221,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1222] = {
		trans_use_gold = 100,
		next = 1223,
		base = 1220,
		restore_gold = 80,
		destory_gold = 29,
		prev = 1221,
		id = 1222,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1223] = {
		trans_use_gold = 160,
		next = 1224,
		base = 1220,
		restore_gold = 180,
		destory_gold = 54,
		prev = 1222,
		id = 1223,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1224] = {
		trans_use_gold = 220,
		next = 1225,
		base = 1220,
		restore_gold = 340,
		destory_gold = 94,
		prev = 1223,
		id = 1224,
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
				4
			},
			{
				17002,
				2
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
	[1225] = {
		trans_use_gold = 280,
		next = 1226,
		base = 1220,
		restore_gold = 560,
		destory_gold = 149,
		prev = 1224,
		id = 1225,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[1226] = {
		trans_use_gold = 0,
		next = 0,
		base = 1220,
		restore_gold = 840,
		destory_gold = 219,
		prev = 1225,
		id = 1226,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[1240] = {
		important = 1,
		destory_gold = 16,
		type = 10,
		group = 1240,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1241,
		prev = 0,
		id = 1240,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			6,
			7,
			8,
			11,
			12,
			17
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17002,
				1
			}
		},
		restore_item = {}
	},
	[1241] = {
		trans_use_gold = 60,
		next = 1242,
		base = 1240,
		restore_gold = 20,
		destory_gold = 21,
		prev = 1240,
		id = 1241,
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
	[1242] = {
		trans_use_gold = 100,
		next = 1243,
		base = 1240,
		restore_gold = 80,
		destory_gold = 36,
		prev = 1241,
		id = 1242,
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
	[1243] = {
		trans_use_gold = 160,
		next = 1244,
		base = 1240,
		restore_gold = 180,
		destory_gold = 61,
		prev = 1242,
		id = 1243,
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
	[1244] = {
		trans_use_gold = 220,
		next = 1245,
		base = 1240,
		restore_gold = 340,
		destory_gold = 101,
		prev = 1243,
		id = 1244,
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
	[1245] = {
		trans_use_gold = 280,
		next = 1246,
		base = 1240,
		restore_gold = 560,
		destory_gold = 156,
		prev = 1244,
		id = 1245,
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
	[1246] = {
		trans_use_gold = 360,
		next = 1247,
		base = 1240,
		restore_gold = 840,
		destory_gold = 226,
		prev = 1245,
		id = 1246,
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
	[1247] = {
		trans_use_gold = 440,
		next = 1248,
		base = 1240,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 1246,
		id = 1247,
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
	[1248] = {
		trans_use_gold = 520,
		next = 1249,
		base = 1240,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 1247,
		id = 1248,
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
	[1249] = {
		trans_use_gold = 600,
		next = 1250,
		base = 1240,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 1248,
		id = 1249,
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
	[1250] = {
		trans_use_gold = 0,
		next = 0,
		base = 1240,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 1249,
		id = 1250,
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
	[1300] = {
		important = 1,
		destory_gold = 4,
		type = 10,
		group = 1300,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1301,
		prev = 0,
		id = 1300,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			8,
			17
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[1301] = {
		trans_use_gold = 60,
		next = 1302,
		base = 1300,
		restore_gold = 20,
		destory_gold = 9,
		prev = 1300,
		id = 1301,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1302] = {
		trans_use_gold = 100,
		next = 1303,
		base = 1300,
		restore_gold = 80,
		destory_gold = 24,
		prev = 1301,
		id = 1302,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1303] = {
		trans_use_gold = 0,
		next = 0,
		base = 1300,
		restore_gold = 180,
		destory_gold = 49,
		prev = 1302,
		id = 1303,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1320] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 1320,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1321,
		prev = 0,
		id = 1320,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			8,
			17
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[1321] = {
		trans_use_gold = 60,
		next = 1322,
		base = 1320,
		restore_gold = 20,
		destory_gold = 14,
		prev = 1320,
		id = 1321,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1322] = {
		trans_use_gold = 100,
		next = 1323,
		base = 1320,
		restore_gold = 80,
		destory_gold = 29,
		prev = 1321,
		id = 1322,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1323] = {
		trans_use_gold = 160,
		next = 1324,
		base = 1320,
		restore_gold = 180,
		destory_gold = 54,
		prev = 1322,
		id = 1323,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1324] = {
		trans_use_gold = 220,
		next = 1325,
		base = 1320,
		restore_gold = 340,
		destory_gold = 94,
		prev = 1323,
		id = 1324,
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
				4
			},
			{
				17002,
				2
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
	[1325] = {
		trans_use_gold = 280,
		next = 1326,
		base = 1320,
		restore_gold = 560,
		destory_gold = 149,
		prev = 1324,
		id = 1325,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[1326] = {
		trans_use_gold = 0,
		next = 0,
		base = 1320,
		restore_gold = 840,
		destory_gold = 219,
		prev = 1325,
		id = 1326,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[1340] = {
		important = 1,
		destory_gold = 16,
		type = 10,
		group = 1340,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1341,
		prev = 0,
		id = 1340,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			8,
			17
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17002,
				1
			}
		},
		restore_item = {}
	},
	[1341] = {
		trans_use_gold = 60,
		next = 1342,
		base = 1340,
		restore_gold = 20,
		destory_gold = 21,
		prev = 1340,
		id = 1341,
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
	[1342] = {
		trans_use_gold = 100,
		next = 1343,
		base = 1340,
		restore_gold = 80,
		destory_gold = 36,
		prev = 1341,
		id = 1342,
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
	[1343] = {
		trans_use_gold = 160,
		next = 1344,
		base = 1340,
		restore_gold = 180,
		destory_gold = 61,
		prev = 1342,
		id = 1343,
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
	[1344] = {
		trans_use_gold = 220,
		next = 1345,
		base = 1340,
		restore_gold = 340,
		destory_gold = 101,
		prev = 1343,
		id = 1344,
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
	[1345] = {
		trans_use_gold = 280,
		next = 1346,
		base = 1340,
		restore_gold = 560,
		destory_gold = 156,
		prev = 1344,
		id = 1345,
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
	[1346] = {
		trans_use_gold = 360,
		next = 1347,
		base = 1340,
		restore_gold = 840,
		destory_gold = 226,
		prev = 1345,
		id = 1346,
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
	[1347] = {
		trans_use_gold = 440,
		next = 1348,
		base = 1340,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 1346,
		id = 1347,
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
	[1348] = {
		trans_use_gold = 520,
		next = 1349,
		base = 1340,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 1347,
		id = 1348,
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
	[1349] = {
		trans_use_gold = 600,
		next = 1350,
		base = 1340,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 1348,
		id = 1349,
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
	[1350] = {
		trans_use_gold = 0,
		next = 0,
		base = 1340,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 1349,
		id = 1350,
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
	[1400] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 1400,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1401,
		prev = 0,
		id = 1400,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			3,
			4,
			5,
			8,
			11,
			12,
			13,
			17,
			18
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[1401] = {
		trans_use_gold = 60,
		next = 1402,
		base = 1400,
		restore_gold = 20,
		destory_gold = 14,
		prev = 1400,
		id = 1401,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1402] = {
		trans_use_gold = 100,
		next = 1403,
		base = 1400,
		restore_gold = 80,
		destory_gold = 29,
		prev = 1401,
		id = 1402,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1403] = {
		trans_use_gold = 160,
		next = 1404,
		base = 1400,
		restore_gold = 180,
		destory_gold = 54,
		prev = 1402,
		id = 1403,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1404] = {
		trans_use_gold = 220,
		next = 1405,
		base = 1400,
		restore_gold = 340,
		destory_gold = 94,
		prev = 1403,
		id = 1404,
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
				4
			},
			{
				17002,
				2
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
	[1405] = {
		trans_use_gold = 280,
		next = 1406,
		base = 1400,
		restore_gold = 560,
		destory_gold = 149,
		prev = 1404,
		id = 1405,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[1406] = {
		trans_use_gold = 0,
		next = 0,
		base = 1400,
		restore_gold = 840,
		destory_gold = 219,
		prev = 1405,
		id = 1406,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[1420] = {
		important = 1,
		destory_gold = 16,
		type = 10,
		group = 1420,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1421,
		prev = 0,
		id = 1420,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			3,
			4,
			5,
			8,
			11,
			12,
			13,
			17,
			18
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17002,
				1
			}
		},
		restore_item = {}
	},
	[1421] = {
		trans_use_gold = 60,
		next = 1422,
		base = 1420,
		restore_gold = 20,
		destory_gold = 21,
		prev = 1420,
		id = 1421,
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
	[1422] = {
		trans_use_gold = 100,
		next = 1423,
		base = 1420,
		restore_gold = 80,
		destory_gold = 36,
		prev = 1421,
		id = 1422,
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
	[1423] = {
		trans_use_gold = 160,
		next = 1424,
		base = 1420,
		restore_gold = 180,
		destory_gold = 61,
		prev = 1422,
		id = 1423,
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
	[1424] = {
		trans_use_gold = 220,
		next = 1425,
		base = 1420,
		restore_gold = 340,
		destory_gold = 101,
		prev = 1423,
		id = 1424,
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
	[1425] = {
		trans_use_gold = 280,
		next = 1426,
		base = 1420,
		restore_gold = 560,
		destory_gold = 156,
		prev = 1424,
		id = 1425,
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
	[1426] = {
		trans_use_gold = 360,
		next = 1427,
		base = 1420,
		restore_gold = 840,
		destory_gold = 226,
		prev = 1425,
		id = 1426,
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
	[1427] = {
		trans_use_gold = 440,
		next = 1428,
		base = 1420,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 1426,
		id = 1427,
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
	[1428] = {
		trans_use_gold = 520,
		next = 1429,
		base = 1420,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 1427,
		id = 1428,
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
	[1429] = {
		trans_use_gold = 600,
		next = 1430,
		base = 1420,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 1428,
		id = 1429,
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
	[1430] = {
		trans_use_gold = 0,
		next = 0,
		base = 1420,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 1429,
		id = 1430,
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
	[1440] = {
		important = 1,
		destory_gold = 25,
		type = 10,
		group = 1440,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 1441,
		prev = 0,
		id = 1440,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			3,
			4,
			5,
			8,
			11,
			12,
			13,
			17,
			18
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
		restore_item = {}
	},
	[1441] = {
		trans_use_gold = 90,
		next = 1442,
		base = 1440,
		restore_gold = 20,
		destory_gold = 33,
		prev = 1440,
		id = 1441,
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
				1
			}
		}
	},
	[1442] = {
		trans_use_gold = 150,
		next = 1443,
		base = 1440,
		restore_gold = 80,
		destory_gold = 55,
		prev = 1441,
		id = 1442,
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
				4
			}
		}
	},
	[1443] = {
		trans_use_gold = 240,
		next = 1444,
		base = 1440,
		restore_gold = 180,
		destory_gold = 93,
		prev = 1442,
		id = 1443,
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
				9
			}
		}
	},
	[1444] = {
		trans_use_gold = 330,
		next = 1445,
		base = 1440,
		restore_gold = 340,
		destory_gold = 153,
		prev = 1443,
		id = 1444,
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
				9
			},
			{
				17002,
				8
			}
		}
	},
	[1445] = {
		trans_use_gold = 420,
		next = 1446,
		base = 1440,
		restore_gold = 560,
		destory_gold = 235,
		prev = 1444,
		id = 1445,
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
				9
			},
			{
				17002,
				19
			}
		}
	},
	[1446] = {
		trans_use_gold = 540,
		next = 1447,
		base = 1440,
		restore_gold = 840,
		destory_gold = 340,
		prev = 1445,
		id = 1446,
		level = 7,
		trans_use_item = {
			{
				17003,
				27
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
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
	[1447] = {
		trans_use_gold = 660,
		next = 1448,
		base = 1440,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 1446,
		id = 1447,
		level = 8,
		trans_use_item = {
			{
				17003,
				33
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				7
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
	[1448] = {
		trans_use_gold = 780,
		next = 1449,
		base = 1440,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 1447,
		id = 1448,
		level = 9,
		trans_use_item = {
			{
				17003,
				39
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				15
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
	[1449] = {
		trans_use_gold = 900,
		next = 1450,
		base = 1440,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 1448,
		id = 1449,
		level = 10,
		trans_use_item = {
			{
				17003,
				45
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
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
				66
			}
		}
	},
	[1450] = {
		trans_use_gold = 0,
		next = 0,
		base = 1440,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 1449,
		id = 1450,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				36
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
	[1500] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 1500,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1501,
		prev = 0,
		id = 1500,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			6,
			7
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[1501] = {
		trans_use_gold = 60,
		next = 1502,
		base = 1500,
		restore_gold = 20,
		destory_gold = 14,
		prev = 1500,
		id = 1501,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1502] = {
		trans_use_gold = 100,
		next = 1503,
		base = 1500,
		restore_gold = 80,
		destory_gold = 29,
		prev = 1501,
		id = 1502,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1503] = {
		trans_use_gold = 160,
		next = 1504,
		base = 1500,
		restore_gold = 180,
		destory_gold = 54,
		prev = 1502,
		id = 1503,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1504] = {
		trans_use_gold = 220,
		next = 1505,
		base = 1500,
		restore_gold = 340,
		destory_gold = 94,
		prev = 1503,
		id = 1504,
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
				4
			},
			{
				17002,
				2
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
	[1505] = {
		trans_use_gold = 280,
		next = 1506,
		base = 1500,
		restore_gold = 560,
		destory_gold = 149,
		prev = 1504,
		id = 1505,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[1506] = {
		trans_use_gold = 0,
		next = 0,
		base = 1500,
		restore_gold = 840,
		destory_gold = 219,
		prev = 1505,
		id = 1506,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[1520] = {
		important = 1,
		destory_gold = 16,
		type = 10,
		group = 1520,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1521,
		prev = 0,
		id = 1520,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			6,
			7
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17002,
				1
			}
		},
		restore_item = {}
	},
	[1521] = {
		trans_use_gold = 60,
		next = 1522,
		base = 1520,
		restore_gold = 20,
		destory_gold = 21,
		prev = 1520,
		id = 1521,
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
	[1522] = {
		trans_use_gold = 100,
		next = 1523,
		base = 1520,
		restore_gold = 80,
		destory_gold = 36,
		prev = 1521,
		id = 1522,
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
	[1523] = {
		trans_use_gold = 160,
		next = 1524,
		base = 1520,
		restore_gold = 180,
		destory_gold = 61,
		prev = 1522,
		id = 1523,
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
	[1524] = {
		trans_use_gold = 220,
		next = 1525,
		base = 1520,
		restore_gold = 340,
		destory_gold = 101,
		prev = 1523,
		id = 1524,
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
	[1525] = {
		trans_use_gold = 280,
		next = 1526,
		base = 1520,
		restore_gold = 560,
		destory_gold = 156,
		prev = 1524,
		id = 1525,
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
	[1526] = {
		trans_use_gold = 360,
		next = 1527,
		base = 1520,
		restore_gold = 840,
		destory_gold = 226,
		prev = 1525,
		id = 1526,
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
	[1527] = {
		trans_use_gold = 440,
		next = 1528,
		base = 1520,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 1526,
		id = 1527,
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
	[1528] = {
		trans_use_gold = 520,
		next = 1529,
		base = 1520,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 1527,
		id = 1528,
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
	[1529] = {
		trans_use_gold = 600,
		next = 1530,
		base = 1520,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 1528,
		id = 1529,
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
	[1530] = {
		trans_use_gold = 0,
		next = 0,
		base = 1520,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 1529,
		id = 1530,
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
	[1540] = {
		important = 1,
		destory_gold = 25,
		type = 10,
		group = 1540,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 1541,
		prev = 0,
		id = 1540,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			6,
			7
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
		restore_item = {}
	},
	[1541] = {
		trans_use_gold = 90,
		next = 1542,
		base = 1540,
		restore_gold = 20,
		destory_gold = 33,
		prev = 1540,
		id = 1541,
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
				1
			}
		}
	},
	[1542] = {
		trans_use_gold = 150,
		next = 1543,
		base = 1540,
		restore_gold = 80,
		destory_gold = 55,
		prev = 1541,
		id = 1542,
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
				4
			}
		}
	},
	[1543] = {
		trans_use_gold = 240,
		next = 1544,
		base = 1540,
		restore_gold = 180,
		destory_gold = 93,
		prev = 1542,
		id = 1543,
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
				9
			}
		}
	},
	[1544] = {
		trans_use_gold = 330,
		next = 1545,
		base = 1540,
		restore_gold = 340,
		destory_gold = 153,
		prev = 1543,
		id = 1544,
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
				9
			},
			{
				17002,
				8
			}
		}
	},
	[1545] = {
		trans_use_gold = 420,
		next = 1546,
		base = 1540,
		restore_gold = 560,
		destory_gold = 235,
		prev = 1544,
		id = 1545,
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
				9
			},
			{
				17002,
				19
			}
		}
	},
	[1546] = {
		trans_use_gold = 540,
		next = 1547,
		base = 1540,
		restore_gold = 840,
		destory_gold = 340,
		prev = 1545,
		id = 1546,
		level = 7,
		trans_use_item = {
			{
				17003,
				27
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
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
	[1547] = {
		trans_use_gold = 660,
		next = 1548,
		base = 1540,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 1546,
		id = 1547,
		level = 8,
		trans_use_item = {
			{
				17003,
				33
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				7
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
	[1548] = {
		trans_use_gold = 780,
		next = 1549,
		base = 1540,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 1547,
		id = 1548,
		level = 9,
		trans_use_item = {
			{
				17003,
				39
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				15
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
	[1549] = {
		trans_use_gold = 900,
		next = 1550,
		base = 1540,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 1548,
		id = 1549,
		level = 10,
		trans_use_item = {
			{
				17003,
				45
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
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
				66
			}
		}
	},
	[1550] = {
		trans_use_gold = 0,
		next = 0,
		base = 1540,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 1549,
		id = 1550,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				36
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
	[1600] = {
		important = 1,
		destory_gold = 1,
		type = 10,
		group = 1600,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1601,
		prev = 0,
		id = 1600,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			6,
			7
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[1601] = {
		trans_use_gold = 60,
		next = 1602,
		base = 1600,
		restore_gold = 20,
		destory_gold = 6,
		prev = 1600,
		id = 1601,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1602] = {
		trans_use_gold = 100,
		next = 1603,
		base = 1600,
		restore_gold = 80,
		destory_gold = 21,
		prev = 1601,
		id = 1602,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1603] = {
		trans_use_gold = 0,
		next = 0,
		base = 1600,
		restore_gold = 180,
		destory_gold = 46,
		prev = 1602,
		id = 1603,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1620] = {
		important = 1,
		destory_gold = 4,
		type = 10,
		group = 1620,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1621,
		prev = 0,
		id = 1620,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			6,
			7
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[1621] = {
		trans_use_gold = 60,
		next = 1622,
		base = 1620,
		restore_gold = 20,
		destory_gold = 9,
		prev = 1620,
		id = 1621,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1622] = {
		trans_use_gold = 100,
		next = 1623,
		base = 1620,
		restore_gold = 80,
		destory_gold = 24,
		prev = 1621,
		id = 1622,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1623] = {
		trans_use_gold = 0,
		next = 0,
		base = 1620,
		restore_gold = 180,
		destory_gold = 49,
		prev = 1622,
		id = 1623,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1640] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 1640,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1641,
		prev = 0,
		id = 1640,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			6,
			7
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[1641] = {
		trans_use_gold = 60,
		next = 1642,
		base = 1640,
		restore_gold = 20,
		destory_gold = 14,
		prev = 1640,
		id = 1641,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1642] = {
		trans_use_gold = 100,
		next = 1643,
		base = 1640,
		restore_gold = 80,
		destory_gold = 29,
		prev = 1641,
		id = 1642,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1643] = {
		trans_use_gold = 160,
		next = 1644,
		base = 1640,
		restore_gold = 180,
		destory_gold = 54,
		prev = 1642,
		id = 1643,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1644] = {
		trans_use_gold = 220,
		next = 1645,
		base = 1640,
		restore_gold = 340,
		destory_gold = 94,
		prev = 1643,
		id = 1644,
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
				4
			},
			{
				17002,
				2
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
	[1645] = {
		trans_use_gold = 280,
		next = 1646,
		base = 1640,
		restore_gold = 560,
		destory_gold = 149,
		prev = 1644,
		id = 1645,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[1646] = {
		trans_use_gold = 0,
		next = 0,
		base = 1640,
		restore_gold = 840,
		destory_gold = 219,
		prev = 1645,
		id = 1646,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[1700] = {
		important = 1,
		destory_gold = 1,
		type = 10,
		group = 1700,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1701,
		prev = 0,
		id = 1700,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[1701] = {
		trans_use_gold = 60,
		next = 1702,
		base = 1700,
		restore_gold = 20,
		destory_gold = 6,
		prev = 1700,
		id = 1701,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1702] = {
		trans_use_gold = 100,
		next = 1703,
		base = 1700,
		restore_gold = 80,
		destory_gold = 21,
		prev = 1701,
		id = 1702,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1703] = {
		trans_use_gold = 0,
		next = 0,
		base = 1700,
		restore_gold = 180,
		destory_gold = 46,
		prev = 1702,
		id = 1703,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1720] = {
		important = 1,
		destory_gold = 4,
		type = 10,
		group = 1720,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1721,
		prev = 0,
		id = 1720,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[1721] = {
		trans_use_gold = 60,
		next = 1722,
		base = 1720,
		restore_gold = 20,
		destory_gold = 9,
		prev = 1720,
		id = 1721,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1722] = {
		trans_use_gold = 100,
		next = 1723,
		base = 1720,
		restore_gold = 80,
		destory_gold = 24,
		prev = 1721,
		id = 1722,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1723] = {
		trans_use_gold = 0,
		next = 0,
		base = 1720,
		restore_gold = 180,
		destory_gold = 49,
		prev = 1722,
		id = 1723,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1740] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 1740,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1741,
		prev = 0,
		id = 1740,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[1741] = {
		trans_use_gold = 60,
		next = 1742,
		base = 1740,
		restore_gold = 20,
		destory_gold = 14,
		prev = 1740,
		id = 1741,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1742] = {
		trans_use_gold = 100,
		next = 1743,
		base = 1740,
		restore_gold = 80,
		destory_gold = 29,
		prev = 1741,
		id = 1742,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1743] = {
		trans_use_gold = 160,
		next = 1744,
		base = 1740,
		restore_gold = 180,
		destory_gold = 54,
		prev = 1742,
		id = 1743,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1744] = {
		trans_use_gold = 220,
		next = 1745,
		base = 1740,
		restore_gold = 340,
		destory_gold = 94,
		prev = 1743,
		id = 1744,
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
				4
			},
			{
				17002,
				2
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
	[1745] = {
		trans_use_gold = 280,
		next = 1746,
		base = 1740,
		restore_gold = 560,
		destory_gold = 149,
		prev = 1744,
		id = 1745,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[1746] = {
		trans_use_gold = 0,
		next = 0,
		base = 1740,
		restore_gold = 840,
		destory_gold = 219,
		prev = 1745,
		id = 1746,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[1800] = {
		important = 1,
		destory_gold = 4,
		type = 10,
		group = 1800,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1801,
		prev = 0,
		id = 1800,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[1801] = {
		trans_use_gold = 60,
		next = 1802,
		base = 1800,
		restore_gold = 20,
		destory_gold = 9,
		prev = 1800,
		id = 1801,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1802] = {
		trans_use_gold = 100,
		next = 1803,
		base = 1800,
		restore_gold = 80,
		destory_gold = 24,
		prev = 1801,
		id = 1802,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1803] = {
		trans_use_gold = 0,
		next = 0,
		base = 1800,
		restore_gold = 180,
		destory_gold = 49,
		prev = 1802,
		id = 1803,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1820] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 1820,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1821,
		prev = 0,
		id = 1820,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[1821] = {
		trans_use_gold = 60,
		next = 1822,
		base = 1820,
		restore_gold = 20,
		destory_gold = 14,
		prev = 1820,
		id = 1821,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1822] = {
		trans_use_gold = 100,
		next = 1823,
		base = 1820,
		restore_gold = 80,
		destory_gold = 29,
		prev = 1821,
		id = 1822,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1823] = {
		trans_use_gold = 160,
		next = 1824,
		base = 1820,
		restore_gold = 180,
		destory_gold = 54,
		prev = 1822,
		id = 1823,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1824] = {
		trans_use_gold = 220,
		next = 1825,
		base = 1820,
		restore_gold = 340,
		destory_gold = 94,
		prev = 1823,
		id = 1824,
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
				4
			},
			{
				17002,
				2
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
	[1825] = {
		trans_use_gold = 280,
		next = 1826,
		base = 1820,
		restore_gold = 560,
		destory_gold = 149,
		prev = 1824,
		id = 1825,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[1826] = {
		trans_use_gold = 0,
		next = 0,
		base = 1820,
		restore_gold = 840,
		destory_gold = 219,
		prev = 1825,
		id = 1826,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[1840] = {
		important = 1,
		destory_gold = 16,
		type = 10,
		group = 1840,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1841,
		prev = 0,
		id = 1840,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17002,
				1
			}
		},
		restore_item = {}
	},
	[1841] = {
		trans_use_gold = 60,
		next = 1842,
		base = 1840,
		restore_gold = 20,
		destory_gold = 21,
		prev = 1840,
		id = 1841,
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
	[1842] = {
		trans_use_gold = 100,
		next = 1843,
		base = 1840,
		restore_gold = 80,
		destory_gold = 36,
		prev = 1841,
		id = 1842,
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
	[1843] = {
		trans_use_gold = 160,
		next = 1844,
		base = 1840,
		restore_gold = 180,
		destory_gold = 61,
		prev = 1842,
		id = 1843,
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
	[1844] = {
		trans_use_gold = 220,
		next = 1845,
		base = 1840,
		restore_gold = 340,
		destory_gold = 101,
		prev = 1843,
		id = 1844,
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
	[1845] = {
		trans_use_gold = 280,
		next = 1846,
		base = 1840,
		restore_gold = 560,
		destory_gold = 156,
		prev = 1844,
		id = 1845,
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
	[1846] = {
		trans_use_gold = 360,
		next = 1847,
		base = 1840,
		restore_gold = 840,
		destory_gold = 226,
		prev = 1845,
		id = 1846,
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
	[1847] = {
		trans_use_gold = 440,
		next = 1848,
		base = 1840,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 1846,
		id = 1847,
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
	[1848] = {
		trans_use_gold = 520,
		next = 1849,
		base = 1840,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 1847,
		id = 1848,
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
	[1849] = {
		trans_use_gold = 600,
		next = 1850,
		base = 1840,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 1848,
		id = 1849,
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
	[1850] = {
		trans_use_gold = 0,
		next = 0,
		base = 1840,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 1849,
		id = 1850,
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
	[1900] = {
		important = 1,
		destory_gold = 1,
		type = 10,
		group = 1900,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1901,
		prev = 0,
		id = 1900,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[1901] = {
		trans_use_gold = 60,
		next = 1902,
		base = 1900,
		restore_gold = 20,
		destory_gold = 6,
		prev = 1900,
		id = 1901,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1902] = {
		trans_use_gold = 100,
		next = 1903,
		base = 1900,
		restore_gold = 80,
		destory_gold = 21,
		prev = 1901,
		id = 1902,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1903] = {
		trans_use_gold = 0,
		next = 0,
		base = 1900,
		restore_gold = 180,
		destory_gold = 46,
		prev = 1902,
		id = 1903,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1920] = {
		important = 1,
		destory_gold = 4,
		type = 10,
		group = 1920,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1921,
		prev = 0,
		id = 1920,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[1921] = {
		trans_use_gold = 60,
		next = 1922,
		base = 1920,
		restore_gold = 20,
		destory_gold = 9,
		prev = 1920,
		id = 1921,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1922] = {
		trans_use_gold = 100,
		next = 1923,
		base = 1920,
		restore_gold = 80,
		destory_gold = 24,
		prev = 1921,
		id = 1922,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1923] = {
		trans_use_gold = 0,
		next = 0,
		base = 1920,
		restore_gold = 180,
		destory_gold = 49,
		prev = 1922,
		id = 1923,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1940] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 1940,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 1941,
		prev = 0,
		id = 1940,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[1941] = {
		trans_use_gold = 60,
		next = 1942,
		base = 1940,
		restore_gold = 20,
		destory_gold = 14,
		prev = 1940,
		id = 1941,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[1942] = {
		trans_use_gold = 100,
		next = 1943,
		base = 1940,
		restore_gold = 80,
		destory_gold = 29,
		prev = 1941,
		id = 1942,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[1943] = {
		trans_use_gold = 160,
		next = 1944,
		base = 1940,
		restore_gold = 180,
		destory_gold = 54,
		prev = 1942,
		id = 1943,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[1944] = {
		trans_use_gold = 220,
		next = 1945,
		base = 1940,
		restore_gold = 340,
		destory_gold = 94,
		prev = 1943,
		id = 1944,
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
				4
			},
			{
				17002,
				2
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
	[1945] = {
		trans_use_gold = 280,
		next = 1946,
		base = 1940,
		restore_gold = 560,
		destory_gold = 149,
		prev = 1944,
		id = 1945,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[1946] = {
		trans_use_gold = 0,
		next = 0,
		base = 1940,
		restore_gold = 840,
		destory_gold = 219,
		prev = 1945,
		id = 1946,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[2000] = {
		important = 1,
		destory_gold = 4,
		type = 10,
		group = 2000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2001,
		prev = 0,
		id = 2000,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[2001] = {
		trans_use_gold = 60,
		next = 2002,
		base = 2000,
		restore_gold = 20,
		destory_gold = 9,
		prev = 2000,
		id = 2001,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[2002] = {
		trans_use_gold = 100,
		next = 2003,
		base = 2000,
		restore_gold = 80,
		destory_gold = 24,
		prev = 2001,
		id = 2002,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[2003] = {
		trans_use_gold = 0,
		next = 0,
		base = 2000,
		restore_gold = 180,
		destory_gold = 49,
		prev = 2002,
		id = 2003,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[2020] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 2020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2021,
		prev = 0,
		id = 2020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[2021] = {
		trans_use_gold = 60,
		next = 2022,
		base = 2020,
		restore_gold = 20,
		destory_gold = 14,
		prev = 2020,
		id = 2021,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[2022] = {
		trans_use_gold = 100,
		next = 2023,
		base = 2020,
		restore_gold = 80,
		destory_gold = 29,
		prev = 2021,
		id = 2022,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[2023] = {
		trans_use_gold = 160,
		next = 2024,
		base = 2020,
		restore_gold = 180,
		destory_gold = 54,
		prev = 2022,
		id = 2023,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[2024] = {
		trans_use_gold = 220,
		next = 2025,
		base = 2020,
		restore_gold = 340,
		destory_gold = 94,
		prev = 2023,
		id = 2024,
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
				4
			},
			{
				17002,
				2
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
	[2025] = {
		trans_use_gold = 280,
		next = 2026,
		base = 2020,
		restore_gold = 560,
		destory_gold = 149,
		prev = 2024,
		id = 2025,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[2026] = {
		trans_use_gold = 0,
		next = 0,
		base = 2020,
		restore_gold = 840,
		destory_gold = 219,
		prev = 2025,
		id = 2026,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[2040] = {
		important = 1,
		destory_gold = 16,
		type = 10,
		group = 2040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2041,
		prev = 0,
		id = 2040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17002,
				1
			}
		},
		restore_item = {}
	},
	[2041] = {
		trans_use_gold = 60,
		next = 2042,
		base = 2040,
		restore_gold = 20,
		destory_gold = 21,
		prev = 2040,
		id = 2041,
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
	[2042] = {
		trans_use_gold = 100,
		next = 2043,
		base = 2040,
		restore_gold = 80,
		destory_gold = 36,
		prev = 2041,
		id = 2042,
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
	[2043] = {
		trans_use_gold = 160,
		next = 2044,
		base = 2040,
		restore_gold = 180,
		destory_gold = 61,
		prev = 2042,
		id = 2043,
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
	[2044] = {
		trans_use_gold = 220,
		next = 2045,
		base = 2040,
		restore_gold = 340,
		destory_gold = 101,
		prev = 2043,
		id = 2044,
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
	[2045] = {
		trans_use_gold = 280,
		next = 2046,
		base = 2040,
		restore_gold = 560,
		destory_gold = 156,
		prev = 2044,
		id = 2045,
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
	[2046] = {
		trans_use_gold = 360,
		next = 2047,
		base = 2040,
		restore_gold = 840,
		destory_gold = 226,
		prev = 2045,
		id = 2046,
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
	[2047] = {
		trans_use_gold = 440,
		next = 2048,
		base = 2040,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 2046,
		id = 2047,
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
	[2048] = {
		trans_use_gold = 520,
		next = 2049,
		base = 2040,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 2047,
		id = 2048,
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
	[2049] = {
		trans_use_gold = 600,
		next = 2050,
		base = 2040,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 2048,
		id = 2049,
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
	[2050] = {
		trans_use_gold = 0,
		next = 0,
		base = 2040,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 2049,
		id = 2050,
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
	[2100] = {
		important = 1,
		destory_gold = 4,
		type = 10,
		group = 2100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2101,
		prev = 0,
		id = 2100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			3,
			4,
			5,
			8,
			11,
			12,
			13,
			17,
			18
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[2101] = {
		trans_use_gold = 60,
		next = 2102,
		base = 2100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 2100,
		id = 2101,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[2102] = {
		trans_use_gold = 100,
		next = 2103,
		base = 2100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 2101,
		id = 2102,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[2103] = {
		trans_use_gold = 0,
		next = 0,
		base = 2100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 2102,
		id = 2103,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[2120] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 2120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2121,
		prev = 0,
		id = 2120,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			3,
			4,
			5,
			8,
			11,
			12,
			13,
			17,
			18
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[2121] = {
		trans_use_gold = 60,
		next = 2122,
		base = 2120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 2120,
		id = 2121,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[2122] = {
		trans_use_gold = 100,
		next = 2123,
		base = 2120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 2121,
		id = 2122,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[2123] = {
		trans_use_gold = 160,
		next = 2124,
		base = 2120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 2122,
		id = 2123,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[2124] = {
		trans_use_gold = 220,
		next = 2125,
		base = 2120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 2123,
		id = 2124,
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
				4
			},
			{
				17002,
				2
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
	[2125] = {
		trans_use_gold = 280,
		next = 2126,
		base = 2120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 2124,
		id = 2125,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[2126] = {
		trans_use_gold = 0,
		next = 0,
		base = 2120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 2125,
		id = 2126,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[2140] = {
		important = 1,
		destory_gold = 16,
		type = 10,
		group = 2140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2141,
		prev = 0,
		id = 2140,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			1,
			2,
			3,
			4,
			5,
			8,
			11,
			12,
			13,
			17,
			18
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17002,
				1
			}
		},
		restore_item = {}
	},
	[2141] = {
		trans_use_gold = 60,
		next = 2142,
		base = 2140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 2140,
		id = 2141,
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
	[2142] = {
		trans_use_gold = 100,
		next = 2143,
		base = 2140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 2141,
		id = 2142,
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
	[2143] = {
		trans_use_gold = 160,
		next = 2144,
		base = 2140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 2142,
		id = 2143,
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
	[2144] = {
		trans_use_gold = 220,
		next = 2145,
		base = 2140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 2143,
		id = 2144,
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
	[2145] = {
		trans_use_gold = 280,
		next = 2146,
		base = 2140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 2144,
		id = 2145,
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
	[2146] = {
		trans_use_gold = 360,
		next = 2147,
		base = 2140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 2145,
		id = 2146,
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
	[2147] = {
		trans_use_gold = 440,
		next = 2148,
		base = 2140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 2146,
		id = 2147,
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
	[2148] = {
		trans_use_gold = 520,
		next = 2149,
		base = 2140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 2147,
		id = 2148,
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
	[2149] = {
		trans_use_gold = 600,
		next = 2150,
		base = 2140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 2148,
		id = 2149,
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
	[2150] = {
		trans_use_gold = 0,
		next = 0,
		base = 2140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 2149,
		id = 2150,
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
	[2200] = {
		important = 1,
		destory_gold = 4,
		type = 10,
		group = 2200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2201,
		prev = 0,
		id = 2200,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			6,
			7
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[2201] = {
		trans_use_gold = 60,
		next = 2202,
		base = 2200,
		restore_gold = 20,
		destory_gold = 9,
		prev = 2200,
		id = 2201,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[2202] = {
		trans_use_gold = 100,
		next = 2203,
		base = 2200,
		restore_gold = 80,
		destory_gold = 24,
		prev = 2201,
		id = 2202,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[2203] = {
		trans_use_gold = 0,
		next = 0,
		base = 2200,
		restore_gold = 180,
		destory_gold = 49,
		prev = 2202,
		id = 2203,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[2220] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 2220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2221,
		prev = 0,
		id = 2220,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			6,
			7
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[2221] = {
		trans_use_gold = 60,
		next = 2222,
		base = 2220,
		restore_gold = 20,
		destory_gold = 14,
		prev = 2220,
		id = 2221,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[2222] = {
		trans_use_gold = 100,
		next = 2223,
		base = 2220,
		restore_gold = 80,
		destory_gold = 29,
		prev = 2221,
		id = 2222,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[2223] = {
		trans_use_gold = 160,
		next = 2224,
		base = 2220,
		restore_gold = 180,
		destory_gold = 54,
		prev = 2222,
		id = 2223,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[2224] = {
		trans_use_gold = 220,
		next = 2225,
		base = 2220,
		restore_gold = 340,
		destory_gold = 94,
		prev = 2223,
		id = 2224,
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
				4
			},
			{
				17002,
				2
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
	[2225] = {
		trans_use_gold = 280,
		next = 2226,
		base = 2220,
		restore_gold = 560,
		destory_gold = 149,
		prev = 2224,
		id = 2225,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[2226] = {
		trans_use_gold = 0,
		next = 0,
		base = 2220,
		restore_gold = 840,
		destory_gold = 219,
		prev = 2225,
		id = 2226,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[2240] = {
		important = 1,
		destory_gold = 16,
		type = 10,
		group = 2240,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2241,
		prev = 0,
		id = 2240,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			6,
			7
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17002,
				1
			}
		},
		restore_item = {}
	},
	[2241] = {
		trans_use_gold = 60,
		next = 2242,
		base = 2240,
		restore_gold = 20,
		destory_gold = 21,
		prev = 2240,
		id = 2241,
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
	[2242] = {
		trans_use_gold = 100,
		next = 2243,
		base = 2240,
		restore_gold = 80,
		destory_gold = 36,
		prev = 2241,
		id = 2242,
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
	[2243] = {
		trans_use_gold = 160,
		next = 2244,
		base = 2240,
		restore_gold = 180,
		destory_gold = 61,
		prev = 2242,
		id = 2243,
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
	[2244] = {
		trans_use_gold = 220,
		next = 2245,
		base = 2240,
		restore_gold = 340,
		destory_gold = 101,
		prev = 2243,
		id = 2244,
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
	[2245] = {
		trans_use_gold = 280,
		next = 2246,
		base = 2240,
		restore_gold = 560,
		destory_gold = 156,
		prev = 2244,
		id = 2245,
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
	[2246] = {
		trans_use_gold = 360,
		next = 2247,
		base = 2240,
		restore_gold = 840,
		destory_gold = 226,
		prev = 2245,
		id = 2246,
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
	[2247] = {
		trans_use_gold = 440,
		next = 2248,
		base = 2240,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 2246,
		id = 2247,
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
	[2248] = {
		trans_use_gold = 520,
		next = 2249,
		base = 2240,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 2247,
		id = 2248,
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
	[2249] = {
		trans_use_gold = 600,
		next = 2250,
		base = 2240,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 2248,
		id = 2249,
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
	[2250] = {
		trans_use_gold = 0,
		next = 0,
		base = 2240,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 2249,
		id = 2250,
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
	[2300] = {
		important = 1,
		destory_gold = 4,
		type = 10,
		group = 2300,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2301,
		prev = 0,
		id = 2300,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			6,
			7
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[2301] = {
		trans_use_gold = 60,
		next = 2302,
		base = 2300,
		restore_gold = 20,
		destory_gold = 9,
		prev = 2300,
		id = 2301,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[2302] = {
		trans_use_gold = 100,
		next = 2303,
		base = 2300,
		restore_gold = 80,
		destory_gold = 24,
		prev = 2301,
		id = 2302,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[2303] = {
		trans_use_gold = 0,
		next = 0,
		base = 2300,
		restore_gold = 180,
		destory_gold = 49,
		prev = 2302,
		id = 2303,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[2320] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 2320,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2321,
		prev = 0,
		id = 2320,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			6,
			7
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[2321] = {
		trans_use_gold = 60,
		next = 2322,
		base = 2320,
		restore_gold = 20,
		destory_gold = 14,
		prev = 2320,
		id = 2321,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[2322] = {
		trans_use_gold = 100,
		next = 2323,
		base = 2320,
		restore_gold = 80,
		destory_gold = 29,
		prev = 2321,
		id = 2322,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[2323] = {
		trans_use_gold = 160,
		next = 2324,
		base = 2320,
		restore_gold = 180,
		destory_gold = 54,
		prev = 2322,
		id = 2323,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[2324] = {
		trans_use_gold = 220,
		next = 2325,
		base = 2320,
		restore_gold = 340,
		destory_gold = 94,
		prev = 2323,
		id = 2324,
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
				4
			},
			{
				17002,
				2
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
	[2325] = {
		trans_use_gold = 280,
		next = 2326,
		base = 2320,
		restore_gold = 560,
		destory_gold = 149,
		prev = 2324,
		id = 2325,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[2326] = {
		trans_use_gold = 0,
		next = 0,
		base = 2320,
		restore_gold = 840,
		destory_gold = 219,
		prev = 2325,
		id = 2326,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[2340] = {
		important = 1,
		destory_gold = 16,
		type = 10,
		group = 2340,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2341,
		prev = 0,
		id = 2340,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			6,
			7
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17002,
				1
			}
		},
		restore_item = {}
	},
	[2341] = {
		trans_use_gold = 60,
		next = 2342,
		base = 2340,
		restore_gold = 20,
		destory_gold = 21,
		prev = 2340,
		id = 2341,
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
	[2342] = {
		trans_use_gold = 100,
		next = 2343,
		base = 2340,
		restore_gold = 80,
		destory_gold = 36,
		prev = 2341,
		id = 2342,
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
	[2343] = {
		trans_use_gold = 160,
		next = 2344,
		base = 2340,
		restore_gold = 180,
		destory_gold = 61,
		prev = 2342,
		id = 2343,
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
	[2344] = {
		trans_use_gold = 220,
		next = 2345,
		base = 2340,
		restore_gold = 340,
		destory_gold = 101,
		prev = 2343,
		id = 2344,
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
	[2345] = {
		trans_use_gold = 280,
		next = 2346,
		base = 2340,
		restore_gold = 560,
		destory_gold = 156,
		prev = 2344,
		id = 2345,
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
	[2346] = {
		trans_use_gold = 360,
		next = 2347,
		base = 2340,
		restore_gold = 840,
		destory_gold = 226,
		prev = 2345,
		id = 2346,
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
	[2347] = {
		trans_use_gold = 440,
		next = 2348,
		base = 2340,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 2346,
		id = 2347,
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
	[2348] = {
		trans_use_gold = 520,
		next = 2349,
		base = 2340,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 2347,
		id = 2348,
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
	[2349] = {
		trans_use_gold = 600,
		next = 2350,
		base = 2340,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 2348,
		id = 2349,
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
	[2350] = {
		trans_use_gold = 0,
		next = 0,
		base = 2340,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 2349,
		id = 2350,
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
	[2400] = {
		important = 1,
		destory_gold = 4,
		type = 10,
		group = 2400,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2401,
		prev = 0,
		id = 2400,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[2401] = {
		trans_use_gold = 60,
		next = 2402,
		base = 2400,
		restore_gold = 20,
		destory_gold = 9,
		prev = 2400,
		id = 2401,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[2402] = {
		trans_use_gold = 100,
		next = 2403,
		base = 2400,
		restore_gold = 80,
		destory_gold = 24,
		prev = 2401,
		id = 2402,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[2403] = {
		trans_use_gold = 0,
		next = 0,
		base = 2400,
		restore_gold = 180,
		destory_gold = 49,
		prev = 2402,
		id = 2403,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[2420] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 2420,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2421,
		prev = 0,
		id = 2420,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[2421] = {
		trans_use_gold = 60,
		next = 2422,
		base = 2420,
		restore_gold = 20,
		destory_gold = 14,
		prev = 2420,
		id = 2421,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[2422] = {
		trans_use_gold = 100,
		next = 2423,
		base = 2420,
		restore_gold = 80,
		destory_gold = 29,
		prev = 2421,
		id = 2422,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[2423] = {
		trans_use_gold = 160,
		next = 2424,
		base = 2420,
		restore_gold = 180,
		destory_gold = 54,
		prev = 2422,
		id = 2423,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[2424] = {
		trans_use_gold = 220,
		next = 2425,
		base = 2420,
		restore_gold = 340,
		destory_gold = 94,
		prev = 2423,
		id = 2424,
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
				4
			},
			{
				17002,
				2
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
	[2425] = {
		trans_use_gold = 280,
		next = 2426,
		base = 2420,
		restore_gold = 560,
		destory_gold = 149,
		prev = 2424,
		id = 2425,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[2426] = {
		trans_use_gold = 0,
		next = 0,
		base = 2420,
		restore_gold = 840,
		destory_gold = 219,
		prev = 2425,
		id = 2426,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[2440] = {
		important = 1,
		destory_gold = 16,
		type = 10,
		group = 2440,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2441,
		prev = 0,
		id = 2440,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17002,
				1
			}
		},
		restore_item = {}
	},
	[2441] = {
		trans_use_gold = 60,
		next = 2442,
		base = 2440,
		restore_gold = 20,
		destory_gold = 21,
		prev = 2440,
		id = 2441,
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
	[2442] = {
		trans_use_gold = 100,
		next = 2443,
		base = 2440,
		restore_gold = 80,
		destory_gold = 36,
		prev = 2441,
		id = 2442,
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
	[2443] = {
		trans_use_gold = 160,
		next = 2444,
		base = 2440,
		restore_gold = 180,
		destory_gold = 61,
		prev = 2442,
		id = 2443,
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
	[2444] = {
		trans_use_gold = 220,
		next = 2445,
		base = 2440,
		restore_gold = 340,
		destory_gold = 101,
		prev = 2443,
		id = 2444,
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
	[2445] = {
		trans_use_gold = 280,
		next = 2446,
		base = 2440,
		restore_gold = 560,
		destory_gold = 156,
		prev = 2444,
		id = 2445,
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
	[2446] = {
		trans_use_gold = 360,
		next = 2447,
		base = 2440,
		restore_gold = 840,
		destory_gold = 226,
		prev = 2445,
		id = 2446,
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
	[2447] = {
		trans_use_gold = 440,
		next = 2448,
		base = 2440,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 2446,
		id = 2447,
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
	[2448] = {
		trans_use_gold = 520,
		next = 2449,
		base = 2440,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 2447,
		id = 2448,
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
	[2449] = {
		trans_use_gold = 600,
		next = 2450,
		base = 2440,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 2448,
		id = 2449,
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
	[2450] = {
		trans_use_gold = 0,
		next = 0,
		base = 2440,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 2449,
		id = 2450,
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
	[2500] = {
		important = 1,
		destory_gold = 1,
		type = 10,
		group = 2500,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2501,
		prev = 0,
		id = 2500,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[2501] = {
		trans_use_gold = 60,
		next = 2502,
		base = 2500,
		restore_gold = 20,
		destory_gold = 6,
		prev = 2500,
		id = 2501,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[2502] = {
		trans_use_gold = 100,
		next = 2503,
		base = 2500,
		restore_gold = 80,
		destory_gold = 21,
		prev = 2501,
		id = 2502,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[2503] = {
		trans_use_gold = 0,
		next = 0,
		base = 2500,
		restore_gold = 180,
		destory_gold = 46,
		prev = 2502,
		id = 2503,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[2520] = {
		important = 1,
		destory_gold = 4,
		type = 10,
		group = 2520,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2521,
		prev = 0,
		id = 2520,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[2521] = {
		trans_use_gold = 60,
		next = 2522,
		base = 2520,
		restore_gold = 20,
		destory_gold = 9,
		prev = 2520,
		id = 2521,
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
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[2522] = {
		trans_use_gold = 100,
		next = 2523,
		base = 2520,
		restore_gold = 80,
		destory_gold = 24,
		prev = 2521,
		id = 2522,
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
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[2523] = {
		trans_use_gold = 0,
		next = 0,
		base = 2520,
		restore_gold = 180,
		destory_gold = 49,
		prev = 2522,
		id = 2523,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				3
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[2540] = {
		important = 1,
		destory_gold = 9,
		type = 10,
		group = 2540,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2541,
		prev = 0,
		id = 2540,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17001,
				1
			}
		},
		restore_item = {}
	},
	[2541] = {
		trans_use_gold = 60,
		next = 2542,
		base = 2540,
		restore_gold = 20,
		destory_gold = 14,
		prev = 2540,
		id = 2541,
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
				2
			}
		},
		restore_item = {
			{
				17001,
				1
			}
		}
	},
	[2542] = {
		trans_use_gold = 100,
		next = 2543,
		base = 2540,
		restore_gold = 80,
		destory_gold = 29,
		prev = 2541,
		id = 2542,
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
				3
			}
		},
		restore_item = {
			{
				17001,
				4
			}
		}
	},
	[2543] = {
		trans_use_gold = 160,
		next = 2544,
		base = 2540,
		restore_gold = 180,
		destory_gold = 54,
		prev = 2542,
		id = 2543,
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
				4
			}
		},
		restore_item = {
			{
				17001,
				9
			}
		}
	},
	[2544] = {
		trans_use_gold = 220,
		next = 2545,
		base = 2540,
		restore_gold = 340,
		destory_gold = 94,
		prev = 2543,
		id = 2544,
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
				4
			},
			{
				17002,
				2
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
	[2545] = {
		trans_use_gold = 280,
		next = 2546,
		base = 2540,
		restore_gold = 560,
		destory_gold = 149,
		prev = 2544,
		id = 2545,
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
				4
			},
			{
				17002,
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
				19
			}
		}
	},
	[2546] = {
		trans_use_gold = 0,
		next = 0,
		base = 2540,
		restore_gold = 840,
		destory_gold = 219,
		prev = 2545,
		id = 2546,
		level = 7,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				8
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
	[2600] = {
		important = 1,
		destory_gold = 16,
		type = 10,
		group = 2600,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 2601,
		prev = 0,
		id = 2600,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			4,
			5,
			6,
			7,
			10,
			12,
			13
		},
		trans_use_item = {
			{
				17001,
				1
			}
		},
		destory_item = {
			{
				17002,
				1
			}
		},
		restore_item = {}
	},
	[2601] = {
		trans_use_gold = 60,
		next = 2602,
		base = 2600,
		restore_gold = 20,
		destory_gold = 21,
		prev = 2600,
		id = 2601,
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
	[2602] = {
		trans_use_gold = 100,
		next = 2603,
		base = 2600,
		restore_gold = 80,
		destory_gold = 36,
		prev = 2601,
		id = 2602,
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
	[2603] = {
		trans_use_gold = 160,
		next = 2604,
		base = 2600,
		restore_gold = 180,
		destory_gold = 61,
		prev = 2602,
		id = 2603,
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
	[2604] = {
		trans_use_gold = 220,
		next = 2605,
		base = 2600,
		restore_gold = 340,
		destory_gold = 101,
		prev = 2603,
		id = 2604,
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
	[2605] = {
		trans_use_gold = 280,
		next = 2606,
		base = 2600,
		restore_gold = 560,
		destory_gold = 156,
		prev = 2604,
		id = 2605,
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
	[2606] = {
		trans_use_gold = 360,
		next = 2607,
		base = 2600,
		restore_gold = 840,
		destory_gold = 226,
		prev = 2605,
		id = 2606,
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
	[2607] = {
		trans_use_gold = 440,
		next = 2608,
		base = 2600,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 2606,
		id = 2607,
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
	[2608] = {
		trans_use_gold = 520,
		next = 2609,
		base = 2600,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 2607,
		id = 2608,
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
	[2609] = {
		trans_use_gold = 600,
		next = 2610,
		base = 2600,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 2608,
		id = 2609,
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
	[2610] = {
		trans_use_gold = 0,
		next = 0,
		base = 2600,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 2609,
		id = 2610,
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
	[2620] = {
		important = 1,
		destory_gold = 25,
		type = 10,
		group = 2620,
		trans_use_gold = 30,
		restore_gold = 0,
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
			13
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
		restore_item = {}
	},
	[2621] = {
		trans_use_gold = 90,
		next = 2622,
		base = 2620,
		restore_gold = 20,
		destory_gold = 33,
		prev = 2620,
		id = 2621,
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
				1
			}
		}
	},
	[2622] = {
		trans_use_gold = 150,
		next = 2623,
		base = 2620,
		restore_gold = 80,
		destory_gold = 55,
		prev = 2621,
		id = 2622,
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
				4
			}
		}
	},
	[2623] = {
		trans_use_gold = 240,
		next = 2624,
		base = 2620,
		restore_gold = 180,
		destory_gold = 93,
		prev = 2622,
		id = 2623,
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
				9
			}
		}
	},
	[2624] = {
		trans_use_gold = 330,
		next = 2625,
		base = 2620,
		restore_gold = 340,
		destory_gold = 153,
		prev = 2623,
		id = 2624,
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
				9
			},
			{
				17002,
				8
			}
		}
	},
	[2625] = {
		trans_use_gold = 420,
		next = 2626,
		base = 2620,
		restore_gold = 560,
		destory_gold = 235,
		prev = 2624,
		id = 2625,
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
				9
			},
			{
				17002,
				19
			}
		}
	},
	[2626] = {
		trans_use_gold = 540,
		next = 2627,
		base = 2620,
		restore_gold = 840,
		destory_gold = 340,
		prev = 2625,
		id = 2626,
		level = 7,
		trans_use_item = {
			{
				17003,
				27
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
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
		trans_use_gold = 660,
		next = 2628,
		base = 2620,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 2626,
		id = 2627,
		level = 8,
		trans_use_item = {
			{
				17003,
				33
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				7
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
		trans_use_gold = 780,
		next = 2629,
		base = 2620,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 2627,
		id = 2628,
		level = 9,
		trans_use_item = {
			{
				17003,
				39
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				15
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
		trans_use_gold = 900,
		next = 2630,
		base = 2620,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 2628,
		id = 2629,
		level = 10,
		trans_use_item = {
			{
				17003,
				45
			}
		},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
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
				66
			}
		}
	},
	[2630] = {
		trans_use_gold = 0,
		next = 0,
		base = 2620,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 2629,
		id = 2630,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				4
			},
			{
				17002,
				12
			},
			{
				17003,
				36
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
		trans_use_gold = 60,
		restore_gold = 0,
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
			13
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
		restore_item = {}
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
	},
	[2644] = {
		trans_use_gold = 660,
		next = 2645,
		base = 2640,
		restore_gold = 1020,
		destory_gold = 291,
		prev = 2643,
		id = 2644,
		level = 5,
		trans_use_item = {
			{
				17002,
				33
			}
		},
		destory_item = {
			{
				17001,
				7
			},
			{
				17002,
				6
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
			},
			{
				17002,
				24
			}
		}
	},
	[2645] = {
		trans_use_gold = 840,
		next = 2646,
		base = 2640,
		restore_gold = 1680,
		destory_gold = 456,
		prev = 2644,
		id = 2645,
		level = 6,
		trans_use_item = {
			{
				17002,
				42
			}
		},
		destory_item = {
			{
				17001,
				7
			},
			{
				17002,
				14
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
			},
			{
				17002,
				57
			}
		}
	},
	[2646] = {
		trans_use_gold = 1080,
		next = 2647,
		base = 2640,
		restore_gold = 2520,
		destory_gold = 666,
		prev = 2645,
		id = 2646,
		level = 7,
		trans_use_item = {
			{
				17003,
				54
			}
		},
		destory_item = {
			{
				17001,
				7
			},
			{
				17002,
				25
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
			},
			{
				17002,
				99
			}
		}
	},
	[2647] = {
		trans_use_gold = 1320,
		next = 2648,
		base = 2640,
		restore_gold = 3600,
		destory_gold = 936,
		prev = 2646,
		id = 2647,
		level = 8,
		trans_use_item = {
			{
				17003,
				66
			}
		},
		destory_item = {
			{
				17001,
				7
			},
			{
				17002,
				25
			},
			{
				17003,
				15
			}
		},
		restore_item = {
			{
				17001,
				27
			},
			{
				17002,
				99
			},
			{
				17003,
				54
			}
		}
	},
	[2648] = {
		trans_use_gold = 1560,
		next = 2649,
		base = 2640,
		restore_gold = 4920,
		destory_gold = 1266,
		prev = 2647,
		id = 2648,
		level = 9,
		trans_use_item = {
			{
				17003,
				78
			}
		},
		destory_item = {
			{
				17001,
				7
			},
			{
				17002,
				25
			},
			{
				17003,
				31
			}
		},
		restore_item = {
			{
				17001,
				27
			},
			{
				17002,
				99
			},
			{
				17003,
				120
			}
		}
	},
	[2649] = {
		trans_use_gold = 1800,
		next = 2650,
		base = 2640,
		restore_gold = 6480,
		destory_gold = 1656,
		prev = 2648,
		id = 2649,
		level = 10,
		trans_use_item = {
			{
				17003,
				90
			}
		},
		destory_item = {
			{
				17001,
				7
			},
			{
				17002,
				25
			},
			{
				17003,
				51
			}
		},
		restore_item = {
			{
				17001,
				27
			},
			{
				17002,
				99
			},
			{
				17003,
				198
			}
		}
	},
	[2650] = {
		trans_use_gold = 0,
		next = 0,
		base = 2640,
		restore_gold = 8280,
		destory_gold = 2106,
		prev = 2649,
		id = 2650,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17001,
				7
			},
			{
				17002,
				25
			},
			{
				17003,
				73
			}
		},
		restore_item = {
			{
				17001,
				27
			},
			{
				17002,
				99
			},
			{
				17003,
				288
			}
		}
	},
	[5000] = {
		important = 1,
		destory_gold = 1,
		type = 5,
		group = 5000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 5001,
		prev = 0,
		id = 5000,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17021,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[5001] = {
		trans_use_gold = 60,
		next = 5002,
		base = 5000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 5000,
		id = 5001,
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
			}
		},
		restore_item = {
			{
				17021,
				1
			}
		}
	},
	[5002] = {
		trans_use_gold = 100,
		next = 5003,
		base = 5000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 5001,
		id = 5002,
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
			}
		},
		restore_item = {
			{
				17021,
				4
			}
		}
	},
	[5003] = {
		trans_use_gold = 0,
		next = 0,
		base = 5000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 5002,
		id = 5003,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17021,
				3
			}
		},
		restore_item = {
			{
				17021,
				9
			}
		}
	},
	[5020] = {
		important = 1,
		destory_gold = 4,
		type = 5,
		group = 5020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 5021,
		prev = 0,
		id = 5020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17021,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[5021] = {
		trans_use_gold = 60,
		next = 5022,
		base = 5020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 5020,
		id = 5021,
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
			}
		},
		restore_item = {
			{
				17021,
				1
			}
		}
	},
	[5022] = {
		trans_use_gold = 100,
		next = 5023,
		base = 5020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 5021,
		id = 5022,
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
			}
		},
		restore_item = {
			{
				17021,
				4
			}
		}
	},
	[5023] = {
		trans_use_gold = 0,
		next = 0,
		base = 5020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 5022,
		id = 5023,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17021,
				3
			}
		},
		restore_item = {
			{
				17021,
				9
			}
		}
	},
	[5040] = {
		important = 1,
		destory_gold = 9,
		type = 5,
		group = 5040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 5041,
		prev = 0,
		id = 5040,
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
		restore_item = {}
	},
	[5041] = {
		trans_use_gold = 60,
		next = 5042,
		base = 5040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 5040,
		id = 5041,
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
	[5042] = {
		trans_use_gold = 100,
		next = 5043,
		base = 5040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 5041,
		id = 5042,
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
	[5043] = {
		trans_use_gold = 160,
		next = 5044,
		base = 5040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 5042,
		id = 5043,
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
	[5044] = {
		trans_use_gold = 220,
		next = 5045,
		base = 5040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 5043,
		id = 5044,
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
	[5045] = {
		trans_use_gold = 280,
		next = 5046,
		base = 5040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 5044,
		id = 5045,
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
	[5046] = {
		trans_use_gold = 0,
		next = 0,
		base = 5040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 5045,
		id = 5046,
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
	[5100] = {
		important = 1,
		destory_gold = 4,
		type = 5,
		group = 5100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 5101,
		prev = 0,
		id = 5100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17021,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[5101] = {
		trans_use_gold = 60,
		next = 5102,
		base = 5100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 5100,
		id = 5101,
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
			}
		},
		restore_item = {
			{
				17021,
				1
			}
		}
	},
	[5102] = {
		trans_use_gold = 100,
		next = 5103,
		base = 5100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 5101,
		id = 5102,
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
			}
		},
		restore_item = {
			{
				17021,
				4
			}
		}
	},
	[5103] = {
		trans_use_gold = 0,
		next = 0,
		base = 5100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 5102,
		id = 5103,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17021,
				3
			}
		},
		restore_item = {
			{
				17021,
				9
			}
		}
	},
	[5120] = {
		important = 1,
		destory_gold = 9,
		type = 5,
		group = 5120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 5121,
		prev = 0,
		id = 5120,
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
		restore_item = {}
	},
	[5121] = {
		trans_use_gold = 60,
		next = 5122,
		base = 5120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 5120,
		id = 5121,
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
	[5122] = {
		trans_use_gold = 100,
		next = 5123,
		base = 5120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 5121,
		id = 5122,
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
	[5123] = {
		trans_use_gold = 160,
		next = 5124,
		base = 5120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 5122,
		id = 5123,
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
	[5124] = {
		trans_use_gold = 220,
		next = 5125,
		base = 5120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 5123,
		id = 5124,
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
	[5125] = {
		trans_use_gold = 280,
		next = 5126,
		base = 5120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 5124,
		id = 5125,
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
	[5126] = {
		trans_use_gold = 0,
		next = 0,
		base = 5120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 5125,
		id = 5126,
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
	[5140] = {
		important = 1,
		destory_gold = 16,
		type = 5,
		group = 5140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 5141,
		prev = 0,
		id = 5140,
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
		restore_item = {}
	},
	[5141] = {
		trans_use_gold = 60,
		next = 5142,
		base = 5140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 5140,
		id = 5141,
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
	[5142] = {
		trans_use_gold = 100,
		next = 5143,
		base = 5140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 5141,
		id = 5142,
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
	[5143] = {
		trans_use_gold = 160,
		next = 5144,
		base = 5140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 5142,
		id = 5143,
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
	[5144] = {
		trans_use_gold = 220,
		next = 5145,
		base = 5140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 5143,
		id = 5144,
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
	[5145] = {
		trans_use_gold = 280,
		next = 5146,
		base = 5140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 5144,
		id = 5145,
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
	[5146] = {
		trans_use_gold = 360,
		next = 5147,
		base = 5140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 5145,
		id = 5146,
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
	[5147] = {
		trans_use_gold = 440,
		next = 5148,
		base = 5140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 5146,
		id = 5147,
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
	[5148] = {
		trans_use_gold = 520,
		next = 5149,
		base = 5140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 5147,
		id = 5148,
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
	[5149] = {
		trans_use_gold = 600,
		next = 5150,
		base = 5140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 5148,
		id = 5149,
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
	[5150] = {
		trans_use_gold = 0,
		next = 0,
		base = 5140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 5149,
		id = 5150,
		level = 11,
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
	[5200] = {
		important = 1,
		destory_gold = 9,
		type = 5,
		group = 5200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 5201,
		prev = 0,
		id = 5200,
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
		restore_item = {}
	},
	[5201] = {
		trans_use_gold = 60,
		next = 5202,
		base = 5200,
		restore_gold = 20,
		destory_gold = 14,
		prev = 5200,
		id = 5201,
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
	[5202] = {
		trans_use_gold = 100,
		next = 5203,
		base = 5200,
		restore_gold = 80,
		destory_gold = 29,
		prev = 5201,
		id = 5202,
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
	[5203] = {
		trans_use_gold = 160,
		next = 5204,
		base = 5200,
		restore_gold = 180,
		destory_gold = 54,
		prev = 5202,
		id = 5203,
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
	[5204] = {
		trans_use_gold = 220,
		next = 5205,
		base = 5200,
		restore_gold = 340,
		destory_gold = 94,
		prev = 5203,
		id = 5204,
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
	[5205] = {
		trans_use_gold = 280,
		next = 5206,
		base = 5200,
		restore_gold = 560,
		destory_gold = 149,
		prev = 5204,
		id = 5205,
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
	[5206] = {
		trans_use_gold = 0,
		next = 0,
		base = 5200,
		restore_gold = 840,
		destory_gold = 219,
		prev = 5205,
		id = 5206,
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
	[5220] = {
		important = 1,
		destory_gold = 16,
		type = 5,
		group = 5220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 5221,
		prev = 0,
		id = 5220,
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
		restore_item = {}
	},
	[5221] = {
		trans_use_gold = 60,
		next = 5222,
		base = 5220,
		restore_gold = 20,
		destory_gold = 21,
		prev = 5220,
		id = 5221,
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
	[5222] = {
		trans_use_gold = 100,
		next = 5223,
		base = 5220,
		restore_gold = 80,
		destory_gold = 36,
		prev = 5221,
		id = 5222,
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
	[5223] = {
		trans_use_gold = 160,
		next = 5224,
		base = 5220,
		restore_gold = 180,
		destory_gold = 61,
		prev = 5222,
		id = 5223,
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
	[5224] = {
		trans_use_gold = 220,
		next = 5225,
		base = 5220,
		restore_gold = 340,
		destory_gold = 101,
		prev = 5223,
		id = 5224,
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
	[5225] = {
		trans_use_gold = 280,
		next = 5226,
		base = 5220,
		restore_gold = 560,
		destory_gold = 156,
		prev = 5224,
		id = 5225,
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
	[5226] = {
		trans_use_gold = 360,
		next = 5227,
		base = 5220,
		restore_gold = 840,
		destory_gold = 226,
		prev = 5225,
		id = 5226,
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
	[5227] = {
		trans_use_gold = 440,
		next = 5228,
		base = 5220,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 5226,
		id = 5227,
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
	[5228] = {
		trans_use_gold = 520,
		next = 5229,
		base = 5220,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 5227,
		id = 5228,
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
	[5229] = {
		trans_use_gold = 600,
		next = 5230,
		base = 5220,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 5228,
		id = 5229,
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
	[5230] = {
		trans_use_gold = 0,
		next = 0,
		base = 5220,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 5229,
		id = 5230,
		level = 11,
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
	[5240] = {
		important = 1,
		destory_gold = 25,
		type = 5,
		group = 5240,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 5241,
		prev = 0,
		id = 5240,
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
		restore_item = {}
	},
	[5241] = {
		trans_use_gold = 90,
		next = 5242,
		base = 5240,
		restore_gold = 20,
		destory_gold = 33,
		prev = 5240,
		id = 5241,
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
				1
			}
		}
	},
	[5242] = {
		trans_use_gold = 150,
		next = 5243,
		base = 5240,
		restore_gold = 80,
		destory_gold = 55,
		prev = 5241,
		id = 5242,
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
				4
			}
		}
	},
	[5243] = {
		trans_use_gold = 240,
		next = 5244,
		base = 5240,
		restore_gold = 180,
		destory_gold = 93,
		prev = 5242,
		id = 5243,
		level = 4,
		trans_use_item = {
			{
				17022,
				12
			}
		},
		destory_item = {
			{
				17021,
				4
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
	[5244] = {
		trans_use_gold = 330,
		next = 5245,
		base = 5240,
		restore_gold = 340,
		destory_gold = 153,
		prev = 5243,
		id = 5244,
		level = 5,
		trans_use_item = {
			{
				17022,
				16
			}
		},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
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
			},
			{
				17022,
				8
			}
		}
	},
	[5245] = {
		trans_use_gold = 420,
		next = 5246,
		base = 5240,
		restore_gold = 560,
		destory_gold = 235,
		prev = 5244,
		id = 5245,
		level = 6,
		trans_use_item = {
			{
				17022,
				21
			}
		},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
				7
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
	[5246] = {
		trans_use_gold = 540,
		next = 5247,
		base = 5240,
		restore_gold = 840,
		destory_gold = 340,
		prev = 5245,
		id = 5246,
		level = 7,
		trans_use_item = {
			{
				17023,
				27
			}
		},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
				12
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
	[5247] = {
		trans_use_gold = 660,
		next = 5248,
		base = 5240,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 5246,
		id = 5247,
		level = 8,
		trans_use_item = {
			{
				17023,
				33
			}
		},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
				12
			},
			{
				17023,
				7
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
	[5248] = {
		trans_use_gold = 780,
		next = 5249,
		base = 5240,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 5247,
		id = 5248,
		level = 9,
		trans_use_item = {
			{
				17023,
				39
			}
		},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
				12
			},
			{
				17023,
				15
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
	[5249] = {
		trans_use_gold = 900,
		next = 5250,
		base = 5240,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 5248,
		id = 5249,
		level = 10,
		trans_use_item = {
			{
				17023,
				45
			}
		},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
				12
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
				66
			}
		}
	},
	[5250] = {
		trans_use_gold = 0,
		next = 0,
		base = 5240,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 5249,
		id = 5250,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
				12
			},
			{
				17023,
				36
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
	[6000] = {
		important = 1,
		destory_gold = 1,
		type = 6,
		group = 6000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 6001,
		prev = 0,
		id = 6000,
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
		restore_item = {}
	},
	[6001] = {
		trans_use_gold = 60,
		next = 6002,
		base = 6000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 6000,
		id = 6001,
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
	[6002] = {
		trans_use_gold = 100,
		next = 6003,
		base = 6000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 6001,
		id = 6002,
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
	[6003] = {
		trans_use_gold = 0,
		next = 0,
		base = 6000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 6002,
		id = 6003,
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
	[6020] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 6020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 6021,
		prev = 0,
		id = 6020,
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
		restore_item = {}
	},
	[6021] = {
		trans_use_gold = 60,
		next = 6022,
		base = 6020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 6020,
		id = 6021,
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
	[6022] = {
		trans_use_gold = 100,
		next = 6023,
		base = 6020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 6021,
		id = 6022,
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
	[6023] = {
		trans_use_gold = 0,
		next = 0,
		base = 6020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 6022,
		id = 6023,
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
	[6040] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 6040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 6041,
		prev = 0,
		id = 6040,
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
		restore_item = {}
	},
	[6041] = {
		trans_use_gold = 60,
		next = 6042,
		base = 6040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 6040,
		id = 6041,
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
	[6042] = {
		trans_use_gold = 100,
		next = 6043,
		base = 6040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 6041,
		id = 6042,
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
	[6043] = {
		trans_use_gold = 160,
		next = 6044,
		base = 6040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 6042,
		id = 6043,
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
	[6044] = {
		trans_use_gold = 220,
		next = 6045,
		base = 6040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 6043,
		id = 6044,
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
	[6045] = {
		trans_use_gold = 280,
		next = 6046,
		base = 6040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 6044,
		id = 6045,
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
	[6046] = {
		trans_use_gold = 0,
		next = 0,
		base = 6040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 6045,
		id = 6046,
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
	[7000] = {
		important = 1,
		destory_gold = 1,
		type = 2,
		group = 7000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 7001,
		prev = 0,
		id = 7000,
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
		restore_item = {}
	},
	[7001] = {
		trans_use_gold = 60,
		next = 7002,
		base = 7000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 7000,
		id = 7001,
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
	[7002] = {
		trans_use_gold = 100,
		next = 7003,
		base = 7000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 7001,
		id = 7002,
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
	[7003] = {
		trans_use_gold = 0,
		next = 0,
		base = 7000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 7002,
		id = 7003,
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
	[7020] = {
		important = 1,
		destory_gold = 4,
		type = 2,
		group = 7020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 7021,
		prev = 0,
		id = 7020,
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
		restore_item = {}
	},
	[7021] = {
		trans_use_gold = 60,
		next = 7022,
		base = 7020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 7020,
		id = 7021,
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
	[7022] = {
		trans_use_gold = 100,
		next = 7023,
		base = 7020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 7021,
		id = 7022,
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
	[7023] = {
		trans_use_gold = 0,
		next = 0,
		base = 7020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 7022,
		id = 7023,
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
	[7040] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 7040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 7041,
		prev = 0,
		id = 7040,
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
		restore_item = {}
	},
	[7041] = {
		trans_use_gold = 60,
		next = 7042,
		base = 7040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 7040,
		id = 7041,
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
	[7042] = {
		trans_use_gold = 100,
		next = 7043,
		base = 7040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 7041,
		id = 7042,
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
	[7043] = {
		trans_use_gold = 160,
		next = 7044,
		base = 7040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 7042,
		id = 7043,
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
	[7044] = {
		trans_use_gold = 220,
		next = 7045,
		base = 7040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 7043,
		id = 7044,
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
	[7045] = {
		trans_use_gold = 280,
		next = 7046,
		base = 7040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 7044,
		id = 7045,
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
	[7046] = {
		trans_use_gold = 0,
		next = 0,
		base = 7040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 7045,
		id = 7046,
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
	[7100] = {
		important = 1,
		destory_gold = 1,
		type = 2,
		group = 7100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 7101,
		prev = 0,
		id = 7100,
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
		restore_item = {}
	},
	[7101] = {
		trans_use_gold = 60,
		next = 7102,
		base = 7100,
		restore_gold = 20,
		destory_gold = 6,
		prev = 7100,
		id = 7101,
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
	[7102] = {
		trans_use_gold = 100,
		next = 7103,
		base = 7100,
		restore_gold = 80,
		destory_gold = 21,
		prev = 7101,
		id = 7102,
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
	[7103] = {
		trans_use_gold = 0,
		next = 0,
		base = 7100,
		restore_gold = 180,
		destory_gold = 46,
		prev = 7102,
		id = 7103,
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
	[7120] = {
		important = 1,
		destory_gold = 4,
		type = 2,
		group = 7120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 7121,
		prev = 0,
		id = 7120,
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
		restore_item = {}
	},
	[7121] = {
		trans_use_gold = 60,
		next = 7122,
		base = 7120,
		restore_gold = 20,
		destory_gold = 9,
		prev = 7120,
		id = 7121,
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
	[7122] = {
		trans_use_gold = 100,
		next = 7123,
		base = 7120,
		restore_gold = 80,
		destory_gold = 24,
		prev = 7121,
		id = 7122,
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
	[7123] = {
		trans_use_gold = 0,
		next = 0,
		base = 7120,
		restore_gold = 180,
		destory_gold = 49,
		prev = 7122,
		id = 7123,
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
	[7140] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 7140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 7141,
		prev = 0,
		id = 7140,
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
		restore_item = {}
	},
	[7141] = {
		trans_use_gold = 60,
		next = 7142,
		base = 7140,
		restore_gold = 20,
		destory_gold = 14,
		prev = 7140,
		id = 7141,
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
	[7142] = {
		trans_use_gold = 100,
		next = 7143,
		base = 7140,
		restore_gold = 80,
		destory_gold = 29,
		prev = 7141,
		id = 7142,
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
	[7143] = {
		trans_use_gold = 160,
		next = 7144,
		base = 7140,
		restore_gold = 180,
		destory_gold = 54,
		prev = 7142,
		id = 7143,
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
	[7144] = {
		trans_use_gold = 220,
		next = 7145,
		base = 7140,
		restore_gold = 340,
		destory_gold = 94,
		prev = 7143,
		id = 7144,
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
	[7145] = {
		trans_use_gold = 280,
		next = 7146,
		base = 7140,
		restore_gold = 560,
		destory_gold = 149,
		prev = 7144,
		id = 7145,
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
	[7146] = {
		trans_use_gold = 0,
		next = 0,
		base = 7140,
		restore_gold = 840,
		destory_gold = 219,
		prev = 7145,
		id = 7146,
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
	[11000] = {
		important = 1,
		destory_gold = 1,
		type = 1,
		group = 11000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 11001,
		prev = 0,
		id = 11000,
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
		restore_item = {}
	},
	[11001] = {
		trans_use_gold = 60,
		next = 11002,
		base = 11000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 11000,
		id = 11001,
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
	[11002] = {
		trans_use_gold = 100,
		next = 11003,
		base = 11000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 11001,
		id = 11002,
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
	[11003] = {
		trans_use_gold = 0,
		next = 0,
		base = 11000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 11002,
		id = 11003,
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
	[11020] = {
		important = 1,
		destory_gold = 4,
		type = 1,
		group = 11020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 11021,
		prev = 0,
		id = 11020,
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
		restore_item = {}
	},
	[11021] = {
		trans_use_gold = 60,
		next = 11022,
		base = 11020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 11020,
		id = 11021,
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
	[11022] = {
		trans_use_gold = 100,
		next = 11023,
		base = 11020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 11021,
		id = 11022,
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
	[11023] = {
		trans_use_gold = 0,
		next = 0,
		base = 11020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 11022,
		id = 11023,
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
	[11040] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 11040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 11041,
		prev = 0,
		id = 11040,
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
		restore_item = {}
	},
	[11041] = {
		trans_use_gold = 60,
		next = 11042,
		base = 11040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 11040,
		id = 11041,
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
	[11042] = {
		trans_use_gold = 100,
		next = 11043,
		base = 11040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 11041,
		id = 11042,
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
	[11043] = {
		trans_use_gold = 160,
		next = 11044,
		base = 11040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 11042,
		id = 11043,
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
	[11044] = {
		trans_use_gold = 220,
		next = 11045,
		base = 11040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 11043,
		id = 11044,
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
	[11045] = {
		trans_use_gold = 280,
		next = 11046,
		base = 11040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 11044,
		id = 11045,
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
	[11046] = {
		trans_use_gold = 0,
		next = 0,
		base = 11040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 11045,
		id = 11046,
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
	[11100] = {
		important = 1,
		destory_gold = 4,
		type = 1,
		group = 11100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 11101,
		prev = 0,
		id = 11100,
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
		restore_item = {}
	},
	[11101] = {
		trans_use_gold = 60,
		next = 11102,
		base = 11100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 11100,
		id = 11101,
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
	[11102] = {
		trans_use_gold = 100,
		next = 11103,
		base = 11100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 11101,
		id = 11102,
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
	[11103] = {
		trans_use_gold = 0,
		next = 0,
		base = 11100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 11102,
		id = 11103,
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
	[11120] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 11120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 11121,
		prev = 0,
		id = 11120,
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
		restore_item = {}
	},
	[11121] = {
		trans_use_gold = 60,
		next = 11122,
		base = 11120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 11120,
		id = 11121,
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
	[11122] = {
		trans_use_gold = 100,
		next = 11123,
		base = 11120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 11121,
		id = 11122,
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
	[11123] = {
		trans_use_gold = 160,
		next = 11124,
		base = 11120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 11122,
		id = 11123,
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
	[11124] = {
		trans_use_gold = 220,
		next = 11125,
		base = 11120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 11123,
		id = 11124,
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
	[11125] = {
		trans_use_gold = 280,
		next = 11126,
		base = 11120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 11124,
		id = 11125,
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
	[11126] = {
		trans_use_gold = 0,
		next = 0,
		base = 11120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 11125,
		id = 11126,
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
	[11140] = {
		important = 1,
		destory_gold = 16,
		type = 1,
		group = 11140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 11141,
		prev = 0,
		id = 11140,
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
		restore_item = {}
	},
	[11141] = {
		trans_use_gold = 60,
		next = 11142,
		base = 11140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 11140,
		id = 11141,
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
	[11142] = {
		trans_use_gold = 100,
		next = 11143,
		base = 11140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 11141,
		id = 11142,
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
	[11143] = {
		trans_use_gold = 160,
		next = 11144,
		base = 11140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 11142,
		id = 11143,
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
	[11144] = {
		trans_use_gold = 220,
		next = 11145,
		base = 11140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 11143,
		id = 11144,
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
	[11145] = {
		trans_use_gold = 280,
		next = 11146,
		base = 11140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 11144,
		id = 11145,
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
	[11146] = {
		trans_use_gold = 360,
		next = 11147,
		base = 11140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 11145,
		id = 11146,
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
	[11147] = {
		trans_use_gold = 440,
		next = 11148,
		base = 11140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 11146,
		id = 11147,
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
	[11148] = {
		trans_use_gold = 520,
		next = 11149,
		base = 11140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 11147,
		id = 11148,
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
	[11149] = {
		trans_use_gold = 600,
		next = 11150,
		base = 11140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 11148,
		id = 11149,
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
	[11150] = {
		trans_use_gold = 0,
		next = 0,
		base = 11140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 11149,
		id = 11150,
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
	[11200] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 11200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 11201,
		prev = 0,
		id = 11200,
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
		restore_item = {}
	},
	[11201] = {
		trans_use_gold = 60,
		next = 11202,
		base = 11200,
		restore_gold = 20,
		destory_gold = 14,
		prev = 11200,
		id = 11201,
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
	[11202] = {
		trans_use_gold = 100,
		next = 11203,
		base = 11200,
		restore_gold = 80,
		destory_gold = 29,
		prev = 11201,
		id = 11202,
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
	[11203] = {
		trans_use_gold = 160,
		next = 11204,
		base = 11200,
		restore_gold = 180,
		destory_gold = 54,
		prev = 11202,
		id = 11203,
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
	[11204] = {
		trans_use_gold = 220,
		next = 11205,
		base = 11200,
		restore_gold = 340,
		destory_gold = 94,
		prev = 11203,
		id = 11204,
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
	[11205] = {
		trans_use_gold = 280,
		next = 11206,
		base = 11200,
		restore_gold = 560,
		destory_gold = 149,
		prev = 11204,
		id = 11205,
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
	[11206] = {
		trans_use_gold = 0,
		next = 0,
		base = 11200,
		restore_gold = 840,
		destory_gold = 219,
		prev = 11205,
		id = 11206,
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
	[11220] = {
		important = 1,
		destory_gold = 16,
		type = 1,
		group = 11220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 11221,
		prev = 0,
		id = 11220,
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
		restore_item = {}
	},
	[11221] = {
		trans_use_gold = 60,
		next = 11222,
		base = 11220,
		restore_gold = 20,
		destory_gold = 21,
		prev = 11220,
		id = 11221,
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
	[11222] = {
		trans_use_gold = 100,
		next = 11223,
		base = 11220,
		restore_gold = 80,
		destory_gold = 36,
		prev = 11221,
		id = 11222,
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
	[11223] = {
		trans_use_gold = 160,
		next = 11224,
		base = 11220,
		restore_gold = 180,
		destory_gold = 61,
		prev = 11222,
		id = 11223,
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
	[11224] = {
		trans_use_gold = 220,
		next = 11225,
		base = 11220,
		restore_gold = 340,
		destory_gold = 101,
		prev = 11223,
		id = 11224,
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
	[11225] = {
		trans_use_gold = 280,
		next = 11226,
		base = 11220,
		restore_gold = 560,
		destory_gold = 156,
		prev = 11224,
		id = 11225,
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
	[11226] = {
		trans_use_gold = 360,
		next = 11227,
		base = 11220,
		restore_gold = 840,
		destory_gold = 226,
		prev = 11225,
		id = 11226,
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
	[11227] = {
		trans_use_gold = 440,
		next = 11228,
		base = 11220,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 11226,
		id = 11227,
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
	[11228] = {
		trans_use_gold = 520,
		next = 11229,
		base = 11220,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 11227,
		id = 11228,
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
	[11229] = {
		trans_use_gold = 600,
		next = 11230,
		base = 11220,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 11228,
		id = 11229,
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
	[11230] = {
		trans_use_gold = 0,
		next = 0,
		base = 11220,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 11229,
		id = 11230,
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
	[11240] = {
		important = 1,
		destory_gold = 25,
		type = 1,
		group = 11240,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 11241,
		prev = 0,
		id = 11240,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17011,
				2
			}
		},
		destory_item = {
			{
				17013,
				1
			}
		},
		restore_item = {}
	},
	[11241] = {
		trans_use_gold = 90,
		next = 11242,
		base = 11240,
		restore_gold = 20,
		destory_gold = 33,
		prev = 11240,
		id = 11241,
		level = 2,
		trans_use_item = {
			{
				17011,
				5
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
	[11242] = {
		trans_use_gold = 150,
		next = 11243,
		base = 11240,
		restore_gold = 80,
		destory_gold = 55,
		prev = 11241,
		id = 11242,
		level = 3,
		trans_use_item = {
			{
				17011,
				8
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
	[11243] = {
		trans_use_gold = 240,
		next = 11244,
		base = 11240,
		restore_gold = 180,
		destory_gold = 93,
		prev = 11242,
		id = 11243,
		level = 4,
		trans_use_item = {
			{
				17012,
				12
			}
		},
		destory_item = {
			{
				17011,
				4
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
	[11244] = {
		trans_use_gold = 330,
		next = 11245,
		base = 11240,
		restore_gold = 340,
		destory_gold = 153,
		prev = 11243,
		id = 11244,
		level = 5,
		trans_use_item = {
			{
				17012,
				16
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
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
			},
			{
				17012,
				8
			}
		}
	},
	[11245] = {
		trans_use_gold = 420,
		next = 11246,
		base = 11240,
		restore_gold = 560,
		destory_gold = 235,
		prev = 11244,
		id = 11245,
		level = 6,
		trans_use_item = {
			{
				17012,
				21
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				7
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
	[11246] = {
		trans_use_gold = 540,
		next = 11247,
		base = 11240,
		restore_gold = 840,
		destory_gold = 340,
		prev = 11245,
		id = 11246,
		level = 7,
		trans_use_item = {
			{
				17013,
				27
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
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
	[11247] = {
		trans_use_gold = 660,
		next = 11248,
		base = 11240,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 11246,
		id = 11247,
		level = 8,
		trans_use_item = {
			{
				17013,
				33
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				7
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
	[11248] = {
		trans_use_gold = 780,
		next = 11249,
		base = 11240,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 11247,
		id = 11248,
		level = 9,
		trans_use_item = {
			{
				17013,
				39
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				15
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
	[11249] = {
		trans_use_gold = 900,
		next = 11250,
		base = 11240,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 11248,
		id = 11249,
		level = 10,
		trans_use_item = {
			{
				17013,
				45
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
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
				66
			}
		}
	},
	[11250] = {
		trans_use_gold = 0,
		next = 0,
		base = 11240,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 11249,
		id = 11250,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				36
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
	[12000] = {
		important = 1,
		destory_gold = 1,
		type = 2,
		group = 12000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 12001,
		prev = 0,
		id = 12000,
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
		restore_item = {}
	},
	[12001] = {
		trans_use_gold = 60,
		next = 12002,
		base = 12000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 12000,
		id = 12001,
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
	[12002] = {
		trans_use_gold = 100,
		next = 12003,
		base = 12000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 12001,
		id = 12002,
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
	[12003] = {
		trans_use_gold = 0,
		next = 0,
		base = 12000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 12002,
		id = 12003,
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
	[12020] = {
		important = 1,
		destory_gold = 4,
		type = 2,
		group = 12020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 12021,
		prev = 0,
		id = 12020,
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
		restore_item = {}
	},
	[12021] = {
		trans_use_gold = 60,
		next = 12022,
		base = 12020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 12020,
		id = 12021,
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
	[12022] = {
		trans_use_gold = 100,
		next = 12023,
		base = 12020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 12021,
		id = 12022,
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
	[12023] = {
		trans_use_gold = 0,
		next = 0,
		base = 12020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 12022,
		id = 12023,
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
	[12040] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 12040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 12041,
		prev = 0,
		id = 12040,
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
		restore_item = {}
	},
	[12041] = {
		trans_use_gold = 60,
		next = 12042,
		base = 12040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 12040,
		id = 12041,
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
	[12042] = {
		trans_use_gold = 100,
		next = 12043,
		base = 12040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 12041,
		id = 12042,
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
	[12043] = {
		trans_use_gold = 160,
		next = 12044,
		base = 12040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 12042,
		id = 12043,
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
	[12044] = {
		trans_use_gold = 220,
		next = 12045,
		base = 12040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 12043,
		id = 12044,
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
	[12045] = {
		trans_use_gold = 280,
		next = 12046,
		base = 12040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 12044,
		id = 12045,
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
	[12046] = {
		trans_use_gold = 0,
		next = 0,
		base = 12040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 12045,
		id = 12046,
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
	[12100] = {
		important = 1,
		destory_gold = 4,
		type = 2,
		group = 12100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 12101,
		prev = 0,
		id = 12100,
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
		restore_item = {}
	},
	[12101] = {
		trans_use_gold = 60,
		next = 12102,
		base = 12100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 12100,
		id = 12101,
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
	[12102] = {
		trans_use_gold = 100,
		next = 12103,
		base = 12100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 12101,
		id = 12102,
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
	[12103] = {
		trans_use_gold = 0,
		next = 0,
		base = 12100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 12102,
		id = 12103,
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
	[12120] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 12120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 12121,
		prev = 0,
		id = 12120,
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
		restore_item = {}
	},
	[12121] = {
		trans_use_gold = 60,
		next = 12122,
		base = 12120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 12120,
		id = 12121,
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
	[12122] = {
		trans_use_gold = 100,
		next = 12123,
		base = 12120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 12121,
		id = 12122,
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
	[12123] = {
		trans_use_gold = 160,
		next = 12124,
		base = 12120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 12122,
		id = 12123,
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
	[12124] = {
		trans_use_gold = 220,
		next = 12125,
		base = 12120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 12123,
		id = 12124,
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
	[12125] = {
		trans_use_gold = 280,
		next = 12126,
		base = 12120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 12124,
		id = 12125,
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
	[12126] = {
		trans_use_gold = 0,
		next = 0,
		base = 12120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 12125,
		id = 12126,
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
	[12140] = {
		important = 1,
		destory_gold = 16,
		type = 2,
		group = 12140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 12141,
		prev = 0,
		id = 12140,
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
		restore_item = {}
	},
	[12141] = {
		trans_use_gold = 60,
		next = 12142,
		base = 12140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 12140,
		id = 12141,
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
	[12142] = {
		trans_use_gold = 100,
		next = 12143,
		base = 12140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 12141,
		id = 12142,
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
	[12143] = {
		trans_use_gold = 160,
		next = 12144,
		base = 12140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 12142,
		id = 12143,
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
	[12144] = {
		trans_use_gold = 220,
		next = 12145,
		base = 12140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 12143,
		id = 12144,
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
	[12145] = {
		trans_use_gold = 280,
		next = 12146,
		base = 12140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 12144,
		id = 12145,
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
	[12146] = {
		trans_use_gold = 360,
		next = 12147,
		base = 12140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 12145,
		id = 12146,
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
	[12147] = {
		trans_use_gold = 440,
		next = 12148,
		base = 12140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 12146,
		id = 12147,
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
	[12148] = {
		trans_use_gold = 520,
		next = 12149,
		base = 12140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 12147,
		id = 12148,
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
	[12149] = {
		trans_use_gold = 600,
		next = 12150,
		base = 12140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 12148,
		id = 12149,
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
	[12150] = {
		trans_use_gold = 0,
		next = 0,
		base = 12140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 12149,
		id = 12150,
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
	[13000] = {
		important = 1,
		destory_gold = 1,
		type = 3,
		group = 13000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 13001,
		prev = 0,
		id = 13000,
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
		restore_item = {}
	},
	[13001] = {
		trans_use_gold = 60,
		next = 13002,
		base = 13000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 13000,
		id = 13001,
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
	[13002] = {
		trans_use_gold = 100,
		next = 13003,
		base = 13000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 13001,
		id = 13002,
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
	[13003] = {
		trans_use_gold = 0,
		next = 0,
		base = 13000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 13002,
		id = 13003,
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
	[13020] = {
		important = 1,
		destory_gold = 4,
		type = 3,
		group = 13020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 13021,
		prev = 0,
		id = 13020,
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
		restore_item = {}
	},
	[13021] = {
		trans_use_gold = 60,
		next = 13022,
		base = 13020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 13020,
		id = 13021,
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
	[13022] = {
		trans_use_gold = 100,
		next = 13023,
		base = 13020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 13021,
		id = 13022,
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
	[13023] = {
		trans_use_gold = 0,
		next = 0,
		base = 13020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 13022,
		id = 13023,
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
	[13040] = {
		important = 1,
		destory_gold = 9,
		type = 3,
		group = 13040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 13041,
		prev = 0,
		id = 13040,
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
		restore_item = {}
	},
	[13041] = {
		trans_use_gold = 60,
		next = 13042,
		base = 13040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 13040,
		id = 13041,
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
	[13042] = {
		trans_use_gold = 100,
		next = 13043,
		base = 13040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 13041,
		id = 13042,
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
	[13043] = {
		trans_use_gold = 160,
		next = 13044,
		base = 13040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 13042,
		id = 13043,
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
	[13044] = {
		trans_use_gold = 220,
		next = 13045,
		base = 13040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 13043,
		id = 13044,
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
	[13045] = {
		trans_use_gold = 280,
		next = 13046,
		base = 13040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 13044,
		id = 13045,
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
	[13046] = {
		trans_use_gold = 0,
		next = 0,
		base = 13040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 13045,
		id = 13046,
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
	[13100] = {
		important = 1,
		destory_gold = 4,
		type = 3,
		group = 13100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 13101,
		prev = 0,
		id = 13100,
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
		restore_item = {}
	},
	[13101] = {
		trans_use_gold = 60,
		next = 13102,
		base = 13100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 13100,
		id = 13101,
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
	[13102] = {
		trans_use_gold = 100,
		next = 13103,
		base = 13100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 13101,
		id = 13102,
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
	[13103] = {
		trans_use_gold = 0,
		next = 0,
		base = 13100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 13102,
		id = 13103,
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
	[13120] = {
		important = 1,
		destory_gold = 9,
		type = 3,
		group = 13120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 13121,
		prev = 0,
		id = 13120,
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
		restore_item = {}
	},
	[13121] = {
		trans_use_gold = 60,
		next = 13122,
		base = 13120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 13120,
		id = 13121,
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
	[13122] = {
		trans_use_gold = 100,
		next = 13123,
		base = 13120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 13121,
		id = 13122,
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
	[13123] = {
		trans_use_gold = 160,
		next = 13124,
		base = 13120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 13122,
		id = 13123,
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
	[13124] = {
		trans_use_gold = 220,
		next = 13125,
		base = 13120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 13123,
		id = 13124,
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
	[13125] = {
		trans_use_gold = 280,
		next = 13126,
		base = 13120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 13124,
		id = 13125,
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
	[13126] = {
		trans_use_gold = 0,
		next = 0,
		base = 13120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 13125,
		id = 13126,
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
	[13140] = {
		important = 1,
		destory_gold = 16,
		type = 3,
		group = 13140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 13141,
		prev = 0,
		id = 13140,
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
		restore_item = {}
	},
	[13141] = {
		trans_use_gold = 60,
		next = 13142,
		base = 13140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 13140,
		id = 13141,
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
	[13142] = {
		trans_use_gold = 100,
		next = 13143,
		base = 13140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 13141,
		id = 13142,
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
	[13143] = {
		trans_use_gold = 160,
		next = 13144,
		base = 13140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 13142,
		id = 13143,
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
	[13144] = {
		trans_use_gold = 220,
		next = 13145,
		base = 13140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 13143,
		id = 13144,
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
	[13145] = {
		trans_use_gold = 280,
		next = 13146,
		base = 13140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 13144,
		id = 13145,
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
	[13146] = {
		trans_use_gold = 360,
		next = 13147,
		base = 13140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 13145,
		id = 13146,
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
	[13147] = {
		trans_use_gold = 440,
		next = 13148,
		base = 13140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 13146,
		id = 13147,
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
	[13148] = {
		trans_use_gold = 520,
		next = 13149,
		base = 13140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 13147,
		id = 13148,
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
	[13149] = {
		trans_use_gold = 600,
		next = 13150,
		base = 13140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 13148,
		id = 13149,
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
	[13150] = {
		trans_use_gold = 0,
		next = 0,
		base = 13140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 13149,
		id = 13150,
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
	[14100] = {
		important = 1,
		destory_gold = 1,
		type = 4,
		group = 14100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 14101,
		prev = 0,
		id = 14100,
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
		restore_item = {}
	},
	[14101] = {
		trans_use_gold = 60,
		next = 14102,
		base = 14100,
		restore_gold = 20,
		destory_gold = 6,
		prev = 14100,
		id = 14101,
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
	[14102] = {
		trans_use_gold = 100,
		next = 14103,
		base = 14100,
		restore_gold = 80,
		destory_gold = 21,
		prev = 14101,
		id = 14102,
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
	[14103] = {
		trans_use_gold = 0,
		next = 0,
		base = 14100,
		restore_gold = 180,
		destory_gold = 46,
		prev = 14102,
		id = 14103,
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
	[14120] = {
		important = 1,
		destory_gold = 4,
		type = 4,
		group = 14120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 14121,
		prev = 0,
		id = 14120,
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
		restore_item = {}
	},
	[14121] = {
		trans_use_gold = 60,
		next = 14122,
		base = 14120,
		restore_gold = 20,
		destory_gold = 9,
		prev = 14120,
		id = 14121,
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
	[14122] = {
		trans_use_gold = 100,
		next = 14123,
		base = 14120,
		restore_gold = 80,
		destory_gold = 24,
		prev = 14121,
		id = 14122,
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
	[14123] = {
		trans_use_gold = 0,
		next = 0,
		base = 14120,
		restore_gold = 180,
		destory_gold = 49,
		prev = 14122,
		id = 14123,
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
	[14140] = {
		important = 1,
		destory_gold = 9,
		type = 4,
		group = 14140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 14141,
		prev = 0,
		id = 14140,
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
		restore_item = {}
	},
	[14141] = {
		trans_use_gold = 60,
		next = 14142,
		base = 14140,
		restore_gold = 20,
		destory_gold = 14,
		prev = 14140,
		id = 14141,
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
	[14142] = {
		trans_use_gold = 100,
		next = 14143,
		base = 14140,
		restore_gold = 80,
		destory_gold = 29,
		prev = 14141,
		id = 14142,
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
	[14143] = {
		trans_use_gold = 160,
		next = 14144,
		base = 14140,
		restore_gold = 180,
		destory_gold = 54,
		prev = 14142,
		id = 14143,
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
	[14144] = {
		trans_use_gold = 220,
		next = 14145,
		base = 14140,
		restore_gold = 340,
		destory_gold = 94,
		prev = 14143,
		id = 14144,
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
	[14145] = {
		trans_use_gold = 280,
		next = 14146,
		base = 14140,
		restore_gold = 560,
		destory_gold = 149,
		prev = 14144,
		id = 14145,
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
	[14146] = {
		trans_use_gold = 0,
		next = 0,
		base = 14140,
		restore_gold = 840,
		destory_gold = 219,
		prev = 14145,
		id = 14146,
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
	[14200] = {
		important = 1,
		destory_gold = 4,
		type = 4,
		group = 14200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 14201,
		prev = 0,
		id = 14200,
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
		restore_item = {}
	},
	[14201] = {
		trans_use_gold = 60,
		next = 14202,
		base = 14200,
		restore_gold = 20,
		destory_gold = 9,
		prev = 14200,
		id = 14201,
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
	[14202] = {
		trans_use_gold = 100,
		next = 14203,
		base = 14200,
		restore_gold = 80,
		destory_gold = 24,
		prev = 14201,
		id = 14202,
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
	[14203] = {
		trans_use_gold = 0,
		next = 0,
		base = 14200,
		restore_gold = 180,
		destory_gold = 49,
		prev = 14202,
		id = 14203,
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
	[14220] = {
		important = 1,
		destory_gold = 9,
		type = 4,
		group = 14220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 14221,
		prev = 0,
		id = 14220,
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
		restore_item = {}
	},
	[14221] = {
		trans_use_gold = 60,
		next = 14222,
		base = 14220,
		restore_gold = 20,
		destory_gold = 14,
		prev = 14220,
		id = 14221,
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
	[14222] = {
		trans_use_gold = 100,
		next = 14223,
		base = 14220,
		restore_gold = 80,
		destory_gold = 29,
		prev = 14221,
		id = 14222,
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
	[14223] = {
		trans_use_gold = 160,
		next = 14224,
		base = 14220,
		restore_gold = 180,
		destory_gold = 54,
		prev = 14222,
		id = 14223,
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
	[14224] = {
		trans_use_gold = 220,
		next = 14225,
		base = 14220,
		restore_gold = 340,
		destory_gold = 94,
		prev = 14223,
		id = 14224,
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
	[14225] = {
		trans_use_gold = 280,
		next = 14226,
		base = 14220,
		restore_gold = 560,
		destory_gold = 149,
		prev = 14224,
		id = 14225,
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
	[14226] = {
		trans_use_gold = 0,
		next = 0,
		base = 14220,
		restore_gold = 840,
		destory_gold = 219,
		prev = 14225,
		id = 14226,
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
	[14240] = {
		important = 1,
		destory_gold = 16,
		type = 4,
		group = 14240,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 14241,
		prev = 0,
		id = 14240,
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
		restore_item = {}
	},
	[14241] = {
		trans_use_gold = 60,
		next = 14242,
		base = 14240,
		restore_gold = 20,
		destory_gold = 21,
		prev = 14240,
		id = 14241,
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
	[14242] = {
		trans_use_gold = 100,
		next = 14243,
		base = 14240,
		restore_gold = 80,
		destory_gold = 36,
		prev = 14241,
		id = 14242,
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
	[14243] = {
		trans_use_gold = 160,
		next = 14244,
		base = 14240,
		restore_gold = 180,
		destory_gold = 61,
		prev = 14242,
		id = 14243,
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
	[14244] = {
		trans_use_gold = 220,
		next = 14245,
		base = 14240,
		restore_gold = 340,
		destory_gold = 101,
		prev = 14243,
		id = 14244,
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
	[14245] = {
		trans_use_gold = 280,
		next = 14246,
		base = 14240,
		restore_gold = 560,
		destory_gold = 156,
		prev = 14244,
		id = 14245,
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
	[14246] = {
		trans_use_gold = 360,
		next = 14247,
		base = 14240,
		restore_gold = 840,
		destory_gold = 226,
		prev = 14245,
		id = 14246,
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
	[14247] = {
		trans_use_gold = 440,
		next = 14248,
		base = 14240,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 14246,
		id = 14247,
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
	[14248] = {
		trans_use_gold = 520,
		next = 14249,
		base = 14240,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 14247,
		id = 14248,
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
	[14249] = {
		trans_use_gold = 600,
		next = 14250,
		base = 14240,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 14248,
		id = 14249,
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
	[14250] = {
		trans_use_gold = 0,
		next = 0,
		base = 14240,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 14249,
		id = 14250,
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
	[14300] = {
		important = 1,
		destory_gold = 4,
		type = 4,
		group = 14300,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 14301,
		prev = 0,
		id = 14300,
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
		restore_item = {}
	},
	[14301] = {
		trans_use_gold = 60,
		next = 14302,
		base = 14300,
		restore_gold = 20,
		destory_gold = 9,
		prev = 14300,
		id = 14301,
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
	[14302] = {
		trans_use_gold = 100,
		next = 14303,
		base = 14300,
		restore_gold = 80,
		destory_gold = 24,
		prev = 14301,
		id = 14302,
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
	[14303] = {
		trans_use_gold = 0,
		next = 0,
		base = 14300,
		restore_gold = 180,
		destory_gold = 49,
		prev = 14302,
		id = 14303,
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
	[14320] = {
		important = 1,
		destory_gold = 9,
		type = 4,
		group = 14320,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 14321,
		prev = 0,
		id = 14320,
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
		restore_item = {}
	},
	[14321] = {
		trans_use_gold = 60,
		next = 14322,
		base = 14320,
		restore_gold = 20,
		destory_gold = 14,
		prev = 14320,
		id = 14321,
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
	[14322] = {
		trans_use_gold = 100,
		next = 14323,
		base = 14320,
		restore_gold = 80,
		destory_gold = 29,
		prev = 14321,
		id = 14322,
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
	[14323] = {
		trans_use_gold = 160,
		next = 14324,
		base = 14320,
		restore_gold = 180,
		destory_gold = 54,
		prev = 14322,
		id = 14323,
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
	[14324] = {
		trans_use_gold = 220,
		next = 14325,
		base = 14320,
		restore_gold = 340,
		destory_gold = 94,
		prev = 14323,
		id = 14324,
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
	[14325] = {
		trans_use_gold = 280,
		next = 14326,
		base = 14320,
		restore_gold = 560,
		destory_gold = 149,
		prev = 14324,
		id = 14325,
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
	[14326] = {
		trans_use_gold = 0,
		next = 0,
		base = 14320,
		restore_gold = 840,
		destory_gold = 219,
		prev = 14325,
		id = 14326,
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
	[14340] = {
		important = 1,
		destory_gold = 16,
		type = 4,
		group = 14340,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 14341,
		prev = 0,
		id = 14340,
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
		restore_item = {}
	},
	[14341] = {
		trans_use_gold = 60,
		next = 14342,
		base = 14340,
		restore_gold = 20,
		destory_gold = 21,
		prev = 14340,
		id = 14341,
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
	[14342] = {
		trans_use_gold = 100,
		next = 14343,
		base = 14340,
		restore_gold = 80,
		destory_gold = 36,
		prev = 14341,
		id = 14342,
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
	[14343] = {
		trans_use_gold = 160,
		next = 14344,
		base = 14340,
		restore_gold = 180,
		destory_gold = 61,
		prev = 14342,
		id = 14343,
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
	[14344] = {
		trans_use_gold = 220,
		next = 14345,
		base = 14340,
		restore_gold = 340,
		destory_gold = 101,
		prev = 14343,
		id = 14344,
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
	[14345] = {
		trans_use_gold = 280,
		next = 14346,
		base = 14340,
		restore_gold = 560,
		destory_gold = 156,
		prev = 14344,
		id = 14345,
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
	[14346] = {
		trans_use_gold = 360,
		next = 14347,
		base = 14340,
		restore_gold = 840,
		destory_gold = 226,
		prev = 14345,
		id = 14346,
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
	[14347] = {
		trans_use_gold = 440,
		next = 14348,
		base = 14340,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 14346,
		id = 14347,
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
	[14348] = {
		trans_use_gold = 520,
		next = 14349,
		base = 14340,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 14347,
		id = 14348,
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
	[14349] = {
		trans_use_gold = 600,
		next = 14350,
		base = 14340,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 14348,
		id = 14349,
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
	[14350] = {
		trans_use_gold = 0,
		next = 0,
		base = 14340,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 14349,
		id = 14350,
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
	[16000] = {
		important = 1,
		destory_gold = 1,
		type = 6,
		group = 16000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 16001,
		prev = 0,
		id = 16000,
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
		restore_item = {}
	},
	[16001] = {
		trans_use_gold = 60,
		next = 16002,
		base = 16000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 16000,
		id = 16001,
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
	[16002] = {
		trans_use_gold = 100,
		next = 16003,
		base = 16000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 16001,
		id = 16002,
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
	[16003] = {
		trans_use_gold = 0,
		next = 0,
		base = 16000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 16002,
		id = 16003,
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
	[16020] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 16020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 16021,
		prev = 0,
		id = 16020,
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
		restore_item = {}
	},
	[16021] = {
		trans_use_gold = 60,
		next = 16022,
		base = 16020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 16020,
		id = 16021,
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
	[16022] = {
		trans_use_gold = 100,
		next = 16023,
		base = 16020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 16021,
		id = 16022,
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
	[16023] = {
		trans_use_gold = 0,
		next = 0,
		base = 16020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 16022,
		id = 16023,
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
	[16040] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 16040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 16041,
		prev = 0,
		id = 16040,
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
		restore_item = {}
	},
	[16041] = {
		trans_use_gold = 60,
		next = 16042,
		base = 16040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 16040,
		id = 16041,
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
	[16042] = {
		trans_use_gold = 100,
		next = 16043,
		base = 16040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 16041,
		id = 16042,
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
	[16043] = {
		trans_use_gold = 160,
		next = 16044,
		base = 16040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 16042,
		id = 16043,
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
	[16044] = {
		trans_use_gold = 220,
		next = 16045,
		base = 16040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 16043,
		id = 16044,
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
	[16045] = {
		trans_use_gold = 280,
		next = 16046,
		base = 16040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 16044,
		id = 16045,
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
	[16046] = {
		trans_use_gold = 0,
		next = 0,
		base = 16040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 16045,
		id = 16046,
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
	[16100] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 16100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 16101,
		prev = 0,
		id = 16100,
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
		restore_item = {}
	},
	[16101] = {
		trans_use_gold = 60,
		next = 16102,
		base = 16100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 16100,
		id = 16101,
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
	[16102] = {
		trans_use_gold = 100,
		next = 16103,
		base = 16100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 16101,
		id = 16102,
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
	[16103] = {
		trans_use_gold = 0,
		next = 0,
		base = 16100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 16102,
		id = 16103,
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
	[16120] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 16120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 16121,
		prev = 0,
		id = 16120,
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
		restore_item = {}
	},
	[16121] = {
		trans_use_gold = 60,
		next = 16122,
		base = 16120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 16120,
		id = 16121,
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
	[16122] = {
		trans_use_gold = 100,
		next = 16123,
		base = 16120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 16121,
		id = 16122,
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
	[16123] = {
		trans_use_gold = 160,
		next = 16124,
		base = 16120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 16122,
		id = 16123,
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
	[16124] = {
		trans_use_gold = 220,
		next = 16125,
		base = 16120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 16123,
		id = 16124,
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
	[16125] = {
		trans_use_gold = 280,
		next = 16126,
		base = 16120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 16124,
		id = 16125,
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
	[16126] = {
		trans_use_gold = 0,
		next = 0,
		base = 16120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 16125,
		id = 16126,
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
	[16140] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 16140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 16141,
		prev = 0,
		id = 16140,
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
		restore_item = {}
	},
	[16141] = {
		trans_use_gold = 60,
		next = 16142,
		base = 16140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 16140,
		id = 16141,
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
	[16142] = {
		trans_use_gold = 100,
		next = 16143,
		base = 16140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 16141,
		id = 16142,
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
	[16143] = {
		trans_use_gold = 160,
		next = 16144,
		base = 16140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 16142,
		id = 16143,
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
	[16144] = {
		trans_use_gold = 220,
		next = 16145,
		base = 16140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 16143,
		id = 16144,
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
	[16145] = {
		trans_use_gold = 280,
		next = 16146,
		base = 16140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 16144,
		id = 16145,
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
	[16146] = {
		trans_use_gold = 360,
		next = 16147,
		base = 16140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 16145,
		id = 16146,
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
	[16147] = {
		trans_use_gold = 440,
		next = 16148,
		base = 16140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 16146,
		id = 16147,
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
	[16148] = {
		trans_use_gold = 520,
		next = 16149,
		base = 16140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 16147,
		id = 16148,
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
	[16149] = {
		trans_use_gold = 600,
		next = 16150,
		base = 16140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 16148,
		id = 16149,
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
	[16150] = {
		trans_use_gold = 0,
		next = 0,
		base = 16140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 16149,
		id = 16150,
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
	[16200] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 16200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 16201,
		prev = 0,
		id = 16200,
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
		restore_item = {}
	},
	[16201] = {
		trans_use_gold = 60,
		next = 16202,
		base = 16200,
		restore_gold = 20,
		destory_gold = 9,
		prev = 16200,
		id = 16201,
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
	[16202] = {
		trans_use_gold = 100,
		next = 16203,
		base = 16200,
		restore_gold = 80,
		destory_gold = 24,
		prev = 16201,
		id = 16202,
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
	[16203] = {
		trans_use_gold = 0,
		next = 0,
		base = 16200,
		restore_gold = 180,
		destory_gold = 49,
		prev = 16202,
		id = 16203,
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
	[16220] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 16220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 16221,
		prev = 0,
		id = 16220,
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
		restore_item = {}
	},
	[16221] = {
		trans_use_gold = 60,
		next = 16222,
		base = 16220,
		restore_gold = 20,
		destory_gold = 14,
		prev = 16220,
		id = 16221,
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
	[16222] = {
		trans_use_gold = 100,
		next = 16223,
		base = 16220,
		restore_gold = 80,
		destory_gold = 29,
		prev = 16221,
		id = 16222,
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
	[16223] = {
		trans_use_gold = 160,
		next = 16224,
		base = 16220,
		restore_gold = 180,
		destory_gold = 54,
		prev = 16222,
		id = 16223,
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
	[16224] = {
		trans_use_gold = 220,
		next = 16225,
		base = 16220,
		restore_gold = 340,
		destory_gold = 94,
		prev = 16223,
		id = 16224,
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
	[16225] = {
		trans_use_gold = 280,
		next = 16226,
		base = 16220,
		restore_gold = 560,
		destory_gold = 149,
		prev = 16224,
		id = 16225,
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
	[16226] = {
		trans_use_gold = 0,
		next = 0,
		base = 16220,
		restore_gold = 840,
		destory_gold = 219,
		prev = 16225,
		id = 16226,
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
	[16240] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 16240,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 16241,
		prev = 0,
		id = 16240,
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
		restore_item = {}
	},
	[16241] = {
		trans_use_gold = 60,
		next = 16242,
		base = 16240,
		restore_gold = 20,
		destory_gold = 21,
		prev = 16240,
		id = 16241,
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
	[16242] = {
		trans_use_gold = 100,
		next = 16243,
		base = 16240,
		restore_gold = 80,
		destory_gold = 36,
		prev = 16241,
		id = 16242,
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
	[16243] = {
		trans_use_gold = 160,
		next = 16244,
		base = 16240,
		restore_gold = 180,
		destory_gold = 61,
		prev = 16242,
		id = 16243,
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
	[16244] = {
		trans_use_gold = 220,
		next = 16245,
		base = 16240,
		restore_gold = 340,
		destory_gold = 101,
		prev = 16243,
		id = 16244,
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
	[16245] = {
		trans_use_gold = 280,
		next = 16246,
		base = 16240,
		restore_gold = 560,
		destory_gold = 156,
		prev = 16244,
		id = 16245,
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
	[16246] = {
		trans_use_gold = 360,
		next = 16247,
		base = 16240,
		restore_gold = 840,
		destory_gold = 226,
		prev = 16245,
		id = 16246,
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
	[16247] = {
		trans_use_gold = 440,
		next = 16248,
		base = 16240,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 16246,
		id = 16247,
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
	[16248] = {
		trans_use_gold = 520,
		next = 16249,
		base = 16240,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 16247,
		id = 16248,
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
	[16249] = {
		trans_use_gold = 600,
		next = 16250,
		base = 16240,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 16248,
		id = 16249,
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
	[16250] = {
		trans_use_gold = 0,
		next = 0,
		base = 16240,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 16249,
		id = 16250,
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
	[16300] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 16300,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 16301,
		prev = 0,
		id = 16300,
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
		restore_item = {}
	},
	[16301] = {
		trans_use_gold = 60,
		next = 16302,
		base = 16300,
		restore_gold = 20,
		destory_gold = 9,
		prev = 16300,
		id = 16301,
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
	[16302] = {
		trans_use_gold = 100,
		next = 16303,
		base = 16300,
		restore_gold = 80,
		destory_gold = 24,
		prev = 16301,
		id = 16302,
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
	[16303] = {
		trans_use_gold = 0,
		next = 0,
		base = 16300,
		restore_gold = 180,
		destory_gold = 49,
		prev = 16302,
		id = 16303,
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
	[16320] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 16320,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 16321,
		prev = 0,
		id = 16320,
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
		restore_item = {}
	},
	[16321] = {
		trans_use_gold = 60,
		next = 16322,
		base = 16320,
		restore_gold = 20,
		destory_gold = 14,
		prev = 16320,
		id = 16321,
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
	[16322] = {
		trans_use_gold = 100,
		next = 16323,
		base = 16320,
		restore_gold = 80,
		destory_gold = 29,
		prev = 16321,
		id = 16322,
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
	[16323] = {
		trans_use_gold = 160,
		next = 16324,
		base = 16320,
		restore_gold = 180,
		destory_gold = 54,
		prev = 16322,
		id = 16323,
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
	[16324] = {
		trans_use_gold = 220,
		next = 16325,
		base = 16320,
		restore_gold = 340,
		destory_gold = 94,
		prev = 16323,
		id = 16324,
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
	[16325] = {
		trans_use_gold = 280,
		next = 16326,
		base = 16320,
		restore_gold = 560,
		destory_gold = 149,
		prev = 16324,
		id = 16325,
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
	[16326] = {
		trans_use_gold = 0,
		next = 0,
		base = 16320,
		restore_gold = 840,
		destory_gold = 219,
		prev = 16325,
		id = 16326,
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
	[16340] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 16340,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 16341,
		prev = 0,
		id = 16340,
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
		restore_item = {}
	},
	[16341] = {
		trans_use_gold = 60,
		next = 16342,
		base = 16340,
		restore_gold = 20,
		destory_gold = 21,
		prev = 16340,
		id = 16341,
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
	[16342] = {
		trans_use_gold = 100,
		next = 16343,
		base = 16340,
		restore_gold = 80,
		destory_gold = 36,
		prev = 16341,
		id = 16342,
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
	[16343] = {
		trans_use_gold = 160,
		next = 16344,
		base = 16340,
		restore_gold = 180,
		destory_gold = 61,
		prev = 16342,
		id = 16343,
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
	[16344] = {
		trans_use_gold = 220,
		next = 16345,
		base = 16340,
		restore_gold = 340,
		destory_gold = 101,
		prev = 16343,
		id = 16344,
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
	[16345] = {
		trans_use_gold = 280,
		next = 16346,
		base = 16340,
		restore_gold = 560,
		destory_gold = 156,
		prev = 16344,
		id = 16345,
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
	[16346] = {
		trans_use_gold = 360,
		next = 16347,
		base = 16340,
		restore_gold = 840,
		destory_gold = 226,
		prev = 16345,
		id = 16346,
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
	[16347] = {
		trans_use_gold = 440,
		next = 16348,
		base = 16340,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 16346,
		id = 16347,
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
	[16348] = {
		trans_use_gold = 520,
		next = 16349,
		base = 16340,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 16347,
		id = 16348,
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
	[16349] = {
		trans_use_gold = 600,
		next = 16350,
		base = 16340,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 16348,
		id = 16349,
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
	[16350] = {
		trans_use_gold = 0,
		next = 0,
		base = 16340,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 16349,
		id = 16350,
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
	[16400] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 16400,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 16401,
		prev = 0,
		id = 16400,
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
		restore_item = {}
	},
	[16401] = {
		trans_use_gold = 60,
		next = 16402,
		base = 16400,
		restore_gold = 20,
		destory_gold = 14,
		prev = 16400,
		id = 16401,
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
	[16402] = {
		trans_use_gold = 100,
		next = 16403,
		base = 16400,
		restore_gold = 80,
		destory_gold = 29,
		prev = 16401,
		id = 16402,
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
	[16403] = {
		trans_use_gold = 160,
		next = 16404,
		base = 16400,
		restore_gold = 180,
		destory_gold = 54,
		prev = 16402,
		id = 16403,
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
	[16404] = {
		trans_use_gold = 220,
		next = 16405,
		base = 16400,
		restore_gold = 340,
		destory_gold = 94,
		prev = 16403,
		id = 16404,
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
	[16405] = {
		trans_use_gold = 280,
		next = 16406,
		base = 16400,
		restore_gold = 560,
		destory_gold = 149,
		prev = 16404,
		id = 16405,
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
	[16406] = {
		trans_use_gold = 0,
		next = 0,
		base = 16400,
		restore_gold = 840,
		destory_gold = 219,
		prev = 16405,
		id = 16406,
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
	[16420] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 16420,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 16421,
		prev = 0,
		id = 16420,
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
		restore_item = {}
	},
	[16421] = {
		trans_use_gold = 60,
		next = 16422,
		base = 16420,
		restore_gold = 20,
		destory_gold = 21,
		prev = 16420,
		id = 16421,
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
	[16422] = {
		trans_use_gold = 100,
		next = 16423,
		base = 16420,
		restore_gold = 80,
		destory_gold = 36,
		prev = 16421,
		id = 16422,
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
	[16423] = {
		trans_use_gold = 160,
		next = 16424,
		base = 16420,
		restore_gold = 180,
		destory_gold = 61,
		prev = 16422,
		id = 16423,
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
	[16424] = {
		trans_use_gold = 220,
		next = 16425,
		base = 16420,
		restore_gold = 340,
		destory_gold = 101,
		prev = 16423,
		id = 16424,
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
	[16425] = {
		trans_use_gold = 280,
		next = 16426,
		base = 16420,
		restore_gold = 560,
		destory_gold = 156,
		prev = 16424,
		id = 16425,
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
	[16426] = {
		trans_use_gold = 360,
		next = 16427,
		base = 16420,
		restore_gold = 840,
		destory_gold = 226,
		prev = 16425,
		id = 16426,
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
	[16427] = {
		trans_use_gold = 440,
		next = 16428,
		base = 16420,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 16426,
		id = 16427,
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
	[16428] = {
		trans_use_gold = 520,
		next = 16429,
		base = 16420,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 16427,
		id = 16428,
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
	[16429] = {
		trans_use_gold = 600,
		next = 16430,
		base = 16420,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 16428,
		id = 16429,
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
	[16430] = {
		trans_use_gold = 0,
		next = 0,
		base = 16420,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 16429,
		id = 16430,
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
	[16440] = {
		important = 1,
		destory_gold = 25,
		type = 6,
		group = 16440,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 16441,
		prev = 0,
		id = 16440,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17031,
				2
			}
		},
		destory_item = {
			{
				17033,
				1
			}
		},
		restore_item = {}
	},
	[16441] = {
		trans_use_gold = 90,
		next = 16442,
		base = 16440,
		restore_gold = 20,
		destory_gold = 33,
		prev = 16440,
		id = 16441,
		level = 2,
		trans_use_item = {
			{
				17031,
				5
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
	[16442] = {
		trans_use_gold = 150,
		next = 16443,
		base = 16440,
		restore_gold = 80,
		destory_gold = 55,
		prev = 16441,
		id = 16442,
		level = 3,
		trans_use_item = {
			{
				17031,
				8
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
	[16443] = {
		trans_use_gold = 240,
		next = 16444,
		base = 16440,
		restore_gold = 180,
		destory_gold = 93,
		prev = 16442,
		id = 16443,
		level = 4,
		trans_use_item = {
			{
				17032,
				12
			}
		},
		destory_item = {
			{
				17031,
				4
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
	[16444] = {
		trans_use_gold = 330,
		next = 16445,
		base = 16440,
		restore_gold = 340,
		destory_gold = 153,
		prev = 16443,
		id = 16444,
		level = 5,
		trans_use_item = {
			{
				17032,
				16
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
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
			},
			{
				17032,
				8
			}
		}
	},
	[16445] = {
		trans_use_gold = 420,
		next = 16446,
		base = 16440,
		restore_gold = 560,
		destory_gold = 235,
		prev = 16444,
		id = 16445,
		level = 6,
		trans_use_item = {
			{
				17032,
				21
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				7
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
	[16446] = {
		trans_use_gold = 540,
		next = 16447,
		base = 16440,
		restore_gold = 840,
		destory_gold = 340,
		prev = 16445,
		id = 16446,
		level = 7,
		trans_use_item = {
			{
				17033,
				27
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
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
	[16447] = {
		trans_use_gold = 660,
		next = 16448,
		base = 16440,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 16446,
		id = 16447,
		level = 8,
		trans_use_item = {
			{
				17033,
				33
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
			},
			{
				17033,
				7
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
	[16448] = {
		trans_use_gold = 780,
		next = 16449,
		base = 16440,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 16447,
		id = 16448,
		level = 9,
		trans_use_item = {
			{
				17033,
				39
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
			},
			{
				17033,
				15
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
	[16449] = {
		trans_use_gold = 900,
		next = 16450,
		base = 16440,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 16448,
		id = 16449,
		level = 10,
		trans_use_item = {
			{
				17033,
				45
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
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
				66
			}
		}
	},
	[16450] = {
		trans_use_gold = 0,
		next = 0,
		base = 16440,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 16449,
		id = 16450,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
			},
			{
				17033,
				36
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
	[17000] = {
		important = 1,
		destory_gold = 1,
		type = 7,
		group = 17000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 17001,
		prev = 0,
		id = 17000,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[17001] = {
		trans_use_gold = 60,
		next = 17002,
		base = 17000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 17000,
		id = 17001,
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
	[17002] = {
		trans_use_gold = 100,
		next = 17003,
		base = 17000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 17001,
		id = 17002,
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
	[17003] = {
		trans_use_gold = 0,
		next = 0,
		base = 17000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 17002,
		id = 17003,
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
	[17020] = {
		important = 1,
		destory_gold = 4,
		type = 7,
		group = 17020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 17021,
		prev = 0,
		id = 17020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[17021] = {
		trans_use_gold = 60,
		next = 17022,
		base = 17020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 17020,
		id = 17021,
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
	[17022] = {
		trans_use_gold = 100,
		next = 17023,
		base = 17020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 17021,
		id = 17022,
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
	[17023] = {
		trans_use_gold = 0,
		next = 0,
		base = 17020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 17022,
		id = 17023,
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
	[17040] = {
		important = 1,
		destory_gold = 9,
		type = 7,
		group = 17040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 17041,
		prev = 0,
		id = 17040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[17041] = {
		trans_use_gold = 60,
		next = 17042,
		base = 17040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 17040,
		id = 17041,
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
	[17042] = {
		trans_use_gold = 100,
		next = 17043,
		base = 17040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 17041,
		id = 17042,
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
	[17043] = {
		trans_use_gold = 160,
		next = 17044,
		base = 17040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 17042,
		id = 17043,
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
	[17044] = {
		trans_use_gold = 220,
		next = 17045,
		base = 17040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 17043,
		id = 17044,
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
	[17045] = {
		trans_use_gold = 280,
		next = 17046,
		base = 17040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 17044,
		id = 17045,
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
	[17046] = {
		trans_use_gold = 0,
		next = 0,
		base = 17040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 17045,
		id = 17046,
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
	[17100] = {
		important = 1,
		destory_gold = 4,
		type = 7,
		group = 17100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 17101,
		prev = 0,
		id = 17100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[17101] = {
		trans_use_gold = 60,
		next = 17102,
		base = 17100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 17100,
		id = 17101,
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
	[17102] = {
		trans_use_gold = 100,
		next = 17103,
		base = 17100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 17101,
		id = 17102,
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
	[17103] = {
		trans_use_gold = 0,
		next = 0,
		base = 17100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 17102,
		id = 17103,
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
	[17120] = {
		important = 1,
		destory_gold = 9,
		type = 7,
		group = 17120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 17121,
		prev = 0,
		id = 17120,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[17121] = {
		trans_use_gold = 60,
		next = 17122,
		base = 17120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 17120,
		id = 17121,
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
	[17122] = {
		trans_use_gold = 100,
		next = 17123,
		base = 17120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 17121,
		id = 17122,
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
	[17123] = {
		trans_use_gold = 160,
		next = 17124,
		base = 17120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 17122,
		id = 17123,
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
	[17124] = {
		trans_use_gold = 220,
		next = 17125,
		base = 17120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 17123,
		id = 17124,
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
	[17125] = {
		trans_use_gold = 280,
		next = 17126,
		base = 17120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 17124,
		id = 17125,
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
	[17126] = {
		trans_use_gold = 0,
		next = 0,
		base = 17120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 17125,
		id = 17126,
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
	[17140] = {
		important = 1,
		destory_gold = 16,
		type = 7,
		group = 17140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 17141,
		prev = 0,
		id = 17140,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[17141] = {
		trans_use_gold = 60,
		next = 17142,
		base = 17140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 17140,
		id = 17141,
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
	[17142] = {
		trans_use_gold = 100,
		next = 17143,
		base = 17140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 17141,
		id = 17142,
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
	[17143] = {
		trans_use_gold = 160,
		next = 17144,
		base = 17140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 17142,
		id = 17143,
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
	[17144] = {
		trans_use_gold = 220,
		next = 17145,
		base = 17140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 17143,
		id = 17144,
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
	[17145] = {
		trans_use_gold = 280,
		next = 17146,
		base = 17140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 17144,
		id = 17145,
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
	[17146] = {
		trans_use_gold = 360,
		next = 17147,
		base = 17140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 17145,
		id = 17146,
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
	[17147] = {
		trans_use_gold = 440,
		next = 17148,
		base = 17140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 17146,
		id = 17147,
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
	[17148] = {
		trans_use_gold = 520,
		next = 17149,
		base = 17140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 17147,
		id = 17148,
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
	[17149] = {
		trans_use_gold = 600,
		next = 17150,
		base = 17140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 17148,
		id = 17149,
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
	[17150] = {
		trans_use_gold = 0,
		next = 0,
		base = 17140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 17149,
		id = 17150,
		level = 11,
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
	[17200] = {
		important = 1,
		destory_gold = 4,
		type = 7,
		group = 17200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 17201,
		prev = 0,
		id = 17200,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[17201] = {
		trans_use_gold = 60,
		next = 17202,
		base = 17200,
		restore_gold = 20,
		destory_gold = 9,
		prev = 17200,
		id = 17201,
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
	[17202] = {
		trans_use_gold = 100,
		next = 17203,
		base = 17200,
		restore_gold = 80,
		destory_gold = 24,
		prev = 17201,
		id = 17202,
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
	[17203] = {
		trans_use_gold = 0,
		next = 0,
		base = 17200,
		restore_gold = 180,
		destory_gold = 49,
		prev = 17202,
		id = 17203,
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
	[17220] = {
		important = 1,
		destory_gold = 9,
		type = 7,
		group = 17220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 17221,
		prev = 0,
		id = 17220,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[17221] = {
		trans_use_gold = 60,
		next = 17222,
		base = 17220,
		restore_gold = 20,
		destory_gold = 14,
		prev = 17220,
		id = 17221,
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
	[17222] = {
		trans_use_gold = 100,
		next = 17223,
		base = 17220,
		restore_gold = 80,
		destory_gold = 29,
		prev = 17221,
		id = 17222,
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
	[17223] = {
		trans_use_gold = 160,
		next = 17224,
		base = 17220,
		restore_gold = 180,
		destory_gold = 54,
		prev = 17222,
		id = 17223,
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
	[17224] = {
		trans_use_gold = 220,
		next = 17225,
		base = 17220,
		restore_gold = 340,
		destory_gold = 94,
		prev = 17223,
		id = 17224,
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
	[17225] = {
		trans_use_gold = 280,
		next = 17226,
		base = 17220,
		restore_gold = 560,
		destory_gold = 149,
		prev = 17224,
		id = 17225,
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
	[17226] = {
		trans_use_gold = 0,
		next = 0,
		base = 17220,
		restore_gold = 840,
		destory_gold = 219,
		prev = 17225,
		id = 17226,
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
	[17240] = {
		important = 1,
		destory_gold = 16,
		type = 7,
		group = 17240,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 17241,
		prev = 0,
		id = 17240,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[17241] = {
		trans_use_gold = 60,
		next = 17242,
		base = 17240,
		restore_gold = 20,
		destory_gold = 21,
		prev = 17240,
		id = 17241,
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
	[17242] = {
		trans_use_gold = 100,
		next = 17243,
		base = 17240,
		restore_gold = 80,
		destory_gold = 36,
		prev = 17241,
		id = 17242,
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
	[17243] = {
		trans_use_gold = 160,
		next = 17244,
		base = 17240,
		restore_gold = 180,
		destory_gold = 61,
		prev = 17242,
		id = 17243,
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
	[17244] = {
		trans_use_gold = 220,
		next = 17245,
		base = 17240,
		restore_gold = 340,
		destory_gold = 101,
		prev = 17243,
		id = 17244,
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
	[17245] = {
		trans_use_gold = 280,
		next = 17246,
		base = 17240,
		restore_gold = 560,
		destory_gold = 156,
		prev = 17244,
		id = 17245,
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
	[17246] = {
		trans_use_gold = 360,
		next = 17247,
		base = 17240,
		restore_gold = 840,
		destory_gold = 226,
		prev = 17245,
		id = 17246,
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
	[17247] = {
		trans_use_gold = 440,
		next = 17248,
		base = 17240,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 17246,
		id = 17247,
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
	[17248] = {
		trans_use_gold = 520,
		next = 17249,
		base = 17240,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 17247,
		id = 17248,
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
	[17249] = {
		trans_use_gold = 600,
		next = 17250,
		base = 17240,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 17248,
		id = 17249,
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
	[17250] = {
		trans_use_gold = 0,
		next = 0,
		base = 17240,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 17249,
		id = 17250,
		level = 11,
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
	[17300] = {
		important = 1,
		destory_gold = 9,
		type = 7,
		group = 17300,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 17301,
		prev = 0,
		id = 17300,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[17301] = {
		trans_use_gold = 60,
		next = 17302,
		base = 17300,
		restore_gold = 20,
		destory_gold = 14,
		prev = 17300,
		id = 17301,
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
	[17302] = {
		trans_use_gold = 100,
		next = 17303,
		base = 17300,
		restore_gold = 80,
		destory_gold = 29,
		prev = 17301,
		id = 17302,
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
	[17303] = {
		trans_use_gold = 160,
		next = 17304,
		base = 17300,
		restore_gold = 180,
		destory_gold = 54,
		prev = 17302,
		id = 17303,
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
	[17304] = {
		trans_use_gold = 220,
		next = 17305,
		base = 17300,
		restore_gold = 340,
		destory_gold = 94,
		prev = 17303,
		id = 17304,
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
	[17305] = {
		trans_use_gold = 280,
		next = 17306,
		base = 17300,
		restore_gold = 560,
		destory_gold = 149,
		prev = 17304,
		id = 17305,
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
	[17306] = {
		trans_use_gold = 0,
		next = 0,
		base = 17300,
		restore_gold = 840,
		destory_gold = 219,
		prev = 17305,
		id = 17306,
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
	[17320] = {
		important = 1,
		destory_gold = 16,
		type = 7,
		group = 17320,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 17321,
		prev = 0,
		id = 17320,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[17321] = {
		trans_use_gold = 60,
		next = 17322,
		base = 17320,
		restore_gold = 20,
		destory_gold = 21,
		prev = 17320,
		id = 17321,
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
	[17322] = {
		trans_use_gold = 100,
		next = 17323,
		base = 17320,
		restore_gold = 80,
		destory_gold = 36,
		prev = 17321,
		id = 17322,
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
	[17323] = {
		trans_use_gold = 160,
		next = 17324,
		base = 17320,
		restore_gold = 180,
		destory_gold = 61,
		prev = 17322,
		id = 17323,
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
	[17324] = {
		trans_use_gold = 220,
		next = 17325,
		base = 17320,
		restore_gold = 340,
		destory_gold = 101,
		prev = 17323,
		id = 17324,
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
	[17325] = {
		trans_use_gold = 280,
		next = 17326,
		base = 17320,
		restore_gold = 560,
		destory_gold = 156,
		prev = 17324,
		id = 17325,
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
	[17326] = {
		trans_use_gold = 360,
		next = 17327,
		base = 17320,
		restore_gold = 840,
		destory_gold = 226,
		prev = 17325,
		id = 17326,
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
	[17327] = {
		trans_use_gold = 440,
		next = 17328,
		base = 17320,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 17326,
		id = 17327,
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
	[17328] = {
		trans_use_gold = 520,
		next = 17329,
		base = 17320,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 17327,
		id = 17328,
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
	[17329] = {
		trans_use_gold = 600,
		next = 17330,
		base = 17320,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 17328,
		id = 17329,
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
	[17330] = {
		trans_use_gold = 0,
		next = 0,
		base = 17320,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 17329,
		id = 17330,
		level = 11,
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
	[17340] = {
		important = 1,
		destory_gold = 25,
		type = 7,
		group = 17340,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 17341,
		prev = 0,
		id = 17340,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				2
			}
		},
		destory_item = {
			{
				17043,
				1
			}
		},
		restore_item = {}
	},
	[17341] = {
		trans_use_gold = 90,
		next = 17342,
		base = 17340,
		restore_gold = 20,
		destory_gold = 33,
		prev = 17340,
		id = 17341,
		level = 2,
		trans_use_item = {
			{
				17041,
				5
			}
		},
		destory_item = {
			{
				17041,
				1
			},
			{
				17043,
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
	[17342] = {
		trans_use_gold = 150,
		next = 17343,
		base = 17340,
		restore_gold = 80,
		destory_gold = 55,
		prev = 17341,
		id = 17342,
		level = 3,
		trans_use_item = {
			{
				17041,
				8
			}
		},
		destory_item = {
			{
				17041,
				2
			},
			{
				17043,
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
	[17343] = {
		trans_use_gold = 240,
		next = 17344,
		base = 17340,
		restore_gold = 180,
		destory_gold = 93,
		prev = 17342,
		id = 17343,
		level = 4,
		trans_use_item = {
			{
				17042,
				12
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17043,
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
	[17344] = {
		trans_use_gold = 330,
		next = 17345,
		base = 17340,
		restore_gold = 340,
		destory_gold = 153,
		prev = 17343,
		id = 17344,
		level = 5,
		trans_use_item = {
			{
				17042,
				16
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				3
			},
			{
				17043,
				1
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
	[17345] = {
		trans_use_gold = 420,
		next = 17346,
		base = 17340,
		restore_gold = 560,
		destory_gold = 235,
		prev = 17344,
		id = 17345,
		level = 6,
		trans_use_item = {
			{
				17042,
				21
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				7
			},
			{
				17043,
				1
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
	[17346] = {
		trans_use_gold = 540,
		next = 17347,
		base = 17340,
		restore_gold = 840,
		destory_gold = 340,
		prev = 17345,
		id = 17346,
		level = 7,
		trans_use_item = {
			{
				17043,
				27
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				1
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
	[17347] = {
		trans_use_gold = 660,
		next = 17348,
		base = 17340,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 17346,
		id = 17347,
		level = 8,
		trans_use_item = {
			{
				17043,
				33
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				7
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
	[17348] = {
		trans_use_gold = 780,
		next = 17349,
		base = 17340,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 17347,
		id = 17348,
		level = 9,
		trans_use_item = {
			{
				17043,
				39
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				15
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
	[17349] = {
		trans_use_gold = 900,
		next = 17350,
		base = 17340,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 17348,
		id = 17349,
		level = 10,
		trans_use_item = {
			{
				17043,
				45
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				25
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
	[17350] = {
		trans_use_gold = 0,
		next = 0,
		base = 17340,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 17349,
		id = 17350,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				36
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
	[18000] = {
		important = 1,
		destory_gold = 1,
		type = 8,
		group = 18000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 18001,
		prev = 0,
		id = 18000,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[18001] = {
		trans_use_gold = 60,
		next = 18002,
		base = 18000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 18000,
		id = 18001,
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
	[18002] = {
		trans_use_gold = 100,
		next = 18003,
		base = 18000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 18001,
		id = 18002,
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
	[18003] = {
		trans_use_gold = 0,
		next = 0,
		base = 18000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 18002,
		id = 18003,
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
	[18020] = {
		important = 1,
		destory_gold = 4,
		type = 8,
		group = 18020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 18021,
		prev = 0,
		id = 18020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[18021] = {
		trans_use_gold = 60,
		next = 18022,
		base = 18020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 18020,
		id = 18021,
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
	[18022] = {
		trans_use_gold = 100,
		next = 18023,
		base = 18020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 18021,
		id = 18022,
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
	[18023] = {
		trans_use_gold = 0,
		next = 0,
		base = 18020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 18022,
		id = 18023,
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
	[18040] = {
		important = 1,
		destory_gold = 9,
		type = 8,
		group = 18040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 18041,
		prev = 0,
		id = 18040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[18041] = {
		trans_use_gold = 60,
		next = 18042,
		base = 18040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 18040,
		id = 18041,
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
	[18042] = {
		trans_use_gold = 100,
		next = 18043,
		base = 18040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 18041,
		id = 18042,
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
	[18043] = {
		trans_use_gold = 160,
		next = 18044,
		base = 18040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 18042,
		id = 18043,
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
	[18044] = {
		trans_use_gold = 220,
		next = 18045,
		base = 18040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 18043,
		id = 18044,
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
	[18045] = {
		trans_use_gold = 280,
		next = 18046,
		base = 18040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 18044,
		id = 18045,
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
	[18046] = {
		trans_use_gold = 0,
		next = 0,
		base = 18040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 18045,
		id = 18046,
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
	[18100] = {
		important = 1,
		destory_gold = 4,
		type = 8,
		group = 18100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 18101,
		prev = 0,
		id = 18100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[18101] = {
		trans_use_gold = 60,
		next = 18102,
		base = 18100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 18100,
		id = 18101,
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
	[18102] = {
		trans_use_gold = 100,
		next = 18103,
		base = 18100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 18101,
		id = 18102,
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
	[18103] = {
		trans_use_gold = 0,
		next = 0,
		base = 18100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 18102,
		id = 18103,
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
	[18120] = {
		important = 1,
		destory_gold = 9,
		type = 8,
		group = 18120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 18121,
		prev = 0,
		id = 18120,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[18121] = {
		trans_use_gold = 60,
		next = 18122,
		base = 18120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 18120,
		id = 18121,
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
	[18122] = {
		trans_use_gold = 100,
		next = 18123,
		base = 18120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 18121,
		id = 18122,
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
	[18123] = {
		trans_use_gold = 160,
		next = 18124,
		base = 18120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 18122,
		id = 18123,
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
	[18124] = {
		trans_use_gold = 220,
		next = 18125,
		base = 18120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 18123,
		id = 18124,
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
	[18125] = {
		trans_use_gold = 280,
		next = 18126,
		base = 18120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 18124,
		id = 18125,
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
	[18126] = {
		trans_use_gold = 0,
		next = 0,
		base = 18120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 18125,
		id = 18126,
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
	[18140] = {
		important = 1,
		destory_gold = 16,
		type = 8,
		group = 18140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 18141,
		prev = 0,
		id = 18140,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[18141] = {
		trans_use_gold = 60,
		next = 18142,
		base = 18140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 18140,
		id = 18141,
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
	[18142] = {
		trans_use_gold = 100,
		next = 18143,
		base = 18140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 18141,
		id = 18142,
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
	[18143] = {
		trans_use_gold = 160,
		next = 18144,
		base = 18140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 18142,
		id = 18143,
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
	[18144] = {
		trans_use_gold = 220,
		next = 18145,
		base = 18140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 18143,
		id = 18144,
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
	[18145] = {
		trans_use_gold = 280,
		next = 18146,
		base = 18140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 18144,
		id = 18145,
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
	[18146] = {
		trans_use_gold = 360,
		next = 18147,
		base = 18140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 18145,
		id = 18146,
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
	[18147] = {
		trans_use_gold = 440,
		next = 18148,
		base = 18140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 18146,
		id = 18147,
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
	[18148] = {
		trans_use_gold = 520,
		next = 18149,
		base = 18140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 18147,
		id = 18148,
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
	[18149] = {
		trans_use_gold = 600,
		next = 18150,
		base = 18140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 18148,
		id = 18149,
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
	[18150] = {
		trans_use_gold = 0,
		next = 0,
		base = 18140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 18149,
		id = 18150,
		level = 11,
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
	[19000] = {
		important = 1,
		destory_gold = 1,
		type = 9,
		group = 19000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 19001,
		prev = 0,
		id = 19000,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[19001] = {
		trans_use_gold = 60,
		next = 19002,
		base = 19000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 19000,
		id = 19001,
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
	[19002] = {
		trans_use_gold = 100,
		next = 19003,
		base = 19000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 19001,
		id = 19002,
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
	[19003] = {
		trans_use_gold = 0,
		next = 0,
		base = 19000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 19002,
		id = 19003,
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
	[19020] = {
		important = 1,
		destory_gold = 4,
		type = 9,
		group = 19020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 19021,
		prev = 0,
		id = 19020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[19021] = {
		trans_use_gold = 60,
		next = 19022,
		base = 19020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 19020,
		id = 19021,
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
	[19022] = {
		trans_use_gold = 100,
		next = 19023,
		base = 19020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 19021,
		id = 19022,
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
	[19023] = {
		trans_use_gold = 0,
		next = 0,
		base = 19020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 19022,
		id = 19023,
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
	[19040] = {
		important = 1,
		destory_gold = 9,
		type = 9,
		group = 19040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 19041,
		prev = 0,
		id = 19040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[19041] = {
		trans_use_gold = 60,
		next = 19042,
		base = 19040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 19040,
		id = 19041,
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
	[19042] = {
		trans_use_gold = 100,
		next = 19043,
		base = 19040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 19041,
		id = 19042,
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
	[19043] = {
		trans_use_gold = 160,
		next = 19044,
		base = 19040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 19042,
		id = 19043,
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
	[19044] = {
		trans_use_gold = 220,
		next = 19045,
		base = 19040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 19043,
		id = 19044,
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
	[19045] = {
		trans_use_gold = 280,
		next = 19046,
		base = 19040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 19044,
		id = 19045,
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
	[19046] = {
		trans_use_gold = 0,
		next = 0,
		base = 19040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 19045,
		id = 19046,
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
	[19100] = {
		important = 1,
		destory_gold = 4,
		type = 9,
		group = 19100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 19101,
		prev = 0,
		id = 19100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[19101] = {
		trans_use_gold = 60,
		next = 19102,
		base = 19100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 19100,
		id = 19101,
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
	[19102] = {
		trans_use_gold = 100,
		next = 19103,
		base = 19100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 19101,
		id = 19102,
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
	[19103] = {
		trans_use_gold = 0,
		next = 0,
		base = 19100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 19102,
		id = 19103,
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
	[19120] = {
		important = 1,
		destory_gold = 9,
		type = 9,
		group = 19120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 19121,
		prev = 0,
		id = 19120,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[19121] = {
		trans_use_gold = 60,
		next = 19122,
		base = 19120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 19120,
		id = 19121,
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
	[19122] = {
		trans_use_gold = 100,
		next = 19123,
		base = 19120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 19121,
		id = 19122,
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
	[19123] = {
		trans_use_gold = 160,
		next = 19124,
		base = 19120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 19122,
		id = 19123,
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
	[19124] = {
		trans_use_gold = 220,
		next = 19125,
		base = 19120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 19123,
		id = 19124,
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
	[19125] = {
		trans_use_gold = 280,
		next = 19126,
		base = 19120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 19124,
		id = 19125,
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
	[19126] = {
		trans_use_gold = 0,
		next = 0,
		base = 19120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 19125,
		id = 19126,
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
	[19140] = {
		important = 1,
		destory_gold = 16,
		type = 9,
		group = 19140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 19141,
		prev = 0,
		id = 19140,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[19141] = {
		trans_use_gold = 60,
		next = 19142,
		base = 19140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 19140,
		id = 19141,
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
	[19142] = {
		trans_use_gold = 100,
		next = 19143,
		base = 19140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 19141,
		id = 19142,
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
	[19143] = {
		trans_use_gold = 160,
		next = 19144,
		base = 19140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 19142,
		id = 19143,
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
	[19144] = {
		trans_use_gold = 220,
		next = 19145,
		base = 19140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 19143,
		id = 19144,
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
	[19145] = {
		trans_use_gold = 280,
		next = 19146,
		base = 19140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 19144,
		id = 19145,
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
	[19146] = {
		trans_use_gold = 360,
		next = 19147,
		base = 19140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 19145,
		id = 19146,
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
	[19147] = {
		trans_use_gold = 440,
		next = 19148,
		base = 19140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 19146,
		id = 19147,
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
	[19148] = {
		trans_use_gold = 520,
		next = 19149,
		base = 19140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 19147,
		id = 19148,
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
	[19149] = {
		trans_use_gold = 600,
		next = 19150,
		base = 19140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 19148,
		id = 19149,
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
	[19150] = {
		trans_use_gold = 0,
		next = 0,
		base = 19140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 19149,
		id = 19150,
		level = 11,
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
	[19200] = {
		important = 1,
		destory_gold = 9,
		type = 9,
		group = 19200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 19201,
		prev = 0,
		id = 19200,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[19201] = {
		trans_use_gold = 60,
		next = 19202,
		base = 19200,
		restore_gold = 20,
		destory_gold = 14,
		prev = 19200,
		id = 19201,
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
	[19202] = {
		trans_use_gold = 100,
		next = 19203,
		base = 19200,
		restore_gold = 80,
		destory_gold = 29,
		prev = 19201,
		id = 19202,
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
	[19203] = {
		trans_use_gold = 160,
		next = 19204,
		base = 19200,
		restore_gold = 180,
		destory_gold = 54,
		prev = 19202,
		id = 19203,
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
	[19204] = {
		trans_use_gold = 220,
		next = 19205,
		base = 19200,
		restore_gold = 340,
		destory_gold = 94,
		prev = 19203,
		id = 19204,
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
	[19205] = {
		trans_use_gold = 280,
		next = 19206,
		base = 19200,
		restore_gold = 560,
		destory_gold = 149,
		prev = 19204,
		id = 19205,
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
	[19206] = {
		trans_use_gold = 0,
		next = 0,
		base = 19200,
		restore_gold = 840,
		destory_gold = 219,
		prev = 19205,
		id = 19206,
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
	[19220] = {
		important = 1,
		destory_gold = 16,
		type = 9,
		group = 19220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 19221,
		prev = 0,
		id = 19220,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[19221] = {
		trans_use_gold = 60,
		next = 19222,
		base = 19220,
		restore_gold = 20,
		destory_gold = 21,
		prev = 19220,
		id = 19221,
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
	[19222] = {
		trans_use_gold = 100,
		next = 19223,
		base = 19220,
		restore_gold = 80,
		destory_gold = 36,
		prev = 19221,
		id = 19222,
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
	[19223] = {
		trans_use_gold = 160,
		next = 19224,
		base = 19220,
		restore_gold = 180,
		destory_gold = 61,
		prev = 19222,
		id = 19223,
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
	[19224] = {
		trans_use_gold = 220,
		next = 19225,
		base = 19220,
		restore_gold = 340,
		destory_gold = 101,
		prev = 19223,
		id = 19224,
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
	[19225] = {
		trans_use_gold = 280,
		next = 19226,
		base = 19220,
		restore_gold = 560,
		destory_gold = 156,
		prev = 19224,
		id = 19225,
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
	[19226] = {
		trans_use_gold = 360,
		next = 19227,
		base = 19220,
		restore_gold = 840,
		destory_gold = 226,
		prev = 19225,
		id = 19226,
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
	[19227] = {
		trans_use_gold = 440,
		next = 19228,
		base = 19220,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 19226,
		id = 19227,
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
	[19228] = {
		trans_use_gold = 520,
		next = 19229,
		base = 19220,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 19227,
		id = 19228,
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
	[19229] = {
		trans_use_gold = 600,
		next = 19230,
		base = 19220,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 19228,
		id = 19229,
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
	[19230] = {
		trans_use_gold = 0,
		next = 0,
		base = 19220,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 19229,
		id = 19230,
		level = 11,
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
	[19240] = {
		important = 1,
		destory_gold = 25,
		type = 9,
		group = 19240,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 19241,
		prev = 0,
		id = 19240,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				2
			}
		},
		destory_item = {
			{
				17043,
				1
			}
		},
		restore_item = {}
	},
	[19241] = {
		trans_use_gold = 90,
		next = 19242,
		base = 19240,
		restore_gold = 20,
		destory_gold = 33,
		prev = 19240,
		id = 19241,
		level = 2,
		trans_use_item = {
			{
				17041,
				5
			}
		},
		destory_item = {
			{
				17041,
				1
			},
			{
				17043,
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
	[19242] = {
		trans_use_gold = 150,
		next = 19243,
		base = 19240,
		restore_gold = 80,
		destory_gold = 55,
		prev = 19241,
		id = 19242,
		level = 3,
		trans_use_item = {
			{
				17041,
				8
			}
		},
		destory_item = {
			{
				17041,
				2
			},
			{
				17043,
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
	[19243] = {
		trans_use_gold = 240,
		next = 19244,
		base = 19240,
		restore_gold = 180,
		destory_gold = 93,
		prev = 19242,
		id = 19243,
		level = 4,
		trans_use_item = {
			{
				17042,
				12
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17043,
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
	[19244] = {
		trans_use_gold = 330,
		next = 19245,
		base = 19240,
		restore_gold = 340,
		destory_gold = 153,
		prev = 19243,
		id = 19244,
		level = 5,
		trans_use_item = {
			{
				17042,
				16
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				3
			},
			{
				17043,
				1
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
	[19245] = {
		trans_use_gold = 420,
		next = 19246,
		base = 19240,
		restore_gold = 560,
		destory_gold = 235,
		prev = 19244,
		id = 19245,
		level = 6,
		trans_use_item = {
			{
				17042,
				21
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				7
			},
			{
				17043,
				1
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
	[19246] = {
		trans_use_gold = 540,
		next = 19247,
		base = 19240,
		restore_gold = 840,
		destory_gold = 340,
		prev = 19245,
		id = 19246,
		level = 7,
		trans_use_item = {
			{
				17043,
				27
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				1
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
	[19247] = {
		trans_use_gold = 660,
		next = 19248,
		base = 19240,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 19246,
		id = 19247,
		level = 8,
		trans_use_item = {
			{
				17043,
				33
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				7
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
	[19248] = {
		trans_use_gold = 780,
		next = 19249,
		base = 19240,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 19247,
		id = 19248,
		level = 9,
		trans_use_item = {
			{
				17043,
				39
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				15
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
	[19249] = {
		trans_use_gold = 900,
		next = 19250,
		base = 19240,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 19248,
		id = 19249,
		level = 10,
		trans_use_item = {
			{
				17043,
				45
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				25
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
	[19250] = {
		trans_use_gold = 0,
		next = 0,
		base = 19240,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 19249,
		id = 19250,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				36
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
	[21000] = {
		important = 1,
		destory_gold = 1,
		type = 1,
		group = 21000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21001,
		prev = 0,
		id = 21000,
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
		restore_item = {}
	},
	[21001] = {
		trans_use_gold = 60,
		next = 21002,
		base = 21000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 21000,
		id = 21001,
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
	[21002] = {
		trans_use_gold = 100,
		next = 21003,
		base = 21000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 21001,
		id = 21002,
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
	[21003] = {
		trans_use_gold = 0,
		next = 0,
		base = 21000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 21002,
		id = 21003,
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
	[21020] = {
		important = 1,
		destory_gold = 4,
		type = 1,
		group = 21020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21021,
		prev = 0,
		id = 21020,
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
		restore_item = {}
	},
	[21021] = {
		trans_use_gold = 60,
		next = 21022,
		base = 21020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 21020,
		id = 21021,
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
	[21022] = {
		trans_use_gold = 100,
		next = 21023,
		base = 21020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 21021,
		id = 21022,
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
	[21023] = {
		trans_use_gold = 0,
		next = 0,
		base = 21020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 21022,
		id = 21023,
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
	[21040] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 21040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21041,
		prev = 0,
		id = 21040,
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
		restore_item = {}
	},
	[21041] = {
		trans_use_gold = 60,
		next = 21042,
		base = 21040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 21040,
		id = 21041,
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
	[21042] = {
		trans_use_gold = 100,
		next = 21043,
		base = 21040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 21041,
		id = 21042,
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
	[21043] = {
		trans_use_gold = 160,
		next = 21044,
		base = 21040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 21042,
		id = 21043,
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
	[21044] = {
		trans_use_gold = 220,
		next = 21045,
		base = 21040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 21043,
		id = 21044,
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
	[21045] = {
		trans_use_gold = 280,
		next = 21046,
		base = 21040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 21044,
		id = 21045,
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
	[21046] = {
		trans_use_gold = 0,
		next = 0,
		base = 21040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 21045,
		id = 21046,
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
	[21100] = {
		important = 1,
		destory_gold = 1,
		type = 1,
		group = 21100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21101,
		prev = 0,
		id = 21100,
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
		restore_item = {}
	},
	[21101] = {
		trans_use_gold = 60,
		next = 21102,
		base = 21100,
		restore_gold = 20,
		destory_gold = 6,
		prev = 21100,
		id = 21101,
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
	[21102] = {
		trans_use_gold = 100,
		next = 21103,
		base = 21100,
		restore_gold = 80,
		destory_gold = 21,
		prev = 21101,
		id = 21102,
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
	[21103] = {
		trans_use_gold = 0,
		next = 0,
		base = 21100,
		restore_gold = 180,
		destory_gold = 46,
		prev = 21102,
		id = 21103,
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
	[21120] = {
		important = 1,
		destory_gold = 4,
		type = 1,
		group = 21120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21121,
		prev = 0,
		id = 21120,
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
		restore_item = {}
	},
	[21121] = {
		trans_use_gold = 60,
		next = 21122,
		base = 21120,
		restore_gold = 20,
		destory_gold = 9,
		prev = 21120,
		id = 21121,
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
	[21122] = {
		trans_use_gold = 100,
		next = 21123,
		base = 21120,
		restore_gold = 80,
		destory_gold = 24,
		prev = 21121,
		id = 21122,
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
	[21123] = {
		trans_use_gold = 0,
		next = 0,
		base = 21120,
		restore_gold = 180,
		destory_gold = 49,
		prev = 21122,
		id = 21123,
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
	[21140] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 21140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21141,
		prev = 0,
		id = 21140,
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
		restore_item = {}
	},
	[21141] = {
		trans_use_gold = 60,
		next = 21142,
		base = 21140,
		restore_gold = 20,
		destory_gold = 14,
		prev = 21140,
		id = 21141,
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
	[21142] = {
		trans_use_gold = 100,
		next = 21143,
		base = 21140,
		restore_gold = 80,
		destory_gold = 29,
		prev = 21141,
		id = 21142,
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
	[21143] = {
		trans_use_gold = 160,
		next = 21144,
		base = 21140,
		restore_gold = 180,
		destory_gold = 54,
		prev = 21142,
		id = 21143,
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
	[21144] = {
		trans_use_gold = 220,
		next = 21145,
		base = 21140,
		restore_gold = 340,
		destory_gold = 94,
		prev = 21143,
		id = 21144,
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
	[21145] = {
		trans_use_gold = 280,
		next = 21146,
		base = 21140,
		restore_gold = 560,
		destory_gold = 149,
		prev = 21144,
		id = 21145,
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
	[21146] = {
		trans_use_gold = 0,
		next = 0,
		base = 21140,
		restore_gold = 840,
		destory_gold = 219,
		prev = 21145,
		id = 21146,
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
	[21200] = {
		important = 1,
		destory_gold = 4,
		type = 1,
		group = 21200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21201,
		prev = 0,
		id = 21200,
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
		restore_item = {}
	},
	[21201] = {
		trans_use_gold = 60,
		next = 21202,
		base = 21200,
		restore_gold = 20,
		destory_gold = 9,
		prev = 21200,
		id = 21201,
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
	[21202] = {
		trans_use_gold = 100,
		next = 21203,
		base = 21200,
		restore_gold = 80,
		destory_gold = 24,
		prev = 21201,
		id = 21202,
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
	[21203] = {
		trans_use_gold = 0,
		next = 0,
		base = 21200,
		restore_gold = 180,
		destory_gold = 49,
		prev = 21202,
		id = 21203,
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
	[21220] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 21220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21221,
		prev = 0,
		id = 21220,
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
		restore_item = {}
	},
	[21221] = {
		trans_use_gold = 60,
		next = 21222,
		base = 21220,
		restore_gold = 20,
		destory_gold = 14,
		prev = 21220,
		id = 21221,
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
	[21222] = {
		trans_use_gold = 100,
		next = 21223,
		base = 21220,
		restore_gold = 80,
		destory_gold = 29,
		prev = 21221,
		id = 21222,
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
	[21223] = {
		trans_use_gold = 160,
		next = 21224,
		base = 21220,
		restore_gold = 180,
		destory_gold = 54,
		prev = 21222,
		id = 21223,
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
	[21224] = {
		trans_use_gold = 220,
		next = 21225,
		base = 21220,
		restore_gold = 340,
		destory_gold = 94,
		prev = 21223,
		id = 21224,
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
	[21225] = {
		trans_use_gold = 280,
		next = 21226,
		base = 21220,
		restore_gold = 560,
		destory_gold = 149,
		prev = 21224,
		id = 21225,
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
	[21226] = {
		trans_use_gold = 0,
		next = 0,
		base = 21220,
		restore_gold = 840,
		destory_gold = 219,
		prev = 21225,
		id = 21226,
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
	[21240] = {
		important = 1,
		destory_gold = 16,
		type = 1,
		group = 21240,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21241,
		prev = 0,
		id = 21240,
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
		restore_item = {}
	},
	[21241] = {
		trans_use_gold = 60,
		next = 21242,
		base = 21240,
		restore_gold = 20,
		destory_gold = 21,
		prev = 21240,
		id = 21241,
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
	[21242] = {
		trans_use_gold = 100,
		next = 21243,
		base = 21240,
		restore_gold = 80,
		destory_gold = 36,
		prev = 21241,
		id = 21242,
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
	[21243] = {
		trans_use_gold = 160,
		next = 21244,
		base = 21240,
		restore_gold = 180,
		destory_gold = 61,
		prev = 21242,
		id = 21243,
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
	[21244] = {
		trans_use_gold = 220,
		next = 21245,
		base = 21240,
		restore_gold = 340,
		destory_gold = 101,
		prev = 21243,
		id = 21244,
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
	[21245] = {
		trans_use_gold = 280,
		next = 21246,
		base = 21240,
		restore_gold = 560,
		destory_gold = 156,
		prev = 21244,
		id = 21245,
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
	[21246] = {
		trans_use_gold = 360,
		next = 21247,
		base = 21240,
		restore_gold = 840,
		destory_gold = 226,
		prev = 21245,
		id = 21246,
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
	[21247] = {
		trans_use_gold = 440,
		next = 21248,
		base = 21240,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 21246,
		id = 21247,
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
	[21248] = {
		trans_use_gold = 520,
		next = 21249,
		base = 21240,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 21247,
		id = 21248,
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
	[21249] = {
		trans_use_gold = 600,
		next = 21250,
		base = 21240,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 21248,
		id = 21249,
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
	[21250] = {
		trans_use_gold = 0,
		next = 0,
		base = 21240,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 21249,
		id = 21250,
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
	[21300] = {
		important = 1,
		destory_gold = 1,
		type = 1,
		group = 21300,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21301,
		prev = 0,
		id = 21300,
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
		restore_item = {}
	},
	[21301] = {
		trans_use_gold = 60,
		next = 21302,
		base = 21300,
		restore_gold = 20,
		destory_gold = 6,
		prev = 21300,
		id = 21301,
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
	[21302] = {
		trans_use_gold = 100,
		next = 21303,
		base = 21300,
		restore_gold = 80,
		destory_gold = 21,
		prev = 21301,
		id = 21302,
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
	[21303] = {
		trans_use_gold = 0,
		next = 0,
		base = 21300,
		restore_gold = 180,
		destory_gold = 46,
		prev = 21302,
		id = 21303,
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
	[21320] = {
		important = 1,
		destory_gold = 4,
		type = 1,
		group = 21320,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21321,
		prev = 0,
		id = 21320,
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
		restore_item = {}
	},
	[21321] = {
		trans_use_gold = 60,
		next = 21322,
		base = 21320,
		restore_gold = 20,
		destory_gold = 9,
		prev = 21320,
		id = 21321,
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
	[21322] = {
		trans_use_gold = 100,
		next = 21323,
		base = 21320,
		restore_gold = 80,
		destory_gold = 24,
		prev = 21321,
		id = 21322,
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
	[21323] = {
		trans_use_gold = 0,
		next = 0,
		base = 21320,
		restore_gold = 180,
		destory_gold = 49,
		prev = 21322,
		id = 21323,
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
	[21340] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 21340,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21341,
		prev = 0,
		id = 21340,
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
		restore_item = {}
	},
	[21341] = {
		trans_use_gold = 60,
		next = 21342,
		base = 21340,
		restore_gold = 20,
		destory_gold = 14,
		prev = 21340,
		id = 21341,
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
	[21342] = {
		trans_use_gold = 100,
		next = 21343,
		base = 21340,
		restore_gold = 80,
		destory_gold = 29,
		prev = 21341,
		id = 21342,
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
	[21343] = {
		trans_use_gold = 160,
		next = 21344,
		base = 21340,
		restore_gold = 180,
		destory_gold = 54,
		prev = 21342,
		id = 21343,
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
	[21344] = {
		trans_use_gold = 220,
		next = 21345,
		base = 21340,
		restore_gold = 340,
		destory_gold = 94,
		prev = 21343,
		id = 21344,
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
	[21345] = {
		trans_use_gold = 280,
		next = 21346,
		base = 21340,
		restore_gold = 560,
		destory_gold = 149,
		prev = 21344,
		id = 21345,
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
	[21346] = {
		trans_use_gold = 0,
		next = 0,
		base = 21340,
		restore_gold = 840,
		destory_gold = 219,
		prev = 21345,
		id = 21346,
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
	[21400] = {
		important = 1,
		destory_gold = 4,
		type = 1,
		group = 21400,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21401,
		prev = 0,
		id = 21400,
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
		restore_item = {}
	},
	[21401] = {
		trans_use_gold = 60,
		next = 21402,
		base = 21400,
		restore_gold = 20,
		destory_gold = 9,
		prev = 21400,
		id = 21401,
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
	[21402] = {
		trans_use_gold = 100,
		next = 21403,
		base = 21400,
		restore_gold = 80,
		destory_gold = 24,
		prev = 21401,
		id = 21402,
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
	[21403] = {
		trans_use_gold = 0,
		next = 0,
		base = 21400,
		restore_gold = 180,
		destory_gold = 49,
		prev = 21402,
		id = 21403,
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
	[21420] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 21420,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21421,
		prev = 0,
		id = 21420,
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
		restore_item = {}
	},
	[21421] = {
		trans_use_gold = 60,
		next = 21422,
		base = 21420,
		restore_gold = 20,
		destory_gold = 14,
		prev = 21420,
		id = 21421,
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
	[21422] = {
		trans_use_gold = 100,
		next = 21423,
		base = 21420,
		restore_gold = 80,
		destory_gold = 29,
		prev = 21421,
		id = 21422,
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
	[21423] = {
		trans_use_gold = 160,
		next = 21424,
		base = 21420,
		restore_gold = 180,
		destory_gold = 54,
		prev = 21422,
		id = 21423,
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
	[21424] = {
		trans_use_gold = 220,
		next = 21425,
		base = 21420,
		restore_gold = 340,
		destory_gold = 94,
		prev = 21423,
		id = 21424,
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
	[21425] = {
		trans_use_gold = 280,
		next = 21426,
		base = 21420,
		restore_gold = 560,
		destory_gold = 149,
		prev = 21424,
		id = 21425,
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
	[21426] = {
		trans_use_gold = 0,
		next = 0,
		base = 21420,
		restore_gold = 840,
		destory_gold = 219,
		prev = 21425,
		id = 21426,
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
	[21440] = {
		important = 1,
		destory_gold = 16,
		type = 1,
		group = 21440,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21441,
		prev = 0,
		id = 21440,
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
		restore_item = {}
	},
	[21441] = {
		trans_use_gold = 60,
		next = 21442,
		base = 21440,
		restore_gold = 20,
		destory_gold = 21,
		prev = 21440,
		id = 21441,
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
	[21442] = {
		trans_use_gold = 100,
		next = 21443,
		base = 21440,
		restore_gold = 80,
		destory_gold = 36,
		prev = 21441,
		id = 21442,
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
	[21443] = {
		trans_use_gold = 160,
		next = 21444,
		base = 21440,
		restore_gold = 180,
		destory_gold = 61,
		prev = 21442,
		id = 21443,
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
	[21444] = {
		trans_use_gold = 220,
		next = 21445,
		base = 21440,
		restore_gold = 340,
		destory_gold = 101,
		prev = 21443,
		id = 21444,
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
	[21445] = {
		trans_use_gold = 280,
		next = 21446,
		base = 21440,
		restore_gold = 560,
		destory_gold = 156,
		prev = 21444,
		id = 21445,
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
	[21446] = {
		trans_use_gold = 360,
		next = 21447,
		base = 21440,
		restore_gold = 840,
		destory_gold = 226,
		prev = 21445,
		id = 21446,
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
	[21447] = {
		trans_use_gold = 440,
		next = 21448,
		base = 21440,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 21446,
		id = 21447,
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
	[21448] = {
		trans_use_gold = 520,
		next = 21449,
		base = 21440,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 21447,
		id = 21448,
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
	[21449] = {
		trans_use_gold = 600,
		next = 21450,
		base = 21440,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 21448,
		id = 21449,
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
	[21450] = {
		trans_use_gold = 0,
		next = 0,
		base = 21440,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 21449,
		id = 21450,
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
	[21500] = {
		important = 1,
		destory_gold = 4,
		type = 1,
		group = 21500,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21501,
		prev = 0,
		id = 21500,
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
		restore_item = {}
	},
	[21501] = {
		trans_use_gold = 60,
		next = 21502,
		base = 21500,
		restore_gold = 20,
		destory_gold = 9,
		prev = 21500,
		id = 21501,
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
	[21502] = {
		trans_use_gold = 100,
		next = 21503,
		base = 21500,
		restore_gold = 80,
		destory_gold = 24,
		prev = 21501,
		id = 21502,
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
	[21503] = {
		trans_use_gold = 0,
		next = 0,
		base = 21500,
		restore_gold = 180,
		destory_gold = 49,
		prev = 21502,
		id = 21503,
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
	[21520] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 21520,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21521,
		prev = 0,
		id = 21520,
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
		restore_item = {}
	},
	[21521] = {
		trans_use_gold = 60,
		next = 21522,
		base = 21520,
		restore_gold = 20,
		destory_gold = 14,
		prev = 21520,
		id = 21521,
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
	[21522] = {
		trans_use_gold = 100,
		next = 21523,
		base = 21520,
		restore_gold = 80,
		destory_gold = 29,
		prev = 21521,
		id = 21522,
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
	[21523] = {
		trans_use_gold = 160,
		next = 21524,
		base = 21520,
		restore_gold = 180,
		destory_gold = 54,
		prev = 21522,
		id = 21523,
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
	[21524] = {
		trans_use_gold = 220,
		next = 21525,
		base = 21520,
		restore_gold = 340,
		destory_gold = 94,
		prev = 21523,
		id = 21524,
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
	[21525] = {
		trans_use_gold = 280,
		next = 21526,
		base = 21520,
		restore_gold = 560,
		destory_gold = 149,
		prev = 21524,
		id = 21525,
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
	[21526] = {
		trans_use_gold = 0,
		next = 0,
		base = 21520,
		restore_gold = 840,
		destory_gold = 219,
		prev = 21525,
		id = 21526,
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
	[21540] = {
		important = 1,
		destory_gold = 16,
		type = 1,
		group = 21540,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 21541,
		prev = 0,
		id = 21540,
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
		restore_item = {}
	},
	[21541] = {
		trans_use_gold = 60,
		next = 21542,
		base = 21540,
		restore_gold = 20,
		destory_gold = 21,
		prev = 21540,
		id = 21541,
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
	[21542] = {
		trans_use_gold = 100,
		next = 21543,
		base = 21540,
		restore_gold = 80,
		destory_gold = 36,
		prev = 21541,
		id = 21542,
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
	[21543] = {
		trans_use_gold = 160,
		next = 21544,
		base = 21540,
		restore_gold = 180,
		destory_gold = 61,
		prev = 21542,
		id = 21543,
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
	[21544] = {
		trans_use_gold = 220,
		next = 21545,
		base = 21540,
		restore_gold = 340,
		destory_gold = 101,
		prev = 21543,
		id = 21544,
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
	[21545] = {
		trans_use_gold = 280,
		next = 21546,
		base = 21540,
		restore_gold = 560,
		destory_gold = 156,
		prev = 21544,
		id = 21545,
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
	[21546] = {
		trans_use_gold = 360,
		next = 21547,
		base = 21540,
		restore_gold = 840,
		destory_gold = 226,
		prev = 21545,
		id = 21546,
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
	[21547] = {
		trans_use_gold = 440,
		next = 21548,
		base = 21540,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 21546,
		id = 21547,
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
	[21548] = {
		trans_use_gold = 520,
		next = 21549,
		base = 21540,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 21547,
		id = 21548,
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
	[21549] = {
		trans_use_gold = 600,
		next = 21550,
		base = 21540,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 21548,
		id = 21549,
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
	[21550] = {
		trans_use_gold = 0,
		next = 0,
		base = 21540,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 21549,
		id = 21550,
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
	[22000] = {
		important = 1,
		destory_gold = 1,
		type = 2,
		group = 22000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 22001,
		prev = 0,
		id = 22000,
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
		restore_item = {}
	},
	[22001] = {
		trans_use_gold = 60,
		next = 22002,
		base = 22000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 22000,
		id = 22001,
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
	[22002] = {
		trans_use_gold = 100,
		next = 22003,
		base = 22000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 22001,
		id = 22002,
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
	[22003] = {
		trans_use_gold = 0,
		next = 0,
		base = 22000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 22002,
		id = 22003,
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
	[22020] = {
		important = 1,
		destory_gold = 4,
		type = 2,
		group = 22020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 22021,
		prev = 0,
		id = 22020,
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
		restore_item = {}
	},
	[22021] = {
		trans_use_gold = 60,
		next = 22022,
		base = 22020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 22020,
		id = 22021,
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
	[22022] = {
		trans_use_gold = 100,
		next = 22023,
		base = 22020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 22021,
		id = 22022,
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
	[22023] = {
		trans_use_gold = 0,
		next = 0,
		base = 22020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 22022,
		id = 22023,
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
	[22040] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 22040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 22041,
		prev = 0,
		id = 22040,
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
		restore_item = {}
	},
	[22041] = {
		trans_use_gold = 60,
		next = 22042,
		base = 22040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 22040,
		id = 22041,
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
	[22042] = {
		trans_use_gold = 100,
		next = 22043,
		base = 22040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 22041,
		id = 22042,
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
	[22043] = {
		trans_use_gold = 160,
		next = 22044,
		base = 22040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 22042,
		id = 22043,
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
	[22044] = {
		trans_use_gold = 220,
		next = 22045,
		base = 22040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 22043,
		id = 22044,
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
	[22045] = {
		trans_use_gold = 280,
		next = 22046,
		base = 22040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 22044,
		id = 22045,
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
	[22046] = {
		trans_use_gold = 0,
		next = 0,
		base = 22040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 22045,
		id = 22046,
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
	[22100] = {
		important = 1,
		destory_gold = 4,
		type = 2,
		group = 22100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 22101,
		prev = 0,
		id = 22100,
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
		restore_item = {}
	},
	[22101] = {
		trans_use_gold = 60,
		next = 22102,
		base = 22100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 22100,
		id = 22101,
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
	[22102] = {
		trans_use_gold = 100,
		next = 22103,
		base = 22100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 22101,
		id = 22102,
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
	[22103] = {
		trans_use_gold = 0,
		next = 0,
		base = 22100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 22102,
		id = 22103,
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
	[22120] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 22120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 22121,
		prev = 0,
		id = 22120,
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
		restore_item = {}
	},
	[22121] = {
		trans_use_gold = 60,
		next = 22122,
		base = 22120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 22120,
		id = 22121,
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
	[22122] = {
		trans_use_gold = 100,
		next = 22123,
		base = 22120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 22121,
		id = 22122,
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
	[22123] = {
		trans_use_gold = 160,
		next = 22124,
		base = 22120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 22122,
		id = 22123,
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
	[22124] = {
		trans_use_gold = 220,
		next = 22125,
		base = 22120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 22123,
		id = 22124,
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
	[22125] = {
		trans_use_gold = 280,
		next = 22126,
		base = 22120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 22124,
		id = 22125,
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
	[22126] = {
		trans_use_gold = 0,
		next = 0,
		base = 22120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 22125,
		id = 22126,
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
	[22140] = {
		important = 1,
		destory_gold = 16,
		type = 2,
		group = 22140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 22141,
		prev = 0,
		id = 22140,
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
		restore_item = {}
	},
	[22141] = {
		trans_use_gold = 60,
		next = 22142,
		base = 22140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 22140,
		id = 22141,
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
	[22142] = {
		trans_use_gold = 100,
		next = 22143,
		base = 22140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 22141,
		id = 22142,
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
	[22143] = {
		trans_use_gold = 160,
		next = 22144,
		base = 22140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 22142,
		id = 22143,
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
	[22144] = {
		trans_use_gold = 220,
		next = 22145,
		base = 22140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 22143,
		id = 22144,
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
	[22145] = {
		trans_use_gold = 280,
		next = 22146,
		base = 22140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 22144,
		id = 22145,
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
	[22146] = {
		trans_use_gold = 360,
		next = 22147,
		base = 22140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 22145,
		id = 22146,
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
	[22147] = {
		trans_use_gold = 440,
		next = 22148,
		base = 22140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 22146,
		id = 22147,
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
	[22148] = {
		trans_use_gold = 520,
		next = 22149,
		base = 22140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 22147,
		id = 22148,
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
	[22149] = {
		trans_use_gold = 600,
		next = 22150,
		base = 22140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 22148,
		id = 22149,
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
	[22150] = {
		trans_use_gold = 0,
		next = 0,
		base = 22140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 22149,
		id = 22150,
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
	[22200] = {
		important = 1,
		destory_gold = 4,
		type = 2,
		group = 22200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 22201,
		prev = 0,
		id = 22200,
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
		restore_item = {}
	},
	[22201] = {
		trans_use_gold = 60,
		next = 22202,
		base = 22200,
		restore_gold = 20,
		destory_gold = 9,
		prev = 22200,
		id = 22201,
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
	[22202] = {
		trans_use_gold = 100,
		next = 22203,
		base = 22200,
		restore_gold = 80,
		destory_gold = 24,
		prev = 22201,
		id = 22202,
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
	[22203] = {
		trans_use_gold = 0,
		next = 0,
		base = 22200,
		restore_gold = 180,
		destory_gold = 49,
		prev = 22202,
		id = 22203,
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
	[22220] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 22220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 22221,
		prev = 0,
		id = 22220,
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
		restore_item = {}
	},
	[22221] = {
		trans_use_gold = 60,
		next = 22222,
		base = 22220,
		restore_gold = 20,
		destory_gold = 14,
		prev = 22220,
		id = 22221,
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
	[22222] = {
		trans_use_gold = 100,
		next = 22223,
		base = 22220,
		restore_gold = 80,
		destory_gold = 29,
		prev = 22221,
		id = 22222,
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
	[22223] = {
		trans_use_gold = 160,
		next = 22224,
		base = 22220,
		restore_gold = 180,
		destory_gold = 54,
		prev = 22222,
		id = 22223,
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
	[22224] = {
		trans_use_gold = 220,
		next = 22225,
		base = 22220,
		restore_gold = 340,
		destory_gold = 94,
		prev = 22223,
		id = 22224,
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
	[22225] = {
		trans_use_gold = 280,
		next = 22226,
		base = 22220,
		restore_gold = 560,
		destory_gold = 149,
		prev = 22224,
		id = 22225,
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
	[22226] = {
		trans_use_gold = 0,
		next = 0,
		base = 22220,
		restore_gold = 840,
		destory_gold = 219,
		prev = 22225,
		id = 22226,
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
	[22240] = {
		important = 1,
		destory_gold = 16,
		type = 2,
		group = 22240,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 22241,
		prev = 0,
		id = 22240,
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
		restore_item = {}
	},
	[22241] = {
		trans_use_gold = 60,
		next = 22242,
		base = 22240,
		restore_gold = 20,
		destory_gold = 21,
		prev = 22240,
		id = 22241,
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
	[22242] = {
		trans_use_gold = 100,
		next = 22243,
		base = 22240,
		restore_gold = 80,
		destory_gold = 36,
		prev = 22241,
		id = 22242,
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
	[22243] = {
		trans_use_gold = 160,
		next = 22244,
		base = 22240,
		restore_gold = 180,
		destory_gold = 61,
		prev = 22242,
		id = 22243,
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
	[22244] = {
		trans_use_gold = 220,
		next = 22245,
		base = 22240,
		restore_gold = 340,
		destory_gold = 101,
		prev = 22243,
		id = 22244,
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
	[22245] = {
		trans_use_gold = 280,
		next = 22246,
		base = 22240,
		restore_gold = 560,
		destory_gold = 156,
		prev = 22244,
		id = 22245,
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
	[22246] = {
		trans_use_gold = 360,
		next = 22247,
		base = 22240,
		restore_gold = 840,
		destory_gold = 226,
		prev = 22245,
		id = 22246,
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
	[22247] = {
		trans_use_gold = 440,
		next = 22248,
		base = 22240,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 22246,
		id = 22247,
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
	[22248] = {
		trans_use_gold = 520,
		next = 22249,
		base = 22240,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 22247,
		id = 22248,
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
	[22249] = {
		trans_use_gold = 600,
		next = 22250,
		base = 22240,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 22248,
		id = 22249,
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
	[22250] = {
		trans_use_gold = 0,
		next = 0,
		base = 22240,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 22249,
		id = 22250,
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
	[23000] = {
		important = 1,
		destory_gold = 4,
		type = 3,
		group = 23000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 23001,
		prev = 0,
		id = 23000,
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
		restore_item = {}
	},
	[23001] = {
		trans_use_gold = 60,
		next = 23002,
		base = 23000,
		restore_gold = 20,
		destory_gold = 9,
		prev = 23000,
		id = 23001,
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
	[23002] = {
		trans_use_gold = 100,
		next = 23003,
		base = 23000,
		restore_gold = 80,
		destory_gold = 24,
		prev = 23001,
		id = 23002,
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
	[23003] = {
		trans_use_gold = 0,
		next = 0,
		base = 23000,
		restore_gold = 180,
		destory_gold = 49,
		prev = 23002,
		id = 23003,
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
	[23020] = {
		important = 1,
		destory_gold = 9,
		type = 3,
		group = 23020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 23021,
		prev = 0,
		id = 23020,
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
		restore_item = {}
	},
	[23021] = {
		trans_use_gold = 60,
		next = 23022,
		base = 23020,
		restore_gold = 20,
		destory_gold = 14,
		prev = 23020,
		id = 23021,
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
	[23022] = {
		trans_use_gold = 100,
		next = 23023,
		base = 23020,
		restore_gold = 80,
		destory_gold = 29,
		prev = 23021,
		id = 23022,
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
	[23023] = {
		trans_use_gold = 160,
		next = 23024,
		base = 23020,
		restore_gold = 180,
		destory_gold = 54,
		prev = 23022,
		id = 23023,
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
	[23024] = {
		trans_use_gold = 220,
		next = 23025,
		base = 23020,
		restore_gold = 340,
		destory_gold = 94,
		prev = 23023,
		id = 23024,
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
	[23025] = {
		trans_use_gold = 280,
		next = 23026,
		base = 23020,
		restore_gold = 560,
		destory_gold = 149,
		prev = 23024,
		id = 23025,
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
	[23026] = {
		trans_use_gold = 0,
		next = 0,
		base = 23020,
		restore_gold = 840,
		destory_gold = 219,
		prev = 23025,
		id = 23026,
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
	[23040] = {
		important = 1,
		destory_gold = 16,
		type = 3,
		group = 23040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 23041,
		prev = 0,
		id = 23040,
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
		restore_item = {}
	},
	[23041] = {
		trans_use_gold = 60,
		next = 23042,
		base = 23040,
		restore_gold = 20,
		destory_gold = 21,
		prev = 23040,
		id = 23041,
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
	[23042] = {
		trans_use_gold = 100,
		next = 23043,
		base = 23040,
		restore_gold = 80,
		destory_gold = 36,
		prev = 23041,
		id = 23042,
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
	[23043] = {
		trans_use_gold = 160,
		next = 23044,
		base = 23040,
		restore_gold = 180,
		destory_gold = 61,
		prev = 23042,
		id = 23043,
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
	[23044] = {
		trans_use_gold = 220,
		next = 23045,
		base = 23040,
		restore_gold = 340,
		destory_gold = 101,
		prev = 23043,
		id = 23044,
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
	[23045] = {
		trans_use_gold = 280,
		next = 23046,
		base = 23040,
		restore_gold = 560,
		destory_gold = 156,
		prev = 23044,
		id = 23045,
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
	[23046] = {
		trans_use_gold = 360,
		next = 23047,
		base = 23040,
		restore_gold = 840,
		destory_gold = 226,
		prev = 23045,
		id = 23046,
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
	[23047] = {
		trans_use_gold = 440,
		next = 23048,
		base = 23040,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 23046,
		id = 23047,
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
	[23048] = {
		trans_use_gold = 520,
		next = 23049,
		base = 23040,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 23047,
		id = 23048,
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
	[23049] = {
		trans_use_gold = 600,
		next = 23050,
		base = 23040,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 23048,
		id = 23049,
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
	[23050] = {
		trans_use_gold = 0,
		next = 0,
		base = 23040,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 23049,
		id = 23050,
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
	[24000] = {
		important = 1,
		destory_gold = 9,
		type = 4,
		group = 24000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 24001,
		prev = 0,
		id = 24000,
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
		restore_item = {}
	},
	[24001] = {
		trans_use_gold = 60,
		next = 24002,
		base = 24000,
		restore_gold = 20,
		destory_gold = 14,
		prev = 24000,
		id = 24001,
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
	[24002] = {
		trans_use_gold = 100,
		next = 24003,
		base = 24000,
		restore_gold = 80,
		destory_gold = 29,
		prev = 24001,
		id = 24002,
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
	[24003] = {
		trans_use_gold = 160,
		next = 24004,
		base = 24000,
		restore_gold = 180,
		destory_gold = 54,
		prev = 24002,
		id = 24003,
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
	[24004] = {
		trans_use_gold = 220,
		next = 24005,
		base = 24000,
		restore_gold = 340,
		destory_gold = 94,
		prev = 24003,
		id = 24004,
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
	[24005] = {
		trans_use_gold = 280,
		next = 24006,
		base = 24000,
		restore_gold = 560,
		destory_gold = 149,
		prev = 24004,
		id = 24005,
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
	[24006] = {
		trans_use_gold = 0,
		next = 0,
		base = 24000,
		restore_gold = 840,
		destory_gold = 219,
		prev = 24005,
		id = 24006,
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
	[24020] = {
		important = 1,
		destory_gold = 16,
		type = 4,
		group = 24020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 24021,
		prev = 0,
		id = 24020,
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
		restore_item = {}
	},
	[24021] = {
		trans_use_gold = 60,
		next = 24022,
		base = 24020,
		restore_gold = 20,
		destory_gold = 21,
		prev = 24020,
		id = 24021,
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
	[24022] = {
		trans_use_gold = 100,
		next = 24023,
		base = 24020,
		restore_gold = 80,
		destory_gold = 36,
		prev = 24021,
		id = 24022,
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
	[24023] = {
		trans_use_gold = 160,
		next = 24024,
		base = 24020,
		restore_gold = 180,
		destory_gold = 61,
		prev = 24022,
		id = 24023,
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
	[24024] = {
		trans_use_gold = 220,
		next = 24025,
		base = 24020,
		restore_gold = 340,
		destory_gold = 101,
		prev = 24023,
		id = 24024,
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
	[24025] = {
		trans_use_gold = 280,
		next = 24026,
		base = 24020,
		restore_gold = 560,
		destory_gold = 156,
		prev = 24024,
		id = 24025,
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
	[24026] = {
		trans_use_gold = 360,
		next = 24027,
		base = 24020,
		restore_gold = 840,
		destory_gold = 226,
		prev = 24025,
		id = 24026,
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
	[24027] = {
		trans_use_gold = 440,
		next = 24028,
		base = 24020,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 24026,
		id = 24027,
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
	[24028] = {
		trans_use_gold = 520,
		next = 24029,
		base = 24020,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 24027,
		id = 24028,
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
	[24029] = {
		trans_use_gold = 600,
		next = 24030,
		base = 24020,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 24028,
		id = 24029,
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
	[24030] = {
		trans_use_gold = 0,
		next = 0,
		base = 24020,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 24029,
		id = 24030,
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
	[24040] = {
		important = 1,
		destory_gold = 25,
		type = 4,
		group = 24040,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 24041,
		prev = 0,
		id = 24040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17011,
				2
			}
		},
		destory_item = {
			{
				17013,
				1
			}
		},
		restore_item = {}
	},
	[24041] = {
		trans_use_gold = 90,
		next = 24042,
		base = 24040,
		restore_gold = 20,
		destory_gold = 33,
		prev = 24040,
		id = 24041,
		level = 2,
		trans_use_item = {
			{
				17011,
				5
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
	[24042] = {
		trans_use_gold = 150,
		next = 24043,
		base = 24040,
		restore_gold = 80,
		destory_gold = 55,
		prev = 24041,
		id = 24042,
		level = 3,
		trans_use_item = {
			{
				17011,
				8
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
	[24043] = {
		trans_use_gold = 240,
		next = 24044,
		base = 24040,
		restore_gold = 180,
		destory_gold = 93,
		prev = 24042,
		id = 24043,
		level = 4,
		trans_use_item = {
			{
				17012,
				12
			}
		},
		destory_item = {
			{
				17011,
				4
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
	[24044] = {
		trans_use_gold = 330,
		next = 24045,
		base = 24040,
		restore_gold = 340,
		destory_gold = 153,
		prev = 24043,
		id = 24044,
		level = 5,
		trans_use_item = {
			{
				17012,
				16
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
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
			},
			{
				17012,
				8
			}
		}
	},
	[24045] = {
		trans_use_gold = 420,
		next = 24046,
		base = 24040,
		restore_gold = 560,
		destory_gold = 235,
		prev = 24044,
		id = 24045,
		level = 6,
		trans_use_item = {
			{
				17012,
				21
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				7
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
	[24046] = {
		trans_use_gold = 540,
		next = 24047,
		base = 24040,
		restore_gold = 840,
		destory_gold = 340,
		prev = 24045,
		id = 24046,
		level = 7,
		trans_use_item = {
			{
				17013,
				27
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
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
	[24047] = {
		trans_use_gold = 660,
		next = 24048,
		base = 24040,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 24046,
		id = 24047,
		level = 8,
		trans_use_item = {
			{
				17013,
				33
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				7
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
	[24048] = {
		trans_use_gold = 780,
		next = 24049,
		base = 24040,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 24047,
		id = 24048,
		level = 9,
		trans_use_item = {
			{
				17013,
				39
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				15
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
	[24049] = {
		trans_use_gold = 900,
		next = 24050,
		base = 24040,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 24048,
		id = 24049,
		level = 10,
		trans_use_item = {
			{
				17013,
				45
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
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
				66
			}
		}
	},
	[24050] = {
		trans_use_gold = 0,
		next = 0,
		base = 24040,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 24049,
		id = 24050,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				36
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
	[24100] = {
		important = 1,
		destory_gold = 4,
		type = 4,
		group = 24100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 24101,
		prev = 0,
		id = 24100,
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
		restore_item = {}
	},
	[24101] = {
		trans_use_gold = 60,
		next = 24102,
		base = 24100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 24100,
		id = 24101,
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
	[24102] = {
		trans_use_gold = 100,
		next = 24103,
		base = 24100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 24101,
		id = 24102,
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
	[24103] = {
		trans_use_gold = 0,
		next = 0,
		base = 24100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 24102,
		id = 24103,
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
	[24120] = {
		important = 1,
		destory_gold = 9,
		type = 4,
		group = 24120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 24121,
		prev = 0,
		id = 24120,
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
		restore_item = {}
	},
	[24121] = {
		trans_use_gold = 60,
		next = 24122,
		base = 24120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 24120,
		id = 24121,
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
	[24122] = {
		trans_use_gold = 100,
		next = 24123,
		base = 24120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 24121,
		id = 24122,
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
	[24123] = {
		trans_use_gold = 160,
		next = 24124,
		base = 24120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 24122,
		id = 24123,
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
	[24124] = {
		trans_use_gold = 220,
		next = 24125,
		base = 24120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 24123,
		id = 24124,
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
	[24125] = {
		trans_use_gold = 280,
		next = 24126,
		base = 24120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 24124,
		id = 24125,
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
	[24126] = {
		trans_use_gold = 0,
		next = 0,
		base = 24120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 24125,
		id = 24126,
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
	[24140] = {
		important = 1,
		destory_gold = 16,
		type = 4,
		group = 24140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 24141,
		prev = 0,
		id = 24140,
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
		restore_item = {}
	},
	[24141] = {
		trans_use_gold = 60,
		next = 24142,
		base = 24140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 24140,
		id = 24141,
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
	[24142] = {
		trans_use_gold = 100,
		next = 24143,
		base = 24140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 24141,
		id = 24142,
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
	[24143] = {
		trans_use_gold = 160,
		next = 24144,
		base = 24140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 24142,
		id = 24143,
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
	[24144] = {
		trans_use_gold = 220,
		next = 24145,
		base = 24140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 24143,
		id = 24144,
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
	[24145] = {
		trans_use_gold = 280,
		next = 24146,
		base = 24140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 24144,
		id = 24145,
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
	[24146] = {
		trans_use_gold = 360,
		next = 24147,
		base = 24140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 24145,
		id = 24146,
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
	[24147] = {
		trans_use_gold = 440,
		next = 24148,
		base = 24140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 24146,
		id = 24147,
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
	[24148] = {
		trans_use_gold = 520,
		next = 24149,
		base = 24140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 24147,
		id = 24148,
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
	[24149] = {
		trans_use_gold = 600,
		next = 24150,
		base = 24140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 24148,
		id = 24149,
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
	[24150] = {
		trans_use_gold = 0,
		next = 0,
		base = 24140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 24149,
		id = 24150,
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
	[24200] = {
		important = 1,
		destory_gold = 9,
		type = 4,
		group = 24200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 24201,
		prev = 0,
		id = 24200,
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
		restore_item = {}
	},
	[24201] = {
		trans_use_gold = 60,
		next = 24202,
		base = 24200,
		restore_gold = 20,
		destory_gold = 14,
		prev = 24200,
		id = 24201,
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
	[24202] = {
		trans_use_gold = 100,
		next = 24203,
		base = 24200,
		restore_gold = 80,
		destory_gold = 29,
		prev = 24201,
		id = 24202,
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
	[24203] = {
		trans_use_gold = 160,
		next = 24204,
		base = 24200,
		restore_gold = 180,
		destory_gold = 54,
		prev = 24202,
		id = 24203,
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
	[24204] = {
		trans_use_gold = 220,
		next = 24205,
		base = 24200,
		restore_gold = 340,
		destory_gold = 94,
		prev = 24203,
		id = 24204,
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
	[24205] = {
		trans_use_gold = 280,
		next = 24206,
		base = 24200,
		restore_gold = 560,
		destory_gold = 149,
		prev = 24204,
		id = 24205,
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
	[24206] = {
		trans_use_gold = 0,
		next = 0,
		base = 24200,
		restore_gold = 840,
		destory_gold = 219,
		prev = 24205,
		id = 24206,
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
	[24220] = {
		important = 1,
		destory_gold = 16,
		type = 4,
		group = 24220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 24221,
		prev = 0,
		id = 24220,
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
		restore_item = {}
	},
	[24221] = {
		trans_use_gold = 60,
		next = 24222,
		base = 24220,
		restore_gold = 20,
		destory_gold = 21,
		prev = 24220,
		id = 24221,
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
	[24222] = {
		trans_use_gold = 100,
		next = 24223,
		base = 24220,
		restore_gold = 80,
		destory_gold = 36,
		prev = 24221,
		id = 24222,
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
	[24223] = {
		trans_use_gold = 160,
		next = 24224,
		base = 24220,
		restore_gold = 180,
		destory_gold = 61,
		prev = 24222,
		id = 24223,
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
	[24224] = {
		trans_use_gold = 220,
		next = 24225,
		base = 24220,
		restore_gold = 340,
		destory_gold = 101,
		prev = 24223,
		id = 24224,
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
	[24225] = {
		trans_use_gold = 280,
		next = 24226,
		base = 24220,
		restore_gold = 560,
		destory_gold = 156,
		prev = 24224,
		id = 24225,
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
	[24226] = {
		trans_use_gold = 360,
		next = 24227,
		base = 24220,
		restore_gold = 840,
		destory_gold = 226,
		prev = 24225,
		id = 24226,
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
	[24227] = {
		trans_use_gold = 440,
		next = 24228,
		base = 24220,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 24226,
		id = 24227,
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
	[24228] = {
		trans_use_gold = 520,
		next = 24229,
		base = 24220,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 24227,
		id = 24228,
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
	[24229] = {
		trans_use_gold = 600,
		next = 24230,
		base = 24220,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 24228,
		id = 24229,
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
	[24230] = {
		trans_use_gold = 0,
		next = 0,
		base = 24220,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 24229,
		id = 24230,
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
	[24240] = {
		important = 1,
		destory_gold = 25,
		type = 4,
		group = 24240,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 24241,
		prev = 0,
		id = 24240,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17011,
				2
			}
		},
		destory_item = {
			{
				17013,
				1
			}
		},
		restore_item = {}
	},
	[24241] = {
		trans_use_gold = 90,
		next = 24242,
		base = 24240,
		restore_gold = 20,
		destory_gold = 33,
		prev = 24240,
		id = 24241,
		level = 2,
		trans_use_item = {
			{
				17011,
				5
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
	[24242] = {
		trans_use_gold = 150,
		next = 24243,
		base = 24240,
		restore_gold = 80,
		destory_gold = 55,
		prev = 24241,
		id = 24242,
		level = 3,
		trans_use_item = {
			{
				17011,
				8
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
	[24243] = {
		trans_use_gold = 240,
		next = 24244,
		base = 24240,
		restore_gold = 180,
		destory_gold = 93,
		prev = 24242,
		id = 24243,
		level = 4,
		trans_use_item = {
			{
				17012,
				12
			}
		},
		destory_item = {
			{
				17011,
				4
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
	[24244] = {
		trans_use_gold = 330,
		next = 24245,
		base = 24240,
		restore_gold = 340,
		destory_gold = 153,
		prev = 24243,
		id = 24244,
		level = 5,
		trans_use_item = {
			{
				17012,
				16
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
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
			},
			{
				17012,
				8
			}
		}
	},
	[24245] = {
		trans_use_gold = 420,
		next = 24246,
		base = 24240,
		restore_gold = 560,
		destory_gold = 235,
		prev = 24244,
		id = 24245,
		level = 6,
		trans_use_item = {
			{
				17012,
				21
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				7
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
	[24246] = {
		trans_use_gold = 540,
		next = 24247,
		base = 24240,
		restore_gold = 840,
		destory_gold = 340,
		prev = 24245,
		id = 24246,
		level = 7,
		trans_use_item = {
			{
				17013,
				27
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
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
	[24247] = {
		trans_use_gold = 660,
		next = 24248,
		base = 24240,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 24246,
		id = 24247,
		level = 8,
		trans_use_item = {
			{
				17013,
				33
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				7
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
	[24248] = {
		trans_use_gold = 780,
		next = 24249,
		base = 24240,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 24247,
		id = 24248,
		level = 9,
		trans_use_item = {
			{
				17013,
				39
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				15
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
	[24249] = {
		trans_use_gold = 900,
		next = 24250,
		base = 24240,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 24248,
		id = 24249,
		level = 10,
		trans_use_item = {
			{
				17013,
				45
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
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
				66
			}
		}
	},
	[24250] = {
		trans_use_gold = 0,
		next = 0,
		base = 24240,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 24249,
		id = 24250,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				36
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
	[26000] = {
		important = 1,
		destory_gold = 1,
		type = 6,
		group = 26000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26001,
		prev = 0,
		id = 26000,
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
		restore_item = {}
	},
	[26001] = {
		trans_use_gold = 60,
		next = 26002,
		base = 26000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 26000,
		id = 26001,
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
	[26002] = {
		trans_use_gold = 100,
		next = 26003,
		base = 26000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 26001,
		id = 26002,
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
	[26003] = {
		trans_use_gold = 0,
		next = 0,
		base = 26000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 26002,
		id = 26003,
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
	[26020] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 26020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26021,
		prev = 0,
		id = 26020,
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
		restore_item = {}
	},
	[26021] = {
		trans_use_gold = 60,
		next = 26022,
		base = 26020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 26020,
		id = 26021,
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
	[26022] = {
		trans_use_gold = 100,
		next = 26023,
		base = 26020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 26021,
		id = 26022,
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
	[26023] = {
		trans_use_gold = 0,
		next = 0,
		base = 26020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 26022,
		id = 26023,
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
	[26040] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 26040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26041,
		prev = 0,
		id = 26040,
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
		restore_item = {}
	},
	[26041] = {
		trans_use_gold = 60,
		next = 26042,
		base = 26040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 26040,
		id = 26041,
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
	[26042] = {
		trans_use_gold = 100,
		next = 26043,
		base = 26040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 26041,
		id = 26042,
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
	[26043] = {
		trans_use_gold = 160,
		next = 26044,
		base = 26040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 26042,
		id = 26043,
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
	[26044] = {
		trans_use_gold = 220,
		next = 26045,
		base = 26040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 26043,
		id = 26044,
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
	[26045] = {
		trans_use_gold = 280,
		next = 26046,
		base = 26040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 26044,
		id = 26045,
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
	[26046] = {
		trans_use_gold = 0,
		next = 0,
		base = 26040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 26045,
		id = 26046,
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
	[26100] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 26100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26101,
		prev = 0,
		id = 26100,
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
		restore_item = {}
	},
	[26101] = {
		trans_use_gold = 60,
		next = 26102,
		base = 26100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 26100,
		id = 26101,
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
	[26102] = {
		trans_use_gold = 100,
		next = 26103,
		base = 26100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 26101,
		id = 26102,
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
	[26103] = {
		trans_use_gold = 0,
		next = 0,
		base = 26100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 26102,
		id = 26103,
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
	[26120] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 26120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26121,
		prev = 0,
		id = 26120,
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
		restore_item = {}
	},
	[26121] = {
		trans_use_gold = 60,
		next = 26122,
		base = 26120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 26120,
		id = 26121,
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
	[26122] = {
		trans_use_gold = 100,
		next = 26123,
		base = 26120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 26121,
		id = 26122,
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
	[26123] = {
		trans_use_gold = 160,
		next = 26124,
		base = 26120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 26122,
		id = 26123,
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
	[26124] = {
		trans_use_gold = 220,
		next = 26125,
		base = 26120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 26123,
		id = 26124,
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
	[26125] = {
		trans_use_gold = 280,
		next = 26126,
		base = 26120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 26124,
		id = 26125,
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
	[26126] = {
		trans_use_gold = 0,
		next = 0,
		base = 26120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 26125,
		id = 26126,
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
	[26140] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 26140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26141,
		prev = 0,
		id = 26140,
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
		restore_item = {}
	},
	[26141] = {
		trans_use_gold = 60,
		next = 26142,
		base = 26140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 26140,
		id = 26141,
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
	[26142] = {
		trans_use_gold = 100,
		next = 26143,
		base = 26140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 26141,
		id = 26142,
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
	[26143] = {
		trans_use_gold = 160,
		next = 26144,
		base = 26140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 26142,
		id = 26143,
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
	[26144] = {
		trans_use_gold = 220,
		next = 26145,
		base = 26140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 26143,
		id = 26144,
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
	[26145] = {
		trans_use_gold = 280,
		next = 26146,
		base = 26140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 26144,
		id = 26145,
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
	[26146] = {
		trans_use_gold = 360,
		next = 26147,
		base = 26140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 26145,
		id = 26146,
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
	[26147] = {
		trans_use_gold = 440,
		next = 26148,
		base = 26140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 26146,
		id = 26147,
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
	[26148] = {
		trans_use_gold = 520,
		next = 26149,
		base = 26140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 26147,
		id = 26148,
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
	[26149] = {
		trans_use_gold = 600,
		next = 26150,
		base = 26140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 26148,
		id = 26149,
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
	[26150] = {
		trans_use_gold = 0,
		next = 0,
		base = 26140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 26149,
		id = 26150,
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
	[26200] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 26200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26201,
		prev = 0,
		id = 26200,
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
		restore_item = {}
	},
	[26201] = {
		trans_use_gold = 60,
		next = 26202,
		base = 26200,
		restore_gold = 20,
		destory_gold = 14,
		prev = 26200,
		id = 26201,
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
	[26202] = {
		trans_use_gold = 100,
		next = 26203,
		base = 26200,
		restore_gold = 80,
		destory_gold = 29,
		prev = 26201,
		id = 26202,
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
	[26203] = {
		trans_use_gold = 160,
		next = 26204,
		base = 26200,
		restore_gold = 180,
		destory_gold = 54,
		prev = 26202,
		id = 26203,
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
	[26204] = {
		trans_use_gold = 220,
		next = 26205,
		base = 26200,
		restore_gold = 340,
		destory_gold = 94,
		prev = 26203,
		id = 26204,
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
	[26205] = {
		trans_use_gold = 280,
		next = 26206,
		base = 26200,
		restore_gold = 560,
		destory_gold = 149,
		prev = 26204,
		id = 26205,
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
	[26206] = {
		trans_use_gold = 0,
		next = 0,
		base = 26200,
		restore_gold = 840,
		destory_gold = 219,
		prev = 26205,
		id = 26206,
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
	[26220] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 26220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26221,
		prev = 0,
		id = 26220,
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
		restore_item = {}
	},
	[26221] = {
		trans_use_gold = 60,
		next = 26222,
		base = 26220,
		restore_gold = 20,
		destory_gold = 21,
		prev = 26220,
		id = 26221,
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
	[26222] = {
		trans_use_gold = 100,
		next = 26223,
		base = 26220,
		restore_gold = 80,
		destory_gold = 36,
		prev = 26221,
		id = 26222,
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
	[26223] = {
		trans_use_gold = 160,
		next = 26224,
		base = 26220,
		restore_gold = 180,
		destory_gold = 61,
		prev = 26222,
		id = 26223,
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
	[26224] = {
		trans_use_gold = 220,
		next = 26225,
		base = 26220,
		restore_gold = 340,
		destory_gold = 101,
		prev = 26223,
		id = 26224,
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
	[26225] = {
		trans_use_gold = 280,
		next = 26226,
		base = 26220,
		restore_gold = 560,
		destory_gold = 156,
		prev = 26224,
		id = 26225,
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
	[26226] = {
		trans_use_gold = 360,
		next = 26227,
		base = 26220,
		restore_gold = 840,
		destory_gold = 226,
		prev = 26225,
		id = 26226,
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
	[26227] = {
		trans_use_gold = 440,
		next = 26228,
		base = 26220,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 26226,
		id = 26227,
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
	[26228] = {
		trans_use_gold = 520,
		next = 26229,
		base = 26220,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 26227,
		id = 26228,
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
	[26229] = {
		trans_use_gold = 600,
		next = 26230,
		base = 26220,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 26228,
		id = 26229,
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
	[26230] = {
		trans_use_gold = 0,
		next = 0,
		base = 26220,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 26229,
		id = 26230,
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
	[26240] = {
		important = 1,
		destory_gold = 25,
		type = 6,
		group = 26240,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 26241,
		prev = 0,
		id = 26240,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17031,
				2
			}
		},
		destory_item = {
			{
				17033,
				1
			}
		},
		restore_item = {}
	},
	[26241] = {
		trans_use_gold = 90,
		next = 26242,
		base = 26240,
		restore_gold = 20,
		destory_gold = 33,
		prev = 26240,
		id = 26241,
		level = 2,
		trans_use_item = {
			{
				17031,
				5
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
	[26242] = {
		trans_use_gold = 150,
		next = 26243,
		base = 26240,
		restore_gold = 80,
		destory_gold = 55,
		prev = 26241,
		id = 26242,
		level = 3,
		trans_use_item = {
			{
				17031,
				8
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
	[26243] = {
		trans_use_gold = 240,
		next = 26244,
		base = 26240,
		restore_gold = 180,
		destory_gold = 93,
		prev = 26242,
		id = 26243,
		level = 4,
		trans_use_item = {
			{
				17032,
				12
			}
		},
		destory_item = {
			{
				17031,
				4
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
	[26244] = {
		trans_use_gold = 330,
		next = 26245,
		base = 26240,
		restore_gold = 340,
		destory_gold = 153,
		prev = 26243,
		id = 26244,
		level = 5,
		trans_use_item = {
			{
				17032,
				16
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
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
			},
			{
				17032,
				8
			}
		}
	},
	[26245] = {
		trans_use_gold = 420,
		next = 26246,
		base = 26240,
		restore_gold = 560,
		destory_gold = 235,
		prev = 26244,
		id = 26245,
		level = 6,
		trans_use_item = {
			{
				17032,
				21
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				7
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
	[26246] = {
		trans_use_gold = 540,
		next = 26247,
		base = 26240,
		restore_gold = 840,
		destory_gold = 340,
		prev = 26245,
		id = 26246,
		level = 7,
		trans_use_item = {
			{
				17033,
				27
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
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
	[26247] = {
		trans_use_gold = 660,
		next = 26248,
		base = 26240,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 26246,
		id = 26247,
		level = 8,
		trans_use_item = {
			{
				17033,
				33
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
			},
			{
				17033,
				7
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
	[26248] = {
		trans_use_gold = 780,
		next = 26249,
		base = 26240,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 26247,
		id = 26248,
		level = 9,
		trans_use_item = {
			{
				17033,
				39
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
			},
			{
				17033,
				15
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
	[26249] = {
		trans_use_gold = 900,
		next = 26250,
		base = 26240,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 26248,
		id = 26249,
		level = 10,
		trans_use_item = {
			{
				17033,
				45
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
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
				66
			}
		}
	},
	[26250] = {
		trans_use_gold = 0,
		next = 0,
		base = 26240,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 26249,
		id = 26250,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
			},
			{
				17033,
				36
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
	[26300] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 26300,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26301,
		prev = 0,
		id = 26300,
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
		restore_item = {}
	},
	[26301] = {
		trans_use_gold = 60,
		next = 26302,
		base = 26300,
		restore_gold = 20,
		destory_gold = 9,
		prev = 26300,
		id = 26301,
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
	[26302] = {
		trans_use_gold = 100,
		next = 26303,
		base = 26300,
		restore_gold = 80,
		destory_gold = 24,
		prev = 26301,
		id = 26302,
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
	[26303] = {
		trans_use_gold = 0,
		next = 0,
		base = 26300,
		restore_gold = 180,
		destory_gold = 49,
		prev = 26302,
		id = 26303,
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
	[26320] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 26320,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26321,
		prev = 0,
		id = 26320,
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
		restore_item = {}
	},
	[26321] = {
		trans_use_gold = 60,
		next = 26322,
		base = 26320,
		restore_gold = 20,
		destory_gold = 14,
		prev = 26320,
		id = 26321,
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
	[26322] = {
		trans_use_gold = 100,
		next = 26323,
		base = 26320,
		restore_gold = 80,
		destory_gold = 29,
		prev = 26321,
		id = 26322,
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
	[26323] = {
		trans_use_gold = 160,
		next = 26324,
		base = 26320,
		restore_gold = 180,
		destory_gold = 54,
		prev = 26322,
		id = 26323,
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
	[26324] = {
		trans_use_gold = 220,
		next = 26325,
		base = 26320,
		restore_gold = 340,
		destory_gold = 94,
		prev = 26323,
		id = 26324,
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
	[26325] = {
		trans_use_gold = 280,
		next = 26326,
		base = 26320,
		restore_gold = 560,
		destory_gold = 149,
		prev = 26324,
		id = 26325,
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
	[26326] = {
		trans_use_gold = 0,
		next = 0,
		base = 26320,
		restore_gold = 840,
		destory_gold = 219,
		prev = 26325,
		id = 26326,
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
	[26340] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 26340,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26341,
		prev = 0,
		id = 26340,
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
		restore_item = {}
	},
	[26341] = {
		trans_use_gold = 60,
		next = 26342,
		base = 26340,
		restore_gold = 20,
		destory_gold = 21,
		prev = 26340,
		id = 26341,
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
	[26342] = {
		trans_use_gold = 100,
		next = 26343,
		base = 26340,
		restore_gold = 80,
		destory_gold = 36,
		prev = 26341,
		id = 26342,
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
	[26343] = {
		trans_use_gold = 160,
		next = 26344,
		base = 26340,
		restore_gold = 180,
		destory_gold = 61,
		prev = 26342,
		id = 26343,
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
	[26344] = {
		trans_use_gold = 220,
		next = 26345,
		base = 26340,
		restore_gold = 340,
		destory_gold = 101,
		prev = 26343,
		id = 26344,
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
	[26345] = {
		trans_use_gold = 280,
		next = 26346,
		base = 26340,
		restore_gold = 560,
		destory_gold = 156,
		prev = 26344,
		id = 26345,
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
	[26346] = {
		trans_use_gold = 360,
		next = 26347,
		base = 26340,
		restore_gold = 840,
		destory_gold = 226,
		prev = 26345,
		id = 26346,
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
	[26347] = {
		trans_use_gold = 440,
		next = 26348,
		base = 26340,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 26346,
		id = 26347,
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
	[26348] = {
		trans_use_gold = 520,
		next = 26349,
		base = 26340,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 26347,
		id = 26348,
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
	[26349] = {
		trans_use_gold = 600,
		next = 26350,
		base = 26340,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 26348,
		id = 26349,
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
	[26350] = {
		trans_use_gold = 0,
		next = 0,
		base = 26340,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 26349,
		id = 26350,
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
	[26400] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 26400,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26401,
		prev = 0,
		id = 26400,
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
		restore_item = {}
	},
	[26401] = {
		trans_use_gold = 60,
		next = 26402,
		base = 26400,
		restore_gold = 20,
		destory_gold = 9,
		prev = 26400,
		id = 26401,
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
	[26402] = {
		trans_use_gold = 100,
		next = 26403,
		base = 26400,
		restore_gold = 80,
		destory_gold = 24,
		prev = 26401,
		id = 26402,
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
	[26403] = {
		trans_use_gold = 0,
		next = 0,
		base = 26400,
		restore_gold = 180,
		destory_gold = 49,
		prev = 26402,
		id = 26403,
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
	[26420] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 26420,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26421,
		prev = 0,
		id = 26420,
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
		restore_item = {}
	},
	[26421] = {
		trans_use_gold = 60,
		next = 26422,
		base = 26420,
		restore_gold = 20,
		destory_gold = 14,
		prev = 26420,
		id = 26421,
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
	[26422] = {
		trans_use_gold = 100,
		next = 26423,
		base = 26420,
		restore_gold = 80,
		destory_gold = 29,
		prev = 26421,
		id = 26422,
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
	[26423] = {
		trans_use_gold = 160,
		next = 26424,
		base = 26420,
		restore_gold = 180,
		destory_gold = 54,
		prev = 26422,
		id = 26423,
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
	[26424] = {
		trans_use_gold = 220,
		next = 26425,
		base = 26420,
		restore_gold = 340,
		destory_gold = 94,
		prev = 26423,
		id = 26424,
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
	[26425] = {
		trans_use_gold = 280,
		next = 26426,
		base = 26420,
		restore_gold = 560,
		destory_gold = 149,
		prev = 26424,
		id = 26425,
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
	[26426] = {
		trans_use_gold = 0,
		next = 0,
		base = 26420,
		restore_gold = 840,
		destory_gold = 219,
		prev = 26425,
		id = 26426,
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
	[26440] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 26440,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26441,
		prev = 0,
		id = 26440,
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
		restore_item = {}
	},
	[26441] = {
		trans_use_gold = 60,
		next = 26442,
		base = 26440,
		restore_gold = 20,
		destory_gold = 21,
		prev = 26440,
		id = 26441,
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
	[26442] = {
		trans_use_gold = 100,
		next = 26443,
		base = 26440,
		restore_gold = 80,
		destory_gold = 36,
		prev = 26441,
		id = 26442,
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
	[26443] = {
		trans_use_gold = 160,
		next = 26444,
		base = 26440,
		restore_gold = 180,
		destory_gold = 61,
		prev = 26442,
		id = 26443,
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
	[26444] = {
		trans_use_gold = 220,
		next = 26445,
		base = 26440,
		restore_gold = 340,
		destory_gold = 101,
		prev = 26443,
		id = 26444,
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
	[26445] = {
		trans_use_gold = 280,
		next = 26446,
		base = 26440,
		restore_gold = 560,
		destory_gold = 156,
		prev = 26444,
		id = 26445,
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
	[26446] = {
		trans_use_gold = 360,
		next = 26447,
		base = 26440,
		restore_gold = 840,
		destory_gold = 226,
		prev = 26445,
		id = 26446,
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
	[26447] = {
		trans_use_gold = 440,
		next = 26448,
		base = 26440,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 26446,
		id = 26447,
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
	[26448] = {
		trans_use_gold = 520,
		next = 26449,
		base = 26440,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 26447,
		id = 26448,
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
	[26449] = {
		trans_use_gold = 600,
		next = 26450,
		base = 26440,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 26448,
		id = 26449,
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
	[26450] = {
		trans_use_gold = 0,
		next = 0,
		base = 26440,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 26449,
		id = 26450,
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
	[26500] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 26500,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26501,
		prev = 0,
		id = 26500,
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
		restore_item = {}
	},
	[26501] = {
		trans_use_gold = 60,
		next = 26502,
		base = 26500,
		restore_gold = 20,
		destory_gold = 14,
		prev = 26500,
		id = 26501,
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
	[26502] = {
		trans_use_gold = 100,
		next = 26503,
		base = 26500,
		restore_gold = 80,
		destory_gold = 29,
		prev = 26501,
		id = 26502,
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
	[26503] = {
		trans_use_gold = 160,
		next = 26504,
		base = 26500,
		restore_gold = 180,
		destory_gold = 54,
		prev = 26502,
		id = 26503,
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
	[26504] = {
		trans_use_gold = 220,
		next = 26505,
		base = 26500,
		restore_gold = 340,
		destory_gold = 94,
		prev = 26503,
		id = 26504,
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
	[26505] = {
		trans_use_gold = 280,
		next = 26506,
		base = 26500,
		restore_gold = 560,
		destory_gold = 149,
		prev = 26504,
		id = 26505,
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
	[26506] = {
		trans_use_gold = 0,
		next = 0,
		base = 26500,
		restore_gold = 840,
		destory_gold = 219,
		prev = 26505,
		id = 26506,
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
	[26520] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 26520,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 26521,
		prev = 0,
		id = 26520,
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
		restore_item = {}
	},
	[26521] = {
		trans_use_gold = 60,
		next = 26522,
		base = 26520,
		restore_gold = 20,
		destory_gold = 21,
		prev = 26520,
		id = 26521,
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
	[26522] = {
		trans_use_gold = 100,
		next = 26523,
		base = 26520,
		restore_gold = 80,
		destory_gold = 36,
		prev = 26521,
		id = 26522,
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
	[26523] = {
		trans_use_gold = 160,
		next = 26524,
		base = 26520,
		restore_gold = 180,
		destory_gold = 61,
		prev = 26522,
		id = 26523,
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
	[26524] = {
		trans_use_gold = 220,
		next = 26525,
		base = 26520,
		restore_gold = 340,
		destory_gold = 101,
		prev = 26523,
		id = 26524,
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
	[26525] = {
		trans_use_gold = 280,
		next = 26526,
		base = 26520,
		restore_gold = 560,
		destory_gold = 156,
		prev = 26524,
		id = 26525,
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
	[26526] = {
		trans_use_gold = 360,
		next = 26527,
		base = 26520,
		restore_gold = 840,
		destory_gold = 226,
		prev = 26525,
		id = 26526,
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
	[26527] = {
		trans_use_gold = 440,
		next = 26528,
		base = 26520,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 26526,
		id = 26527,
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
	[26528] = {
		trans_use_gold = 520,
		next = 26529,
		base = 26520,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 26527,
		id = 26528,
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
	[26529] = {
		trans_use_gold = 600,
		next = 26530,
		base = 26520,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 26528,
		id = 26529,
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
	[26530] = {
		trans_use_gold = 0,
		next = 0,
		base = 26520,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 26529,
		id = 26530,
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
	[26540] = {
		important = 1,
		destory_gold = 25,
		type = 6,
		group = 26540,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 26541,
		prev = 0,
		id = 26540,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17031,
				2
			}
		},
		destory_item = {
			{
				17033,
				1
			}
		},
		restore_item = {}
	},
	[26541] = {
		trans_use_gold = 90,
		next = 26542,
		base = 26540,
		restore_gold = 20,
		destory_gold = 33,
		prev = 26540,
		id = 26541,
		level = 2,
		trans_use_item = {
			{
				17031,
				5
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
	[26542] = {
		trans_use_gold = 150,
		next = 26543,
		base = 26540,
		restore_gold = 80,
		destory_gold = 55,
		prev = 26541,
		id = 26542,
		level = 3,
		trans_use_item = {
			{
				17031,
				8
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
	[26543] = {
		trans_use_gold = 240,
		next = 26544,
		base = 26540,
		restore_gold = 180,
		destory_gold = 93,
		prev = 26542,
		id = 26543,
		level = 4,
		trans_use_item = {
			{
				17032,
				12
			}
		},
		destory_item = {
			{
				17031,
				4
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
	[26544] = {
		trans_use_gold = 330,
		next = 26545,
		base = 26540,
		restore_gold = 340,
		destory_gold = 153,
		prev = 26543,
		id = 26544,
		level = 5,
		trans_use_item = {
			{
				17032,
				16
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
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
			},
			{
				17032,
				8
			}
		}
	},
	[26545] = {
		trans_use_gold = 420,
		next = 26546,
		base = 26540,
		restore_gold = 560,
		destory_gold = 235,
		prev = 26544,
		id = 26545,
		level = 6,
		trans_use_item = {
			{
				17032,
				21
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				7
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
	[26546] = {
		trans_use_gold = 540,
		next = 26547,
		base = 26540,
		restore_gold = 840,
		destory_gold = 340,
		prev = 26545,
		id = 26546,
		level = 7,
		trans_use_item = {
			{
				17033,
				27
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
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
	[26547] = {
		trans_use_gold = 660,
		next = 26548,
		base = 26540,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 26546,
		id = 26547,
		level = 8,
		trans_use_item = {
			{
				17033,
				33
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
			},
			{
				17033,
				7
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
	[26548] = {
		trans_use_gold = 780,
		next = 26549,
		base = 26540,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 26547,
		id = 26548,
		level = 9,
		trans_use_item = {
			{
				17033,
				39
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
			},
			{
				17033,
				15
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
	[26549] = {
		trans_use_gold = 900,
		next = 26550,
		base = 26540,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 26548,
		id = 26549,
		level = 10,
		trans_use_item = {
			{
				17033,
				45
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
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
				66
			}
		}
	},
	[26550] = {
		trans_use_gold = 0,
		next = 0,
		base = 26540,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 26549,
		id = 26550,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
			},
			{
				17033,
				36
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
	[27000] = {
		important = 1,
		destory_gold = 4,
		type = 7,
		group = 27000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 27001,
		prev = 0,
		id = 27000,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[27001] = {
		trans_use_gold = 60,
		next = 27002,
		base = 27000,
		restore_gold = 20,
		destory_gold = 9,
		prev = 27000,
		id = 27001,
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
	[27002] = {
		trans_use_gold = 100,
		next = 27003,
		base = 27000,
		restore_gold = 80,
		destory_gold = 24,
		prev = 27001,
		id = 27002,
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
	[27003] = {
		trans_use_gold = 0,
		next = 0,
		base = 27000,
		restore_gold = 180,
		destory_gold = 49,
		prev = 27002,
		id = 27003,
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
	[27020] = {
		important = 1,
		destory_gold = 9,
		type = 7,
		group = 27020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 27021,
		prev = 0,
		id = 27020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
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
		trans_use_gold = 20,
		restore_gold = 0,
		next = 27041,
		prev = 0,
		id = 27040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
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
	},
	[27048] = {
		trans_use_gold = 520,
		next = 27049,
		base = 27040,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 27047,
		id = 27048,
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
	[27049] = {
		trans_use_gold = 600,
		next = 27050,
		base = 27040,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 27048,
		id = 27049,
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
	[27050] = {
		trans_use_gold = 0,
		next = 0,
		base = 27040,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 27049,
		id = 27050,
		level = 11,
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
	[27100] = {
		important = 1,
		destory_gold = 9,
		type = 7,
		group = 27100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 27101,
		prev = 0,
		id = 27100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[27101] = {
		trans_use_gold = 60,
		next = 27102,
		base = 27100,
		restore_gold = 20,
		destory_gold = 14,
		prev = 27100,
		id = 27101,
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
	[27102] = {
		trans_use_gold = 100,
		next = 27103,
		base = 27100,
		restore_gold = 80,
		destory_gold = 29,
		prev = 27101,
		id = 27102,
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
	[27103] = {
		trans_use_gold = 160,
		next = 27104,
		base = 27100,
		restore_gold = 180,
		destory_gold = 54,
		prev = 27102,
		id = 27103,
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
	[27104] = {
		trans_use_gold = 220,
		next = 27105,
		base = 27100,
		restore_gold = 340,
		destory_gold = 94,
		prev = 27103,
		id = 27104,
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
	[27105] = {
		trans_use_gold = 280,
		next = 27106,
		base = 27100,
		restore_gold = 560,
		destory_gold = 149,
		prev = 27104,
		id = 27105,
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
	[27106] = {
		trans_use_gold = 0,
		next = 0,
		base = 27100,
		restore_gold = 840,
		destory_gold = 219,
		prev = 27105,
		id = 27106,
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
	[27120] = {
		important = 1,
		destory_gold = 16,
		type = 7,
		group = 27120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 27121,
		prev = 0,
		id = 27120,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[27121] = {
		trans_use_gold = 60,
		next = 27122,
		base = 27120,
		restore_gold = 20,
		destory_gold = 21,
		prev = 27120,
		id = 27121,
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
	[27122] = {
		trans_use_gold = 100,
		next = 27123,
		base = 27120,
		restore_gold = 80,
		destory_gold = 36,
		prev = 27121,
		id = 27122,
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
	[27123] = {
		trans_use_gold = 160,
		next = 27124,
		base = 27120,
		restore_gold = 180,
		destory_gold = 61,
		prev = 27122,
		id = 27123,
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
	[27124] = {
		trans_use_gold = 220,
		next = 27125,
		base = 27120,
		restore_gold = 340,
		destory_gold = 101,
		prev = 27123,
		id = 27124,
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
	[27125] = {
		trans_use_gold = 280,
		next = 27126,
		base = 27120,
		restore_gold = 560,
		destory_gold = 156,
		prev = 27124,
		id = 27125,
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
	[27126] = {
		trans_use_gold = 360,
		next = 27127,
		base = 27120,
		restore_gold = 840,
		destory_gold = 226,
		prev = 27125,
		id = 27126,
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
	[27127] = {
		trans_use_gold = 440,
		next = 27128,
		base = 27120,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 27126,
		id = 27127,
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
	[27128] = {
		trans_use_gold = 520,
		next = 27129,
		base = 27120,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 27127,
		id = 27128,
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
	[27129] = {
		trans_use_gold = 600,
		next = 27130,
		base = 27120,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 27128,
		id = 27129,
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
	[27130] = {
		trans_use_gold = 0,
		next = 0,
		base = 27120,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 27129,
		id = 27130,
		level = 11,
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
	[27140] = {
		important = 1,
		destory_gold = 25,
		type = 7,
		group = 27140,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 27141,
		prev = 0,
		id = 27140,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				2
			}
		},
		destory_item = {
			{
				17043,
				1
			}
		},
		restore_item = {}
	},
	[27141] = {
		trans_use_gold = 90,
		next = 27142,
		base = 27140,
		restore_gold = 20,
		destory_gold = 33,
		prev = 27140,
		id = 27141,
		level = 2,
		trans_use_item = {
			{
				17041,
				5
			}
		},
		destory_item = {
			{
				17041,
				1
			},
			{
				17043,
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
	[27142] = {
		trans_use_gold = 150,
		next = 27143,
		base = 27140,
		restore_gold = 80,
		destory_gold = 55,
		prev = 27141,
		id = 27142,
		level = 3,
		trans_use_item = {
			{
				17041,
				8
			}
		},
		destory_item = {
			{
				17041,
				2
			},
			{
				17043,
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
	[27143] = {
		trans_use_gold = 240,
		next = 27144,
		base = 27140,
		restore_gold = 180,
		destory_gold = 93,
		prev = 27142,
		id = 27143,
		level = 4,
		trans_use_item = {
			{
				17042,
				12
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17043,
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
	[27144] = {
		trans_use_gold = 330,
		next = 27145,
		base = 27140,
		restore_gold = 340,
		destory_gold = 153,
		prev = 27143,
		id = 27144,
		level = 5,
		trans_use_item = {
			{
				17042,
				16
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				3
			},
			{
				17043,
				1
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
	[27145] = {
		trans_use_gold = 420,
		next = 27146,
		base = 27140,
		restore_gold = 560,
		destory_gold = 235,
		prev = 27144,
		id = 27145,
		level = 6,
		trans_use_item = {
			{
				17042,
				21
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				7
			},
			{
				17043,
				1
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
	[27146] = {
		trans_use_gold = 540,
		next = 27147,
		base = 27140,
		restore_gold = 840,
		destory_gold = 340,
		prev = 27145,
		id = 27146,
		level = 7,
		trans_use_item = {
			{
				17043,
				27
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				1
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
	[27147] = {
		trans_use_gold = 660,
		next = 27148,
		base = 27140,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 27146,
		id = 27147,
		level = 8,
		trans_use_item = {
			{
				17043,
				33
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				7
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
	[27148] = {
		trans_use_gold = 780,
		next = 27149,
		base = 27140,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 27147,
		id = 27148,
		level = 9,
		trans_use_item = {
			{
				17043,
				39
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				15
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
	[27149] = {
		trans_use_gold = 900,
		next = 27150,
		base = 27140,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 27148,
		id = 27149,
		level = 10,
		trans_use_item = {
			{
				17043,
				45
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				25
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
	[27150] = {
		trans_use_gold = 0,
		next = 0,
		base = 27140,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 27149,
		id = 27150,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				36
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
	[28000] = {
		important = 1,
		destory_gold = 4,
		type = 8,
		group = 28000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 28001,
		prev = 0,
		id = 28000,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[28001] = {
		trans_use_gold = 60,
		next = 28002,
		base = 28000,
		restore_gold = 20,
		destory_gold = 9,
		prev = 28000,
		id = 28001,
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
	[28002] = {
		trans_use_gold = 100,
		next = 28003,
		base = 28000,
		restore_gold = 80,
		destory_gold = 24,
		prev = 28001,
		id = 28002,
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
	[28003] = {
		trans_use_gold = 0,
		next = 0,
		base = 28000,
		restore_gold = 180,
		destory_gold = 49,
		prev = 28002,
		id = 28003,
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
	[28020] = {
		important = 1,
		destory_gold = 9,
		type = 8,
		group = 28020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 28021,
		prev = 0,
		id = 28020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
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
		trans_use_gold = 20,
		restore_gold = 0,
		next = 28041,
		prev = 0,
		id = 28040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
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
	},
	[28048] = {
		trans_use_gold = 520,
		next = 28049,
		base = 28040,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 28047,
		id = 28048,
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
	[28049] = {
		trans_use_gold = 600,
		next = 28050,
		base = 28040,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 28048,
		id = 28049,
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
	[28050] = {
		trans_use_gold = 0,
		next = 0,
		base = 28040,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 28049,
		id = 28050,
		level = 11,
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
	[28100] = {
		important = 1,
		destory_gold = 9,
		type = 8,
		group = 28100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 28101,
		prev = 0,
		id = 28100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[28101] = {
		trans_use_gold = 60,
		next = 28102,
		base = 28100,
		restore_gold = 20,
		destory_gold = 14,
		prev = 28100,
		id = 28101,
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
	[28102] = {
		trans_use_gold = 100,
		next = 28103,
		base = 28100,
		restore_gold = 80,
		destory_gold = 29,
		prev = 28101,
		id = 28102,
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
	[28103] = {
		trans_use_gold = 160,
		next = 28104,
		base = 28100,
		restore_gold = 180,
		destory_gold = 54,
		prev = 28102,
		id = 28103,
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
	[28104] = {
		trans_use_gold = 220,
		next = 28105,
		base = 28100,
		restore_gold = 340,
		destory_gold = 94,
		prev = 28103,
		id = 28104,
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
	[28105] = {
		trans_use_gold = 280,
		next = 28106,
		base = 28100,
		restore_gold = 560,
		destory_gold = 149,
		prev = 28104,
		id = 28105,
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
	[28106] = {
		trans_use_gold = 0,
		next = 0,
		base = 28100,
		restore_gold = 840,
		destory_gold = 219,
		prev = 28105,
		id = 28106,
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
	[28120] = {
		important = 1,
		destory_gold = 16,
		type = 8,
		group = 28120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 28121,
		prev = 0,
		id = 28120,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[28121] = {
		trans_use_gold = 60,
		next = 28122,
		base = 28120,
		restore_gold = 20,
		destory_gold = 21,
		prev = 28120,
		id = 28121,
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
	[28122] = {
		trans_use_gold = 100,
		next = 28123,
		base = 28120,
		restore_gold = 80,
		destory_gold = 36,
		prev = 28121,
		id = 28122,
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
	[28123] = {
		trans_use_gold = 160,
		next = 28124,
		base = 28120,
		restore_gold = 180,
		destory_gold = 61,
		prev = 28122,
		id = 28123,
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
	[28124] = {
		trans_use_gold = 220,
		next = 28125,
		base = 28120,
		restore_gold = 340,
		destory_gold = 101,
		prev = 28123,
		id = 28124,
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
	[28125] = {
		trans_use_gold = 280,
		next = 28126,
		base = 28120,
		restore_gold = 560,
		destory_gold = 156,
		prev = 28124,
		id = 28125,
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
	[28126] = {
		trans_use_gold = 360,
		next = 28127,
		base = 28120,
		restore_gold = 840,
		destory_gold = 226,
		prev = 28125,
		id = 28126,
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
	[28127] = {
		trans_use_gold = 440,
		next = 28128,
		base = 28120,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 28126,
		id = 28127,
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
	[28128] = {
		trans_use_gold = 520,
		next = 28129,
		base = 28120,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 28127,
		id = 28128,
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
	[28129] = {
		trans_use_gold = 600,
		next = 28130,
		base = 28120,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 28128,
		id = 28129,
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
	[28130] = {
		trans_use_gold = 0,
		next = 0,
		base = 28120,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 28129,
		id = 28130,
		level = 11,
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
	[28140] = {
		important = 1,
		destory_gold = 25,
		type = 8,
		group = 28140,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 28141,
		prev = 0,
		id = 28140,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				2
			}
		},
		destory_item = {
			{
				17043,
				1
			}
		},
		restore_item = {}
	},
	[28141] = {
		trans_use_gold = 90,
		next = 28142,
		base = 28140,
		restore_gold = 20,
		destory_gold = 33,
		prev = 28140,
		id = 28141,
		level = 2,
		trans_use_item = {
			{
				17041,
				5
			}
		},
		destory_item = {
			{
				17041,
				1
			},
			{
				17043,
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
	[28142] = {
		trans_use_gold = 150,
		next = 28143,
		base = 28140,
		restore_gold = 80,
		destory_gold = 55,
		prev = 28141,
		id = 28142,
		level = 3,
		trans_use_item = {
			{
				17041,
				8
			}
		},
		destory_item = {
			{
				17041,
				2
			},
			{
				17043,
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
	[28143] = {
		trans_use_gold = 240,
		next = 28144,
		base = 28140,
		restore_gold = 180,
		destory_gold = 93,
		prev = 28142,
		id = 28143,
		level = 4,
		trans_use_item = {
			{
				17042,
				12
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17043,
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
	[28144] = {
		trans_use_gold = 330,
		next = 28145,
		base = 28140,
		restore_gold = 340,
		destory_gold = 153,
		prev = 28143,
		id = 28144,
		level = 5,
		trans_use_item = {
			{
				17042,
				16
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				3
			},
			{
				17043,
				1
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
	[28145] = {
		trans_use_gold = 420,
		next = 28146,
		base = 28140,
		restore_gold = 560,
		destory_gold = 235,
		prev = 28144,
		id = 28145,
		level = 6,
		trans_use_item = {
			{
				17042,
				21
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				7
			},
			{
				17043,
				1
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
	[28146] = {
		trans_use_gold = 540,
		next = 28147,
		base = 28140,
		restore_gold = 840,
		destory_gold = 340,
		prev = 28145,
		id = 28146,
		level = 7,
		trans_use_item = {
			{
				17043,
				27
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				1
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
	[28147] = {
		trans_use_gold = 660,
		next = 28148,
		base = 28140,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 28146,
		id = 28147,
		level = 8,
		trans_use_item = {
			{
				17043,
				33
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				7
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
	[28148] = {
		trans_use_gold = 780,
		next = 28149,
		base = 28140,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 28147,
		id = 28148,
		level = 9,
		trans_use_item = {
			{
				17043,
				39
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				15
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
	[28149] = {
		trans_use_gold = 900,
		next = 28150,
		base = 28140,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 28148,
		id = 28149,
		level = 10,
		trans_use_item = {
			{
				17043,
				45
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				25
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
	[28150] = {
		trans_use_gold = 0,
		next = 0,
		base = 28140,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 28149,
		id = 28150,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				36
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
	[29000] = {
		important = 1,
		destory_gold = 1,
		type = 9,
		group = 29000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 29001,
		prev = 0,
		id = 29000,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[29001] = {
		trans_use_gold = 60,
		next = 29002,
		base = 29000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 29000,
		id = 29001,
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
	[29002] = {
		trans_use_gold = 100,
		next = 29003,
		base = 29000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 29001,
		id = 29002,
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
	[29003] = {
		trans_use_gold = 0,
		next = 0,
		base = 29000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 29002,
		id = 29003,
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
	[29020] = {
		important = 1,
		destory_gold = 4,
		type = 9,
		group = 29020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 29021,
		prev = 0,
		id = 29020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[29021] = {
		trans_use_gold = 60,
		next = 29022,
		base = 29020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 29020,
		id = 29021,
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
	[29022] = {
		trans_use_gold = 100,
		next = 29023,
		base = 29020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 29021,
		id = 29022,
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
	[29023] = {
		trans_use_gold = 0,
		next = 0,
		base = 29020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 29022,
		id = 29023,
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
	[29040] = {
		important = 1,
		destory_gold = 9,
		type = 9,
		group = 29040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 29041,
		prev = 0,
		id = 29040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[29041] = {
		trans_use_gold = 60,
		next = 29042,
		base = 29040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 29040,
		id = 29041,
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
	[29042] = {
		trans_use_gold = 100,
		next = 29043,
		base = 29040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 29041,
		id = 29042,
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
	[29043] = {
		trans_use_gold = 160,
		next = 29044,
		base = 29040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 29042,
		id = 29043,
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
	[29044] = {
		trans_use_gold = 220,
		next = 29045,
		base = 29040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 29043,
		id = 29044,
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
	[29045] = {
		trans_use_gold = 280,
		next = 29046,
		base = 29040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 29044,
		id = 29045,
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
	[29046] = {
		trans_use_gold = 0,
		next = 0,
		base = 29040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 29045,
		id = 29046,
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
	[29100] = {
		important = 1,
		destory_gold = 4,
		type = 9,
		group = 29100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 29101,
		prev = 0,
		id = 29100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[29101] = {
		trans_use_gold = 60,
		next = 29102,
		base = 29100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 29100,
		id = 29101,
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
	[29102] = {
		trans_use_gold = 100,
		next = 29103,
		base = 29100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 29101,
		id = 29102,
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
	[29103] = {
		trans_use_gold = 0,
		next = 0,
		base = 29100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 29102,
		id = 29103,
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
	[29120] = {
		important = 1,
		destory_gold = 9,
		type = 9,
		group = 29120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 29121,
		prev = 0,
		id = 29120,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[29121] = {
		trans_use_gold = 60,
		next = 29122,
		base = 29120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 29120,
		id = 29121,
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
	[29122] = {
		trans_use_gold = 100,
		next = 29123,
		base = 29120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 29121,
		id = 29122,
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
	[29123] = {
		trans_use_gold = 160,
		next = 29124,
		base = 29120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 29122,
		id = 29123,
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
	[29124] = {
		trans_use_gold = 220,
		next = 29125,
		base = 29120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 29123,
		id = 29124,
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
	[29125] = {
		trans_use_gold = 280,
		next = 29126,
		base = 29120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 29124,
		id = 29125,
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
	[29126] = {
		trans_use_gold = 0,
		next = 0,
		base = 29120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 29125,
		id = 29126,
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
	[29140] = {
		important = 1,
		destory_gold = 16,
		type = 9,
		group = 29140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 29141,
		prev = 0,
		id = 29140,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[29141] = {
		trans_use_gold = 60,
		next = 29142,
		base = 29140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 29140,
		id = 29141,
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
	[29142] = {
		trans_use_gold = 100,
		next = 29143,
		base = 29140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 29141,
		id = 29142,
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
	[29143] = {
		trans_use_gold = 160,
		next = 29144,
		base = 29140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 29142,
		id = 29143,
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
	[29144] = {
		trans_use_gold = 220,
		next = 29145,
		base = 29140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 29143,
		id = 29144,
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
	[29145] = {
		trans_use_gold = 280,
		next = 29146,
		base = 29140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 29144,
		id = 29145,
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
	[29146] = {
		trans_use_gold = 360,
		next = 29147,
		base = 29140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 29145,
		id = 29146,
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
	[29147] = {
		trans_use_gold = 440,
		next = 29148,
		base = 29140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 29146,
		id = 29147,
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
	[29148] = {
		trans_use_gold = 520,
		next = 29149,
		base = 29140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 29147,
		id = 29148,
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
	[29149] = {
		trans_use_gold = 600,
		next = 29150,
		base = 29140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 29148,
		id = 29149,
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
	[29150] = {
		trans_use_gold = 0,
		next = 0,
		base = 29140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 29149,
		id = 29150,
		level = 11,
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
	[30000] = {
		important = 1,
		destory_gold = 9,
		type = 4,
		group = 30000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 30001,
		prev = 0,
		id = 30000,
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
		restore_item = {}
	},
	[30001] = {
		trans_use_gold = 60,
		next = 30002,
		base = 30000,
		restore_gold = 20,
		destory_gold = 14,
		prev = 30000,
		id = 30001,
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
	[30002] = {
		trans_use_gold = 100,
		next = 30003,
		base = 30000,
		restore_gold = 80,
		destory_gold = 29,
		prev = 30001,
		id = 30002,
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
	[30003] = {
		trans_use_gold = 160,
		next = 30004,
		base = 30000,
		restore_gold = 180,
		destory_gold = 54,
		prev = 30002,
		id = 30003,
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
	[30004] = {
		trans_use_gold = 220,
		next = 30005,
		base = 30000,
		restore_gold = 340,
		destory_gold = 94,
		prev = 30003,
		id = 30004,
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
	[30005] = {
		trans_use_gold = 280,
		next = 30006,
		base = 30000,
		restore_gold = 560,
		destory_gold = 149,
		prev = 30004,
		id = 30005,
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
	[30006] = {
		trans_use_gold = 0,
		next = 0,
		base = 30000,
		restore_gold = 840,
		destory_gold = 219,
		prev = 30005,
		id = 30006,
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
	[31000] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 31000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 31001,
		prev = 0,
		id = 31000,
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
		restore_item = {}
	},
	[31001] = {
		trans_use_gold = 60,
		next = 31002,
		base = 31000,
		restore_gold = 20,
		destory_gold = 14,
		prev = 31000,
		id = 31001,
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
	[31002] = {
		trans_use_gold = 100,
		next = 31003,
		base = 31000,
		restore_gold = 80,
		destory_gold = 29,
		prev = 31001,
		id = 31002,
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
	[31003] = {
		trans_use_gold = 160,
		next = 31004,
		base = 31000,
		restore_gold = 180,
		destory_gold = 54,
		prev = 31002,
		id = 31003,
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
	[31004] = {
		trans_use_gold = 220,
		next = 31005,
		base = 31000,
		restore_gold = 340,
		destory_gold = 94,
		prev = 31003,
		id = 31004,
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
	[31005] = {
		trans_use_gold = 280,
		next = 31006,
		base = 31000,
		restore_gold = 560,
		destory_gold = 149,
		prev = 31004,
		id = 31005,
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
	[31006] = {
		trans_use_gold = 0,
		next = 0,
		base = 31000,
		restore_gold = 840,
		destory_gold = 219,
		prev = 31005,
		id = 31006,
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
	[31020] = {
		important = 1,
		destory_gold = 16,
		type = 1,
		group = 31020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 31021,
		prev = 0,
		id = 31020,
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
		restore_item = {}
	},
	[31021] = {
		trans_use_gold = 60,
		next = 31022,
		base = 31020,
		restore_gold = 20,
		destory_gold = 21,
		prev = 31020,
		id = 31021,
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
	[31022] = {
		trans_use_gold = 100,
		next = 31023,
		base = 31020,
		restore_gold = 80,
		destory_gold = 36,
		prev = 31021,
		id = 31022,
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
	[31023] = {
		trans_use_gold = 160,
		next = 31024,
		base = 31020,
		restore_gold = 180,
		destory_gold = 61,
		prev = 31022,
		id = 31023,
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
	[31024] = {
		trans_use_gold = 220,
		next = 31025,
		base = 31020,
		restore_gold = 340,
		destory_gold = 101,
		prev = 31023,
		id = 31024,
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
	[31025] = {
		trans_use_gold = 280,
		next = 31026,
		base = 31020,
		restore_gold = 560,
		destory_gold = 156,
		prev = 31024,
		id = 31025,
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
	[31026] = {
		trans_use_gold = 360,
		next = 31027,
		base = 31020,
		restore_gold = 840,
		destory_gold = 226,
		prev = 31025,
		id = 31026,
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
	[31027] = {
		trans_use_gold = 440,
		next = 31028,
		base = 31020,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 31026,
		id = 31027,
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
	[31028] = {
		trans_use_gold = 520,
		next = 31029,
		base = 31020,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 31027,
		id = 31028,
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
	[31029] = {
		trans_use_gold = 600,
		next = 31030,
		base = 31020,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 31028,
		id = 31029,
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
	[31030] = {
		trans_use_gold = 0,
		next = 0,
		base = 31020,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 31029,
		id = 31030,
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
	[31040] = {
		important = 1,
		destory_gold = 25,
		type = 1,
		group = 31040,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 31041,
		prev = 0,
		id = 31040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17011,
				2
			}
		},
		destory_item = {
			{
				17013,
				1
			}
		},
		restore_item = {}
	},
	[31041] = {
		trans_use_gold = 90,
		next = 31042,
		base = 31040,
		restore_gold = 20,
		destory_gold = 33,
		prev = 31040,
		id = 31041,
		level = 2,
		trans_use_item = {
			{
				17011,
				5
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
	[31042] = {
		trans_use_gold = 150,
		next = 31043,
		base = 31040,
		restore_gold = 80,
		destory_gold = 55,
		prev = 31041,
		id = 31042,
		level = 3,
		trans_use_item = {
			{
				17011,
				8
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
	[31043] = {
		trans_use_gold = 240,
		next = 31044,
		base = 31040,
		restore_gold = 180,
		destory_gold = 93,
		prev = 31042,
		id = 31043,
		level = 4,
		trans_use_item = {
			{
				17012,
				12
			}
		},
		destory_item = {
			{
				17011,
				4
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
	[31044] = {
		trans_use_gold = 330,
		next = 31045,
		base = 31040,
		restore_gold = 340,
		destory_gold = 153,
		prev = 31043,
		id = 31044,
		level = 5,
		trans_use_item = {
			{
				17012,
				16
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
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
			},
			{
				17012,
				8
			}
		}
	},
	[31045] = {
		trans_use_gold = 420,
		next = 31046,
		base = 31040,
		restore_gold = 560,
		destory_gold = 235,
		prev = 31044,
		id = 31045,
		level = 6,
		trans_use_item = {
			{
				17012,
				21
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				7
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
	[31046] = {
		trans_use_gold = 540,
		next = 31047,
		base = 31040,
		restore_gold = 840,
		destory_gold = 340,
		prev = 31045,
		id = 31046,
		level = 7,
		trans_use_item = {
			{
				17013,
				27
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
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
	[31047] = {
		trans_use_gold = 660,
		next = 31048,
		base = 31040,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 31046,
		id = 31047,
		level = 8,
		trans_use_item = {
			{
				17013,
				33
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				7
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
	[31048] = {
		trans_use_gold = 780,
		next = 31049,
		base = 31040,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 31047,
		id = 31048,
		level = 9,
		trans_use_item = {
			{
				17013,
				39
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				15
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
	[31049] = {
		trans_use_gold = 900,
		next = 31050,
		base = 31040,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 31048,
		id = 31049,
		level = 10,
		trans_use_item = {
			{
				17013,
				45
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
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
				66
			}
		}
	},
	[31050] = {
		trans_use_gold = 0,
		next = 0,
		base = 31040,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 31049,
		id = 31050,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				36
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
	[31100] = {
		important = 1,
		destory_gold = 1,
		type = 1,
		group = 31100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 31101,
		prev = 0,
		id = 31100,
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
		restore_item = {}
	},
	[31101] = {
		trans_use_gold = 60,
		next = 31102,
		base = 31100,
		restore_gold = 20,
		destory_gold = 6,
		prev = 31100,
		id = 31101,
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
	[31102] = {
		trans_use_gold = 100,
		next = 31103,
		base = 31100,
		restore_gold = 80,
		destory_gold = 21,
		prev = 31101,
		id = 31102,
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
	[31103] = {
		trans_use_gold = 0,
		next = 0,
		base = 31100,
		restore_gold = 180,
		destory_gold = 46,
		prev = 31102,
		id = 31103,
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
	[31120] = {
		important = 1,
		destory_gold = 4,
		type = 1,
		group = 31120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 31121,
		prev = 0,
		id = 31120,
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
		restore_item = {}
	},
	[31121] = {
		trans_use_gold = 60,
		next = 31122,
		base = 31120,
		restore_gold = 20,
		destory_gold = 9,
		prev = 31120,
		id = 31121,
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
	[31122] = {
		trans_use_gold = 100,
		next = 31123,
		base = 31120,
		restore_gold = 80,
		destory_gold = 24,
		prev = 31121,
		id = 31122,
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
	[31123] = {
		trans_use_gold = 0,
		next = 0,
		base = 31120,
		restore_gold = 180,
		destory_gold = 49,
		prev = 31122,
		id = 31123,
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
	[31140] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 31140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 31141,
		prev = 0,
		id = 31140,
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
		restore_item = {}
	},
	[31141] = {
		trans_use_gold = 60,
		next = 31142,
		base = 31140,
		restore_gold = 20,
		destory_gold = 14,
		prev = 31140,
		id = 31141,
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
	[31142] = {
		trans_use_gold = 100,
		next = 31143,
		base = 31140,
		restore_gold = 80,
		destory_gold = 29,
		prev = 31141,
		id = 31142,
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
	[31143] = {
		trans_use_gold = 160,
		next = 31144,
		base = 31140,
		restore_gold = 180,
		destory_gold = 54,
		prev = 31142,
		id = 31143,
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
	[31144] = {
		trans_use_gold = 220,
		next = 31145,
		base = 31140,
		restore_gold = 340,
		destory_gold = 94,
		prev = 31143,
		id = 31144,
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
	[31145] = {
		trans_use_gold = 280,
		next = 31146,
		base = 31140,
		restore_gold = 560,
		destory_gold = 149,
		prev = 31144,
		id = 31145,
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
	[31146] = {
		trans_use_gold = 0,
		next = 0,
		base = 31140,
		restore_gold = 840,
		destory_gold = 219,
		prev = 31145,
		id = 31146,
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
	[31200] = {
		important = 1,
		destory_gold = 4,
		type = 1,
		group = 31200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 31201,
		prev = 0,
		id = 31200,
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
		restore_item = {}
	},
	[31201] = {
		trans_use_gold = 60,
		next = 31202,
		base = 31200,
		restore_gold = 20,
		destory_gold = 9,
		prev = 31200,
		id = 31201,
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
	[31202] = {
		trans_use_gold = 100,
		next = 31203,
		base = 31200,
		restore_gold = 80,
		destory_gold = 24,
		prev = 31201,
		id = 31202,
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
	[31203] = {
		trans_use_gold = 0,
		next = 0,
		base = 31200,
		restore_gold = 180,
		destory_gold = 49,
		prev = 31202,
		id = 31203,
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
	[31220] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 31220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 31221,
		prev = 0,
		id = 31220,
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
		restore_item = {}
	},
	[31221] = {
		trans_use_gold = 60,
		next = 31222,
		base = 31220,
		restore_gold = 20,
		destory_gold = 14,
		prev = 31220,
		id = 31221,
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
	[31222] = {
		trans_use_gold = 100,
		next = 31223,
		base = 31220,
		restore_gold = 80,
		destory_gold = 29,
		prev = 31221,
		id = 31222,
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
	[31223] = {
		trans_use_gold = 160,
		next = 31224,
		base = 31220,
		restore_gold = 180,
		destory_gold = 54,
		prev = 31222,
		id = 31223,
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
	[31224] = {
		trans_use_gold = 220,
		next = 31225,
		base = 31220,
		restore_gold = 340,
		destory_gold = 94,
		prev = 31223,
		id = 31224,
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
	[31225] = {
		trans_use_gold = 280,
		next = 31226,
		base = 31220,
		restore_gold = 560,
		destory_gold = 149,
		prev = 31224,
		id = 31225,
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
	[31226] = {
		trans_use_gold = 0,
		next = 0,
		base = 31220,
		restore_gold = 840,
		destory_gold = 219,
		prev = 31225,
		id = 31226,
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
	[31240] = {
		important = 1,
		destory_gold = 16,
		type = 1,
		group = 31240,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 31241,
		prev = 0,
		id = 31240,
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
		restore_item = {}
	},
	[31241] = {
		trans_use_gold = 60,
		next = 31242,
		base = 31240,
		restore_gold = 20,
		destory_gold = 21,
		prev = 31240,
		id = 31241,
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
	[31242] = {
		trans_use_gold = 100,
		next = 31243,
		base = 31240,
		restore_gold = 80,
		destory_gold = 36,
		prev = 31241,
		id = 31242,
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
	[31243] = {
		trans_use_gold = 160,
		next = 31244,
		base = 31240,
		restore_gold = 180,
		destory_gold = 61,
		prev = 31242,
		id = 31243,
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
	[31244] = {
		trans_use_gold = 220,
		next = 31245,
		base = 31240,
		restore_gold = 340,
		destory_gold = 101,
		prev = 31243,
		id = 31244,
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
	[31245] = {
		trans_use_gold = 280,
		next = 31246,
		base = 31240,
		restore_gold = 560,
		destory_gold = 156,
		prev = 31244,
		id = 31245,
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
	[31246] = {
		trans_use_gold = 360,
		next = 31247,
		base = 31240,
		restore_gold = 840,
		destory_gold = 226,
		prev = 31245,
		id = 31246,
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
	[31247] = {
		trans_use_gold = 440,
		next = 31248,
		base = 31240,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 31246,
		id = 31247,
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
	[31248] = {
		trans_use_gold = 520,
		next = 31249,
		base = 31240,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 31247,
		id = 31248,
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
	[31249] = {
		trans_use_gold = 600,
		next = 31250,
		base = 31240,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 31248,
		id = 31249,
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
	[31250] = {
		trans_use_gold = 0,
		next = 0,
		base = 31240,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 31249,
		id = 31250,
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
	[32000] = {
		important = 1,
		destory_gold = 1,
		type = 2,
		group = 32000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 32001,
		prev = 0,
		id = 32000,
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
		restore_item = {}
	},
	[32001] = {
		trans_use_gold = 60,
		next = 32002,
		base = 32000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 32000,
		id = 32001,
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
	[32002] = {
		trans_use_gold = 100,
		next = 32003,
		base = 32000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 32001,
		id = 32002,
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
	[32003] = {
		trans_use_gold = 0,
		next = 0,
		base = 32000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 32002,
		id = 32003,
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
	[32020] = {
		important = 1,
		destory_gold = 4,
		type = 2,
		group = 32020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 32021,
		prev = 0,
		id = 32020,
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
		restore_item = {}
	},
	[32021] = {
		trans_use_gold = 60,
		next = 32022,
		base = 32020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 32020,
		id = 32021,
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
	[32022] = {
		trans_use_gold = 100,
		next = 32023,
		base = 32020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 32021,
		id = 32022,
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
	[32023] = {
		trans_use_gold = 0,
		next = 0,
		base = 32020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 32022,
		id = 32023,
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
	[32040] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 32040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 32041,
		prev = 0,
		id = 32040,
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
		restore_item = {}
	},
	[32041] = {
		trans_use_gold = 60,
		next = 32042,
		base = 32040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 32040,
		id = 32041,
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
	[32042] = {
		trans_use_gold = 100,
		next = 32043,
		base = 32040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 32041,
		id = 32042,
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
	[32043] = {
		trans_use_gold = 160,
		next = 32044,
		base = 32040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 32042,
		id = 32043,
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
	[32044] = {
		trans_use_gold = 220,
		next = 32045,
		base = 32040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 32043,
		id = 32044,
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
	[32045] = {
		trans_use_gold = 280,
		next = 32046,
		base = 32040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 32044,
		id = 32045,
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
	[32046] = {
		trans_use_gold = 0,
		next = 0,
		base = 32040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 32045,
		id = 32046,
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
	[32100] = {
		important = 1,
		destory_gold = 4,
		type = 2,
		group = 32100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 32101,
		prev = 0,
		id = 32100,
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
		restore_item = {}
	},
	[32101] = {
		trans_use_gold = 60,
		next = 32102,
		base = 32100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 32100,
		id = 32101,
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
	[32102] = {
		trans_use_gold = 100,
		next = 32103,
		base = 32100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 32101,
		id = 32102,
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
	[32103] = {
		trans_use_gold = 0,
		next = 0,
		base = 32100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 32102,
		id = 32103,
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
	[32120] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 32120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 32121,
		prev = 0,
		id = 32120,
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
		restore_item = {}
	},
	[32121] = {
		trans_use_gold = 60,
		next = 32122,
		base = 32120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 32120,
		id = 32121,
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
	[32122] = {
		trans_use_gold = 100,
		next = 32123,
		base = 32120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 32121,
		id = 32122,
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
	[32123] = {
		trans_use_gold = 160,
		next = 32124,
		base = 32120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 32122,
		id = 32123,
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
	[32124] = {
		trans_use_gold = 220,
		next = 32125,
		base = 32120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 32123,
		id = 32124,
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
	[32125] = {
		trans_use_gold = 280,
		next = 32126,
		base = 32120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 32124,
		id = 32125,
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
	[32126] = {
		trans_use_gold = 0,
		next = 0,
		base = 32120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 32125,
		id = 32126,
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
	[32140] = {
		important = 1,
		destory_gold = 16,
		type = 2,
		group = 32140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 32141,
		prev = 0,
		id = 32140,
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
		restore_item = {}
	},
	[32141] = {
		trans_use_gold = 60,
		next = 32142,
		base = 32140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 32140,
		id = 32141,
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
	[32142] = {
		trans_use_gold = 100,
		next = 32143,
		base = 32140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 32141,
		id = 32142,
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
	[32143] = {
		trans_use_gold = 160,
		next = 32144,
		base = 32140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 32142,
		id = 32143,
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
	[32144] = {
		trans_use_gold = 220,
		next = 32145,
		base = 32140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 32143,
		id = 32144,
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
	[32145] = {
		trans_use_gold = 280,
		next = 32146,
		base = 32140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 32144,
		id = 32145,
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
	[32146] = {
		trans_use_gold = 360,
		next = 32147,
		base = 32140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 32145,
		id = 32146,
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
	[32147] = {
		trans_use_gold = 440,
		next = 32148,
		base = 32140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 32146,
		id = 32147,
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
	[32148] = {
		trans_use_gold = 520,
		next = 32149,
		base = 32140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 32147,
		id = 32148,
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
	[32149] = {
		trans_use_gold = 600,
		next = 32150,
		base = 32140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 32148,
		id = 32149,
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
	[32150] = {
		trans_use_gold = 0,
		next = 0,
		base = 32140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 32149,
		id = 32150,
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
	[32200] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 32200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 32201,
		prev = 0,
		id = 32200,
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
		restore_item = {}
	},
	[32201] = {
		trans_use_gold = 60,
		next = 32202,
		base = 32200,
		restore_gold = 20,
		destory_gold = 14,
		prev = 32200,
		id = 32201,
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
	[32202] = {
		trans_use_gold = 100,
		next = 32203,
		base = 32200,
		restore_gold = 80,
		destory_gold = 29,
		prev = 32201,
		id = 32202,
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
	[32203] = {
		trans_use_gold = 160,
		next = 32204,
		base = 32200,
		restore_gold = 180,
		destory_gold = 54,
		prev = 32202,
		id = 32203,
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
	[32204] = {
		trans_use_gold = 220,
		next = 32205,
		base = 32200,
		restore_gold = 340,
		destory_gold = 94,
		prev = 32203,
		id = 32204,
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
	[32205] = {
		trans_use_gold = 280,
		next = 32206,
		base = 32200,
		restore_gold = 560,
		destory_gold = 149,
		prev = 32204,
		id = 32205,
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
	[32206] = {
		trans_use_gold = 0,
		next = 0,
		base = 32200,
		restore_gold = 840,
		destory_gold = 219,
		prev = 32205,
		id = 32206,
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
	[32220] = {
		important = 1,
		destory_gold = 16,
		type = 2,
		group = 32220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 32221,
		prev = 0,
		id = 32220,
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
		restore_item = {}
	},
	[32221] = {
		trans_use_gold = 60,
		next = 32222,
		base = 32220,
		restore_gold = 20,
		destory_gold = 21,
		prev = 32220,
		id = 32221,
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
	[32222] = {
		trans_use_gold = 100,
		next = 32223,
		base = 32220,
		restore_gold = 80,
		destory_gold = 36,
		prev = 32221,
		id = 32222,
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
	[32223] = {
		trans_use_gold = 160,
		next = 32224,
		base = 32220,
		restore_gold = 180,
		destory_gold = 61,
		prev = 32222,
		id = 32223,
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
	[32224] = {
		trans_use_gold = 220,
		next = 32225,
		base = 32220,
		restore_gold = 340,
		destory_gold = 101,
		prev = 32223,
		id = 32224,
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
	[32225] = {
		trans_use_gold = 280,
		next = 32226,
		base = 32220,
		restore_gold = 560,
		destory_gold = 156,
		prev = 32224,
		id = 32225,
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
	[32226] = {
		trans_use_gold = 360,
		next = 32227,
		base = 32220,
		restore_gold = 840,
		destory_gold = 226,
		prev = 32225,
		id = 32226,
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
	[32227] = {
		trans_use_gold = 440,
		next = 32228,
		base = 32220,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 32226,
		id = 32227,
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
	[32228] = {
		trans_use_gold = 520,
		next = 32229,
		base = 32220,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 32227,
		id = 32228,
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
	[32229] = {
		trans_use_gold = 600,
		next = 32230,
		base = 32220,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 32228,
		id = 32229,
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
	[32230] = {
		trans_use_gold = 0,
		next = 0,
		base = 32220,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 32229,
		id = 32230,
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
	[32240] = {
		important = 1,
		destory_gold = 25,
		type = 2,
		group = 32240,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 32241,
		prev = 0,
		id = 32240,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17011,
				2
			}
		},
		destory_item = {
			{
				17013,
				1
			}
		},
		restore_item = {}
	},
	[32241] = {
		trans_use_gold = 90,
		next = 32242,
		base = 32240,
		restore_gold = 20,
		destory_gold = 33,
		prev = 32240,
		id = 32241,
		level = 2,
		trans_use_item = {
			{
				17011,
				5
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
	[32242] = {
		trans_use_gold = 150,
		next = 32243,
		base = 32240,
		restore_gold = 80,
		destory_gold = 55,
		prev = 32241,
		id = 32242,
		level = 3,
		trans_use_item = {
			{
				17011,
				8
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
	[32243] = {
		trans_use_gold = 240,
		next = 32244,
		base = 32240,
		restore_gold = 180,
		destory_gold = 93,
		prev = 32242,
		id = 32243,
		level = 4,
		trans_use_item = {
			{
				17012,
				12
			}
		},
		destory_item = {
			{
				17011,
				4
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
	[32244] = {
		trans_use_gold = 330,
		next = 32245,
		base = 32240,
		restore_gold = 340,
		destory_gold = 153,
		prev = 32243,
		id = 32244,
		level = 5,
		trans_use_item = {
			{
				17012,
				16
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
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
			},
			{
				17012,
				8
			}
		}
	},
	[32245] = {
		trans_use_gold = 420,
		next = 32246,
		base = 32240,
		restore_gold = 560,
		destory_gold = 235,
		prev = 32244,
		id = 32245,
		level = 6,
		trans_use_item = {
			{
				17012,
				21
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				7
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
	[32246] = {
		trans_use_gold = 540,
		next = 32247,
		base = 32240,
		restore_gold = 840,
		destory_gold = 340,
		prev = 32245,
		id = 32246,
		level = 7,
		trans_use_item = {
			{
				17013,
				27
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
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
	[32247] = {
		trans_use_gold = 660,
		next = 32248,
		base = 32240,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 32246,
		id = 32247,
		level = 8,
		trans_use_item = {
			{
				17013,
				33
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				7
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
	[32248] = {
		trans_use_gold = 780,
		next = 32249,
		base = 32240,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 32247,
		id = 32248,
		level = 9,
		trans_use_item = {
			{
				17013,
				39
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				15
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
	[32249] = {
		trans_use_gold = 900,
		next = 32250,
		base = 32240,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 32248,
		id = 32249,
		level = 10,
		trans_use_item = {
			{
				17013,
				45
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
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
				66
			}
		}
	},
	[32250] = {
		trans_use_gold = 0,
		next = 0,
		base = 32240,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 32249,
		id = 32250,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				36
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
	[33000] = {
		important = 1,
		destory_gold = 4,
		type = 3,
		group = 33000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 33001,
		prev = 0,
		id = 33000,
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
		restore_item = {}
	},
	[33001] = {
		trans_use_gold = 60,
		next = 33002,
		base = 33000,
		restore_gold = 20,
		destory_gold = 9,
		prev = 33000,
		id = 33001,
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
	[33002] = {
		trans_use_gold = 100,
		next = 33003,
		base = 33000,
		restore_gold = 80,
		destory_gold = 24,
		prev = 33001,
		id = 33002,
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
	[33003] = {
		trans_use_gold = 0,
		next = 0,
		base = 33000,
		restore_gold = 180,
		destory_gold = 49,
		prev = 33002,
		id = 33003,
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
	[33020] = {
		important = 1,
		destory_gold = 9,
		type = 3,
		group = 33020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 33021,
		prev = 0,
		id = 33020,
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
		restore_item = {}
	},
	[33021] = {
		trans_use_gold = 60,
		next = 33022,
		base = 33020,
		restore_gold = 20,
		destory_gold = 14,
		prev = 33020,
		id = 33021,
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
	[33022] = {
		trans_use_gold = 100,
		next = 33023,
		base = 33020,
		restore_gold = 80,
		destory_gold = 29,
		prev = 33021,
		id = 33022,
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
	[33023] = {
		trans_use_gold = 160,
		next = 33024,
		base = 33020,
		restore_gold = 180,
		destory_gold = 54,
		prev = 33022,
		id = 33023,
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
	[33024] = {
		trans_use_gold = 220,
		next = 33025,
		base = 33020,
		restore_gold = 340,
		destory_gold = 94,
		prev = 33023,
		id = 33024,
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
	[33025] = {
		trans_use_gold = 280,
		next = 33026,
		base = 33020,
		restore_gold = 560,
		destory_gold = 149,
		prev = 33024,
		id = 33025,
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
	[33026] = {
		trans_use_gold = 0,
		next = 0,
		base = 33020,
		restore_gold = 840,
		destory_gold = 219,
		prev = 33025,
		id = 33026,
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
	[33040] = {
		important = 1,
		destory_gold = 16,
		type = 3,
		group = 33040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 33041,
		prev = 0,
		id = 33040,
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
		restore_item = {}
	},
	[33041] = {
		trans_use_gold = 60,
		next = 33042,
		base = 33040,
		restore_gold = 20,
		destory_gold = 21,
		prev = 33040,
		id = 33041,
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
	[33042] = {
		trans_use_gold = 100,
		next = 33043,
		base = 33040,
		restore_gold = 80,
		destory_gold = 36,
		prev = 33041,
		id = 33042,
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
	[33043] = {
		trans_use_gold = 160,
		next = 33044,
		base = 33040,
		restore_gold = 180,
		destory_gold = 61,
		prev = 33042,
		id = 33043,
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
	[33044] = {
		trans_use_gold = 220,
		next = 33045,
		base = 33040,
		restore_gold = 340,
		destory_gold = 101,
		prev = 33043,
		id = 33044,
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
	[33045] = {
		trans_use_gold = 280,
		next = 33046,
		base = 33040,
		restore_gold = 560,
		destory_gold = 156,
		prev = 33044,
		id = 33045,
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
	[33046] = {
		trans_use_gold = 360,
		next = 33047,
		base = 33040,
		restore_gold = 840,
		destory_gold = 226,
		prev = 33045,
		id = 33046,
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
	[33047] = {
		trans_use_gold = 440,
		next = 33048,
		base = 33040,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 33046,
		id = 33047,
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
	[33048] = {
		trans_use_gold = 520,
		next = 33049,
		base = 33040,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 33047,
		id = 33048,
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
		trans_use_gold = 0,
		next = 0,
		base = 33040,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 33049,
		id = 33050,
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
	[34000] = {
		important = 1,
		destory_gold = 1,
		type = 4,
		group = 34000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 34001,
		prev = 0,
		id = 34000,
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
		restore_item = {}
	},
	[34001] = {
		trans_use_gold = 60,
		next = 34002,
		base = 34000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 34000,
		id = 34001,
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
	[34002] = {
		trans_use_gold = 100,
		next = 34003,
		base = 34000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 34001,
		id = 34002,
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
	[34003] = {
		trans_use_gold = 0,
		next = 0,
		base = 34000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 34002,
		id = 34003,
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
	[34020] = {
		important = 1,
		destory_gold = 4,
		type = 4,
		group = 34020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 34021,
		prev = 0,
		id = 34020,
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
		restore_item = {}
	},
	[34021] = {
		trans_use_gold = 60,
		next = 34022,
		base = 34020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 34020,
		id = 34021,
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
	[34022] = {
		trans_use_gold = 100,
		next = 34023,
		base = 34020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 34021,
		id = 34022,
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
	[34023] = {
		trans_use_gold = 0,
		next = 0,
		base = 34020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 34022,
		id = 34023,
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
	[34040] = {
		important = 1,
		destory_gold = 9,
		type = 4,
		group = 34040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 34041,
		prev = 0,
		id = 34040,
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
		restore_item = {}
	},
	[34041] = {
		trans_use_gold = 60,
		next = 34042,
		base = 34040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 34040,
		id = 34041,
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
	[34042] = {
		trans_use_gold = 100,
		next = 34043,
		base = 34040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 34041,
		id = 34042,
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
	[34043] = {
		trans_use_gold = 160,
		next = 34044,
		base = 34040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 34042,
		id = 34043,
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
	[34044] = {
		trans_use_gold = 220,
		next = 34045,
		base = 34040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 34043,
		id = 34044,
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
	[34045] = {
		trans_use_gold = 280,
		next = 34046,
		base = 34040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 34044,
		id = 34045,
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
	[34046] = {
		trans_use_gold = 0,
		next = 0,
		base = 34040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 34045,
		id = 34046,
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
	[34100] = {
		important = 1,
		destory_gold = 4,
		type = 4,
		group = 34100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 34101,
		prev = 0,
		id = 34100,
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
		restore_item = {}
	},
	[34101] = {
		trans_use_gold = 60,
		next = 34102,
		base = 34100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 34100,
		id = 34101,
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
	[34102] = {
		trans_use_gold = 100,
		next = 34103,
		base = 34100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 34101,
		id = 34102,
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
	[34103] = {
		trans_use_gold = 0,
		next = 0,
		base = 34100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 34102,
		id = 34103,
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
	[34120] = {
		important = 1,
		destory_gold = 9,
		type = 4,
		group = 34120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 34121,
		prev = 0,
		id = 34120,
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
		restore_item = {}
	},
	[34121] = {
		trans_use_gold = 60,
		next = 34122,
		base = 34120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 34120,
		id = 34121,
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
	[34122] = {
		trans_use_gold = 100,
		next = 34123,
		base = 34120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 34121,
		id = 34122,
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
	[34123] = {
		trans_use_gold = 160,
		next = 34124,
		base = 34120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 34122,
		id = 34123,
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
	[34124] = {
		trans_use_gold = 220,
		next = 34125,
		base = 34120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 34123,
		id = 34124,
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
	[34125] = {
		trans_use_gold = 280,
		next = 34126,
		base = 34120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 34124,
		id = 34125,
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
	[34126] = {
		trans_use_gold = 0,
		next = 0,
		base = 34120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 34125,
		id = 34126,
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
	[34140] = {
		important = 1,
		destory_gold = 16,
		type = 4,
		group = 34140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 34141,
		prev = 0,
		id = 34140,
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
		restore_item = {}
	},
	[34141] = {
		trans_use_gold = 60,
		next = 34142,
		base = 34140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 34140,
		id = 34141,
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
	[34142] = {
		trans_use_gold = 100,
		next = 34143,
		base = 34140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 34141,
		id = 34142,
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
	[34143] = {
		trans_use_gold = 160,
		next = 34144,
		base = 34140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 34142,
		id = 34143,
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
	[34144] = {
		trans_use_gold = 220,
		next = 34145,
		base = 34140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 34143,
		id = 34144,
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
	[34145] = {
		trans_use_gold = 280,
		next = 34146,
		base = 34140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 34144,
		id = 34145,
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
	[34146] = {
		trans_use_gold = 360,
		next = 34147,
		base = 34140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 34145,
		id = 34146,
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
	[34147] = {
		trans_use_gold = 440,
		next = 34148,
		base = 34140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 34146,
		id = 34147,
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
	[34148] = {
		trans_use_gold = 520,
		next = 34149,
		base = 34140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 34147,
		id = 34148,
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
	[34149] = {
		trans_use_gold = 600,
		next = 34150,
		base = 34140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 34148,
		id = 34149,
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
	[34150] = {
		trans_use_gold = 0,
		next = 0,
		base = 34140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 34149,
		id = 34150,
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
	[34160] = {
		important = 1,
		destory_gold = 25,
		type = 4,
		group = 34160,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 34161,
		prev = 0,
		id = 34160,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17011,
				2
			}
		},
		destory_item = {
			{
				17013,
				1
			}
		},
		restore_item = {}
	},
	[34161] = {
		trans_use_gold = 90,
		next = 34162,
		base = 34160,
		restore_gold = 20,
		destory_gold = 33,
		prev = 34160,
		id = 34161,
		level = 2,
		trans_use_item = {
			{
				17011,
				5
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
	[34162] = {
		trans_use_gold = 150,
		next = 34163,
		base = 34160,
		restore_gold = 80,
		destory_gold = 55,
		prev = 34161,
		id = 34162,
		level = 3,
		trans_use_item = {
			{
				17011,
				8
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
	[34163] = {
		trans_use_gold = 240,
		next = 34164,
		base = 34160,
		restore_gold = 180,
		destory_gold = 93,
		prev = 34162,
		id = 34163,
		level = 4,
		trans_use_item = {
			{
				17012,
				12
			}
		},
		destory_item = {
			{
				17011,
				4
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
	[34164] = {
		trans_use_gold = 330,
		next = 34165,
		base = 34160,
		restore_gold = 340,
		destory_gold = 153,
		prev = 34163,
		id = 34164,
		level = 5,
		trans_use_item = {
			{
				17012,
				16
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
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
			},
			{
				17012,
				8
			}
		}
	},
	[34165] = {
		trans_use_gold = 420,
		next = 34166,
		base = 34160,
		restore_gold = 560,
		destory_gold = 235,
		prev = 34164,
		id = 34165,
		level = 6,
		trans_use_item = {
			{
				17012,
				21
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				7
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
	[34166] = {
		trans_use_gold = 540,
		next = 34167,
		base = 34160,
		restore_gold = 840,
		destory_gold = 340,
		prev = 34165,
		id = 34166,
		level = 7,
		trans_use_item = {
			{
				17013,
				27
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
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
	[34167] = {
		trans_use_gold = 660,
		next = 34168,
		base = 34160,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 34166,
		id = 34167,
		level = 8,
		trans_use_item = {
			{
				17013,
				33
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				7
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
	[34168] = {
		trans_use_gold = 780,
		next = 34169,
		base = 34160,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 34167,
		id = 34168,
		level = 9,
		trans_use_item = {
			{
				17013,
				39
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				15
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
	[34169] = {
		trans_use_gold = 900,
		next = 34170,
		base = 34160,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 34168,
		id = 34169,
		level = 10,
		trans_use_item = {
			{
				17013,
				45
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
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
				66
			}
		}
	},
	[34170] = {
		trans_use_gold = 0,
		next = 0,
		base = 34160,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 34169,
		id = 34170,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				36
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
	[35000] = {
		important = 1,
		destory_gold = 1,
		type = 5,
		group = 35000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 35001,
		prev = 0,
		id = 35000,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17021,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[35001] = {
		trans_use_gold = 60,
		next = 35002,
		base = 35000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 35000,
		id = 35001,
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
			}
		},
		restore_item = {
			{
				17021,
				1
			}
		}
	},
	[35002] = {
		trans_use_gold = 100,
		next = 35003,
		base = 35000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 35001,
		id = 35002,
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
			}
		},
		restore_item = {
			{
				17021,
				4
			}
		}
	},
	[35003] = {
		trans_use_gold = 0,
		next = 0,
		base = 35000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 35002,
		id = 35003,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17021,
				3
			}
		},
		restore_item = {
			{
				17021,
				9
			}
		}
	},
	[35020] = {
		important = 1,
		destory_gold = 4,
		type = 5,
		group = 35020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 35021,
		prev = 0,
		id = 35020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17021,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[35021] = {
		trans_use_gold = 60,
		next = 35022,
		base = 35020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 35020,
		id = 35021,
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
			}
		},
		restore_item = {
			{
				17021,
				1
			}
		}
	},
	[35022] = {
		trans_use_gold = 100,
		next = 35023,
		base = 35020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 35021,
		id = 35022,
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
			}
		},
		restore_item = {
			{
				17021,
				4
			}
		}
	},
	[35023] = {
		trans_use_gold = 0,
		next = 0,
		base = 35020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 35022,
		id = 35023,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17021,
				3
			}
		},
		restore_item = {
			{
				17021,
				9
			}
		}
	},
	[35040] = {
		important = 1,
		destory_gold = 9,
		type = 5,
		group = 35040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 35041,
		prev = 0,
		id = 35040,
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
		restore_item = {}
	},
	[35041] = {
		trans_use_gold = 60,
		next = 35042,
		base = 35040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 35040,
		id = 35041,
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
	[35042] = {
		trans_use_gold = 100,
		next = 35043,
		base = 35040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 35041,
		id = 35042,
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
	[35043] = {
		trans_use_gold = 160,
		next = 35044,
		base = 35040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 35042,
		id = 35043,
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
	[35044] = {
		trans_use_gold = 220,
		next = 35045,
		base = 35040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 35043,
		id = 35044,
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
	[35045] = {
		trans_use_gold = 280,
		next = 35046,
		base = 35040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 35044,
		id = 35045,
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
	[35046] = {
		trans_use_gold = 0,
		next = 0,
		base = 35040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 35045,
		id = 35046,
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
	[35100] = {
		important = 1,
		destory_gold = 4,
		type = 5,
		group = 35100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 35101,
		prev = 0,
		id = 35100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17021,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[35101] = {
		trans_use_gold = 60,
		next = 35102,
		base = 35100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 35100,
		id = 35101,
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
			}
		},
		restore_item = {
			{
				17021,
				1
			}
		}
	},
	[35102] = {
		trans_use_gold = 100,
		next = 35103,
		base = 35100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 35101,
		id = 35102,
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
			}
		},
		restore_item = {
			{
				17021,
				4
			}
		}
	},
	[35103] = {
		trans_use_gold = 0,
		next = 0,
		base = 35100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 35102,
		id = 35103,
		level = 4,
		trans_use_item = {},
		destory_item = {
			{
				17021,
				3
			}
		},
		restore_item = {
			{
				17021,
				9
			}
		}
	},
	[35120] = {
		important = 1,
		destory_gold = 9,
		type = 5,
		group = 35120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 35121,
		prev = 0,
		id = 35120,
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
		restore_item = {}
	},
	[35121] = {
		trans_use_gold = 60,
		next = 35122,
		base = 35120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 35120,
		id = 35121,
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
	[35122] = {
		trans_use_gold = 100,
		next = 35123,
		base = 35120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 35121,
		id = 35122,
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
	[35123] = {
		trans_use_gold = 160,
		next = 35124,
		base = 35120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 35122,
		id = 35123,
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
	[35124] = {
		trans_use_gold = 220,
		next = 35125,
		base = 35120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 35123,
		id = 35124,
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
	[35125] = {
		trans_use_gold = 280,
		next = 35126,
		base = 35120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 35124,
		id = 35125,
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
	[35126] = {
		trans_use_gold = 0,
		next = 0,
		base = 35120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 35125,
		id = 35126,
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
	[35140] = {
		important = 1,
		destory_gold = 16,
		type = 5,
		group = 35140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 35141,
		prev = 0,
		id = 35140,
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
		restore_item = {}
	},
	[35141] = {
		trans_use_gold = 60,
		next = 35142,
		base = 35140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 35140,
		id = 35141,
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
	[35142] = {
		trans_use_gold = 100,
		next = 35143,
		base = 35140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 35141,
		id = 35142,
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
	[35143] = {
		trans_use_gold = 160,
		next = 35144,
		base = 35140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 35142,
		id = 35143,
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
	[35144] = {
		trans_use_gold = 220,
		next = 35145,
		base = 35140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 35143,
		id = 35144,
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
	[35145] = {
		trans_use_gold = 280,
		next = 35146,
		base = 35140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 35144,
		id = 35145,
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
	[35146] = {
		trans_use_gold = 360,
		next = 35147,
		base = 35140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 35145,
		id = 35146,
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
	[35147] = {
		trans_use_gold = 440,
		next = 35148,
		base = 35140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 35146,
		id = 35147,
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
	[35148] = {
		trans_use_gold = 520,
		next = 35149,
		base = 35140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 35147,
		id = 35148,
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
	[35149] = {
		trans_use_gold = 600,
		next = 35150,
		base = 35140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 35148,
		id = 35149,
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
	[35150] = {
		trans_use_gold = 0,
		next = 0,
		base = 35140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 35149,
		id = 35150,
		level = 11,
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
	[35200] = {
		important = 1,
		destory_gold = 9,
		type = 5,
		group = 35200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 35201,
		prev = 0,
		id = 35200,
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
		restore_item = {}
	},
	[35201] = {
		trans_use_gold = 60,
		next = 35202,
		base = 35200,
		restore_gold = 20,
		destory_gold = 14,
		prev = 35200,
		id = 35201,
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
	[35202] = {
		trans_use_gold = 100,
		next = 35203,
		base = 35200,
		restore_gold = 80,
		destory_gold = 29,
		prev = 35201,
		id = 35202,
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
	[35203] = {
		trans_use_gold = 160,
		next = 35204,
		base = 35200,
		restore_gold = 180,
		destory_gold = 54,
		prev = 35202,
		id = 35203,
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
	[35204] = {
		trans_use_gold = 220,
		next = 35205,
		base = 35200,
		restore_gold = 340,
		destory_gold = 94,
		prev = 35203,
		id = 35204,
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
	[35205] = {
		trans_use_gold = 280,
		next = 35206,
		base = 35200,
		restore_gold = 560,
		destory_gold = 149,
		prev = 35204,
		id = 35205,
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
	[35206] = {
		trans_use_gold = 0,
		next = 0,
		base = 35200,
		restore_gold = 840,
		destory_gold = 219,
		prev = 35205,
		id = 35206,
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
	[35220] = {
		important = 1,
		destory_gold = 16,
		type = 5,
		group = 35220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 35221,
		prev = 0,
		id = 35220,
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
		restore_item = {}
	},
	[35221] = {
		trans_use_gold = 60,
		next = 35222,
		base = 35220,
		restore_gold = 20,
		destory_gold = 21,
		prev = 35220,
		id = 35221,
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
	[35222] = {
		trans_use_gold = 100,
		next = 35223,
		base = 35220,
		restore_gold = 80,
		destory_gold = 36,
		prev = 35221,
		id = 35222,
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
	[35223] = {
		trans_use_gold = 160,
		next = 35224,
		base = 35220,
		restore_gold = 180,
		destory_gold = 61,
		prev = 35222,
		id = 35223,
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
	[35224] = {
		trans_use_gold = 220,
		next = 35225,
		base = 35220,
		restore_gold = 340,
		destory_gold = 101,
		prev = 35223,
		id = 35224,
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
	[35225] = {
		trans_use_gold = 280,
		next = 35226,
		base = 35220,
		restore_gold = 560,
		destory_gold = 156,
		prev = 35224,
		id = 35225,
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
	[35226] = {
		trans_use_gold = 360,
		next = 35227,
		base = 35220,
		restore_gold = 840,
		destory_gold = 226,
		prev = 35225,
		id = 35226,
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
	[35227] = {
		trans_use_gold = 440,
		next = 35228,
		base = 35220,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 35226,
		id = 35227,
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
	[35228] = {
		trans_use_gold = 520,
		next = 35229,
		base = 35220,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 35227,
		id = 35228,
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
	[35229] = {
		trans_use_gold = 600,
		next = 35230,
		base = 35220,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 35228,
		id = 35229,
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
	[35230] = {
		trans_use_gold = 0,
		next = 0,
		base = 35220,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 35229,
		id = 35230,
		level = 11,
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
	[35240] = {
		important = 1,
		destory_gold = 25,
		type = 5,
		group = 35240,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 35241,
		prev = 0,
		id = 35240,
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
		restore_item = {}
	},
	[35241] = {
		trans_use_gold = 90,
		next = 35242,
		base = 35240,
		restore_gold = 20,
		destory_gold = 33,
		prev = 35240,
		id = 35241,
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
				1
			}
		}
	},
	[35242] = {
		trans_use_gold = 150,
		next = 35243,
		base = 35240,
		restore_gold = 80,
		destory_gold = 55,
		prev = 35241,
		id = 35242,
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
				4
			}
		}
	},
	[35243] = {
		trans_use_gold = 240,
		next = 35244,
		base = 35240,
		restore_gold = 180,
		destory_gold = 93,
		prev = 35242,
		id = 35243,
		level = 4,
		trans_use_item = {
			{
				17022,
				12
			}
		},
		destory_item = {
			{
				17021,
				4
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
	[35244] = {
		trans_use_gold = 330,
		next = 35245,
		base = 35240,
		restore_gold = 340,
		destory_gold = 153,
		prev = 35243,
		id = 35244,
		level = 5,
		trans_use_item = {
			{
				17022,
				16
			}
		},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
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
			},
			{
				17022,
				8
			}
		}
	},
	[35245] = {
		trans_use_gold = 420,
		next = 35246,
		base = 35240,
		restore_gold = 560,
		destory_gold = 235,
		prev = 35244,
		id = 35245,
		level = 6,
		trans_use_item = {
			{
				17022,
				21
			}
		},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
				7
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
	[35246] = {
		trans_use_gold = 540,
		next = 35247,
		base = 35240,
		restore_gold = 840,
		destory_gold = 340,
		prev = 35245,
		id = 35246,
		level = 7,
		trans_use_item = {
			{
				17023,
				27
			}
		},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
				12
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
	[35247] = {
		trans_use_gold = 660,
		next = 35248,
		base = 35240,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 35246,
		id = 35247,
		level = 8,
		trans_use_item = {
			{
				17023,
				33
			}
		},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
				12
			},
			{
				17023,
				7
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
	[35248] = {
		trans_use_gold = 780,
		next = 35249,
		base = 35240,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 35247,
		id = 35248,
		level = 9,
		trans_use_item = {
			{
				17023,
				39
			}
		},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
				12
			},
			{
				17023,
				15
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
	[35249] = {
		trans_use_gold = 900,
		next = 35250,
		base = 35240,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 35248,
		id = 35249,
		level = 10,
		trans_use_item = {
			{
				17023,
				45
			}
		},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
				12
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
				66
			}
		}
	},
	[35250] = {
		trans_use_gold = 0,
		next = 0,
		base = 35240,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 35249,
		id = 35250,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17021,
				4
			},
			{
				17022,
				12
			},
			{
				17023,
				36
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
	[36100] = {
		important = 1,
		destory_gold = 1,
		type = 6,
		group = 36100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36101,
		prev = 0,
		id = 36100,
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
		restore_item = {}
	},
	[36101] = {
		trans_use_gold = 60,
		next = 36102,
		base = 36100,
		restore_gold = 20,
		destory_gold = 6,
		prev = 36100,
		id = 36101,
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
	[36102] = {
		trans_use_gold = 100,
		next = 36103,
		base = 36100,
		restore_gold = 80,
		destory_gold = 21,
		prev = 36101,
		id = 36102,
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
	[36103] = {
		trans_use_gold = 0,
		next = 0,
		base = 36100,
		restore_gold = 180,
		destory_gold = 46,
		prev = 36102,
		id = 36103,
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
	[36120] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 36120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36121,
		prev = 0,
		id = 36120,
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
		restore_item = {}
	},
	[36121] = {
		trans_use_gold = 60,
		next = 36122,
		base = 36120,
		restore_gold = 20,
		destory_gold = 9,
		prev = 36120,
		id = 36121,
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
	[36122] = {
		trans_use_gold = 100,
		next = 36123,
		base = 36120,
		restore_gold = 80,
		destory_gold = 24,
		prev = 36121,
		id = 36122,
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
	[36123] = {
		trans_use_gold = 0,
		next = 0,
		base = 36120,
		restore_gold = 180,
		destory_gold = 49,
		prev = 36122,
		id = 36123,
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
	[36140] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 36140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36141,
		prev = 0,
		id = 36140,
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
		restore_item = {}
	},
	[36141] = {
		trans_use_gold = 60,
		next = 36142,
		base = 36140,
		restore_gold = 20,
		destory_gold = 14,
		prev = 36140,
		id = 36141,
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
	[36142] = {
		trans_use_gold = 100,
		next = 36143,
		base = 36140,
		restore_gold = 80,
		destory_gold = 29,
		prev = 36141,
		id = 36142,
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
	[36143] = {
		trans_use_gold = 160,
		next = 36144,
		base = 36140,
		restore_gold = 180,
		destory_gold = 54,
		prev = 36142,
		id = 36143,
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
	[36144] = {
		trans_use_gold = 220,
		next = 36145,
		base = 36140,
		restore_gold = 340,
		destory_gold = 94,
		prev = 36143,
		id = 36144,
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
	[36145] = {
		trans_use_gold = 280,
		next = 36146,
		base = 36140,
		restore_gold = 560,
		destory_gold = 149,
		prev = 36144,
		id = 36145,
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
	[36146] = {
		trans_use_gold = 0,
		next = 0,
		base = 36140,
		restore_gold = 840,
		destory_gold = 219,
		prev = 36145,
		id = 36146,
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
	[36200] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 36200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36201,
		prev = 0,
		id = 36200,
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
		restore_item = {}
	},
	[36201] = {
		trans_use_gold = 60,
		next = 36202,
		base = 36200,
		restore_gold = 20,
		destory_gold = 9,
		prev = 36200,
		id = 36201,
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
	[36202] = {
		trans_use_gold = 100,
		next = 36203,
		base = 36200,
		restore_gold = 80,
		destory_gold = 24,
		prev = 36201,
		id = 36202,
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
	[36203] = {
		trans_use_gold = 0,
		next = 0,
		base = 36200,
		restore_gold = 180,
		destory_gold = 49,
		prev = 36202,
		id = 36203,
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
	[36220] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 36220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36221,
		prev = 0,
		id = 36220,
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
		restore_item = {}
	},
	[36221] = {
		trans_use_gold = 60,
		next = 36222,
		base = 36220,
		restore_gold = 20,
		destory_gold = 14,
		prev = 36220,
		id = 36221,
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
	[36222] = {
		trans_use_gold = 100,
		next = 36223,
		base = 36220,
		restore_gold = 80,
		destory_gold = 29,
		prev = 36221,
		id = 36222,
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
	[36223] = {
		trans_use_gold = 160,
		next = 36224,
		base = 36220,
		restore_gold = 180,
		destory_gold = 54,
		prev = 36222,
		id = 36223,
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
	[36224] = {
		trans_use_gold = 220,
		next = 36225,
		base = 36220,
		restore_gold = 340,
		destory_gold = 94,
		prev = 36223,
		id = 36224,
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
	[36225] = {
		trans_use_gold = 280,
		next = 36226,
		base = 36220,
		restore_gold = 560,
		destory_gold = 149,
		prev = 36224,
		id = 36225,
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
	[36226] = {
		trans_use_gold = 0,
		next = 0,
		base = 36220,
		restore_gold = 840,
		destory_gold = 219,
		prev = 36225,
		id = 36226,
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
	[36240] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 36240,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36241,
		prev = 0,
		id = 36240,
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
		restore_item = {}
	},
	[36241] = {
		trans_use_gold = 60,
		next = 36242,
		base = 36240,
		restore_gold = 20,
		destory_gold = 21,
		prev = 36240,
		id = 36241,
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
	[36242] = {
		trans_use_gold = 100,
		next = 36243,
		base = 36240,
		restore_gold = 80,
		destory_gold = 36,
		prev = 36241,
		id = 36242,
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
	[36243] = {
		trans_use_gold = 160,
		next = 36244,
		base = 36240,
		restore_gold = 180,
		destory_gold = 61,
		prev = 36242,
		id = 36243,
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
	[36244] = {
		trans_use_gold = 220,
		next = 36245,
		base = 36240,
		restore_gold = 340,
		destory_gold = 101,
		prev = 36243,
		id = 36244,
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
	[36245] = {
		trans_use_gold = 280,
		next = 36246,
		base = 36240,
		restore_gold = 560,
		destory_gold = 156,
		prev = 36244,
		id = 36245,
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
	[36246] = {
		trans_use_gold = 360,
		next = 36247,
		base = 36240,
		restore_gold = 840,
		destory_gold = 226,
		prev = 36245,
		id = 36246,
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
	[36247] = {
		trans_use_gold = 440,
		next = 36248,
		base = 36240,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 36246,
		id = 36247,
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
	[36248] = {
		trans_use_gold = 520,
		next = 36249,
		base = 36240,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 36247,
		id = 36248,
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
	[36249] = {
		trans_use_gold = 600,
		next = 36250,
		base = 36240,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 36248,
		id = 36249,
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
	[36250] = {
		trans_use_gold = 0,
		next = 0,
		base = 36240,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 36249,
		id = 36250,
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
	[36300] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 36300,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36301,
		prev = 0,
		id = 36300,
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
		restore_item = {}
	},
	[36301] = {
		trans_use_gold = 60,
		next = 36302,
		base = 36300,
		restore_gold = 20,
		destory_gold = 9,
		prev = 36300,
		id = 36301,
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
	[36302] = {
		trans_use_gold = 100,
		next = 36303,
		base = 36300,
		restore_gold = 80,
		destory_gold = 24,
		prev = 36301,
		id = 36302,
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
	[36303] = {
		trans_use_gold = 0,
		next = 0,
		base = 36300,
		restore_gold = 180,
		destory_gold = 49,
		prev = 36302,
		id = 36303,
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
	[36320] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 36320,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36321,
		prev = 0,
		id = 36320,
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
		restore_item = {}
	},
	[36321] = {
		trans_use_gold = 60,
		next = 36322,
		base = 36320,
		restore_gold = 20,
		destory_gold = 14,
		prev = 36320,
		id = 36321,
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
	[36322] = {
		trans_use_gold = 100,
		next = 36323,
		base = 36320,
		restore_gold = 80,
		destory_gold = 29,
		prev = 36321,
		id = 36322,
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
	[36323] = {
		trans_use_gold = 160,
		next = 36324,
		base = 36320,
		restore_gold = 180,
		destory_gold = 54,
		prev = 36322,
		id = 36323,
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
	[36324] = {
		trans_use_gold = 220,
		next = 36325,
		base = 36320,
		restore_gold = 340,
		destory_gold = 94,
		prev = 36323,
		id = 36324,
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
	[36325] = {
		trans_use_gold = 280,
		next = 36326,
		base = 36320,
		restore_gold = 560,
		destory_gold = 149,
		prev = 36324,
		id = 36325,
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
	[36326] = {
		trans_use_gold = 0,
		next = 0,
		base = 36320,
		restore_gold = 840,
		destory_gold = 219,
		prev = 36325,
		id = 36326,
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
	[36340] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 36340,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36341,
		prev = 0,
		id = 36340,
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
		restore_item = {}
	},
	[36341] = {
		trans_use_gold = 60,
		next = 36342,
		base = 36340,
		restore_gold = 20,
		destory_gold = 21,
		prev = 36340,
		id = 36341,
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
	[36342] = {
		trans_use_gold = 100,
		next = 36343,
		base = 36340,
		restore_gold = 80,
		destory_gold = 36,
		prev = 36341,
		id = 36342,
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
	[36343] = {
		trans_use_gold = 160,
		next = 36344,
		base = 36340,
		restore_gold = 180,
		destory_gold = 61,
		prev = 36342,
		id = 36343,
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
	[36344] = {
		trans_use_gold = 220,
		next = 36345,
		base = 36340,
		restore_gold = 340,
		destory_gold = 101,
		prev = 36343,
		id = 36344,
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
	[36345] = {
		trans_use_gold = 280,
		next = 36346,
		base = 36340,
		restore_gold = 560,
		destory_gold = 156,
		prev = 36344,
		id = 36345,
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
	[36346] = {
		trans_use_gold = 360,
		next = 36347,
		base = 36340,
		restore_gold = 840,
		destory_gold = 226,
		prev = 36345,
		id = 36346,
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
	[36347] = {
		trans_use_gold = 440,
		next = 36348,
		base = 36340,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 36346,
		id = 36347,
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
	[36348] = {
		trans_use_gold = 520,
		next = 36349,
		base = 36340,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 36347,
		id = 36348,
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
	[36349] = {
		trans_use_gold = 600,
		next = 36350,
		base = 36340,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 36348,
		id = 36349,
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
	[36350] = {
		trans_use_gold = 0,
		next = 0,
		base = 36340,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 36349,
		id = 36350,
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
	[36400] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 36400,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36401,
		prev = 0,
		id = 36400,
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
		restore_item = {}
	},
	[36401] = {
		trans_use_gold = 60,
		next = 36402,
		base = 36400,
		restore_gold = 20,
		destory_gold = 9,
		prev = 36400,
		id = 36401,
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
	[36402] = {
		trans_use_gold = 100,
		next = 36403,
		base = 36400,
		restore_gold = 80,
		destory_gold = 24,
		prev = 36401,
		id = 36402,
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
	[36403] = {
		trans_use_gold = 0,
		next = 0,
		base = 36400,
		restore_gold = 180,
		destory_gold = 49,
		prev = 36402,
		id = 36403,
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
	[36420] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 36420,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36421,
		prev = 0,
		id = 36420,
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
		restore_item = {}
	},
	[36421] = {
		trans_use_gold = 60,
		next = 36422,
		base = 36420,
		restore_gold = 20,
		destory_gold = 14,
		prev = 36420,
		id = 36421,
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
	[36422] = {
		trans_use_gold = 100,
		next = 36423,
		base = 36420,
		restore_gold = 80,
		destory_gold = 29,
		prev = 36421,
		id = 36422,
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
	[36423] = {
		trans_use_gold = 160,
		next = 36424,
		base = 36420,
		restore_gold = 180,
		destory_gold = 54,
		prev = 36422,
		id = 36423,
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
	[36424] = {
		trans_use_gold = 220,
		next = 36425,
		base = 36420,
		restore_gold = 340,
		destory_gold = 94,
		prev = 36423,
		id = 36424,
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
	[36425] = {
		trans_use_gold = 280,
		next = 36426,
		base = 36420,
		restore_gold = 560,
		destory_gold = 149,
		prev = 36424,
		id = 36425,
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
	[36426] = {
		trans_use_gold = 0,
		next = 0,
		base = 36420,
		restore_gold = 840,
		destory_gold = 219,
		prev = 36425,
		id = 36426,
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
	[36440] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 36440,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36441,
		prev = 0,
		id = 36440,
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
		restore_item = {}
	},
	[36441] = {
		trans_use_gold = 60,
		next = 36442,
		base = 36440,
		restore_gold = 20,
		destory_gold = 21,
		prev = 36440,
		id = 36441,
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
	[36442] = {
		trans_use_gold = 100,
		next = 36443,
		base = 36440,
		restore_gold = 80,
		destory_gold = 36,
		prev = 36441,
		id = 36442,
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
	[36443] = {
		trans_use_gold = 160,
		next = 36444,
		base = 36440,
		restore_gold = 180,
		destory_gold = 61,
		prev = 36442,
		id = 36443,
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
	[36444] = {
		trans_use_gold = 220,
		next = 36445,
		base = 36440,
		restore_gold = 340,
		destory_gold = 101,
		prev = 36443,
		id = 36444,
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
	[36445] = {
		trans_use_gold = 280,
		next = 36446,
		base = 36440,
		restore_gold = 560,
		destory_gold = 156,
		prev = 36444,
		id = 36445,
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
	[36446] = {
		trans_use_gold = 360,
		next = 36447,
		base = 36440,
		restore_gold = 840,
		destory_gold = 226,
		prev = 36445,
		id = 36446,
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
	[36447] = {
		trans_use_gold = 440,
		next = 36448,
		base = 36440,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 36446,
		id = 36447,
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
	[36448] = {
		trans_use_gold = 520,
		next = 36449,
		base = 36440,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 36447,
		id = 36448,
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
	[36449] = {
		trans_use_gold = 600,
		next = 36450,
		base = 36440,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 36448,
		id = 36449,
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
	[36450] = {
		trans_use_gold = 0,
		next = 0,
		base = 36440,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 36449,
		id = 36450,
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
	[36500] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 36500,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36501,
		prev = 0,
		id = 36500,
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
		restore_item = {}
	},
	[36501] = {
		trans_use_gold = 60,
		next = 36502,
		base = 36500,
		restore_gold = 20,
		destory_gold = 9,
		prev = 36500,
		id = 36501,
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
	[36502] = {
		trans_use_gold = 100,
		next = 36503,
		base = 36500,
		restore_gold = 80,
		destory_gold = 24,
		prev = 36501,
		id = 36502,
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
	[36503] = {
		trans_use_gold = 0,
		next = 0,
		base = 36500,
		restore_gold = 180,
		destory_gold = 49,
		prev = 36502,
		id = 36503,
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
	[36520] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 36520,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36521,
		prev = 0,
		id = 36520,
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
		restore_item = {}
	},
	[36521] = {
		trans_use_gold = 60,
		next = 36522,
		base = 36520,
		restore_gold = 20,
		destory_gold = 14,
		prev = 36520,
		id = 36521,
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
	[36522] = {
		trans_use_gold = 100,
		next = 36523,
		base = 36520,
		restore_gold = 80,
		destory_gold = 29,
		prev = 36521,
		id = 36522,
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
	[36523] = {
		trans_use_gold = 160,
		next = 36524,
		base = 36520,
		restore_gold = 180,
		destory_gold = 54,
		prev = 36522,
		id = 36523,
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
	[36524] = {
		trans_use_gold = 220,
		next = 36525,
		base = 36520,
		restore_gold = 340,
		destory_gold = 94,
		prev = 36523,
		id = 36524,
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
	[36525] = {
		trans_use_gold = 280,
		next = 36526,
		base = 36520,
		restore_gold = 560,
		destory_gold = 149,
		prev = 36524,
		id = 36525,
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
	[36526] = {
		trans_use_gold = 0,
		next = 0,
		base = 36520,
		restore_gold = 840,
		destory_gold = 219,
		prev = 36525,
		id = 36526,
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
	[36540] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 36540,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36541,
		prev = 0,
		id = 36540,
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
		restore_item = {}
	},
	[36541] = {
		trans_use_gold = 60,
		next = 36542,
		base = 36540,
		restore_gold = 20,
		destory_gold = 21,
		prev = 36540,
		id = 36541,
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
	[36542] = {
		trans_use_gold = 100,
		next = 36543,
		base = 36540,
		restore_gold = 80,
		destory_gold = 36,
		prev = 36541,
		id = 36542,
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
	[36543] = {
		trans_use_gold = 160,
		next = 36544,
		base = 36540,
		restore_gold = 180,
		destory_gold = 61,
		prev = 36542,
		id = 36543,
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
	[36544] = {
		trans_use_gold = 220,
		next = 36545,
		base = 36540,
		restore_gold = 340,
		destory_gold = 101,
		prev = 36543,
		id = 36544,
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
	[36545] = {
		trans_use_gold = 280,
		next = 36546,
		base = 36540,
		restore_gold = 560,
		destory_gold = 156,
		prev = 36544,
		id = 36545,
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
	[36546] = {
		trans_use_gold = 360,
		next = 36547,
		base = 36540,
		restore_gold = 840,
		destory_gold = 226,
		prev = 36545,
		id = 36546,
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
	[36547] = {
		trans_use_gold = 440,
		next = 36548,
		base = 36540,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 36546,
		id = 36547,
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
	[36548] = {
		trans_use_gold = 520,
		next = 36549,
		base = 36540,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 36547,
		id = 36548,
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
	[36549] = {
		trans_use_gold = 600,
		next = 36550,
		base = 36540,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 36548,
		id = 36549,
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
	[36550] = {
		trans_use_gold = 0,
		next = 0,
		base = 36540,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 36549,
		id = 36550,
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
	[36600] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 36600,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36601,
		prev = 0,
		id = 36600,
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
		restore_item = {}
	},
	[36601] = {
		trans_use_gold = 60,
		next = 36602,
		base = 36600,
		restore_gold = 20,
		destory_gold = 9,
		prev = 36600,
		id = 36601,
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
	[36602] = {
		trans_use_gold = 100,
		next = 36603,
		base = 36600,
		restore_gold = 80,
		destory_gold = 24,
		prev = 36601,
		id = 36602,
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
	[36603] = {
		trans_use_gold = 0,
		next = 0,
		base = 36600,
		restore_gold = 180,
		destory_gold = 49,
		prev = 36602,
		id = 36603,
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
	[36620] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 36620,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36621,
		prev = 0,
		id = 36620,
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
		restore_item = {}
	},
	[36621] = {
		trans_use_gold = 60,
		next = 36622,
		base = 36620,
		restore_gold = 20,
		destory_gold = 14,
		prev = 36620,
		id = 36621,
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
	[36622] = {
		trans_use_gold = 100,
		next = 36623,
		base = 36620,
		restore_gold = 80,
		destory_gold = 29,
		prev = 36621,
		id = 36622,
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
	[36623] = {
		trans_use_gold = 160,
		next = 36624,
		base = 36620,
		restore_gold = 180,
		destory_gold = 54,
		prev = 36622,
		id = 36623,
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
	[36624] = {
		trans_use_gold = 220,
		next = 36625,
		base = 36620,
		restore_gold = 340,
		destory_gold = 94,
		prev = 36623,
		id = 36624,
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
	[36625] = {
		trans_use_gold = 280,
		next = 36626,
		base = 36620,
		restore_gold = 560,
		destory_gold = 149,
		prev = 36624,
		id = 36625,
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
	[36626] = {
		trans_use_gold = 0,
		next = 0,
		base = 36620,
		restore_gold = 840,
		destory_gold = 219,
		prev = 36625,
		id = 36626,
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
	[36640] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 36640,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 36641,
		prev = 0,
		id = 36640,
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
		restore_item = {}
	},
	[36641] = {
		trans_use_gold = 60,
		next = 36642,
		base = 36640,
		restore_gold = 20,
		destory_gold = 21,
		prev = 36640,
		id = 36641,
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
	[36642] = {
		trans_use_gold = 100,
		next = 36643,
		base = 36640,
		restore_gold = 80,
		destory_gold = 36,
		prev = 36641,
		id = 36642,
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
	[36643] = {
		trans_use_gold = 160,
		next = 36644,
		base = 36640,
		restore_gold = 180,
		destory_gold = 61,
		prev = 36642,
		id = 36643,
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
	[36644] = {
		trans_use_gold = 220,
		next = 36645,
		base = 36640,
		restore_gold = 340,
		destory_gold = 101,
		prev = 36643,
		id = 36644,
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
	[36645] = {
		trans_use_gold = 280,
		next = 36646,
		base = 36640,
		restore_gold = 560,
		destory_gold = 156,
		prev = 36644,
		id = 36645,
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
	[36646] = {
		trans_use_gold = 360,
		next = 36647,
		base = 36640,
		restore_gold = 840,
		destory_gold = 226,
		prev = 36645,
		id = 36646,
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
	[36647] = {
		trans_use_gold = 440,
		next = 36648,
		base = 36640,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 36646,
		id = 36647,
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
	[36648] = {
		trans_use_gold = 520,
		next = 36649,
		base = 36640,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 36647,
		id = 36648,
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
	[36649] = {
		trans_use_gold = 600,
		next = 36650,
		base = 36640,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 36648,
		id = 36649,
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
	[36650] = {
		trans_use_gold = 0,
		next = 0,
		base = 36640,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 36649,
		id = 36650,
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
	[37000] = {
		important = 1,
		destory_gold = 1,
		type = 7,
		group = 37000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 37001,
		prev = 0,
		id = 37000,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[37001] = {
		trans_use_gold = 60,
		next = 37002,
		base = 37000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 37000,
		id = 37001,
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
	[37002] = {
		trans_use_gold = 100,
		next = 37003,
		base = 37000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 37001,
		id = 37002,
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
	[37003] = {
		trans_use_gold = 0,
		next = 0,
		base = 37000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 37002,
		id = 37003,
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
	[37020] = {
		important = 1,
		destory_gold = 4,
		type = 7,
		group = 37020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 37021,
		prev = 0,
		id = 37020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[37021] = {
		trans_use_gold = 60,
		next = 37022,
		base = 37020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 37020,
		id = 37021,
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
	[37022] = {
		trans_use_gold = 100,
		next = 37023,
		base = 37020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 37021,
		id = 37022,
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
	[37023] = {
		trans_use_gold = 0,
		next = 0,
		base = 37020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 37022,
		id = 37023,
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
	[37040] = {
		important = 1,
		destory_gold = 9,
		type = 7,
		group = 37040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 37041,
		prev = 0,
		id = 37040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[37041] = {
		trans_use_gold = 60,
		next = 37042,
		base = 37040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 37040,
		id = 37041,
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
	[37042] = {
		trans_use_gold = 100,
		next = 37043,
		base = 37040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 37041,
		id = 37042,
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
	[37043] = {
		trans_use_gold = 160,
		next = 37044,
		base = 37040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 37042,
		id = 37043,
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
	[37044] = {
		trans_use_gold = 220,
		next = 37045,
		base = 37040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 37043,
		id = 37044,
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
	[37045] = {
		trans_use_gold = 280,
		next = 37046,
		base = 37040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 37044,
		id = 37045,
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
	[37046] = {
		trans_use_gold = 0,
		next = 0,
		base = 37040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 37045,
		id = 37046,
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
	[37100] = {
		important = 1,
		destory_gold = 4,
		type = 7,
		group = 37100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 37101,
		prev = 0,
		id = 37100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[37101] = {
		trans_use_gold = 60,
		next = 37102,
		base = 37100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 37100,
		id = 37101,
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
	[37102] = {
		trans_use_gold = 100,
		next = 37103,
		base = 37100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 37101,
		id = 37102,
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
	[37103] = {
		trans_use_gold = 0,
		next = 0,
		base = 37100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 37102,
		id = 37103,
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
	[37120] = {
		important = 1,
		destory_gold = 9,
		type = 7,
		group = 37120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 37121,
		prev = 0,
		id = 37120,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[37121] = {
		trans_use_gold = 60,
		next = 37122,
		base = 37120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 37120,
		id = 37121,
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
	[37122] = {
		trans_use_gold = 100,
		next = 37123,
		base = 37120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 37121,
		id = 37122,
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
	[37123] = {
		trans_use_gold = 160,
		next = 37124,
		base = 37120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 37122,
		id = 37123,
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
	[37124] = {
		trans_use_gold = 220,
		next = 37125,
		base = 37120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 37123,
		id = 37124,
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
	[37125] = {
		trans_use_gold = 280,
		next = 37126,
		base = 37120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 37124,
		id = 37125,
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
	[37126] = {
		trans_use_gold = 0,
		next = 0,
		base = 37120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 37125,
		id = 37126,
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
	[37140] = {
		important = 1,
		destory_gold = 16,
		type = 7,
		group = 37140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 37141,
		prev = 0,
		id = 37140,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[37141] = {
		trans_use_gold = 60,
		next = 37142,
		base = 37140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 37140,
		id = 37141,
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
	[37142] = {
		trans_use_gold = 100,
		next = 37143,
		base = 37140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 37141,
		id = 37142,
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
	[37143] = {
		trans_use_gold = 160,
		next = 37144,
		base = 37140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 37142,
		id = 37143,
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
	[37144] = {
		trans_use_gold = 220,
		next = 37145,
		base = 37140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 37143,
		id = 37144,
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
	[37145] = {
		trans_use_gold = 280,
		next = 37146,
		base = 37140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 37144,
		id = 37145,
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
	[37146] = {
		trans_use_gold = 360,
		next = 37147,
		base = 37140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 37145,
		id = 37146,
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
	[37147] = {
		trans_use_gold = 440,
		next = 37148,
		base = 37140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 37146,
		id = 37147,
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
	[37148] = {
		trans_use_gold = 520,
		next = 37149,
		base = 37140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 37147,
		id = 37148,
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
	[37149] = {
		trans_use_gold = 600,
		next = 37150,
		base = 37140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 37148,
		id = 37149,
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
	[37150] = {
		trans_use_gold = 0,
		next = 0,
		base = 37140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 37149,
		id = 37150,
		level = 11,
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
	[37200] = {
		important = 1,
		destory_gold = 9,
		type = 7,
		group = 37200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 37201,
		prev = 0,
		id = 37200,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[37201] = {
		trans_use_gold = 60,
		next = 37202,
		base = 37200,
		restore_gold = 20,
		destory_gold = 14,
		prev = 37200,
		id = 37201,
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
	[37202] = {
		trans_use_gold = 100,
		next = 37203,
		base = 37200,
		restore_gold = 80,
		destory_gold = 29,
		prev = 37201,
		id = 37202,
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
	[37203] = {
		trans_use_gold = 160,
		next = 37204,
		base = 37200,
		restore_gold = 180,
		destory_gold = 54,
		prev = 37202,
		id = 37203,
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
	[37204] = {
		trans_use_gold = 220,
		next = 37205,
		base = 37200,
		restore_gold = 340,
		destory_gold = 94,
		prev = 37203,
		id = 37204,
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
	[37205] = {
		trans_use_gold = 280,
		next = 37206,
		base = 37200,
		restore_gold = 560,
		destory_gold = 149,
		prev = 37204,
		id = 37205,
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
	[37206] = {
		trans_use_gold = 0,
		next = 0,
		base = 37200,
		restore_gold = 840,
		destory_gold = 219,
		prev = 37205,
		id = 37206,
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
	[37220] = {
		important = 1,
		destory_gold = 16,
		type = 7,
		group = 37220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 37221,
		prev = 0,
		id = 37220,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[37221] = {
		trans_use_gold = 60,
		next = 37222,
		base = 37220,
		restore_gold = 20,
		destory_gold = 21,
		prev = 37220,
		id = 37221,
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
	[37222] = {
		trans_use_gold = 100,
		next = 37223,
		base = 37220,
		restore_gold = 80,
		destory_gold = 36,
		prev = 37221,
		id = 37222,
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
	[37223] = {
		trans_use_gold = 160,
		next = 37224,
		base = 37220,
		restore_gold = 180,
		destory_gold = 61,
		prev = 37222,
		id = 37223,
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
	[37224] = {
		trans_use_gold = 220,
		next = 37225,
		base = 37220,
		restore_gold = 340,
		destory_gold = 101,
		prev = 37223,
		id = 37224,
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
	[37225] = {
		trans_use_gold = 280,
		next = 37226,
		base = 37220,
		restore_gold = 560,
		destory_gold = 156,
		prev = 37224,
		id = 37225,
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
	[37226] = {
		trans_use_gold = 360,
		next = 37227,
		base = 37220,
		restore_gold = 840,
		destory_gold = 226,
		prev = 37225,
		id = 37226,
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
	[37227] = {
		trans_use_gold = 440,
		next = 37228,
		base = 37220,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 37226,
		id = 37227,
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
	[37228] = {
		trans_use_gold = 520,
		next = 37229,
		base = 37220,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 37227,
		id = 37228,
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
	[37229] = {
		trans_use_gold = 600,
		next = 37230,
		base = 37220,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 37228,
		id = 37229,
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
	[37230] = {
		trans_use_gold = 0,
		next = 0,
		base = 37220,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 37229,
		id = 37230,
		level = 11,
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
	[37240] = {
		important = 1,
		destory_gold = 25,
		type = 7,
		group = 37240,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 37241,
		prev = 0,
		id = 37240,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				2
			}
		},
		destory_item = {
			{
				17043,
				1
			}
		},
		restore_item = {}
	},
	[37241] = {
		trans_use_gold = 90,
		next = 37242,
		base = 37240,
		restore_gold = 20,
		destory_gold = 33,
		prev = 37240,
		id = 37241,
		level = 2,
		trans_use_item = {
			{
				17041,
				5
			}
		},
		destory_item = {
			{
				17041,
				1
			},
			{
				17043,
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
	[37242] = {
		trans_use_gold = 150,
		next = 37243,
		base = 37240,
		restore_gold = 80,
		destory_gold = 55,
		prev = 37241,
		id = 37242,
		level = 3,
		trans_use_item = {
			{
				17041,
				8
			}
		},
		destory_item = {
			{
				17041,
				2
			},
			{
				17043,
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
	[37243] = {
		trans_use_gold = 240,
		next = 37244,
		base = 37240,
		restore_gold = 180,
		destory_gold = 93,
		prev = 37242,
		id = 37243,
		level = 4,
		trans_use_item = {
			{
				17042,
				12
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17043,
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
	[37244] = {
		trans_use_gold = 330,
		next = 37245,
		base = 37240,
		restore_gold = 340,
		destory_gold = 153,
		prev = 37243,
		id = 37244,
		level = 5,
		trans_use_item = {
			{
				17042,
				16
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				3
			},
			{
				17043,
				1
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
	[37245] = {
		trans_use_gold = 420,
		next = 37246,
		base = 37240,
		restore_gold = 560,
		destory_gold = 235,
		prev = 37244,
		id = 37245,
		level = 6,
		trans_use_item = {
			{
				17042,
				21
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				7
			},
			{
				17043,
				1
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
	[37246] = {
		trans_use_gold = 540,
		next = 37247,
		base = 37240,
		restore_gold = 840,
		destory_gold = 340,
		prev = 37245,
		id = 37246,
		level = 7,
		trans_use_item = {
			{
				17043,
				27
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				1
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
	[37247] = {
		trans_use_gold = 660,
		next = 37248,
		base = 37240,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 37246,
		id = 37247,
		level = 8,
		trans_use_item = {
			{
				17043,
				33
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				7
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
	[37248] = {
		trans_use_gold = 780,
		next = 37249,
		base = 37240,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 37247,
		id = 37248,
		level = 9,
		trans_use_item = {
			{
				17043,
				39
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				15
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
	[37249] = {
		trans_use_gold = 900,
		next = 37250,
		base = 37240,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 37248,
		id = 37249,
		level = 10,
		trans_use_item = {
			{
				17043,
				45
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				25
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
	[37250] = {
		trans_use_gold = 0,
		next = 0,
		base = 37240,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 37249,
		id = 37250,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				36
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
	[37300] = {
		important = 1,
		destory_gold = 9,
		type = 7,
		group = 37300,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 37301,
		prev = 0,
		id = 37300,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[37301] = {
		trans_use_gold = 60,
		next = 37302,
		base = 37300,
		restore_gold = 20,
		destory_gold = 14,
		prev = 37300,
		id = 37301,
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
	[37302] = {
		trans_use_gold = 100,
		next = 37303,
		base = 37300,
		restore_gold = 80,
		destory_gold = 29,
		prev = 37301,
		id = 37302,
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
	[37303] = {
		trans_use_gold = 160,
		next = 37304,
		base = 37300,
		restore_gold = 180,
		destory_gold = 54,
		prev = 37302,
		id = 37303,
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
	[37304] = {
		trans_use_gold = 220,
		next = 37305,
		base = 37300,
		restore_gold = 340,
		destory_gold = 94,
		prev = 37303,
		id = 37304,
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
	[37305] = {
		trans_use_gold = 280,
		next = 37306,
		base = 37300,
		restore_gold = 560,
		destory_gold = 149,
		prev = 37304,
		id = 37305,
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
	[37306] = {
		trans_use_gold = 0,
		next = 0,
		base = 37300,
		restore_gold = 840,
		destory_gold = 219,
		prev = 37305,
		id = 37306,
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
	[37320] = {
		important = 1,
		destory_gold = 16,
		type = 7,
		group = 37320,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 37321,
		prev = 0,
		id = 37320,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[37321] = {
		trans_use_gold = 60,
		next = 37322,
		base = 37320,
		restore_gold = 20,
		destory_gold = 21,
		prev = 37320,
		id = 37321,
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
	[37322] = {
		trans_use_gold = 100,
		next = 37323,
		base = 37320,
		restore_gold = 80,
		destory_gold = 36,
		prev = 37321,
		id = 37322,
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
	[37323] = {
		trans_use_gold = 160,
		next = 37324,
		base = 37320,
		restore_gold = 180,
		destory_gold = 61,
		prev = 37322,
		id = 37323,
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
	[37324] = {
		trans_use_gold = 220,
		next = 37325,
		base = 37320,
		restore_gold = 340,
		destory_gold = 101,
		prev = 37323,
		id = 37324,
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
	[37325] = {
		trans_use_gold = 280,
		next = 37326,
		base = 37320,
		restore_gold = 560,
		destory_gold = 156,
		prev = 37324,
		id = 37325,
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
	[37326] = {
		trans_use_gold = 360,
		next = 37327,
		base = 37320,
		restore_gold = 840,
		destory_gold = 226,
		prev = 37325,
		id = 37326,
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
	[37327] = {
		trans_use_gold = 440,
		next = 37328,
		base = 37320,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 37326,
		id = 37327,
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
	[37328] = {
		trans_use_gold = 520,
		next = 37329,
		base = 37320,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 37327,
		id = 37328,
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
	[37329] = {
		trans_use_gold = 600,
		next = 37330,
		base = 37320,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 37328,
		id = 37329,
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
	[37330] = {
		trans_use_gold = 0,
		next = 0,
		base = 37320,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 37329,
		id = 37330,
		level = 11,
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
	[37340] = {
		important = 1,
		destory_gold = 25,
		type = 7,
		group = 37340,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 37341,
		prev = 0,
		id = 37340,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				2
			}
		},
		destory_item = {
			{
				17043,
				1
			}
		},
		restore_item = {}
	},
	[37341] = {
		trans_use_gold = 90,
		next = 37342,
		base = 37340,
		restore_gold = 20,
		destory_gold = 33,
		prev = 37340,
		id = 37341,
		level = 2,
		trans_use_item = {
			{
				17041,
				5
			}
		},
		destory_item = {
			{
				17041,
				1
			},
			{
				17043,
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
	[37342] = {
		trans_use_gold = 150,
		next = 37343,
		base = 37340,
		restore_gold = 80,
		destory_gold = 55,
		prev = 37341,
		id = 37342,
		level = 3,
		trans_use_item = {
			{
				17041,
				8
			}
		},
		destory_item = {
			{
				17041,
				2
			},
			{
				17043,
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
	[37343] = {
		trans_use_gold = 240,
		next = 37344,
		base = 37340,
		restore_gold = 180,
		destory_gold = 93,
		prev = 37342,
		id = 37343,
		level = 4,
		trans_use_item = {
			{
				17042,
				12
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17043,
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
	[37344] = {
		trans_use_gold = 330,
		next = 37345,
		base = 37340,
		restore_gold = 340,
		destory_gold = 153,
		prev = 37343,
		id = 37344,
		level = 5,
		trans_use_item = {
			{
				17042,
				16
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				3
			},
			{
				17043,
				1
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
	[37345] = {
		trans_use_gold = 420,
		next = 37346,
		base = 37340,
		restore_gold = 560,
		destory_gold = 235,
		prev = 37344,
		id = 37345,
		level = 6,
		trans_use_item = {
			{
				17042,
				21
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				7
			},
			{
				17043,
				1
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
	[37346] = {
		trans_use_gold = 540,
		next = 37347,
		base = 37340,
		restore_gold = 840,
		destory_gold = 340,
		prev = 37345,
		id = 37346,
		level = 7,
		trans_use_item = {
			{
				17043,
				27
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				1
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
	[37347] = {
		trans_use_gold = 660,
		next = 37348,
		base = 37340,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 37346,
		id = 37347,
		level = 8,
		trans_use_item = {
			{
				17043,
				33
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				7
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
	[37348] = {
		trans_use_gold = 780,
		next = 37349,
		base = 37340,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 37347,
		id = 37348,
		level = 9,
		trans_use_item = {
			{
				17043,
				39
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				15
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
	[37349] = {
		trans_use_gold = 900,
		next = 37350,
		base = 37340,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 37348,
		id = 37349,
		level = 10,
		trans_use_item = {
			{
				17043,
				45
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				25
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
	[37350] = {
		trans_use_gold = 0,
		next = 0,
		base = 37340,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 37349,
		id = 37350,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				36
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
	[38000] = {
		important = 1,
		destory_gold = 1,
		type = 8,
		group = 38000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 38001,
		prev = 0,
		id = 38000,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[38001] = {
		trans_use_gold = 60,
		next = 38002,
		base = 38000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 38000,
		id = 38001,
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
	[38002] = {
		trans_use_gold = 100,
		next = 38003,
		base = 38000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 38001,
		id = 38002,
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
	[38003] = {
		trans_use_gold = 0,
		next = 0,
		base = 38000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 38002,
		id = 38003,
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
	[38020] = {
		important = 1,
		destory_gold = 4,
		type = 8,
		group = 38020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 38021,
		prev = 0,
		id = 38020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[38021] = {
		trans_use_gold = 60,
		next = 38022,
		base = 38020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 38020,
		id = 38021,
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
	[38022] = {
		trans_use_gold = 100,
		next = 38023,
		base = 38020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 38021,
		id = 38022,
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
	[38023] = {
		trans_use_gold = 0,
		next = 0,
		base = 38020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 38022,
		id = 38023,
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
	[38040] = {
		important = 1,
		destory_gold = 9,
		type = 8,
		group = 38040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 38041,
		prev = 0,
		id = 38040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[38041] = {
		trans_use_gold = 60,
		next = 38042,
		base = 38040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 38040,
		id = 38041,
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
	[38042] = {
		trans_use_gold = 100,
		next = 38043,
		base = 38040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 38041,
		id = 38042,
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
	[38043] = {
		trans_use_gold = 160,
		next = 38044,
		base = 38040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 38042,
		id = 38043,
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
	[38044] = {
		trans_use_gold = 220,
		next = 38045,
		base = 38040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 38043,
		id = 38044,
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
	[38045] = {
		trans_use_gold = 280,
		next = 38046,
		base = 38040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 38044,
		id = 38045,
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
	[38046] = {
		trans_use_gold = 0,
		next = 0,
		base = 38040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 38045,
		id = 38046,
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
	[38100] = {
		important = 1,
		destory_gold = 4,
		type = 8,
		group = 38100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 38101,
		prev = 0,
		id = 38100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[38101] = {
		trans_use_gold = 60,
		next = 38102,
		base = 38100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 38100,
		id = 38101,
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
	[38102] = {
		trans_use_gold = 100,
		next = 38103,
		base = 38100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 38101,
		id = 38102,
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
	[38103] = {
		trans_use_gold = 0,
		next = 0,
		base = 38100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 38102,
		id = 38103,
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
	[38120] = {
		important = 1,
		destory_gold = 9,
		type = 8,
		group = 38120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 38121,
		prev = 0,
		id = 38120,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[38121] = {
		trans_use_gold = 60,
		next = 38122,
		base = 38120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 38120,
		id = 38121,
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
	[38122] = {
		trans_use_gold = 100,
		next = 38123,
		base = 38120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 38121,
		id = 38122,
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
	[38123] = {
		trans_use_gold = 160,
		next = 38124,
		base = 38120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 38122,
		id = 38123,
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
	[38124] = {
		trans_use_gold = 220,
		next = 38125,
		base = 38120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 38123,
		id = 38124,
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
	[38125] = {
		trans_use_gold = 280,
		next = 38126,
		base = 38120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 38124,
		id = 38125,
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
	[38126] = {
		trans_use_gold = 0,
		next = 0,
		base = 38120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 38125,
		id = 38126,
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
	[38140] = {
		important = 1,
		destory_gold = 16,
		type = 8,
		group = 38140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 38141,
		prev = 0,
		id = 38140,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[38141] = {
		trans_use_gold = 60,
		next = 38142,
		base = 38140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 38140,
		id = 38141,
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
	[38142] = {
		trans_use_gold = 100,
		next = 38143,
		base = 38140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 38141,
		id = 38142,
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
	[38143] = {
		trans_use_gold = 160,
		next = 38144,
		base = 38140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 38142,
		id = 38143,
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
	[38144] = {
		trans_use_gold = 220,
		next = 38145,
		base = 38140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 38143,
		id = 38144,
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
	[38145] = {
		trans_use_gold = 280,
		next = 38146,
		base = 38140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 38144,
		id = 38145,
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
	[38146] = {
		trans_use_gold = 360,
		next = 38147,
		base = 38140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 38145,
		id = 38146,
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
	[38147] = {
		trans_use_gold = 440,
		next = 38148,
		base = 38140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 38146,
		id = 38147,
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
	[38148] = {
		trans_use_gold = 520,
		next = 38149,
		base = 38140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 38147,
		id = 38148,
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
	[38149] = {
		trans_use_gold = 600,
		next = 38150,
		base = 38140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 38148,
		id = 38149,
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
	[38150] = {
		trans_use_gold = 0,
		next = 0,
		base = 38140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 38149,
		id = 38150,
		level = 11,
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
	[38200] = {
		important = 1,
		destory_gold = 9,
		type = 8,
		group = 38200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 38201,
		prev = 0,
		id = 38200,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[38201] = {
		trans_use_gold = 60,
		next = 38202,
		base = 38200,
		restore_gold = 20,
		destory_gold = 14,
		prev = 38200,
		id = 38201,
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
	[38202] = {
		trans_use_gold = 100,
		next = 38203,
		base = 38200,
		restore_gold = 80,
		destory_gold = 29,
		prev = 38201,
		id = 38202,
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
	[38203] = {
		trans_use_gold = 160,
		next = 38204,
		base = 38200,
		restore_gold = 180,
		destory_gold = 54,
		prev = 38202,
		id = 38203,
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
	[38204] = {
		trans_use_gold = 220,
		next = 38205,
		base = 38200,
		restore_gold = 340,
		destory_gold = 94,
		prev = 38203,
		id = 38204,
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
	[38205] = {
		trans_use_gold = 280,
		next = 38206,
		base = 38200,
		restore_gold = 560,
		destory_gold = 149,
		prev = 38204,
		id = 38205,
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
	[38206] = {
		trans_use_gold = 0,
		next = 0,
		base = 38200,
		restore_gold = 840,
		destory_gold = 219,
		prev = 38205,
		id = 38206,
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
	[38220] = {
		important = 1,
		destory_gold = 16,
		type = 8,
		group = 38220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 38221,
		prev = 0,
		id = 38220,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[38221] = {
		trans_use_gold = 60,
		next = 38222,
		base = 38220,
		restore_gold = 20,
		destory_gold = 21,
		prev = 38220,
		id = 38221,
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
	[38222] = {
		trans_use_gold = 100,
		next = 38223,
		base = 38220,
		restore_gold = 80,
		destory_gold = 36,
		prev = 38221,
		id = 38222,
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
	[38223] = {
		trans_use_gold = 160,
		next = 38224,
		base = 38220,
		restore_gold = 180,
		destory_gold = 61,
		prev = 38222,
		id = 38223,
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
	[38224] = {
		trans_use_gold = 220,
		next = 38225,
		base = 38220,
		restore_gold = 340,
		destory_gold = 101,
		prev = 38223,
		id = 38224,
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
	[38225] = {
		trans_use_gold = 280,
		next = 38226,
		base = 38220,
		restore_gold = 560,
		destory_gold = 156,
		prev = 38224,
		id = 38225,
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
	[38226] = {
		trans_use_gold = 360,
		next = 38227,
		base = 38220,
		restore_gold = 840,
		destory_gold = 226,
		prev = 38225,
		id = 38226,
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
	[38227] = {
		trans_use_gold = 440,
		next = 38228,
		base = 38220,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 38226,
		id = 38227,
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
	[38228] = {
		trans_use_gold = 520,
		next = 38229,
		base = 38220,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 38227,
		id = 38228,
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
	[38229] = {
		trans_use_gold = 600,
		next = 38230,
		base = 38220,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 38228,
		id = 38229,
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
	[38230] = {
		trans_use_gold = 0,
		next = 0,
		base = 38220,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 38229,
		id = 38230,
		level = 11,
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
	[38240] = {
		important = 1,
		destory_gold = 25,
		type = 8,
		group = 38240,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 38241,
		prev = 0,
		id = 38240,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				2
			}
		},
		destory_item = {
			{
				17043,
				1
			}
		},
		restore_item = {}
	},
	[38241] = {
		trans_use_gold = 90,
		next = 38242,
		base = 38240,
		restore_gold = 20,
		destory_gold = 33,
		prev = 38240,
		id = 38241,
		level = 2,
		trans_use_item = {
			{
				17041,
				5
			}
		},
		destory_item = {
			{
				17041,
				1
			},
			{
				17043,
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
	[38242] = {
		trans_use_gold = 150,
		next = 38243,
		base = 38240,
		restore_gold = 80,
		destory_gold = 55,
		prev = 38241,
		id = 38242,
		level = 3,
		trans_use_item = {
			{
				17041,
				8
			}
		},
		destory_item = {
			{
				17041,
				2
			},
			{
				17043,
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
	[38243] = {
		trans_use_gold = 240,
		next = 38244,
		base = 38240,
		restore_gold = 180,
		destory_gold = 93,
		prev = 38242,
		id = 38243,
		level = 4,
		trans_use_item = {
			{
				17042,
				12
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17043,
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
	[38244] = {
		trans_use_gold = 330,
		next = 38245,
		base = 38240,
		restore_gold = 340,
		destory_gold = 153,
		prev = 38243,
		id = 38244,
		level = 5,
		trans_use_item = {
			{
				17042,
				16
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				3
			},
			{
				17043,
				1
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
	[38245] = {
		trans_use_gold = 420,
		next = 38246,
		base = 38240,
		restore_gold = 560,
		destory_gold = 235,
		prev = 38244,
		id = 38245,
		level = 6,
		trans_use_item = {
			{
				17042,
				21
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				7
			},
			{
				17043,
				1
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
	[38246] = {
		trans_use_gold = 540,
		next = 38247,
		base = 38240,
		restore_gold = 840,
		destory_gold = 340,
		prev = 38245,
		id = 38246,
		level = 7,
		trans_use_item = {
			{
				17043,
				27
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				1
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
	[38247] = {
		trans_use_gold = 660,
		next = 38248,
		base = 38240,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 38246,
		id = 38247,
		level = 8,
		trans_use_item = {
			{
				17043,
				33
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				7
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
	[38248] = {
		trans_use_gold = 780,
		next = 38249,
		base = 38240,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 38247,
		id = 38248,
		level = 9,
		trans_use_item = {
			{
				17043,
				39
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				15
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
	[38249] = {
		trans_use_gold = 900,
		next = 38250,
		base = 38240,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 38248,
		id = 38249,
		level = 10,
		trans_use_item = {
			{
				17043,
				45
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				25
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
	[38250] = {
		trans_use_gold = 0,
		next = 0,
		base = 38240,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 38249,
		id = 38250,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				36
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
	[39000] = {
		important = 1,
		destory_gold = 4,
		type = 9,
		group = 39000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 39001,
		prev = 0,
		id = 39000,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[39001] = {
		trans_use_gold = 60,
		next = 39002,
		base = 39000,
		restore_gold = 20,
		destory_gold = 9,
		prev = 39000,
		id = 39001,
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
	[39002] = {
		trans_use_gold = 100,
		next = 39003,
		base = 39000,
		restore_gold = 80,
		destory_gold = 24,
		prev = 39001,
		id = 39002,
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
	[39003] = {
		trans_use_gold = 0,
		next = 0,
		base = 39000,
		restore_gold = 180,
		destory_gold = 49,
		prev = 39002,
		id = 39003,
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
	[39020] = {
		important = 1,
		destory_gold = 9,
		type = 9,
		group = 39020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 39021,
		prev = 0,
		id = 39020,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[39021] = {
		trans_use_gold = 60,
		next = 39022,
		base = 39020,
		restore_gold = 20,
		destory_gold = 14,
		prev = 39020,
		id = 39021,
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
	[39022] = {
		trans_use_gold = 100,
		next = 39023,
		base = 39020,
		restore_gold = 80,
		destory_gold = 29,
		prev = 39021,
		id = 39022,
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
	[39023] = {
		trans_use_gold = 160,
		next = 39024,
		base = 39020,
		restore_gold = 180,
		destory_gold = 54,
		prev = 39022,
		id = 39023,
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
	[39024] = {
		trans_use_gold = 220,
		next = 39025,
		base = 39020,
		restore_gold = 340,
		destory_gold = 94,
		prev = 39023,
		id = 39024,
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
	[39025] = {
		trans_use_gold = 280,
		next = 39026,
		base = 39020,
		restore_gold = 560,
		destory_gold = 149,
		prev = 39024,
		id = 39025,
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
	[39026] = {
		trans_use_gold = 0,
		next = 0,
		base = 39020,
		restore_gold = 840,
		destory_gold = 219,
		prev = 39025,
		id = 39026,
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
	[39040] = {
		important = 1,
		destory_gold = 16,
		type = 9,
		group = 39040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 39041,
		prev = 0,
		id = 39040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[39041] = {
		trans_use_gold = 60,
		next = 39042,
		base = 39040,
		restore_gold = 20,
		destory_gold = 21,
		prev = 39040,
		id = 39041,
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
	[39042] = {
		trans_use_gold = 100,
		next = 39043,
		base = 39040,
		restore_gold = 80,
		destory_gold = 36,
		prev = 39041,
		id = 39042,
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
	[39043] = {
		trans_use_gold = 160,
		next = 39044,
		base = 39040,
		restore_gold = 180,
		destory_gold = 61,
		prev = 39042,
		id = 39043,
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
	[39044] = {
		trans_use_gold = 220,
		next = 39045,
		base = 39040,
		restore_gold = 340,
		destory_gold = 101,
		prev = 39043,
		id = 39044,
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
	[39045] = {
		trans_use_gold = 280,
		next = 39046,
		base = 39040,
		restore_gold = 560,
		destory_gold = 156,
		prev = 39044,
		id = 39045,
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
	[39046] = {
		trans_use_gold = 360,
		next = 39047,
		base = 39040,
		restore_gold = 840,
		destory_gold = 226,
		prev = 39045,
		id = 39046,
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
	[39047] = {
		trans_use_gold = 440,
		next = 39048,
		base = 39040,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 39046,
		id = 39047,
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
	[39048] = {
		trans_use_gold = 520,
		next = 39049,
		base = 39040,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 39047,
		id = 39048,
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
	[39049] = {
		trans_use_gold = 600,
		next = 39050,
		base = 39040,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 39048,
		id = 39049,
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
	[39050] = {
		trans_use_gold = 0,
		next = 0,
		base = 39040,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 39049,
		id = 39050,
		level = 11,
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
	[39100] = {
		important = 1,
		destory_gold = 9,
		type = 9,
		group = 39100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 39101,
		prev = 0,
		id = 39100,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[39101] = {
		trans_use_gold = 60,
		next = 39102,
		base = 39100,
		restore_gold = 20,
		destory_gold = 14,
		prev = 39100,
		id = 39101,
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
	[39102] = {
		trans_use_gold = 100,
		next = 39103,
		base = 39100,
		restore_gold = 80,
		destory_gold = 29,
		prev = 39101,
		id = 39102,
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
	[39103] = {
		trans_use_gold = 160,
		next = 39104,
		base = 39100,
		restore_gold = 180,
		destory_gold = 54,
		prev = 39102,
		id = 39103,
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
	[39104] = {
		trans_use_gold = 220,
		next = 39105,
		base = 39100,
		restore_gold = 340,
		destory_gold = 94,
		prev = 39103,
		id = 39104,
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
	[39105] = {
		trans_use_gold = 280,
		next = 39106,
		base = 39100,
		restore_gold = 560,
		destory_gold = 149,
		prev = 39104,
		id = 39105,
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
	[39106] = {
		trans_use_gold = 0,
		next = 0,
		base = 39100,
		restore_gold = 840,
		destory_gold = 219,
		prev = 39105,
		id = 39106,
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
	[39120] = {
		important = 1,
		destory_gold = 16,
		type = 9,
		group = 39120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 39121,
		prev = 0,
		id = 39120,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[39121] = {
		trans_use_gold = 60,
		next = 39122,
		base = 39120,
		restore_gold = 20,
		destory_gold = 21,
		prev = 39120,
		id = 39121,
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
	[39122] = {
		trans_use_gold = 100,
		next = 39123,
		base = 39120,
		restore_gold = 80,
		destory_gold = 36,
		prev = 39121,
		id = 39122,
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
	[39123] = {
		trans_use_gold = 160,
		next = 39124,
		base = 39120,
		restore_gold = 180,
		destory_gold = 61,
		prev = 39122,
		id = 39123,
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
	[39124] = {
		trans_use_gold = 220,
		next = 39125,
		base = 39120,
		restore_gold = 340,
		destory_gold = 101,
		prev = 39123,
		id = 39124,
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
	[39125] = {
		trans_use_gold = 280,
		next = 39126,
		base = 39120,
		restore_gold = 560,
		destory_gold = 156,
		prev = 39124,
		id = 39125,
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
	[39126] = {
		trans_use_gold = 360,
		next = 39127,
		base = 39120,
		restore_gold = 840,
		destory_gold = 226,
		prev = 39125,
		id = 39126,
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
	[39127] = {
		trans_use_gold = 440,
		next = 39128,
		base = 39120,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 39126,
		id = 39127,
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
	[39128] = {
		trans_use_gold = 520,
		next = 39129,
		base = 39120,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 39127,
		id = 39128,
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
	[39129] = {
		trans_use_gold = 600,
		next = 39130,
		base = 39120,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 39128,
		id = 39129,
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
	[39130] = {
		trans_use_gold = 0,
		next = 0,
		base = 39120,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 39129,
		id = 39130,
		level = 11,
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
	[39140] = {
		important = 1,
		destory_gold = 25,
		type = 9,
		group = 39140,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 39141,
		prev = 0,
		id = 39140,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				2
			}
		},
		destory_item = {
			{
				17043,
				1
			}
		},
		restore_item = {}
	},
	[39141] = {
		trans_use_gold = 90,
		next = 39142,
		base = 39140,
		restore_gold = 20,
		destory_gold = 33,
		prev = 39140,
		id = 39141,
		level = 2,
		trans_use_item = {
			{
				17041,
				5
			}
		},
		destory_item = {
			{
				17041,
				1
			},
			{
				17043,
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
	[39142] = {
		trans_use_gold = 150,
		next = 39143,
		base = 39140,
		restore_gold = 80,
		destory_gold = 55,
		prev = 39141,
		id = 39142,
		level = 3,
		trans_use_item = {
			{
				17041,
				8
			}
		},
		destory_item = {
			{
				17041,
				2
			},
			{
				17043,
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
	[39143] = {
		trans_use_gold = 240,
		next = 39144,
		base = 39140,
		restore_gold = 180,
		destory_gold = 93,
		prev = 39142,
		id = 39143,
		level = 4,
		trans_use_item = {
			{
				17042,
				12
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17043,
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
	[39144] = {
		trans_use_gold = 330,
		next = 39145,
		base = 39140,
		restore_gold = 340,
		destory_gold = 153,
		prev = 39143,
		id = 39144,
		level = 5,
		trans_use_item = {
			{
				17042,
				16
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				3
			},
			{
				17043,
				1
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
	[39145] = {
		trans_use_gold = 420,
		next = 39146,
		base = 39140,
		restore_gold = 560,
		destory_gold = 235,
		prev = 39144,
		id = 39145,
		level = 6,
		trans_use_item = {
			{
				17042,
				21
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				7
			},
			{
				17043,
				1
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
	[39146] = {
		trans_use_gold = 540,
		next = 39147,
		base = 39140,
		restore_gold = 840,
		destory_gold = 340,
		prev = 39145,
		id = 39146,
		level = 7,
		trans_use_item = {
			{
				17043,
				27
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				1
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
	[39147] = {
		trans_use_gold = 660,
		next = 39148,
		base = 39140,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 39146,
		id = 39147,
		level = 8,
		trans_use_item = {
			{
				17043,
				33
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				7
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
	[39148] = {
		trans_use_gold = 780,
		next = 39149,
		base = 39140,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 39147,
		id = 39148,
		level = 9,
		trans_use_item = {
			{
				17043,
				39
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				15
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
	[39149] = {
		trans_use_gold = 900,
		next = 39150,
		base = 39140,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 39148,
		id = 39149,
		level = 10,
		trans_use_item = {
			{
				17043,
				45
			}
		},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				25
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
	[39150] = {
		trans_use_gold = 0,
		next = 0,
		base = 39140,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 39149,
		id = 39150,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17041,
				4
			},
			{
				17042,
				12
			},
			{
				17043,
				36
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
	[39200] = {
		important = 1,
		destory_gold = 4,
		type = 12,
		group = 39200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 39201,
		prev = 0,
		id = 39200,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17041,
				1
			}
		},
		destory_item = {},
		restore_item = {}
	},
	[39201] = {
		trans_use_gold = 60,
		next = 39202,
		base = 39200,
		restore_gold = 20,
		destory_gold = 9,
		prev = 39200,
		id = 39201,
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
	[39202] = {
		trans_use_gold = 100,
		next = 39203,
		base = 39200,
		restore_gold = 80,
		destory_gold = 24,
		prev = 39201,
		id = 39202,
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
	[39203] = {
		trans_use_gold = 0,
		next = 0,
		base = 39200,
		restore_gold = 180,
		destory_gold = 49,
		prev = 39202,
		id = 39203,
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
	[39220] = {
		important = 1,
		destory_gold = 9,
		type = 12,
		group = 39220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 39221,
		prev = 0,
		id = 39220,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[39221] = {
		trans_use_gold = 60,
		next = 39222,
		base = 39220,
		restore_gold = 20,
		destory_gold = 14,
		prev = 39220,
		id = 39221,
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
	[39222] = {
		trans_use_gold = 100,
		next = 39223,
		base = 39220,
		restore_gold = 80,
		destory_gold = 29,
		prev = 39221,
		id = 39222,
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
	[39223] = {
		trans_use_gold = 160,
		next = 39224,
		base = 39220,
		restore_gold = 180,
		destory_gold = 54,
		prev = 39222,
		id = 39223,
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
	[39224] = {
		trans_use_gold = 220,
		next = 39225,
		base = 39220,
		restore_gold = 340,
		destory_gold = 94,
		prev = 39223,
		id = 39224,
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
	[39225] = {
		trans_use_gold = 280,
		next = 39226,
		base = 39220,
		restore_gold = 560,
		destory_gold = 149,
		prev = 39224,
		id = 39225,
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
	[39226] = {
		trans_use_gold = 0,
		next = 0,
		base = 39220,
		restore_gold = 840,
		destory_gold = 219,
		prev = 39225,
		id = 39226,
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
	[39240] = {
		important = 1,
		destory_gold = 16,
		type = 12,
		group = 39240,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 39241,
		prev = 0,
		id = 39240,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
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
		restore_item = {}
	},
	[39241] = {
		trans_use_gold = 60,
		next = 39242,
		base = 39240,
		restore_gold = 20,
		destory_gold = 21,
		prev = 39240,
		id = 39241,
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
	[39242] = {
		trans_use_gold = 100,
		next = 39243,
		base = 39240,
		restore_gold = 80,
		destory_gold = 36,
		prev = 39241,
		id = 39242,
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
	[39243] = {
		trans_use_gold = 160,
		next = 39244,
		base = 39240,
		restore_gold = 180,
		destory_gold = 61,
		prev = 39242,
		id = 39243,
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
	[39244] = {
		trans_use_gold = 220,
		next = 39245,
		base = 39240,
		restore_gold = 340,
		destory_gold = 101,
		prev = 39243,
		id = 39244,
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
	[39245] = {
		trans_use_gold = 280,
		next = 39246,
		base = 39240,
		restore_gold = 560,
		destory_gold = 156,
		prev = 39244,
		id = 39245,
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
	[39246] = {
		trans_use_gold = 360,
		next = 39247,
		base = 39240,
		restore_gold = 840,
		destory_gold = 226,
		prev = 39245,
		id = 39246,
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
	[39247] = {
		trans_use_gold = 440,
		next = 39248,
		base = 39240,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 39246,
		id = 39247,
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
	[39248] = {
		trans_use_gold = 520,
		next = 39249,
		base = 39240,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 39247,
		id = 39248,
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
	[39249] = {
		trans_use_gold = 600,
		next = 39250,
		base = 39240,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 39248,
		id = 39249,
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
	[39250] = {
		trans_use_gold = 0,
		next = 0,
		base = 39240,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 39249,
		id = 39250,
		level = 11,
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
	[41000] = {
		important = 1,
		destory_gold = 1,
		type = 1,
		group = 41000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 41001,
		prev = 0,
		id = 41000,
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
		restore_item = {}
	},
	[41001] = {
		trans_use_gold = 60,
		next = 41002,
		base = 41000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 41000,
		id = 41001,
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
	[41002] = {
		trans_use_gold = 100,
		next = 41003,
		base = 41000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 41001,
		id = 41002,
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
	[41003] = {
		trans_use_gold = 0,
		next = 0,
		base = 41000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 41002,
		id = 41003,
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
	[41020] = {
		important = 1,
		destory_gold = 4,
		type = 1,
		group = 41020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 41021,
		prev = 0,
		id = 41020,
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
		restore_item = {}
	},
	[41021] = {
		trans_use_gold = 60,
		next = 41022,
		base = 41020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 41020,
		id = 41021,
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
	[41022] = {
		trans_use_gold = 100,
		next = 41023,
		base = 41020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 41021,
		id = 41022,
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
	[41023] = {
		trans_use_gold = 0,
		next = 0,
		base = 41020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 41022,
		id = 41023,
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
	[41040] = {
		important = 1,
		destory_gold = 9,
		type = 1,
		group = 41040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 41041,
		prev = 0,
		id = 41040,
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
		restore_item = {}
	},
	[41041] = {
		trans_use_gold = 60,
		next = 41042,
		base = 41040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 41040,
		id = 41041,
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
	[41042] = {
		trans_use_gold = 100,
		next = 41043,
		base = 41040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 41041,
		id = 41042,
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
	[41043] = {
		trans_use_gold = 160,
		next = 41044,
		base = 41040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 41042,
		id = 41043,
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
	[41044] = {
		trans_use_gold = 220,
		next = 41045,
		base = 41040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 41043,
		id = 41044,
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
	[41045] = {
		trans_use_gold = 280,
		next = 41046,
		base = 41040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 41044,
		id = 41045,
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
	[41046] = {
		trans_use_gold = 0,
		next = 0,
		base = 41040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 41045,
		id = 41046,
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
	[42000] = {
		important = 1,
		destory_gold = 4,
		type = 2,
		group = 42000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 42001,
		prev = 0,
		id = 42000,
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
		restore_item = {}
	},
	[42001] = {
		trans_use_gold = 60,
		next = 42002,
		base = 42000,
		restore_gold = 20,
		destory_gold = 9,
		prev = 42000,
		id = 42001,
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
	[42002] = {
		trans_use_gold = 100,
		next = 42003,
		base = 42000,
		restore_gold = 80,
		destory_gold = 24,
		prev = 42001,
		id = 42002,
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
	[42003] = {
		trans_use_gold = 0,
		next = 0,
		base = 42000,
		restore_gold = 180,
		destory_gold = 49,
		prev = 42002,
		id = 42003,
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
	[42020] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 42020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 42021,
		prev = 0,
		id = 42020,
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
		restore_item = {}
	},
	[42021] = {
		trans_use_gold = 60,
		next = 42022,
		base = 42020,
		restore_gold = 20,
		destory_gold = 14,
		prev = 42020,
		id = 42021,
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
	[42022] = {
		trans_use_gold = 100,
		next = 42023,
		base = 42020,
		restore_gold = 80,
		destory_gold = 29,
		prev = 42021,
		id = 42022,
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
	[42023] = {
		trans_use_gold = 160,
		next = 42024,
		base = 42020,
		restore_gold = 180,
		destory_gold = 54,
		prev = 42022,
		id = 42023,
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
	[42024] = {
		trans_use_gold = 220,
		next = 42025,
		base = 42020,
		restore_gold = 340,
		destory_gold = 94,
		prev = 42023,
		id = 42024,
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
	[42025] = {
		trans_use_gold = 280,
		next = 42026,
		base = 42020,
		restore_gold = 560,
		destory_gold = 149,
		prev = 42024,
		id = 42025,
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
	[42026] = {
		trans_use_gold = 0,
		next = 0,
		base = 42020,
		restore_gold = 840,
		destory_gold = 219,
		prev = 42025,
		id = 42026,
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
	[42040] = {
		important = 1,
		destory_gold = 16,
		type = 2,
		group = 42040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 42041,
		prev = 0,
		id = 42040,
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
		restore_item = {}
	},
	[42041] = {
		trans_use_gold = 60,
		next = 42042,
		base = 42040,
		restore_gold = 20,
		destory_gold = 21,
		prev = 42040,
		id = 42041,
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
	[42042] = {
		trans_use_gold = 100,
		next = 42043,
		base = 42040,
		restore_gold = 80,
		destory_gold = 36,
		prev = 42041,
		id = 42042,
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
	[42043] = {
		trans_use_gold = 160,
		next = 42044,
		base = 42040,
		restore_gold = 180,
		destory_gold = 61,
		prev = 42042,
		id = 42043,
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
	[42044] = {
		trans_use_gold = 220,
		next = 42045,
		base = 42040,
		restore_gold = 340,
		destory_gold = 101,
		prev = 42043,
		id = 42044,
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
	[42045] = {
		trans_use_gold = 280,
		next = 42046,
		base = 42040,
		restore_gold = 560,
		destory_gold = 156,
		prev = 42044,
		id = 42045,
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
	[42046] = {
		trans_use_gold = 360,
		next = 42047,
		base = 42040,
		restore_gold = 840,
		destory_gold = 226,
		prev = 42045,
		id = 42046,
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
	[42047] = {
		trans_use_gold = 440,
		next = 42048,
		base = 42040,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 42046,
		id = 42047,
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
	[42048] = {
		trans_use_gold = 520,
		next = 42049,
		base = 42040,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 42047,
		id = 42048,
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
	[42049] = {
		trans_use_gold = 600,
		next = 42050,
		base = 42040,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 42048,
		id = 42049,
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
	[42050] = {
		trans_use_gold = 0,
		next = 0,
		base = 42040,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 42049,
		id = 42050,
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
	[42100] = {
		important = 1,
		destory_gold = 4,
		type = 2,
		group = 42100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 42101,
		prev = 0,
		id = 42100,
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
		restore_item = {}
	},
	[42101] = {
		trans_use_gold = 60,
		next = 42102,
		base = 42100,
		restore_gold = 20,
		destory_gold = 9,
		prev = 42100,
		id = 42101,
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
	[42102] = {
		trans_use_gold = 100,
		next = 42103,
		base = 42100,
		restore_gold = 80,
		destory_gold = 24,
		prev = 42101,
		id = 42102,
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
	[42103] = {
		trans_use_gold = 0,
		next = 0,
		base = 42100,
		restore_gold = 180,
		destory_gold = 49,
		prev = 42102,
		id = 42103,
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
	[42120] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 42120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 42121,
		prev = 0,
		id = 42120,
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
		restore_item = {}
	},
	[42121] = {
		trans_use_gold = 60,
		next = 42122,
		base = 42120,
		restore_gold = 20,
		destory_gold = 14,
		prev = 42120,
		id = 42121,
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
	[42122] = {
		trans_use_gold = 100,
		next = 42123,
		base = 42120,
		restore_gold = 80,
		destory_gold = 29,
		prev = 42121,
		id = 42122,
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
	[42123] = {
		trans_use_gold = 160,
		next = 42124,
		base = 42120,
		restore_gold = 180,
		destory_gold = 54,
		prev = 42122,
		id = 42123,
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
	[42124] = {
		trans_use_gold = 220,
		next = 42125,
		base = 42120,
		restore_gold = 340,
		destory_gold = 94,
		prev = 42123,
		id = 42124,
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
	[42125] = {
		trans_use_gold = 280,
		next = 42126,
		base = 42120,
		restore_gold = 560,
		destory_gold = 149,
		prev = 42124,
		id = 42125,
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
	[42126] = {
		trans_use_gold = 0,
		next = 0,
		base = 42120,
		restore_gold = 840,
		destory_gold = 219,
		prev = 42125,
		id = 42126,
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
	[42140] = {
		important = 1,
		destory_gold = 16,
		type = 2,
		group = 42140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 42141,
		prev = 0,
		id = 42140,
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
		restore_item = {}
	},
	[42141] = {
		trans_use_gold = 60,
		next = 42142,
		base = 42140,
		restore_gold = 20,
		destory_gold = 21,
		prev = 42140,
		id = 42141,
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
	[42142] = {
		trans_use_gold = 100,
		next = 42143,
		base = 42140,
		restore_gold = 80,
		destory_gold = 36,
		prev = 42141,
		id = 42142,
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
	[42143] = {
		trans_use_gold = 160,
		next = 42144,
		base = 42140,
		restore_gold = 180,
		destory_gold = 61,
		prev = 42142,
		id = 42143,
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
	[42144] = {
		trans_use_gold = 220,
		next = 42145,
		base = 42140,
		restore_gold = 340,
		destory_gold = 101,
		prev = 42143,
		id = 42144,
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
	[42145] = {
		trans_use_gold = 280,
		next = 42146,
		base = 42140,
		restore_gold = 560,
		destory_gold = 156,
		prev = 42144,
		id = 42145,
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
	[42146] = {
		trans_use_gold = 360,
		next = 42147,
		base = 42140,
		restore_gold = 840,
		destory_gold = 226,
		prev = 42145,
		id = 42146,
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
	[42147] = {
		trans_use_gold = 440,
		next = 42148,
		base = 42140,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 42146,
		id = 42147,
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
	[42148] = {
		trans_use_gold = 520,
		next = 42149,
		base = 42140,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 42147,
		id = 42148,
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
	[42149] = {
		trans_use_gold = 600,
		next = 42150,
		base = 42140,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 42148,
		id = 42149,
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
	[42150] = {
		trans_use_gold = 0,
		next = 0,
		base = 42140,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 42149,
		id = 42150,
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
	[42200] = {
		important = 1,
		destory_gold = 4,
		type = 2,
		group = 42200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 42201,
		prev = 0,
		id = 42200,
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
		restore_item = {}
	},
	[42201] = {
		trans_use_gold = 60,
		next = 42202,
		base = 42200,
		restore_gold = 20,
		destory_gold = 9,
		prev = 42200,
		id = 42201,
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
	[42202] = {
		trans_use_gold = 100,
		next = 42203,
		base = 42200,
		restore_gold = 80,
		destory_gold = 24,
		prev = 42201,
		id = 42202,
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
	[42203] = {
		trans_use_gold = 0,
		next = 0,
		base = 42200,
		restore_gold = 180,
		destory_gold = 49,
		prev = 42202,
		id = 42203,
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
	[42220] = {
		important = 1,
		destory_gold = 9,
		type = 2,
		group = 42220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 42221,
		prev = 0,
		id = 42220,
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
		restore_item = {}
	},
	[42221] = {
		trans_use_gold = 60,
		next = 42222,
		base = 42220,
		restore_gold = 20,
		destory_gold = 14,
		prev = 42220,
		id = 42221,
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
	[42222] = {
		trans_use_gold = 100,
		next = 42223,
		base = 42220,
		restore_gold = 80,
		destory_gold = 29,
		prev = 42221,
		id = 42222,
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
	[42223] = {
		trans_use_gold = 160,
		next = 42224,
		base = 42220,
		restore_gold = 180,
		destory_gold = 54,
		prev = 42222,
		id = 42223,
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
	[42224] = {
		trans_use_gold = 220,
		next = 42225,
		base = 42220,
		restore_gold = 340,
		destory_gold = 94,
		prev = 42223,
		id = 42224,
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
	[42225] = {
		trans_use_gold = 280,
		next = 42226,
		base = 42220,
		restore_gold = 560,
		destory_gold = 149,
		prev = 42224,
		id = 42225,
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
	[42226] = {
		trans_use_gold = 0,
		next = 0,
		base = 42220,
		restore_gold = 840,
		destory_gold = 219,
		prev = 42225,
		id = 42226,
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
	[42240] = {
		important = 1,
		destory_gold = 16,
		type = 2,
		group = 42240,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 42241,
		prev = 0,
		id = 42240,
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
		restore_item = {}
	},
	[42241] = {
		trans_use_gold = 60,
		next = 42242,
		base = 42240,
		restore_gold = 20,
		destory_gold = 21,
		prev = 42240,
		id = 42241,
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
	[42242] = {
		trans_use_gold = 100,
		next = 42243,
		base = 42240,
		restore_gold = 80,
		destory_gold = 36,
		prev = 42241,
		id = 42242,
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
	[42243] = {
		trans_use_gold = 160,
		next = 42244,
		base = 42240,
		restore_gold = 180,
		destory_gold = 61,
		prev = 42242,
		id = 42243,
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
	[42244] = {
		trans_use_gold = 220,
		next = 42245,
		base = 42240,
		restore_gold = 340,
		destory_gold = 101,
		prev = 42243,
		id = 42244,
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
	[42245] = {
		trans_use_gold = 280,
		next = 42246,
		base = 42240,
		restore_gold = 560,
		destory_gold = 156,
		prev = 42244,
		id = 42245,
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
	[42246] = {
		trans_use_gold = 360,
		next = 42247,
		base = 42240,
		restore_gold = 840,
		destory_gold = 226,
		prev = 42245,
		id = 42246,
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
	[42247] = {
		trans_use_gold = 440,
		next = 42248,
		base = 42240,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 42246,
		id = 42247,
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
	[42248] = {
		trans_use_gold = 520,
		next = 42249,
		base = 42240,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 42247,
		id = 42248,
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
	[42249] = {
		trans_use_gold = 600,
		next = 42250,
		base = 42240,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 42248,
		id = 42249,
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
	[42250] = {
		trans_use_gold = 0,
		next = 0,
		base = 42240,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 42249,
		id = 42250,
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
	[43000] = {
		important = 1,
		destory_gold = 9,
		type = 3,
		group = 43000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 43001,
		prev = 0,
		id = 43000,
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
		restore_item = {}
	},
	[43001] = {
		trans_use_gold = 60,
		next = 43002,
		base = 43000,
		restore_gold = 20,
		destory_gold = 14,
		prev = 43000,
		id = 43001,
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
	[43002] = {
		trans_use_gold = 100,
		next = 43003,
		base = 43000,
		restore_gold = 80,
		destory_gold = 29,
		prev = 43001,
		id = 43002,
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
	[43003] = {
		trans_use_gold = 160,
		next = 43004,
		base = 43000,
		restore_gold = 180,
		destory_gold = 54,
		prev = 43002,
		id = 43003,
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
	[43004] = {
		trans_use_gold = 220,
		next = 43005,
		base = 43000,
		restore_gold = 340,
		destory_gold = 94,
		prev = 43003,
		id = 43004,
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
	[43005] = {
		trans_use_gold = 280,
		next = 43006,
		base = 43000,
		restore_gold = 560,
		destory_gold = 149,
		prev = 43004,
		id = 43005,
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
	[43006] = {
		trans_use_gold = 0,
		next = 0,
		base = 43000,
		restore_gold = 840,
		destory_gold = 219,
		prev = 43005,
		id = 43006,
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
	[43020] = {
		important = 1,
		destory_gold = 16,
		type = 3,
		group = 43020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 43021,
		prev = 0,
		id = 43020,
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
		restore_item = {}
	},
	[43021] = {
		trans_use_gold = 60,
		next = 43022,
		base = 43020,
		restore_gold = 20,
		destory_gold = 21,
		prev = 43020,
		id = 43021,
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
	[43022] = {
		trans_use_gold = 100,
		next = 43023,
		base = 43020,
		restore_gold = 80,
		destory_gold = 36,
		prev = 43021,
		id = 43022,
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
	[43023] = {
		trans_use_gold = 160,
		next = 43024,
		base = 43020,
		restore_gold = 180,
		destory_gold = 61,
		prev = 43022,
		id = 43023,
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
	[43024] = {
		trans_use_gold = 220,
		next = 43025,
		base = 43020,
		restore_gold = 340,
		destory_gold = 101,
		prev = 43023,
		id = 43024,
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
	[43025] = {
		trans_use_gold = 280,
		next = 43026,
		base = 43020,
		restore_gold = 560,
		destory_gold = 156,
		prev = 43024,
		id = 43025,
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
	[43026] = {
		trans_use_gold = 360,
		next = 43027,
		base = 43020,
		restore_gold = 840,
		destory_gold = 226,
		prev = 43025,
		id = 43026,
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
	[43027] = {
		trans_use_gold = 440,
		next = 43028,
		base = 43020,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 43026,
		id = 43027,
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
	[43028] = {
		trans_use_gold = 520,
		next = 43029,
		base = 43020,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 43027,
		id = 43028,
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
	[43029] = {
		trans_use_gold = 600,
		next = 43030,
		base = 43020,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 43028,
		id = 43029,
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
	[43030] = {
		trans_use_gold = 0,
		next = 0,
		base = 43020,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 43029,
		id = 43030,
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
	[43040] = {
		important = 1,
		destory_gold = 25,
		type = 3,
		group = 43040,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 43041,
		prev = 0,
		id = 43040,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {
			8,
			17
		},
		trans_use_item = {
			{
				17011,
				2
			}
		},
		destory_item = {
			{
				17013,
				1
			}
		},
		restore_item = {}
	},
	[43041] = {
		trans_use_gold = 90,
		next = 43042,
		base = 43040,
		restore_gold = 20,
		destory_gold = 33,
		prev = 43040,
		id = 43041,
		level = 2,
		trans_use_item = {
			{
				17011,
				5
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
	[43042] = {
		trans_use_gold = 150,
		next = 43043,
		base = 43040,
		restore_gold = 80,
		destory_gold = 55,
		prev = 43041,
		id = 43042,
		level = 3,
		trans_use_item = {
			{
				17011,
				8
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
	[43043] = {
		trans_use_gold = 240,
		next = 43044,
		base = 43040,
		restore_gold = 180,
		destory_gold = 93,
		prev = 43042,
		id = 43043,
		level = 4,
		trans_use_item = {
			{
				17012,
				12
			}
		},
		destory_item = {
			{
				17011,
				4
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
	[43044] = {
		trans_use_gold = 330,
		next = 43045,
		base = 43040,
		restore_gold = 340,
		destory_gold = 153,
		prev = 43043,
		id = 43044,
		level = 5,
		trans_use_item = {
			{
				17012,
				16
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
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
			},
			{
				17012,
				8
			}
		}
	},
	[43045] = {
		trans_use_gold = 420,
		next = 43046,
		base = 43040,
		restore_gold = 560,
		destory_gold = 235,
		prev = 43044,
		id = 43045,
		level = 6,
		trans_use_item = {
			{
				17012,
				21
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				7
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
	[43046] = {
		trans_use_gold = 540,
		next = 43047,
		base = 43040,
		restore_gold = 840,
		destory_gold = 340,
		prev = 43045,
		id = 43046,
		level = 7,
		trans_use_item = {
			{
				17013,
				27
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
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
	[43047] = {
		trans_use_gold = 660,
		next = 43048,
		base = 43040,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 43046,
		id = 43047,
		level = 8,
		trans_use_item = {
			{
				17013,
				33
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				7
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
	[43048] = {
		trans_use_gold = 780,
		next = 43049,
		base = 43040,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 43047,
		id = 43048,
		level = 9,
		trans_use_item = {
			{
				17013,
				39
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				15
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
	[43049] = {
		trans_use_gold = 900,
		next = 43050,
		base = 43040,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 43048,
		id = 43049,
		level = 10,
		trans_use_item = {
			{
				17013,
				45
			}
		},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
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
				66
			}
		}
	},
	[43050] = {
		trans_use_gold = 0,
		next = 0,
		base = 43040,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 43049,
		id = 43050,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17011,
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				36
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
	[46000] = {
		important = 1,
		destory_gold = 1,
		type = 6,
		group = 46000,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 46001,
		prev = 0,
		id = 46000,
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
		restore_item = {}
	},
	[46001] = {
		trans_use_gold = 60,
		next = 46002,
		base = 46000,
		restore_gold = 20,
		destory_gold = 6,
		prev = 46000,
		id = 46001,
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
	[46002] = {
		trans_use_gold = 100,
		next = 46003,
		base = 46000,
		restore_gold = 80,
		destory_gold = 21,
		prev = 46001,
		id = 46002,
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
	[46003] = {
		trans_use_gold = 0,
		next = 0,
		base = 46000,
		restore_gold = 180,
		destory_gold = 46,
		prev = 46002,
		id = 46003,
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
	[46020] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 46020,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 46021,
		prev = 0,
		id = 46020,
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
		restore_item = {}
	},
	[46021] = {
		trans_use_gold = 60,
		next = 46022,
		base = 46020,
		restore_gold = 20,
		destory_gold = 9,
		prev = 46020,
		id = 46021,
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
	[46022] = {
		trans_use_gold = 100,
		next = 46023,
		base = 46020,
		restore_gold = 80,
		destory_gold = 24,
		prev = 46021,
		id = 46022,
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
	[46023] = {
		trans_use_gold = 0,
		next = 0,
		base = 46020,
		restore_gold = 180,
		destory_gold = 49,
		prev = 46022,
		id = 46023,
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
	[46040] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 46040,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 46041,
		prev = 0,
		id = 46040,
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
		restore_item = {}
	},
	[46041] = {
		trans_use_gold = 60,
		next = 46042,
		base = 46040,
		restore_gold = 20,
		destory_gold = 14,
		prev = 46040,
		id = 46041,
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
	[46042] = {
		trans_use_gold = 100,
		next = 46043,
		base = 46040,
		restore_gold = 80,
		destory_gold = 29,
		prev = 46041,
		id = 46042,
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
	[46043] = {
		trans_use_gold = 160,
		next = 46044,
		base = 46040,
		restore_gold = 180,
		destory_gold = 54,
		prev = 46042,
		id = 46043,
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
	[46044] = {
		trans_use_gold = 220,
		next = 46045,
		base = 46040,
		restore_gold = 340,
		destory_gold = 94,
		prev = 46043,
		id = 46044,
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
	[46045] = {
		trans_use_gold = 280,
		next = 46046,
		base = 46040,
		restore_gold = 560,
		destory_gold = 149,
		prev = 46044,
		id = 46045,
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
	[46046] = {
		trans_use_gold = 0,
		next = 0,
		base = 46040,
		restore_gold = 840,
		destory_gold = 219,
		prev = 46045,
		id = 46046,
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
	[46100] = {
		important = 1,
		destory_gold = 1,
		type = 6,
		group = 46100,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 46101,
		prev = 0,
		id = 46100,
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
		restore_item = {}
	},
	[46101] = {
		trans_use_gold = 60,
		next = 46102,
		base = 46100,
		restore_gold = 20,
		destory_gold = 6,
		prev = 46100,
		id = 46101,
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
	[46102] = {
		trans_use_gold = 100,
		next = 46103,
		base = 46100,
		restore_gold = 80,
		destory_gold = 21,
		prev = 46101,
		id = 46102,
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
	[46103] = {
		trans_use_gold = 0,
		next = 0,
		base = 46100,
		restore_gold = 180,
		destory_gold = 46,
		prev = 46102,
		id = 46103,
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
	[46120] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 46120,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 46121,
		prev = 0,
		id = 46120,
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
		restore_item = {}
	},
	[46121] = {
		trans_use_gold = 60,
		next = 46122,
		base = 46120,
		restore_gold = 20,
		destory_gold = 9,
		prev = 46120,
		id = 46121,
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
	[46122] = {
		trans_use_gold = 100,
		next = 46123,
		base = 46120,
		restore_gold = 80,
		destory_gold = 24,
		prev = 46121,
		id = 46122,
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
	[46123] = {
		trans_use_gold = 0,
		next = 0,
		base = 46120,
		restore_gold = 180,
		destory_gold = 49,
		prev = 46122,
		id = 46123,
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
	[46140] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 46140,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 46141,
		prev = 0,
		id = 46140,
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
		restore_item = {}
	},
	[46141] = {
		trans_use_gold = 60,
		next = 46142,
		base = 46140,
		restore_gold = 20,
		destory_gold = 14,
		prev = 46140,
		id = 46141,
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
	[46142] = {
		trans_use_gold = 100,
		next = 46143,
		base = 46140,
		restore_gold = 80,
		destory_gold = 29,
		prev = 46141,
		id = 46142,
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
	[46143] = {
		trans_use_gold = 160,
		next = 46144,
		base = 46140,
		restore_gold = 180,
		destory_gold = 54,
		prev = 46142,
		id = 46143,
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
	[46144] = {
		trans_use_gold = 220,
		next = 46145,
		base = 46140,
		restore_gold = 340,
		destory_gold = 94,
		prev = 46143,
		id = 46144,
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
	[46145] = {
		trans_use_gold = 280,
		next = 46146,
		base = 46140,
		restore_gold = 560,
		destory_gold = 149,
		prev = 46144,
		id = 46145,
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
	[46146] = {
		trans_use_gold = 0,
		next = 0,
		base = 46140,
		restore_gold = 840,
		destory_gold = 219,
		prev = 46145,
		id = 46146,
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
	[46200] = {
		important = 1,
		destory_gold = 4,
		type = 6,
		group = 46200,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 46201,
		prev = 0,
		id = 46200,
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
		restore_item = {}
	},
	[46201] = {
		trans_use_gold = 60,
		next = 46202,
		base = 46200,
		restore_gold = 20,
		destory_gold = 9,
		prev = 46200,
		id = 46201,
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
	[46202] = {
		trans_use_gold = 100,
		next = 46203,
		base = 46200,
		restore_gold = 80,
		destory_gold = 24,
		prev = 46201,
		id = 46202,
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
	[46203] = {
		trans_use_gold = 0,
		next = 0,
		base = 46200,
		restore_gold = 180,
		destory_gold = 49,
		prev = 46202,
		id = 46203,
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
	[46220] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 46220,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 46221,
		prev = 0,
		id = 46220,
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
		restore_item = {}
	},
	[46221] = {
		trans_use_gold = 60,
		next = 46222,
		base = 46220,
		restore_gold = 20,
		destory_gold = 14,
		prev = 46220,
		id = 46221,
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
	[46222] = {
		trans_use_gold = 100,
		next = 46223,
		base = 46220,
		restore_gold = 80,
		destory_gold = 29,
		prev = 46221,
		id = 46222,
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
	[46223] = {
		trans_use_gold = 160,
		next = 46224,
		base = 46220,
		restore_gold = 180,
		destory_gold = 54,
		prev = 46222,
		id = 46223,
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
	[46224] = {
		trans_use_gold = 220,
		next = 46225,
		base = 46220,
		restore_gold = 340,
		destory_gold = 94,
		prev = 46223,
		id = 46224,
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
	[46225] = {
		trans_use_gold = 280,
		next = 46226,
		base = 46220,
		restore_gold = 560,
		destory_gold = 149,
		prev = 46224,
		id = 46225,
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
	[46226] = {
		trans_use_gold = 0,
		next = 0,
		base = 46220,
		restore_gold = 840,
		destory_gold = 219,
		prev = 46225,
		id = 46226,
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
	[46240] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 46240,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 46241,
		prev = 0,
		id = 46240,
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
		restore_item = {}
	},
	[46241] = {
		trans_use_gold = 60,
		next = 46242,
		base = 46240,
		restore_gold = 20,
		destory_gold = 21,
		prev = 46240,
		id = 46241,
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
	[46242] = {
		trans_use_gold = 100,
		next = 46243,
		base = 46240,
		restore_gold = 80,
		destory_gold = 36,
		prev = 46241,
		id = 46242,
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
	[46243] = {
		trans_use_gold = 160,
		next = 46244,
		base = 46240,
		restore_gold = 180,
		destory_gold = 61,
		prev = 46242,
		id = 46243,
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
	[46244] = {
		trans_use_gold = 220,
		next = 46245,
		base = 46240,
		restore_gold = 340,
		destory_gold = 101,
		prev = 46243,
		id = 46244,
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
	[46245] = {
		trans_use_gold = 280,
		next = 46246,
		base = 46240,
		restore_gold = 560,
		destory_gold = 156,
		prev = 46244,
		id = 46245,
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
	[46246] = {
		trans_use_gold = 360,
		next = 46247,
		base = 46240,
		restore_gold = 840,
		destory_gold = 226,
		prev = 46245,
		id = 46246,
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
	[46247] = {
		trans_use_gold = 440,
		next = 46248,
		base = 46240,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 46246,
		id = 46247,
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
	[46248] = {
		trans_use_gold = 520,
		next = 46249,
		base = 46240,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 46247,
		id = 46248,
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
	[46249] = {
		trans_use_gold = 600,
		next = 46250,
		base = 46240,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 46248,
		id = 46249,
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
	[46250] = {
		trans_use_gold = 0,
		next = 0,
		base = 46240,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 46249,
		id = 46250,
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
	[46300] = {
		important = 1,
		destory_gold = 9,
		type = 6,
		group = 46300,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 46301,
		prev = 0,
		id = 46300,
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
		restore_item = {}
	},
	[46301] = {
		trans_use_gold = 60,
		next = 46302,
		base = 46300,
		restore_gold = 20,
		destory_gold = 14,
		prev = 46300,
		id = 46301,
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
	[46302] = {
		trans_use_gold = 100,
		next = 46303,
		base = 46300,
		restore_gold = 80,
		destory_gold = 29,
		prev = 46301,
		id = 46302,
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
	[46303] = {
		trans_use_gold = 160,
		next = 46304,
		base = 46300,
		restore_gold = 180,
		destory_gold = 54,
		prev = 46302,
		id = 46303,
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
	[46304] = {
		trans_use_gold = 220,
		next = 46305,
		base = 46300,
		restore_gold = 340,
		destory_gold = 94,
		prev = 46303,
		id = 46304,
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
	[46305] = {
		trans_use_gold = 280,
		next = 46306,
		base = 46300,
		restore_gold = 560,
		destory_gold = 149,
		prev = 46304,
		id = 46305,
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
	[46306] = {
		trans_use_gold = 0,
		next = 0,
		base = 46300,
		restore_gold = 840,
		destory_gold = 219,
		prev = 46305,
		id = 46306,
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
	[46320] = {
		important = 1,
		destory_gold = 16,
		type = 6,
		group = 46320,
		trans_use_gold = 20,
		restore_gold = 0,
		next = 46321,
		prev = 0,
		id = 46320,
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
		restore_item = {}
	},
	[46321] = {
		trans_use_gold = 60,
		next = 46322,
		base = 46320,
		restore_gold = 20,
		destory_gold = 21,
		prev = 46320,
		id = 46321,
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
	[46322] = {
		trans_use_gold = 100,
		next = 46323,
		base = 46320,
		restore_gold = 80,
		destory_gold = 36,
		prev = 46321,
		id = 46322,
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
	[46323] = {
		trans_use_gold = 160,
		next = 46324,
		base = 46320,
		restore_gold = 180,
		destory_gold = 61,
		prev = 46322,
		id = 46323,
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
	[46324] = {
		trans_use_gold = 220,
		next = 46325,
		base = 46320,
		restore_gold = 340,
		destory_gold = 101,
		prev = 46323,
		id = 46324,
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
	[46325] = {
		trans_use_gold = 280,
		next = 46326,
		base = 46320,
		restore_gold = 560,
		destory_gold = 156,
		prev = 46324,
		id = 46325,
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
	[46326] = {
		trans_use_gold = 360,
		next = 46327,
		base = 46320,
		restore_gold = 840,
		destory_gold = 226,
		prev = 46325,
		id = 46326,
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
	[46327] = {
		trans_use_gold = 440,
		next = 46328,
		base = 46320,
		restore_gold = 1200,
		destory_gold = 316,
		prev = 46326,
		id = 46327,
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
	[46328] = {
		trans_use_gold = 520,
		next = 46329,
		base = 46320,
		restore_gold = 1640,
		destory_gold = 426,
		prev = 46327,
		id = 46328,
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
	[46329] = {
		trans_use_gold = 600,
		next = 46330,
		base = 46320,
		restore_gold = 2160,
		destory_gold = 556,
		prev = 46328,
		id = 46329,
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
	[46330] = {
		trans_use_gold = 0,
		next = 0,
		base = 46320,
		restore_gold = 2760,
		destory_gold = 706,
		prev = 46329,
		id = 46330,
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
	[46340] = {
		important = 1,
		destory_gold = 25,
		type = 6,
		group = 46340,
		trans_use_gold = 30,
		restore_gold = 0,
		next = 46341,
		prev = 0,
		id = 46340,
		equip_limit = 0,
		level = 1,
		ship_type_forbidden = {},
		trans_use_item = {
			{
				17031,
				2
			}
		},
		destory_item = {
			{
				17033,
				1
			}
		},
		restore_item = {}
	},
	[46341] = {
		trans_use_gold = 90,
		next = 46342,
		base = 46340,
		restore_gold = 20,
		destory_gold = 33,
		prev = 46340,
		id = 46341,
		level = 2,
		trans_use_item = {
			{
				17031,
				5
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
	[46342] = {
		trans_use_gold = 150,
		next = 46343,
		base = 46340,
		restore_gold = 80,
		destory_gold = 55,
		prev = 46341,
		id = 46342,
		level = 3,
		trans_use_item = {
			{
				17031,
				8
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
	[46343] = {
		trans_use_gold = 240,
		next = 46344,
		base = 46340,
		restore_gold = 180,
		destory_gold = 93,
		prev = 46342,
		id = 46343,
		level = 4,
		trans_use_item = {
			{
				17032,
				12
			}
		},
		destory_item = {
			{
				17031,
				4
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
	[46344] = {
		trans_use_gold = 330,
		next = 46345,
		base = 46340,
		restore_gold = 340,
		destory_gold = 153,
		prev = 46343,
		id = 46344,
		level = 5,
		trans_use_item = {
			{
				17032,
				16
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
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
			},
			{
				17032,
				8
			}
		}
	},
	[46345] = {
		trans_use_gold = 420,
		next = 46346,
		base = 46340,
		restore_gold = 560,
		destory_gold = 235,
		prev = 46344,
		id = 46345,
		level = 6,
		trans_use_item = {
			{
				17032,
				21
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				7
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
	[46346] = {
		trans_use_gold = 540,
		next = 46347,
		base = 46340,
		restore_gold = 840,
		destory_gold = 340,
		prev = 46345,
		id = 46346,
		level = 7,
		trans_use_item = {
			{
				17033,
				27
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
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
	[46347] = {
		trans_use_gold = 660,
		next = 46348,
		base = 46340,
		restore_gold = 1200,
		destory_gold = 475,
		prev = 46346,
		id = 46347,
		level = 8,
		trans_use_item = {
			{
				17033,
				33
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
			},
			{
				17033,
				7
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
	[46348] = {
		trans_use_gold = 780,
		next = 46349,
		base = 46340,
		restore_gold = 1640,
		destory_gold = 640,
		prev = 46347,
		id = 46348,
		level = 9,
		trans_use_item = {
			{
				17033,
				39
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
			},
			{
				17033,
				15
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
	[46349] = {
		trans_use_gold = 900,
		next = 46350,
		base = 46340,
		restore_gold = 2160,
		destory_gold = 835,
		prev = 46348,
		id = 46349,
		level = 10,
		trans_use_item = {
			{
				17033,
				45
			}
		},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
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
				66
			}
		}
	},
	[46350] = {
		trans_use_gold = 0,
		next = 0,
		base = 46340,
		restore_gold = 2760,
		destory_gold = 1060,
		prev = 46349,
		id = 46350,
		level = 11,
		trans_use_item = {},
		destory_item = {
			{
				17031,
				4
			},
			{
				17032,
				12
			},
			{
				17033,
				36
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
	all = {
		500,
		501,
		502,
		503,
		504,
		505,
		506,
		507,
		508,
		509,
		510,
		520,
		521,
		522,
		523,
		524,
		525,
		526,
		527,
		528,
		529,
		530,
		540,
		541,
		542,
		543,
		544,
		545,
		546,
		547,
		548,
		549,
		550,
		640,
		641,
		642,
		643,
		644,
		645,
		646,
		647,
		648,
		649,
		650,
		1000,
		1001,
		1002,
		1003,
		1004,
		1005,
		1006,
		1020,
		1021,
		1022,
		1023,
		1024,
		1025,
		1026,
		1027,
		1028,
		1029,
		1030,
		1040,
		1041,
		1042,
		1043,
		1044,
		1045,
		1046,
		1047,
		1048,
		1049,
		1050,
		1100,
		1101,
		1102,
		1103,
		1120,
		1121,
		1122,
		1123,
		1124,
		1125,
		1126,
		1140,
		1141,
		1142,
		1143,
		1144,
		1145,
		1146,
		1147,
		1148,
		1149,
		1150,
		1200,
		1201,
		1202,
		1203,
		1220,
		1221,
		1222,
		1223,
		1224,
		1225,
		1226,
		1240,
		1241,
		1242,
		1243,
		1244,
		1245,
		1246,
		1247,
		1248,
		1249,
		1250,
		1300,
		1301,
		1302,
		1303,
		1320,
		1321,
		1322,
		1323,
		1324,
		1325,
		1326,
		1340,
		1341,
		1342,
		1343,
		1344,
		1345,
		1346,
		1347,
		1348,
		1349,
		1350,
		1400,
		1401,
		1402,
		1403,
		1404,
		1405,
		1406,
		1420,
		1421,
		1422,
		1423,
		1424,
		1425,
		1426,
		1427,
		1428,
		1429,
		1430,
		1440,
		1441,
		1442,
		1443,
		1444,
		1445,
		1446,
		1447,
		1448,
		1449,
		1450,
		1500,
		1501,
		1502,
		1503,
		1504,
		1505,
		1506,
		1520,
		1521,
		1522,
		1523,
		1524,
		1525,
		1526,
		1527,
		1528,
		1529,
		1530,
		1540,
		1541,
		1542,
		1543,
		1544,
		1545,
		1546,
		1547,
		1548,
		1549,
		1550,
		1600,
		1601,
		1602,
		1603,
		1620,
		1621,
		1622,
		1623,
		1640,
		1641,
		1642,
		1643,
		1644,
		1645,
		1646,
		1700,
		1701,
		1702,
		1703,
		1720,
		1721,
		1722,
		1723,
		1740,
		1741,
		1742,
		1743,
		1744,
		1745,
		1746,
		1800,
		1801,
		1802,
		1803,
		1820,
		1821,
		1822,
		1823,
		1824,
		1825,
		1826,
		1840,
		1841,
		1842,
		1843,
		1844,
		1845,
		1846,
		1847,
		1848,
		1849,
		1850,
		1900,
		1901,
		1902,
		1903,
		1920,
		1921,
		1922,
		1923,
		1940,
		1941,
		1942,
		1943,
		1944,
		1945,
		1946,
		2000,
		2001,
		2002,
		2003,
		2020,
		2021,
		2022,
		2023,
		2024,
		2025,
		2026,
		2040,
		2041,
		2042,
		2043,
		2044,
		2045,
		2046,
		2047,
		2048,
		2049,
		2050,
		2100,
		2101,
		2102,
		2103,
		2120,
		2121,
		2122,
		2123,
		2124,
		2125,
		2126,
		2140,
		2141,
		2142,
		2143,
		2144,
		2145,
		2146,
		2147,
		2148,
		2149,
		2150,
		2200,
		2201,
		2202,
		2203,
		2220,
		2221,
		2222,
		2223,
		2224,
		2225,
		2226,
		2240,
		2241,
		2242,
		2243,
		2244,
		2245,
		2246,
		2247,
		2248,
		2249,
		2250,
		2300,
		2301,
		2302,
		2303,
		2320,
		2321,
		2322,
		2323,
		2324,
		2325,
		2326,
		2340,
		2341,
		2342,
		2343,
		2344,
		2345,
		2346,
		2347,
		2348,
		2349,
		2350,
		2400,
		2401,
		2402,
		2403,
		2420,
		2421,
		2422,
		2423,
		2424,
		2425,
		2426,
		2440,
		2441,
		2442,
		2443,
		2444,
		2445,
		2446,
		2447,
		2448,
		2449,
		2450,
		2500,
		2501,
		2502,
		2503,
		2520,
		2521,
		2522,
		2523,
		2540,
		2541,
		2542,
		2543,
		2544,
		2545,
		2546,
		2600,
		2601,
		2602,
		2603,
		2604,
		2605,
		2606,
		2607,
		2608,
		2609,
		2610,
		2620,
		2621,
		2622,
		2623,
		2624,
		2625,
		2626,
		2627,
		2628,
		2629,
		2630,
		2640,
		2641,
		2642,
		2643,
		2644,
		2645,
		2646,
		2647,
		2648,
		2649,
		2650,
		5000,
		5001,
		5002,
		5003,
		5020,
		5021,
		5022,
		5023,
		5040,
		5041,
		5042,
		5043,
		5044,
		5045,
		5046,
		5100,
		5101,
		5102,
		5103,
		5120,
		5121,
		5122,
		5123,
		5124,
		5125,
		5126,
		5140,
		5141,
		5142,
		5143,
		5144,
		5145,
		5146,
		5147,
		5148,
		5149,
		5150,
		5200,
		5201,
		5202,
		5203,
		5204,
		5205,
		5206,
		5220,
		5221,
		5222,
		5223,
		5224,
		5225,
		5226,
		5227,
		5228,
		5229,
		5230,
		5240,
		5241,
		5242,
		5243,
		5244,
		5245,
		5246,
		5247,
		5248,
		5249,
		5250,
		6000,
		6001,
		6002,
		6003,
		6020,
		6021,
		6022,
		6023,
		6040,
		6041,
		6042,
		6043,
		6044,
		6045,
		6046,
		7000,
		7001,
		7002,
		7003,
		7020,
		7021,
		7022,
		7023,
		7040,
		7041,
		7042,
		7043,
		7044,
		7045,
		7046,
		7100,
		7101,
		7102,
		7103,
		7120,
		7121,
		7122,
		7123,
		7140,
		7141,
		7142,
		7143,
		7144,
		7145,
		7146,
		11000,
		11001,
		11002,
		11003,
		11020,
		11021,
		11022,
		11023,
		11040,
		11041,
		11042,
		11043,
		11044,
		11045,
		11046,
		11100,
		11101,
		11102,
		11103,
		11120,
		11121,
		11122,
		11123,
		11124,
		11125,
		11126,
		11140,
		11141,
		11142,
		11143,
		11144,
		11145,
		11146,
		11147,
		11148,
		11149,
		11150,
		11200,
		11201,
		11202,
		11203,
		11204,
		11205,
		11206,
		11220,
		11221,
		11222,
		11223,
		11224,
		11225,
		11226,
		11227,
		11228,
		11229,
		11230,
		11240,
		11241,
		11242,
		11243,
		11244,
		11245,
		11246,
		11247,
		11248,
		11249,
		11250,
		12000,
		12001,
		12002,
		12003,
		12020,
		12021,
		12022,
		12023,
		12040,
		12041,
		12042,
		12043,
		12044,
		12045,
		12046,
		12100,
		12101,
		12102,
		12103,
		12120,
		12121,
		12122,
		12123,
		12124,
		12125,
		12126,
		12140,
		12141,
		12142,
		12143,
		12144,
		12145,
		12146,
		12147,
		12148,
		12149,
		12150,
		13000,
		13001,
		13002,
		13003,
		13020,
		13021,
		13022,
		13023,
		13040,
		13041,
		13042,
		13043,
		13044,
		13045,
		13046,
		13100,
		13101,
		13102,
		13103,
		13120,
		13121,
		13122,
		13123,
		13124,
		13125,
		13126,
		13140,
		13141,
		13142,
		13143,
		13144,
		13145,
		13146,
		13147,
		13148,
		13149,
		13150,
		14100,
		14101,
		14102,
		14103,
		14120,
		14121,
		14122,
		14123,
		14140,
		14141,
		14142,
		14143,
		14144,
		14145,
		14146,
		14200,
		14201,
		14202,
		14203,
		14220,
		14221,
		14222,
		14223,
		14224,
		14225,
		14226,
		14240,
		14241,
		14242,
		14243,
		14244,
		14245,
		14246,
		14247,
		14248,
		14249,
		14250,
		14300,
		14301,
		14302,
		14303,
		14320,
		14321,
		14322,
		14323,
		14324,
		14325,
		14326,
		14340,
		14341,
		14342,
		14343,
		14344,
		14345,
		14346,
		14347,
		14348,
		14349,
		14350,
		16000,
		16001,
		16002,
		16003,
		16020,
		16021,
		16022,
		16023,
		16040,
		16041,
		16042,
		16043,
		16044,
		16045,
		16046,
		16100,
		16101,
		16102,
		16103,
		16120,
		16121,
		16122,
		16123,
		16124,
		16125,
		16126,
		16140,
		16141,
		16142,
		16143,
		16144,
		16145,
		16146,
		16147,
		16148,
		16149,
		16150,
		16200,
		16201,
		16202,
		16203,
		16220,
		16221,
		16222,
		16223,
		16224,
		16225,
		16226,
		16240,
		16241,
		16242,
		16243,
		16244,
		16245,
		16246,
		16247,
		16248,
		16249,
		16250,
		16300,
		16301,
		16302,
		16303,
		16320,
		16321,
		16322,
		16323,
		16324,
		16325,
		16326,
		16340,
		16341,
		16342,
		16343,
		16344,
		16345,
		16346,
		16347,
		16348,
		16349,
		16350,
		16400,
		16401,
		16402,
		16403,
		16404,
		16405,
		16406,
		16420,
		16421,
		16422,
		16423,
		16424,
		16425,
		16426,
		16427,
		16428,
		16429,
		16430,
		16440,
		16441,
		16442,
		16443,
		16444,
		16445,
		16446,
		16447,
		16448,
		16449,
		16450,
		17000,
		17001,
		17002,
		17003,
		17020,
		17021,
		17022,
		17023,
		17040,
		17041,
		17042,
		17043,
		17044,
		17045,
		17046,
		17100,
		17101,
		17102,
		17103,
		17120,
		17121,
		17122,
		17123,
		17124,
		17125,
		17126,
		17140,
		17141,
		17142,
		17143,
		17144,
		17145,
		17146,
		17147,
		17148,
		17149,
		17150,
		17200,
		17201,
		17202,
		17203,
		17220,
		17221,
		17222,
		17223,
		17224,
		17225,
		17226,
		17240,
		17241,
		17242,
		17243,
		17244,
		17245,
		17246,
		17247,
		17248,
		17249,
		17250,
		17300,
		17301,
		17302,
		17303,
		17304,
		17305,
		17306,
		17320,
		17321,
		17322,
		17323,
		17324,
		17325,
		17326,
		17327,
		17328,
		17329,
		17330,
		17340,
		17341,
		17342,
		17343,
		17344,
		17345,
		17346,
		17347,
		17348,
		17349,
		17350,
		18000,
		18001,
		18002,
		18003,
		18020,
		18021,
		18022,
		18023,
		18040,
		18041,
		18042,
		18043,
		18044,
		18045,
		18046,
		18100,
		18101,
		18102,
		18103,
		18120,
		18121,
		18122,
		18123,
		18124,
		18125,
		18126,
		18140,
		18141,
		18142,
		18143,
		18144,
		18145,
		18146,
		18147,
		18148,
		18149,
		18150,
		19000,
		19001,
		19002,
		19003,
		19020,
		19021,
		19022,
		19023,
		19040,
		19041,
		19042,
		19043,
		19044,
		19045,
		19046,
		19100,
		19101,
		19102,
		19103,
		19120,
		19121,
		19122,
		19123,
		19124,
		19125,
		19126,
		19140,
		19141,
		19142,
		19143,
		19144,
		19145,
		19146,
		19147,
		19148,
		19149,
		19150,
		19200,
		19201,
		19202,
		19203,
		19204,
		19205,
		19206,
		19220,
		19221,
		19222,
		19223,
		19224,
		19225,
		19226,
		19227,
		19228,
		19229,
		19230,
		19240,
		19241,
		19242,
		19243,
		19244,
		19245,
		19246,
		19247,
		19248,
		19249,
		19250,
		21000,
		21001,
		21002,
		21003,
		21020,
		21021,
		21022,
		21023,
		21040,
		21041,
		21042,
		21043,
		21044,
		21045,
		21046,
		21100,
		21101,
		21102,
		21103,
		21120,
		21121,
		21122,
		21123,
		21140,
		21141,
		21142,
		21143,
		21144,
		21145,
		21146,
		21200,
		21201,
		21202,
		21203,
		21220,
		21221,
		21222,
		21223,
		21224,
		21225,
		21226,
		21240,
		21241,
		21242,
		21243,
		21244,
		21245,
		21246,
		21247,
		21248,
		21249,
		21250,
		21300,
		21301,
		21302,
		21303,
		21320,
		21321,
		21322,
		21323,
		21340,
		21341,
		21342,
		21343,
		21344,
		21345,
		21346,
		21400,
		21401,
		21402,
		21403,
		21420,
		21421,
		21422,
		21423,
		21424,
		21425,
		21426,
		21440,
		21441,
		21442,
		21443,
		21444,
		21445,
		21446,
		21447,
		21448,
		21449,
		21450,
		21500,
		21501,
		21502,
		21503,
		21520,
		21521,
		21522,
		21523,
		21524,
		21525,
		21526,
		21540,
		21541,
		21542,
		21543,
		21544,
		21545,
		21546,
		21547,
		21548,
		21549,
		21550,
		22000,
		22001,
		22002,
		22003,
		22020,
		22021,
		22022,
		22023,
		22040,
		22041,
		22042,
		22043,
		22044,
		22045,
		22046,
		22100,
		22101,
		22102,
		22103,
		22120,
		22121,
		22122,
		22123,
		22124,
		22125,
		22126,
		22140,
		22141,
		22142,
		22143,
		22144,
		22145,
		22146,
		22147,
		22148,
		22149,
		22150,
		22200,
		22201,
		22202,
		22203,
		22220,
		22221,
		22222,
		22223,
		22224,
		22225,
		22226,
		22240,
		22241,
		22242,
		22243,
		22244,
		22245,
		22246,
		22247,
		22248,
		22249,
		22250,
		23000,
		23001,
		23002,
		23003,
		23020,
		23021,
		23022,
		23023,
		23024,
		23025,
		23026,
		23040,
		23041,
		23042,
		23043,
		23044,
		23045,
		23046,
		23047,
		23048,
		23049,
		23050,
		24000,
		24001,
		24002,
		24003,
		24004,
		24005,
		24006,
		24020,
		24021,
		24022,
		24023,
		24024,
		24025,
		24026,
		24027,
		24028,
		24029,
		24030,
		24040,
		24041,
		24042,
		24043,
		24044,
		24045,
		24046,
		24047,
		24048,
		24049,
		24050,
		24100,
		24101,
		24102,
		24103,
		24120,
		24121,
		24122,
		24123,
		24124,
		24125,
		24126,
		24140,
		24141,
		24142,
		24143,
		24144,
		24145,
		24146,
		24147,
		24148,
		24149,
		24150,
		24200,
		24201,
		24202,
		24203,
		24204,
		24205,
		24206,
		24220,
		24221,
		24222,
		24223,
		24224,
		24225,
		24226,
		24227,
		24228,
		24229,
		24230,
		24240,
		24241,
		24242,
		24243,
		24244,
		24245,
		24246,
		24247,
		24248,
		24249,
		24250,
		26000,
		26001,
		26002,
		26003,
		26020,
		26021,
		26022,
		26023,
		26040,
		26041,
		26042,
		26043,
		26044,
		26045,
		26046,
		26100,
		26101,
		26102,
		26103,
		26120,
		26121,
		26122,
		26123,
		26124,
		26125,
		26126,
		26140,
		26141,
		26142,
		26143,
		26144,
		26145,
		26146,
		26147,
		26148,
		26149,
		26150,
		26200,
		26201,
		26202,
		26203,
		26204,
		26205,
		26206,
		26220,
		26221,
		26222,
		26223,
		26224,
		26225,
		26226,
		26227,
		26228,
		26229,
		26230,
		26240,
		26241,
		26242,
		26243,
		26244,
		26245,
		26246,
		26247,
		26248,
		26249,
		26250,
		26300,
		26301,
		26302,
		26303,
		26320,
		26321,
		26322,
		26323,
		26324,
		26325,
		26326,
		26340,
		26341,
		26342,
		26343,
		26344,
		26345,
		26346,
		26347,
		26348,
		26349,
		26350,
		26400,
		26401,
		26402,
		26403,
		26420,
		26421,
		26422,
		26423,
		26424,
		26425,
		26426,
		26440,
		26441,
		26442,
		26443,
		26444,
		26445,
		26446,
		26447,
		26448,
		26449,
		26450,
		26500,
		26501,
		26502,
		26503,
		26504,
		26505,
		26506,
		26520,
		26521,
		26522,
		26523,
		26524,
		26525,
		26526,
		26527,
		26528,
		26529,
		26530,
		26540,
		26541,
		26542,
		26543,
		26544,
		26545,
		26546,
		26547,
		26548,
		26549,
		26550,
		27000,
		27001,
		27002,
		27003,
		27020,
		27021,
		27022,
		27023,
		27024,
		27025,
		27026,
		27040,
		27041,
		27042,
		27043,
		27044,
		27045,
		27046,
		27047,
		27048,
		27049,
		27050,
		27100,
		27101,
		27102,
		27103,
		27104,
		27105,
		27106,
		27120,
		27121,
		27122,
		27123,
		27124,
		27125,
		27126,
		27127,
		27128,
		27129,
		27130,
		27140,
		27141,
		27142,
		27143,
		27144,
		27145,
		27146,
		27147,
		27148,
		27149,
		27150,
		28000,
		28001,
		28002,
		28003,
		28020,
		28021,
		28022,
		28023,
		28024,
		28025,
		28026,
		28040,
		28041,
		28042,
		28043,
		28044,
		28045,
		28046,
		28047,
		28048,
		28049,
		28050,
		28100,
		28101,
		28102,
		28103,
		28104,
		28105,
		28106,
		28120,
		28121,
		28122,
		28123,
		28124,
		28125,
		28126,
		28127,
		28128,
		28129,
		28130,
		28140,
		28141,
		28142,
		28143,
		28144,
		28145,
		28146,
		28147,
		28148,
		28149,
		28150,
		29000,
		29001,
		29002,
		29003,
		29020,
		29021,
		29022,
		29023,
		29040,
		29041,
		29042,
		29043,
		29044,
		29045,
		29046,
		29100,
		29101,
		29102,
		29103,
		29120,
		29121,
		29122,
		29123,
		29124,
		29125,
		29126,
		29140,
		29141,
		29142,
		29143,
		29144,
		29145,
		29146,
		29147,
		29148,
		29149,
		29150,
		30000,
		30001,
		30002,
		30003,
		30004,
		30005,
		30006,
		31000,
		31001,
		31002,
		31003,
		31004,
		31005,
		31006,
		31020,
		31021,
		31022,
		31023,
		31024,
		31025,
		31026,
		31027,
		31028,
		31029,
		31030,
		31040,
		31041,
		31042,
		31043,
		31044,
		31045,
		31046,
		31047,
		31048,
		31049,
		31050,
		31100,
		31101,
		31102,
		31103,
		31120,
		31121,
		31122,
		31123,
		31140,
		31141,
		31142,
		31143,
		31144,
		31145,
		31146,
		31200,
		31201,
		31202,
		31203,
		31220,
		31221,
		31222,
		31223,
		31224,
		31225,
		31226,
		31240,
		31241,
		31242,
		31243,
		31244,
		31245,
		31246,
		31247,
		31248,
		31249,
		31250,
		32000,
		32001,
		32002,
		32003,
		32020,
		32021,
		32022,
		32023,
		32040,
		32041,
		32042,
		32043,
		32044,
		32045,
		32046,
		32100,
		32101,
		32102,
		32103,
		32120,
		32121,
		32122,
		32123,
		32124,
		32125,
		32126,
		32140,
		32141,
		32142,
		32143,
		32144,
		32145,
		32146,
		32147,
		32148,
		32149,
		32150,
		32200,
		32201,
		32202,
		32203,
		32204,
		32205,
		32206,
		32220,
		32221,
		32222,
		32223,
		32224,
		32225,
		32226,
		32227,
		32228,
		32229,
		32230,
		32240,
		32241,
		32242,
		32243,
		32244,
		32245,
		32246,
		32247,
		32248,
		32249,
		32250,
		33000,
		33001,
		33002,
		33003,
		33020,
		33021,
		33022,
		33023,
		33024,
		33025,
		33026,
		33040,
		33041,
		33042,
		33043,
		33044,
		33045,
		33046,
		33047,
		33048,
		33049,
		33050,
		34000,
		34001,
		34002,
		34003,
		34020,
		34021,
		34022,
		34023,
		34040,
		34041,
		34042,
		34043,
		34044,
		34045,
		34046,
		34100,
		34101,
		34102,
		34103,
		34120,
		34121,
		34122,
		34123,
		34124,
		34125,
		34126,
		34140,
		34141,
		34142,
		34143,
		34144,
		34145,
		34146,
		34147,
		34148,
		34149,
		34150,
		34160,
		34161,
		34162,
		34163,
		34164,
		34165,
		34166,
		34167,
		34168,
		34169,
		34170,
		35000,
		35001,
		35002,
		35003,
		35020,
		35021,
		35022,
		35023,
		35040,
		35041,
		35042,
		35043,
		35044,
		35045,
		35046,
		35100,
		35101,
		35102,
		35103,
		35120,
		35121,
		35122,
		35123,
		35124,
		35125,
		35126,
		35140,
		35141,
		35142,
		35143,
		35144,
		35145,
		35146,
		35147,
		35148,
		35149,
		35150,
		35200,
		35201,
		35202,
		35203,
		35204,
		35205,
		35206,
		35220,
		35221,
		35222,
		35223,
		35224,
		35225,
		35226,
		35227,
		35228,
		35229,
		35230,
		35240,
		35241,
		35242,
		35243,
		35244,
		35245,
		35246,
		35247,
		35248,
		35249,
		35250,
		36100,
		36101,
		36102,
		36103,
		36120,
		36121,
		36122,
		36123,
		36140,
		36141,
		36142,
		36143,
		36144,
		36145,
		36146,
		36200,
		36201,
		36202,
		36203,
		36220,
		36221,
		36222,
		36223,
		36224,
		36225,
		36226,
		36240,
		36241,
		36242,
		36243,
		36244,
		36245,
		36246,
		36247,
		36248,
		36249,
		36250,
		36300,
		36301,
		36302,
		36303,
		36320,
		36321,
		36322,
		36323,
		36324,
		36325,
		36326,
		36340,
		36341,
		36342,
		36343,
		36344,
		36345,
		36346,
		36347,
		36348,
		36349,
		36350,
		36400,
		36401,
		36402,
		36403,
		36420,
		36421,
		36422,
		36423,
		36424,
		36425,
		36426,
		36440,
		36441,
		36442,
		36443,
		36444,
		36445,
		36446,
		36447,
		36448,
		36449,
		36450,
		36500,
		36501,
		36502,
		36503,
		36520,
		36521,
		36522,
		36523,
		36524,
		36525,
		36526,
		36540,
		36541,
		36542,
		36543,
		36544,
		36545,
		36546,
		36547,
		36548,
		36549,
		36550,
		36600,
		36601,
		36602,
		36603,
		36620,
		36621,
		36622,
		36623,
		36624,
		36625,
		36626,
		36640,
		36641,
		36642,
		36643,
		36644,
		36645,
		36646,
		36647,
		36648,
		36649,
		36650,
		37000,
		37001,
		37002,
		37003,
		37020,
		37021,
		37022,
		37023,
		37040,
		37041,
		37042,
		37043,
		37044,
		37045,
		37046,
		37100,
		37101,
		37102,
		37103,
		37120,
		37121,
		37122,
		37123,
		37124,
		37125,
		37126,
		37140,
		37141,
		37142,
		37143,
		37144,
		37145,
		37146,
		37147,
		37148,
		37149,
		37150,
		37200,
		37201,
		37202,
		37203,
		37204,
		37205,
		37206,
		37220,
		37221,
		37222,
		37223,
		37224,
		37225,
		37226,
		37227,
		37228,
		37229,
		37230,
		37240,
		37241,
		37242,
		37243,
		37244,
		37245,
		37246,
		37247,
		37248,
		37249,
		37250,
		37300,
		37301,
		37302,
		37303,
		37304,
		37305,
		37306,
		37320,
		37321,
		37322,
		37323,
		37324,
		37325,
		37326,
		37327,
		37328,
		37329,
		37330,
		37340,
		37341,
		37342,
		37343,
		37344,
		37345,
		37346,
		37347,
		37348,
		37349,
		37350,
		38000,
		38001,
		38002,
		38003,
		38020,
		38021,
		38022,
		38023,
		38040,
		38041,
		38042,
		38043,
		38044,
		38045,
		38046,
		38100,
		38101,
		38102,
		38103,
		38120,
		38121,
		38122,
		38123,
		38124,
		38125,
		38126,
		38140,
		38141,
		38142,
		38143,
		38144,
		38145,
		38146,
		38147,
		38148,
		38149,
		38150,
		38200,
		38201,
		38202,
		38203,
		38204,
		38205,
		38206,
		38220,
		38221,
		38222,
		38223,
		38224,
		38225,
		38226,
		38227,
		38228,
		38229,
		38230,
		38240,
		38241,
		38242,
		38243,
		38244,
		38245,
		38246,
		38247,
		38248,
		38249,
		38250,
		39000,
		39001,
		39002,
		39003,
		39020,
		39021,
		39022,
		39023,
		39024,
		39025,
		39026,
		39040,
		39041,
		39042,
		39043,
		39044,
		39045,
		39046,
		39047,
		39048,
		39049,
		39050,
		39100,
		39101,
		39102,
		39103,
		39104,
		39105,
		39106,
		39120,
		39121,
		39122,
		39123,
		39124,
		39125,
		39126,
		39127,
		39128,
		39129,
		39130,
		39140,
		39141,
		39142,
		39143,
		39144,
		39145,
		39146,
		39147,
		39148,
		39149,
		39150,
		39200,
		39201,
		39202,
		39203,
		39220,
		39221,
		39222,
		39223,
		39224,
		39225,
		39226,
		39240,
		39241,
		39242,
		39243,
		39244,
		39245,
		39246,
		39247,
		39248,
		39249,
		39250,
		41000,
		41001,
		41002,
		41003,
		41020,
		41021,
		41022,
		41023,
		41040,
		41041,
		41042,
		41043,
		41044,
		41045,
		41046,
		42000,
		42001,
		42002,
		42003,
		42020,
		42021,
		42022,
		42023,
		42024,
		42025,
		42026,
		42040,
		42041,
		42042,
		42043,
		42044,
		42045,
		42046,
		42047,
		42048,
		42049,
		42050,
		42100,
		42101,
		42102,
		42103,
		42120,
		42121,
		42122,
		42123,
		42124,
		42125,
		42126,
		42140,
		42141,
		42142,
		42143,
		42144,
		42145,
		42146,
		42147,
		42148,
		42149,
		42150,
		42200,
		42201,
		42202,
		42203,
		42220,
		42221,
		42222,
		42223,
		42224,
		42225,
		42226,
		42240,
		42241,
		42242,
		42243,
		42244,
		42245,
		42246,
		42247,
		42248,
		42249,
		42250,
		43000,
		43001,
		43002,
		43003,
		43004,
		43005,
		43006,
		43020,
		43021,
		43022,
		43023,
		43024,
		43025,
		43026,
		43027,
		43028,
		43029,
		43030,
		43040,
		43041,
		43042,
		43043,
		43044,
		43045,
		43046,
		43047,
		43048,
		43049,
		43050,
		46000,
		46001,
		46002,
		46003,
		46020,
		46021,
		46022,
		46023,
		46040,
		46041,
		46042,
		46043,
		46044,
		46045,
		46046,
		46100,
		46101,
		46102,
		46103,
		46120,
		46121,
		46122,
		46123,
		46140,
		46141,
		46142,
		46143,
		46144,
		46145,
		46146,
		46200,
		46201,
		46202,
		46203,
		46220,
		46221,
		46222,
		46223,
		46224,
		46225,
		46226,
		46240,
		46241,
		46242,
		46243,
		46244,
		46245,
		46246,
		46247,
		46248,
		46249,
		46250,
		46300,
		46301,
		46302,
		46303,
		46304,
		46305,
		46306,
		46320,
		46321,
		46322,
		46323,
		46324,
		46325,
		46326,
		46327,
		46328,
		46329,
		46330,
		46340,
		46341,
		46342,
		46343,
		46344,
		46345,
		46346,
		46347,
		46348,
		46349,
		46350
	}
}

return
