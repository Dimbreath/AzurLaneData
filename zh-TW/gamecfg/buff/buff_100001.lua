slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 100002
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onHPRatioUpdate"
}
slot2.arg_list = {
	hpUpperBound = 0.8,
	skill_id = 100003,
	target = "TargetSelf",
	quota = 1
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onHPRatioUpdate"
}
slot2.arg_list = {
	hpUpperBound = 0.5,
	skill_id = 100004,
	target = "TargetSelf",
	quota = 1
}
slot1[3] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onHPRatioUpdate"
}
slot2.arg_list = {
	hpUpperBound = 0.2,
	skill_id = 100005,
	target = "TargetSelf",
	quota = 1
}
slot1[4] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "阶段触发器",
	init_effect = "",
	id = 100001,
	picture = "",
	desc = "获得新武器",
	stack = 1,
	color = "yellow",
	icon = 100001,
	last_effect = ""
}
