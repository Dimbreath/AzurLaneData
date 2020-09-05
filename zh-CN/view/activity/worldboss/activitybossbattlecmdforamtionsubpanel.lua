slot0 = class("ActivityBossBattleCMDForamtionSubPanel", import("view.base.BaseSubPanel"))

function slot0.GetUIName(slot0)
	return "LevelCommanderView"
end

function slot0.OnInit(slot0)
	slot0.descPanel = slot0:findTF("desc")
	slot0.descFrameTF = slot0:findTF("desc/frame")
	slot0.descPos1 = slot0:findTF("commander1/frame/info", slot0.descFrameTF)
	slot0.descPos2 = slot0:findTF("commander2/frame/info", slot0.descFrameTF)
	slot0.skillTFPos1 = slot0:findTF("commander1/skill_info", slot0.descFrameTF)
	slot0.skillTFPos2 = slot0:findTF("commander2/skill_info", slot0.descFrameTF)
	slot0.abilitysTF = UIItemList.New(slot0:findTF("atttr_panel/abilitys/mask/content", slot0.descFrameTF), slot0:findTF("atttr_panel/abilitys/mask/content/attr", slot0.descFrameTF))
	slot0.talentsTF = UIItemList.New(slot0:findTF("atttr_panel/talents/mask/content", slot0.descFrameTF), slot0:findTF("atttr_panel/talents/mask/content/attr", slot0.descFrameTF))
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
		uv0:CloseRecordPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0._tf, function ()
		uv0:Close()
	end, SFX_PANEL)
end

function slot0.Update(slot0, slot1)
	slot0.fleet = slot1

	slot0:UpdateDesc()
	slot0:UpdateRecordFleet()
end

function slot0.UpdateDesc(slot0)
	for slot5 = 1, CommanderConst.MAX_FORMATION_POS do
		slot6 = slot0.fleet:getCommanders()[slot5]

		slot0:UpdateCommander(slot0["descPos" .. slot5], slot5, slot6)
		slot0:UpdateSkillTF(slot6, slot0["skillTFPos" .. slot5])
	end

	slot0:UpdateAdditions()
end

function slot0.UpdateRecordFleet(slot0)
	for slot5, slot6 in ipairs(slot0.recordCommanders) do
		slot7 = slot0.fleet:getCommanders()[slot5]

		slot0:UpdateCommander(slot6, slot5, slot7)
		slot0:UpdateSkillTF(slot7, slot0.reocrdSkills[slot5])
	end
end

function slot0.UpdateAdditions(slot0)
	slot1 = slot0.fleet
	slot2 = _.values(slot1:getCommandersTalentDesc())
	slot3, slot4 = slot1:getCommandersAddition()

	slot0.abilitysTF:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = uv0[slot1 + 1]

			setText(slot2:Find("name"), AttributeType.Type2Name(slot3.attrName))
			setText(slot2:Find("Text"), string.format("%0.3f", slot3.value) .. "%")
			GetImageSpriteFromAtlasAsync("attricon", slot3.attrName, slot2:Find("icon"), false)
			setImageAlpha(slot2:Find("bg"), slot1 % 2)
		end
	end)
	slot0.abilitysTF:align(#slot3)
	setActive(slot0.abilityArr, #slot3 > 4)
	slot0.talentsTF:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = uv0[slot1 + 1]

			setScrollText(findTF(slot2, "name_mask/name"), slot3.name)
			setText(slot2:Find("Text"), slot3.value .. (slot3.type == CommanderConst.TALENT_ADDITION_RATIO and "%" or ""))
			setImageAlpha(slot2:Find("bg"), slot1 % 2)
		end
	end)
	slot0.talentsTF:align(#slot2)
	setActive(slot0.talentsArr, #slot2 > 4)
end

function slot0.UpdateSkillTF(slot0, slot1, slot2)
	setActive(slot2, slot1)

	if slot1 then
		slot3 = slot1:getSkills()[1]

		GetImageSpriteFromAtlasAsync("CommanderSkillIcon/" .. slot3:getConfig("icon"), "", slot2:Find("icon"))
		setText(slot2:Find("level"), "Lv." .. slot3:getLevel())
	end
end

function slot0.UpdateCommander(slot0, slot1, slot2, slot3)
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
		uv0:InvokeParent("SelectCMD", uv0.fleet.id, uv1)
	end, SFX_PANEL)
	onButton(slot0, slot4, function ()
		uv0:InvokeParent("SelectCMD", uv0.fleet.id, uv1)
	end, SFX_PANEL)
	setActive(slot4, not slot3)
	setActive(slot5, slot3)
end

function slot0.PlayAnim(slot0, slot1, slot2)
	slot0.animtionEvent:SetEndEvent(slot2)

	if not slot0.animtion:Play(slot1) and slot2 then
		slot2()
	end
end

function slot0.Open(slot0)
	slot0:Show()
	slot0:PlayAnim("cmdopen")
	slot0._tf:SetAsLastSibling()
end

function slot0.OnShow(slot0)
	slot0.contextData.layerWeight = slot0.viewParent.fleetEditPanel and slot1.layerWeight

	pg.UIMgr.GetInstance():OverlayPanel(slot0._tf, {
		groupName = LayerWeightConst.GROUP_FORMATION_PAGE,
		weight = slot0.contextData.layerWeight
	})
end

function slot0.Close(slot0)
	slot0:PlayAnim("cmdclose", function ()
		uv0:Hide()
	end)
end

function slot0.OnHide(slot0)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0._tf, slot0.viewParent._tf)
end

return slot0
