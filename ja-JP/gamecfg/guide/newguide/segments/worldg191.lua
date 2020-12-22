return {
	id = "WorldG191",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "ほかの指揮官と共闘し、余燼艦船に挑む新コンテンツ「余燼戦」が開放されました。",
				mode = 2,
				dir = 1,
				char = "1",
				posY = -279.2,
				posX = 498.7
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/top/adapt/bottom_chapter/button/btn_boss",
				triggerType = {
					1
				},
				fingerPos = {
					rotateY = 0,
					posY = -42,
					rotateX = 0,
					rotateZ = 0,
					posX = 128.2
				}
			}
		},
		{
			delay = 1,
			code = {
				"playStory"
			},
			stories = {
				"GWORLD109A"
			}
		},
		{
			alpha = 0.4,
			waitScene = "WorldBossScene",
			style = {
				text = "余燼戦は不定期で開催します。ここには今回の開催時間が表示されます。",
				mode = 2,
				dir = 1,
				char = "1",
				posY = 294,
				posX = -448.3,
				ui = {
					path = "UICamera/Canvas/UIMain/WorldBossUI(Clone)/pages/WorldBossEmptyUI(Clone)/time/Text"
				}
			}
		},
		{
			style = {
				text = "開催終了すると、「余燼座標」を消費して解放した余燼戦はなくなります。また、セイレーン作戦で余燼座標を新た入手できなくなります。",
				mode = 2,
				dir = 1,
				char = "1",
				posY = 1.5,
				posX = -402.4,
				ui = {
					path = "UICamera/Canvas/UIMain/WorldBossUI(Clone)/pages/WorldBossEmptyUI(Clone)/time/Text"
				}
			}
		},
		{
			style = {
				text = "「解析」をタップし、「余燼戦」を開放しましょう。",
				mode = 2,
				dir = 1,
				char = "1",
				posY = -284,
				posX = -495
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/WorldBossUI(Clone)/pages/WorldBossEmptyUI(Clone)/useItem/list/tpl",
				triggerType = {
					1
				},
				fingerPos = {
					rotateY = 0,
					posY = 0,
					rotateX = 0,
					rotateZ = 0,
					posX = 0
				}
			}
		}
	}
}
