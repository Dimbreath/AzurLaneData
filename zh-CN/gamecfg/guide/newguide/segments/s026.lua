return {
	id = "S026",
	events = {
		{
			alpha = 0.491,
			code = 2,
			style = {
				text = "指挥官请点击<color=#ff7d36>出击</color>",
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
				text = "这次我们的舰队已经比较完善啦~一定可以击破大黄蜂的！",
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
				text = "点击<color=#ff7d36>出击</color>进行战斗！",
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
