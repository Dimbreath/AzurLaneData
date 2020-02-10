slot2.trigger = {
	"onStartGame"
}
slot3.ship_tag_list = {
	"Division 6"
}
slot2.arg_list = {
	check_target = "TargetShipTag",
	minTargetNumber = 2,
	skill_id = 10770,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "六驱精锐·{namecode:11}"
}
slot0[2] = {
	desc = "六驱精锐·{namecode:11}"
}
slot0[3] = {
	desc = "六驱精锐·{namecode:11}"
}
slot0[4] = {
	desc = "六驱精锐·{namecode:11}"
}
slot0[5] = {
	desc = "六驱精锐·{namecode:11}"
}
slot0[6] = {
	desc = "六驱精锐·{namecode:11}"
}
slot0[7] = {
	desc = "六驱精锐·{namecode:11}"
}
slot0[8] = {
	desc = "六驱精锐·{namecode:11}"
}
slot0[9] = {
	desc = "六驱精锐·{namecode:11}"
}
slot0[10] = {
	desc = "六驱精锐·{namecode:11}"
}

return {
	desc_get = "与任意第六驱逐舰队成员({namecode:12}、{namecode:13}、{namecode:14})同时出击时，炮击、雷击、装填提升5.0%(满级15.0%)，效果不叠加",
	name = "六驱精锐·{namecode:11}",
	init_effect = "",
	id = 10770,
	time = 0,
	picture = "",
	desc = "与任意第六驱逐舰队成员({namecode:12}、{namecode:13}、{namecode:14})同时出击时，炮击、雷击、装填提升$1，效果不叠加",
	stack = 1,
	color = "red",
	icon = 10770,
	last_effect = ""
}
