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
	name = "棘鳍弹幕",
	init_effect = "",
	id = 12470,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12470,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onSubmarineRaid"
			},
			arg_list = {
				skill_id = 12470,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onSubmarineRaid"
			},
			arg_list = {
				check_target = "TargetShipTag",
				buff_id = 12472,
				maxTargetNumber = 0,
				target = "TargetSelf",
				ship_tag_list = {
					"Albacore"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onSubmarineRaid"
			},
			arg_list = {
				check_target = "TargetShipTag",
				minTargetNumber = 1,
				buff_id = 12473,
				target = "TargetSelf",
				ship_tag_list = {
					"Albacore"
				}
			}
		}
	}
}
