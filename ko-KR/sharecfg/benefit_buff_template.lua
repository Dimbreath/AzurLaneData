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
		benefit_effect = "504",
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
			20541,
			{
				5,
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
			20541,
			{
				5,
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
			20541,
			{
				5,
				3
			}
		}
	},
	[16] = {
		max_time = 0,
		name = "전투 피해량 보너스1",
		icon = "Props/buff_minigame_11",
		benefit_effect = "500",
		id = 16,
		benefit_type = "battle_buff",
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 피해량 1% 상승",
		benefit_condition = {
			"activity",
			20541,
			{
				6,
				1
			}
		}
	},
	[17] = {
		max_time = 0,
		name = "전투 피해량 보너스2",
		icon = "Props/buff_minigame_11",
		benefit_effect = "502",
		id = 17,
		benefit_type = "battle_buff",
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 피해량 2% 상승",
		benefit_condition = {
			"activity",
			20541,
			{
				6,
				2
			}
		}
	},
	[18] = {
		max_time = 0,
		name = "전투 피해량 보너스3",
		icon = "Props/buff_minigame_11",
		benefit_effect = "504",
		id = 18,
		benefit_type = "battle_buff",
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 피해량 3% 상승",
		benefit_condition = {
			"activity",
			20541,
			{
				6,
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
			20541,
			{
				7,
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
			20541,
			{
				7,
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
			20541,
			{
				7,
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
			20541,
			{
				8,
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
			20541,
			{
				8,
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
			20541,
			{
				8,
				3
			}
		}
	},
	[25] = {
		max_time = 0,
		name = "이벤트 해역 특장원형 드랍 보너스",
		icon = "Props/buff_urptup",
		benefit_effect = "0",
		id = 25,
		benefit_condition = "",
		benefit_type = "urpt_drop_up",
		desc = "「접해몽화」 이벤트 해역을 통해 획득하는 특장원형 수량 배가"
	},
	[26] = {
		max_time = 0,
		name = "가창력",
		icon = "Props/yanchangli1",
		benefit_effect = "500",
		id = 26,
		benefit_type = "battle_buff",
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 피해량 1% 증가",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	[27] = {
		max_time = 0,
		name = "가창력",
		icon = "Props/yanchangli2",
		benefit_effect = "502",
		id = 27,
		benefit_type = "battle_buff",
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 피해량 2% 증가",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	[28] = {
		max_time = 0,
		name = "가창력",
		icon = "Props/yanchangli3",
		benefit_effect = "504",
		id = 28,
		benefit_type = "battle_buff",
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 피해량 3% 증가",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	[29] = {
		max_time = 0,
		name = "안무력",
		icon = "Props/wudaoli1",
		benefit_effect = "510",
		id = 29,
		benefit_type = "battle_buff",
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 받는 피해 1% 감소",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	[30] = {
		max_time = 0,
		name = "안무력",
		icon = "Props/wudaoli2",
		benefit_effect = "512",
		id = 30,
		benefit_type = "battle_buff",
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 받는 피해 2% 감소",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	[31] = {
		max_time = 0,
		name = "안무력",
		icon = "Props/wudaoli3",
		benefit_effect = "514",
		id = 31,
		benefit_type = "battle_buff",
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 받는 피해 3% 감소",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	[32] = {
		max_time = 0,
		name = "연기력",
		icon = "Props/biaoyanli1",
		benefit_effect = "0",
		id = 32,
		benefit_type = "ship_battle_exp",
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 획득 경험치 3% 증가",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	[33] = {
		max_time = 0,
		name = "연기력",
		icon = "Props/biaoyanli2",
		benefit_effect = "0",
		id = 33,
		benefit_type = "ship_battle_exp",
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 획득 경험치 4% 증가",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	[34] = {
		max_time = 0,
		name = "연기력",
		icon = "Props/biaoyanli3",
		benefit_effect = "0",
		id = 34,
		benefit_type = "ship_battle_exp",
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 획득 경험치 5% 증가",
		benefit_condition = {
			"activity",
			20581,
			0
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
		24,
		25,
		26,
		27,
		28,
		29,
		30,
		31,
		32,
		33,
		34
	}
}
