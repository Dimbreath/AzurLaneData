return {
	time = 15,
	name = "水面减伤护盾",
	init_effect = "",
	id = 8693,
	picture = "",
	desc = "",
	stack = 1,
	color = "blue",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 8674,
				time = 11,
				target = "TargetSelf",
				quota = 1
			}
		}
	}
}
