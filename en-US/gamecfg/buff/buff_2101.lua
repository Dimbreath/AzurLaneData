slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 2101,
	target = "TargetSelf",
	time = 35
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot1.addition = {
	"35(-1)"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 2101,
	target = "TargetSelf",
	time = 35
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[1] = {
	desc = "每隔35秒，朝前方发射3发鱼雷(威力依据技能等级)"
}
slot1.addition = {
	"34(-1)"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 2101,
	target = "TargetSelf",
	time = 34
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[2] = {
	desc = "每隔34秒，朝前方发射3发鱼雷(威力依据技能等级)"
}
slot1.addition = {
	"33(-2)"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 2101,
	target = "TargetSelf",
	time = 33
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[3] = {
	desc = "每隔33秒，朝前方发射3发鱼雷(威力依据技能等级)"
}
slot1.addition = {
	"31(-1)"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 2101,
	target = "TargetSelf",
	time = 31
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[4] = {
	desc = "每隔31秒，朝前方发射3发鱼雷(威力依据技能等级)"
}
slot1.addition = {
	"30(-1)"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 2101,
	target = "TargetSelf",
	time = 30
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[5] = {
	desc = "每隔30秒，朝前方发射3发鱼雷(威力依据技能等级)"
}
slot1.addition = {
	"29(-3)"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 2101,
	target = "TargetSelf",
	time = 29
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[6] = {
	desc = "每隔29秒，朝前方发射3发鱼雷(威力依据技能等级)"
}
slot1.addition = {
	"26(-1)"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 2101,
	target = "TargetSelf",
	time = 26
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[7] = {
	desc = "每隔26秒，朝前方发射3发鱼雷(威力依据技能等级)"
}
slot1.addition = {
	"25(-2)"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 2101,
	target = "TargetSelf",
	time = 25
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[8] = {
	desc = "每隔25秒，朝前方发射3发鱼雷(威力依据技能等级)"
}
slot1.addition = {
	"23(-3)"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 2101,
	target = "TargetSelf",
	time = 23
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[9] = {
	desc = "每隔23秒，朝前方发射3发鱼雷(威力依据技能等级)"
}
slot1.addition = {
	"20"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 2101,
	target = "TargetSelf",
	time = 20
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[10] = {
	desc = "每隔20秒，朝前方发射3发鱼雷(威力依据技能等级)"
}

return {
	desc_get = "每隔35秒(满级20秒)，朝前方发射3发鱼雷(威力依据技能等级)",
	name = "鱼雷发射",
	init_effect = "",
	id = 2101,
	time = 0,
	picture = "",
	desc = "每隔$1秒，朝前方发射3发带鱼雷(威力依据技能等级)",
	stack = 1,
	color = "red",
	icon = 2100,
	last_effect = ""
}
