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
	count = 20,
	do_when_hit = "intercept",
	bulletType = 1
}
slot1[1] = {
	id = 1,
	type = "BattleBuffShieldWall"
}
slot0.effect_list = {}

return {
	time = 10,
	name = "正面装甲",
	init_effect = "",
	picture = "",
	desc = "正面装甲",
	stack = 1,
	id = 7035,
	icon = 7035,
	last_effect = ""
}
