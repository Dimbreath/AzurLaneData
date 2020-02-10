slot2.code = {
	"HideSkillUI"
}
slot3[1] = {
	ishide = true,
	path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_1"
}
slot3[2] = {
	ishide = true,
	path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_2"
}
slot3[3] = {
	ishide = true,
	path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_3"
}
slot2.hideui = {}
slot1[1] = {
	alpha = 0.34
}
slot2.code = {
	"ShowStick"
}
slot2.style = {
	text = "新兵、今からこのアマゾンが艦隊運動を教えてやるわ！",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot1[2] = {
	alpha = 0.34
}
slot2.code = {
	"ShowStick"
}
slot2.style = {
	text = "まずは<color=#ff7d36>スティックを引っ張って</color>艦を動かしなさい！",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot3.triggerType = {
	4
}
slot2.ui = {
	path = "/UICamera/Canvas/UIMain/CombatUI(Clone)/Stick/Area"
}
slot1[3] = {
	alpha = 0.34
}
slot2.code = {
	"ShowSkill_2"
}
slot2.style = {
	text = "前列の<color=#ff7d36>前衛艦隊</color>は艦砲を使って<color=#ff7d36>自動で攻撃</color>してくれるわ！",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot1[4] = {
	alpha = 0.34
}
slot2.code = {
	"ShowSkill_2"
}
slot3[1] = {
	ishide = false,
	path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_2"
}
slot2.hideui = {}
slot1[5] = {
	alpha = 0.34
}
slot2.code = {
	"ShowSkill_2"
}
slot2.style = {
	text = "次はボタンをタップして<color=#ff7d36>魚雷発射</color>よ！",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot3.triggerType = {
	3
}
slot2.ui = {
	path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_2/ActCtl"
}
slot1[6] = {
	alpha = 0.34
}
slot2.code = {
	"ShowSkill_1"
}
slot2.style = {
	text = "硬い敵相手には後列の主力艦隊の<color=#ff7d36>主砲砲撃</color>が有効よ！",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot1[7] = {
	alpha = 0.34
}
slot2.code = {
	"ShowSkill_1"
}
slot3[1] = {
	ishide = false,
	path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_1"
}
slot2.hideui = {}
slot1[8] = {
	alpha = 0.34
}
slot2.code = {
	"ShowSkill_1"
}
slot2.style = {
	text = "ボタンをタップすると主砲発射よ！<color=#ff7d36>ボタンを押し続ける</color>と手動照準もできるわ！",
	mode = 2,
	dir = 1,
	posY = 0,
	posX = 0
}
slot3.triggerType = {
	3
}
slot2.ui = {
	path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_1/ActCtl"
}
slot1[9] = {
	alpha = 0.34
}
slot0.events = {}

return {
	id = "B001"
}
