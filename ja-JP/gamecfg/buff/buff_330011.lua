slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	time = 1,
	maxHPRatio = 0.01
}
slot1[1] = {
	type = "BattleBuffHOT"
}
slot0.effect_list = {}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	time = 1,
	maxHPRatio = 0.01
}
slot2[1] = {
	type = "BattleBuffHOT"
}
slot1.effect_list = {}
slot0[1] = {
	desc = "回血"
}

return {
	time = 5,
	name = "回血",
	init_effect = "",
	picture = "",
	desc = "回血",
	stack = 1,
	id = 330011,
	icon = 330011,
	last_effect = "Health"
}
