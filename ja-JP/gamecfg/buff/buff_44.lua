slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 44,
	target = "TargetSelf",
	time = 15
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	count = 0,
	delay = 61
}
slot1[2] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "游刃有余",
	init_effect = "",
	id = 44,
	picture = "",
	desc = "每隔15秒触发游刃有余效果",
	stack = 1,
	color = "red",
	icon = 44,
	last_effect = ""
}
