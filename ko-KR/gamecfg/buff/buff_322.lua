return {
	time = 15,
	name = "点燃",
	init_effect = "",
	picture = "",
	desc = "时乃空",
	stack = 1,
	id = 322,
	icon = 322,
	last_effect = "zhuoshao",
	effect_list = {
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				k = 0.1,
				attr = "airPower",
				time = 3,
				dotType = 1,
				number = 5
			}
		}
	}
}
