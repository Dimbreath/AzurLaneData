return {
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	desc_get = "更换主炮弹药种类",
	name = "2700磅的正义",
	init_effect = "",
	id = 11560,
	time = 0,
	picture = "",
	desc = "更换主炮弹药种类",
	stack = 1,
	color = "red",
	icon = 11560,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 11560,
				target = "TargetSelf"
			}
		}
	}
}
