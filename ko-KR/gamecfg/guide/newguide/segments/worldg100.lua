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
				text = "현재 해역 확보 완료 후, 해역 지도 외 구역을 터치하여 구역 이동 모드 진입 가능",
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
				text = "한 해역 확보 성공 시마다, 주변의 탐색 가능 해역이 증가합니다. 현재 메인 임무 표시가 있는 해역으로 이동할 수 있습니다!",
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
