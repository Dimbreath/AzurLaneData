slot0.blink = {
	1,
	0,
	0,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	skill_id = 8662,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 0.1,
	attr = "damageRatioBullet"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
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
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 8663,
	time = 15,
	target = "TargetSelf",
	quota = 1
}
slot1[4] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	name = "黛朵",
	init_effect = "jinengchufared",
	id = 8662,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 8662,
	last_effect = ""
}
