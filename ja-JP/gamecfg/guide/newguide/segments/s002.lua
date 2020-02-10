slot2.style = {
	text = "<color=#ffde38>建造</color>で詳細を確認するわ！",
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
	text = "<color=#ffde38>建造中</color>をタップして建造状況を確認するのよ！",
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
	text = "艦の建造には時間がかかるけど…",
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
	text = "もう待ちきれないわ！<color=#ffde38>高速建造</color>をタップして早く完成させよう！",
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
	text = "確定をタップして<color=#ffde38>高速建造材</color>を使おう！",
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
