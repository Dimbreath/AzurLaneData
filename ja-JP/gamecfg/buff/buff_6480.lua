slot2.trigger = {
	"onStartGame"
}
slot3.check_target = {
	"TargetSelf",
	"TargetShipTag"
}
slot3.ship_tag_list = {
	"Anshan-Class"
}
slot2.arg_list = {
	minTargetNumber = 1,
	skill_id = 6480,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "",
	init_effect = "",
	id = 6480,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 6480,
	last_effect = ""
}
