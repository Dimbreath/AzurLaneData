return {
	time = 16,
	name = "metaboss保底伤害",
	init_effect = "",
	picture = "",
	desc = "持续伤害",
	stack = 1,
	id = 8835,
	icon = 8835,
	last_effect = "heifangzhou_ranshao",
	effect_list = {
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 3,
				randExtraRange = 70,
				dotType = 10,
				number = -8000,
				WorldBossDotDamage = {
					paramA = 293,
					useGlobalAttr = "WorldBossSupportDays"
				}
			}
		}
	}
}
