slot2.style = {
	text = "今もらった任務報酬でもう一回<color=#ff7d36>建造</color>するわ",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -21.99,
	posX = 39.82
}
slot2.ui = {
	pathIndex = -1,
	path = "OverlayCamera/Overlay/UIMain/toTop/frame/bottomPanel/btm/buttons_container/buildButton"
}
slot1[1] = {
	alpha = 0.375
}
slot2.style = {
	text = "今度は<color=#ff7d36>大型艦建造</color>にチャレンジするのよ",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot3.triggerType = {
	2
}
slot3.fingerPos = {
	posY = -27.87,
	posX = 62.21
}
slot2.ui = {
	pathIndex = -1,
	path = "UICamera/Canvas/UIMain/BuildShipUI(Clone)/bg/main/gallery/toggle_bg/toggles/heavy/frame"
}
slot1[2] = {
	alpha = 0.303,
	waitScene = "BuildShipScene"
}
slot2.style = {
	text = "資材は十分！<color=#ffde38>建造開始</color>をタップして建造開始よ！",
	mode = 1,
	dir = 1,
	posY = 0,
	posX = 205.91
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -25.43,
	posX = 76.4
}
slot2.ui = {
	pathIndex = -1,
	path = "UICamera/Canvas/UIMain/BuildShipUI(Clone)/bg/main/gallery/start_btn"
}
slot1[3] = {
	alpha = 0.408
}
slot2.style = {
	text = "<color=#ff7d36>確定</color>をタップしてね",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -19.57,
	posX = 61.16
}
slot2.ui = {
	pathIndex = -1,
	path = "/OverlayCamera/Overlay/UIMain/build_msg/window/btns/confirm_btn"
}
slot1[4] = {
	alpha = 0.318
}
slot0.events = {}

return {
	id = "S020"
}
