return {
	id = "S028",
	events = {
		{
			alpha = 0.454,
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
					posY = -19.7,
					posX = 88.9
				}
			},
			code = {
				2
			}
		},
		{
			alpha = 0.211,
			style = {
				text = "Enemy flagship ahead! Tap the target to continue moving!",
				mode = 2,
				dir = 1,
				posY = 171.89,
				posX = 32.25
			},
			baseui = {
				pathIndex = -1,
				path = "LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/quads/chapter_cell_quad_4_7"
			},
			ui = {
				eventPath = "LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/quads/chapter_cell_quad_4_7",
				delay = 0.8,
				pathIndex = -1,
				scale = 1.8,
				path = "/LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/cells/chapter_cell_4_7/attachment",
				pos = {
					x = 0,
					y = -4.4
				},
				triggerType = {
					1
				},
				fingerPos = {
					posY = -20,
					posX = 50
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
				path = "/OverlayCamera/Overlay/UIMain/ChapterPreCombatUI(Clone)/right/start",
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
