return {
	time = 0,
	name = "司特莲库斯雷电buff",
	init_effect = "",
	id = 79012,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 8636,
	last_effect = "sairenboss6_buff",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = -0.15,
				attr = "damageGetRatioByBulletTorpedo"
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = -0.15,
				attr = "damageGetRatioByCannon"
			}
		}
	}
}
