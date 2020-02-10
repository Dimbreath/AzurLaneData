slot2.style = {
	text = "<color=#ff7d36>편성</color>은 이쪽이야.",
	mode = 2,
	dir = 1,
	posY = 104.87,
	posX = 4.77
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -23.47,
	posX = 86.45
}
slot2.ui = {
	pathIndex = -1,
	path = "OverlayCamera/Overlay/UIMain/toTop/frame/rightPanel/eventPanel/formationButton"
}
slot1[1] = {
	alpha = 0.19
}
slot2.style = {
	text = "편성하는 법 기억해?",
	mode = 2,
	dir = -1,
	posY = 0,
	posX = 0
}
slot1[2] = {
	alpha = 0.414,
	waitScene = "FormationUI"
}
slot2.style = {
	text = "비어있는 출격 칸의 <color=#ff7d36>편성</color>을 눌러봐.",
	mode = 2,
	dir = 1,
	posY = 240,
	posX = -88.52
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = 1.09,
	posX = 39.88
}
slot2.ui = {
	pathIndex = -1,
	path = "/UICamera/Canvas/UIMain/FormationUI(Clone)/GridFrame/vanguard_3/tip"
}
slot1[3] = {
	alpha = 0.385
}
slot2.style = {
	text = "함대에 편입시킬 함선을 선택해.",
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
	posY = -78.23,
	posX = 63.68
}
slot2.ui = {
	pathIndex = "#",
	path = "UICamera/Canvas/UIMain/DockyardUI(Clone)/main/ship_container/ships"
}
slot1[4] = {
	alpha = 0.279
}
slot2.style = {
	text = "<color=#ff7d36>확인</color>버튼을 눌러.",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 239.42
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -22.37,
	posX = 40.09
}
slot2.ui = {
	pathIndex = -1,
	path = "UICamera/Canvas/UIMain/DockyardUI(Clone)/select_panel/confirm_button"
}
slot1[5] = {
	alpha = 0.293
}
slot2.style = {
	text = "선봉함대는 편성을 완료했어! 이번에는 완벽한걸!",
	mode = 2,
	dir = -1,
	posY = 0,
	posX = 0
}
slot1[6] = {
	alpha = 0.441,
	waitScene = "FormationUI"
}
slot2.style = {
	text = "메인 화면으로 돌아가자.",
	mode = 2,
	dir = -1,
	posY = 226.21,
	posX = -130.49
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
	path = "UICamera/Canvas/UIMain/FormationUI(Clone)/blur_panel/top/back_btn"
}
slot1[7] = {
	alpha = 0.462
}
slot0.events = {}

return {
	id = "S021"
}
