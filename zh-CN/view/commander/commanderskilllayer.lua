slot0 = class("CommanderSkillLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "CommanderSkillUI"
end

function slot0.init(slot0)
	slot1 = slot0.contextData.skill
	slot0.backBtn = slot0:findTF("top/btnBack")
	slot0.skillInfoName = slot0:findTF("panel/bg/skill_name")
	slot0.skillInfoLv = slot0:findTF("panel/bg/skill_lv")
	slot0.skillInfoIntro = slot0:findTF("panel/bg/help_panel/skill_intro")
	slot0.skillInfoIcon = slot0:findTF("panel/bg/skill_icon")
	slot0.buttonList = slot0:findTF("panel/buttonList")
	slot0.skillDescTF = slot0:findTF("panel/bg/help_panel/Viewport/introTF")
	slot0.skillDescContent = slot0:findTF("panel/bg/help_panel/Viewport/content")

	setText(slot0.skillInfoName, slot1:getConfig("name"))
	setText(slot0.skillInfoLv, "Lv." .. slot1:getLevel())

	slot2 = slot1:getConfig("lv")

	setActive(slot0.skillDescTF, false)

	slot6 = "desc"

	for slot6, slot7 in ipairs(slot1:getConfig(slot6)) do
		setText(findTF(cloneTplTo(slot0.skillDescTF, slot0.skillDescContent), "Lv"), slot2 < slot7[1] and "<color=#a3a2a2>" .. "Lv." .. slot7[1] .. "</color>" or "Lv." .. slot7[1])
		setText(findTF(slot8, "Desc"), slot2 < slot7[1] and "<color=#a3a2a2>" .. slot7[2] .. "</color>" or slot7[2])
	end

	GetImageSpriteFromAtlasAsync("commanderskillicon/" .. slot1:getConfig("icon"), "", slot0.skillInfoIcon)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._tf, function ()
		uv0:emit(uv1.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(slot0, slot0.backBtn, function ()
		uv0:emit(uv1.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("panel/buttonList/ok_button"), function ()
		uv0:emit(uv1.ON_CLOSE)
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
end

function slot0.onBackPressed(slot0)
	triggerButton(slot0.backBtn)
end

return slot0
