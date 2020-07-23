return {
	id = "S005",
	events = {
		{
			alpha = 0.276,
			style = {
				text = "Ah, you were defeated! Tap confirm to exit the stage.",
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
				text = "Our next mission is to support the Eagles' aviation fleet combat drills. Tap <color=#ffde38>Attack</color> to get started.",
				mode = 1,
				dir = 1,
				posY = -50,
				posX = 250
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/toTop/frame/rightPanel/eventPanel/combatBtn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -28.32,
					posX = 43.74
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
				text = "Select the <color=#ff7d36>Offshore Exercises</color> stage.",
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
			style = {
				text = "This is where you'll see various details about the stage.",
				mode = 2,
				dir = 1,
				posY = -410,
				posX = -446
			},
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
				text = "Tap <color=#ff7d36>go</color> to start searching for the enemy!",
				mode = 2,
				dir = 1,
				posY = -164,
				posX = 270
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
