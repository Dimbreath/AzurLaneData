slot2.trigger = {
	"onFlagShip"
}
slot2.arg_list = {
	check_target = "TargetNationalityFriendly",
	minTargetNumber = 4,
	skill_id = 40250,
	nationality = 2
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "庞德喵：英系数量",
	init_effect = "",
	id = 40250,
	picture = "",
	desc = "该入口提供战外挂载到战内",
	stack = 1,
	color = "yellow",
	icon = 40250,
	last_effect = ""
}
