return {
	name = "烟雾弹",
	init_effect = "",
	id = 4971,
	time = 0,
	picture = "",
	desc = "提高闪避",
	stack = 1,
	color = "blue",
	icon = 4971,
	last_effect = "",
	blink = {
		0,
		0.7,
		1,
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
				number = 0.2,
				attr = "dodgeRateExtra"
			}
		}
	}
}
