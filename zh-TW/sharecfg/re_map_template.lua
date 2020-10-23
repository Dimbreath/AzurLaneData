pg = pg or {}
pg.re_map_template = {
	{
		bg = "temp_hongran",
		name = "红染常驻复刻",
		memory_group = 108,
		id = 1,
		activity_type = 1,
		order = 1,
		config_data = {
			2100001,
			2100002,
			2100003,
			2100004,
			2100005,
			2100006,
			2100011,
			2100012,
			2100013,
			2100014,
			2100015,
			2100016
		},
		time = {
			timer,
			{
				{
					2018,
					9,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					12,
					31
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	{
		bg = "temp_zjiandui",
		name = "Z舰队常驻复刻",
		memory_group = 101,
		id = 2,
		activity_type = 2,
		order = 2,
		config_data = {
			2200001,
			2200002,
			2200003
		},
		time = {
			timer,
			{
				{
					2018,
					9,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					12,
					31
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	all = {
		1,
		2
	}
}
