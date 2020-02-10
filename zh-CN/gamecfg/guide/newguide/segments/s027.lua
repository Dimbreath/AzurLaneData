return {
	id = "S027",
	events = {
		{
			alpha = 0.335,
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
				text = "敌方旗舰出现！点击目标继续前进！",
				mode = 2,
				dir = 1,
				posY = 218.62,
				posX = 20.04
			},
			ui = {
				scale = 1.8,
				pathIndex = -1,
				eventPath = "LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/quads/chapter_cell_quad_4_7",
				delay = 0.8,
				path = "/LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/cells/chapter_cell_4_7/attachment",
				pos = {
					x = 0,
					y = 2.4
				}
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
				text = "敌方旗舰出现！点击目标继续前进！",
				mode = 2,
				dir = 1,
				posY = 218.62,
				posX = 20.04
			},
			ui = {
				scale = 1.8,
				pathIndex = -1,
				eventPath = "LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/quads/chapter_cell_quad_4_7",
				delay = 0.2,
				path = "/LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/cells/chapter_cell_4_7/attachment",
				pos = {
					x = 0,
					y = 2.4
				}
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
