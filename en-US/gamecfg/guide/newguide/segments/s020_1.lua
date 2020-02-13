return {
	id = "S020_1",
	events = {
		{
			alpha = 0.375,
			style = {
				text = "Use your mission rewards to <color=#ff7d36>build a new ship</color>.",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/toTop/frame/bottomPanel/btm/buttons_container/buildButton",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -21.99,
					posX = 39.82
				}
			}
		},
		{
			alpha = 0.408,
			style = {
				text = "You've got enough resources! Tap <color=#ffde38>build</color> to get started.",
				mode = 1,
				dir = 1,
				posY = 0,
				posX = 205.91
			},
			ui = {
				pathIndex = -1,
				path = "UICamera/Canvas/UIMain/BuildShipUI(Clone)/bg/main/gallery/start_btn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -25.43,
					posX = 76.4
				}
			}
		},
		{
			alpha = 0.318,
			style = {
				text = "Now tap <color=#ff7d36>confirm</color> to build your new ship.",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/build_msg/window/btns/confirm_btn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -19.57,
					posX = 61.16
				}
			}
		}
	}
}
