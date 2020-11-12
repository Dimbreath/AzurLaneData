return {
	id = "SYG003",
	events = {
		{
			alpha = 0.284,
			style = {
				text = "Check <color=#ff7d36>Commissions</color> here.",
				mode = 2,
				dir = 1,
				posY = 89.6,
				posX = 186.59
			},
			ui = {
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/toTop/frame/rightPanel/eventPanel/combatBtn",
				onClick = function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
						mapIdx = 1,
						noRecord = true
					})
				end,
				triggerType = {
					1
				},
				fingerPos = {
					posY = -4.24,
					posX = 28.95
				}
			}
		},
		{
			alpha = 0.485,
			style = {
				text = "Go to <color=#ff7d36>commissions</color>.",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				path = "/UICamera/Canvas/UIMain/LevelMainScene(Clone)/main/right_chapter/event_btns/event_container/btn_special",
				triggerType = {
					1
				},
				fingerPos = {
					posY = 0,
					posX = 65.6
				}
			}
		},
		{
			alpha = 0.563,
			style = {
				text = "Here you can see today's available commissions. <color=#ff7d36>Each commission has different times, costs and rewards.</color>",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.636,
			style = {
				text = "Tap here to see the detailed requirements.",
				mode = 2,
				dir = 1,
				posY = -69.9,
				posX = -271.7
			},
			ui = {
				pathIndex = 0,
				delay = 1,
				eventIndex = 1,
				path = "/UICamera/Canvas/UIMain/EventUI(Clone)/scrollRect$/content",
				triggerType = {
					1
				},
				fingerPos = {
					posY = 0,
					posX = 65.6
				}
			}
		},
		{
			alpha = 0.419,
			style = {
				text = "Tap here to check <color=#ff7d36>urgent ops</color>.",
				mode = 2,
				dir = -1,
				posY = 175.56,
				posX = -231.6
			},
			ui = {
				pathIndex = -1,
				path = "/UICamera/Canvas/UIMain/EventUI(Clone)/blur_panel/adapt/left_length/frame/scroll_rect/tagRoot/urgency_btn",
				triggerType = {
					2
				},
				fingerPos = {
					posY = -28.49,
					posX = 58.24
				}
			}
		},
		{
			alpha = 0.351,
			style = {
				text = "<color=#ff7d36>Urgent ops will appear randomly</color> and are available for a limited amount of time. Remember to keep an eye out!",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			}
		}
	}
}
