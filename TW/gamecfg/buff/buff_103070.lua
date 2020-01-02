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
	desc_get = "与萨菈娜同在一个舰队时，自身航空性能提高20.0%(满级40.0%)，命中装填+10%~25%",
	name = "锁之巫女-乌璐露",
	init_effect = "",
	id = 103070,
	time = 0,
	picture = "",
	desc = "与萨菈娜同在一个舰队时",
	stack = 1,
	color = "yellow",
	icon = 103070,
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
				skill_id = 103070,
				target = "TargetSelf",
				targetTemplateIDList = {
					10300051,
					10300052,
					10300053,
					10300054
				}
			}
		}
	}
}
