slot2.arg_list = {
	number = 10
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillDamage",
	target_choise = "TargetAllHarm"
}
slot2.arg_list = {
	buff_id = 60002
}
slot1[2] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetSameToLastEffect"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "测试3号-伤害加dot",
	cd = 60,
	picture = "0",
	aniEffect = "",
	desc = "测试伤害和buff组合",
	painting = 1,
	id = 60003
}
