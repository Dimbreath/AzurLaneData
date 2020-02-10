slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 42,
	target = "TargetSelf",
	time = 30
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	count = 0,
	delay = 31
}
slot1[2] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}

return {
	desc_get = "战斗开始30秒后触发游刃有余效果，随后每15秒触发1次，最多可叠加5次",
	name = "游刃有余",
	init_effect = "",
	id = 42,
	time = 0,
	picture = "",
	desc = "战斗开始30秒后触发游刃有余效果，随后每15秒触发1次，最多可叠加5次",
	stack = 1,
	color = "red",
	icon = 42,
	last_effect = ""
}
