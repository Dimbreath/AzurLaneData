slot2.trigger = {
	"onAllInStrikeSteady"
}
slot3.ship_tag_list = {
	"Cleveland-Class"
}
slot2.arg_list = {
	minTargetNumber = 1,
	check_target = "TargetShipTag",
	skill_id = 11920,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onAllInStrikeSteady"
}
slot3.ship_tag_list = {
	"Cleveland-Class"
}
slot2.arg_list = {
	check_target = "TargetShipTag",
	skill_id = 11921,
	maxTargetNumber = 0,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onStartGame"
}
slot3.ship_tag_list = {
	"Cleveland-Class"
}
slot2.arg_list = {
	minTargetNumber = 1,
	check_target = "TargetShipTag",
	skill_id = 11922,
	target = "TargetSelf"
}
slot1[3] = {
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
	desc_get = "队伍中存在克利夫兰级的角色时，机队变化",
	name = "天之骑士",
	init_effect = "",
	id = 11920,
	time = 0,
	picture = "",
	desc = "空袭时额外机队攻击，队伍中存在克利夫兰级的角色时，机队变化",
	stack = 1,
	color = "yellow",
	icon = 11920,
	last_effect = ""
}
