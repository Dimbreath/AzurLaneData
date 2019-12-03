return {
	{
		desc = "降低舰队中所有铁血阵营角色受到的伤害5.0%",
		addition = {
			"5.0%(+1.1%)"
		}
	},
	{
		desc = "降低舰队中所有铁血阵营角色受到的伤害6.1%",
		addition = {
			"6.1%(+1.1%)"
		}
	},
	{
		desc = "降低舰队中所有铁血阵营角色受到的伤害7.2%",
		addition = {
			"7.2%(+1.1%)"
		}
	},
	{
		desc = "降低舰队中所有铁血阵营角色受到的伤害8.3%",
		addition = {
			"8.3%(+1.1%)"
		}
	},
	{
		desc = "降低舰队中所有铁血阵营角色受到的伤害9.4%",
		addition = {
			"9.4%(+1.1%)"
		}
	},
	{
		desc = "降低舰队中所有铁血阵营角色受到的伤害10.5%",
		addition = {
			"10.5%(+1.1%)"
		}
	},
	{
		desc = "降低舰队中所有铁血阵营角色受到的伤害11.6%",
		addition = {
			"11.6%(+1.1%)"
		}
	},
	{
		desc = "降低舰队中所有铁血阵营角色受到的伤害12.7%",
		addition = {
			"12.7%(+1.1%)"
		}
	},
	{
		desc = "降低舰队中所有铁血阵营角色受到的伤害13.8%",
		addition = {
			"13.8%(+1.2%)"
		}
	},
	{
		desc = "降低舰队中所有铁血阵营角色受到的伤害15.0%",
		addition = {
			"15.0%"
		}
	},
	desc_get = "降低舰队中所有铁血阵营角色受到的伤害5.0%(满级15.0%)",
	name = "铁血之翼",
	init_effect = "",
	id = 10680,
	time = 0,
	picture = "",
	desc = "降低舰队中所有铁血阵营角色受到的伤害$1",
	stack = 1,
	color = "blue",
	icon = 10680,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 10680,
				target = "TargetSelf"
			}
		}
	}
}
