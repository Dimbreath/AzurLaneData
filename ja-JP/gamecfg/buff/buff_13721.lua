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
	name = "检查伯明翰",
	init_effect = "",
	id = 13721,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 13720,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				check_target = "TargetShipTag",
				minTargetNumber = 1,
				skill_id = 13720,
				target = "TargetSelf",
				ship_tag_list = {
					"Birmingham"
				}
			}
		}
	}
}
