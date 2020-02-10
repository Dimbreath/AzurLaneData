slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 11711,
	time = 3,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	add = -2,
	mul = 0
}
slot1[2] = {
	type = "BattleBuffFixVelocity"
}
slot0.effect_list = {}

return {
	time = 16,
	name = "杜尔拉汗-回复效果",
	init_effect = "",
	picture = "",
	desc = "杜尔拉汗-回复效果",
	stack = 1,
	id = 11712,
	icon = 11710,
	last_effect = "Health"
}
