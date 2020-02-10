slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 11721,
	time = 20,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 11721,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffCastSkill"
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
	desc_get = "每20秒，有50.0%(满级100.0%)概率发射星星弹幕",
	name = "星之歌",
	init_effect = "",
	id = 11720,
	time = 0,
	picture = "",
	desc = "每20秒，有50.0%(满级100.0%)概率发射星星弹幕",
	stack = 1,
	color = "red",
	icon = 11720,
	last_effect = ""
}
