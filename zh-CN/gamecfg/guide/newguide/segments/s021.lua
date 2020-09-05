return {
	id = "S021",
	events = {
		{
			alpha = 0.19,
			style = {
				text = "前往<color=#ff7d36>编队</color>，将角色编入队伍",
				mode = 2,
				dir = 1,
				posY = 104.87,
				posX = 4.77
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/toTop/frame/rightPanel/eventPanel/formationButton",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -23.47,
					posX = 86.45
				}
			}
		},
		{
			alpha = 0.414,
			waitScene = "FormationUI",
			style = {
				text = "指挥官还记得怎么操作吗？",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.385,
			style = {
				text = "点击队伍空位上的<color=#ff7d36>添加</color>",
				mode = 2,
				dir = 1,
				posY = 240,
				posX = -88.52
			},
			ui = {
				pathIndex = -1,
				path = "/UICamera/Canvas/UIMain/FormationUI(Clone)/GridFrame/vanguard_3/tip",
				triggerType = {
					1
				},
				fingerPos = {
					posY = 1.09,
					posX = 39.88
				}
			}
		},
		{
			alpha = 0.279,
			style = {
				text = "选择需要上场的角色",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = "#",
				path = "UICamera/Canvas/UIMain/DockyardUI(Clone)/main/ship_container/ships",
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
					posY = -78.23,
					posX = 63.68
				}
			}
		},
		{
			alpha = 0.293,
			style = {
				text = "点击<color=#ff7d36>确定</color>按钮",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 239.42
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/blur_panel/select_panel/confirm_button",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -22.37,
					posX = 40.09
				}
			}
		},
		{
			alpha = 0.441,
			waitScene = "FormationUI",
			style = {
				text = "前锋舰队满员啦！现在的实力可不容小觑",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.462,
			style = {
				text = "让我们返回到主界面吧！",
				mode = 2,
				dir = -1,
				posY = 226.21,
				posX = -130.49
			},
			ui = {
				pathIndex = -1,
				path = "UICamera/Canvas/UIMain/FormationUI(Clone)/blur_panel/top/back_btn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -40,
					posX = 20
				}
			}
		}
	}
}
