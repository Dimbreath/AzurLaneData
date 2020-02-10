slot2.trigger = {
	"onDying"
}
slot2.arg_list = {
	skill_id = 60011,
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
	name = "测试-印第安纳波利斯-技能触发被动",
	init_effect = "",
	picture = "",
	desc = "死亡原子弹",
	stack = 1,
	id = 60019,
	icon = 60019,
	last_effect = ""
}
