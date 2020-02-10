slot2.arg_list = {
	weapon_id = 61001,
	delay = 4
}

function slot3.posFun(slot0, slot1, slot2)
	return Vector3(-100, 0, slot1.z) - slot0
end

slot2.casterAniEffect = {
	time = 1,
	effect = "feijiyingzi"
}
slot1[1] = {
	targetAniEffect = "",
	type = "BattleSkillFire",
	target_choise = "TargetHarmRandom"
}
slot2.arg_list = {
	weapon_id = 61002,
	delay = 4
}
slot1[2] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillFire",
	target_choise = "TargetSameToLastEffect"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "大黄蜂-轰炸",
	cd = 0,
	picture = "0",
	aniEffect = "",
	desc = "轰炸",
	painting = 1,
	id = 60010
}
