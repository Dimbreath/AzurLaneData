return {
	time = 2.1,
	name = "",
	init_effect = "",
	picture = "",
	desc = "持续伤害",
	stack = 1,
	id = 13753,
	icon = 13750,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				k = 0,
				attr = "airPower",
				time = 2,
				dotType = 1,
				number = 200
			}
		}
	}
}
