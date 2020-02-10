slot2.trigger = {
	"onAllInStrikeSteady"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 10830,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "航空预备"
}
slot0[2] = {
	desc = "航空预备"
}
slot0[3] = {
	desc = "航空预备"
}
slot0[4] = {
	desc = "航空预备"
}
slot0[5] = {
	desc = "航空预备"
}
slot0[6] = {
	desc = "航空预备"
}
slot0[7] = {
	desc = "航空预备"
}
slot0[8] = {
	desc = "航空预备"
}
slot0[9] = {
	desc = "航空预备"
}
slot0[10] = {
	desc = "航空预备"
}

return {
	desc_get = "第一次执行空中支援时，额外进行一轮航空弹幕攻击(威力随技能等级提升)，每场战斗只能触发1次",
	name = "航空预备",
	init_effect = "",
	id = 10830,
	time = 0,
	picture = "",
	desc = "第一次执行空中支援时，额外进行一轮航空弹幕攻击$1，每场战斗只能触发1次",
	stack = 1,
	color = "red",
	icon = 10830,
	last_effect = ""
}
