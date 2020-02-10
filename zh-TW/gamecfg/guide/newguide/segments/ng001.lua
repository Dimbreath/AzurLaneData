slot2.style = {
	text = "指揮官，我們收到了一條求救信號，一定是某個地方發生了不得了的事情",
	mode = 1,
	dir = 1,
	posY = -110,
	posX = 200
}
slot1[1] = {
	alpha = 0.4
}
slot2.style = {
	text = "點擊求救信號，就能查找到信號是從哪片海域發送出來的",
	mode = 1,
	dir = 1,
	posY = -110,
	posX = 200
}
slot1[2] = {
	alpha = 0.4
}
slot2.ui = {
	path = "/UICamera/Canvas/UIMain/LevelMainScene(Clone)/main/right_chapter/btn_signal"
}
slot1[3] = {}
slot2.style = {
	text = "當信號強度越強，可以搜索的海域範圍就越大，可以獲得的獎勵也會變得更加豐厚噢",
	mode = 1,
	dir = 1,
	posY = -70,
	posX = -190
}
slot1[4] = {
	alpha = 0.4
}
slot2.style = {
	text = "讓我們試著搜索一下信號的來源吧",
	mode = 1,
	dir = 1,
	posY = -70,
	posX = -190
}
slot1[5] = {
	alpha = 0.4
}
slot2.ui = {
	path = "/OverlayCamera/Overlay/UIMain/LevelSignalView(Clone)/panel/start_button"
}
slot1[6] = {}
slot2.ui = {
	notfoundSkip = true,
	path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)"
}
slot1[7] = {}
slot2.style = {
	text = "我們找到了信號來源，快趕過去救助船隊吧，如果一直沒有救助，我們會失去這條信號",
	mode = 1,
	dir = 1,
	posY = 0,
	posX = 0
}
slot1[8] = {
	alpha = 0.4
}
slot3.fingerPos = {
	posY = -47,
	posX = -62.97
}
slot2.ui = {
	path = "/UICamera/Canvas/UIMain/LevelMainScene(Clone)/float/levels/items/Chapter_305/sub"
}
slot1[9] = {}
slot2.style = {
	text = "我們發現這片海域有敵方潛艇出沒，出擊前請指揮官確認下是否攜帶了反潛設備",
	mode = 1,
	dir = 1,
	alpha = 0.4,
	posY = -65,
	posX = -135
}
slot1[10] = {}
slot0.events = {}

return {
	id = "NG001"
}
