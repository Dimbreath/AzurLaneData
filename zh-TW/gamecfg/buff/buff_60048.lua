slot2.trigger = {
	"onUpdate",
	"onOtherBuffRemove"
}
slot2.arg_list = {
	skill_id = 60028,
	removedBuffID_enterCD = 60049,
	target = "TargetSelf",
	time = 10
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "测试-盾墙-触发",
	init_effect = "Health",
	picture = "",
	desc = "盾墙",
	stack = 1,
	id = 60048,
	icon = 60048,
	last_effect = ""
}
