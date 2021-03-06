return {
	time = 0,
	name = "2019年2月世界BOSS三阶段易伤",
	init_effect = "",
	id = 8605,
	picture = "",
	desc = "航空易伤",
	stack = 1,
	color = "yellow",
	icon = 2120,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				number = 0.15,
				attr = "injureRatioByAir"
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				number = -0.2,
				attr = "injureRatioByCannon"
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				number = -0.2,
				attr = "injureRatioByBulletTorpedo"
			}
		}
	}
}
