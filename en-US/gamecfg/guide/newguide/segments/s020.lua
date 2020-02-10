slot2.style = {
	text = "Use your mission rewards to <color=#ff7d36>build a new ship</color>.",
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
	text = "This time, try building a <color=#ff7d36>heavy ship</color>!",
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
	text = "You've got enough resources! Tap <color=#ff7d36>build</color> to get started.",
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
	text = "Now tap <color=#ff7d36>confirm</color> to build your new ship.",
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
