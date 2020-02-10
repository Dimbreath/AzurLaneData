slot2.trigger = {
	"onDying"
}
slot2.arg_list = {
	skill_id = 11011,
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

return {
	time = 0,
	name = "铁底湾之夜",
	init_effect = "",
	picture = "",
	desc = "受到致命伤害时不会阵亡，5秒内回避所有伤害",
	stack = 1,
	id = 11014,
	icon = 11014,
	last_effect = ""
}
