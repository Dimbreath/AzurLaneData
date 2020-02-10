slot2.trigger = {
	"onBulletCollide"
}
slot3.index = {
	2
}
slot2.arg_list = {
	countTarget = 5,
	countType = 11220
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 11220,
	target = "TargetSelf",
	countType = 11220
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
	desc_get = "鱼雷每击中6次敌人，增加自身炮击、雷击，最多叠加3层",
	name = "持续打击",
	init_effect = "",
	id = 11220,
	time = 0,
	picture = "",
	desc = "鱼雷每击中6次敌人，增加自身炮击、雷击，最多叠加3层",
	stack = 1,
	color = "red",
	icon = 11220,
	last_effect = ""
}
