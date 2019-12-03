slot0 = class("ActivityBossBattleCMDForamtionSubPanel", import("view.base.BaseSubPanel"))

slot0.GetUIName = function (slot0)
	return "LevelCommanderView"
end

slot0.OnInit = function (slot0)
	slot0.descPanel = slot0:findTF("desc")
	slot0.descFrameTF = slot0:findTF("desc/frame")
	slot0.descPos1 = slot0:findTF("commander1/frame/info", slot0.descFrameTF)
	slot0.descPos2 = slot0:findTF("commander2/frame/info", slot0.descFrameTF)
	slot0.skillTFPos1 = slot0:findTF("commander1/skill_info", slot0.descFrameTF)
	slot0.skillTFPos2 = slot0:findTF("commander2/skill_info", slot0.descFrameTF)
	slot0.abilitysTF = UIItemList.New(slot0:findTF("atttr_panel/abilitys/mask/content", slot0.descFrameTF), slot0:findTF("atttr_panel/abilitys/mask/content/attr", slot0.descFrameTF))
	slot0.talentsTF = UIItemList.New(slot0:findTF("atttr_panel/talents/mask/content", slot0.descFrameTF), slot0:findTF("atttr_panel/talents/mask/content/attr", slot0.descFrameTF))
	slot0.talentsTextList = {}
	slot0.abilityArr = slot0:findTF("desc/frame/atttr_panel/abilitys/arr")
	slot0.talentsArr = slot0:findTF("desc/frame/atttr_panel/talents/arr")
	slot0.animtion = slot0.descPanel:GetComponent("Animation")
	slot0.animtionEvent = slot0:findTF("desc"):GetComponent(typeof(DftAniEvent))
	slot0.restAllBtn = slot0:findTF("rest_all", slot0.descFrameTF)
	slot0.quickBtn = slot0:findTF("quick_btn", slot0.descFrameTF)
	slot0.recordPanel = slot0:findTF("desc/record_panel")
	slot0.recordCommanders = {
		slot0.recordPanel:Find("current/commanders/commander1/frame/info"),
		slot0.recordPanel:Find("current/commanders/commander2/frame/info")
	}
	slot0.reocrdSkills = {
		slot0.recordPanel:Find("current/commanders/commander1/skill_info"),
		slot0.recordPanel:Find("current/commanders/commander2/skill_info")
	}
	slot0.recordList = UIItemList.New(slot0.recordPanel:Find("record/content"), slot0.recordPanel:Find("record/content/commanders"))

	setActive(slot0.restAllBtn, false)
	setActive(slot0.quickBtn, false)
	onButton(slot0, slot0.recordPanel, function ()
		slot0:CloseRecordPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0._tf, function ()
		slot0:Close()
	end, SFX_PANEL)
end

slot0.Update = function (slot0, slot1)
	slot0.fleet = slot1

	slot0:UpdateDesc()
	slot0:UpdateRecordFleet()
end

slot0.UpdateDesc = function (slot0)
	slot1 = slot0.fleet:getCommanders()

	for slot5 = 1, CommanderConst.MAX_FORMATION_POS, 1 do
		slot0:UpdateCommander(slot0["descPos" .. slot5], slot5, slot6)
		slot0:UpdateSkillTF(slot1[slot5], slot0["skillTFPos" .. slot5])
	end

	slot0:UpdateAdditions()
end

slot0.UpdateRecordFleet = function (slot0)
	slot1 = slot0.fleet:getCommanders()

	for slot5, slot6 in ipairs(slot0.recordCommanders) do
		slot0:UpdateCommander(slot6, slot5, slot1[slot5])
		slot0:UpdateSkillTF(slot1[slot5], slot0.reocrdSkills[slot5])
	end
end

slot0.UpdateAdditions = function (slot0)
	slot3, slot4 = slot0.fleet.getCommandersAddition(slot1)

	slot0.abilitysTF:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot2:Find("name"), AttributeType.Type2Name(slot0[slot1 + 1].attrName))
			setText(slot2:Find("Text"), string.format("%0.3f", slot0[slot1 + 1].value) .. "%")
			GetImageSpriteFromAtlasAsync("attricon", slot0[slot1 + 1].attrName, slot2:Find("icon"), false)
			setImageAlpha(slot2:Find("bg"), slot1 % 2)
		end
	end)
	slot0.abilitysTF:align(#slot3)
	setActive(slot0.abilityArr, #slot3 > 4)
	slot0.talentsTF:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = slot0[slot1 + 1]

			if not slot1.talentsTextList[slot1 + 1] then
				slot1.talentsTextList[slot1 + 1] = ScrollTxt.New(findTF(slot2, "name_mask"), findTF(slot2, "name_mask/name"), true)
			end

			slot1.talentsTextList[slot1 + 1]:setText(slot3.name)
			setText(slot2:Find("Text"), slot3.value .. ((slot3.type == CommanderConst.TALENT_ADDITION_RATIO and "%") or ""))
			setImageAlpha(slot2:Find("bg"), slot1 % 2)
		end
	end)
	slot0.talentsTF:align(#_.values(slot0.fleet.getCommandersTalentDesc(slot1)))
	setActive(slot0.talentsArr, #_.values(slot0.fleet.getCommandersTalentDesc(slot1)) > 4)
end

slot0.UpdateSkillTF = function (slot0, slot1, slot2)
	setActive(slot2, slot1)

	if slot1 then
		GetImageSpriteFromAtlasAsync("CommanderSkillIcon/" .. slot1:getSkills()[1].getConfig(slot3, "icon"), "", slot2:Find("icon"))
		setText(slot2:Find("level"), "Lv." .. slot1.getSkills()[1]:getLevel())
	end
end

slot0.UpdateCommander = function (slot0, slot1, slot2, slot3)
	slot4 = slot1:Find("add")
	slot5 = slot1:Find("info")

	if slot3 then
		slot7 = slot1:Find("info/frame")

		GetImageSpriteFromAtlasAsync("CommanderHrz/" .. slot3:getPainting(), "", slot1:Find("info/mask/icon"))

		if slot1:Find("info/name") then
			setText(slot8, slot3:getName())
		end

		setImageSprite(slot7, GetSpriteFromAtlas("weaponframes", "commander_" .. Commander.rarity2Frame(slot3:getRarity())))
	end

	onButton(slot0, slot5, function ()
		slot0:InvokeParent("SelectCMD", slot0.fleet.id, slot0)
	end, SFX_PANEL)
	onButton(slot0, slot4, function ()
		slot0:InvokeParent("SelectCMD", slot0.fleet.id, slot0)
	end, SFX_PANEL)
	setActive(slot4, not slot3)
	setActive(slot5, slot3)
end

slot0.PlayAnim = function (slot0, slot1, slot2)
	slot0.animtionEvent:SetEndEvent(slot2)

	if not slot0.animtion:Play(slot1) and slot2 then
		slot2()
	end
end

slot0.Open = function (slot0)
	slot0:Show()
	slot0:PlayAnim("cmdopen")
	slot0._tf:SetAsLastSibling()
end

slot0.OnShow = function (slot0)
	pg.UIMgr.GetInstance():OverlayPanel(slot0._tf, {
		groupName = LayerWeightConst.GROUP_FORMATION_PAGE
	})
end

slot0.Close = function (slot0)
	slot0:PlayAnim("cmdclose", function ()
		slot0:Hide()
	end)
end

slot0.OnHide = function (slot0)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0._tf, slot0.viewParent._tf)
end

return slot0
