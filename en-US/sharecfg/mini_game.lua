pg = pg or {}
pg.mini_game = {
	{
		name = "测试小游戏",
		view_name = "TestView",
		mediator_name = "MiniHubMediator",
		type = 1,
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 1,
		hub_id = 1,
		request_data = 0,
		simple_config_data = {
			test = {
				1,
				2,
				3
			}
		}
	},
	{
		name = "小吃小游戏",
		view_name = "SnackView",
		mediator_name = "MiniHubMediator",
		type = 1,
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 2,
		hub_id = 1,
		request_data = 0,
		simple_config_data = {
			memory_time = 5,
			select_time = 10,
			correct_value = {
				[0] = 0,
				1,
				2,
				5
			},
			score_level = {
				0,
				5,
				12,
				20
			}
		}
	},
	{
		name = "神社小游戏",
		view_name = "ShrineView",
		mediator_name = "MiniHubMediator",
		type = 3,
		config_csv_key = "",
		config_csv = "",
		id = 3,
		hub_id = 4,
		request_data = 1,
		simple_config_data = {
			target = 100000
		},
		config_data = {
			5,
			{
				10,
				11,
				12
			},
			2
		}
	},
	{
		name = "制作烟花",
		view_name = "FireworkFactoryView",
		mediator_name = "FireworkFactoryMediator",
		type = 2,
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 4,
		hub_id = 1,
		request_data = 1,
		simple_config_data = {
			roundTime = 50,
			score_reference = {
				{
					140,
					160
				},
				{
					120,
					180
				},
				{
					90,
					210
				}
			}
		}
	},
	{
		name = "打靶游戏",
		view_name = "ShootingGameView",
		mediator_name = "ShootingGameMediator",
		type = 2,
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 5,
		hub_id = 1,
		request_data = 0,
		simple_config_data = {
			moveSpeed = 4,
			fireCD = 1,
			baseTime = 12,
			bonusTime = 0,
			targetScore = {
				10,
				5,
				2
			},
			score_level = {
				0,
				10,
				25,
				35
			}
		}
	},
	{
		name = "音乐小游戏",
		view_name = "MusicGameView",
		mediator_name = "MiniHubMediator",
		type = 2,
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 6,
		hub_id = 2,
		request_data = 0,
		simple_config_data = {
			combo = 100,
			goodtime = 0.25,
			perfecttime = 0.1,
			good = 300,
			latergoodtime = 0.2,
			special_combo = 0,
			speed_min = 60,
			misstime = 0.35,
			perfect = 600,
			speed_max = 100,
			miss = 0,
			special_score = 5000,
			laterperfecttime = 0.1,
			story = {
				{
					"OUXIANGRICHANG1"
				},
				{},
				{},
				{
					"OUXIANGRICHANG2"
				},
				{},
				{},
				{
					"OUXIANGRICHANG3"
				}
			},
			combo_interval = {
				10,
				20,
				40,
				60,
				80,
				100
			},
			Blist = {
				{
					27640,
					55960
				},
				{
					16480,
					23080
				},
				{
					16700,
					52360
				},
				{
					24760,
					55480
				},
				{
					24280,
					43960
				}
			},
			Alist = {
				{
					55280,
					111920
				},
				{
					32960,
					46160
				},
				{
					33400,
					104720
				},
				{
					49520,
					110960
				},
				{
					48560,
					87920
				}
			},
			Slist = {
				{
					82920,
					167880
				},
				{
					49440,
					69240
				},
				{
					50100,
					157080
				},
				{
					74280,
					166440
				},
				{
					72840,
					131880
				}
			},
			SSlist = {
				{
					110560,
					223840
				},
				{
					65920,
					92320
				},
				{
					66800,
					209440
				},
				{
					99040,
					221920
				},
				{
					97120,
					175840
				}
			}
		}
	},
	{
		name = "holo连连看",
		view_name = "HoloLiveLinkGameView",
		mediator_name = "HoloLiveLinkGameMediator",
		type = 2,
		simple_config_data = "",
		config_csv_key = "",
		config_data = "",
		config_csv = "activity_event_linkgame",
		id = 7,
		hub_id = 3,
		request_data = 1
	},
	{
		name = "鬼怒修行QTE游戏",
		view_name = "QTEGameView",
		mediator_name = "MiniHubMediator",
		type = 2,
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 8,
		hub_id = 4,
		request_data = 1,
		simple_config_data = {
			scorePerHit = 10,
			shrineGameId = 3,
			gameTime = 60,
			roundTime = 4,
			comboRange = {
				5,
				10
			},
			comboAddScore = {
				5,
				10
			},
			targetCombo = {
				25,
				50
			},
			targetComboScore = {
				250,
				500
			}
		}
	},
	{
		name = "春节叠叠乐",
		view_name = "StackGameView",
		mediator_name = "MiniHubMediator",
		type = 2,
		simple_config_data = "",
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 9,
		hub_id = 5,
		request_data = 1
	},
	{
		name = "元宵答题",
		view_name = "LanternFestivalView",
		mediator_name = "MiniHubMediator",
		type = 2,
		simple_config_data = "",
		config_csv_key = "",
		config_data = "",
		config_csv = "activity_event_question",
		id = 10,
		hub_id = 6,
		request_data = 1
	},
	{
		name = "解密游戏",
		view_name = "DecodeMiniGameView",
		mediator_name = "MiniHubMediator",
		type = 2,
		simple_config_data = "",
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 11,
		hub_id = 7,
		request_data = 1
	},
	{
		name = "消消乐",
		view_name = "Match3GameView",
		mediator_name = "MiniHubMediator",
		type = 2,
		simple_config_data = "",
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 12,
		hub_id = 8,
		request_data = 1
	},
	{
		name = "啾啾大冒险",
		view_name = "TowerClimbingGameView",
		mediator_name = "TowerClimbingMediator",
		type = 4,
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 13,
		hub_id = 9,
		request_data = 1,
		simple_config_data = {
			{
				{
					10,
					20,
					30,
					40,
					50
				},
				{
					{
						14,
						104,
						1
					}
				}
			},
			{
				{
					10,
					20,
					30,
					40,
					50
				},
				{
					{
						2,
						59789,
						1
					}
				}
			},
			{
				{
					10,
					20,
					30,
					40,
					50
				},
				{
					{
						2,
						59790,
						1
					},
					{
						15,
						103,
						1
					}
				}
			}
		}
	},
	{
		name = "啾啾转转乐",
		view_name = "RollingBallGameView",
		mediator_name = "MiniHubMediator",
		type = 2,
		simple_config_data = "",
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 14,
		hub_id = 10,
		request_data = 1
	},
	{
		name = "万圣节小游戏",
		view_name = "HalloweenGameView",
		mediator_name = "MiniHubMediator",
		type = 2,
		simple_config_data = "",
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 15,
		hub_id = 11,
		request_data = 1
	},
	{
		name = "音乐小游戏",
		view_name = "MusicGameView",
		mediator_name = "MiniHubMediator",
		type = 2,
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 16,
		hub_id = 12,
		request_data = 0,
		simple_config_data = {
			combo = 100,
			goodtime = 0.25,
			perfecttime = 0.1,
			good = 300,
			latergoodtime = 0.2,
			special_combo = 0,
			speed_min = 60,
			misstime = 0.35,
			perfect = 600,
			speed_max = 100,
			miss = 0,
			special_score = 5000,
			laterperfecttime = 0.1,
			story = {
				{},
				{},
				{},
				{},
				{},
				{},
				{}
			},
			combo_interval = {
				10,
				20,
				40,
				60,
				80,
				100
			},
			Blist = {
				{
					27180,
					80220
				},
				{
					25260,
					41340
				},
				{
					15620,
					34140
				},
				{
					29100,
					61020
				},
				{
					28380,
					61980
				},
				{
					27640,
					55960
				},
				{
					16480,
					23080
				},
				{
					16700,
					52360
				},
				{
					24760,
					55480
				},
				{
					24280,
					43960
				}
			},
			Alist = {
				{
					54360,
					160440
				},
				{
					50520,
					82680
				},
				{
					31240,
					68280
				},
				{
					58200,
					122040
				},
				{
					56760,
					123960
				},
				{
					55280,
					111920
				},
				{
					32960,
					46160
				},
				{
					33400,
					104720
				},
				{
					49520,
					110960
				},
				{
					48560,
					87920
				}
			},
			Slist = {
				{
					81540,
					240660
				},
				{
					75780,
					124020
				},
				{
					46860,
					102420
				},
				{
					87300,
					183060
				},
				{
					85140,
					185940
				},
				{
					82920,
					167880
				},
				{
					49440,
					69240
				},
				{
					50100,
					157080
				},
				{
					74280,
					166440
				},
				{
					72840,
					131880
				}
			},
			SSlist = {
				{
					108720,
					320880
				},
				{
					101040,
					165360
				},
				{
					62480,
					136560
				},
				{
					116400,
					244080
				},
				{
					113520,
					247920
				},
				{
					110560,
					223840
				},
				{
					65920,
					92320
				},
				{
					66800,
					209440
				},
				{
					99040,
					221920
				},
				{
					97120,
					175840
				}
			}
		}
	},
	{
		name = "沙排小游戏",
		view_name = "VolleyballGameView",
		mediator_name = "MiniHubMediator",
		type = 2,
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 17,
		hub_id = 13,
		request_data = 0,
		simple_config_data = {
			story = {
				{
					"JIARIHANGXIANRICHANG1"
				},
				{},
				{
					"JIARIHANGXIANRICHANG2"
				},
				{},
				{
					"JIARIHANGXIANRICHANG3"
				},
				{},
				{
					"JIARIHANGXIANRICHANG4"
				}
			},
			mainChar = {
				1,
				6,
				3,
				4,
				5,
				2,
				7
			},
			minorChar = {
				2,
				1,
				2,
				5,
				6,
				7,
				4
			},
			endScore = {
				5,
				5,
				5,
				5,
				5,
				5,
				5
			}
		}
	},
	{
		name = "2002啾啾雪合战小游戏",
		view_name = "SnowballGameView",
		mediator_name = "MiniHubMediator",
		type = 2,
		simple_config_data = "",
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 18,
		hub_id = 14,
		request_data = 1
	},
	{
		name = "2020小吃街小游戏",
		view_name = "NewYearSnackView",
		mediator_name = "MiniHubMediator",
		type = 1,
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 19,
		hub_id = 15,
		request_data = 0,
		simple_config_data = {
			memory_time = 5,
			select_time = 10,
			correct_value = {
				[0] = 0,
				1,
				2,
				5
			},
			score_level = {
				0,
				5,
				12,
				20
			}
		}
	},
	{
		name = "2020敲钟小游戏",
		view_name = "NewYearShrineView",
		mediator_name = "MiniHubMediator",
		type = 3,
		simple_config_data = "",
		config_csv_key = "",
		config_csv = "",
		id = 20,
		hub_id = 14,
		request_data = 1,
		config_data = {
			5,
			{
				10,
				11,
				12
			},
			2
		}
	},
	all = {
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
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		19,
		20
	}
}
