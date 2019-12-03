return {
	time = 0,
	name = "",
	init_effect = "",
	id = 6416,
	picture = "",
	desc = "",
	stack = 1,
	color = "blue",
	icon = 6410,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 1,
				check_target = "TargetShipTag",
				skill_id = 6415,
				target = "TargetSelf",
				ship_tag_list = {
					"danyaokuifa"
				}
			}
		}
	}
}
