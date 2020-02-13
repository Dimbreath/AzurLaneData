return {
	id = "NG001",
	events = {
		{
			action = {
				say = {
					text = "指揮官、救助信号を受信したわ！大変なことが起きているかも……",
					style = {
						posY = -110,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = 200
					}
				}
			}
		},
		{
			action = {
				say = {
					text = "「救助信号」をタップして、信号の発信源を探知するわよ！",
					style = {
						posY = -110,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = 200
					}
				}
			}
		},
		{
			action = {
				ui = {
					path = "/UICamera/Canvas/UIMain/LevelUI2(Clone)/right_chapter/btn_signal"
				}
			}
		},
		{
			action = {
				say = {
					text = "そういえば、探知感度が強いと、奥の海域の発信源を探知できるって噂が……",
					style = {
						posY = -70,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = -190
					}
				}
			}
		},
		{
			action = {
				say = {
					text = "とにかく、まずは救助信号の発信源の海域を探知するわよ！",
					style = {
						posY = -70,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = -190
					}
				}
			}
		},
		{
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/rescue_select/panel/start_button"
				}
			}
		},
		{
			code = 1,
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)"
				}
			}
		},
		{
			code = 1,
			action = {
				say = {
					text = "海域は特定した！早く救援任務を遂行しなさい！モタモタしていると信号が消えちゃうわよ！",
					style = {
						posY = 0,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = 0
					}
				}
			}
		},
		{
			action = {
				ui = {
					path = "/UICamera/Canvas/UIMain/LevelUI2(Clone)/float/levels/Chapter_305/sub",
					fingerPos = {
						posY = -47,
						posX = -62.97
					}
				}
			}
		},
		{
			action = {
				say = {
					text = "商船の救助信号には……って、敵潜水艦も出ているってあるじゃない！対潜できる艦種と…対潜装備を装備しているか確認しなさい！",
					style = {
						posY = -65,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = -135
					}
				}
			}
		}
	}
}
