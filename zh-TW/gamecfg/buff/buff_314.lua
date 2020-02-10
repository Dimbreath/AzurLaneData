slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 1,
	attr = "igniteResist"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	add = 0,
	mul = -4000
}
slot1[2] = {
	type = "BattleBuffFixVelocity"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "潜艇下潜点燃抗性",
	init_effect = "",
	id = 314,
	picture = "",
	desc = "起火機率降低100%",
	stack = 1,
	color = "blue",
	icon = 314,
	last_effect = ""
}
