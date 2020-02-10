slot2.style = {
	text = "<color=#ff7d36>장비 창고</color>는 이쪽이야.",
	mode = 2,
	dir = -1,
	posY = -50.56,
	posX = -163.2
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -19.78,
	posX = 23.7
}
slot2.ui = {
	pathIndex = -1,
	path = "OverlayCamera/Overlay/UIMain/toTop/frame/bottomPanel/btm/buttons_container/equipButton"
}
slot1[1] = {
	alpha = 0.327
}
slot2.style = {
	text = "<color=#ff7d36>장비 상자</color>를 선택해봐.",
	mode = 2,
	dir = 1,
	posY = 191.3,
	posX = -93.8
}
slot3.triggerType = {
	1
}
slot3.image = {
	source = "bg/icon_bg/icon",
	isChild = true,
	target = "bg/icon_bg/icon",
	isRelative = true
}
slot3.fingerPos = {
	posY = -44.21,
	posX = 50.3
}
slot2.ui = {
	pathIndex = "#",
	path = "UICamera/Canvas/UIMain/StoreHouseUI(Clone)/item_scrollview/item_grid"
}
slot1[2] = {
	alpha = 0.547,
	waitScene = "StoreHouseScene"
}
slot2.style = {
	text = "<color=#ff7d36>사용</color> 버튼으로 장비 상자를 열 수 있어.",
	mode = 2,
	dir = 1,
	posY = -252,
	posX = -393
}
slot3.triggerType = {
	1
}
slot3.fingerPos = {
	posY = -37.87,
	posX = 49.89
}
slot2.ui = {
	pathIndex = -1,
	path = "OverlayCamera/Overlay/UIMain/ItemInfoUI(Clone)/window/actions/use_button"
}
slot1[3] = {
	alpha = 0.298
}
slot0.events = {}

return {
	id = "S013"
}
