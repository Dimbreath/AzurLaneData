slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	ai_onRemove = 10012,
	ai_onAttach = 10012
}
slot1[1] = {
	type = "BattleBuffNewAI"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	group = 0,
	add = 0,
	mul = 2000
}
slot1[2] = {
	type = "BattleBuffFixVelocity"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	group = 0,
	number = 10000,
	attr = "loadSpeed"
}
slot1[3] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onFire"
}
slot2.arg_list = {
	buff_id = 7007,
	target = "TargetSelf"
}
slot1[4] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "精英怪-急速",
	init_effect = "",
	picture = "",
	desc = "精英怪-急速",
	stack = 1,
	id = 7001,
	icon = 7001,
	last_effect = "jingyingguaibuffbaise"
}
