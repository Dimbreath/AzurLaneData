return {
	id = "S021",
	events = {
		{
			alpha = 0.19,
			style = {
				text = "<color=#ff7d36>編成</color>ボタンで艦隊を編成するわ",
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
				text = "編成のやり方は覚えてる？",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.385,
			style = {
				text = "出撃画面の<color=#ff7d36>追加</color>をタップしてね",
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
				text = "艦隊に編入する艦を選択してね",
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
				text = "<color=#ff7d36>確定</color>ボタンをタップよ",
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
				text = "前衛艦隊は最大編成ね！今回はバッチリよ！",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.462,
			style = {
				text = "メイン画面に戻るわ",
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
