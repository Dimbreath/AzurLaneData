return {
	desc_get = "",
	name = "海雾我方生效buff",
	init_effect = "",
	id = 9622,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 9622,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = -3,
				attr = "aimBiasDecaySpeed"
			}
		}
	}
}
