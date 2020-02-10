slot2.trigger = {
	"onAttach",
	"onStack",
	"onRemove"
}
slot2.arg_list = {
	add = 0,
	mul = -5000
}
slot1[1] = {
	type = "BattleBuffFixVelocity"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	ai_onAttach = 80007
}
slot1[2] = {
	type = "BattleBuffNewAI"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	maxX = 100
}
slot1[3] = {
	type = "BattleBuffDeath"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 1,
	attr = "immuneMaxAreaLimit"
}
slot1[4] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 10,
	name = "运输船直线离场",
	init_effect = "",
	picture = "",
	desc = "运输船直线离场",
	stack = 1,
	id = 8012,
	icon = 8012,
	last_effect = ""
}
