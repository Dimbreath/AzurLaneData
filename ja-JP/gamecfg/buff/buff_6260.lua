return {
	time = 0,
	name = "精确锁定",
	init_effect = "",
	id = 6260,
	picture = "",
	desc = "第一轮主炮准备时间缩短15%",
	stack = 1,
	color = "yellow",
	icon = 6260,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 6260
			}
		}
	}
}
