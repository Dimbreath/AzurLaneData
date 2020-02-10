slot1.offset = {
	0,
	-2,
	0
}
slot0.aniEffect = {
	effect = "jineng"
}
slot2.arg_list = {
	buff_id = 5010
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetHarmRandomByWeight"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "弱点侦测",
	cd = 0,
	picture = "0",
	desc = "弱点侦测",
	painting = 1,
	id = 5011,
	castCV = "skill"
}
