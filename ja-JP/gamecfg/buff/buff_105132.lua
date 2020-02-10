slot2.trigger = {
	"onAttach"
}
slot3.buff_id_list = {
	105131
}
slot2.arg_list = {}
slot1[1] = {
	type = "BattleBuffCleanse"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 105132,
	time = 7
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 105130,
	quota = 1,
	time = 8
}
slot1[3] = {
	type = "BattleBuffAddBuff"
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
	time = 10,
	name = "MP清零的「EXPLOSION」",
	init_effect = "",
	id = 105132,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 105130,
	last_effect = ""
}
