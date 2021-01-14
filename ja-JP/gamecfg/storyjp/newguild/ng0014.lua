return {
	id = "NG0014",
	events = {
		{
			action = {
				say = {
					text = "敵「沿岸砲台」が新登場！「ヘルプボタン」をタップし、ヘルプを確認してね！",
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
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/bottom_stage/help_button"
				}
			}
		}
	}
}
