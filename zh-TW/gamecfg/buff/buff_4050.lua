slot2.trigger = {
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
	return Vector3(3, -1.8, 0.5)
end

function slot3.rotationFun(slot0)
	return Vector3(0, 192, 0)
end

slot2.arg_list = {
	effect = "shield02",
	count = 12,
	do_when_hit = "intercept",
	bulletType = 1
}
slot1[1] = {
	id = 1,
	type = "BattleBuffShieldWall"
}
slot0.effect_list = {}
slot0[1] = {
	time = 5
}
slot0[2] = {
	time = 6
}
slot0[3] = {
	time = 7
}
slot0[4] = {
	time = 8
}
slot0[5] = {
	time = 9
}
slot0[6] = {
	time = 10
}
slot0[7] = {
	time = 11
}
slot0[8] = {
	time = 12
}
slot0[9] = {
	time = 13
}
slot0[10] = {
	time = 15
}

return {
	time = 5,
	name = "正面装甲",
	init_effect = "",
	id = 4050,
	picture = "",
	desc = "正面装甲",
	stack = 1,
	color = "blue",
	icon = 4050,
	last_effect = ""
}
