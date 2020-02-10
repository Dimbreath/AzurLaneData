slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 105155,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 105155,
	time = 3,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffAddBuff"
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
	time = 0,
	name = "盘之占卜师",
	init_effect = "",
	id = 105150,
	picture = "",
	desc = "开场占卜一次",
	stack = 1,
	color = "yellow",
	icon = 105150,
	last_effect = ""
}
