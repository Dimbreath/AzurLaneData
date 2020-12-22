return {
	id = "WorldG190",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "余燼座標を一定の数集めると、余燼戦が開放されます。",
				mode = 2,
				dir = 1,
				char = "1",
				posY = -74.7,
				posX = -471.5
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/AwardInfoUI(Clone)/items/close",
				triggerType = {
					1
				},
				fingerPos = {
					rotateY = 0,
					posY = -53.42,
					rotateX = 0,
					rotateZ = 0,
					posX = 149.32
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "セイレーン作戦で手に入れた「余燼座標」の数量はここに表示されます。",
				mode = 2,
				dir = 1,
				char = "1",
				posY = 335.5,
				posX = 0,
				ui = {
					lineMode = true,
					path = "OverlayCamera/Overlay/UIMain/top/adapt/top_stage/resources/WorldResPanel(Clone)/res/boss_progress"
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "新しいコンテンツを確認します。メイン画面にもどりましょう。",
				mode = 2,
				dir = -1,
				char = "1",
				posY = 245.23,
				posX = -552.4
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/top/adapt/top_stage/back_button",
				triggerType = {
					1
				},
				fingerPos = {
					rotateY = 0,
					posY = 0,
					rotateX = 0,
					rotateZ = 238.9,
					posX = -76.32
				}
			}
		}
	}
}
