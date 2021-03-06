return {
	id = 5013,
	bgm = "story-4",
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 180,
			backGroundStageID = 1,
			passCondition = 1,
			totalArea = {
				-75,
				20,
				90,
				70
			},
			playerArea = {
				-75,
				20,
				42,
				68
			},
			enemyArea = {},
			fleetCorrdinate = {
				-80,
				0,
				75
			},
			waves = {
				{
					triggerType = 1,
					waveIndex = 100,
					preWaves = {},
					triggerParams = {
						timeout = 0.5
					}
				},
				{
					triggerType = 0,
					waveIndex = 201,
					conditionType = 1,
					preWaves = {
						100
					},
					triggerParams = {
						round = {
							equal = {
								1
							}
						}
					},
					spawn = {
						{
							monsterTemplateID = 900009,
							delay = 0,
							moveCast = true,
							corrdinate = {
								-15,
								0,
								55
							},
							bossData = {
								hpBarNum = 45,
								icon = "aidang"
							},
							phase = {
								{
									switchType = 1,
									switchTo = 1,
									index = 0,
									switchParam = 2,
									addWeapon = {
										950170,
										950171
									}
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 2,
									addWeapon = {
										950172,
										950177
									}
								},
								{
									switchType = 1,
									switchTo = 3,
									index = 2,
									switchParam = 0.5,
									removeWeapon = {
										950171
									}
								},
								{
									switchParam = 1,
									switchTo = 4,
									index = 3,
									switchType = 1,
									setAI = 90004,
									removeWeapon = {
										950177
									},
									addWeapon = {
										950173,
										950175
									}
								},
								{
									switchParam = 1.5,
									switchTo = 5,
									index = 4,
									switchType = 1,
									removeWeapon = {
										950175,
										950172
									},
									addWeapon = {
										950174,
										950176
									}
								},
								{
									switchParam = 1,
									switchTo = 6,
									index = 5,
									switchType = 1,
									setAI = 10001,
									removeWeapon = {
										950173
									}
								},
								{
									switchType = 1,
									switchTo = 7,
									index = 6,
									switchParam = 3,
									addWeapon = {
										950175
									}
								},
								{
									switchType = 1,
									switchTo = 0,
									index = 7,
									switchParam = 3,
									removeWeapon = {
										950175,
										950174
									}
								}
							}
						}
					}
				},
				{
					triggerType = 0,
					waveIndex = 202,
					conditionType = 1,
					preWaves = {
						201
					},
					triggerParams = {
						round = {
							more = 1
						}
					},
					spawn = {
						{
							monsterTemplateID = 900009,
							delay = 0,
							moveCast = true,
							corrdinate = {
								-15,
								0,
								55
							},
							buffList = {
								50412
							},
							bossData = {
								hpBarNum = 45,
								icon = "aidang"
							},
							phase = {
								{
									switchType = 1,
									switchTo = 1,
									index = 0,
									switchParam = 2,
									addWeapon = {
										950170,
										950171
									}
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 2,
									addWeapon = {
										950172,
										950177
									}
								},
								{
									switchType = 1,
									switchTo = 3,
									index = 2,
									switchParam = 0.5,
									removeWeapon = {
										950171
									}
								},
								{
									switchParam = 1,
									switchTo = 4,
									index = 3,
									switchType = 1,
									setAI = 90004,
									removeWeapon = {
										950177
									},
									addWeapon = {
										950173,
										950175
									}
								},
								{
									switchParam = 1.5,
									switchTo = 5,
									index = 4,
									switchType = 1,
									removeWeapon = {
										950175,
										950172
									},
									addWeapon = {
										950174,
										950176
									}
								},
								{
									switchParam = 1,
									switchTo = 6,
									index = 5,
									switchType = 1,
									setAI = 10001,
									removeWeapon = {
										950173
									}
								},
								{
									switchType = 1,
									switchTo = 7,
									index = 6,
									switchParam = 3,
									addWeapon = {
										950175
									}
								},
								{
									switchType = 1,
									switchTo = 0,
									index = 7,
									switchParam = 3,
									removeWeapon = {
										950175,
										950174
									}
								}
							}
						},
						{
							monsterTemplateID = 909013,
							score = 0,
							delay = 0,
							moveCast = true,
							corrdinate = {
								15,
								0,
								35
							},
							buffList = {
								50410
							}
						}
					}
				},
				{
					triggerType = 8,
					key = true,
					waveIndex = 900,
					preWaves = {
						202
					},
					triggerParams = {}
				}
			}
		}
	},
	fleet_prefab = {}
}
