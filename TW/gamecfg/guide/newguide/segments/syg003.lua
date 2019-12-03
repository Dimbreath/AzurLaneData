return {
	id = "SYG003",
	events = {
		{
			alpha = 0.284,
			style = {
				text = "<color=#ff7d36>軍事委托</color>從這裏進入",
				mode = 2,
				dir = 1,
				posY = 89.6,
				posX = 186.59
			},
			ui = {
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/toTop/frame/rightPanel/eventPanel/combatBtn",
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
				text = "前往<color=#ff7d36>軍事委托</color>",
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
				text = "這裏顯示著今日的所有委托，<color=#ff7d36>每個委托耗時不同，消耗與獎勵也不同</color>",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.636,
			style = {
				text = "點擊看看詳細要求吧",
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
				text = "點擊這裏能看到當前的<color=#ff7d36>緊急委托</color>",
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
				text = "<color=#ff7d36>緊急委托會在出擊戰鬥時隨機出現</color>，並且有時間限制，記得查看哦",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			}
		}
	}
}
