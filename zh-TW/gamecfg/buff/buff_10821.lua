slot2.trigger = {
	"onAllInStrikeSteady"
}
slot2.arg_list = {
	skill_id = 10821,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	desc_get = "空中支援时，永久提高下一次空中支援伤害8.0%(满级20.0%)，可叠加3次",
	name = "鹤之奋进",
	init_effect = "",
	id = 10821,
	time = 0,
	picture = "",
	desc = "空中支援时，永久提高下一次空中支援伤害$1，可叠加3次",
	stack = 1,
	color = "red",
	icon = 10820,
	last_effect = ""
}
