slot0 = class("SkillInfoLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "SkillInfoUI"
end

function slot0.init(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)

	slot2 = slot0.contextData.skillOnShip
	slot3 = slot0.contextData.unlockTip
	slot4 = slot0.contextData.fromNewShip

	if not getSkillConfig(slot0.contextData.skillId) then
		return
	end

	slot0.backBtn = slot0:findTF("panel/top/btnBack")
	slot0.skillInfoName = slot0:findTF("panel/bg/skill_name")
	slot0.skillInfoSp = slot0:findTF("panel/bg/skill_sp")
	slot0.skillInfoLv = slot0:findTF("panel/bg/skill_lv")
	slot0.skillInfoIntro = slot0:findTF("panel/bg/help_panel/skill_intro")
	slot0.skillInfoTip = slot0:findTF("panel/bg/skill_tip")
	slot0.skillInfoIcon = slot0:findTF("panel/bg/skill_icon")
	slot0.buttonList = slot0:findTF("panel/buttonList")
	slot0.upgradeBtn = slot0:findTF("panel/buttonList/level_button")

	setText(slot0.skillInfoName, getSkillName(slot1))
	LoadImageSpriteAsync("skillicon/" .. slot5.icon, slot0.skillInfoIcon)
	setText(slot0.skillInfoLv, "Lv." .. (slot2 and slot2.level or 1))

	if slot4 then
		setText(slot0.skillInfoIntro, getSkillDescGet(slot1))
	else
		setText(slot0.skillInfoIntro, getSkillDesc(slot1, slot6))
	end

	setActive(slot0.skillInfoSp, false)
	setActive(slot0.skillInfoTip, false)

	if not slot2 then
		setText(slot0.skillInfoTip, slot3)
		setActive(slot0.upgradeBtn, false)
	elseif slot2.level < #slot5 and slot2.id ~= 22262 and slot2.id ~= 22261 then
		setActive(slot0.upgradeBtn, true)
	else
		setActive(slot0.upgradeBtn, false)
	end

	if slot0.contextData.fromNewShip then
		setActive(slot0.upgradeBtn, false)
	end
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
	onButton(slot0, slot0.upgradeBtn, function ()
		uv0:emit(SkillInfoMediator.WARP_TO_TACTIC)
	end, SFX_UI_CLICK)
end

function slot0.close(slot0)
	slot0:emit(uv0.ON_CLOSE)
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	if slot0.contextData.onExit then
		slot0.contextData.onExit()
	end
end

return slot0
