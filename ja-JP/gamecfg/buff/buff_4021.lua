return {
	{
		desc = "受到攻击时有3.5%的概率减少50%伤害",
		addition = {
			"3.5%(+0.5%)"
		},
		effect_list = {
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeHit"
				},
				arg_list = {
					rant = 350,
					target = "TargetSelf",
					skill_id = 4021,
					time = 0
				}
			}
		}
	},
	{
		desc = "受到攻击时有4.0%的概率减少50%伤害",
		addition = {
			"4.0%(+0.5%)"
		},
		effect_list = {
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeHit"
				},
				arg_list = {
					rant = 400,
					target = "TargetSelf",
					skill_id = 4021,
					time = 0
				}
			}
		}
	},
	{
		desc = "受到攻击时有4.5%的概率减少50%伤害",
		addition = {
			"4.5%(+0.5%)"
		},
		effect_list = {
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeHit"
				},
				arg_list = {
					rant = 450,
					target = "TargetSelf",
					skill_id = 4021,
					time = 0
				}
			}
		}
	},
	{
		desc = "受到攻击时有5.0%的概率减少50%伤害",
		addition = {
			"5.0%(+0.5%)"
		},
		effect_list = {
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeHit"
				},
				arg_list = {
					rant = 500,
					target = "TargetSelf",
					skill_id = 4021,
					time = 0
				}
			}
		}
	},
	{
		desc = "受到攻击时有5.5%的概率减少50%伤害",
		addition = {
			"5.5%(+0.5%)"
		},
		effect_list = {
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeHit"
				},
				arg_list = {
					rant = 550,
					target = "TargetSelf",
					skill_id = 4021,
					time = 0
				}
			}
		}
	},
	{
		desc = "受到攻击时有6.0%的概率减少50%伤害",
		addition = {
			"6.0%(+0.5%)"
		},
		effect_list = {
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeHit"
				},
				arg_list = {
					rant = 600,
					target = "TargetSelf",
					skill_id = 4021,
					time = 0
				}
			}
		}
	},
	{
		desc = "受到攻击时有6.5%的概率减少50%伤害",
		addition = {
			"6.5%(+0.5%)"
		},
		effect_list = {
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeHit"
				},
				arg_list = {
					rant = 650,
					target = "TargetSelf",
					skill_id = 4021,
					time = 0
				}
			}
		}
	},
	{
		desc = "受到攻击时有7.0%的概率减少50%伤害",
		addition = {
			"7.0%(+0.5%)"
		},
		effect_list = {
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeHit"
				},
				arg_list = {
					rant = 700,
					target = "TargetSelf",
					skill_id = 4021,
					time = 0
				}
			}
		}
	},
	{
		desc = "受到攻击时有7.5%的概率减少50%伤害",
		addition = {
			"7.5%(+0.5%)"
		},
		effect_list = {
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeHit"
				},
				arg_list = {
					rant = 750,
					target = "TargetSelf",
					skill_id = 4021,
					time = 0
				}
			}
		}
	},
	{
		desc = "受到攻击时有8.0%的概率减少50%伤害",
		addition = {
			"8.0%"
		},
		effect_list = {
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeHit"
				},
				arg_list = {
					rant = 800,
					target = "TargetSelf",
					skill_id = 4021,
					time = 0
				}
			}
		}
	},
	desc_get = "受到攻击时有3.5%(满级8.0%)的概率减少50%伤害",
	name = "重点防护",
	init_effect = "jinengchufablue",
	id = 4021,
	time = 0,
	picture = "",
	desc = "受到攻击时有$1的概率减少50%伤害",
	stack = 1,
	color = "blue",
	icon = 4020,
	last_effect = "",
	blink = {
		0,
		0.7,
		1,
		0.3,
		0.3
	},
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBeHit"
			},
			arg_list = {
				rant = 350,
				target = "TargetSelf",
				skill_id = 4021,
				time = 0
			}
		}
	}
}
