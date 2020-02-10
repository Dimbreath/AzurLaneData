slot2.trigger = {
	"onBulletCollide"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 8,
	countType = 12030
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	quota = 3,
	skill_id = 12030,
	target = "TargetSelf",
	countType = 12030
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onBulletCollide"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 24,
	countType = 12031
}
slot1[3] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 12031,
	target = "TargetSelf",
	countType = 12031
}
slot1[4] = {
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
	desc_get = "主炮每击中8次敌人，增加自身炮击、装填，最多叠加3层",
	name = "划破夜空之火",
	init_effect = "",
	id = 12030,
	time = 0,
	picture = "",
	desc = "主炮每击中8次敌人，增加自身炮击、装填，最多触发3次",
	stack = 1,
	color = "red",
	icon = 12030,
	last_effect = ""
}
