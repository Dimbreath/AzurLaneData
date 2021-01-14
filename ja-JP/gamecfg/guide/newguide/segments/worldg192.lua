return {
	id = "WorldG192",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "座標一覧の画面では、ほかの指揮官から援軍要請を受けた余燼戦を確認できます。",
				mode = 2,
				dir = -1,
				char = "1",
				posY = -310.7,
				posX = -685.5
			},
			ui = {
				path = "UICamera/Canvas/UIMain/WorldBossUI(Clone)/switch_btn",
				triggerType = {
					2,
					false
				},
				fingerPos = {
					rotateY = 0,
					posY = -39.94,
					rotateX = 0,
					rotateZ = 0,
					posX = 118.8
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "ほかの指揮官が開放した余燼戦はここです。",
				mode = 2,
				dir = -1,
				char = "1",
				posY = 0,
				posX = 92.62
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "これらの戦闘に参加すると、与えたダメージに応じてすぐ報酬を入手できます。",
				mode = 2,
				dir = -1,
				char = "1",
				posY = 0,
				posX = 92.62
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "また、参加するには「挑戦ポイント」を1消費します。挑戦ポイントは毎日0時にリセットされます。",
				mode = 2,
				dir = 1,
				char = "1",
				posY = 312.35,
				posX = 380.71,
				ui = {
					path = "UICamera/Canvas/UIMain/WorldBossUI(Clone)/point"
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "余燼戦以外にも新しいコンテンツが開放されました。メイン画面に戻って確認しましょう。",
				mode = 2,
				dir = 1,
				char = "1",
				posY = 330.98,
				posX = 709.1
			},
			ui = {
				path = "UICamera/Canvas/UIMain/WorldBossUI(Clone)/option",
				triggerType = {
					1
				},
				fingerPos = {
					rotateY = 0,
					posY = -45.3,
					rotateX = 0,
					rotateZ = 0,
					posX = 62.5
				}
			}
		}
	}
}
