slot1.offset = {
	0,
	-2,
	0
}
slot0.aniEffect = {
	effect = "jineng"
}
slot2.arg_list = {
	buff_id = 2020
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetAllHelp"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "装填号令",
	cd = 0,
	picture = "0",
	desc = "每隔一定时间，有機率发动，提高全队装填属性",
	painting = 1,
	id = 2021,
	castCV = "skill"
}
