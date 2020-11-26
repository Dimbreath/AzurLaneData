return {
	id = "S008",
	events = {
		{
			alpha = 0.491,
			code = 2,
			style = {
				text = "今度の任務はユニオン空母艦隊の作戦演習を支援することね    <color=#ff7d36>出撃</color>をタップするわ",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/toTop/frame/rightPanel/eventPanel/combatBtn",
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
			alpha = 0.406,
			style = {
				text = "ホーネットの出現位置を特定したわ！目標地点まで全速前進よ！",
				mode = 2,
				dir = 1,
				posY = -351,
				posX = -257
			},
			ui = {
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/top/LevelStageView(Clone)/bottom_stage/normal/func_button",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -21.55,
					posX = 31.24
				}
			},
			code = {
				2,
				4
			}
		},
		{
			alpha = 0.346,
			code = 1,
			style = {
				text = "失敗しちゃった…やるしかないわ！",
				mode = 2,
				dir = 1,
				posY = -295,
				posX = -297
			}
		},
		{
			alpha = 0.361,
			code = 1,
			style = {
				text = "<color=#ff7d36>迂回の成功率は艦隊の合計回避力によって決まるのよ</color>。回避力が足りなければ失敗することもあるわ",
				mode = 2,
				dir = 1,
				posY = -295,
				posX = -297
			}
		},
		{
			alpha = 0.409,
			style = {
				text = "<color=#ff7d36>出撃</color>をタップして戦闘開始！    戦闘は<color=#ff7d36>艦ごとに燃料を消費する</color>のよ",
				mode = 2,
				dir = 1,
				posY = -68.93,
				posX = 241.87
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/ChapterPreCombatUI(Clone)/right/start",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -30.21,
					posX = 116.3
				}
			}
		}
	}
}
