return {
	{
		desc = "主炮每进行12次攻击，触发专属弹幕-罗恩I"
	},
	desc_get = "主炮每进行12次攻击，触发专属弹幕-罗恩I",
	name = "专属弹幕-罗恩I",
	init_effect = "",
	id = 29241,
	time = 0,
	picture = "",
	desc = "主炮每进行12次攻击，触发专属弹幕-罗恩I",
	stack = 1,
	color = "red",
	icon = 29240,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 12,
				countType = 29240,
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
				skill_id = 29241,
				target = "TargetSelf",
				countType = 29240
			}
		}
	}
}
