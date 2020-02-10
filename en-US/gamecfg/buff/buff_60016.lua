slot2.trigger = {
	"onFire"
}
slot2.arg_list = {
	countTarget = 5,
	countType = 60016
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	countType = 60016,
	skill_id = 60009,
	time = 20,
	nationality = 1,
	target = "TargetNationalityFriendly"
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "测试-衣阿华-技能触发被动",
	init_effect = "",
	picture = "",
	desc = "白鹰之傲",
	stack = 1,
	id = 60016,
	icon = 60016,
	last_effect = ""
}
