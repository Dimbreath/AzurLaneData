slot2.trigger = {
	"onFlagShip"
}
slot2.arg_list = {
	check_target = "TargetPlayerMainFleet",
	maxTargetNumber = 1,
	skill_id = 40121
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "进入战斗时，如果主力舰队仅剩下一艘航母（没有其他主力舰），触发技能，第一轮空袭装填加快，空袭时额外鱼雷机",
	init_effect = "",
	id = 40120,
	picture = "",
	desc = "该入口提供战外挂载到战内",
	stack = 1,
	color = "yellow",
	icon = 40120,
	last_effect = ""
}
