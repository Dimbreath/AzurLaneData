slot2.trigger = {
	"onSubmarineFloat"
}
slot2.arg_list = {
	buff_id = 12474,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onSubmarineFloat"
}
slot2.arg_list = {
	skill_id = 12472,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onSubmarineRetreat"
}
slot2.arg_list = {
	skill_id = 12472,
	target = "TargetSelf"
}
slot1[3] = {
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
	name = "",
	init_effect = "",
	id = 12473,
	time = 0,
	picture = "",
	desc = "有大青花鱼时弹幕",
	stack = 1,
	color = "red",
	icon = 12470,
	last_effect = ""
}
