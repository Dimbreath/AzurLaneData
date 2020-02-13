return {
	{
		desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升1.0%",
		addition = {
			"1.0%(+0.4%)"
		}
	},
	{
		desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升1.4%",
		addition = {
			"1.4%(+0.4%)"
		}
	},
	{
		desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升1.8%",
		addition = {
			"1.8%(+0.4%)"
		}
	},
	{
		desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升2.2%",
		addition = {
			"2.2%(+0.4%)"
		}
	},
	{
		desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升2.6%",
		addition = {
			"2.6%(+0.4%)"
		}
	},
	{
		desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升3.0%",
		addition = {
			"3.0%(+0.5%)"
		}
	},
	{
		desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升3.5%",
		addition = {
			"3.5%(+0.5%)"
		}
	},
	{
		desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升4.0%",
		addition = {
			"4.0%(+0.5%)"
		}
	},
	{
		desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升4.5%",
		addition = {
			"4.5%(+0.5%)"
		}
	},
	{
		desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升5.0%",
		addition = {
			"5.0%"
		}
	},
	desc_get = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升1.0%(满级5.0%)",
	name = "皇家同盟",
	init_effect = "",
	id = 10540,
	time = 0,
	picture = "",
	desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升$1",
	stack = 1,
	color = "red",
	icon = 10540,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 10541,
				check_target = "TargetNationalityFriendly",
				nationality = 1,
				isBuffStackByCheckTarget = true
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				check_target = "TargetNationalityFriendly",
				minTargetNumber = 1,
				skill_id = 10540,
				nationality = 1
			}
		}
	}
}
