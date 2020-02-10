slot2.trigger = {
	"onStartGame"
}
slot3.ship_tag_list = {
	"Cleveland-Class"
}
slot2.arg_list = {
	minTargetNumber = 2,
	check_target = "TargetShipTag",
	skill_id = 12240,
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
	desc_get = "出击时，队友中存在其他克利夫兰级角色，提高自身防空、命中",
	name = "小克利夫兰",
	init_effect = "",
	id = 12240,
	time = 0,
	picture = "",
	desc = "出击时，队友中存在其他克利夫兰级角色，提高自身防空、命中",
	stack = 1,
	color = "yellow",
	icon = 12240,
	last_effect = ""
}
