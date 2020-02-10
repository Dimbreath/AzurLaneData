slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -0.4,
	attr = "damageRatioBullet"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	add = -12,
	mul = 0
}
slot1[2] = {
	type = "BattleBuffFixVelocity"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 8615,
	target = "TargetSelf"
}
slot1[3] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "2019年2月世界BOSS死亡debuff",
	init_effect = "Darkness",
	id = 8615,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 2120,
	last_effect = ""
}
