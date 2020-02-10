slot2.trigger = {
	"onAttach"
}
slot3.check_target = {
	"TargetPlayerFlagShip",
	"TargetShipTag"
}
slot3.ship_tag_list = {
	"AirDominance_lower"
}
slot2.arg_list = {
	skill_id = 3621,
	maxTargetNumber = 0
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
	desc_get = "在战斗中，若无制空争夺、或我方制空权优势、确保的情况下，自身属性强化",
	name = "I-56",
	init_effect = "jinengchufared",
	id = 3621,
	time = 0,
	picture = "",
	desc = "在战斗中，若无制空争夺、或我方制空权优势、确保的情况下，自身属性强化",
	stack = 1,
	color = "yellow",
	icon = 3620,
	last_effect = ""
}
