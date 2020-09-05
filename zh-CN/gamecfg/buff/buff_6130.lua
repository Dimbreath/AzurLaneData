return {
	{
		desc = "被击沉时恢复全队其他角色耐久10.0%"
	},
	time = 0,
	name = "珍珠之泪",
	init_effect = "",
	id = 6130,
	picture = "",
	desc = "被击沉时恢复全队其他角色耐久10%",
	stack = 1,
	color = "blue",
	icon = 6130,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onDying"
			},
			arg_list = {
				skill_id = 6130,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCancelBuff",
			trigger = {
				"onDying"
			},
			arg_list = {
				count = 1
			}
		}
	}
}
