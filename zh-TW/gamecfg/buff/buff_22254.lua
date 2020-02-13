return {
	time = 0,
	name = "全弹发射",
	init_effect = "",
	id = 22254,
	picture = "",
	desc = "主炮每进行9次攻击，触发全弹发射-{namecode:57}级{namecode:59}型I",
	stack = 1,
	color = "red",
	icon = 20200,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 9,
				countType = 22254,
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
				check_target = "TargetShipTag",
				target = "TargetSelf",
				countType = 22254,
				maxTargetNumber = 0,
				skill_id = 22254,
				ship_tag_list = {
					"Suzuya"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				minTargetNumber = 1,
				check_target = "TargetShipTag",
				target = "TargetSelf",
				countType = 22254,
				skill_id = 22256,
				ship_tag_list = {
					"Suzuya"
				}
			}
		}
	}
}
