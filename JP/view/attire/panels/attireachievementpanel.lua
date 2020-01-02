slot0 = class("AttireAchievementPanel", import("...base.BaseSubView"))

function slot1(slot0)
	function (slot0)
		slot0._go = slot0
		slot0.info = findTF(slot0._go, "info")
		slot0.empty = findTF(slot0._go, "empty")
		slot0.icon = findTF(slot0._go, "info/icon")
		slot0.selected = findTF(slot0._go, "info/selected")
		slot0.nameTxt = findTF(slot0._go, "info/label/Text")
		slot0.tags = {
			findTF(slot0._go, "info/tags/new"),
			findTF(slot0._go, "info/tags/e")
		}
		slot0.print5 = findTF(slot0._go, "prints/line5")
		slot0.print6 = findTF(slot0._go, "prints/line6")
	end({
		Update = function (slot0, slot1, slot2, slot3)
			slot0.trophy = slot1

			if slot0.trophy then
				LoadImageSpriteAsync("medal/" .. slot1:getConfig("icon"), slot0.icon, true)
				setText(slot0.nameTxt, slot1:getConfig("name"))
				setActive(slot0.tags[1], slot1:isNew())
				slot0:UpdateSelected(slot2)
			end

			setActive(slot0.print5, not slot3)
			setActive(slot0.print6, not slot3)
			setActive(slot0.info, slot0.trophy)
			setActive(slot0.empty, not slot0.trophy)
		end,
		UpdateSelected = function (slot0, slot1)
			setActive(slot0.selected, slot1)
			setActive(slot0.tags[2], slot1)
		end
	})

	return 
end

function slot2(slot0)
	function (slot0)
		slot0._tf = slot0
		slot0.uiList = UIItemList.New(slot0._tf:Find("list"), slot0._tf:Find("list/tpl"))
	end({
		Update = function (slot0, slot1)
			slot0.uiList:make(function (slot0, slot1, slot2)
				if slot0 == UIItemList.EventUpdate then
					LoadImageSpriteAsync("medal/s_" .. Trophy.New({
						id = slot0[slot1 + 1]
					}).getConfig(slot4, "icon"), findTF(slot2, "icon"), true)
				end
			end)
			slot0.uiList:align(#slot1)
		end,
		Dispose = function (slot0)
			return
		end
	})

	return 
end

function slot0.getUIName(slot0)
	return "AttireAchievementUI"
end

function slot0.OnInit(slot0)
	slot0.listPanel = slot0:findTF("list_panel")
	slot0.scolrect = slot0:findTF("scrollrect", slot0.listPanel):GetComponent("LScrollRect")
	slot0.totalCount = slot0:findTF("total_count/Text"):GetComponent(typeof(Text))
	slot0.selectedTxt = slot0.listPanel:Find("selected_bg/Text"):GetComponent(typeof(Text))
	slot0.toggle = slot0.listPanel:Find("toggle")

	function slot0.scolrect.onInitItem(slot0)
		slot0:OnInitItem(slot0)
	end

	function slot0.scolrect.onUpdateItem(slot0, slot1)
		slot0:OnUpdateItem(slot0, slot1)
	end

	slot0.confirmBtn = slot0:findTF("list_panel/confirm")

	onButton(slot0, slot0.confirmBtn, function ()
		if #slot0.contextData.selectedMedalList == 0 and #slot0.playerVO.displayTrophyList == 0 then
			return
		end

		if #slot0.contextData.selectedMedalList == #slot0.playerVO.displayTrophyList and _.all(slot0.contextData.selectedMedalList, function (slot0)
			return table.contains(slot0.playerVO.displayTrophyList, slot0)
		end) then
			return
		end

		slot0.event:emit(AttireMediator.ON_CHANGE_MEDAL_DISPLAY, slot0.contextData.selectedMedalList)
	end, SFX_PANEL)

	slot0.descPanel = slot0(slot0:findTF("desc_panel"))
	slot0.selectMaxLevel = true

	onToggle(slot0, slot0.toggle, function (slot0)
		slot0.selectMaxLevel = slot0

		slot0:Filter()
	end)

	slot0.cards = {}
