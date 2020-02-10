slot2.style = {
	text = "<color=#ff7d36>편성</color>은 이쪽이야.",
	mode = 2,
	dir = -1,
	posY = -275,
	posX = 348
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -34.7,
	posX = 68.5
}
slot2.ui = {
	pathIndex = -1,
	path = "OverlayCamera/Overlay/UIMain/toTop/frame/rightPanel/eventPanel/formationButton"
}
slot1[1] = {
	alpha = 0.328
}
slot2.style = {
	text = "<color=#ffde38>구축함, 경순양함, 중순양함</color>은 선봉함대에만 편성할 수 있어.",
	mode = 1,
	dir = 1,
	posY = -100,
	posX = 300
}
slot1[2] = {
	alpha = 0.574,
	waitScene = "FormationUI"
}
slot2.style = {
	text = "<color=#ffde38>항공모함, 전함</color>은 주력함대에만 편성할 수 있지.",
	mode = 1,
	dir = -1,
	posY = 200,
	posX = 0
}
slot1[3] = {
	alpha = 0.321
}
slot2.style = {
	text = "<color=#ff7d36>편성</color>으로 다른 함선을 추가해보자.",
	mode = 2,
	dir = -1,
	posY = 122.82,
	posX = 243.5
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -34.7,
	posX = 68.5
}
slot2.ui = {
	pathIndex = -1,
	path = "/UICamera/Canvas/UIMain/FormationUI(Clone)/GridFrame/vanguard_2/tip"
}
slot1[4] = {
	alpha = 0.371
}
slot2.style = {
	text = "우선 함대에 편입시킬 함선을 선택해.",
	mode = 2,
	dir = -1,
	posY = 0,
	posX = 0
}
slot3.image = {
	source = "content/ship_icon",
	isChild = true,
	target = "content/ship_icon",
	isRelative = true
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -107.3,
	posX = 67.77
}
slot2.ui = {
	pathIndex = 1,
	path = "UICamera/Canvas/UIMain/DockyardUI(Clone)/main/ship_container/ships"
}
slot1[5] = {
	alpha = 0.482,
	waitScene = "DockyardScene"
}
slot2.style = {
	text = "다음은 <color=#ff7d36>확인</color> 버튼을 눌러.",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -24.4,
	posX = 65.8
}
slot2.ui = {
	pathIndex = -1,
	path = "UICamera/Canvas/UIMain/DockyardUI(Clone)/select_panel/confirm_button"
}
slot1[6] = {
	alpha = 0.363
}
slot2.style = {
	text = "함대에 새로운 멤버가 편성됐어. 이걸로 함대의 전력이 한층 상승했어.",
	mode = 1,
	dir = -1,
	posY = 0,
	posX = 0
}
slot1[7] = {
	alpha = 0.196,
	code = -1,
	waitScene = "FormationUI"
}
slot2.style = {
	text = "메인 화면으로 한번 돌아가자.",
	mode = 2,
	dir = -1,
	posY = 215.7,
	posX = -95.62
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -40,
	posX = 20
}
slot2.ui = {
	pathIndex = -1,
	path = "/UICamera/Canvas/UIMain/FormationUI(Clone)/blur_panel/top/back_btn"
}
slot1[8] = {
	alpha = 0.45
}
slot0.events = {}

return {
	id = "S004"
}
