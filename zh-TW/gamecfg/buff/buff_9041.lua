slot2.trigger = {
	"onBulletCreate"
}
slot4.diverFilter = {
	2
}
slot3.override = {}
slot2.arg_list = {
	bullet_type = 3
}
slot1[1] = {
	type = "BattleBuffOverrideBullet"
}
slot2.trigger = {
	"onSubmarineDive"
}
slot2.arg_list = {
	count = 1
}
slot1[2] = {
	type = "BattleBuffCancelBuff"
}
slot2.trigger = {
	"onRemove"
}
slot2.arg_list = {
	skill_id = 9041,
	target = "TargetSelf"
}
slot1[3] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	desc_get = "",
	name = "U556切换模式",
	init_effect = "",
	id = 9040,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 9040,
	last_effect = ""
}
