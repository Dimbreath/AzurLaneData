slot2.trigger = {
	"onAttach",
	"onStack",
	"onRemove"
}
slot2.arg_list = {
	add = 0,
	mul = -4000
}
slot1[1] = {
	type = "BattleBuffFixVelocity"
}
slot0.effect_list = {}

return {
	time = 6,
	name = "约克公爵1技能",
	init_effect = "",
	picture = "",
	desc = "6s减速",
	stack = 1,
	id = 11101,
	icon = 11101,
	last_effect = "Darkness"
}
