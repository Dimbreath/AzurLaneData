slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 7000,
	time = 40,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 7027,
	time = 40,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "莱茵演习",
	init_effect = "",
	picture = "",
	desc = "序章俾斯麦秒杀技能",
	stack = 1,
	id = 7000,
	icon = 7000,
	last_effect = ""
}
