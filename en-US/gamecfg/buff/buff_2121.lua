slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 2121
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onBulletHit"
}
slot2.arg_list = {
	buff_id = 2120,
	weaponType = 16,
	rant = 700
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}
slot3.trigger = {
	"onStartGame"
}
slot3.arg_list = {
	skill_id = 2121
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot3.trigger = {
	"onBulletHit"
}
slot3.arg_list = {
	buff_id = 2120,
	weaponType = 16,
	rant = 700
}
slot2[2] = {
	type = "BattleBuffAddBuff"
}
slot1.effect_list = {}
slot0[1] = {}
slot3.trigger = {
	"onStartGame"
}
slot3.arg_list = {
	skill_id = 2121
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot3.trigger = {
	"onBulletHit"
}
slot3.arg_list = {
	buff_id = 2120,
	weaponType = 16,
	rant = 810
}
slot2[2] = {
	type = "BattleBuffAddBuff"
}
slot1.effect_list = {}
slot0[2] = {}
slot3.trigger = {
	"onStartGame"
}
slot3.arg_list = {
	skill_id = 2121
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot3.trigger = {
	"onBulletHit"
}
slot3.arg_list = {
	buff_id = 2120,
	weaponType = 16,
	rant = 920
}
slot2[2] = {
	type = "BattleBuffAddBuff"
}
slot1.effect_list = {}
slot0[3] = {}
slot3.trigger = {
	"onStartGame"
}
slot3.arg_list = {
	skill_id = 2121
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot3.trigger = {
	"onBulletHit"
}
slot3.arg_list = {
	buff_id = 2120,
	weaponType = 16,
	rant = 1030
}
slot2[2] = {
	type = "BattleBuffAddBuff"
}
slot1.effect_list = {}
slot0[4] = {}
slot3.trigger = {
	"onStartGame"
}
slot3.arg_list = {
	skill_id = 2121
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot3.trigger = {
	"onBulletHit"
}
slot3.arg_list = {
	buff_id = 2120,
	weaponType = 16,
	rant = 1140
}
slot2[2] = {
	type = "BattleBuffAddBuff"
}
slot1.effect_list = {}
slot0[5] = {}
slot3.trigger = {
	"onStartGame"
}
slot3.arg_list = {
	skill_id = 2121
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot3.trigger = {
	"onBulletHit"
}
slot3.arg_list = {
	buff_id = 2120,
	weaponType = 16,
	rant = 1250
}
slot2[2] = {
	type = "BattleBuffAddBuff"
}
slot1.effect_list = {}
slot0[6] = {}
slot3.trigger = {
	"onStartGame"
}
slot3.arg_list = {
	skill_id = 2121
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot3.trigger = {
	"onBulletHit"
}
slot3.arg_list = {
	buff_id = 2120,
	weaponType = 16,
	rant = 1360
}
slot2[2] = {
	type = "BattleBuffAddBuff"
}
slot1.effect_list = {}
slot0[7] = {}
slot3.trigger = {
	"onStartGame"
}
slot3.arg_list = {
	skill_id = 2121
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot3.trigger = {
	"onBulletHit"
}
slot3.arg_list = {
	buff_id = 2120,
	weaponType = 16,
	rant = 1470
}
slot2[2] = {
	type = "BattleBuffAddBuff"
}
slot1.effect_list = {}
slot0[8] = {}
slot3.trigger = {
	"onStartGame"
}
slot3.arg_list = {
	skill_id = 2121
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot3.trigger = {
	"onBulletHit"
}
slot3.arg_list = {
	buff_id = 2120,
	weaponType = 16,
	rant = 1580
}
slot2[2] = {
	type = "BattleBuffAddBuff"
}
slot1.effect_list = {}
slot0[9] = {}
slot3.trigger = {
	"onStartGame"
}
slot3.arg_list = {
	skill_id = 2121
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot3.trigger = {
	"onBulletHit"
}
slot3.arg_list = {
	buff_id = 2120,
	weaponType = 16,
	rant = 1700
}
slot2[2] = {
	type = "BattleBuffAddBuff"
}
slot1.effect_list = {}
slot0[10] = {}

return {
	desc_get = "当鱼雷命中敌人时，有4%概率触发集火信号，持续8秒，将导致该敌舰受到鱼雷的伤害提高20%（不可叠加）",
	name = "集火信号-鱼雷",
	init_effect = "",
	id = 2121,
	time = 0,
	picture = "",
	desc = "当鱼雷命中敌人时，有4%概率触发集火信号，持续8秒，将导致该敌舰受到鱼雷的伤害提高20%(40%)（不可叠加）",
	stack = 1,
	color = "red",
	icon = 2120,
	last_effect = ""
}
