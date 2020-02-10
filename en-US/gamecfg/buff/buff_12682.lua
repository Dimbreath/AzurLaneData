slot2.trigger = {}
slot2.arg_list = {
	buff_id = 12684,
	exceptCaster = true,
	target = "TargetAllHelp"
}
slot1[1] = {
	type = "BattleBuffAura"
}
slot2.trigger = {
	"onTeammateHpRatioUpdate"
}
slot3.check_target = {
	"TargetAllHelp",
	"TargetHelpLeastHP"
}
slot2.arg_list = {
	minTargetNumber = 1,
	targetMaxHPRatio = 0.2,
	quota = 1,
	hpUpperBound = 0.2,
	skill_id = 12681
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "减伤光环",
	init_effect = "jinengchufablue",
	id = 12682,
	picture = "",
	desc = "减伤光环",
	stack = 1,
	color = "red",
	icon = 12682,
	last_effect = ""
}
