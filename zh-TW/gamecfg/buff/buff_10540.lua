slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	minTargetNumber = 1,
	buff_id = 10541,
	check_target = "TargetNationalityFriendly",
	nationality = 1,
	isBuffStackByCheckTarget = true
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	check_target = "TargetNationalityFriendly",
	minTargetNumber = 1,
	skill_id = 10540,
	nationality = 1
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot1.addition = {
	"1.0%(+0.4%)"
}
slot0[1] = {
	desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升1.0%"
}
slot1.addition = {
	"1.4%(+0.4%)"
}
slot0[2] = {
	desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升1.4%"
}
slot1.addition = {
	"1.8%(+0.4%)"
}
slot0[3] = {
	desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升1.8%"
}
slot1.addition = {
	"2.2%(+0.4%)"
}
slot0[4] = {
	desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升2.2%"
}
slot1.addition = {
	"2.6%(+0.4%)"
}
slot0[5] = {
	desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升2.6%"
}
slot1.addition = {
	"3.0%(+0.5%)"
}
slot0[6] = {
	desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升3.0%"
}
slot1.addition = {
	"3.5%(+0.5%)"
}
slot0[7] = {
	desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升3.5%"
}
slot1.addition = {
	"4.0%(+0.5%)"
}
slot0[8] = {
	desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升4.0%"
}
slot1.addition = {
	"4.5%(+0.5%)"
}
slot0[9] = {
	desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升4.5%"
}
slot1.addition = {
	"5.0%"
}
slot0[10] = {
	desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升5.0%"
}

return {
	desc_get = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升1.0%(满级5.0%)",
	name = "皇家同盟",
	init_effect = "",
	id = 10540,
	time = 0,
	picture = "",
	desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、装填、机动属性上升$1",
	stack = 1,
	color = "red",
	icon = 10540,
	last_effect = ""
}
