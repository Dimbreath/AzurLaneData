slot0 = class("BackYardDecorationThemePage", import(".BackYardDecorationBasePage"))

function slot0.getUIName(slot0)
	return "BackYardDecorationThemePage"
end

function slot0.OnLoaded(slot0)
	slot0.super.OnLoaded(slot0)

	slot0.msgbox = BackYardDecorationMsgBox.New(slot0._parentTf.parent.parent.parent, slot0._event, slot0.contextData)
end

function slot0.OnDisplayList(slot0)
	slot0:InitList()
end

function slot0.InitList(slot0)
	slot0.displays = {}

	for slot6, slot7 in ipairs(getProxy(DormProxy):GetSystemThemes()) do
		if slot7:isBought(slot0.dorm:GetAllFurniture()) then
			table.insert(slot0.displays, slot7)
		end
	end

	slot3 = 0

	if slot0.customTheme then
		for slot7, slot8 in pairs(slot0.customTheme) do
			slot3 = slot3 + 1

			table.insert(slot0.displays, slot8)
		end
	end

	if slot3 < BackYardTheme.MAX_USER_THEME then
		table.insert(slot0.displays, {
			id = "",
			type = 999
		})
	end

	slot0:SortDisplays()
end

function slot1(slot0, slot1, slot2, slot3)
	if slot0.type == slot1.type then
		if slot2 == BackYardDecorationFilterPanel.ORDER_MODE_ASC then
			return (slot3[slot1.id] and 0 or 1) < (slot3[slot0.id] and 0 or 1)
		elseif slot2 == BackYardDecorationFilterPanel.ORDER_MODE_DASC then
			return slot4 < slot5
		end
	else
		return slot0.type < slot1.type
	end
end

function slot0.SortDisplays(slot0)
	slot0.temps = {}

	for slot4, slot5 in ipairs(slot0.displays) do
		slot0.temps[slot5.id] = GetCanBePutFurnituresForThemeCommand.IsUsing(slot5)
	end

	table.sort(slot0.displays, function (slot0, slot1)
		return uv0(slot0, slot1, uv1.orderMode, uv1.temps)
	end)
	slot0:SetTotalCount()
end

function slot0.OnOrderModeUpdated(slot0)
	slot0:SortDisplays()
end

function slot0.OnInitItem(slot0, slot1)
	slot2 = BackYardDecorationThemeCard.New(slot1)

	onButton(slot0, slot2._tf, function ()
		if uv0:HasMask() then
			return
		end

		uv1.msgbox:ExecuteAction("Show", uv0.themeVO, true)
	end)
	onButton(slot0, slot2.add, function ()
		uv0.msgbox:ExecuteAction("Show", {
			id = getProxy(DormProxy):GetTemplateNewID()
		}, false)
	end)

	slot0.cards[slot1] = slot2
end

function slot0.OnUpdateItem(slot0, slot1, slot2)
	if not slot0.cards[slot2] then
		slot0:OnInitItem(slot2)

		slot3 = slot0.cards[slot2]
	end

	slot4 = slot0.lastDiaplys[slot1 + 1]

	slot3:Update(slot4, slot0.temps[slot4.id])
end

function slot0.OnThemeUpdated(slot0)
	slot0:InitList()
end

function slot0.OnFurnitureUpdated(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.cards) do
		if slot7.themeVO.id ~= "" and slot7.themeVO:ContainsFurniture(slot1) then
			table.insert(slot2, slot7)
		end
	end

	if #slot2 == 0 then
		return
	end

	for slot6, slot7 in ipairs(slot2) do
		slot7:UpdateState(GetCanBePutFurnituresForThemeCommand.IsUsing(slot7.themeVO))
	end
end

function slot0.SetTotalCount(slot0)
	slot0.lastDiaplys = {}

	for slot4, slot5 in ipairs(slot0.displays) do
		if slot5.id == "" or slot5:isMatchSearchKey(slot0.searchKey) then
			table.insert(slot0.lastDiaplys, slot5)
		end
	end

	slot0.scrollRect:SetTotalCount(#slot0.lastDiaplys)
end

function slot0.OnSearchKeyChanged(slot0)
	slot0:SetTotalCount()
end

function slot0.OnDestroy(slot0)
	slot0.msgbox:Destroy()
end

function slot0.OnBackPressed(slot0)
	if slot0:GetLoaded() and slot0.msgbox:GetLoaded() and slot0.msgbox:isShowing() then
		slot0.msgbox:Hide()

		return true
	end

	return false
end

return slot0
