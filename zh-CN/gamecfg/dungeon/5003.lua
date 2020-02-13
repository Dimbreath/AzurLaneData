return {
	id = 5003,
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
							monsterTemplateID = 707,
							corrdinate = {
								0,
								0,
								55
							},
							bossData = {
								hpBarNum = 60,
								icon = "birui"
							},
							buffList = {
								8505
							},
							phase = {
								{
									index = 0,
									switchType = 2,
									switchTo = 1,
									switchParam = 0.6
								},
								{
									switchParam = 3,
									switchType = 1,
									switchTo = 2,
									index = 1,
									addBuff = {
										8506
									}
								},
								{
									switchParam = 10,
									switchType = 1,
									switchTo = 1,
									index = 2,
									removeBuff = {
										8506
									}
								}
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 708,
							score = 0,
							delay = 0,
							moveCast = true,
							corrdinate = {
								-10,
								0,
								75
							}
						},
						{
							monsterTemplateID = 709,
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
							monsterTemplateID = 709,
							score = 0,
							delay = 0,
							moveCast = true,
							corrdinate = {
								-5,
								0,
								65
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 709,
							score = 0,
							delay = 0,
							moveCast = true,
							corrdinate = {
								-5,
								0,
								45
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 709,
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
