slot2.trigger = {
	"onStartGame"
}
slot3.targetTemplateIDList = {
	10100041,
	10100042,
	10100043,
	10100044,
	10100081,
	10100082,
	10100083,
	10100084
}
slot2.arg_list = {
	minTargetNumber = 1,
	skill_id = 101030,
	check_target = "TargetTemplate",
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onStartGame"
}
slot3.targetTemplateIDList = {
	10100041,
	10100042,
	10100043,
	10100044,
	10100081,
	10100082,
	10100083,
	10100084
}
slot2.arg_list = {
	check_target = "TargetTemplate",
	skill_id = 101031,
	maxTargetNumber = 0,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffCastSkill"
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
	desc_get = "队伍中存在贝露&翡绿之心时，自身伤害提高，受到伤害提高，队伍中不存在贝露&翡绿之心时，自身受到伤害降低，伤害降低",
	name = "限阻破坏",
	init_effect = "",
	id = 101030,
	time = 0,
	picture = "",
	desc = "队伍中存在贝露&翡绿之心时，自身伤害提高，受到伤害提高，队伍中不存在贝露&翡绿之心时，自身受到伤害降低，伤害降低",
	stack = 1,
	color = "yellow",
	icon = 101030,
	last_effect = ""
}
