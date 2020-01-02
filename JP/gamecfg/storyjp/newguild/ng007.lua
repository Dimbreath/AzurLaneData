return {
	id = "NG007",
	type = 2,
	events = {
		{
			action = {
				say = {
					text = "手に入れるネコハコは「訓練」で中身を取り出せるにゃ！",
					style = {
						posY = 172,
						mode = 1,
						alpha = 0.4,
						dir = -1,
						posX = -337
					}
				},
				ui = {
					customSize = true,
					scale = 0.667,
					path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/main/right_panel/commanders/box/boxes_btn"
				}
			}
		},
		{
			action = {
				say = {
					text = "訓練枠を選んでね！",
					style = {
						posY = -100,
						mode = 1,
						alpha = 0.4,
						dir = -1,
						posX = 250
					}
				},
				ui = {
					customSize = true,
					scale = 0.667,
					path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/box_panel/frame/boxes/mask/content/frame/idle/consume/start_btn"
				}
			}
		},
		{
			action = {
				ui = {
					path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/box_panel/buildpool_panel/frame/bg/content/list/2",
					triggerType = {
						2
					}
				}
			}
		},
		{
			action = {
				ui = {
					customSize = true,
					scale = 0.667,
					path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/box_panel/buildpool_panel/frame/bg/confirm_btn"
				}
			}
		},
		{
			finish = true,
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/box_msg_panel/frame/confirm_btn"
				}
			}
		},
		{
			action = {
				ui = {
					customSize = true,
					scale = 0.667,
					path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/box_panel/frame/close_btn"
				}
			}
		}
	}
}
