slot1.offset = {
	0,
	-2,
	0
}
slot0.aniEffect = {
	effect = "jineng"
}
slot2.arg_list = {
	buff_id = 103031
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetPlayerVanguardFleet"
}
slot2.arg_list = {
	buff_id = 103032
}
slot1[2] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetPlayerVanguardFleet"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "白虹",
	cd = 0,
	picture = "0",
	desc = "战斗开始后100秒触发，先锋部队的机动提高$1，全体先锋部队回复耐久，恢复量为猫音最大耐久的$2",
	painting = 1,
	id = 103030,
	castCV = "skill"
}
