return {
	{},
	time = 0,
	name = "全弹发射",
	init_effect = "",
	id = 22312,
	picture = "",
	desc = "进入战斗后，触发全弹发射-伊级II",
	stack = 1,
	color = "red",
	icon = 20300,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onSubmarineRaid",
				"onSubmarineFreeSpecial"
			},
			arg_list = {
				quota = 1,
				skill_id = 22312,
				target = "TargetSelf"
			}
		}
	}
}
