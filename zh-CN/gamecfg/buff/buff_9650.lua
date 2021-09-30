return {
	name = "敌方夜战照明弹-照明区域效果",
	init_effect = "",
	id = 9650,
	time = 0,
	picture = "",
	desc = "回避率降低",
	stack = 1,
	color = "yellow",
	icon = 9650,
	last_effect = "EVDdowm",
	blink = {
		0.8,
		0.8,
		0.8,
		0.3,
		0.3
	},
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				number = -0.25,
				attr = "dodgeRateExtra"
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				number = 1,
				attr = "lockAimBias"
			}
		}
	}
}
