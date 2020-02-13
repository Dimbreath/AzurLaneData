return {
	time = 10,
	name = "视野限制-敌方隐藏光环-属性修改",
	init_effect = "",
	picture = "",
	desc = "",
	stack = 1,
	id = 99911141,
	icon = 9,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAura",
			trigger = {
				""
			},
			arg_list = {
				buff_id = 99911141,
				target = {
					"TargetPlayerLeaderShip"
				}
			}
		},
		{
			type = "BattleFleetBuffInk",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {}
		},
		{
			type = "BattleFleetBuffBlindAura",
			trigger = {},
			arg_list = {
				target = {
					"TargetAllHarm"
				}
			}
		}
	}
}
