return {
	id = 315000,
	map_id = 10001,
	bgm = "story-6",
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 180,
			backGroundStageID = 1,
			passCondition = 1,
			totalArea = {
				-70,
				20,
				90,
				70
			},
			playerArea = {
				-70,
				20,
				37,
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
					triggerType = 1,
					waveIndex = 202,
					preWaves = {},
					triggerParams = {
						timeout = 20
					}
				},
				{
					triggerType = 1,
					waveIndex = 203,
					preWaves = {},
					triggerParams = {
						timeout = 40
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 101,
					conditionType = 1,
					preWaves = {
						100
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 296002,
							score = 0,
							delay = 0,
							moveCast = true,
							corrdinate = {
								0,
								0,
								55
							},
							bossData = {
								hpBarNum = 100,
								icon = "sairenboss9"
							},
							buffList = {
								8050,
								8051
							},
							phase = {
								{
									switchParam = 5,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 10001,
									addWeapon = {
										2012300
									}
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 45,
									addWeapon = {
										2012340,
										2012350
									}
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 3,
									switchParam = 32
								},
								{
									switchType = 1,
									switchTo = 1,
									index = 3,
									switchParam = 40,
									setAI = 20006
								}
							}
						}
					},
					airFighter = {
						{
							interval = 12,
							onceNumber = 10,
							formation = 20001,
							templateID = 2030030,
							delay = 0,
							totalNumber = 60,
							weaponID = {
								1100759
							},
							attr = {
								airPower = 40,
								maxHP = 15,
								attackRating = 23
							}
						}
					}
				},
				{
					triggerType = 8,
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
