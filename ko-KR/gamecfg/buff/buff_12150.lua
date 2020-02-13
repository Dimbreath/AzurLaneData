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
	name = "最适化武装",
	init_effect = "",
	id = 12150,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12150,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minWeaponNumber = 1,
				skill_id = 12170,
				check_weapon = true,
				weapon_group = {
					24000,
					24020,
					24040
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				maxWeaponNumber = 0,
				skill_id = 12173,
				check_weapon = true,
				weapon_group = {
					24000,
					24020,
					24040
				}
			}
		}
	}
}
