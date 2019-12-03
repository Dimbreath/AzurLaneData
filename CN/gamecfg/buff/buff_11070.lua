return {
	{
		desc = "太原技能"
	},
	{
		desc = "太原技能"
	},
	{
		desc = "太原技能"
	},
	{
		desc = "太原技能"
	},
	{
		desc = "太原技能"
	},
	{
		desc = "太原技能"
	},
	{
		desc = "太原技能"
	},
	{
		desc = "太原技能"
	},
	{
		desc = "太原技能"
	},
	{
		desc = "太原技能"
	},
	desc_get = "出击时，若队伍中舰娘编队为满员6人，自身炮击、装填提高10%（25%），机动提高4%（10%）",
	name = "太原技能",
	init_effect = "",
	id = 11070,
	time = 0,
	picture = "",
	desc = "出击时，若队伍中舰娘编队为满员6人，自身炮击、装填提高10%（25%），机动提高4%（10%）",
	stack = 1,
	color = "yellow",
	icon = 11070,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minTargetNumber = 6,
				check_target = "TargetShipTypeFriendly",
				quota = 1,
				skill_id = 11070,
				ship_type_list = {
					1,
					2,
					3,
					4,
					5,
					6,
					7,
					9,
					10,
					11,
					12,
					13,
					18
				}
			}
		}
	}
}
