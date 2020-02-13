return {
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	desc_get = "",
	name = "加斯科涅μ1",
	init_effect = "",
	id = 12780,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12780,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 12780,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 12782,
				target = "TargetSelf"
			}
		}
	}
}
