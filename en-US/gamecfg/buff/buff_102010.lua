slot2.trigger = {
	"onLeader"
}
slot3.targetTemplateIDList = {
	10200011,
	10200012,
	10200013,
	10200014
}
slot2.arg_list = {
	check_target = "TargetTemplate",
	minTargetNumber = 1,
	skill_id = 102010,
	target = "TargetSelf"
}
slot1[1] = {
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
	desc_get = "作为先锋领队与22在同一个编队中出击时，队伍中22与33的雷击提高",
	name = "33领队技能",
	init_effect = "",
	id = 102010,
	time = 0,
	picture = "",
	desc = "作为先锋领队与22在同一个编队中出击时，队伍中22与33的雷击提高",
	stack = 1,
	color = "yellow",
	icon = 102010,
	last_effect = ""
}
