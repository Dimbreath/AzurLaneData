slot2.trigger = {
	"onDying"
}
slot2.arg_list = {
	skill_id = 10080,
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
slot1.addition = {
	"15.0%(+1.1%)"
}
slot0[1] = {
	desc = "被击沉时恢复全队其他角色耐久15.0%"
}
slot1.addition = {
	"16.1%(+1.1%)"
}
slot0[2] = {
	desc = "被击沉时恢复全队其他角色耐久16.1%"
}
slot1.addition = {
	"17.2%(+1.1%)"
}
slot0[3] = {
	desc = "被击沉时恢复全队其他角色耐久17.2%"
}
slot1.addition = {
	"18.3%(+1.1%)"
}
slot0[4] = {
	desc = "被击沉时恢复全队其他角色耐久18.3%"
}
slot1.addition = {
	"19.4%(+1.1%)"
}
slot0[5] = {
	desc = "被击沉时恢复全队其他角色耐久19.4%"
}
slot1.addition = {
	"20.5%(+1.1%)"
}
slot0[6] = {
	desc = "被击沉时恢复全队其他角色耐久20.5%"
}
slot1.addition = {
	"21.6%(+1.1%)"
}
slot0[7] = {
	desc = "被击沉时恢复全队其他角色耐久21.6%"
}
slot1.addition = {
	"22.7%(+1.1%)"
}
slot0[8] = {
	desc = "被击沉时恢复全队其他角色耐久22.7%"
}
slot1.addition = {
	"23.8%(+1.2%)"
}
slot0[9] = {
	desc = "被击沉时恢复全队其他角色耐久23.8%"
}
slot1.addition = {
	"25.0%"
}
slot0[10] = {
	desc = "被击沉时恢复全队其他角色耐久25.0%"
}

return {
	desc_get = "被击沉时恢复全队其他角色耐久15.0%(满级25.0%)",
	name = "战争之殇",
	init_effect = "",
	id = 10080,
	time = 0,
	picture = "",
	desc = "被击沉时恢复全队其他角色耐久$1",
	stack = 1,
	color = "blue",
	icon = 10080,
	last_effect = "Health"
}
