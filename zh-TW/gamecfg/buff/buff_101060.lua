slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 101060,
	target = "TargetSelf",
	time = 115
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	count = 0,
	delay = 125
}
slot1[2] = {
	type = "BattleBuffCancelBuff"
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
	desc_get = "战斗开始115秒后触发，发射超强弹幕，每场战斗只能触发1次",
	name = "胜利刺穿",
	init_effect = "",
	id = 101060,
	time = 0,
	picture = "",
	desc = "战斗开始115秒后触发，发射超强弹幕，每场战斗只能触发1次",
	stack = 1,
	color = "red",
	icon = 101060,
	last_effect = ""
}
