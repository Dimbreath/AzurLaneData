return {
	id = "S011",
	events = {
		{
			alpha = 0.325,
			style = {
				text = "<color=#ff7d36>임무 정보</color>를 확인하자.",
				mode = 2,
				dir = 1,
				posY = -123,
				posX = 87.7
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/toTop/frame/bottomPanel/btm/buttons_container/taskButton",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -21.7,
					posX = 36.96
				}
			}
		},
		{
			alpha = 0.375,
			waitScene = "TaskScene",
			ui = {
				pathIndex = -1,
				path = "/UICamera/Canvas/UIMain/TaskScene(Clone)/blur_panel/adapt/left_length/frame/tagRoot/scenario",
				triggerType = {
					2
				},
				fingerPos = {
					posY = -50,
					posX = 40
				}
			}
		},
		{
			alpha = 0.375,
			waitScene = "TaskScene",
			style = {
				text = "<color=#ff7d36>임무 보상</color>은 이쪽에서 받을 수 있어.",
				mode = 2,
				dir = 1,
				posY = 183,
				posX = 474
			},
			ui = {
				pathIndex = -1,
				delay = 1,
				path = "/UICamera/Canvas/UIMain/TaskScene(Clone)/taskBGCenter/right_panel/content/0/frame/get_btn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -22.71,
					posX = 25.91
				}
			}
		}
	}
}
