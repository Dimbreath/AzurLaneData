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
	maxX = 55
}
slot1[2] = {
	type = "BattleBuffDeath"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	group = 7023,
	number = 1,
	attr = "immuneMaxAreaLimit"
}
slot1[3] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "序章俾斯麦撤退",
	init_effect = "",
	picture = "",
	desc = "序章俾斯麦撤退",
	stack = 1,
	id = 7023,
	icon = 7023,
	last_effect = ""
}
