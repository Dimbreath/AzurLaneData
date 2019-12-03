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
		name = "경험치 추가 획득",
		icon = "Props/xinshou",
		benefit_effect = "100",
		id = 4,
		benefit_type = "rookie_battle_exp",
		desc = "지휘관 레벨 40 미만일 때, 통상 스테이지, 어려움 난이도 스테이지, 데일리 이벤트 중 획득하는 지휘관 경험치와 함선소녀 경험치가 100% 상승. ",
		benefit_condition = {
			"lv",
			"<",
			40
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
	all = {
		1,
		2,
		3,
		4,
		10,
		11,
		12
	}
}

return
