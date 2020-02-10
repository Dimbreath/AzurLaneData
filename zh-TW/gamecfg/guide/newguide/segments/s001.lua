slot2.style = {
	text = "你就是新來的指揮官嗎？歡迎您加入碧藍航線，接下來我將指引你完成基本教學!",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot1[1] = {
	alpha = 0.34
}
slot2.style = {
	text = "首先,我們來建造新角色吧",
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
	text = "先建造一艘<color=#ffde38>輕型艦</color>試試吧！",
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
	text = "點擊<color=#ffde38>開始建造</color>",
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
	path = "UICamera/Canvas/UIMain/BuildShipUI(Clone)/bg/main/gallery/start_btn"
}
slot1[4] = {
	alpha = 0.235
}
slot2.style = {
	text = "材料充足，點擊<color=#ffde38>確定</color>建造！",
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
