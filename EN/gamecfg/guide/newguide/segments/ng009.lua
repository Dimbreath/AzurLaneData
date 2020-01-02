return {
	id = "NG009",
	events = {
		{
			style = {
				text = "Tap here to view the Meowfficer's Skills and Talents!",
				mode = 1,
				dir = -1,
				posY = -200,
				posX = 200
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/blur_panel/main/CommanderDetailUI(Clone)/info/skill_btn",
				triggerType = {
					2
				}
			}
		},
		{
			style = {
				text = "Tap here to view the stat bonuses received from the Meowfficer!",
				mode = 1,
				dir = -1,
				posY = -200,
				posX = 100
			},
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/blur_panel/main/CommanderDetailUI(Clone)/info/addition_btn",
				triggerType = {
					2
				}
			}
		},
		{
			style = {
				text = "You can make the Meowfficer better by Enhancing them and leveling their Talents!",
				mode = 1,
				dir = 1,
				posY = -110,
				posX = -500
			}
		},
		{
			style = {
				text = "If you want some more info, just tap the Help button!",
				mode = 1,
				dir = -1,
				posY = -200,
				posX = -500
			},
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/blur_panel/main/left_panel/help_btn",
				fingerPos = {
					posY = -45,
					posX = 45
				}
			}
		}
	}
}