end

function slot0.UpdateselectedTxt(slot0)
	slot0.selectedTxt.text = #(slot0.contextData.selectedMedalList or {}) .. "/5"
end

function slot0.OnInitItem(slot0, slot1)
	slot0.cards[slot1] = slot0(slot1)

	onButton(slot0, slot0(slot1)._go, function ()
		if not slot0.trophy then
			return
		end

		if #(slot1.contextData.selectedMedalList or {}) < 5 and not table.contains(slot0, slot0.trophy.id) then
			table.insert(slot0, slot0.trophy.id)
			slot0:UpdateSelected(true)
		else
			for slot4, slot5 in ipairs(slot0) do
				if slot5 == slot0.trophy.id then
					table.remove(slot0, slot4)
					slot0:UpdateSelected(false)

					break
				end
			end
		end

		slot1.contextData.selectedMedalList = slot0

		slot1.contextData.descPanel:Update(slot1.contextData.selectedMedalList)
		slot1.contextData.descPanel.Update:UpdateselectedTxt()
	end, SFX_PANEL)
end

function slot0.OnUpdateItem(slot0, slot1, slot2)
	if not slot0.cards[slot2] then
		slot0:OnInitItem(slot2)

		slot3 = slot0.cards[slot2]
	end

	slot4 = slot0.displayVOs[slot1 + 1]
	slot6 = slot1 < slot0.scolrect.content:GetComponent(typeof(GridLayoutGroup)).constraintCount

	if slot4 then
		slot3:Update(slot4, table.contains(slot0.contextData.selectedMedalList, slot4.id), slot6)
	else
		slot3:Update(slot4, false, slot6)
	end
end

function slot0.Update(slot0, slot1, slot2)
	slot0.playerVO = slot2
	slot0.trophys = slot1.trophys
	slot0.contextData.selectedMedalList = Clone(slot0.playerVO.displayTrophyList) or {}

	slot0.descPanel:Update(slot0.contextData.selectedMedalList)
	slot0:UpdateselectedTxt()
	slot0:Filter()

	slot0.totalCount.text = slot0:getTotalCnt()
end

function slot0.getTotalCnt(slot0)
	slot1 = 0

	for slot5, slot6 in pairs(slot0.trophys) do
		if slot6:isClaimed() and not slot6:isHide() then
			slot1 = slot1 + 1
		end
	end

	return slot1
end

function slot0.Filter(slot0)
	slot0.displayVOs = {}

	function slot1(slot0)
		return slot0.trophys[slot0:getConfig("next")] and slot1:isClaimed() and not slot1:isHide()
	end

	for slot5, slot6 in pairs(slot0.trophys) do
		if slot6:isClaimed() and not slot6:isHide() and (not slot0.selectMaxLevel or (slot0.selectMaxLevel and not slot1(slot6))) then
			table.insert(slot0.displayVOs, slot6)
		end
	end

	table.sort(slot0.displayVOs, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	if slot0.scolrect.content:GetComponent(typeof(GridLayoutGroup)).constraintCount - #slot0.displayVOs % slot0.scolrect.content.GetComponent(typeof(GridLayoutGroup)).constraintCount == slot0.scolrect.content.GetComponent(typeof(GridLayoutGroup)).constraintCount then
		slot4 = 0
	end

	if slot3 * slot0:GetColumn() > #slot0.displayVOs then
		slot4 = slot5 - #slot0.displayVOs
	end

	for slot9 = 1, slot4, 1 do
		table.insert(slot0.displayVOs, false)
	end

	slot0.scolrect:SetTotalCount(#slot0.displayVOs, -1)
end

function slot0.GetColumn(slot0)
	return 2
end

function slot0.OnDestroy(slot0)
	slot0.descPanel:Dispose()
end

return slot0
