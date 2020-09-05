return {
	id = 5007,
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
							reinforceDelay = 3,
							delay = 0,
							moveCast = true,
							monsterTemplateID = 724,
							corrdinate = {
								-10,
								0,
								75
							},
							bossData = {
								hpBarNum = 75,
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
									switchParam = 0.3
								},
								{
									switchType = 2,
									switchTo = 2,
									index = 1,
									switchParam = 0.5,
									addBuff = {
										8515
									}
								},
								{
									index = 2,
									removeBuff = {
										8515
									}
								}
							}
						},
						{
							score = 0,
							reinforceDelay = 3,
							delay = 0,
							moveCast = true,
							monsterTemplateID = 725,
							corrdinate = {
								-10,
								0,
								35
							},
							bossData = {
								hpBarNum = 75,
								icon = "guying"
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
								30,
								0,
								75
							},
							buffList = {
								8001,
								8002
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
								55
							},
							buffList = {
								8001,
								8002
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
								35
							},
							buffList = {
								8001,
								8002
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
