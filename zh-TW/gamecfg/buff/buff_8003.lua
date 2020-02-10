slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	group = 8003,
	add = 0,
	mul = 8000
}
slot1[1] = {
	type = "BattleBuffFixVelocity"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	time = 5
}
slot1[2] = {
	type = "BattleBuffDeath"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	ai_onAttach = 80007
}
slot1[3] = {
	type = "BattleBuffNewAI"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	group = 60037,
	number = 1,
	attr = "immuneMaxAreaLimit"
}
slot1[4] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 10,
	name = "自爆船冲撞自杀buff加速等效果",
	init_effect = "",
	picture = "",
	desc = "自爆船冲撞自杀buff加速等效果",
	stack = 1,
	id = 8003,
	icon = 8003,
	last_effect = ""
}
