return {
	time = 15,
	name = "起火",
	init_effect = "",
	picture = "",
	desc = "持续伤害",
	stack = 1,
	id = 311,
	icon = 311,
	last_effect = "zhuoshao",
	effect_list = {
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				k = 0.6,
				attr = "cannonPower",
				time = 3,
				dotType = 1,
				number = 5
			}
		}
	}
}
