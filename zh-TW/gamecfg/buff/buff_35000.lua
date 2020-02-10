slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 350001,
	target = "TargetAllHelp",
	max_distance = 30
}
slot1[1] = {
	type = "BattleBuffAura"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "光环技能试做",
	init_effect = "",
	picture = "",
	desc = "距离30以内的单位回血",
	stack = 1,
	id = 35000,
	icon = 35000,
	last_effect = ""
}
