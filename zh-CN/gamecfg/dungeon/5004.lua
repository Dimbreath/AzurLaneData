return {
	id = 5004,
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
							monsterTemplateID = 710,
							score = 0,
							delay = 0,
							moveCast = true,
							reinforceDelay = 5,
							corrdinate = {
								-5,
								0,
								55
							},
							bossData = {
								hpBarNum = 60,
								icon = "awuwei"
							},
							phase = {
								{
									index = 0,
									switchType = 2,
									switchTo = 1,
									switchParam = 0.5
								},
								{
									index = 1,
									addBuff = {
										8507
									}
								}
							}
						},
						{
							monsterTemplateID = 713,
							score = 0,
							delay = 0,
							moveCast = true,
							corrdinate = {
								0,
								0,
								80
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 711,
							score = 0,
							delay = 0,
							moveCast = true,
							corrdinate = {
								-15,
								0,
								65
							},
							buffList = {
								8033,
								8034
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
									removeBuff = {
										8033,
										8034
									}
								}
							}
						},
						{
							monsterTemplateID = 712,
							score = 0,
							delay = 0,
							moveCast = true,
							corrdinate = {
								-15,
								0,
								45
							},
							buffList = {
								8033,
								8034
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
									removeBuff = {
										8033,
										8034
									}
								}
							}
						},
						{
							monsterTemplateID = 713,
							score = 0,
							delay = 0,
							moveCast = true,
							corrdinate = {
								0,
								0,
								30
							},
							buffList = {
								8001,
								8007
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 714,
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
