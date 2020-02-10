slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	add = 0,
	mul = -8000
}
slot1[1] = {
	type = "BattleBuffFixVelocity"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	quota = 4,
	target = "TargetSelf",
	time = 0.4,
	skill_id = 12581
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onRemove"
}
slot3.buff_id_list = {
	12586
}
slot2.arg_list = {}
slot1[3] = {
	type = "BattleBuffCleanse"
}
slot0.effect_list = {}

return {
	time = 2.5,
	name = "减速",
	init_effect = "",
	picture = "",
	desc = "减速回复",
	stack = 1,
	id = 12585,
	icon = 12585,
	last_effect = "Darkness"
}
