return {
	id = "SYG001",
	events = {
		{
			alpha = 0.258,
			style = {
				text = "Let's go to <color=#ff7d36>HQ</color>",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/toTop/frame/bottomPanel/btm/buttons_container/liveButton",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -25.87,
					posX = 41.49
				}
			}
		},
		{
			alpha = 0,
			style = {
				text = "You can visit our <color=#ff7d36>Dorm</color> from here",
				mode = 2,
				dir = 1,
				posY = 319,
				posX = -361
			},
			ui = {
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/secondary_panel/frame/bg/backyard_btn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -72.47,
					posX = 78.58
				}
			}
		},
		{
			alpha = 0.25,
			waitScene = "BackYardScene",
			style = {
				text = "Commander, this is your <color=#ff7d36>dorm</color>~! It looks a bit... rough around the edges.",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0,
			style = {
				text = "The dorm is where your girls can <color=#ff7d36>get some rest</color>, <color=#ff7d36>have their moods restored</color>, and earn <color=#ff7d36>EXP</color>. You'll need to have the required <color=#ff7d36>supplies</color>, however!",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.285,
			style = {
				text = "Decorations will <color=#ff7d36>increase the comfort level</color> of your dorm.",
				mode = 2,
				dir = 1,
				posY = 204.32,
				posX = 172.14,
				ui = {
					path = "/UICamera/Canvas/UIMain/BackYardUI(Clone)/main/topPanel/comfortable"
				}
			}
		},
		{
			alpha = 0.606,
			style = {
				text = "You may <color=#ff7d36>purchase decorations with Decor Tokens</color> in the furniture shop.",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 354.67,
				ui = {
					path = "/UICamera/Canvas/UIMain/BackYardUI(Clone)/main/bottomPanel/shop_btn"
				}
			}
		},
		{
			alpha = 0.54,
			style = {
				text = "<color=#ff7d36>Use manage to rearrange decorations and furniture within the dorm.</color>",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 232.9,
				ui = {
					path = "/UICamera/Canvas/UIMain/BackYardUI(Clone)/backyardmainui/decorateBtn"
				}
			}
		},
		{
			alpha = 0.34,
			style = {
				text = "Let's <color=#ff7d36>get some supplies</color>~!",
				mode = 2,
				dir = -1,
				posY = -56.21,
				posX = -26.28
			},
			ui = {
				pathIndex = -1,
				path = "UICamera/Canvas/UIMain/BackYardUI(Clone)/main/bottomPanel/stock_bg",
				triggerType = {
					1
				},
				fingerPos = {
					posY = 0,
					posX = 0
				}
			}
		},
		{
			alpha = 0.484,
			waitScene = "BackyardGranaryLayer",
			style = {
				text = "You can choose from a wide variety of <color=#ff7d36>high level snacks with EXP buff effects</color>.",
				mode = 2,
				dir = -1,
				posY = 253.3,
				posX = 264.7
			}
		},
		{
			alpha = 0.292,
			style = {
				text = "How about some Oxy-cola?",
				mode = 2,
				dir = -1,
				posY = 55.05,
				posX = -3.45
			},
			ui = {
				scale = 1.5,
				path = "/OverlayCamera/Overlay/UIMain/foodPanel/frame/scrollview/content/food_50001/icon_bg/icon",
				triggerType = {
					3
				}
			}
		},
		{
			alpha = 0.229,
			style = {
				text = "Close the supplies menu.",
				mode = 2,
				dir = -1,
				posY = 142.1,
				posX = 91.71
			},
			ui = {
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/foodPanel/bg",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -450,
					posX = 500
				}
			}
		},
		{
			alpha = 0.557,
			style = {
				text = "Now we need to find someone that needs some rest. <color=#ff7d36>Moods usually improve in the dorm</color>!",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				path = "UICamera/Canvas/UIMain/BackYardUI(Clone)/main/leftPanel/train_btn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -22.58,
					posX = 86.3
				}
			}
		},
		{
			alpha = 0.543,
			waitScene = "BackYardShipInfoLayer",
			style = {
				text = "Tap <color=#ff7d36>an empty slot to begin adding a character</color>, then select someone to put in the dorm.",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			},
			ui = {
				scale = 1.5,
				path = "/OverlayCamera/Overlay/UIMain/main/frame/panel/scrollview/ships/tpl/addtpl",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -40,
					posX = 120
				}
			}
		},
		{
			alpha = 0.509,
			waitScene = "DockyardScene",
			style = {
				text = "Select someone that needs rest.",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = 0,
				path = "UICamera/Canvas/UIMain/DockyardUI(Clone)/main/ship_container/ships/",
				image = {
					source = "content/ship_icon",
					isChild = true,
					target = "content/ship_icon",
					isRelative = true
				},
				triggerType = {
					1
				},
				fingerPos = {
					posY = -62.19,
					posX = 73.4
				}
			}
		},
		{
			delay = 0.1,
			alpha = 0.529,
			style = {
				text = "Tap confirm.",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 10.6
			},
			ui = {
				pathIndex = -1,
				path = "UICamera/Canvas/UIMain/DockyardUI(Clone)/select_panel/confirm_button",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -25.91,
					posX = 42.87
				}
			}
		},
		{
			alpha = 0.616,
			waitScene = "BackYardShipInfoLayer",
			style = {
				text = "Don't try anything funny in the dorm, Commander!",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			}
		}
	}
}
