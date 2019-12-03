return {
	id = "SYG001",
	events = {
		{
			alpha = 0.258,
			style = {
				text = "让我们打开<color=#ff7d36>生活区</color>",
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
				text = "<color=#ff7d36>后宅</color>从这里进入哟",
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
				text = "这就是指挥官的<color=#ff7d36>后宅</color>啦~ 虽然现在看起来还很破旧..咳咳",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0,
			style = {
				text = "指挥官可以安排舰娘在<color=#ff7d36>后宅休息</color>，将能够<color=#ff7d36>回复心情</color>并且还能<color=#ff7d36>获得角色经验</color>，但需要<color=#ff7d36>消耗存粮</color>哟",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.285,
			style = {
				text = "后宅布置的<color=#ff7d36>家具会影响舒适度</color>",
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
				text = "在商店内，可通过<color=#ff7d36>家居币购买新家具</color>",
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
				text = "<color=#ff7d36>管理可对后宅家具进行排布与改变</color>",
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
				text = "我们来<color=#ff7d36>添加存粮</color>吧~",
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
				text = "这里展示了多种食物可选择，<color=#ff7d36>高级食材还有附带经验值加成奖励</color>",
				mode = 2,
				dir = -1,
				posY = 253.3,
				posX = 264.7
			}
		},
		{
			alpha = 0.292,
			style = {
				text = "点击第一个可乐添加一次食粮",
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
				text = "关闭存粮界面",
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
				text = "我们来选择需要休息的舰娘吧，<color=#ff7d36>舰娘在后宅休息，会回复心情</color>哦",
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
				text = "点击<color=#ff7d36>空位添加角色</color>，随后指引点击空位，添加第一个角色进入后宅",
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
				text = "选择需要休息的角色",
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
				text = "点击确定按钮",
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
				text = "指挥官可不要在后宅干坏事哦，那女将就先告辞啦！",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			}
		}
	}
}
