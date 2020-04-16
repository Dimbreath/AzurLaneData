return {
	id = "S023",
	events = {
		{
			alpha = 0.434,
			code = 2,
			style = {
				text = "한 번 더 <color=#ff7d36>출격</color>하자!",
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
				text = "이 정도의 함대라면 분명 호넷을 쓰러뜨릴 수 있어!",
				mode = 2,
				dir = 1,
				posY = -200,
				posX = -190
			}
		},
		{
			alpha = 0.163,
			style = {
				text = "호넷이 나타난 위치를 알아냈어! 목표 지점까지 전속 전진이야!",
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
					x = 829,
					y = 65
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
