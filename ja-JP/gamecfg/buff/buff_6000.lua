return {
	time = 0,
	name = "小海狸中队",
	init_effect = "",
	id = 6000,
	picture = "",
	desc = "全队航速提高20%",
	stack = 1,
	color = "yellow",
	icon = 6000,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 6000
			}
		}
	}
}
