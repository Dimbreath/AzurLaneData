return {
	time = 0,
	name = "战列增伤",
	init_effect = "",
	id = 6540,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 6540,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = 0.03,
				attr = "DMG_TAG_EHC_T_4"
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = 0.03,
				attr = "DMG_TAG_EHC_T_5"
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = 0.03,
				attr = "DMG_TAG_EHC_T_10"
			}
		}
	}
}
