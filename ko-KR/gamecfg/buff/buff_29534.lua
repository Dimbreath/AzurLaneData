return {
	{},
	time = 0,
	name = "专属弹幕",
	init_effect = "",
	id = 29534,
	picture = "",
	desc = "轻巡主炮每进行8次攻击，触发专属弹幕-里诺II",
	stack = 1,
	color = "red",
	icon = 29530,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 8,
				countType = 29530,
				index = {
					1
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				skill_id = 29533,
				target = "TargetSelf",
				countType = 29530
			}
		}
	}
}
