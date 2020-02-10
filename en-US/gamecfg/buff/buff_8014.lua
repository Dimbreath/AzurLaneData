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
	maxX = 25
}
slot1[2] = {
	type = "BattleBuffDeath"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 1,
	attr = "immuneMaxAreaLimit"
}
slot1[3] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "鱼雷艇AI切换自杀",
	init_effect = "",
	picture = "",
	desc = "鱼雷艇AI切换跑路AI及自杀",
	stack = 1,
	id = 8014,
	icon = 8014,
	last_effect = ""
}
