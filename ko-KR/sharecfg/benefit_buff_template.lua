pg = pg or {}
pg.benefit_buff_template = {
	{
		name = "",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "숙소 경험치 5% UP",
		benefit_effect = "5",
		id = 1,
		icon = "Props/haijungali",
		benefit_type = "dorm_exp"
	},
	{
		name = "",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "숙소 경험치 10% UP",
		benefit_effect = "10",
		id = 2,
		icon = "Props/huangjialiaoli",
		benefit_type = "dorm_exp"
	},
	{
		name = "",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "숙소 경험치 20% UP",
		benefit_effect = "20",
		id = 3,
		icon = "Props/manhanquanxi",
		benefit_type = "dorm_exp"
	},
	{
		name = "경험치 보너스 ",
		hide = 0,
		max_time = 0,
		desc = "지휘관 레벨 30 미만일 시, 일반 스테이지, 어려움 스테이지, 이벤트 스테이지, 데일리 이벤트에서 획득하는 지휘관 경험치와 캐릭터 경험치 100% 상승 ",
		benefit_effect = "100",
		id = 4,
		icon = "Props/xinshou",
		benefit_type = "rookie_battle_exp",
		benefit_condition = {
			"lv",
			"<",
			30
		}
	},
	{
		name = "연료 소모 증가",
		hide = 0,
		max_time = 0,
		benefit_condition = "",
		desc = "일반 스테이지, 어려움 스테이지, 이벤트 스테이지에서 소모하는 연료 200% 증가",
		benefit_effect = "100",
		id = 5,
		icon = "Props/xinshou",
		benefit_type = "more_oil"
	},
	{
		name = "지휘관 경험치 보너스",
		hide = 0,
		max_time = 0,
		benefit_condition = "",
		desc = "일반 스테이지, 어려움 스테이지, 이벤트 스테이지에서 얻는 지휘관 경험치 200% 증가",
		benefit_effect = "100",
		id = 6,
		icon = "Props/xinshou",
		benefit_type = "user_battle_exp"
	},
	{
		name = "함선 경험치 보너스",
		hide = 0,
		max_time = 0,
		benefit_condition = "",
		desc = "일반 스테이지, 어려움 스테이지, 이벤트 스테이지에서 얻는 함선 경험치 200% 증가",
		benefit_effect = "100",
		id = 7,
		icon = "Props/xinshou",
		benefit_type = "ship_battle_exp"
	},
	{
		name = "드랍 보너스",
		hide = 0,
		max_time = 0,
		benefit_condition = "",
		desc = "일반 스테이지, 어려움 스테이지, 이벤트 스테이지에서 드랍 1회 추가",
		benefit_effect = "1",
		id = 8,
		icon = "Props/xinshou",
		benefit_type = "extra_drop"
	},
	{
		name = "이벤트 드랍 보너스",
		hide = 0,
		max_time = 0,
		benefit_condition = "",
		desc = "이벤트 드랍 1회 추가, 매일 첫 드랍과 중복되지 않음",
		benefit_effect = "1",
		id = 9,
		icon = "Props/xinshou",
		benefit_type = "extra_activity_drop"
	},
	{
		name = "학업 ",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "전술학원에서 스킬 강화 시 수업시간을 줄입니다.\n남은 시간:$1 ",
		benefit_effect = "300",
		id = 10,
		icon = "Props/buff_qiaozhong_10",
		benefit_type = "skill_learncost_up"
	},
	{
		name = "사업 ",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "메인, 어려움, 작전문서 스테이지에서 전투 시 아군의 공격력을 소폭 증가시킵니다.\n남은 시간:$1 ",
		benefit_effect = "504",
		id = 11,
		icon = "Props/buff_qiaozhong_11",
		benefit_type = "battle_buff"
	},
	{
		name = "인연 ",
		hide = 0,
		max_time = 86400,
		benefit_condition = "",
		desc = "비서함의 호감도 증가 속도가 빨라집니다.\n남은 시간:$1 ",
		benefit_effect = "1",
		id = 12,
		icon = "Props/buff_qiaozhong_12",
		benefit_type = "intimacy_up_extra"
	},
	{
		name = "함선 경험치 보너스1",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 캐릭터 경험치 획득 3% 상승",
		benefit_effect = "3",
		id = 13,
		icon = "Props/xinshou",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			20541,
			{
				5,
				1
			}
		}
	},
	{
		name = "함선 경험치 보너스2",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 캐릭터 경험치 획득 4% 상승",
		benefit_effect = "4",
		id = 14,
		icon = "Props/xinshou",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			20541,
			{
				5,
				2
			}
		}
	},
	{
		name = "함선 경험치 보너스3",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 캐릭터 경험치 획득 5% 상승",
		benefit_effect = "5",
		id = 15,
		icon = "Props/xinshou",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			20541,
			{
				5,
				3
			}
		}
	},
	{
		name = "전투 피해량 보너스1",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 피해량 1% 상승",
		benefit_effect = "500",
		id = 16,
		icon = "Props/buff_minigame_11",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			20541,
			{
				6,
				1
			}
		}
	},
	{
		name = "전투 피해량 보너스2",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 피해량 2% 상승",
		benefit_effect = "502",
		id = 17,
		icon = "Props/buff_minigame_11",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			20541,
			{
				6,
				2
			}
		}
	},
	{
		name = "전투 피해량 보너스3",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 피해량 3% 상승",
		benefit_effect = "504",
		id = 18,
		icon = "Props/buff_minigame_11",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			20541,
			{
				6,
				3
			}
		}
	},
	{
		name = "전술 학원 학습 시간 단축1",
		hide = 0,
		max_time = 0,
		desc = "전술 학원 스킬 학습 시간 3% 단축",
		benefit_effect = "300",
		id = 19,
		icon = "Props/buff_minigame_10",
		benefit_type = "skill_learncost_up",
		benefit_condition = {
			"activity",
			20541,
			{
				7,
				1
			}
		}
	},
	{
		name = "전술 학원 학습 시간 단축2",
		hide = 0,
		max_time = 0,
		desc = "전술 학원 스킬 학습 시간 4% 단축",
		benefit_effect = "400",
		id = 20,
		icon = "Props/buff_minigame_10",
		benefit_type = "skill_learncost_up",
		benefit_condition = {
			"activity",
			20541,
			{
				7,
				2
			}
		}
	},
	{
		name = "전술 학원 학습 시간 단축3",
		hide = 0,
		max_time = 0,
		desc = "전술 학원 스킬 학습 시간 5% 단축",
		benefit_effect = "500",
		id = 21,
		icon = "Props/buff_minigame_10",
		benefit_type = "skill_learncost_up",
		benefit_condition = {
			"activity",
			20541,
			{
				7,
				3
			}
		}
	},
	{
		name = "숙소 경험치 보너스1",
		hide = 0,
		max_time = 0,
		desc = "숙소 경험치 보너스 3% 상승",
		benefit_effect = "3",
		id = 22,
		icon = "Props/buff_minigame_12",
		benefit_type = "dorm_exp",
		benefit_condition = {
			"activity",
			20541,
			{
				8,
				1
			}
		}
	},
	{
		name = "숙소 경험치 보너스2",
		hide = 0,
		max_time = 0,
		desc = "숙소 경험치 보너스 4% 상승",
		benefit_effect = "4",
		id = 23,
		icon = "Props/buff_minigame_12",
		benefit_type = "dorm_exp",
		benefit_condition = {
			"activity",
			20541,
			{
				8,
				2
			}
		}
	},
	{
		name = "숙소 경험치 보너스3",
		hide = 0,
		max_time = 0,
		desc = "숙소 경험치 보너스 5% 상승",
		benefit_effect = "5",
		id = 24,
		icon = "Props/buff_minigame_12",
		benefit_type = "dorm_exp",
		benefit_condition = {
			"activity",
			20541,
			{
				8,
				3
			}
		}
	},
	{
		name = "이벤트 해역 특장원형 드랍 보너스",
		hide = 0,
		max_time = 0,
		benefit_condition = "",
		desc = "「접해몽화」 이벤트 해역을 통해 획득하는 특장원형 수량 배가",
		benefit_effect = "0",
		id = 25,
		icon = "Props/buff_urptup",
		benefit_type = "urpt_drop_up"
	},
	{
		name = "가창력",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 피해량 1% 증가",
		benefit_effect = "500",
		id = 26,
		icon = "Props/yanchangli1",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	{
		name = "가창력",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 피해량 2% 증가",
		benefit_effect = "502",
		id = 27,
		icon = "Props/yanchangli2",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	{
		name = "가창력",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 피해량 3% 증가",
		benefit_effect = "504",
		id = 28,
		icon = "Props/yanchangli3",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	{
		name = "안무력",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 받는 피해 1% 감소",
		benefit_effect = "510",
		id = 29,
		icon = "Props/wudaoli1",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	{
		name = "안무력",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 받는 피해 2% 감소",
		benefit_effect = "512",
		id = 30,
		icon = "Props/wudaoli2",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	{
		name = "안무력",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 받는 피해 3% 감소",
		benefit_effect = "514",
		id = 31,
		icon = "Props/wudaoli3",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	{
		name = "연기력",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 획득 경험치 3% 증가",
		benefit_effect = "3",
		id = 32,
		icon = "Props/biaoyanli1",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	{
		name = "연기력",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 획득 경험치 4% 증가",
		benefit_effect = "4",
		id = 33,
		icon = "Props/biaoyanli2",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	{
		name = "연기력",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 획득 경험치 5% 증가",
		benefit_effect = "5",
		id = 34,
		icon = "Props/biaoyanli3",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			20581,
			0
		}
	},
	{
		name = "<color=#ff5c5c>파워</color>LV.1：",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 피해량 1% 상승",
		benefit_effect = "500",
		id = 35,
		icon = "Props/yanchangli1",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			20606,
			0
		}
	},
	{
		name = "<color=#ff5c5c>파워</color>LV.2：",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 피해량 2% 상승",
		benefit_effect = "502",
		id = 36,
		icon = "Props/yanchangli2",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			20606,
			0
		}
	},
	{
		name = "<color=#ff5c5c>파워</color>MAX：",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전문서 스테이지에서 피해량 3% 상승",
		benefit_effect = "504",
		id = 37,
		icon = "Props/yanchangli3",
		benefit_type = "battle_buff",
		benefit_condition = {
			"activity",
			20606,
			0
		}
	},
	{
		name = "<color=#00BFFF>테크닉</color>LV.1：",
		hide = 0,
		max_time = 0,
		desc = "전술 학원 스킬 학습 시간 3% 단축",
		benefit_effect = "300",
		id = 38,
		icon = "Props/buff_minigame_10",
		benefit_type = "skill_learncost_up",
		benefit_condition = {
			"activity",
			20606,
			0
		}
	},
	{
		name = "<color=#00BFFF>테크닉</color>LV.2：",
		hide = 0,
		max_time = 0,
		desc = "전술 학원 스킬 학습 시간 4% 단축",
		benefit_effect = "400",
		id = 39,
		icon = "Props/buff_minigame_10",
		benefit_type = "skill_learncost_up",
		benefit_condition = {
			"activity",
			20606,
			0
		}
	},
	{
		name = "<color=#00BFFF>테크닉</color>MAX：",
		hide = 0,
		max_time = 0,
		desc = "전술 학원 스킬 학습 시간 5% 단축",
		benefit_effect = "500",
		id = 40,
		icon = "Props/buff_minigame_10",
		benefit_type = "skill_learncost_up",
		benefit_condition = {
			"activity",
			20606,
			0
		}
	},
	{
		name = "<color=#ffde38>체력</color>LV.1：",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 획득 경험치 3% 증가",
		benefit_effect = "3",
		id = 41,
		icon = "Props/biaoyanli1",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			20606,
			0
		}
	},
	{
		name = "<color=#ffde38>체력</color>LV.2：",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 획득 경험치 4% 증가",
		benefit_effect = "4",
		id = 42,
		icon = "Props/biaoyanli2",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			20606,
			0
		}
	},
	{
		name = "<color=#ffde38>체력</color>MAX：",
		hide = 0,
		max_time = 0,
		desc = "메인, 어려움, 이벤트, 작전 문서 스테이지에서 획득 경험치 5% 증가",
		benefit_effect = "5",
		id = 43,
		icon = "Props/biaoyanli3",
		benefit_type = "ship_battle_exp",
		benefit_condition = {
			"activity",
			20606,
			0
		}
	},
	{
		name = "<color=#FF69B4>매력</color>LV.1：",
		hide = 0,
		max_time = 0,
		desc = "숙소 경험치 보너스 3% 상승",
		benefit_effect = "3",
		id = 44,
		icon = "Props/buff_minigame_12",
		benefit_type = "dorm_exp",
		benefit_condition = {
			"activity",
			20606,
			0
		}
	},
	{
		name = "<color=#FF69B4>매력</color>LV.2：",
		hide = 0,
		max_time = 0,
		desc = "숙소 경험치 보너스 4% 상승",
		benefit_effect = "4",
		id = 45,
		icon = "Props/buff_minigame_12",
		benefit_type = "dorm_exp",
		benefit_condition = {
			"activity",
			20606,
			0
		}
	},
	{
		name = "<color=#FF69B4>매력</color>MAX：",
		hide = 0,
		max_time = 0,
		desc = "숙소 경험치 보너스 5% 상승",
		benefit_effect = "5",
		id = 46,
		icon = "Props/buff_minigame_12",
		benefit_type = "dorm_exp",
		benefit_condition = {
			"activity",
			20606,
			0
		}
	},
	{
		name = "특수 작전 보너스 설명",
		hide = 0,
		max_time = 0,
		benefit_condition = "61001",
		desc = "연료 2배 소모\n결산 수익 2배",
		benefit_effect = "0",
		id = 47,
		icon = "Props/xinshou",
		benefit_type = "desc"
	},
	{
		name = "특수 작전 보너스",
		hide = 0,
		max_time = 0,
		benefit_condition = "",
		desc = "호감도, 감정 수치, 지휘관 경험치, 지휘냥 경험치, 함선 경험치 보너스",
		benefit_effect = "100",
		id = 48,
		icon = "Props/xinshou",
		benefit_type = "chapter_up"
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
		34,
		35,
		36,
		37,
		38,
		39,
		40,
		41,
		42,
		43,
		44,
		45,
		46,
		47,
		48
	}
}
