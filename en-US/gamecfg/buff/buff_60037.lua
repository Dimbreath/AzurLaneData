slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	ai_onAttach = 80004
}
slot1[1] = {
	type = "BattleBuffNewAI"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	maxX = 30
}
slot1[2] = {
	type = "BattleBuffDeath"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	group = 60037,
	number = 1,
	attr = "immuneMaxAreaLimit"
}
slot1[3] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "测试-运输船-新AI及自杀",
	init_effect = "",
	picture = "",
	desc = "跑路AI及自杀",
	stack = 1,
	id = 60037,
	icon = 60037,
	last_effect = ""
}
