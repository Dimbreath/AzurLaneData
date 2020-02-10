slot2.style = {
	text = "지휘관, 구조신호를 받았어! 분명 어딘가에 무슨 일이 생긴 거야!",
	mode = 1,
	dir = 1,
	posY = -110,
	posX = 200
}
slot1[1] = {
	alpha = 0.4
}
slot2.style = {
	text = "구조신호를 터치하면 신호가 어느 해역에서 발송된 건지 확인할 수 있어",
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
	text = "신호 강도가 강해질수록, 탐색 가능한 해역 범위가 더 넓어지고, 획득 가능한 보상도 더 많아진다구!",
	mode = 1,
	dir = 1,
	posY = -70,
	posX = -190
}
slot1[4] = {
	alpha = 0.4
}
slot2.style = {
	text = "한 번 신호가 어디서 오는 건지 탐색해보자!",
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
	text = "신호 위치가 확인되었으니 어서 구조함대를 보내자고! 만약 계속 구하러 가지 않으면 이 신호를 놓치고 말 거야!",
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
	text = "이 해역에 적 잠수함이 출몰한 거구나, 출격 전엔 대잠 장비를 챙겼는지 꼭 확인하라구!",
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
