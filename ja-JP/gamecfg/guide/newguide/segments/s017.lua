slot2.style = {
	text = "<color=#ff7d36>ドック</color>を確認するわ",
	mode = 2,
	dir = -1,
	posY = 0,
	posX = 0
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
	path = "OverlayCamera/Overlay/UIMain/toTop/frame/bottomPanel/btm/buttons_container/dockBtn"
}
slot1[1] = {
	alpha = 0.183
}
slot2.style = {
	text = "艦船をタップして、詳細を確認してちょうだい",
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
	posY = -52.94,
	posX = 61.18
}
slot2.ui = {
	pathIndex = 0,
	path = "UICamera/Canvas/UIMain/DockyardUI(Clone)/main/ship_container/ships"
}
slot1[2] = {
	alpha = 0.351,
	waitScene = "DockyardScene"
}
slot2.style = {
	text = "<color=#ff7d36>装備</color>ボタンをタップして、今装備中の兵装を確認するのよ",
	mode = 2,
	dir = -1,
	posY = 0,
	posX = -366.9
}
slot3.triggerType = {
	2
}
slot3.fingerPos = {
	posY = -32.46,
	posX = 58.2
}
slot2.ui = {
	pathIndex = -1,
	path = "OverlayCamera/Overlay/UIMain/blur_panel/adapt/left_length/frame/root/equpiment_toggle"
}
slot1[3] = {
	alpha = 0.363,
	waitScene = "ShipMainScene"
}
slot2.style = {
	text = "ここでは装備中の兵装を全部確認できるわ！",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot1[4] = {
	alpha = 0.367
}
slot2.style = {
	text = "<color=#ff7d36>装備枠</color>をタップして、新しい装備を装備できる",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 13.5
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = 0,
	posX = 15.05
}
slot2.ui = {
	pathIndex = -1,
	path = "OverlayCamera/Overlay/UIMain/equipment_r_container(Adapt)/equipment_r_container/equipment_r/equipment/equipment_r2"
}
slot1[5] = {
	alpha = 0.339
}
slot2.style = {
	text = "今製作した装備を選択してね",
	mode = 2,
	dir = -1,
	posY = 0,
	posX = 0.37
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -40.64,
	posX = 51.34
}
slot2.ui = {
	pathIndex = 0,
	path = "UICamera/Canvas/UIMain/StoreHouseUI(Clone)/equipment_scrollview/equipment_grid"
}
slot1[6] = {
	alpha = 0.418,
	waitScene = "StoreHouseScene"
}
slot2.style = {
	text = "確定ボタンをタップするわ",
	mode = 2,
	dir = -1,
	posY = 0,
	posX = 0
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -28.14,
	posX = 35.79
}
slot2.ui = {
	pathIndex = -1,
	path = "OverlayCamera/Overlay/UIMain/EquipmentInfoUI(Clone)/replace/actions/action_button_2"
}
slot1[7] = {
	alpha = 0.215,
	waitScene = "EquipmentInfoLayer"
}
slot0.events = {}

return {
	id = "S017"
}
