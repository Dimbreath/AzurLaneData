slot0.blink = {
	1,
	0,
	0,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	rant = 10000,
	skill_id = 10201,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onAllInStrike"
}
slot2.arg_list = {
	rant = 10000,
	skill_id = 10202,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	name = "LuckyE",
	init_effect = "jinengchufared",
	time = 3,
	picture = "",
	desc = "buff触发器",
	stack = 1,
	id = 10201,
	icon = 10201,
	last_effect = ""
}
