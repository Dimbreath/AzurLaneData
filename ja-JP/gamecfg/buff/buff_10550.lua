slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 10550,
	time = 35,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot1.addition = {
	"1.0%(+0.2%)"
}
slot0[1] = {
	desc = "每隔35秒，回复全队耐久，回复量为{namecode:98}耐久的1.0%"
}
slot1.addition = {
	"1.2%(+0.2%)"
}
slot0[2] = {
	desc = "每隔35秒，回复全队耐久，回复量为{namecode:98}耐久的1.2%"
}
slot1.addition = {
	"1.4%(+0.2%)"
}
slot0[3] = {
	desc = "每隔35秒，回复全队耐久，回复量为{namecode:98}耐久的1.4%"
}
slot1.addition = {
	"1.6%(+0.2%)"
}
slot0[4] = {
	desc = "每隔35秒，回复全队耐久，回复量为{namecode:98}耐久的1.6%"
}
slot1.addition = {
	"1.8%(+0.2%)"
}
slot0[5] = {
	desc = "每隔35秒，回复全队耐久，回复量为{namecode:98}耐久的1.8%"
}
slot1.addition = {
	"2.0%(+0.2%)"
}
slot0[6] = {
	desc = "每隔35秒，回复全队耐久，回复量为{namecode:98}耐久的2.0%"
}
slot1.addition = {
	"2.2%(+0.2%)"
}
slot0[7] = {
	desc = "每隔35秒，回复全队耐久，回复量为{namecode:98}耐久的2.2%"
}
slot1.addition = {
	"2.4%(+0.3%)"
}
slot0[8] = {
	desc = "每隔35秒，回复全队耐久，回复量为{namecode:98}耐久的2.4%"
}
slot1.addition = {
	"2.7%(+0.3%)"
}
slot0[9] = {
	desc = "每隔35秒，回复全队耐久，回复量为{namecode:98}耐久的2.7%"
}
slot1.addition = {
	"3.0%"
}
slot0[10] = {
	desc = "每隔35秒，回复全队耐久，回复量为{namecode:98}耐久的3.0%"
}

return {
	desc_get = "每隔35秒，回复全队耐久，回复量为{namecode:98}耐久的1.0%(满级3.0%)",
	name = "后勤维修",
	init_effect = "",
	id = 10550,
	time = 0,
	picture = "",
	desc = "每隔35秒，回复全队耐久，回复量为{namecode:98}耐久的$1",
	stack = 1,
	color = "blue",
	icon = 10550,
	last_effect = "Health"
}
