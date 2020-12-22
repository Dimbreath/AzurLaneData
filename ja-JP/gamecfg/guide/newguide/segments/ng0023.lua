return {
	id = "NG0023",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "研究をタップするわ",
				mode = 2,
				dir = 1,
				posY = -308.7,
				posX = 199.3
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/toTop/frame/bottomPanel/btm/buttons_container/technologyButton",
				triggerType = {
					1
				},
				fingerPos = {
					rotateY = 0,
					posY = -32.1,
					rotateX = 0,
					rotateZ = 0,
					posX = 98.8
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "「メタラボ」をタップするわ",
				mode = 1,
				dir = 1,
				posY = 0,
				posX = 286.9
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/SelectTechnologyUI(Clone)/frame/bg/meta_btn",
				triggerType = {
					1
				},
				fingerPos = {
					rotateY = 0,
					posY = -50.43,
					rotateX = 0,
					rotateZ = 0,
					posX = 93.07
				}
			}
		},
		{
			alpha = 0.4,
			waitScene = "MetaCharacterScene",
			style = {
				text = "「余燼戦」で入手した解析Pｔはここで累計入手数に応じて報酬を入手できるわ！",
				mode = 1,
				dir = 1,
				posY = -236.99,
				posX = -419.8
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "報酬を早めに受け取るに越したことがないわね！タップして手に入れよう！",
				mode = 2,
				dir = 1,
				posY = -236.99,
				posX = -419.8,
				ui = {
					path = "UICamera/Canvas/UIMain/MetaCharacterUI(Clone)/HidePanel/ActTimeTip"
				}
			}
		}
	}
}
