return {
	id = 5024,
	bgm = "battle-boss-tiancheng",
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
							monsterTemplateID = 900016,
							delay = 0,
							moveCast = true,
							corrdinate = {
								0,
								0,
								55
							},
							bossData = {
								hpBarNum = 50,
								icon = "changmen"
							},
							phase = {
								{
									switchParam = 2,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 10001,
									addWeapon = {
										950269,
										950260
									}
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 2,
									addWeapon = {
										950261
									}
								},
								{
									switchType = 1,
									switchTo = 3,
									index = 2,
									switchParam = 0.5,
									removeWeapon = {
										950261,
										950260
									}
								},
								{
									switchType = 1,
									switchTo = 4,
									index = 3,
									switchParam = 1,
									addWeapon = {
										950262,
										950263,
										950264
									}
								},
								{
									switchParam = 4.5,
									switchTo = 6,
									index = 4,
									switchType = 1,
									setAI = 90029,
									removeWeapon = {
										950262,
										950263,
										950264
									}
								},
								{
									switchParam = 2,
									switchTo = 7,
									index = 6,
									switchType = 1,
									addWeapon = {
										950113,
										950119
									},
									removeWeapon = {
										950263,
										950264
									}
								},
								{
									switchType = 1,
									switchTo = 8,
									index = 7,
									switchParam = 5,
									removeWeapon = {
										950113,
										950119,
										950121
									}
								},
								{
									switchType = 1,
									switchTo = 9,
									index = 8,
									switchParam = 4,
									addWeapon = {
										950265
									}
								},
								{
									switchType = 1,
									switchTo = 10,
									index = 9,
									switchParam = 1,
									removeWeapon = {
										950265
									}
								},
								{
									switchParam = 1,
									switchTo = 11,
									index = 10,
									switchType = 1,
									setAI = 90029,
									addWeapon = {
										950266,
										950267,
										950268
									}
								},
								{
									switchParam = 7,
									switchTo = 114,
									index = 11,
									switchType = 1,
									removeWeapon = {
										950266,
										950267,
										950268
									},
									addWeapon = {
										950262,
										950263,
										950264
									}
								},
								{
									switchParam = 1,
									switchTo = 1,
									index = 114,
									switchType = 1,
									setAI = 10001,
									removeWeapon = {
										950262,
										950263,
										950264
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
							monsterTemplateID = 900016,
							reinforceDelay = 6,
							delay = 0,
							moveCast = true,
							corrdinate = {
								0,
								0,
								55
							},
							bossData = {
								hpBarNum = 50,
								icon = "changmen"
							},
							phase = {
								{
									switchParam = 2,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 10001,
									addWeapon = {
										950269,
										950260
									}
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 2,
									addWeapon = {
										950261
									}
								},
								{
									switchType = 1,
									switchTo = 3,
									index = 2,
									switchParam = 0.5,
									removeWeapon = {
										950261,
										950260
									}
								},
								{
									switchType = 1,
									switchTo = 4,
									index = 3,
									switchParam = 1,
									addWeapon = {
										950262,
										950263,
										950264
									}
								},
								{
									switchParam = 4.5,
									switchTo = 6,
									index = 4,
									switchType = 1,
									setAI = 90029,
									removeWeapon = {
										950262,
										950263,
										950264
									}
								},
								{
									switchParam = 2,
									switchTo = 7,
									index = 6,
									switchType = 1,
									addWeapon = {
										950113,
										950119
									},
									removeWeapon = {
										950263,
										950264
									}
								},
								{
									switchType = 1,
									switchTo = 8,
									index = 7,
									switchParam = 5,
									removeWeapon = {
										950113,
										950119,
										950121
									}
								},
								{
									switchType = 1,
									switchTo = 9,
									index = 8,
									switchParam = 4,
									addWeapon = {
										950265
									}
								},
								{
									switchType = 1,
									switchTo = 10,
									index = 9,
									switchParam = 1,
									removeWeapon = {
										950265
									}
								},
								{
									switchParam = 1,
									switchTo = 11,
									index = 10,
									switchType = 1,
									setAI = 90029,
									addWeapon = {
										950266,
										950267,
										950268
									}
								},
								{
									switchParam = 7,
									switchTo = 114,
									index = 11,
									switchType = 1,
									removeWeapon = {
										950266,
										950267,
										950268
									},
									addWeapon = {
										950262,
										950263,
										950264
									}
								},
								{
									switchParam = 1,
									switchTo = 1,
									index = 114,
									switchType = 1,
									setAI = 10001,
									removeWeapon = {
										950262,
										950263,
										950264
									}
								}
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 909004,
							delay = 0,
							moveCast = true,
							corrdinate = {
								30,
								0,
								35
							}
						},
						{
							monsterTemplateID = 909004,
							delay = 0,
							moveCast = true,
							corrdinate = {
								30,
								0,
								75
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
