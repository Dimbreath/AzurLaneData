slot3[1] = {
	"Hammann Observation Diary\n\n<size=45>Chapter 6: Hello, Military Police?!</size>",
	1
}
slot2.sequence = {}
slot1[1] = {
	mode = 1,
	stopbgm = true
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[2] = {
	actor = 101240,
	side = 2,
	bgName = "bg_story_room",
	say = "Um... I just happened to run into the Commander who just happened to tell me about what happened with Hammann... and yeah...",
	dir = 1,
	bgm = "story-1"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot3[1] = {
	content = "I'm sorry! I promise not to eavesdrop anymore!",
	flag = 1
}
slot3[2] = {
	content = "Sims convinced me to do it!",
	flag = 2
}
slot2.options = {}
slot1[3] = {
	actor = 107050,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "Is that so...? I could've sworn you two were listening in for quite some time..."
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot3[1] = {
	y = 30,
	dur = 0.15,
	number = 3,
	type = "shake"
}
slot2.action = {}
slot1[4] = {
	actor = 101240,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	optionFlag = 1,
	say = "That's right! It was a total coincidence! Coincidence, I tel you!"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot3[1] = {
	y = 45,
	dur = 0.2,
	number = 1,
	type = "shake"
}
slot2.action = {}
slot1[5] = {
	actor = 101240,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	optionFlag = 2,
	say = "Eeeeehhhhhh?!?!"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[6] = {
	actor = 101250,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "C-C-Commander?!"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot3[1] = {
	y = 45,
	dur = 0.15,
	number = 3,
	type = "shake"
}
slot2.action = {}
slot1[7] = {
	actor = 101250,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "You pervert! Stalker! Iiiiidiot!!"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[8] = {
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "Hammann tearfully reached for the telephone to dial the naval headquarters."
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[9] = {
	actor = 101250,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "Hello? Headquarters?! Yes! There's a commander here... and, and..."
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot3[1] = {
	content = "I'm truly sorry. I could've timed this much better.",
	flag = 1
}
slot2.options = {}
slot1[10] = {
	actor = 101250,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "...the commander is doing a fine job... yes..."
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
slot1[11] = {
	actor = 107050,
	side = 0,
	bgName = "bg_story_room",
	say = "...See? Commander was worried and came looking for you.",
	dir = 1
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[12] = {
	actor = 101250,
	side = 1,
	bgName = "bg_story_room",
	dir = 1,
	say = "I know... But even then..."
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[13] = {
	actor = 107050,
	side = 0,
	bgName = "bg_story_room",
	dir = 1,
	say = "Commander, I owe you an apology as well... Sorry for all the trouble Hammann has caused you..."
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[14] = {
	actor = 101240,
	side = 0,
	bgName = "bg_story_room",
	dir = 1,
	say = "Hammann, this could've all been prevented if you were a bit more honest with yourself~"
}
slot3[1] = {
	y = 0,
	type = "shake",
	dur = 0.3,
	x = 30,
	number = 3
}
slot2.action = {}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[15] = {
	bgName = "bg_story_room",
	side = 2,
	actor = 101250,
	dir = 1,
	blackBg = true,
	hideOther = true,
	say = "...Uuu..."
}
slot0.scripts = {}

return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 2,
	once = true,
	id = "HAMAN6",
	fadein = 1.5
}
