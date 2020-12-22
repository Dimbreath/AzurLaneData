return {
	id = "WorldG021",
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
						stayTime = 0.1
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
				text = "マップ外の空間をタップすると、「エリア移動モード」に切り替えられます。",
				mode = 2,
				dir = -1,
				char = "1",
				posY = -160,
				posX = 450
			},
			showSign = {
				type = 2,
				signList = {
					{
						signType = 4,
						pos = {
							450,
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
				"ShowClickArea2"
			},
			style = {
				text = "海域マップでエリアを選択して移動できるます。「海域進入」をタップすると、艦隊をエリアに移動できます。",
				mode = 2,
				dir = -1,
				char = "1",
				posY = -300,
				posX = 200
			},
			showSign = {
				type = 2,
				signList = {
					{
						signType = 4,
						pos = {
							-240,
							-360,
							0
						}
					}
				},
				clickArea = {
					200,
					200
				}
			}
		},
		{
			delay = 2,
			alpha = 0,
			code = {
				"selectMap"
			},
			notifies = {
				{
					notify = "world select model map",
					body = {
						mapId = 44
					}
				}
			}
		},
		{
			alpha = 0.3,
			code = {
				"intraduce"
			},
			style = {
				text = "赤く表示されているのはストーリーを進行できるエリアです。エリアを確保して、ストーリーを進めましょう。",
				mode = 2,
				dir = -1,
				char = "1",
				posY = 0,
				posX = 300
			}
		},
		{
			alpha = 0,
			notifies = {
				{
					notify = "story update",
					body = {
						storyId = "WorldG021"
					}
				}
			}
		}
	}
}
