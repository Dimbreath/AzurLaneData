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
		hub_id = 1,
		request_data = 0,
		simple_config_data = {
			target = 100000
		},
		config_data = {
			5,
			{
				10,
				11,
				12
			}
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
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		7
	}
}

return
