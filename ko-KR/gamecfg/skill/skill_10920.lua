slot1.offset = {
	0,
	-2,
	0
}
slot0.aniEffect = {
	effect = "jineng"
}
slot2.arg_list = {
	buff_id = 10921,
	shipType = 4
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetPlayerByType"
}
slot2.arg_list = {
	buff_id = 10921,
	shipType = 5
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
	name = "T字战法",
	cd = 0,
	picture = "0",
	desc = "队伍中战巡,战列伤害提高3.0%（15.0%）",
	painting = 1,
	id = 10920,
	castCV = "skill"
}
