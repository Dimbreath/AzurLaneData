slot2.trigger = {
	"onAttach",
	"onStack",
	"onRemove"
}
slot2.arg_list = {
	number = -3320,
	attr = "velocity"
}
slot1[1] = {
	type = "BattleBuffFixVelocity"
}
slot2.trigger = {
	"onAttach",
	"onStack",
	"onRemove"
}
slot3.group = {
	id = 300,
	level = 7
}
slot2.arg_list = {
	add = 0,
	mul = -3320
}
slot1[2] = {
	type = "BattleBuffFixVelocity"
}
slot0.effect_list = {}

return {
	time = 6,
	name = "减速",
	init_effect = "",
	picture = "",
	desc = "6s减速",
	stack = 1,
	id = 307,
	icon = 307,
	last_effect = "Darkness"
}
