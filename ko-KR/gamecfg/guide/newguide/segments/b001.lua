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
	text = "신병, 지금부터 아마존이 함대 운영을 가르쳐 주겠어!",
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
	text = "우선 <color=#ff7d36>스틱을 당겨서</color> 함선을 움직여 보도록!",
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
	text = "전열의 <color=#ff7d36>선봉함대</color>는 함포를 사용해서 <color=#ff7d36>자동으로 공격</color>해.",
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
	text = "다음은 버튼을 눌러서 <color=#ff7d36>어뢰를 발사</color> 해보자!",
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
	text = "방어력이 높은 적을 상대할 땐 후열 주력함대의 <color=#ff7d36>주포</color>로 공격하는 게 효과적이야!",
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
	text = "버튼을 누르면 주포를 발사할 수 있어! <color=#ff7d36>버튼을 누르고 있으면</color>수동 조준도 가능하다고!",
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
