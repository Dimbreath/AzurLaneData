slot2.style = {
	text = "<color=#ff7d36>編成</color>ボタンで艦隊を編成するわ",
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
	text = "編成のやり方は覚えてる？",
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
	text = "出撃画面の<color=#ff7d36>追加</color>をタップしてね",
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
	text = "艦隊に編入する艦を選択してね",
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
	text = "<color=#ff7d36>確定</color>ボタンをタップよ",
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
	text = "前衛艦隊は最大編成ね！今回はバッチリよ！",
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
	text = "メイン画面に戻るわ",
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
