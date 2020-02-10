slot2.trigger = {
	"onStartGame"
}
slot3.check_target = {
	"TargetNationalityFriendly",
	"TargetShipTypeFriendly"
}
slot3.ship_type_list = {
	3,
	5
}
slot2.arg_list = {
	buff_id = 11551,
	nationality = 1,
	exceptCaster = true,
	minTargetNumber = 1,
	isBuffStackByCheckTarget = true
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot3.check_target = {
	"TargetNationalityFriendly",
	"TargetShipTypeFriendly"
}
slot3.ship_type_list = {
	3,
	5
}
slot2.arg_list = {
	minTargetNumber = 1,
	nationality = 1,
	exceptCaster = true,
	skill_id = 11550
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
	desc_get = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、机动属性上升$1，最多3层",
	name = "Big Mamie",
	init_effect = "",
	id = 11550,
	time = 0,
	picture = "",
	desc = "出击时，队友中每有一个白鹰联邦角色，自身炮击、防空、机动属性上升$1，最多3层",
	stack = 1,
	color = "red",
	icon = 11550,
	last_effect = ""
}
