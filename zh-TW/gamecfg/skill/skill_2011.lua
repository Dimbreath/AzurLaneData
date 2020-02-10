slot1.offset = {
	0,
	-2,
	0
}
slot0.aniEffect = {
	effect = "jineng"
}
slot2.arg_list = {
	buff_id = 2010
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetSelf"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "火力全开",
	cd = 0,
	picture = "0",
	desc = "每隔一定时间，有機率发动，提高自身伤害",
	painting = 1,
	id = 2011,
	castCV = "skill"
}
