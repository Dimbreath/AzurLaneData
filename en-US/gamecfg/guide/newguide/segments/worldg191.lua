return {
	id = "WorldG191",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "You can now play Ashes Showdown, a mode where you fight Ashes ships together with other commanders!",
				mode = 2,
				dir = 1,
				char = "1",
				posY = -279.2,
				posX = 498.7
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/top/adapt/bottom_chapter/button/btn_boss",
				triggerType = {
					1
				},
				fingerPos = {
					rotateY = 0,
					posY = -42,
					rotateX = 0,
					rotateZ = 0,
					posX = 128.2
				}
			}
		},
		{
			delay = 1,
			code = {
				"playStory"
			},
			stories = {
				"GWORLD109A"
			}
		},
		{
			alpha = 0.4,
			waitScene = "WorldBossScene",
			style = {
				text = "Ashes Showdown is not always open! This run of it will be available for a limited time, shown here!",
				mode = 2,
				dir = 1,
				char = "1",
				posY = 294,
				posX = -448.3,
				ui = {
					path = "UICamera/Canvas/UIMain/WorldBossUI(Clone)/pages/WorldBossEmptyUI(Clone)/time/Text"
				}
			}
		},
		{
			style = {
				text = "Be aware that once this run of Ashes Showdown ends, any Ashes Coordinates you used will not be refunded, and you won’t be able to gain new Coordinates in Operation Siren either.",
				mode = 2,
				dir = 1,
				char = "1",
				posY = 1.5,
				posX = -402.4,
				ui = {
					path = "UICamera/Canvas/UIMain/WorldBossUI(Clone)/pages/WorldBossEmptyUI(Clone)/time/Text"
				}
			}
		},
		{
			style = {
				text = "That aside, let’s get to it! Tap the button to locate the Ashes ship!",
				mode = 2,
				dir = 1,
				char = "1",
				posY = -284,
				posX = -495
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/WorldBossUI(Clone)/pages/WorldBossEmptyUI(Clone)/useItem/list/tpl",
				triggerType = {
					1
				},
				fingerPos = {
					rotateY = 0,
					posY = 0,
					rotateX = 0,
					rotateZ = 0,
					posX = 0
				}
			}
		}
	}
}
