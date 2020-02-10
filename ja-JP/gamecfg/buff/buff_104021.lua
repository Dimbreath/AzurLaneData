slot0.blink = {
	0,
	0.7,
	1,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 1,
	attr = "perfectDodge"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	buff_id = 104022,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}
slot0[1] = {}
slot0[2] = {}
slot0[3] = {}
slot0[4] = {}
slot0[5] = {}
slot0[6] = {}
slot0[7] = {}
slot0[8] = {}
slot0[9] = {}
slot0[10] = {}

return {
	name = "危机回避！",
	init_effect = "jinengchufablue",
	time = 3,
	picture = "",
	desc = "3s危机回避！",
	stack = 1,
	id = 104021,
	icon = 104020,
	last_effect = ""
}
