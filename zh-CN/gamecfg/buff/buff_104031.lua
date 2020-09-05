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
	name = "连接着的羁绊",
	init_effect = "",
	id = 104031,
	picture = "",
	desc = "连接着的羁绊-检测TAG",
	stack = 1,
	color = "yellow",
	icon = 104030,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 104032,
				minTargetNumber = 2,
				check_target = "TargetShipTag",
				isBuffStackByCheckTarget = true,
				target = "TargetSelf",
				ship_tag_list = {
					"KizunaAI"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				check_target = "TargetShipTag",
				skill_id = 104031,
				maxTargetNumber = 1,
				target = "TargetSelf",
				ship_tag_list = {
					"KizunaAI"
				}
			}
		}
	}
}
