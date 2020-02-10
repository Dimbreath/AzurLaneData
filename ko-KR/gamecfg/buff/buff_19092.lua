slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot3.index = {
	1
}
slot2.arg_list = {
	bullet_id = 1401
}
slot1[1] = {
	type = "BattleBuffShiftBullet"
}
slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 2,
	countType = 19093
}
slot1[2] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	delay = 1.5,
	count = 1,
	countType = 19093
}
slot1[3] = {
	type = "BattleBuffCancelBuff"
}
slot2.trigger = {
	"onRemove"
}
slot2.arg_list = {
	skill_id = 19090,
	target = "TargetSelf"
}
slot1[4] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	desc_get = "主炮炮弹修改为穿甲弹，主炮进行2次攻击，切换为高爆弹",
	name = "专业装填手",
	init_effect = "",
	id = 19091,
	time = 0,
	picture = "",
	desc = "主炮炮弹修改为穿甲弹，主炮进行2次攻击，切换为高爆弹",
	stack = 1,
	color = "red",
	icon = 19090,
	last_effect = ""
}
