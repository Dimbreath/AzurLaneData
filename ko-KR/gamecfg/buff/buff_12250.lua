slot2.trigger = {
	"onLeader"
}
slot2.arg_list = {
	skill_id = 12250,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onStartGame"
}
slot3.ship_tag_list = {
	"Helena-Chan"
}
slot2.arg_list = {
	minTargetNumber = 1,
	check_target = "TargetShipTag",
	skill_id = 12251,
	target = "TargetSelf"
}
slot1[2] = {
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
	desc_get = "先锋领舰时自身减伤、小海小圣常驻减伤",
	name = "未经磨练的骑士",
	init_effect = "",
	id = 12250,
	time = 0,
	picture = "",
	desc = "先锋领舰时自身减伤、小海小圣常驻减伤",
	stack = 1,
	color = "blue",
	icon = 12250,
	last_effect = ""
}
