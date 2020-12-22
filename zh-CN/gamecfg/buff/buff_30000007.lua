return {
	time = 0,
	name = "瞬移的前置",
	init_effect = "",
	id = 30000007,
	picture = "",
	desc = "战斗对象的血量下降到X%时，召唤特殊怪物",
	stack = 1,
	color = "red",
	icon = 73500,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				check_target = "TargetSelf",
				skill_id = 30000007,
				minTargetNumber = 1,
				hpOutInterval = true,
				target = "TargetSelf",
				hpLowerBound = 0.95
			}
		}
	}
}
