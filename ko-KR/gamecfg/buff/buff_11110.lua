slot2.trigger = {
	"onChargeWeaponFire"
}
slot2.arg_list = {
	skill_id = 11110
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	buff_id = 11111,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onBulletHit"
}
slot3.index = {
	1
}
slot2.arg_list = {
	buff_id = 11112,
	weaponType = 23
}
slot1[3] = {
	type = "BattleBuffAddBuff"
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
	desc_get = "战斗内，第一轮炮击伤害提高$1，主炮炮击命中敌人时，使目标受到伤害提高$2，持续8秒",
	name = "约克公爵2技能",
	init_effect = "",
	id = 11110,
	time = 0,
	picture = "",
	desc = "战斗内，第一轮炮击伤害提高$1，主炮炮击命中敌人时，使目标受到伤害提高$2，持续8秒",
	stack = 1,
	color = "yellow",
	icon = 11110,
	last_effect = ""
}
