return {
	id = "NG0010",
	events = {
		{
			action = {
				say = {
					text = "特殊目標の拿捕についてはヘルプボタンで説明を確認できるわ！",
					style = {
						posY = -110,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = 0
					}
				}
			}
		},
		{
			finish = true,
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/bottom_stage/help_button"
				}
			}
		}
	}
}
