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
	desc_get = "与南达科他处于同一队伍时，自身炮击提高20%，南达科他受到伤害降低10%",
	name = "防空火力",
	init_effect = "",
	id = 10990,
	time = 0,
	picture = "",
	desc = "与南达科他处于同一队伍时，自身炮击提高20%，南达科他受到伤害降低10%",
	stack = 1,
	color = "red",
	icon = 10990,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 10990
			}
		}
	}
}
