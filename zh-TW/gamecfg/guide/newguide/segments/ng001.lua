return {
	id = "NG001",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "指揮官，我們收到了一條求救信號，一定是某個地方發生了不得了的事情",
				mode = 1,
				dir = 1,
				posY = -110,
				posX = 200
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "點擊求救信號，就能查找到信號是從哪片海域發送出來的",
				mode = 1,
				dir = 1,
				posY = -110,
				posX = 200
			}
		},
		{
			ui = {
				path = "/UICamera/Canvas/UIMain/LevelMainScene(Clone)/main/right_chapter/btn_signal"
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "當信號強度越強，可以搜索的海域範圍就越大，可以獲得的獎勵也會變得更加豐厚噢",
				mode = 1,
				dir = 1,
				posY = -70,
				posX = -190
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "讓我們試著搜索一下信號的來源吧",
				mode = 1,
				dir = 1,
				posY = -70,
				posX = -190
			}
		},
		{
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/LevelSignalView(Clone)/panel/start_button"
			}
		},
		{
			ui = {
				notfoundSkip = true,
				path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)"
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "我們找到了信號來源，快趕過去救助船隊吧，如果一直沒有救助，我們會失去這條信號",
				mode = 1,
				dir = 1,
				posY = 0,
				posX = 0
			}
		},
		{
			ui = {
				path = "/UICamera/Canvas/UIMain/LevelMainScene(Clone)/float/levels/items/Chapter_305/sub",
				fingerPos = {
					posY = -47,
					posX = -62.97
				}
			}
		},
		{
			style = {
				text = "我們發現這片海域有敵方潛艇出沒，出擊前請指揮官確認下是否攜帶了反潛設備",
				mode = 1,
				dir = 1,
				alpha = 0.4,
				posY = -65,
				posX = -135
			}
		}
	}
}
