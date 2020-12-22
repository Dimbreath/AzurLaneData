return {
	id = "SYG003",
	events = {
		{
			alpha = 0.284,
			style = {
				text = "<color=#ff7d36>軍事委託</color>を確認するわ",
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
				text = "<color=#ff7d36>軍事委託</color>をタップするのよ",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				path = "/UICamera/Canvas/UIMain/LevelMainScene(Clone)/main/right_chapter/event_btns/event_container/btn_task",
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
				text = "今受けることができる委託は全部表示されているわ。<color=#ff7d36>委託によって必要時間と報酬も違うわよ</color>",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.636,
			style = {
				text = "タップで詳細を確認してね",
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
				text = "<color=#ff7d36>時間限定で出現する緊急委託</color>はここで表示されるのよ",
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
				text = "<color=#ff7d36>緊急委託は戦闘中に随時出現する</color>から、時間制限には気をつけてね",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			}
		}
	}
}
