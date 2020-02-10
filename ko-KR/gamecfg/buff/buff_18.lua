slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot3.group = {
	id = 18,
	level = 1
}
slot2.arg_list = {
	add = 0,
	mul = -3000
}
slot1[1] = {
	type = "BattleBuffFixVelocity"
}
slot0.effect_list = {}

return {
	time = 8,
	name = "减速",
	init_effect = "",
	picture = "",
	desc = "8s减速",
	stack = 1,
	id = 18,
	icon = 18,
	last_effect = "Darkness"
}
