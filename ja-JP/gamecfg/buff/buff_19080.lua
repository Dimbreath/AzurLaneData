slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 19080
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -0.12,
	attr = "igniteResist"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -3,
	attr = "igniteShorten"
}
slot1[3] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}
slot0[1] = {}
slot0[2] = {}
slot0[3] = {}
slot0[4] = {}
slot0[5] = {}
slot0[6] = {}
slot0[7] = {}
slot0[8] = {}
slot0[9] = {}
slot0[10] = {}

return {
	desc_get = "受到穿甲弹伤害降低15.0%(满级30.0%)",
	name = "特殊护甲",
	init_effect = "",
	id = 19080,
	time = 0,
	picture = "",
	desc = "受到穿甲弹伤害降低$1",
	stack = 1,
	color = "blue",
	icon = 19080,
	last_effect = ""
}
