slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 1,
	attr = "isInvincible"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	ai_onAttach = 80004
}
slot1[2] = {
	type = "BattleBuffNewAI"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	maxX = 55
}
slot1[3] = {
	type = "BattleBuffDeath"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	group = 8524,
	number = 1,
	attr = "immuneMaxAreaLimit"
}
slot1[4] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 9999,
	name = "无敌撤退",
	init_effect = "jinengchufablue",
	picture = "",
	desc = "无敌",
	stack = 1,
	id = 8524,
	icon = 8524,
	last_effect = ""
}
