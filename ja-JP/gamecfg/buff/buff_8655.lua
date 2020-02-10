slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	skill_id = 8655,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onAttach"
}
slot3.target = {
	"TargetAllHelp",
	"TargetShipTag"
}
slot3.ship_tag_list = {
	"bossmio"
}
slot2.arg_list = {
	buff_id = 8653
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onAttach"
}
slot3.target = {
	"TargetAllHelp",
	"TargetShipTag"
}
slot3.ship_tag_list = {
	"bossshion"
}
slot2.arg_list = {
	buff_id = 8654
}
slot1[3] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 1,
	attr = "isInvincible"
}
slot1[4] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "boss akua",
	init_effect = "",
	id = 8655,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 8655,
	last_effect = ""
}
