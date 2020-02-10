slot2.trigger = {
	"onBulletHit"
}
slot3.index = {
	1
}
slot2.arg_list = {
	buff_id = 12321,
	weaponType = 2,
	rant = 10000
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 12320
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onFoeDying"
}
slot2.arg_list = {
	quota = 10,
	killer = "self",
	target = "TargetSelf",
	skill_id = 12321
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
	name = "恶毒1",
	init_effect = "",
	id = 12320,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12320,
	last_effect = ""
}
