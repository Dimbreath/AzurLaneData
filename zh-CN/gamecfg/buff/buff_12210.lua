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
	name = "蜂鸟直升机",
	init_effect = "",
	id = 12210,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12210,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				time = 10,
				check_weapon = true,
				minWeaponNumber = 1,
				skill_id = 12210,
				weapon_group = {
					740
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 12212,
				minWeaponNumber = 1,
				time = 10,
				check_weapon = true,
				quota = 1,
				weapon_group = {
					740
				}
			}
		}
	}
}
