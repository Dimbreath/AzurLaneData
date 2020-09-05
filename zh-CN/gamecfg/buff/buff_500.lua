return {
	time = 0,
	name = "活动buff-祭典祈愿效果-战斗伤害提高",
	init_effect = "",
	id = 500,
	picture = "",
	desc = "舰队伤害提高",
	stack = 1,
	color = "yellow",
	icon = 500,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 500
			}
		}
	}
}
