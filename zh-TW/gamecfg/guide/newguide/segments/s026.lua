return {
	id = "S026",
	events = {
		{
			alpha = 0.491,
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
					posY = 0,
					posX = 0
				}
			}
		},
		{
			waitScene = "LevelScene",
			alpha = 0.406,
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
			alpha = 0.409,
			style = {
				text = "點擊<color=#ff7d36>出擊</color>進行戰鬥！",
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
