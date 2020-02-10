slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 0.1,
	attr = "igniteResist"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 1000,
	attr = "igniteReduce"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "灭火器T1",
	init_effect = "",
	id = 6141,
	picture = "",
	desc = "起火概率降低10%，伤害降低10%",
	stack = 1,
	color = "blue",
	icon = 6141,
	last_effect = ""
}
