return {
	id = "S008",
	events = {
		{
			alpha = 0.491,
			code = 2,
			style = {
				text = "Our next mission is to support the Eagles' aviation fleet combat drills. Tap <color=#ff7d36>Attack</color> to get started.",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
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
			}
		},
		{
			alpha = 0.406,
			style = {
				text = "We've located Hornet! Let's move towards the target.",
				mode = 2,
				dir = 1,
				posY = -351,
				posX = -257
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/top/LevelStageView(Clone)/bottom_stage/func_button",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -21.55,
					posX = 31.24
				}
			},
			code = {
				2,
				4
			}
		},
		{
			alpha = 0.346,
			code = 1,
			style = {
				text = "Oh no! Evasion failed. We have to meet them head on!",
				mode = 2,
				dir = 1,
				posY = -295,
				posX = -297
			}
		},
		{
			alpha = 0.361,
			code = 1,
			style = {
				text = "<color=#ff7d36>Your fleet's total evasion</color> will determine whether or not you can evade enemies successfully or not.",
				mode = 2,
				dir = 1,
				posY = -295,
				posX = -297
			}
		},
		{
			alpha = 0.409,
			style = {
				text = "Tap <color=#ff7d36>Battle</color> to start battle! You have to <color=#ff7d36>spend oil</color> in order to launch attacks. Each ship uses different amounts of oil.",
				mode = 2,
				dir = 1,
				posY = -68.93,
				posX = 241.87
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/ChapterPreCombatUI(Clone)/right/start",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -30.21,
					posX = 116.3
				}
			}
		}
	}
}
