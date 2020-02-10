slot1.offset = {
	0,
	-2,
	0
}
slot0.aniEffect = {
	effect = "jineng"
}
slot2.arg_list = {
	buff_id = 10451
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetSelf"
}
slot2.arg_list = {
	weaponType = "AirAssist"
}
slot1[2] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillWeaponFire",
	target_choise = "TargetHarmRandom"
}
slot0.effect_list = {}
slot3.arg_list = {
	buff_id = 10451
}
slot2[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetSelf"
}
slot3.arg_list = {
	weaponType = "AirAssist"
}
slot2[2] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillWeaponFire",
	target_choise = "TargetHarmRandom"
}
slot1.effect_list = {}
slot0[1] = {}

return {
	uiEffect = "",
	name = "最后的反击",
	cd = 0,
	picture = "0",
	desc = "本舰被击破时，再次发动一轮空袭",
	painting = 1,
	id = 10450,
	castCV = "skill"
}
