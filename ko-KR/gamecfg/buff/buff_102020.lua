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
	name = "22领队技能",
	init_effect = "",
	id = 102020,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 102020,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onLeader"
			},
			arg_list = {
				check_target = "TargetTemplate",
				minTargetNumber = 1,
				skill_id = 102020,
				target = "TargetSelf",
				targetTemplateIDList = {
					10200021,
					10200022,
					10200023,
					10200024
				}
			}
		}
	}
}
