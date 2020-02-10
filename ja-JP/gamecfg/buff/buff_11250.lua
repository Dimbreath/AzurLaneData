slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 11251,
	target = "TargetSelf",
	time = 20
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 11251,
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
	desc_get = "存活时，队伍中曾参与萨沃岛海战的角色(鸟海、古鹰、加古、青叶、衣笠、天龙、夕张、夕凪)炮击、雷击、命中提高$1",
	name = "萨沃岛突袭",
	init_effect = "",
	id = 11250,
	time = 0,
	picture = "",
	desc = "存活时，队伍中曾参与萨沃岛海战的角色(鸟海、古鹰、加古、青叶、衣笠、天龙、夕张、夕凪)炮击、雷击、命中提高$1",
	stack = 1,
	color = "yellow",
	icon = 11250,
	last_effect = ""
}
