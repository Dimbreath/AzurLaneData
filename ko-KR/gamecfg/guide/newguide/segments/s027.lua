return {
	id = "S027",
	events = {
		{
			alpha = 0.335,
			style = {
				text = "한 번 더<color=#ff7d36>출격</color>하자!",
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
					posY = -32.7,
					posX = 85.86
				}
			},
			code = {
				2
			}
		},
		{
			alpha = 0.362,
			code = {
				2
			},
			style = {
				text = "적 중요 함대 발견! 목표지점을 눌러!",
				mode = 2,
				dir = 1,
				posY = 218.62,
				posX = 20.04
			},
			ui = {
				pathIndex = -1,
				eventPath = "LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/quads/chapter_cell_quad_4_7",
				isLevelPoint = true,
				delay = 0.8,
				scale = 1.8,
				path = "/LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/cells/chapter_cell_4_7/attachment"
			},
			baseui = {
				pathIndex = -1,
				delay = 1,
				path = "LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/quads/chapter_cell_quad_4_7",
				pos = {
					x = 348.5,
					y = 45.52
				},
				triggerType = {
					1
				},
				fingerPos = {
					posY = 0,
					posX = 130.09
				}
			}
		},
		{
			alpha = 0.362,
			code = {
				1,
				4
			},
			style = {
				text = "적 중요 함대 발견! 목표지점을 눌러!",
				mode = 2,
				dir = 1,
				posY = 218.62,
				posX = 20.04
			},
			ui = {
				pathIndex = -1,
				eventPath = "LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/quads/chapter_cell_quad_4_7",
				isLevelPoint = true,
				delay = 0.2,
				scale = 1.8,
				path = "/LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/cells/chapter_cell_4_7/attachment"
			},
			baseui = {
				pathIndex = -1,
				delay = 1,
				path = "LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/quads/chapter_cell_quad_4_7",
				pos = {
					x = 348.5,
					y = 45.52
				},
				triggerType = {
					1
				},
				fingerPos = {
					posY = 0,
					posX = 130.09
				}
			}
		}
	}
}
