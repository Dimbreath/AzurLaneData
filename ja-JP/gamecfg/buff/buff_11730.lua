slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 11730,
	target = "TargetSelf",
	time = 15
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	count = 0,
	delay = 16
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
	time = 0,
	name = "LittleStar",
	init_effect = "",
	id = 11730,
	picture = "",
	desc = "战斗开始后15秒发动，提高全队$2炮击、装填、机动属性，持续20秒",
	stack = 1,
	color = "yellow",
	icon = 11730,
	last_effect = ""
}
