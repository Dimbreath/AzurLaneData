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
	0,
	0,
	0
}
slot4[1] = {}
slot3.cld_list = {}

function slot3.centerPosFun(slot0)
	return Vector3(2.5, -1.8, 0.5)
end

function slot3.rotationFun(slot0)
	return Vector3(0, 192, 0)
end

slot2.arg_list = {
	effect = "shield02",
	count = 10,
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
	5,
	7,
	10
}
slot5.offset = {
	1.02,
	0,
	1.22
}
slot4[1] = {}
slot3.cld_list = {}

function slot3.centerPosFun(slot0)
	slot1 = slot0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST

	return Vector3(math.sin(slot1) * 5, -1.5, math.cos(slot1) * 3.5)
end

function slot3.rotationFun(slot0)
	return Vector3(0, slot0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 90, 0)
end

slot2.arg_list = {
	effect = "shield02",
	count = 10,
	do_when_hit = "intercept",
	bulletType = 1
}
slot1[2] = {
	id = 2,
	type = "BattleBuffShieldWall"
}
slot0.effect_list = {}

return {
	time = 12,
	name = "盾牌",
	init_effect = "",
	picture = "",
	desc = "盾牌",
	stack = 1,
	id = 12621,
	icon = 12620,
	last_effect = ""
}
