slot1[1] = {
	actor = 101030,
	side = 0,
	say = "有人吗"
}
slot3[1] = {
	content = "既然你诚心诚意地问了"
}
slot3[2] = {
	content = "不告诉你",
	skip = 2
}
slot3[3] = {
	content = "(无视)",
	skip = 4
}
slot2.options = {}
slot1[2] = {
	actor = 101030,
	side = 1,
	say = "谁？"
}
slot1[3] = {
	actor = 101030,
	side = 0,
	say = "是我,"
}
slot1[4] = {
	say = "老王!"
}
slot1[5] = {
	actor = 101030,
	side = 0,
	say = "我就是试一下剧情模块。"
}
slot1[6] = {
	skip = 1,
	say = "接下来有个新手引导，需要你完成一场战斗"
}
slot1[7] = {
	actor = 101030,
	side = 1,
	say = "加油"
}
slot0.scripts = {}

return {
	id = "S901",
	skippable = true,
	type = 2
}
