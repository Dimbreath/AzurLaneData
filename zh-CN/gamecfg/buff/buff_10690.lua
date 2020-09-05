return {
	{
		desc = "使用伯鲁克科技的舰载机（ BF-#109T、ME-#155A、JU-#87C等）将额外获得15.0%的装备效率",
		addition = {
			"15.0%(+1.0%)"
		},
		shipInfoScene = {
			equip = {
				{
					number = 15,
					label = {
						"KMS",
						"CV"
					}
				}
			}
		}
	},
	{
		desc = "使用伯鲁克科技的舰载机（ BF-#109T、ME-#155A、JU-#87C等）将额外获得16.0%的装备效率",
		addition = {
			"16.0%(+1.0%)"
		},
		shipInfoScene = {
			equip = {
				{
					number = 16,
					label = {
						"KMS",
						"CV"
					}
				}
			}
		}
	},
	{
		desc = "使用伯鲁克科技的舰载机（ BF-#109T、ME-#155A、JU-#87C等）将额外获得17.0%的装备效率",
		addition = {
			"17.0%(+2.0%)"
		},
		shipInfoScene = {
			equip = {
				{
					number = 17,
					label = {
						"KMS",
						"CV"
					}
				}
			}
		}
	},
	{
		desc = "使用伯鲁克科技的舰载机（ BF-#109T、ME-#155A、JU-#87C等）将额外获得19.0%的装备效率",
		addition = {
			"19.0%(+1.0%)"
		},
		shipInfoScene = {
			equip = {
				{
					number = 19,
					label = {
						"KMS",
						"CV"
					}
				}
			}
		}
	},
	{
		desc = "使用伯鲁克科技的舰载机（ BF-#109T、ME-#155A、JU-#87C等）将额外获得20.0%的装备效率",
		addition = {
			"20.0%(+1.0%)"
		},
		shipInfoScene = {
			equip = {
				{
					number = 20,
					label = {
						"KMS",
						"CV"
					}
				}
			}
		}
	},
	{
		desc = "使用伯鲁克科技的舰载机（ BF-#109T、ME-#155A、JU-#87C等）将额外获得21.0%的装备效率",
		addition = {
			"21.0%(+2.0%)"
		},
		shipInfoScene = {
			equip = {
				{
					number = 21,
					label = {
						"KMS",
						"CV"
					}
				}
			}
		}
	},
	{
		desc = "使用伯鲁克科技的舰载机（ BF-#109T、ME-#155A、JU-#87C等）将额外获得23.0%的装备效率",
		addition = {
			"23.0%(+2.0%)"
		},
		shipInfoScene = {
			equip = {
				{
					number = 23,
					label = {
						"KMS",
						"CV"
					}
				}
			}
		}
	},
	{
		desc = "使用伯鲁克科技的舰载机（ BF-#109T、ME-#155A、JU-#87C等）将额外获得25.0%的装备效率",
		addition = {
			"25.0%(+2.0%)"
		},
		shipInfoScene = {
			equip = {
				{
					number = 25,
					label = {
						"KMS",
						"CV"
					}
				}
			}
		}
	},
	{
		desc = "使用伯鲁克科技的舰载机（ BF-#109T、ME-#155A、JU-#87C等）将额外获得27.0%的装备效率",
		addition = {
			"27.0%(+3.0%)"
		},
		shipInfoScene = {
			equip = {
				{
					number = 27,
					label = {
						"KMS",
						"CV"
					}
				}
			}
		}
	},
	{
		desc = "使用伯鲁克科技的舰载机（ BF-#109T、ME-#155A、JU-#87C等）将额外获得30.0%的装备效率",
		addition = {
			"30.0%"
		},
		shipInfoScene = {
			equip = {
				{
					number = 30,
					label = {
						"KMS",
						"CV"
					}
				}
			}
		}
	},
	desc_get = "使用伯鲁克科技的舰载机（ BF-#109T、ME-#155A、JU-#87C等）将额外获得15.0%(满级30.0%)的装备效率",
	name = "铁血之鹰",
	init_effect = "",
	id = 10690,
	time = 0,
	picture = "",
	desc = "使用伯鲁克科技的舰载机（ BF-#109T、ME-#155A、JU-#87C等）将额外获得$1的装备效率",
	stack = 1,
	color = "red",
	icon = 10690,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 10690,
				target = "TargetSelf"
			}
		}
	}
}
