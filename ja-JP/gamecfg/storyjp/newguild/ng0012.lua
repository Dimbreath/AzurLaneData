return {
	id = "NG0012",
	events = {
		{
			action = {
				say = {
					text = "今回のイベントから新ギミックが登場！HELPボタンで確認してね！",
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
