slot2.style = {
	text = "<color=#ffde38>건조 정보</color> 를 확인하자!",
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
	text = "<color=#ffde38>건조중</color>을 눌러서 건조 상태를 확인할 수 있어!",
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
	text = "건조가 완료됐어! 진수식으로 함선을 맞이하자!",
	mode = 1,
	dir = -1,
	posY = 95.46,
	posX = 0
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -26.75,
	posX = 58.13
}
slot2.ui = {
	pathIndex = -1,
	scale = 1.25,
	path = "/UICamera/Canvas/UIMain/BuildShipDetailUI1(Clone)/list_single_line/content/project_1/frame/finished/launched_btn"
}
slot1[3] = {
	alpha = 0.316,
	code = 2
}
slot0.events = {}

return {
	id = "S002"
}
