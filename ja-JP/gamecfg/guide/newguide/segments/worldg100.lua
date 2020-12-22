return {
	id = "WorldG100",
	events = {
		{
			alpha = 0,
			code = {
				"FocusOnFleet"
			},
			notifies = {
				{
					notify = "world focus edge",
					body = {
						stayTime = 0.1,
						line = {
							row = 5,
							column = 0
						}
					}
				}
			}
		},
		{
			delay = 0.5,
			alpha = 0.3,
			code = {
				"ShowClickArea"
			},
			style = {
				text = "エリアを確保すると、マップ外のマスをタップすることでエリア移動モードに切り替えられます",
				mode = 2,
				dir = -1,
				char = "1",
				posY = -160,
				posX = -460
			},
			showSign = {
				type = 2,
				signList = {
					{
						signType = 4,
						pos = {
							-550,
							150,
							0
						}
					}
				},
				clickArea = {
					300,
					200
				}
			}
		},
		{
			alpha = 0,
			code = {
				"openOverview"
			},
			notifies = {
				{
					notify = "world open transport pos",
					body = {
						mapIds = {
							13
						}
					}
				}
			}
		},
		{
			delay = 2,
			alpha = 0,
			code = {
				"Tips"
			},
			style = {
				text = "エリアを確保する度に、探索できるエリアが増えます。今はストーリーを進められるます。",
				mode = 2,
				dir = -1,
				char = "1",
				posY = -150,
				posX = 100
			}
		},
		{
			alpha = 0,
			notifies = {
				{
					notify = "story update",
					body = {
						storyId = "WorldG100"
					}
				}
			}
		}
	}
}
