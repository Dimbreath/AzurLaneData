pg = pg or {}
pg.battle_environment_behaviour_template = {
	[10000] = {
		id = 10000,
		name = "默认状态无",
		behaviour_list = {}
	},
	[105] = {
		id = 105,
		name = "火山示例",
		behaviour_list = {
			{
				life_time = 3,
				damage = 20,
				type = 2,
				reload_time = 0.5,
				offset = 5
			},
			{
				shake_ID = 999,
				reload_time = 6,
				type = 8
			},
			{
				hp_rate = 0.03,
				damage = 100,
				type = 2,
				delay = 3.5,
				reload_time = 5,
				offset = 20
			},
			{
				FX_ID = "haidihuoshan_baofa",
				scaleRate = 1,
				type = 1,
				delay = 3.5,
				reload_time = 4
			}
		}
	},
	[10001] = {
		id = 10001,
		name = "寒冰区域模板示例 伤害+减速+移动",
		behaviour_list = {
			{
				reload_time = 1,
				hp_rate = 0,
				damage = 1,
				type = 2
			},
			{
				buff_id = 10331,
				reload_time = 1,
				type = 3
			},
			{
				random_speed = 10,
				type = 4,
				route = {
					{
						-10,
						0,
						55,
						5
					},
					{
						-40,
						0,
						30,
						30
					}
				},
				random_duration = {
					3,
					5
				},
				random_range = {
					1,
					1
				}
			}
		}
	},
	[10002] = {
		id = 10002,
		name = "模板示例 伤害+减速+间隔播放特效+间隔播放音效",
		behaviour_list = {
			{
				FX_ID = "ShellMiss",
				reload_time = 0.5,
				type = 1
			},
			{
				reload_time = 0.5,
				hp_rate = 0,
				damage = 1,
				type = 2
			},
			{
				buff_id = 10331,
				reload_time = 0.5,
				type = 3
			},
			{
				SFX_ID = "battle/cannon-356mm",
				reload_time = 0.5,
				type = 7
			}
		}
	},
	[10003] = {
		id = 10003,
		name = "闪电行为",
		behaviour_list = {
			{
				offset_time = 0,
				type = 6,
				reload_time = 1.2,
				rounds = 10,
				content = {
					count = 1,
					alert = {
						alert_fx = "AlertArea",
						range = 10,
						delay = 0.8
					},
					child_prefab = {
						behaviours = 10007,
						life_time = 0.5,
						cld_data = {
							15
						}
					}
				},
				route = {
					{
						count = 7
					},
					{
						count = 7
					},
					{
						count = 7
					},
					{
						count = 7
					}
				}
			}
		}
	},
	[10004] = {
		id = 10004,
		name = "火山预警",
		behaviour_list = {
			{
				reload_time = 0.5,
				hp_rate = 0,
				damage = 10,
				type = 2
			}
		}
	},
	[10005] = {
		id = 10005,
		name = "火山伤害",
		behaviour_list = {
			{
				hp_rate = 0,
				damage = 30,
				type = 2,
				reload_time = 2,
				offset = 20
			},
			{
				FX_ID = "haidihuoshan_baofa",
				reload_time = 5,
				scaleRate = 0.05,
				type = 1
			}
		}
	},
	[10006] = {
		id = 10006,
		name = "龙卷风随机移动",
		behaviour_list = {
			{
				hp_rate = 0.01,
				damage = 45,
				type = 2,
				reload_time = 0.2,
				offset = 10
			},
			{
				buff_id = 30000002,
				reload_time = 0.5,
				type = 3
			},
			{
				random_speed = 20,
				type = 4,
				route = {},
				random_duration = {
					0,
					30
				}
			}
		}
	},
	[10007] = {
		id = 10007,
		name = "闪电子行为",
		behaviour_list = {
			{
				FX_ID = "shandian",
				reload_time = 100,
				type = 1,
				offset = {
					0,
					0,
					34
				}
			},
			{
				hp_rate = 0,
				damage = 900,
				type = 2,
				reload_time = 2,
				offset = 60
			}
		}
	},
	[10008] = {
		id = 10008,
		name = "球形闪电移动",
		behaviour_list = {
			{
				reload_time = 0.5,
				hp_rate = 0,
				damage = 1,
				type = 2
			},
			{
				buff_id = 10331,
				reload_time = 0.5,
				type = 3
			},
			{
				type = 5,
				route = {
					{
						1,
						0,
						1,
						2,
						0
					}
				}
			}
		}
	},
	[10009] = {
		id = 10009,
		name = "巨浪移动",
		behaviour_list = {
			{
				reload_time = 1,
				hp_rate = 0,
				damage = 100,
				type = 2
			},
			{
				type = 4,
				route = {
					{
						-170,
						0,
						55,
						3
					}
				}
			}
		}
	}
}
