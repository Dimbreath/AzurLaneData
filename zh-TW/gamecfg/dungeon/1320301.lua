return {
	id = 1221201,
	bgm = "story-4",
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 60,
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
					waveIndex = 201,
					conditionType = 1,
					preWaves = {
						100
					},
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 13000301,
							score = 0,
							delay = 1,
							moveCast = true,
							corrdinate = {
								-15,
								0,
								55
							},
							buffList = {},
							bossData = {
								hpBarNum = 100,
								icon = "daiduo"
							},
							phase = {
								{
									switchType = 1,
									switchTo = 1,
									index = 0,
									switchParam = 1,
									removeWeapon = {}
								},
								{
									index = 11,
									switchType = 1,
									switchTo = 2,
									switchParam = 111114
								},
								{
									switchParam = 3.5,
									switchTo = 2,
									index = 1,
									switchType = 1,
									setAI = 10001,
									addWeapon = {
										618001,
										618002
									},
									removeWeapon = {}
								},
								{
									switchParam = 3,
									switchTo = 3,
									index = 2,
									switchType = 1,
									addWeapon = {
										618003,
										618004
									},
									removeWeapon = {
										618001,
										618002
									}
								},
								{
									switchParam = 1.5,
									switchTo = 4,
									index = 3,
									switchType = 1,
									setAI = 70077,
									addWeapon = {},
									removeWeapon = {}
								},
								{
									switchParam = 3,
									switchTo = 5,
									index = 4,
									switchType = 1,
									setAI = 70078,
									addWeapon = {
										618005,
										618006
									},
									removeWeapon = {
										618003,
										618004
									}
								},
								{
									switchParam = 1,
									switchTo = 6,
									index = 5,
									switchType = 1,
									addWeapon = {},
									removeWeapon = {
										618005
									}
								},
								{
									switchParam = 3.3,
									switchTo = 7,
									index = 6,
									switchType = 1,
									addWeapon = {
										618009
									},
									removeWeapon = {}
								},
								{
									switchParam = 8,
									switchTo = 8,
									index = 7,
									switchType = 1,
									addWeapon = {
										618007,
										618008
									},
									removeWeapon = {
										618006,
										618009
									}
								},
								{
									switchType = 1,
									switchTo = 0,
									index = 8,
									switchParam = 1,
									removeWeapon = {
										618007,
										618008
									}
								}
							}
						}
					}
				},
				{
					triggerType = 8,
					key = true,
					waveIndex = 900,
					preWaves = {
						201
					},
					triggerParams = {}
				}
			}
		}
	},
	fleet_prefab = {}
}
