pg = pg or {}
pg.expedition_daily_template = {
	[201] = {
		tips = "매주 월·목·일요일 개방!",
		limit_type = 1,
		limit_time = 3,
		pic = "daily1",
		title = "상선호위",
		id = 201,
		des = "아군 상선을 노리는 적 어뢰정을 처리하고, 보상으로 강화 재료를 손에 넣어라!",
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
		tips = "매주 화·금·일요일 개방!",
		limit_type = 1,
		limit_time = 3,
		pic = "daily2",
		title = "해역소탕",
		id = 301,
		des = "해역에서 난동을 부리는 자폭선을 처리하고, 스킬 훈련용 교본을 찾아내라!",
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
		tips = "매주 수·토·일요일 개방!",
		limit_type = 1,
		limit_time = 3,
		pic = "daily3",
		title = "강습작전",
		id = 401,
		des = "대량으로 출현한 적 주력함을 격파하고, 장비상자를 손에 넣어라!",
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
	[501] = {
		tips = "아직 개방되지 않았습니다. 기대해주세요!",
		limit_type = 2,
		limit_time = 2,
		pic = "daily5",
		title = "통상 파괴",
		id = 501,
		des = "잠수 편대가 통상 파괴 작전을 개시했습니다. 성공 시 각종 잠수함 장비 설계도를 획득합니다.",
		weekday = {
			1,
			2,
			3,
			4,
			5,
			6,
			7
		},
		expedition_and_lv_limit_list = {
			{
				1000,
				35
			},
			{
				1001,
				45
			},
			{
				1002,
				55
			},
			{
				1003,
				65
			},
			{
				1004,
				75
			}
		}
	},
	[601] = {
		tips = "전술 리서치는 매일 개방됩니다.",
		limit_type = 1,
		limit_time = 3,
		pic = "daily6",
		title = "전술 리서치",
		id = 601,
		des = "강력한 적 특수함대가 출현했다! 격파 시 일정 확률로 전술 업그레이드 재료를 얻을 수 있다.",
		weekday = {
			1,
			2,
			3,
			4,
			5,
			6,
			7
		},
		expedition_and_lv_limit_list = {
			{
				6000,
				60
			},
			{
				6001,
				60
			},
			{
				6002,
				60
			}
		}
	},
	all = {
		201,
		301,
		401,
		501,
		601
	}
}
