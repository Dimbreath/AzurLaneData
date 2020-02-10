slot2.trigger = {
	"onDying"
}
slot2.arg_list = {
	skill_id = 6130,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onDying"
}
slot2.arg_list = {
	count = 1
}
slot1[2] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "被击沉时恢复全队其他角色耐久10.0%"
}

return {
	time = 0,
	name = "珍珠之泪",
	init_effect = "",
	id = 6130,
	picture = "",
	desc = "被击沉时恢复全队其他角色耐久10%",
	stack = 1,
	color = "blue",
	icon = 6130,
	last_effect = ""
}
