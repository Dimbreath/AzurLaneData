slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	buff_id = 48,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 43,
	target = "TargetSelf",
	time = 30
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	count = 0,
	delay = 31
}
slot1[3] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}

return {
	desc_get = "前排全灭30秒后触发绝地反击效果，随后每15秒触发1次，最多可叠加5次",
	name = "绝地反击",
	init_effect = "",
	id = 43,
	time = 0,
	picture = "",
	desc = "前排全灭30秒后触发绝地反击效果，随后每15秒触发1次，最多可叠加5次",
	stack = 1,
	color = "绝地反击",
	icon = 43,
	last_effect = ""
}
