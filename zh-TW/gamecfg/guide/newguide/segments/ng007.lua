return {
	id = "NG007",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "再來通過“訓練”開始對小貓進行培養！",
				mode = 1,
				dir = 1,
				posY = -110,
				posX = 0
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/blur_panel/main/right_panel/commanders/box/boxes_btn",
				fingerPos = {
					posY = -60,
					posX = 45
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "選擇一個訓練位置！",
				mode = 1,
				dir = 1,
				posY = -110,
				posX = 0
			},
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/CommanderBoxesUI(Clone)/frame/boxes/start_btn"
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "最多可以一口氣選擇<color=#A9F548>10</color>個想要訓練的喵箱，不過同時只會有<color=#A9F548>4</color>個進行訓練！這次就先選擇1個吧！",
				mode = 1,
				dir = 1,
				posY = -110,
				posX = 0
			}
		},
		{
			ui = {
				customSize = true,
				scale = 1,
				path = "/OverlayCamera/Overlay/UIMain/CommanderBoxesUI(Clone)/buildpool_panel/frame/bg/content/list/2/icon",
				triggerType = {
					3
				}
			}
		},
		{
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/CommanderBoxesUI(Clone)/buildpool_panel/frame/bg/start_btn"
			}
		},
		{
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/CommanderMsgBoxUI(Clone)/frame/confirm_btn"
			}
		},
		{
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/CommanderBoxesUI(Clone)/frame/close_btn"
			}
		}
	}
}
