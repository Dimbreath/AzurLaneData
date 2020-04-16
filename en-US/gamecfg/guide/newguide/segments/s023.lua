return {
	id = "S023",
	events = {
		{
			alpha = 0.434,
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
					posY = -31.8,
					posX = 6.83
				}
			}
		},
		{
			alpha = 0.405,
			style = {
				text = "Our fleet is even more perfect now~! We can definitely take down Hornet! Beat her and you'll finish the drill! You can do it!",
				mode = 2,
				dir = 1,
				posY = -200,
				posX = -190
			}
		},
		{
			alpha = 0.163,
			style = {
				text = "We've located Hornet! Let's move towards the target.",
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
					x = 392.1,
					y = 66.8
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
