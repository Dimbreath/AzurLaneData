slot2.trigger = {
	"onFoeAircraftDying"
}
slot2.arg_list = {
	skill_id = 10640,
	inside = 1,
	target = "TargetSelf",
	time = 1
}
slot1[1] = {
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
	desc_get = "防空圈内，敌方飞机被击落时，自身炮击提高自身基础(面板+装备)防空值的5%/15%，持续8秒，不可叠加",
	name = "铁翼陨灭",
	init_effect = "",
	id = 10640,
	time = 0,
	picture = "",
	desc = "防空圈内，敌方飞机被击落时，自身炮击提高自身基础(面板+装备)防空值的5%/15%，持续8秒，不可叠加",
	stack = 1,
	color = "red",
	icon = 10640,
	last_effect = ""
}
