slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 10310,
	target = "TargetSelf",
	time = 35
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot1.addition = {
	"35(-2)",
	"通常弹"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 10310,
	target = "TargetSelf",
	time = 35
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[1] = {
	desc = "每35秒，对距离最远的敌人额外发动一轮必定暴击的专属通常弹炮击(威力依据技能等级)"
}
slot1.addition = {
	"33(-2)",
	"通常弹"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 10310,
	target = "TargetSelf",
	time = 33
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[2] = {
	desc = "每33秒，对距离最远的敌人额外发动一轮必定暴击的专属通常弹炮击(威力依据技能等级)"
}
slot1.addition = {
	"31(-2)",
	"通常弹"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 10310,
	target = "TargetSelf",
	time = 31
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[3] = {
	desc = "每31秒，对距离最远的敌人额外发动一轮必定暴击的专属通常弹炮击(威力依据技能等级)"
}
slot1.addition = {
	"29(-2)",
	"通常弹"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 10310,
	target = "TargetSelf",
	time = 29
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[4] = {
	desc = "每29秒，对距离最远的敌人额外发动一轮必定暴击的专属通常弹炮击(威力依据技能等级)"
}
slot1.addition = {
	"27(-2)",
	"通常弹"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 10310,
	target = "TargetSelf",
	time = 27
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[5] = {
	desc = "每27秒，对距离最远的敌人额外发动一轮必定暴击的专属通常弹炮击(威力依据技能等级)"
}
slot1.addition = {
	"25(-2)",
	"穿甲弹"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 10310,
	target = "TargetSelf",
	time = 25
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[6] = {
	desc = "每25秒，对距离最远的敌人额外发动一轮必定暴击的专属穿甲弹炮击(威力依据技能等级)"
}
slot1.addition = {
	"23(-2)",
	"穿甲弹"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 10310,
	target = "TargetSelf",
	time = 23
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[7] = {
	desc = "每23秒，对距离最远的敌人额外发动一轮必定暴击的专属穿甲弹炮击(威力依据技能等级)"
}
slot1.addition = {
	"21(-3)",
	"穿甲弹"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 10310,
	target = "TargetSelf",
	time = 21
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[8] = {
	desc = "每21秒，对距离最远的敌人额外发动一轮必定暴击的专属穿甲弹炮击(威力依据技能等级)"
}
slot1.addition = {
	"18(-3)",
	"穿甲弹"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 10310,
	target = "TargetSelf",
	time = 18
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[9] = {
	desc = "每18秒，对距离最远的敌人额外发动一轮必定暴击的专属穿甲弹炮击(威力依据技能等级)"
}
slot1.addition = {
	"15",
	"穿甲弹"
}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 10310,
	target = "TargetSelf",
	time = 15
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[10] = {
	desc = "每15秒，对距离最远的敌人额外发动一轮必定暴击的专属穿甲弹炮击(威力依据技能等级)"
}

return {
	desc_get = "每35秒(满级15秒)，对距离最远的敌人额外发动一轮必定暴击的专属炮击(威力、弹药依据技能等级)",
	name = "神射手",
	init_effect = "",
	id = 10310,
	time = 0,
	picture = "",
	desc = "每$1秒，对距离最远的敌人额外发动一轮必定暴击的专属$2炮击(威力依据技能等级)",
	stack = 1,
	color = "red",
	icon = 10310,
	last_effect = ""
}
