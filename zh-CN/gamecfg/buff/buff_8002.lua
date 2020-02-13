return {
	time = 0,
	name = "自爆船冲撞自杀buff",
	init_effect = "",
	picture = "",
	desc = "自爆船冲撞自杀buff",
	stack = 1,
	id = 8002,
	icon = 8002,
	last_effect = "",
	effect_list = {
		80042,
		80041
	},
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 8006,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 8003,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCancelBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				count = 1
			}
		}
	}
}
