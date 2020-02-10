slot2.style = {
	text = "<color=#ff7d36>도크</color>는 이쪽이야.",
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
	text = "함선을 눌러서 상세 정보를 확인해줘.",
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
	text = "<color=#ff7d36>장비</color> 버튼을 눌러서, 지금 장착 중인 장비를 확인할 수 있어.",
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
	text = "여기서는 장착 중인 장비를 전부 확인할 수 있지!",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot1[4] = {
	alpha = 0.367
}
slot2.style = {
	text = "<color=#ff7d36>장비 슬롯</color>을 눌러서 새로운 장비를 장착할 수 있어.",
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
	text = "방금 제작한 장비를 선택해봐.",
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
	text = "장착 버튼을 누르도록 해.",
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
