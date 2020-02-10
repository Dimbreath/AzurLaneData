slot1.offset = {
	0,
	-2,
	0
}
slot0.aniEffect = {
	effect = "jineng"
}
slot2.arg_list = {
	buff_id = 3050
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetPlayerVanguardFleet"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "航空掩护",
	cd = 0,
	picture = "0",
	desc = "每次执行空袭后降低己方先锋受到伤害",
	painting = 1,
	id = 3051,
	castCV = "skill"
}
