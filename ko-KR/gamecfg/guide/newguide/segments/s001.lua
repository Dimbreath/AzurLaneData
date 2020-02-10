slot2.style = {
	text = "네가 새로운 지휘관이구나! 벽람항로에 잘 왔어. \n이 아마존이 기본적인 지식을 전수해주도록 하지!",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot1[1] = {
	alpha = 0.34
}
slot2.style = {
	text = "우선은 함선을 건조하는 것부터!",
	mode = 2,
	dir = 1,
	posY = -152.6,
	posX = 215.2
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -24.76,
	posX = 19.75
}
slot2.ui = {
	pathIndex = -1,
	path = "OverlayCamera/Overlay/UIMain/toTop/frame/bottomPanel/btm/buttons_container/buildButton"
}
slot1[2] = {
	alpha = 0.359
}
slot2.style = {
	text = "<color=#ffde38>소형함</color>을 한 척 건조해보자!",
	mode = 1,
	dir = 1,
	posY = -46.82,
	posX = -126.5
}
slot3.triggerType = {
	2
}
slot3.fingerPos = {
	posY = -24.76,
	posX = 19.75
}
slot2.ui = {
	pathIndex = -1,
	path = "/UICamera/Canvas/UIMain/BuildShipUI(Clone)/bg/main/gallery/toggle_bg/toggles/light/frame"
}
slot1[3] = {
	alpha = 0.367,
	waitScene = "BuildShipScene"
}
slot2.style = {
	text = "<color=#ffde38>건조개시</color>를 눌러!",
	mode = 1,
	dir = 1,
	posY = -11.13,
	posX = 301.54
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -22.75,
	posX = 89.2
}
slot2.ui = {
	pathIndex = -1,
	path = "/UICamera/Canvas/UIMain/BuildShipUI(Clone)/bg/main/gallery/start_btn"
}
slot1[4] = {
	alpha = 0.235
}
slot2.style = {
	text = "자재는 충분하다고! <color=#ffde38>확인</color>을 눌러서 건조를 시작하는 거야!",
	mode = 1,
	dir = 1,
	posY = 65.31,
	posX = 103.3
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -24.49,
	posX = 21.42
}
slot2.ui = {
	pathIndex = -1,
	path = "/OverlayCamera/Overlay/UIMain/build_msg/window/btns/confirm_btn"
}
slot1[5] = {
	alpha = 0.306
}
slot0.events = {}

return {
	id = "S001"
}
