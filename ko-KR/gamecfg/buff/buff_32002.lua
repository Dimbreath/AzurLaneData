return {
	{
		desc = "每隔30秒触发护盾，一定时间内取消子弹，护盾持续8秒",
		effect_list = {
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					skill_id = 32002,
					time = 30,
					target = "TargetSelf"
				}
			}
		}
	},
	time = 0,
	name = "正面装甲",
	init_effect = "",
	picture = "",
	desc = "每隔30秒触发护盾，一定时间内取消子弹，护盾持续8秒",
	stack = 1,
	id = 32002,
	icon = 32002,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				skill_id = 32002,
				time = 30,
				target = "TargetSelf"
			}
		}
	}
}
