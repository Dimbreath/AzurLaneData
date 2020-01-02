return {
	id = "S024",
	events = {
		{
			alpha = 0.422,
			code = 2,
			style = {
				text = "<color=#ff7d36>出撃</color>をタップしてね",
				mode = 2,
				dir = 1,
				posY = -42,
				posX = 243
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/toTop/frame/rightPanel/eventPanel/combatBtn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -18.1,
					posX = 68.35
				}
			}
		},
		{
			code = 2,
			waitScene = "LevelScene",
			alpha = 0.277,
			style = {
				text = "今の艦隊ならきっとホーネットを倒せる！",
				mode = 2,
				dir = 1,
				posY = -200,
				posX = -190
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/top/LevelStageView(Clone)/bottom_stage/func_button",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -29.71,
					posX = 25.08
				}
			}
		},
		{
			alpha = 0.297,
			code = 1,
			baseui = {
				path = "OverlayCamera/Overlay/UIMain/top/LevelAmbushView(Clone)/window/dodge_button"
			},
			style = {
				text = "また待ち伏せ！でも私たちの艦隊の<color=#ff7d36>回避値が上がってるわ</color>！無駄な戦闘を回避するのよ！",
				mode = 2,
				dir = 1,
				posY = -304,
				posX = -190
			}
		},
		{
			alpha = 0.297,
			code = 1,
			style = {
				text = "<color=#ff7d36>回避</color>で待ち伏せから迂回して！",
				mode = 2,
				dir = 1,
				posY = 167.08,
				posX = 23.41
			}
		},
		{
			alpha = 0.303,
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/top/LevelAmbushView(Clone)/window/dodge_button",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -23.85,
					posX = 23.79
				}
			}
		}
	}
}
