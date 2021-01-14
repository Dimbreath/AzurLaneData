return {
	id = "NG0013",
	events = {
		{
			action = {
				say = {
					text = "新機能「周回モード」が登場！詳細はヘルプを確認してね！",
					style = {
						posY = -110,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = -100
					}
				}
			}
		},
		{
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/stage_info/panel/loop_button/help_button",
					fingerPos = {
						posY = -35,
						posX = 40
					}
				}
			}
		}
	}
}
