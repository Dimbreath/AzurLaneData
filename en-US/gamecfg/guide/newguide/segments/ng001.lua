slot2.style = {
	text = "Commander, we've received a Distress Signal! Something terrible might've happened...",
	mode = 1,
	dir = 1,
	posY = -110,
	posX = 200
}
slot1[1] = {
	alpha = 0.4
}
slot2.style = {
	text = "Tap the Distress Signal button and search for the Signal's source!",
	mode = 1,
	dir = 1,
	posY = -110,
	posX = 200
}
slot1[2] = {
	alpha = 0.4
}
slot2.ui = {
	path = "/UICamera/Canvas/UIMain/LevelMainScene(Clone)/main/right_chapter/btn_signal"
}
slot1[3] = {}
slot2.style = {
	text = "Also, I've heard that increasing your Signal Sensitivity lets you locate Signals in later Chapters...",
	mode = 1,
	dir = 1,
	posY = -70,
	posX = -190
}
slot1[4] = {
	alpha = 0.4
}
slot2.style = {
	text = "But that comes later! For now, just search for the source of that Distress Signal!",
	mode = 1,
	dir = 1,
	posY = -70,
	posX = -190
}
slot1[5] = {
	alpha = 0.4
}
slot2.ui = {
	path = "/OverlayCamera/Overlay/UIMain/LevelSignalView(Clone)/panel/start_button"
}
slot1[6] = {}
slot2.ui = {
	notfoundSkip = true,
	path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)"
}
slot1[7] = {}
slot2.style = {
	text = "You found the source! Now, initiate a Rescue Mission immediately! If you dilly-dally, the Signal will disappear!",
	mode = 1,
	dir = 1,
	posY = 0,
	posX = 0
}
slot1[8] = {
	alpha = 0.4
}
slot3.fingerPos = {
	posY = -47,
	posX = -62.97
}
slot2.ui = {
	path = "/UICamera/Canvas/UIMain/LevelMainScene(Clone)/float/levels/items/Chapter_305/sub"
}
slot1[9] = {}
slot2.style = {
	text = "You will run into enemy Submarines during Rescue Missions! Make sure you bring ships with the gear and stats needed to fight them!",
	mode = 1,
	dir = 1,
	alpha = 0.4,
	posY = -65,
	posX = -135
}
slot1[10] = {}
slot0.events = {}

return {
	id = "NG001"
}
