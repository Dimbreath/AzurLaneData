slot0.blink = {
	0,
	0.7,
	1,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 6000,
	attr = "cannonPower"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 8000,
	attr = "airPower"
}
slot1[2] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 0.2,
	attr = "injureRatio"
}
slot1[3] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	name = "2019年2月世界BOSS叠加buff",
	init_effect = "jinengchufablue",
	id = 8612,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 2120,
	last_effect = ""
}
