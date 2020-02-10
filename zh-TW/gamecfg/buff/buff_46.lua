slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 46,
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
	name = "绝地反击",
	init_effect = "",
	id = 46,
	picture = "",
	desc = "每隔15秒触发绝地反击效果",
	stack = 1,
	color = "red",
	icon = 46,
	last_effect = ""
}
