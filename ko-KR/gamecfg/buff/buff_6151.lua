slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 0.2,
	attr = "igniteResist"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 3,
	attr = "igniteShorten"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 1500,
	attr = "igniteReduce"
}
slot1[3] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "灭火器T2",
	init_effect = "",
	id = 6021,
	picture = "",
	desc = "起火概率降低20%，持续时间缩短3秒，伤害降低15%",
	stack = 1,
	color = "blue",
	icon = 6021,
	last_effect = ""
}
