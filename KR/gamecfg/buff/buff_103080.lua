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
	id = 103080,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 103080,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				check_target = "TargetTemplate",
				minTargetNumber = 1,
				buff_id = 103082,
				target = "TargetSelf",
				targetTemplateIDList = {
					10300051,
					10300052,
					10300053,
					10300054
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
