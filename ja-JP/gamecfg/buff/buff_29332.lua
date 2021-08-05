return {
	{
		desc = "主炮每进行10次攻击，触发专属弹幕-凯旋II"
	},
	desc_get = "主炮每进行10次攻击，触发专属弹幕-凯旋II",
	name = "专属弹幕-凯旋II",
	init_effect = "",
	id = 29332,
	time = 0,
	picture = "",
	desc = "主炮每进行10次攻击，触发专属弹幕-凯旋II",
	stack = 1,
	color = "red",
	icon = 29330,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 10,
				countType = 29330,
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
				skill_id = 29332,
				target = "TargetSelf",
				countType = 29330
			}
		}
	}
}
