return {
	id = 5008,
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 1800,
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
			mainUnitPosition = {
				{
					Vector3(-105, 0, 58),
					Vector3(-105, 0, 78),
					Vector3(-105, 0, 38)
				},
				[-1] = {
					Vector3(15, 0, 58),
					Vector3(15, 0, 78),
					Vector3(15, 0, 38)
				}
			},
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
					waveIndex = 101,
					conditionType = 0,
					preWaves = {
						100
					},
					triggerParam = {},
					spawn = {
						{
							score = 0,
							reinforceDelay = 4,
							delay = 0,
							moveCast = true,
							monsterTemplateID = 727,
							corrdinate = {
								-10,
								0,
								75
							},
							bossData = {
								hpBarNum = 80,
								icon = "jiagu"
							},
							buffList = {
								8508
							},
							phase = {
								{
									index = 0,
									switchType = 2,
									switchTo = 1,
									switchParam = 0.4
								},
								{
									index = 1,
									addBuff = {
										8501
									}
								}
							}
						},
						{
							monsterTemplateID = 728,
							delay = 0,
							moveCast = true,
							score = 0,
							reinforceDelay = 4,
							corrdinate = {
								10,
								0,
								55
							},
							bossData = {
								hpBarNum = 80,
								icon = "guying"
							},
							buffList = {
								8516
							}
						},
						{
							score = 0,
							reinforceDelay = 4,
							delay = 0,
							moveCast = true,
							monsterTemplateID = 729,
							corrdinate = {
								-10,
								0,
								35
							},
							bossData = {
								hpBarNum = 80,
								icon = "guying"
							},
							buffList = {
								8505
							},
							phase = {
								{
									index = 0,
									switchType = 2,
									switchTo = 1,
									switchParam = 0.4
								},
								{
									index = 1,
									removeWeapon = {
										700047
									},
									addWeapon = {
										700049
									}
								}
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 726,
							score = 0,
							delay = 0,
							moveCast = true,
							corrdinate = {
								20,
								0,
								75
							},
							buffList = {
								8001,
								8002,
								8517
							}
						},
						{
							monsterTemplateID = 726,
							score = 0,
							delay = 0,
							moveCast = true,
							corrdinate = {
								30,
								0,
								65
							},
							buffList = {
								8001,
								8002,
								8517
							}
						},
						{
							monsterTemplateID = 726,
							score = 0,
							delay = 0,
							moveCast = true,
							corrdinate = {
								30,
								0,
								45
							},
							buffList = {
								8001,
								8002,
								8517
							}
						},
						{
							monsterTemplateID = 726,
							score = 0,
							delay = 0,
							moveCast = true,
							corrdinate = {
								20,
								0,
								35
							},
							buffList = {
								8001,
								8002,
								8517
							}
						}
					}
				},
				{
					triggerType = 8,
					key = true,
					waveIndex = 900,
					preWaves = {
						101
					},
					triggerParams = {}
				}
			}
		}
	},
	fleet_prefab = {}
}
