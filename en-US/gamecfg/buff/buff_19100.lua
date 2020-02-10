slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 19100,
	time = 30,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {}
slot0[2] = {}
slot0[3] = {}
slot0[4] = {}
slot0[5] = {}
slot0[6] = {}
slot0[7] = {}
slot0[8] = {}
slot0[9] = {}
slot0[10] = {}

return {
	desc_get = "每隔30秒，生成护盾，由内往外分为三组，由内往外各层的护盾分别阻挡6发，8发，14发子弹，护盾持续8秒(满级18秒)",
	name = "全方位装甲",
	init_effect = "",
	id = 19100,
	time = 0,
	picture = "",
	desc = "每隔30秒，生成护盾，由内往外分为三组，由内往外各层的护盾分别阻挡6发，8发，14发子弹，护盾持续$1秒",
	stack = 1,
	color = "blue",
	icon = 19100,
	last_effect = ""
}
