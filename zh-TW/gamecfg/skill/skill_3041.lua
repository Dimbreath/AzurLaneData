slot1.offset = {
	0,
	-2,
	0
}
slot0.aniEffect = {
	effect = "jineng"
}
slot2.arg_list = {
	buff_id = 3040,
	shipType = 6
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetPlayerByType"
}
slot2.arg_list = {
	buff_id = 3040,
	shipType = 7
}
slot1[2] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetPlayerByType"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "制空支援",
	cd = 0,
	picture = "0",
	desc = "每次执行空袭后提高所有己方航母航空",
	painting = 1,
	id = 3041,
	castCV = "skill"
}
