slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	buff_id = 12521,
	target = "TargetPlayerFlagShip"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	buff_id = 12521,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 12520,
	target = "TargetSelf"
}
slot1[3] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onFoeAircraftDying"
}
slot2.arg_list = {
	skill_id = 12521,
	inside = 1,
	target = "TargetSelf",
	time = 1
}
slot1[4] = {
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
	name = "伯明翰防空",
	init_effect = "",
	id = 12520,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12520,
	last_effect = ""
}
