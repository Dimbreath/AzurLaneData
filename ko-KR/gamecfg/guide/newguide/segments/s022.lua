return {
	id = "S022",
	events = {
		{
			alpha = 0.276,
			style = {
				text = "아앗! 작전 실패... 확인 버튼을 눌러 돌아가자...",
				mode = 1,
				dir = 1,
				posY = 147.8,
				posX = 328.7
			},
			ui = {
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -28.32,
					posX = 43.74
				}
			},
			code = {
				4
			}
		},
		{
			alpha = 0.276,
			style = {
				text = "한 번 더 <color=#ffde38>출격</color>하자!",
				mode = 1,
				dir = 1,
				posY = -42,
				posX = 243
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/toTop/frame/rightPanel/eventPanel/combatBtn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = 0,
					posX = 0
				}
			},
			code = {
				1,
				2
			}
		},
		{
			alpha = 0.34,
			style = {
				text = "<color=#ff7d36>근해 연습</color>에 다시 도전해보자!",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				delay = 1.8,
				path = "UICamera/Canvas/UIMain/LevelMainScene(Clone)/float/levels/items/Chapter_101/main",
				childAdjust = {
					{
						"circle",
						"scale",
						{
							1,
							1,
							1
						}
					},
					{
						"info/bk",
						"position",
						{
							0,
							0,
							0
						}
					}
				},
				triggerType = {
					1
				},
				fingerPos = {
					posY = -30.85,
					posX = 176.13
				}
			}
		},
		{
			alpha = 0.513,
			ui = {
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/LevelStageInfoView(Clone)/panel/start_button",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -22.41,
					posX = 87.2
				}
			}
		},
		{
			alpha = 0.435,
			style = {
				text = "<color=#ff7d36>출격</color>으로 색적 개시!",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/LevelFleetSelectView(Clone)/panel/start_button",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -21.92,
					posX = 21.65
				}
			}
		}
	}
}
