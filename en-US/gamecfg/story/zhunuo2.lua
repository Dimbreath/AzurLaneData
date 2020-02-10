slot2.shake = {
	speed = 1,
	number = 2
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[1] = {
	actor = 201020,
	side = 2,
	dir = -1,
	nameColor = "#a9f548",
	say = "*Yaaaawn*..."
}
slot2.paintingFadeOut = {
	time = 0.5,
	side = 0
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[2] = {
	actor = 201030,
	nameColor = "#a9f548",
	side = 1,
	dir = 1,
	say = "Acasta, now's not the time for a nap. We're supposed to be escorting a convoy."
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[3] = {
	actor = 201020,
	side = 0,
	nameColor = "#a9f548",
	dir = -1,
	say = "I know, you don't have to spell it out... Blame the weather, it's making me sleepy..."
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[4] = {
	actor = 201030,
	side = 1,
	nameColor = "#a9f548",
	dir = 1,
	say = "*Sigh*... Of course, it's always the weather..."
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[5] = {
	actor = 207060,
	side = 2,
	nameColor = "#a9f548",
	dir = 1,
	say = "Ahah, it's all right. As long as we maintain a basic level of vigilance, we'll be fine. And if anyone tries to attack us, my planes will send them away~"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[6] = {
	hideOther = true,
	nameColor = "#a9f548",
	side = 1,
	dir = 1,
	actor = 201030,
	say = "Thanks, Glorious! In any event, we must still do our jobs. And Acasta, since we don't have radar with us, you should move to the front so we can spot enemies quicker."
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[7] = {
	actor = 201020,
	side = 0,
	nameColor = "#a9f548",
	dir = -1,
	say = "Right. Got it."
}
slot3.alpha = {
	0,
	1
}
slot2.flashout = {
	dur = 1,
	black = true
}
slot3.alpha = {
	1,
	0
}
slot2.flashin = {
	delay = 1,
	dur = 1,
	black = true
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[8] = {
	side = 2,
	dir = 1,
	actor = 201030,
	nameColor = "#a9f548",
	say = "All right. Glorious is moving at 17 knots; wind force is around 2 or 3, moving southeast... We've got good visibility... And I think we're behind schedule, but we're making good progress..."
}
slot2.paintingFadeOut = {
	time = 0.5,
	side = 1
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[9] = {
	actor = 207060,
	nameColor = "#a9f548",
	side = 0,
	dir = 1,
	say = "Hold up... Non-allied vessels are approaching... Oh, dear... they're Iron Blood!"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[10] = {
	actor = 207060,
	side = 0,
	nameColor = "#a9f548",
	dir = 1,
	say = "I let my guard down, and we're not in combat formation... Ardent, count the number of approaching Iron Blood ships! Acasta, to my right! Zig-zag and keep an eye out for enemy submarines!"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[11] = {
	actor = 201020,
	nameColor = "#a9f548",
	side = 0,
	dir = -1,
	actorName = "Ardent & Acasta",
	say = "Aye-aye, ma'am!"
}
slot0.scripts = {}

return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 1,
	once = true,
	id = "ZHUNUO2",
	fadein = 1.5
}
