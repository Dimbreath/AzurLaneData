slot2.style = {
	text = "前往查看<color=#ffde38>建造</color>詳情！",
	mode = 1,
	dir = 1,
	posY = -132.4,
	posX = 423.25
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -16.5,
	posX = 33.83
}
slot2.ui = {
	pathIndex = -1,
	path = "OverlayCamera/Overlay/UIMain/toTop/frame/bottomPanel/btm/buttons_container/buildButton"
}
slot1[1] = {
	alpha = 0.422,
	code = 2
}
slot2.style = {
	text = "點擊<color=#ffde38>建造佇列</color>查看建造進程",
	mode = 1,
	dir = -1,
	posY = 0,
	posX = 0
}
slot3.triggerType = {
	2
}
slot3.fingerPos = {
	posY = -26.75,
	posX = 58.13
}
slot2.ui = {
	pathIndex = -1,
	path = "/OverlayCamera/Overlay/UIMain/blur_panel/adapt/left_length/frame/tagRoot/queue_btn"
}
slot1[2] = {
	code = 2,
	waitScene = "BuildShipScene",
	alpha = 0.316
}
slot2.style = {
	text = "建造新船需要花上一定時間",
	mode = 1,
	dir = -1,
	posY = 160,
	posX = 450
}
slot1[3] = {
	alpha = 0.322,
	waitScene = "BuildShipDetailLayer"
}
slot2.style = {
	text = "真是等不及了~點擊<color=#ffde38>快速完工</color>並使用快速建造道具吧！",
	mode = 1,
	dir = -1,
	posY = 160,
	posX = 450
}
slot3.pos = {
	x = 290,
	y = -143
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = 0,
	posX = 0
}
slot2.ui = {
	pathIndex = -1,
	scale = 1.3,
	path = "/UICamera/Canvas/UIMain/BuildShipDetailUI1(Clone)/list_single_line/content/project_1/frame/buiding/quick_btn"
}
slot1[4] = {
	alpha = 0.359
}
slot2.style = {
	text = "點擊確定<color=#ffde38>使用加速道具</color>",
	mode = 1,
	dir = -1,
	posY = 250,
	posX = 450
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = 0,
	posX = 0
}
slot2.ui = {
	pathIndex = -1,
	path = "OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)"
}
slot1[5] = {
	alpha = 0.341
}
slot0.events = {}

return {
	id = "S002"
}
