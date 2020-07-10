pg = pg or {}
pg.benefit_buff_template = {
	{
		max_time = 86400,
		name = "",
		icon = "Props/haijungali",
		benefit_effect = "5",
		id = 1,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "숙소 경험치 5% UP"
	},
	{
		max_time = 86400,
		name = "",
		icon = "Props/huangjialiaoli",
		benefit_effect = "10",
		id = 2,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "숙소 경험치 10% UP"
	},
	{
		max_time = 86400,
		name = "",
		icon = "Props/manhanquanxi",
		benefit_effect = "20",
		id = 3,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "숙소 경험치 20% UP"
	},
	{
		max_time = 0,
		name = "경험치 보너스 ",
		icon = "Props/xinshou",
		benefit_effect = "100",
		id = 4,
		benefit_type = "rookie_battle_exp",
		desc = "지휘관 레벨 30 미만일 시, 일반 스테이지, 어려움 스테이지, 이벤트 스테이지, 데일리 이벤트에서 획득하는 지휘관 경험치와 캐릭터 경험치 100% 상승 ",
		benefit_condition = {
			"lv",
			"<",
			30
		}
	},
	[10] = {
		max_time = 86400,
		name = "학업 ",
		icon = "Props/buff_minigame_10",
		benefit_effect = "300",
		id = 10,
		benefit_condition = "",
		benefit_type = "skill_learncost_up",
		desc = "전술학원에서 스킬 강화 시 수업시간을 줄입니다.\n남은 시간:$1 "
	},
	[11] = {
		max_time = 86400,
		name = "사업 ",
		icon = "Props/buff_minigame_11",
		benefit_effect = "500",
		id = 11,
		benefit_condition = "",
		benefit_type = "battle_buff",
		desc = "메인, 어려움, 작전문서 스테이지에서 전투 시 아군의 공격력을 소폭 증가시킵니다.\n남은 시간:$1 "
	},
	[12] = {
		max_time = 86400,
		name = "인연 ",
		icon = "Props/buff_minigame_12",
		benefit_effect = "1",
		id = 12,
		benefit_condition = "",
		benefit_type = "intimacy_up_extra",
		desc = "비서함의 호감도 증가 속도가 빨라집니다.\n남은 시간:$1 "
	},
	[13] = {
		max_time = 0,
		name = "함선 경험치 보너스1",
		icon = "Props/xinshou",
		benefit_effect = "3",
		id = 13,
		benefit_type = "ship_battle_exp",
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 캐릭터 경험치 획득 3% 상승",
		benefit_condition = {
			"activity",
			20462,
			{
				1,
				1
			}
		}
	},
	[14] = {
		max_time = 0,
		name = "함선 경험치 보너스2",
		icon = "Props/xinshou",
		benefit_effect = "4",
		id = 14,
		benefit_type = "ship_battle_exp",
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 캐릭터 경험치 획득 4% 상승",
		benefit_condition = {
			"activity",
			20462,
			{
				1,
				2
			}
		}
	},
	[15] = {
		max_time = 0,
		name = "함선 경험치 보너스3",
		icon = "Props/xinshou",
		benefit_effect = "5",
		id = 15,
		benefit_type = "ship_battle_exp",
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 캐릭터 경험치 획득 5% 상승",
		benefit_condition = {
			"activity",
			20462,
			{
				1,
				3
			}
		}
	},
	[16] = {
		max_time = 0,
		name = "전투 피해량 보너스1",
		icon = "Props/buff_minigame_11",
		benefit_effect = "502",
		id = 16,
		benefit_type = "battle_buff",
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 피해량 1% 상승",
		benefit_condition = {
			"activity",
			20462,
			{
				2,
				1
			}
		}
	},
	[17] = {
		max_time = 0,
		name = "전투 피해량 보너스2",
		icon = "Props/buff_minigame_11",
		benefit_effect = "504",
		id = 17,
		benefit_type = "battle_buff",
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 피해량 2% 상승",
		benefit_condition = {
			"activity",
			20462,
			{
				2,
				2
			}
		}
	},
	[18] = {
		max_time = 0,
		name = "전투 피해량 보너스3",
		icon = "Props/buff_minigame_11",
		benefit_effect = "500",
		id = 18,
		benefit_type = "battle_buff",
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 피해량 3% 상승",
		benefit_condition = {
			"activity",
			20462,
			{
				2,
				3
			}
		}
	},
	[19] = {
		max_time = 0,
		name = "전술 학원 학습 시간 단축1",
		icon = "Props/buff_minigame_10",
		benefit_effect = "300",
		id = 19,
		benefit_type = "skill_learncost_up",
		desc = "전술 학원 스킬 학습 시간 3% 단축",
		benefit_condition = {
			"activity",
			20462,
			{
				3,
				1
			}
		}
	},
	[20] = {
		max_time = 0,
		name = "전술 학원 학습 시간 단축2",
		icon = "Props/buff_minigame_10",
		benefit_effect = "400",
		id = 20,
		benefit_type = "skill_learncost_up",
		desc = "전술 학원 스킬 학습 시간 4% 단축",
		benefit_condition = {
			"activity",
			20462,
			{
				3,
				2
			}
		}
	},
	[21] = {
		max_time = 0,
		name = "전술 학원 학습 시간 단축3",
		icon = "Props/buff_minigame_10",
		benefit_effect = "500",
		id = 21,
		benefit_type = "skill_learncost_up",
		desc = "전술 학원 스킬 학습 시간 5% 단축",
		benefit_condition = {
			"activity",
			20462,
			{
				3,
				3
			}
		}
	},
	[22] = {
		max_time = 0,
		name = "숙소 경험치 보너스1",
		icon = "Props/buff_minigame_12",
		benefit_effect = "3",
		id = 22,
		benefit_type = "dorm_exp",
		desc = "숙소 경험치 보너스 3% 상승",
		benefit_condition = {
			"activity",
			20462,
			{
				4,
				1
			}
		}
	},
	[23] = {
		max_time = 0,
		name = "숙소 경험치 보너스2",
		icon = "Props/buff_minigame_12",
		benefit_effect = "4",
		id = 23,
		benefit_type = "dorm_exp",
		desc = "숙소 경험치 보너스 4% 상승",
		benefit_condition = {
			"activity",
			20462,
			{
				4,
				2
			}
		}
	},
	[24] = {
		max_time = 0,
		name = "숙소 경험치 보너스3",
		icon = "Props/buff_minigame_12",
		benefit_effect = "5",
		id = 24,
		benefit_type = "dorm_exp",
		desc = "숙소 경험치 보너스 5% 상승",
		benefit_condition = {
			"activity",
			20462,
			{
				4,
				3
			}
		}
	},
	all = {
		1,
		2,
		3,
		4,
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
		20,
		21,
		22,
		23,
		24
	}
}
