return {
	time = 2.1,
	name = "",
	init_effect = "",
	picture = "",
	desc = "持续伤害",
	stack = 2,
	id = 19465,
	icon = 19460,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffHP",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = -234
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStack"
			},
			arg_list = {
				buff_id = 19466
			}
		}
	}
}
