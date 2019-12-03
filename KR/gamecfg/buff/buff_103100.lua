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
	name = "双影无双",
	init_effect = "",
	id = 103100,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 103100,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				buff_id = 103101,
				minTargetNumber = 1,
				check_target = "TargetTemplate",
				target = "TargetSelf",
				targetTemplateIDList = {
					10300041,
					10300042,
					10300043,
					10300044
				}
			}
		},
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				number = 1,
				attr = "cri",
				index = {
					-1
				}
			}
		}
	}
}
