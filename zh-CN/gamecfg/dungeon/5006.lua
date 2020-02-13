return {
	id = 5006,
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
							reinforceDelay = 5,
							delay = 0,
							moveCast = true,
							monsterTemplateID = 720,
							corrdinate = {
								15,
								0,
								55
							},
							bossData = {
								hpBarNum = 70,
								icon = "canglong"
							},
							buffList = {
								8505
							},
							phase = {
								{
									index = 0,
									switchType = 1,
									switchTo = 1,
									switchParam = 20
								},
								{
									switchParam = 10,
									switchTo = 2,
									index = 1,
									switchType = 1,
									removeWeapon = {
										700034,
										700035,
										700036
									},
									addWeapon = {
										700038,
										700039,
										700040
									}
								},
								{
									index = 2,
									removeWeapon = {
										700037
									},
									addWeapon = {
										700041
									}
								}
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 721,
							score = 0,
							delay = 0,
							moveCast = true,
							corrdinate = {
								-15,
								0,
								55
							},
							buffList = {
								8508
							}
						},
						{
							monsterTemplateID = 722,
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
								8007,
								8514
							}
						},
						{
							monsterTemplateID = 723,
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
								8007,
								8514
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
