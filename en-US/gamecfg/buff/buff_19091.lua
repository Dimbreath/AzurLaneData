slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot3.index = {
	1
}
slot2.arg_list = {
	bullet_id = 1402
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
	countType = 19091
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
	countType = 19091
}
slot1[3] = {
	type = "BattleBuffCancelBuff"
}
slot2.trigger = {
	"onRemove"
}
slot2.arg_list = {
	skill_id = 19091,
	target = "TargetSelf"
}
slot1[4] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	desc_get = "主炮炮弹修改为高爆弹，主炮进行2次攻击，切换为穿甲弹",
	name = "专业装填手",
	init_effect = "",
	id = 19091,
	time = 0,
	picture = "",
	desc = "主炮炮弹修改为高爆弹，主炮进行2次攻击，切换为穿甲弹",
	stack = 1,
	color = "red",
	icon = 19090,
	last_effect = ""
}
