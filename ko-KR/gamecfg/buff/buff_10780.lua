slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 10784,
	target = "TargetSelf",
	time = 20
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 10780,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "幸运舰？"
}
slot0[2] = {
	desc = "幸运舰？"
}
slot0[3] = {
	desc = "幸运舰？"
}
slot0[4] = {
	desc = "幸运舰？"
}
slot0[5] = {
	desc = "幸运舰？"
}
slot0[6] = {
	desc = "幸运舰？"
}
slot0[7] = {
	desc = "幸运舰？"
}
slot0[8] = {
	desc = "幸运舰？"
}
slot0[9] = {
	desc = "幸运舰？"
}
slot0[10] = {
	desc = "幸运舰？"
}

return {
	time = 0,
	name = "幸运舰？",
	init_effect = "",
	id = 10780,
	picture = "",
	desc = "每隔20秒，自身获得随机效果，持续5.0秒(满级10.0秒)",
	stack = 1,
	color = "blue",
	icon = 10780,
	last_effect = ""
}
