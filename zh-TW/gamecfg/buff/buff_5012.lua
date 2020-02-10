slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	rant = 2500,
	target = "TargetSelf",
	skill_id = 5011
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 15,
	name = "弱点侦测",
	init_effect = "",
	id = 5012,
	picture = "",
	desc = "15%的機率发动",
	stack = 1,
	color = "yellow",
	icon = 5010,
	last_effect = ""
}
