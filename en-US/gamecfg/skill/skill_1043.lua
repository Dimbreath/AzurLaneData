slot1.offset = {
	0,
	-2,
	0
}
slot0.aniEffect = {
	effect = "jineng"
}
slot2.arg_list = {
	buff_id = 1040,
	shipType = 4
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetPlayerByType"
}
slot2.arg_list = {
	buff_id = 1040,
	shipType = 5
}
slot1[2] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetPlayerByType"
}
slot2.arg_list = {
	buff_id = 1040,
	shipType = 10
}
slot1[3] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetPlayerByType"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "防空指挥·战列舰",
	cd = 0,
	picture = "0",
	desc = "提高舰队中所有战列舰的防空属性",
	painting = 1,
	id = 1043,
	castCV = "skill"
}
