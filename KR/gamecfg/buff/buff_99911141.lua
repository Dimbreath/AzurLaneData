return {
	time = 5,
	name = "致盲后视野测试",
	init_effect = "",
	picture = "",
	desc = "",
	stack = 1,
	id = 99911141,
	icon = 9,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffBlindedHorizon",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				range = 30
			}
		}
	}
}
