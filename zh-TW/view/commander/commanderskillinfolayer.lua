slot0 = class("CommanderSkillInfoLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "CommanderSkillInfoUI"
end

function slot0.init(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)

	slot0.skillNameTxt = slot0:findTF("panel/bg/skill_name"):GetComponent(typeof(Text))
	slot0.skillLevelTxt = slot0:findTF("panel/bg/skill_lv"):GetComponent(typeof(Text))
	slot0.skillDescTxt = slot0:findTF("panel/bg/help_panel/skill_intro"):GetComponent(typeof(Text))
	slot0.skillIcon = slot0:findTF("panel/bg/skill_icon")
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._tf, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("panel/top/btnBack"), function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("panel/ok_button"), function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CONFIRM)
	slot0:updateSkill()
end

function slot0.updateSkill(slot0)
	slot0.skillNameTxt.text = slot0.contextData.skill.getConfig(slot1, "name")
	slot0.skillLevelTxt.text = "Lv." .. slot0.contextData.skill.getLevel(slot1)
	slot0.skillDescTxt.text = slot0.contextData.skill.getConfig(slot1, "desc")

	GetImageSpriteFromAtlasAsync("CommanderSkillIcon/" .. slot0.contextData.skill.getConfig(slot1, "icon"), "", slot0.skillIcon)
end

function slot0.close(slot0)
	slot0:emit(slot0.ON_CLOSE)
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
end

return slot0
