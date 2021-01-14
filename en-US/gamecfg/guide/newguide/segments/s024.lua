return {
	id = "S024",
	events = {
		{
			alpha = 0.422,
			code = 2,
			style = {
				text = "Commander, please Tap <color=#ff7d36>Attack</color>",
				mode = 2,
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
					posY = -18.1,
					posX = 68.35
				}
			}
		},
		{
			code = 2,
			waitScene = "LevelScene",
			alpha = 0.277,
			style = {
				text = "Our fleet is even more perfect now~! We can definitely take down Hornet!",
				mode = 2,
				dir = 1,
				posY = -200,
				posX = -190
			},
			ui = {
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/top/LevelStageView(Clone)/bottom_stage/normal/func_button",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -29.71,
					posX = 25.08
				}
			}
		},
		{
			alpha = 0.297,
			code = 1,
			baseui = {
				path = "OverlayCamera/Overlay/UIMain/top/LevelAmbushView(Clone)/window/dodge_button"
			},
			style = {
				text = "Damn, we've been stopped by enemy ships again. Our <color=#ff7d36>total Evasion has improved</color> though, so we can just skirt around unnecessary battles like this one.",
				mode = 2,
				dir = 1,
				posY = -304,
				posX = -190
			}
		},
		{
			alpha = 0.297,
			code = 1,
			style = {
				text = "Tap <color=#ff7d36>evade</color> to avoid interception!",
				mode = 2,
				dir = 1,
				posY = 167.08,
				posX = 23.41
			}
		},
		{
			alpha = 0.303,
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/top/LevelAmbushView(Clone)/window/dodge_button",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -23.85,
					posX = 23.79
				}
			}
		}
	}
}
