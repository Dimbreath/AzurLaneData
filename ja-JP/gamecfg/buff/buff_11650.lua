slot2.trigger = {
	"onStartGame"
}
slot3.check_target = {
	"TargetNationalityFriendly",
	"TargetShipTypeFriendly"
}
slot3.ship_type_list = {
	6,
	7
}
slot2.arg_list = {
	buff_id = 11651,
	nationality = 1,
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
	6,
	7
}
slot2.arg_list = {
	minTargetNumber = 1,
	nationality = 1,
	skill_id = 11650
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onFoeAircraftDying"
}
slot2.arg_list = {
	skill_id = 11651,
	killer = "child"
}
slot1[3] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onFoeAircraftDying"
}
slot2.arg_list = {
	killer = "child",
	countTarget = 5,
	countType = 11650
}
slot1[4] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	count = 1,
	countType = 11650
}
slot1[5] = {
	type = "BattleBuffCancelBuff"
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
	desc_get = "出击时，队友中每有一个白鹰联邦正航或轻母，自身航空、防空属性上升$1,自身舰载机击落敌方飞机时，自身航空额外提高$2（该效果最高叠加5层）",
	name = "航空阵列",
	init_effect = "",
	id = 11650,
	time = 0,
	picture = "",
	desc = "出击时，队友中每有一个白鹰联邦正航或轻母，自身航空、防空属性上升$1,自身舰载机击落敌方飞机时，自身航空额外提高$2（该效果最高叠加5层）",
	stack = 1,
	color = "yellow",
	icon = 11650,
	last_effect = ""
}
