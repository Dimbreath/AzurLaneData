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
	desc_get = "队伍中存在贝露&翡绿之心时，自身伤害提高，受到伤害提高，队伍中不存在贝露&翡绿之心时，自身受到伤害降低，伤害降低",
	name = "限阻破坏",
	init_effect = "",
	id = 101030,
	time = 0,
	picture = "",
	desc = "队伍中存在贝露&翡绿之心时，自身伤害提高，受到伤害提高，队伍中不存在贝露&翡绿之心时，自身受到伤害降低，伤害降低",
	stack = 1,
	color = "yellow",
	icon = 101030,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minTargetNumber = 1,
				skill_id = 101030,
				check_target = "TargetTemplate",
				target = "TargetSelf",
				targetTemplateIDList = {
					10100041,
					10100042,
					10100043,
					10100044,
					10100081,
					10100082,
					10100083,
					10100084
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				check_target = "TargetTemplate",
				skill_id = 101031,
				maxTargetNumber = 0,
				target = "TargetSelf",
				targetTemplateIDList = {
					10100041,
					10100042,
					10100043,
					10100044,
					10100081,
					10100082,
					10100083,
					10100084
				}
			}
		}
	}
}
