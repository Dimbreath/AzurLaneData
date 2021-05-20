pg = pg or {}
pg.equip_data_template_400 = {
	[95640] = {
		important = 1,
		destory_gold = 25,
		type = 2,
		group = 95640,
		restore_gold = 0,
		trans_use_gold = 30,
		next = 95641,
		prev = 0,
		id = 95640,
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
		restore_item = {},
		upgrade_formula_id = {}
	},
	[95641] = {
		trans_use_gold = 90,
		next = 95642,
		base = 95640,
		restore_gold = 30,
		destory_gold = 33,
		prev = 95640,
		id = 95641,
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
				2
			}
		}
	},
	[95642] = {
		trans_use_gold = 150,
		next = 95643,
		base = 95640,
		restore_gold = 120,
		destory_gold = 55,
		prev = 95641,
		id = 95642,
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
				7
			}
		}
	},
	[95643] = {
		trans_use_gold = 240,
		next = 95644,
		base = 95640,
		restore_gold = 270,
		destory_gold = 93,
		prev = 95642,
		id = 95643,
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
				15
			}
		}
	},
	[95644] = {
		trans_use_gold = 330,
		next = 95645,
		base = 95640,
		restore_gold = 510,
		destory_gold = 153,
		prev = 95643,
		id = 95644,
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
				15
			},
			{
				17012,
				12
			}
		}
	},
	[95645] = {
		trans_use_gold = 420,
		next = 95646,
		base = 95640,
		restore_gold = 840,
		destory_gold = 235,
		prev = 95644,
		id = 95645,
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
				15
			},
			{
				17012,
				28
			}
		}
	},
	[95646] = {
		trans_use_gold = 540,
		next = 95647,
		base = 95640,
		restore_gold = 1260,
		destory_gold = 340,
		prev = 95645,
		id = 95646,
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
				15
			},
			{
				17012,
				49
			}
		}
	},
	[95647] = {
		trans_use_gold = 660,
		next = 95648,
		base = 95640,
		restore_gold = 1800,
		destory_gold = 475,
		prev = 95646,
		id = 95647,
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
				15
			},
			{
				17012,
				49
			},
			{
				17013,
				27
			}
		}
	},
	[95648] = {
		trans_use_gold = 780,
		next = 95649,
		base = 95640,
		restore_gold = 2460,
		destory_gold = 640,
		prev = 95647,
		id = 95648,
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
				15
			},
			{
				17012,
				49
			},
			{
				17013,
				60
			}
		}
	},
	[95649] = {
		trans_use_gold = 900,
		next = 95650,
		base = 95640,
		restore_gold = 3240,
		destory_gold = 835,
		prev = 95648,
		id = 95649,
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
				15
			},
			{
				17012,
				49
			},
			{
				17013,
				99
			}
		}
	},
	[95650] = {
		trans_use_gold = 800,
		next = 95651,
		base = 95640,
		restore_gold = 4140,
		destory_gold = 1060,
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
				15
			},
			{
				17012,
				49
			},
			{
				17013,
				144
			}
		}
	},
	[95651] = {
		trans_use_gold = 1000,
		next = 95652,
		base = 95640,
		restore_gold = 4940,
		destory_gold = 1260,
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
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				36
			},
			{
				17014,
				9
			}
		},
		restore_item = {
			{
				17011,
				15
			},
			{
				17012,
				49
			},
			{
				17013,
				144
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
		restore_gold = 5940,
		destory_gold = 1510,
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
				4
			},
			{
				17012,
				12
			},
			{
				17013,
				36
			},
			{
				17014,
				19
			}
		},
		restore_item = {
			{
				17011,
				15
			},
			{
				17012,
				49
			},
			{
				17013,
				144
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
		restore_gold = 7140,
		destory_gold = 1810,
		prev = 95652,
		id = 95653,
		level = 14,
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
			},
			{
				17014,
				30
			}
		},
		restore_item = {
			{
				17011,
				15
			},
			{
				17012,
				49
			},
			{
				17013,
				144
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
