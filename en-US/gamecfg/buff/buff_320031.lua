slot2.trigger = {
	"onUpdate"
}
slot5.box = {
	5,
	7,
	10
}
slot5.offset = {
	2,
	0,
	-2
}
slot4[1] = {}
slot3.cld_list = {}

function slot3.centerPosFun(slot0)
	return Vector3(0.08, 1, -1.78)
end

function slot3.rotationFun(slot0)
	return Vector3(0, -90, 0)
end

slot2.arg_list = {
	effect = "shield02",
	count = 5,
	do_when_hit = "intercept",
	bulletType = 1
}
slot1[1] = {
	id = 1,
	type = "BattleBuffShieldWall"
}
slot2.trigger = {
	"onUpdate"
}
slot5.box = {
	4,
	6,
	9
}
slot5.offset = {
	2,
	0,
	-2
}
slot4[1] = {}
slot3.cld_list = {}

function slot3.centerPosFun(slot0)
	return Vector3(0.06, 1, 2.97)
end

function slot3.rotationFun(slot0)
	return Vector3(0, 90, 0)
end

slot2.arg_list = {
	effect = "shield02",
	count = 5,
	do_when_hit = "intercept",
	bulletType = 1
}
slot1[2] = {
	id = 2,
	type = "BattleBuffShieldWall"
}
slot0.effect_list = {}

return {
	time = 8,
	name = "侧面装甲",
	init_effect = "",
	picture = "",
	desc = "侧面装甲",
	stack = 1,
	id = 320031,
	icon = 320031,
	last_effect = ""
}
