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
	time = 0,
	name = "龙凤2",
	init_effect = "",
	id = 12871,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 12870,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 12874,
				target = "TargetShipTag",
				ship_tag_list = {
					"ryuhou"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onSubmarineRaid"
			},
			arg_list = {
				skill_id = 12871,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onFoeDying"
			},
			arg_list = {
				target = "TargetShipTag",
				skill_id = 12872,
				time = 1,
				killer = "self",
				ship_tag_list = {
					"ryuhou"
				}
			}
		}
	}
}
