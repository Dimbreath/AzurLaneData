return {
	{},
	time = 0,
	name = "专属弹幕",
	init_effect = "",
	id = 29522,
	picture = "",
	desc = "主炮每进行15次攻击，触发专属弹幕-里诺I",
	stack = 1,
	color = "red",
	icon = 29520,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 15,
				countType = 29520,
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
				skill_id = 29523,
				target = "TargetSelf",
				countType = 29520
			}
		}
	}
}
