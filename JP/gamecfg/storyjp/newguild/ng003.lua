return {
	id = "NG003",
	events = {
		{
			action = {
				say = {
					text = "対潜戦については「ヘルプ」で確認できるのね！",
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
