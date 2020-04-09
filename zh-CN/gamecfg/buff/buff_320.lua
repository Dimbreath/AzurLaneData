return {
	time = 15.1,
	name = "点燃",
	init_effect = "",
	picture = "",
	desc = "竞技神技能点燃",
	stack = 1,
	id = 320,
	icon = 320,
	last_effect = "zhuoshao",
	effect_list = {
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				k = 0.3,
				attr = "airPower",
				time = 3,
				dotType = 1,
				number = 5
			}
		}
	}
}
