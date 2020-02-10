slot2.trigger = {
	"onFoeDying"
}
slot2.arg_list = {
	count = 0,
	killer = "self"
}
slot1[1] = {
	type = "BattleBuffCancelBuff"
}
slot2.trigger = {
	"onRemove"
}
slot2.arg_list = {
	skill_id = 11690,
	killer = "self",
	target = "TargetSelf",
	time = 1
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
	name = "湖之都的蛮牛",
	init_effect = "",
	id = 11690,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 11690,
	last_effect = ""
}
