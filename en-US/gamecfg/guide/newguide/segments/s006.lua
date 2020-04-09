return {
	id = "S006",
	events = {
		{
			alpha = 0.434,
			code = 2,
			style = {
				text = "Our next mission is to support the Eagles' aviation fleet combat drills. Tap <color=#ff7d36>Attack</color> to get started.",
				mode = 2,
				dir = 1,
				posY = 61.61,
				posX = 261.62
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
				text = "Hornet must be hiding somewhere here. If you can crush her then the sea is yours!",
				mode = 2,
				dir = 1,
				posY = -351,
				posX = -257
			}
		},
		{
			alpha = 0.384,
			style = {
				text = "Commander, we must first test your skills in defeating the enemy vanguard.",
				mode = 2,
				dir = 1,
				posY = -351,
				posX = -257
			},
			baseui = {
				delay = 0.2,
				pathIndex = 0,
				path = "LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/cells/chapter_cell_4_6/attachment"
			}
		},
		{
			alpha = 0.163,
			style = {
				text = "We've located Hornet! Let's move towards the target.~",
				mode = 2,
				dir = 1,
				posY = -351,
				posX = -257
			},
			ui = {
				scale = 1.8,
				eventPath = "/LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/quads/chapter_cell_quad_4_6",
				delay = 1,
				pathIndex = -1,
				path = "/LevelCamera/Canvas/UIMain/LevelGrid/DragLayer/plane/cells/chapter_cell_4_6/attachment",
				pos = {
					x = 828.3,
					y = 69.2
				},
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
