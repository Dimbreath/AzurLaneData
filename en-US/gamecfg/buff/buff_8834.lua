return {
	time = 1.7,
	name = "metaboss保底伤害",
	init_effect = "",
	picture = "",
	desc = "持续伤害",
	stack = 1,
	id = 8834,
	icon = 8834,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 0.16,
				randExtraRange = 70,
				dotType = 10,
				number = -8012,
				WorldBossDotDamage = {
					paramA = 280,
					useGlobalAttr = "WorldBossSupportDays"
				}
			}
		}
	}
}
