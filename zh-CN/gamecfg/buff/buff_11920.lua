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
	desc_get = "队伍中存在克利夫兰级的角色时，机队变化",
	name = "天之骑士",
	init_effect = "",
	id = 11920,
	time = 0,
	picture = "",
	desc = "空袭时额外机队攻击，队伍中存在克利夫兰级的角色时，机队变化",
	stack = 1,
	color = "yellow",
	icon = 11920,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAllInStrikeSteady"
			},
			arg_list = {
				minTargetNumber = 1,
				check_target = "TargetShipTag",
				skill_id = 11920,
				target = "TargetSelf",
				ship_tag_list = {
					"Cleveland-Class"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAllInStrikeSteady"
			},
			arg_list = {
				check_target = "TargetShipTag",
				skill_id = 11921,
				maxTargetNumber = 0,
				target = "TargetSelf",
				ship_tag_list = {
					"Cleveland-Class"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minTargetNumber = 1,
				check_target = "TargetShipTag",
				skill_id = 11922,
				target = "TargetSelf",
				ship_tag_list = {
					"Cleveland-Class"
				}
			}
		}
	}
}
