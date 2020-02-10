slot3[1] = {
	"星の歌姫と小さな勇気\n\n<size=45>その四  星の歌姫さまへ</size>",
	1
}
slot2.sequence = {}
slot1[1] = {
	mode = 1,
	stopbgm = true
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
slot1[2] = {
	bgName = "bg_story_star2",
	blackBg = true
}
slot0.scripts = {}

return {
	fadeOut = 1.5,
	mode = 3,
	once = true,
	id = "XINGCHEN4",
	occlusion = 0.8
}
