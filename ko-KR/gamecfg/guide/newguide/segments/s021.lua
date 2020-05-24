return {
	id = "S021",
	events = {
		{
			alpha = 0.19,
			style = {
				text = "<color=#ff7d36>편성</color>은 이쪽이야.",
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
				text = "편성하는 법 기억해?",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.385,
			style = {
				text = "비어있는 출격 칸의 <color=#ff7d36>편성</color>을 눌러봐.",
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
				text = "함대에 편입시킬 함선을 선택해.",
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
				text = "<color=#ff7d36>확인</color>버튼을 눌러.",
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
				text = "선봉함대는 편성을 완료했어! 이번에는 완벽한걸!",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.462,
			style = {
				text = "메인 화면으로 돌아가자.",
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
