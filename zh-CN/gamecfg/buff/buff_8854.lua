return {
	time = 10,
	name = "毛系V2 余辉支援弹幕LV4",
	init_effect = "",
	id = 8854,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 8854,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				skill_id = 8853,
				time = 8,
				rant = 10000,
				target = "TargetSelf"
			}
		}
	}
}
