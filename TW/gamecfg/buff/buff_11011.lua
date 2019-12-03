return {
	time = 0,
	name = "铁底湾之夜",
	init_effect = "",
	picture = "",
	desc = "南达触发效果",
	stack = 1,
	id = 11011,
	icon = 11011,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				quota = 1,
				target = "TargetTemplate",
				hpUpperBound = 0.3,
				skill_id = 11010,
				targetTemplateIDList = {
					105131,
					105132,
					105133,
					105134
				}
			}
		}
	}
}
