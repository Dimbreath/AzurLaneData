return {
	id = "SYG001",
	events = {
		{
			alpha = 0,
			style = {
				text = "<color=#ff7d36>後宅</color>從這裏進入喲",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/toTop/frame/bottomPanel/btm/buttons_container/haremButton",
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
			alpha = 0.25,
			waitScene = "BackYardScene",
			style = {
				text = "這就是指揮官的<color=#ff7d36>後宅</color>啦~ 雖然現在看起來還很破舊..咳咳",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0,
			style = {
				text = "指揮官可以安排艦船在<color=#ff7d36>後宅休息</color>，將能夠<color=#ff7d36>回復心情</color>並且還能<color=#ff7d36>獲得角色經驗</color>，但需要<color=#ff7d36>消耗存糧</color>喲",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.285,
			style = {
				text = "後宅布置的<color=#ff7d36>傢俱會影響舒適度</color>",
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
				text = "在商店內，可通過<color=#ff7d36>傢俱幣購買新傢俱</color>",
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
				text = "<color=#ff7d36>管理可對後宅傢俱進行排布與改變</color>",
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
				text = "我們來<color=#ff7d36>添加存糧</color>吧~",
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
				text = "這裏展示了多種食物可選擇，<color=#ff7d36>高級食材還有附帶經驗值加成獎勵</color>",
				mode = 2,
				dir = -1,
				posY = 253.3,
				posX = 264.7
			}
		},
		{
			alpha = 0.292,
			style = {
				text = "點擊第一個可樂添加一次食糧",
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
				text = "關閉存糧界面",
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
				text = "我們來選擇需要休息的艦船吧，<color=#ff7d36>艦船在後宅休息，會回復心情</color>哦",
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
				text = "點擊<color=#ff7d36>空位添加角色</color>，隨後指引點擊空位，添加第一個角色進入後宅",
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
				text = "選擇需要休息的角色",
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
				text = "點擊確定按鈕",
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
				text = "指揮官可不要在後宅幹壞事哦，那女將就先告辭啦！",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			}
		}
	}
}
