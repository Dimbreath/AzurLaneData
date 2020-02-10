slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 10930,
	target = "TargetSelf",
	time = 10
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	count = 0,
	delay = 11
}
slot1[2] = {
	type = "BattleBuffCancelBuff"
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
	desc_get = "战斗开始10秒后使用探照灯，随后每20秒有20.0%概率使用探照灯，探照灯将导致比叡承受全体主力舰队受到的20.0%（满级50.0%）伤害，并使随机一个敌人受到伤害提高8.0%（满级20%），持续8秒",
	name = "威光",
	init_effect = "",
	id = 10930,
	time = 0,
	picture = "",
	desc = "战斗开始10秒后使用探照灯，随后每20秒有20.0%概率使用探照灯，探照灯将导致比叡承受全体主力舰队受到的20.0%（满级50.0%）伤害，并使随机一个敌人受到伤害提高8.0%（满级20%），持续8秒",
	stack = 1,
	color = "yellow",
	icon = 10930,
	last_effect = ""
}
