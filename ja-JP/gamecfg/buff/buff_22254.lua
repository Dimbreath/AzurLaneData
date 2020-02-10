slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 9,
	countType = 22254
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot3.ship_tag_list = {
	"Suzuya"
}
slot2.arg_list = {
	check_target = "TargetShipTag",
	target = "TargetSelf",
	countType = 22254,
	maxTargetNumber = 0,
	skill_id = 22254
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot3.ship_tag_list = {
	"Suzuya"
}
slot2.arg_list = {
	minTargetNumber = 1,
	check_target = "TargetShipTag",
	target = "TargetSelf",
	countType = 22254,
	skill_id = 22256
}
slot1[3] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "全弹发射",
	init_effect = "",
	id = 22254,
	picture = "",
	desc = "主炮每进行9次攻击，触发全弹发射-{namecode:57}级{namecode:59}型I",
	stack = 1,
	color = "red",
	icon = 20200,
	last_effect = ""
}
