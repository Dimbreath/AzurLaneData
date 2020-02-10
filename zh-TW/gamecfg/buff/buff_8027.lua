slot2.trigger = {
	"onStack",
	"onUpdate"
}
slot5.box = {
	4,
	6,
	9
}
slot5.offset = {
	1.02,
	0,
	1.22
}
slot4[1] = {}
slot3.cld_list = {}

function slot3.centerPosFun(slot0)
	slot1 = slot0 * 3

	return Vector3(math.sin(slot1) * 3, 0.75, math.cos(slot1) * 3)
end

function slot3.rotationFun(slot0)
	return Vector3(0, slot0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
end

slot2.arg_list = {
	effect = "shield02",
	count = 15,
	do_when_hit = "intercept",
	bulletType = 1
}
slot1[1] = {
	id = 1,
	type = "BattleBuffShieldWall"
}
slot2.trigger = {
	"onStack",
	"onUpdate"
}
slot5.box = {
	4,
	6,
	9
}
slot5.offset = {
	1.02,
	0,
	1.22
}
slot4[1] = {}
slot3.cld_list = {}

function slot3.centerPosFun(slot0)
	slot1 = slot0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_2

	return Vector3(math.sin(slot1) * 3, 0.75, math.cos(slot1) * 3)
end

function slot3.rotationFun(slot0)
	return Vector3(0, slot0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 210, 0)
end

slot2.arg_list = {
	effect = "shield02",
	count = 15,
	do_when_hit = "intercept",
	bulletType = 1
}
slot1[2] = {
	id = 2,
	type = "BattleBuffShieldWall"
}
slot2.trigger = {
	"onStack",
	"onUpdate"
}
slot5.box = {
	4,
	6,
	9
}
slot5.offset = {
	1.02,
	0,
	1.22
}
slot4[1] = {}
slot3.cld_list = {}

function slot3.centerPosFun(slot0)
	slot1 = slot0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_4

	return Vector3(math.sin(slot1) * 3, 0.75, math.cos(slot1) * 3)
end

function slot3.rotationFun(slot0)
	return Vector3(0, slot0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 20, 0)
end

slot2.arg_list = {
	effect = "shield02",
	count = 15,
	do_when_hit = "intercept",
	bulletType = 1
}
slot1[3] = {
	id = 3,
	type = "BattleBuffShieldWall"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "不破之盾",
	init_effect = "",
	picture = "",
	desc = "第5章重巡使用盾buff",
	stack = 1,
	id = 8027,
	icon = 8027,
	last_effect = ""
}
