return {
	time = 15,
	name = "点燃",
	init_effect = "",
	picture = "",
	desc = "大青花鱼技能鱼雷点燃",
	stack = 1,
	id = 318,
	icon = 318,
	last_effect = "zhuoshao",
	effect_list = {
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				k = 0.4,
				attr = "torpedoPower",
				time = 3,
				dotType = 1,
				number = 5
			}
		}
	}
}
