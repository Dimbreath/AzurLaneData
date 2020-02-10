slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 0.3,
	attr = "igniteResist"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 6,
	attr = "igniteShorten"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 2000,
	attr = "igniteReduce"
}
slot1[3] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "灭火器T3",
	init_effect = "",
	id = 6031,
	picture = "",
	desc = "起火概率降低30%，持续时间缩短6秒，伤害降低20%",
	stack = 1,
	color = "blue",
	icon = 6031,
	last_effect = ""
}
