return {
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	time = 0,
	name = "五航战",
	init_effect = "",
	id = 10800,
	picture = "",
	desc = "与翔鹤同在一个舰队时，自身航空性能提高8.0%(满级20.0%)，受到伤害降低8.0%(满级20.0%)",
	stack = 1,
	color = "yellow",
	icon = 10800,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				check_target = "TargetTemplate",
				minTargetNumber = 1,
				skill_id = 10800,
				target = "TargetSelf",
				targetTemplateIDList = {
					307051,
					307052,
					307053,
					307054
				}
			}
		}
	}
}
