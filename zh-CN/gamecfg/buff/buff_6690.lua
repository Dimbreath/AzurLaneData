return {
	time = 0,
	name = "",
	init_effect = "",
	id = 6690,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 6690,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 6701,
				target = "TargetSelf"
			}
		}
	}
}
