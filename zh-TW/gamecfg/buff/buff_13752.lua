return {
	time = 2.1,
	name = "",
	init_effect = "",
	picture = "",
	desc = "持续伤害",
	stack = 2,
	id = 13752,
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
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStack"
			},
			arg_list = {
				buff_id = 13753
			}
		}
	}
}
