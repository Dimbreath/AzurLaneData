slot0 = class("LevelCMDFormationView", import("..base.BaseSubView"))

function slot0.getUIName(slot0)
	return "LevelCommanderView"
end

function slot0.OnInit(slot0)
	slot0:InitUI()
end

function slot0.OnDestroy(slot0)
	slot0.onConfirm = nil
	slot0.onCancel = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0._parentTF)
end

function slot0.InitUI(slot0)
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

	onButton(slot0, slot0.restAllBtn, function ()
		if slot0.callback then
			slot0.callback({
				type = LevelUIConst.COMMANDER_OP_REST_ALL
			})
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.quickBtn, function ()
		slot0:OpenRecordPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.recordPanel, function ()
		slot0:CloseRecordPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0._tf, function ()
		slot0:close()
	end, SFX_PANEL)
end

function slot0.hidePrefabButtons(slot0)
	setActive(slot0.restAllBtn, false)
	setActive(slot0.quickBtn, false)
end

function slot0.update(slot0, slot1, slot2, slot3)
	slot0.callback = slot3

	slot0:updateFleet(slot1)
	slot0:updatePrefabs(slot2)
end

function slot0.updateFleet(slot0, slot1)
	slot0.fleet = slot1

	slot0:updateDesc()
	slot0:updateRecordFleet()
end

function slot0.updatePrefabs(slot0, slot1)
	slot0.prefabFleets = slot1

	slot0:updateRecordPanel()
end

function slot0.updateRecordFleet(slot0)
	slot1 = slot0.fleet:getCommanders()

	for slot5, slot6 in ipairs(slot0.recordCommanders) do
		slot0:updateCommander(slot6, slot5, slot1[slot5])
		slot0:updateSkillTF(slot1[slot5], slot0.reocrdSkills[slot5])
	end
end

function slot0.updateRecordPanel(slot0)
	slot1 = slot0.fleet:getCommanders()

	slot0.recordList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot0:UpdatePrefabFleet(slot0.prefabFleets[slot1 + 1], slot2, slot1)
		end
	end)
	slot0.recordList:align(#slot0.prefabFleets)
end

function slot0.UpdatePrefabFleet(slot0, slot1, slot2, slot3)
	onInputEndEdit(slot0, slot4, function ()
		slot0 = getInputText(getInputText)

		if getInputText.callback then
			slot1.callback({
				type = LevelUIConst.COMMANDER_OP_RENAME,
				id = slot2.id,
				str = slot0,
				onFailed = function ()
					setInputText(setInputText, )
				end
			})
		end
	end)
	setInputText(slot4, slot5)
	onButton(slot0, slot2:Find("use_btn"), function ()
		if slot0.callback then
			slot0.callback({
				type = LevelUIConst.COMMANDER_OP_USE_PREFAB,
				id = slot1.id
			})
			slot0.callback:CloseRecordPanel()
		end
	end, SFX_PANEL)
	onButton(slot0, slot2:Find("record_btn"), function ()
		if slot0.callback then
			slot0.callback({
				type = LevelUIConst.COMMANDER_OP_RECORD_PREFAB,
				id = slot1.id
			})
		end
	end, SFX_PANEL)

	slot7 = {
		slot2:Find("commander1/skill_info"),
		slot2:Find("commander2/skill_info")
	}

	for slot11, slot12 in ipairs(slot6) do
		slot0:updateCommander(slot12, slot11, slot1:getCommanderByPos(slot11))
		slot0:updateSkillTF(slot1.getCommanderByPos(slot11), slot7[slot11])
	end
end

function slot0.playAnim(slot0, slot1, slot2)
	slot0.animtion:Play(slot1)
end

function slot0.open(slot0)
	slot0:playAnim("cmdopen", callback)
	setActive(slot0._go, true)
	setParent(slot0._go, pg.UIMgr.GetInstance().OverlayMain)
	slot0._tf:SetAsLastSibling()
end

function slot0.close(slot0)
	slot0:playAnim("cmdclose", callback)
	slot0:Destroy()
end

function slot0.updateDesc(slot0)
	slot1 = slot0.fleet:getCommanders()

	for slot5 = 1, CommanderConst.MAX_FORMATION_POS, 1 do
		slot0:updateCommander(slot0["descPos" .. slot5], slot5, slot6)
		slot0:updateSkillTF(slot1[slot5], slot0["skillTFPos" .. slot5])
	end

	slot0:updateAdditions()
end

function slot0.updateAdditions(slot0)
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

function slot0.updateSkillTF(slot0, slot1, slot2)
	setActive(slot2, slot1)

	if slot1 then
		GetImageSpriteFromAtlasAsync("CommanderSkillIcon/" .. slot1:getSkills()[1].getConfig(slot3, "icon"), "", slot2:Find("icon"))
		setText(slot2:Find("level"), "Lv." .. slot1.getSkills()[1]:getLevel())
	end
end

function slot0.updateCommander(slot0, slot1, slot2, slot3)
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
		if slot0.callback then
			slot0.callback({
				type = LevelUIConst.COMMANDER_OP_ADD,
				pos = 
			})
		end
	end, SFX_PANEL)
	onButton(slot0, slot4, function ()
		if slot0.callback then
			slot0.callback({
				type = LevelUIConst.COMMANDER_OP_ADD,
				pos = 
			})
		end
	end, SFX_PANEL)
	setActive(slot4, not slot3)
	setActive(slot5, slot3)
end

function slot0.OpenRecordPanel(slot0)
	setActive(slot0.descFrameTF, false)
	setActive(slot0.recordPanel, true)
end

function slot0.CloseRecordPanel(slot0)
	setActive(slot0.descFrameTF, true)
	setActive(slot0.recordPanel, false)
end

function slot0.enable(slot0, slot1)
	setActive(slot0._go, slot1)
end

function slot0.clear(slot0)
	setActive(slot0._go, false)
	setParent(slot0._go, slot0.parent.topPanel)
end

return slot0
