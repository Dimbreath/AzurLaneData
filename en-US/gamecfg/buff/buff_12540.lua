slot2.trigger = {
	"onAntiAirWeaponFire"
}
slot2.arg_list = {
	rant = 2500,
	skill_id = 12540,
	target = "TargetSelf",
	time = 8
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onBulletCollide"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 13,
	countType = 12540
}
slot1[2] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	quota = 3,
	skill_id = 12541,
	target = "TargetSelf",
	countType = 12540
}
slot1[3] = {
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
	name = "圣胡安防空",
	init_effect = "",
	id = 12540,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 12540,
	last_effect = ""
}
