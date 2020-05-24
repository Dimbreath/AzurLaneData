return {
	id = "S025",
	events = {
		{
			alpha = 0.434,
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
					posY = -31.8,
					posX = 6.83
				}
			}
		},
		{
			alpha = 0.405,
			style = {
				text = "這次我們的艦隊已經比較完善啦~一定可以擊破大黃蜂的！擊破她的話就可以獲得演習的勝利了！快上吧",
				mode = 1,
				dir = 1,
				posY = -200,
				posX = -190
			}
		},
		{
			alpha = 0.163,
			style = {
				text = "點擊目標繼續前進吧！",
				mode = 2,
				dir = 1,
				posY = 191.53,
				posX = 26.6
			},
			ui = {
				eventPath = "/LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/quads/chapter_cell_quad_4_6",
				isLevelPoint = true,
				pathIndex = -1,
				scale = 1.8,
				path = "/LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/cells/chapter_cell_4_6/attachment",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -18.48,
					posX = 73.89
				}
			}
		}
	}
}
