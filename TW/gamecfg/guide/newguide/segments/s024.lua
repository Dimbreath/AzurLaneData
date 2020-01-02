return {
	id = "S024",
	events = {
		{
			alpha = 0.422,
			code = 2,
			style = {
				text = "指揮官請點擊<color=#ff7d36>出擊</color>",
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
				text = "這次我們的艦隊已經比較完善啦~一定可以擊破大黃蜂的！",
				mode = 2,
				dir = 1,
				posY = -200,
				posX = -190
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/top/LevelStageView(Clone)/bottom_stage/func_button",
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
				text = "可惡，又遭到了敵方艦隊的攔截！但是我們的<color=#ff7d36>總機動值已經提高</color>，輕而易舉的就能避開這種無謂的戰鬥",
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
				text = "點擊<color=#ff7d36>規避</color>輕鬆甩掉他們的攔截吧！",
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
