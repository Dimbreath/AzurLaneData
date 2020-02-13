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
	desc_get = "在队伍中(存活)时降低轻母、航母受到的伤害",
	name = "远东的羁绊",
	init_effect = "",
	id = 12000,
	time = 0,
	picture = "",
	desc = "队伍中(存活)时降低轻母、航母受到的伤害$1",
	stack = 1,
	color = "yellow",
	icon = 12000,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAura",
			trigger = {},
			arg_list = {
				buff_id = 12001,
				shipType = 6,
				target = "TargetPlayerByType"
			}
		},
		{
			type = "BattleBuffAura",
			trigger = {},
			arg_list = {
				buff_id = 12001,
				shipType = 7,
				target = "TargetPlayerByType"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 12000
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				check_target = "TargetTemplate",
				minTargetNumber = 1,
				skill_id = 12001,
				target = "TargetSelf",
				targetTemplateIDList = {
					101051,
					101052,
					101053,
					101054
				}
			}
		}
	}
}
