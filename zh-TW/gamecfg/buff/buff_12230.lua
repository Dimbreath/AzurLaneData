slot2.trigger = {
	"onAntiAirWeaponFire"
}
slot2.arg_list = {
	rant = 3000,
	skill_id = 12230,
	target = "TargetSelf",
	time = 5
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onStartGame"
}
slot3.ship_tag_list = {
	"Cleveland-Chan"
}
slot2.arg_list = {
	minTargetNumber = 1,
	check_target = "TargetShipTag",
	skill_id = 12231,
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
	desc_get = "",
	name = "天真烂漫的少女",
	init_effect = "",
	id = 12230,
	time = 0,
	picture = "",
	desc = "防空炮开火时有30%機率触发，自身防空提高$1，持续5秒",
	stack = 1,
	color = "blue",
	icon = 12230,
	last_effect = ""
}
