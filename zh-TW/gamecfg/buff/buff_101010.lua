slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	check_target = "TargetNationalityFriendly",
	minTargetNumber = 1,
	nationality = 101,
	exceptCaster = true,
	skill_id = 101010
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	buff_id = 101012,
	check_target = "TargetNationalityFriendly",
	minTargetNumber = 1,
	nationality = 101,
	exceptCaster = true,
	isBuffStackByCheckTarget = true
}
slot1[2] = {
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
	desc_get = "出击时，若队伍中有超次元海王星阵营角色，自身伤害提高，受到伤害降低，每有1位超次元海王星阵营角色，自身伤害额外提高，受到伤害额外降低",
	name = "主人公补正",
	init_effect = "",
	id = 101010,
	time = 0,
	picture = "",
	desc = "出击时，若队伍中有超次元海王星阵营角色，自身伤害提高，受到伤害降低，每有1位超次元海王星阵营角色，自身伤害额外提高，受到伤害额外降低",
	stack = 1,
	color = "yellow",
	icon = 101010,
	last_effect = "Health"
}
