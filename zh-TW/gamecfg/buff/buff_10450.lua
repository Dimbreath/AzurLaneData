slot2.trigger = {
	"onDying"
}
slot2.arg_list = {
	skill_id = 10450,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onDying"
}
slot2.arg_list = {
	count = 1
}
slot1[2] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}
slot1.addition = {
	"5(+1)"
}
slot0[1] = {
	desc = "受到致命伤害时不会阵亡，5秒内回避所有伤害，同时立刻发动一轮空袭，每场战斗只能触发1次"
}
slot1.addition = {
	"6(+1)"
}
slot0[2] = {
	desc = "受到致命伤害时不会阵亡，6秒内回避所有伤害，同时立刻发动一轮空袭，每场战斗只能触发1次"
}
slot1.addition = {
	"7(+1)"
}
slot0[3] = {
	desc = "受到致命伤害时不会阵亡，7秒内回避所有伤害，同时立刻发动一轮空袭，每场战斗只能触发1次"
}
slot1.addition = {
	"8(+1)"
}
slot0[4] = {
	desc = "受到致命伤害时不会阵亡，8秒内回避所有伤害，同时立刻发动一轮空袭，每场战斗只能触发1次"
}
slot1.addition = {
	"9(+1)"
}
slot0[5] = {
	desc = "受到致命伤害时不会阵亡，9秒内回避所有伤害，同时立刻发动一轮空袭，每场战斗只能触发1次"
}
slot1.addition = {
	"10(+1)"
}
slot0[6] = {
	desc = "受到致命伤害时不会阵亡，10秒内回避所有伤害，同时立刻发动一轮空袭，每场战斗只能触发1次"
}
slot1.addition = {
	"11(+1)"
}
slot0[7] = {
	desc = "受到致命伤害时不会阵亡，11秒内回避所有伤害，同时立刻发动一轮空袭，每场战斗只能触发1次"
}
slot1.addition = {
	"12(+1)"
}
slot0[8] = {
	desc = "受到致命伤害时不会阵亡，12秒内回避所有伤害，同时立刻发动一轮空袭，每场战斗只能触发1次"
}
slot1.addition = {
	"13(+2)"
}
slot0[9] = {
	desc = "受到致命伤害时不会阵亡，13秒内回避所有伤害，同时立刻发动一轮空袭，每场战斗只能触发1次"
}
slot1.addition = {
	"15"
}
slot0[10] = {
	desc = "受到致命伤害时不会阵亡，15秒内回避所有伤害，同时立刻发动一轮空袭，每场战斗只能触发1次"
}

return {
	desc_get = "受到致命伤害时不会阵亡，5秒(满级15秒)内回避所有伤害，同时立刻发动一轮空袭，每场战斗只能触发1次",
	name = "最后的反击",
	init_effect = "",
	id = 10450,
	time = 0,
	picture = "",
	desc = "受到致命伤害时不会阵亡，$1秒内回避所有伤害，同时立刻发动一轮空袭，每场战斗只能触发1次",
	stack = 1,
	color = "blue",
	icon = 10450,
	last_effect = ""
}
