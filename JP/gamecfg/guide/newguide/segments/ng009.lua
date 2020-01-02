return {
	id = "NG009",
	events = {
		{
			style = {
				text = "ここをタップするとオフニャのスキルとアビリティを確認できるわ！",
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
				text = "ここをタップするとオフニャの強化効果を確認できるわ！",
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
				text = "オフニャは「強化」「アビリティ」などで育成できるわ！",
				mode = 1,
				dir = 1,
				posY = -110,
				posX = -500
			}
		},
		{
			style = {
				text = "わからないことがあったら、ヘルプで確認してね！~",
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
