pg = pg or {}
pg.expedition_daily_template = {
	[201] = {
		tips = "商船護送開啟時間為：每週一、週四、週日",
		limit_type = 1,
		limit_time = 3,
		pic = "daily1",
		title = "商船護送",
		id = 201,
		des = "我方商船被魚雷艇襲擊了！成功反擊將獲得大量的裝備升級部件",
		weekday = {
			1,
			4,
			7
		},
		expedition_and_lv_limit_list = {
			{
				2000,
				10
			},
			{
				2001,
				10
			},
			{
				2002,
				25
			},
			{
				2003,
				25
			},
			{
				2004,
				35
			},
			{
				2005,
				35
			},
			{
				2006,
				50
			},
			{
				2007,
				50
			},
			{
				2008,
				70
			},
			{
				2009,
				70
			}
		}
	},
	[301] = {
		tips = "海域突進開啟時間為：每週二、週五、週日",
		limit_type = 1,
		limit_time = 3,
		pic = "daily2",
		title = "海域突進",
		id = 301,
		des = "海域中有大量自爆艇需要清除，擊破有一定機率獲得戰術教材",
		weekday = {
			2,
			5,
			7
		},
		expedition_and_lv_limit_list = {
			{
				3000,
				10
			},
			{
				3001,
				25
			},
			{
				3002,
				35
			},
			{
				3003,
				50
			},
			{
				3004,
				70
			}
		}
	},
	[401] = {
		tips = "斬首行動開啟時間為：每週三、週六、週日",
		limit_type = 1,
		limit_time = 3,
		pic = "daily3",
		title = "斬首行動",
		id = 401,
		des = "大量首領級敵人需要清除，擊破有一定機率獲得不知名的科技箱",
		weekday = {
			3,
			6,
			7
		},
		expedition_and_lv_limit_list = {
			{
				4000,
				10
			},
			{
				4001,
				25
			},
			{
				4002,
				35
			},
			{
				4003,
				50
			},
			{
				4004,
				70
			}
		}
	},
	all = {
		201,
		301,
		401
	}
}

return
