return {
	time = 0.1,
	name = "重点防护",
	init_effect = "",
	id = 4020,
	picture = "",
	desc = "50%减伤",
	stack = 1,
	color = "blue",
	icon = 4020,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				number = -0.5,
				target = "TargetSelf",
				attr = "injureRatio"
			}
		}
	}
}
