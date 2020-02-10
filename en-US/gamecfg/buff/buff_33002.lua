slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 33002,
	time = 30,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 33002,
	time = 30,
	target = "TargetSelf"
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[1] = {
	desc = "每隔30秒回复全队耐久1次"
}

return {
	time = 0,
	name = "损管指挥",
	init_effect = "",
	picture = "",
	desc = "每隔30秒回复全队耐久1次",
	stack = 1,
	id = 33002,
	icon = 33002,
	last_effect = ""
}
