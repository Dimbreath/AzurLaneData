slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	buff_id = 12931
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot3.check_target = {
	"TargetAllHelp",
	"TargetShipTag"
}
slot3.ship_tag_list = {
	"Dido_class"
}
slot2.arg_list = {
	skill_id = 12931,
	minTargetNumber = 1
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
	desc_get = "",
	name = "黛朵1",
	init_effect = "",
	id = 12930,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 12930,
	last_effect = ""
}
